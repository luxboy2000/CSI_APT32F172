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

#ifndef _CSI_SPI_H_
#define _CSI_SPI_H_

#ifdef __cplusplus
extern "C" {
#endif

#include <stdint.h>
#include <stdbool.h>
#include <drv_common.h>

/* SPI Individual Channel Config Registers */
typedef struct
{
    __IOM uint32_t CR0;         /**< Control Register 0 */
    __IOM uint32_t CR1;         /**< Control Register 1 */
    __IOM uint32_t DR;          /**< Receive FIFO(read) and transmit FIFO data register(write) */
    __IOM uint32_t SR;          /**< Status register */
    __IOM uint32_t CPSR;        /**< Clock prescale register */
    __IOM uint32_t IMSCR;       /**< Interrupt mask set and clear register */
    __IOM uint32_t RISR;        /**< Raw interrupt status register */
    __IOM uint32_t MISR;        /**< Masked interrupt status register */
    __IOM uint32_t ICR;         /**< Interrupt clear register */
} APT_SPI_Reg_t, *spi_handle_t;

extern spi_handle_t H_SPI;

#ifdef __cplusplus
}
#endif

#endif /* _CSI_SPI*/
