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

#ifndef _CSI_TC1_H_
#define _CSI_TC1_H_

#ifdef __cplusplus
extern "C" {
#endif

#include <stdint.h>
#include <stdbool.h>
#include <drv_common.h>

/* TC1 Individual Channel Config Registers */
typedef struct
{
    __IOM uint32_t IDR;         /**< ID Register                      */
    __IOM uint32_t CSSR;        /**< Clock Source Selection Register  */
    __IOM uint32_t CEDR;        /**< Clock Enable/Disable Register    */
    __IOM uint32_t SRR;         /**< Software Reset Register          */
    __IOM uint32_t CSR;         /**< Control Set Register             */
    __IOM uint32_t CCR;         /**< Control Clear Register           */
    __IOM uint32_t SR;          /**< Status Register                  */
    __IOM uint32_t IMSCR;       /**< Interrupt Mask Set/Clear Register*/
    __IOM uint32_t RISR;        /**< Raw Interrupt Status Register    */
    __IOM uint32_t MISR;        /**< Masked Interrupt Status Register */
    __IOM uint32_t ICR;         /**< Interrupt Clear Register         */
    __IOM uint32_t CDR;         /**< Clock Divider Register           */
    __IOM uint32_t CSMR;        /**< Count Size Mask Register         */
    __IOM uint32_t PRDR;        /**< Period Register                  */
    __IOM uint32_t PULR;        /**< Pulse Register                   */
    __IOM uint32_t RESVD[4];
    __IOM uint32_t CUCR;        /**< Capture Up Count Register        */
    __IOM uint32_t CDCR;        /**< Capture Down Count Register      */
    __IOM uint32_t CVR;         /**< Counter Value Register           */
} APT_TC1_Reg_t, *tc1_handle_t;

extern tc1_handle_t H_TC1;

#ifdef __cplusplus
}
#endif

#endif /* _CSI_TC1*/
