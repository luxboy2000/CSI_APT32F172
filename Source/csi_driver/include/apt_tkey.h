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

#ifndef _CSI_TKEY_H_
#define _CSI_TKEY_H_

#ifdef __cplusplus
extern "C" {
#endif

#include <stdint.h>
#include <stdbool.h>
#include <drv_common.h>

/* TKEY Individual Channel Config Registers */
typedef struct
{
    __IOM uint32_t CR0;             /* Control Register */
    __IOM uint32_t CR1;             /* Control Register */
    __IOM uint32_t HWPCR0;          /* HWP Control Register */
    __IOM uint32_t HWPCR1;          /* HWP Control Register */
    __IOM uint32_t BLFUCR;          /* Baseline Force Updating Control Register*/
    __IOM uint32_t BLFUDR;          /* Baseline Force Updating Value Register*/
    __IOM uint32_t START;           /* Start Register */
    __IOM uint32_t CEDR;            /* Touch Clock Enable/Disable Register */
    __IOM uint32_t CHDSTL;          /* Channel Disable Status Control Low Register */
    __IOM uint32_t CHDSTH;          /* Channel Disable Status Control High Register */
    __IOM uint32_t RSVDA[2];
    __IOM uint32_t CHCFG;           /* Touch Sensor Channel Configuration Register */
    __IOM uint32_t TSRL;            /* Touch Sensor Sensitivity Select Low Register */
    __IOM uint32_t TSRH;            /* Touch Sensor Sensitivity Select High Register */
    __IOM uint32_t GSR;             /* Touch Global Sensitivity Control Reg */
    __IOM uint32_t OSR0;            /* Offset Register for Channel 0 to 3 */
    __IOM uint32_t OSR1;            /* Offset Register for Channel 4 to 7 */
    __IOM uint32_t OSR2;            /* Offset Register for Channel 8 to 11 */
    __IOM uint32_t OSR3;            /* Offset Register for Channel 12 to 15 */
    __IOM uint32_t OSR4;            /* Offset Register for Channel 16 to 19 */
    __IOM uint32_t TKCRL;			/*Touch Key Interrupt Trigger Condition Low Register */
    __IOM uint32_t TKCRH;			/*Touch Key Interrupt Trigger Condition High Register */
    __IOM uint32_t RISR;            /* Raw Interrupt Status Register */
    __IOM uint32_t IMCR;            /* Interrupt Masking Control Register */
    __IOM uint32_t MISR;            /* Masked Interrupt Status Register */
    __IOM uint32_t ICR;             /* Interrupt Clear Register */
    __IOM uint32_t RSVDB;
    __IOM uint32_t CHxCNT[20];      /* Channel Counter Register */
    __IOM uint32_t RSVDC[4];
    __IOM uint32_t CHxBL[20];       /* Channel Baseline Register */
    __IOM uint32_t RSVDD[4];
    __IOM uint32_t TKEYST;          /* TKEY Status Register */
    __IOM uint32_t BLUPINF;         /* Baseline update channel information */
} APT_TKEY_Reg_t, *tkey_handle_t;

extern tkey_handle_t H_TKEY;

#ifdef __cplusplus
}
#endif

#endif /* _CSI_TKEY*/
