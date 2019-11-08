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

#ifndef _CSI_TC3_H_
#define _CSI_TC3_H_

#ifdef __cplusplus
extern "C" {
#endif

#include <stdint.h>
#include <stdbool.h>
#include <drv_common.h>

/* TC3 Individual Channel Config Registers */
typedef struct
{
    __IOM uint32_t IDR;            /**< IP ID-CODE Register                */
    __IOM uint32_t CSSR;           /**< Clock Source Selection Register    */
    __IOM uint32_t CEDR;           /**< Clock enable/disable register      */
    __IOM uint32_t SRR;            /**< Software reset register            */
    __IOM uint32_t CR;             /**< Control Register                   */
    __IOM uint32_t PRDR;           /**< Period Data Register               */
    __IOM uint32_t TIMDR;          /**< Timer Data Register                */
    __IOM uint32_t IMCR;           /**< Interrupt Masking Control Register */
    __IOM uint32_t RISR;           /**< Raw Interrupt Status Register      */
    __IOM uint32_t MISR;           /**< Masked Interrupt Status Register   */
    __IOM uint32_t ICR;            /**< Interrupt Clear Register           */
} APT_TC3_Reg_t, *tc3_handle_t;

extern tc3_handle_t H_TC3;

#ifdef __cplusplus
}
#endif

#endif /* _CSI_TC3*/
