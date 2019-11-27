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

	return 0;
}

/**
  @brief       IAP Program flash word function.

				Flash program unit is one word, so the buffer should be orgnized in
				32bit aligned. If the given address is not 4-bytes aligned, the LSB
				2bit will be ignored.
 
  @param[in]   addr    Start address of flash to be write
  @param[in]   size    number of word to be programmed
  @param[in]   ptrBuf  pointer of buffer to transfer data
  @return      the last completed address
*/
uint32_t csi_ifc_program (uint32_t addr, uint32_t size, uint32_t *ptrBuf)
{
	if (size<1) {
		return ERR_IFC(DRV_ERROR_PARAMETER);
	}
	
	uint32_t addr_priv = addr & 0xfffffffc;
	
	for (uint32_t i=0;i<size;i++)
	{
		ifc_update_addr_dr_cfg (addr_priv, ptrBuf[i]);
		ifc_set_protkey(H_IFC);
		H_IFC->CMR = CMD_PGM;
		ifc_start_cmd(H_IFC);
		while (H_IFC->CR != 0);	// wait for command complete
		addr_priv += 4;
		
	}
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
  @param[in]   size    number of word to be programmed
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
		addr++;
		
	}
	return addr-1;
}


/**
  @brief       Read back flash content.

				Return the content by the supplied buffer pointer.
				This function is word aligned, and LSB 2bit of the 
				given address is ignored.
  
  @param[in]   addr    Start address of flash to be read
  @param[in]   size    number of word to be read
  @param[in]   ptrBuf  pointer of buffer to transfer data
  \return      error code
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
  @param[in]   size    number of word to be read
  @param[in]   ptrBuf  pointer of buffer to transfer data
  \return      error code
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


