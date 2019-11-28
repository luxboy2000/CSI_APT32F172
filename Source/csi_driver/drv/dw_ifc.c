/*
 * Copyright (C) 2019 APTCHIP Microelectronics Co., Ltd. All rights reserved.
 *
 *   http://www.aptchip.com
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 */

//******************************************************************************
//* @file     dw_ifc.c
//* @brief    CSI Source File for internal flash controller Driver
//* @version  V1.0
//* @date     02. Sept 2019
//******************************************************************************

#include <csi_config.h>
#include "soc.h"
#include "apt_errno.h"
#include "apt_ifc.h"
#include "csi_core.h"
#include "lib.h"

#define ERR_IFC(errno) (CSI_DRV_ERRNO_IFC_BASE | errno)
#define IFC_NULL_PARAM_CHK(para)                         \
		do {                                        \
			if (para == NULL) {                     \
				return ERR_IFC(DRV_ERROR_PARAMETER);   \
			}                                       \
		} while (0)

ifc_reg_ptr H_IFC  = (APT_IFC_Reg_t   *)APT_IFC_BASE;

// ifc interrupt callback routine pointer
ifc_event_cb_t ifc_event_cb;

/// Update address and data register
void ifc_update_addr_dr_cfg (uint32_t addr, uint32_t data)
{
	H_IFC->PF_AR = addr;
	H_IFC->PF_DR = data;
}


////////////////////////////////// Public //////////////////////////////////////
/**
 * @brief       ISR call-back registration
 * @param[i]    cb     pointer to customer ISR when EXI is called 
 * @param[i]    idx    exi isr number to be initialized
 * @return      zero on success
*/
int32_t csi_ifc_cb_init (ifc_event_cb_t cb)
{
	IFC_NULL_PARAM_CHK(cb);
	ifc_event_cb = cb;

	csi_vic_enable_irq(IFC_IRQn);

	return 0;
}

/**
  @brief       IAP Program flash word function.

				Flash program unit is one word, so the buffer should be orgnized in
				32bit aligned. If the given address is not 4-bytes aligned, the LSB
				2bit will be ignored. ptrBuf[0]->addr, ptrBuf[1]->addr+4, ...
 
  @param[in]   addr    Start address of flash to be write
  @param[in]   size    number of words to be programmed
  @param[in]   ptrBuf  pointer of buffer to transfer data
  @return      the last completed address
*/
uint32_t csi_ifc_program (uint32_t addr, uint32_t size, uint32_t *ptrBuf)
{
	if (size<1) {
		return ERR_IFC(DRV_ERROR_PARAMETER);
	}
	
	uint32_t addr_priv = addr & 0xfffffffc;
	uint32_t read_back;	// read back buffer to check pgm result
	
	ifc_clk_enable(H_IFC);
	for (uint32_t i=0;i<size;i++)
	{
		ifc_update_addr_dr_cfg (addr_priv, ptrBuf[i]);
		ifc_set_protkey(H_IFC);
		H_IFC->CMR = CMD_PGM;
		ifc_start_cmd(H_IFC);
		while (H_IFC->CR != 0);	// wait for command complete
		csi_ifc_read (addr_priv,1,&read_back);	//verify the pgm
		if (ptrBuf[i] != read_back) {
			return ERR_IFC(DRV_ERROR_SPECIFIC0);
		}
		addr_priv += 4;
	}
	ifc_clk_disable(H_IFC);
	return addr_priv-4;
}


/**
  @brief       IAP Program flash byte function.

				Flash program unit is one byte, so the buffer should be orgnized in
				8bit aligned. The program is indeedly word based, so the rest bytes
				in current word will keep as not changed. It is not efficient to program
				consecutive bytes by this method and it is suggested to use word program 
				method in stead.
 
  @param[in]   addr    Start address of flash to be write
  @param[in]   size    number of bytes to be programmed
  @param[in]   ptrBuf  pointer of buffer to transfer data
  @return      the last completed address
*/
uint32_t csi_ifc_byte_program (uint32_t addr, uint32_t size, uint8_t *ptrBuf)
{
	if (size<1) {
		return ERR_IFC(DRV_ERROR_PARAMETER);
	}
	
	uint32_t addr_priv;
	uint32_t addr_offset;
	uint32_t data_priv;
	uint8_t read_back;
	
	ifc_clk_enable(H_IFC);
	for (uint32_t i=0;i<size;i++)
	{
		addr_priv = addr & 0xfffffffcul;
		addr_offset = addr & 0x3ul;
		data_priv = 0xfffffffful;
		data_priv &= (ptrBuf[i] << (addr_offset*4));
		
		ifc_update_addr_dr_cfg (addr_priv, data_priv);
		ifc_set_protkey(H_IFC);
		H_IFC->CMR = CMD_PGM;
		ifc_start_cmd(H_IFC);
		while (H_IFC->CR != 0);	// wait for command complete
		csi_ifc_byte_read (addr,1,&read_back); // verfiy the pgm
		if (read_back != ptrBuf[i]) {
			return ERR_IFC(DRV_ERROR_SPECIFIC0);
		}
		addr++;
		
	}
	
	ifc_clk_disable(H_IFC);
	return addr-1;
}


/**
  @brief       Read back flash content.

				Return the content by the supplied buffer pointer.
				This function is word aligned, and LSB 2bit of the 
				given address is ignored.
  
  @param[in]   addr    Start address of flash to be read
  @param[in]   size    number of words to be read
  @param[in]   ptrBuf  pointer of buffer to transfer data
  @return      error code
*/
uint32_t csi_ifc_read(uint32_t addr, uint32_t size, uint32_t *ptrBuf)
{
	if (size<1) {
		return ERR_IFC(DRV_ERROR_PARAMETER);
	}

	uint32_t *addr_priv = (uint32_t*)(addr & 0xfffffffc);
	
	for (uint32_t i=0;i<size;i++) {
		ptrBuf[i] = *addr_priv;
		addr_priv += 4;
	}
	
	return (uint32_t)addr_priv-4;
}


/**
  @brief       Read back flash content in byte.

				Return the content by the supplied buffer pointer.
				This function supplies byte access to flash
  
  @param[in]   addr    Start address of flash to be read
  @param[in]   size    number of bytes to be read
  @param[in]   ptrBuf  pointer of buffer to transfer data
  @return      error code
*/
uint32_t csi_ifc_byte_read(uint32_t addr, uint32_t size, uint8_t *ptrBuf)
{
	if (size<1) {
		return ERR_IFC(DRV_ERROR_PARAMETER);
	}

	uint32_t *addr_priv;
	uint32_t addr_offset;
	uint32_t data_priv;
	
	for (uint32_t i=0;i<size;i++)
	{
		addr_priv = (uint32_t*)(addr & 0xfffffffcul);
		addr_offset = addr & 0x3ul;
		
		data_priv = *addr_priv;
		ptrBuf[i] = (data_priv >> (addr_offset*4)) & 0xfful;
		addr++;
	}

	return addr-1;
}


/**
  @brief       Flash Page Erase.

				Erase flash pages according to the address.
				The page size of this device is 1Kbytes. 
  
  @param[in]   addr    Start page address of flash to be erase
  @param[in]   size    number of pages to be read
  @return      error code
*/
uint32_t csi_ifc_page_erase(ifc_page_adr addr, uint32_t size)
{
	if (size<1 || size > 64) {
		return ERR_IFC(DRV_ERROR_PARAMETER);
	}

	uint32_t read_back;

	ifc_clk_enable(H_IFC);
	for (uint32_t i=0;i<size;i++)
	{
		ifc_update_addr_dr_cfg (addr, 0x0);
		ifc_set_protkey(H_IFC);
		H_IFC->CMR = CMP_PERS;
		ifc_start_cmd(H_IFC);
		while (H_IFC->CR != 0);	// wait for command complete
		csi_ifc_read (addr,1,&read_back);	//verify the pgm
		if (read_back != 0xffffffff) {
			return ERR_IFC(DRV_ERROR_SPECIFIC0);
		}
		addr += 0x400;
	}
	
	ifc_clk_disable(H_IFC);
	return addr-0x400;	
	
}

/**
  @brief       Flash User Option Erase.

				Erase flash user option and protection option. 
				The result can be checked by syscon opt0.
  
  @return      error code
*/
uint32_t csi_ifc_option_erase(void)
{
	ifc_clk_enable(H_IFC);
	ifc_set_protkey(H_IFC);
	H_IFC->CMR = CMP_OPTERS | IFC_HMODE1;
	ifc_start_cmd(H_IFC);
	while (H_IFC->CR != 0);	// wait for command complete
	
	ifc_clk_disable(H_IFC);
	return 0;	
}

/**
  @brief       Flash User Option Set.

				Program flash user option. The result can be
				checked by syscon opt0.
  
  @return      error code
*/
uint32_t csi_ifc_user_option_set(uint32_t data)
{
	ifc_clk_enable(H_IFC);
	ifc_set_protkey(H_IFC);
	ifc_update_addr_dr_cfg (0x0, data);
	H_IFC->CMR = CMP_PGMOPT | IFC_HMODE1;
	ifc_start_cmd(H_IFC);
	while (H_IFC->CR != 0);	// wait for command complete
	
	ifc_clk_disable(H_IFC);
	return 0;	
}

/**
  @brief       Flash Protection Option Set.

				Program flash protection option. The result can be
				checked by syscon opt0.
  
  @return      error code
*/
uint32_t csi_ifc_prot_option_set(ifc_cmd_e cmd)
{
	ifc_clk_enable(H_IFC);
	ifc_set_protkey(H_IFC);
	H_IFC->CMR = cmd | IFC_HMODE1;
	ifc_start_cmd(H_IFC);
	while (H_IFC->CR != 0);	// wait for command complete
	
	ifc_clk_disable(H_IFC);
	return 0;	
}

/**
  \brief       Set interrupt enabled/disable control
  \param[in]   int_sel:  interrupt to be en/dis
  \param[in]   status:   enable/disable
  \return      current masking status
*/
uint32_t csi_ifc_interrupt_set_switch(ifc_event_e int_sel, syscon_endis_e status)
{
	if (status == ENABLE) {
		H_IFC->IMCR |= 1ul<<int_sel;
	}
	else {
		H_IFC->IMCR &= ~(1ul<<int_sel);
	}

	return H_IFC->IMCR;
}

/**
  \brief       Clear interrupt pending bit
  \param[in]   int_sel:  interrupt to be clear
  \return      None
*/
void csi_ifc_interrupt_clear_pending(ifc_event_e int_sel)
{
	H_IFC->ICLR = 1ul<<int_sel;
}

/**
  \brief       Get interrupt pending bit
  \param[in]   int_sel:  interrupt pending to be read
  \param[in]   status:   raw(T)/masked(F) pending bit select
  \return      corresponding bit of pending according to int_sel
*/
uint32_t csi_ifc_interrupt_get_status(ifc_event_e int_sel, syscon_endis_e status)
{
	if (status == ENABLE) {
		return ((H_IFC->RISR) & (1ul<<int_sel));
	}
	else {
		return ((H_IFC->MISR) & (1ul<<int_sel));
	}
}

