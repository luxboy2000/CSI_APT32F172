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
} APT_IFC_Reg_t, *ifc_handle_t;

extern ifc_handle_t H_IFC;


#ifdef __cplusplus
}
#endif

#endif /* _CSI_SYSCON_H_ */
