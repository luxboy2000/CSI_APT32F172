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

#ifndef _CSI_UART_H_
#define _CSI_UART_H_

#ifdef __cplusplus
extern "C" {
#endif

#include <stdint.h>
#include <stdbool.h>
#include <drv_common.h>

/* UART Individual Channel Config Registers */
typedef struct
{
    __IOM uint32_t DATA;               /**< Write and Read Data Register    */
    __IOM uint32_t SR;                 /**< Status Register                 */
    __IOM uint32_t CTRL;                /**< Control Register                */
    __IOM uint32_t ISR;                /**< Interrupt Status Register       */
    __IOM uint32_t BRDIV;               /**< Baud Rate Generator Register    */
    __IOM uint32_t ReservedA[20];
} APT_UART_Reg_t, *uart_handle_t;

extern uart_handle_t H_UART1;


#ifdef __cplusplus
}
#endif

#endif /* _CSI_UART*/
