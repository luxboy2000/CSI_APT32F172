/*
 * Copyright (C) 2019 APTCHIP Microelectronics Co., Ltd. All rights reserved.
 *
 *   http://www.aptchip.com
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 */

//*****************************************************************************
//* @file     drv_syscon.h
//* @brief    header file for syscon driver
//* @version  V1.0
//* @date     02. Sept 2019
//*****************************************************************************

#ifndef _CSI_IFC_H_
#define _CSI_IFC_H_

#ifdef __cplusplus
extern "C" {
#endif

#include <stdint.h>
#include <stdbool.h>
#include <apt_common.h>

#define IFC_USER_KEY (0x5A5A5A5Aul)
#define IFC_HMODE	 (1ul<<8)

typedef struct {
    __IOM uint32_t IDR ;
    __IOM uint32_t CEDR ;
    __IOM uint32_t SRR ;
    __IOM uint32_t CMR ;
    __IOM uint32_t CR ;
    __IOM uint32_t MR ;
    __IOM uint32_t PF_AR ;
    __IOM uint32_t PF_DR ;
    __IOM uint32_t KR ;
    __IOM uint32_t ICR ;
    __IOM uint32_t RISR ;
    __IOM uint32_t MISR ;
    __IOM uint32_t ICLR ;
} APT_IFC_Reg_t, *ifc_reg_ptr;

extern ifc_reg_ptr H_IFC;



/*----- IFC command -----*/
typedef enum {
    CMD_PGM				= 1	,	///< Program command
    CMP_PERS				,	///< Page erase command
    CMP_SERS				,	///< Sector erase command
	CMP_OPTERS				,	///< User option erase command
	CMP_HDP1K			= 9	,	///< Hard protection 1K size
	CMP_HDP2K				,	///< Hard protection 2K size
	CMP_HDP4K				,	///< Hard protection 4K size
	CMP_HDP					,	///< Hard protection all flash
	CMP_RDP					,	///< Read protection all flash
	CMP_DBP					,	///< Debug port protection
	CMP_PGMOPT				,	///< Program user option
} ifc_cmd_e;

/*----- SYSCON Interrupt Event  -----*/
typedef enum {
    // ---------    EXI    ---------
    CMDEND					=0,
	PROT_ERR				=12,
    UDEF_ERR				,
    ADDR_ERR				,
    OVW_ERR					,
} ifc_event_e;

typedef void (*ifc_event_cb_t)(ifc_event_e event);   ///< ifc Event call back.

#define ifc_start_cmd(reg_ptr)		((reg_ptr)->CR = 1ul)
#define ifc_set_protkey(reg_ptr)	((reg_ptr)->KR = IFC_USER_KEY)
#define ifc_clr_protkey(reg_ptr)	((reg_ptr)->KR = 0x0ul)


////////////////////////////////// Public //////////////////////////////////////
/**
 * @brief       ISR call-back registration
 * @param[i]    cb     pointer to customer ISR when EXI is called 
 * @param[i]    idx    exi isr number to be initialized
 * @return      zero on success
*/
int32_t csi_ifc_cb_init (ifc_event_cb_t cb);

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
uint32_t csi_ifc_program (uint32_t addr, uint32_t size, uint32_t *ptrBuf);


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
uint32_t csi_ifc_byte_program (uint32_t addr, uint32_t size, uint8_t *ptrBuf);


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
uint32_t csi_ifc_read(uint32_t addr, uint32_t size, uint32_t *ptrBuf);


/**
  @brief       Read back flash content in byte.

				Return the content by the supplied buffer pointer.
				This function supplies byte access to flash
  
  @param[in]   addr    Start address of flash to be read
  @param[in]   size    number of word to be read
  @param[in]   ptrBuf  pointer of buffer to transfer data
  \return      error code
*/
uint32_t csi_ifc_byte_read(uint32_t addr, uint32_t size, uint8_t *ptrBuf);




#ifdef __cplusplus
}
#endif

#endif /* _CSI_SYSCON_H_ */
