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

#ifndef _CSI_I2C_H_
#define _CSI_I2C_H_

#ifdef __cplusplus
extern "C" {
#endif

#include <stdint.h>
#include <stdbool.h>
#include <drv_common.h>

/* I2C Individual Channel Config Registers */
typedef struct
{
    __IOM uint32_t ReservedA[20];
    __IOM uint32_t ECR;           /* Enable Clock Register                  */
    __IOM uint32_t DCR;           /* Disable Clock Register                 */
    __IOM uint32_t PMSR;          /* Power Management Status Register       */
    __IOM uint32_t ReservedD;     
    __IOM uint32_t CR;            /* Control Register                       */
    __IOM uint32_t MR;            /* Mode Register                          */
    __IOM uint32_t ReservedE[2];
    __IOM uint32_t SR;            /* Status Register                        */
    __IOM uint32_t IER;           /* Interrupt Enable Register              */
    __IOM uint32_t IDR;           /* Interrupt Enable Register              */
    __IOM uint32_t IMR;           /* Interrupt Enable Register              */
    __IOM uint32_t DAT;           /* Serial Data Register                   */
    __IOM uint32_t ADR;           /* Serial Slave Address Register          */
    __IOM uint32_t THOLD;         /* Hold/Setup Delay Register              */
} APT_I2C_Reg_t, *i2c_handle_t;

extern i2c_handle_t H_I2C;

#ifdef __cplusplus
}
#endif

#endif /* _CSI_I2C*/
