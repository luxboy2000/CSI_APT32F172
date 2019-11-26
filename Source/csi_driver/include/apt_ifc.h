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
#include <drv_common.h>

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

extern ifc_reg_ptr H_IFC;

#define ifc_start_cmd(reg_ptr)		((reg_ptr)->CR = 1ul)
#define ifc_set_protkey(reg_ptr)	((reg_ptr)->KR = IFC_USER_KEY)
#define ifc_clr_protkey(reg_ptr)	((reg_ptr)->KR = 0x0ul)

#ifdef __cplusplus
}
#endif

#endif /* _CSI_SYSCON_H_ */
