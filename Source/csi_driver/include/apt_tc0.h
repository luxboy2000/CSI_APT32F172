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

#ifndef _CSI_TC0_H_
#define _CSI_TC0_H_

#ifdef __cplusplus
extern "C" {
#endif

#include <stdint.h>
#include <stdbool.h>
#include <drv_common.h>

/* TC0 Individual Channel Config Registers */
typedef struct {
    __IOM uint32_t ReservedA[20];
    __IOM uint32_t ECR;               /**< Enable Clock Register            */
    __IOM uint32_t DCR;               /**< Disable Clock Register           */
    __IOM uint32_t PMSR;              /**< Power Management Status Register */
    __IOM uint32_t ReservedD;
    __IOM uint32_t CR;                /**< Control Register                 */
    __IOM uint32_t MR;                /**< Mode Register                    */
    __IOM uint32_t ReservedE;
    __IOM uint32_t CSR;               /**< Clear Status Register            */
    __IOM uint32_t SR;                /**< Status Register                  */
    __IOM uint32_t IER;               /**< Interrupt Enable Register        */
    __IOM uint32_t IDR;               /**< Interrupt Disable Register       */
    __IOM uint32_t IMR;               /**< Interrupt Mask Register          */
    __IOM uint32_t CV;                /**< Counter value Register           */
    __IOM uint32_t RA;                /**< Register A                       */
    __IOM uint32_t RB;                /**< Register B                       */
    __IOM uint32_t RC;                /**< Register C                       */
    __IOM uint32_t ReservedF[28];
} APT_TC0_CHREG_t;

typedef struct
{
   APT_TC0_CHREG_t CH[3];             /**< GPT Channel                      */
   __IOM uint32_t BCR;                /**< Block Control                    */
   __IOM uint32_t BMR;                /**< Block Clock Mode Ctrl            */
} APT_TC0_Reg_t, *tc0_handle_t;

extern tc0_handle_t H_TC0;

#ifdef __cplusplus
}
#endif

#endif /* _CSI_TC0*/
