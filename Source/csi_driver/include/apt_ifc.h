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
#define IFC_HMODE1	 (1ul<<8)
#define IFC_HMODE2	 (2ul<<8)
#define IFC_HMODE3	 (3ul<<8)

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
    __IOM uint32_t IMCR ;
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


/*----- Page Address  -----*/
typedef enum {
    // ---------    EXI    ---------
    PF_PAGE0				=0x00000000ul,
	PF_PAGE1				=0x00000400ul,
    PF_PAGE2				=0x00000800ul,
    PF_PAGE3				=0x00000C00ul,
	PF_PAGE4				=0x00001000ul,
	PF_PAGE5				=0x00001400ul,
	PF_PAGE6				=0x00001800ul,
	PF_PAGE7				=0x00001C00ul,
	PF_PAGE8				=0x00002000ul,
	PF_PAGE9				=0x00002400ul,
	PF_PAGE10				=0x00002800ul,
	PF_PAGE11				=0x00002C00ul,
	PF_PAGE12				=0x00003000ul,
	PF_PAGE13				=0x00003400ul,
	PF_PAGE14				=0x00003800ul,
	PF_PAGE15				=0x00003C00ul,
	PF_PAGE16				=0x00004000ul,
	PF_PAGE17				=0x00004400ul,
    PF_PAGE18				=0x00004800ul,
    PF_PAGE19				=0x00004C00ul,
	PF_PAGE20				=0x00005000ul,
	PF_PAGE21				=0x00005400ul,
	PF_PAGE22				=0x00005800ul,
	PF_PAGE23				=0x00005C00ul,
	PF_PAGE24				=0x00006000ul,
	PF_PAGE25				=0x00006400ul,
	PF_PAGE26				=0x00006800ul,
	PF_PAGE27				=0x00006C00ul,
	PF_PAGE28				=0x00007000ul,
	PF_PAGE29				=0x00007400ul,
	PF_PAGE30				=0x00007800ul,
	PF_PAGE31				=0x00007C00ul,
	PF_PAGE32				=0x00008000ul,
	PF_PAGE33				=0x00008400ul,
    PF_PAGE34				=0x00008800ul,
    PF_PAGE35				=0x00008C00ul,
	PF_PAGE36				=0x00009000ul,
	PF_PAGE37				=0x00009400ul,
	PF_PAGE38				=0x00009800ul,
	PF_PAGE39				=0x00009C00ul,
	PF_PAGE40				=0x0000A000ul,
	PF_PAGE41				=0x0000A400ul,
	PF_PAGE42				=0x0000A800ul,
	PF_PAGE43				=0x0000AC00ul,
	PF_PAGE44				=0x0000B000ul,
	PF_PAGE45				=0x0000B400ul,
	PF_PAGE46				=0x0000B800ul,
	PF_PAGE47				=0x0000BC00ul,
	PF_PAGE48				=0x0000C000ul,
	PF_PAGE49				=0x0000C400ul,
    PF_PAGE50				=0x0000C800ul,
    PF_PAGE51				=0x0000CC00ul,
	PF_PAGE52				=0x0000D000ul,
	PF_PAGE53				=0x0000D400ul,
	PF_PAGE54				=0x0000D800ul,
	PF_PAGE55				=0x0000DC00ul,
	PF_PAGE56				=0x0000E000ul,
	PF_PAGE57				=0x0000E400ul,
	PF_PAGE58				=0x0000E800ul,
	PF_PAGE59				=0x0000EC00ul,
	PF_PAGE60				=0x0000F000ul,
	PF_PAGE61				=0x0000F400ul,
	PF_PAGE62				=0x0000F800ul,
	PF_PAGE63				=0x0000FC00ul,
    DF_PAGE0				=0x10000000ul,
	DF_PAGE1				=0x10000400ul,
    DF_PAGE2				=0x10000800ul,
    DF_PAGE3				=0x10000C00ul,
} ifc_page_adr;

/*----- IFC Interrupt Event  -----*/
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
#define ifc_clk_enable(reg_ptr)		((reg_ptr)->CEDR = 1ul)
#define ifc_clk_disable(reg_ptr)	((reg_ptr)->CEDR = 0)

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


/**
  @brief       Flash Page Erase.

				Erase flash pages according to the address.
				The page size of this device is 1Kbytes. 
  
  @param[in]   addr    Start page address of flash to be erase
  @param[in]   size    number of pages to be read
  @return      error code
*/
uint32_t csi_ifc_page_erase(ifc_page_adr addr, uint32_t size);


#ifdef __cplusplus
}
#endif

#endif /* _CSI_SYSCON_H_ */