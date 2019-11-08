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

#ifndef _CSI_USART_H_
#define _CSI_USART_H_

#ifdef __cplusplus
extern "C" {
#endif

#include <stdint.h>
#include <stdbool.h>
#include <drv_common.h>

/* USART Individual Channel Config Registers */
typedef struct
{
    __IOM uint32_t IDR;				/**< ID Register	            */
    __IOM uint32_t CEDR;               /**< Clock Enable/Disable Register  */
    __IOM uint32_t SRR;                /**< Software Reset Register        */
    __IOM uint32_t CR;                 /**< Control Register                */
    __IOM uint32_t MR;                 /**< Mode Register                   */
    __IOM uint32_t IMSCR;              /**< Interrupt Set/Clear Register       */
    __IOM uint32_t RISR;               /**< Raw Interrupt Status Register      */
    __IOM uint32_t MISR;               /**< Masked Interrupt Status Register   */
    __IOM uint32_t ICR;                /**< Clear Status Register              */
    __IOM uint32_t SR;                 /**< Status Register                 */
    __IOM uint32_t RHR;                /**< Receiver Holding Register       */
    __IOM uint32_t THR;                /**< Transmit Holding Register       */
    __IOM uint32_t BRGR;               /**< Baud Rate Generator Register    */
    __IOM uint32_t RTOR;               /**< Receiver Time-out Register      */
    __IOM uint32_t TTGR;               /**< Transmitter Time-guard Register */
    __IOM uint32_t LIR;                /**< LIN Identifier Register         */
    __IOM uint32_t DFWR0;              /**< Data Field Write 0 Register     */
    __IOM uint32_t DFWR1;              /**< Data Field Write 1 Register     */
    __IOM uint32_t DFRR0;              /**< Data Field Read 0 Register      */
    __IOM uint32_t DFRR1;              /**< Data Field Read 1 Register      */
    __IOM uint32_t SBLR;               /**< Sync Break Length Register      */
    __IOM uint32_t LCP1;               /**< Limit counter protocol 1        */
    __IOM uint32_t LCP2;               /**< Limit counter protocol 2        */
} APT_USART_Reg_t, *usart_handle_t;

extern usart_handle_t H_UART0;

#ifdef __cplusplus
}
#endif

#endif /* _CSI_USART*/
