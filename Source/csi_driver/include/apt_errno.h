/*
 * Copyright (C) 2017 C-SKY Microsystems Co., Ltd. All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
/******************************************************************************
 * @file     drv_errno.h
 * @brief    header file for error num
 * @version  V1.0
 * @date     02. June 2017
 ******************************************************************************/

#ifndef _DRV_ERRNO_H_
#define _DRV_ERRNO_H_


#include <errno.h>

#define ERRNO_DRV_START 0X80

/* driver General error codes */
typedef enum {
    DRV_ERROR = ERRNO_DRV_START,   ///< Unspecified error
    DRV_ERROR_BUSY,                ///< Driver is busy
    DRV_ERROR_TIMEOUT,             ///< Timeout occurred
    DRV_ERROR_UNSUPPORTED,         ///< Operation not supported
    DRV_ERROR_PARAMETER,           ///< Parameter error
    DRV_ERROR_SPECIFIC0,           ///< Start of driver specific errors
    DRV_ERROR_SPECIFIC1,           ///< Start of driver specific errors
    DRV_ERROR_SPECIFIC2,           ///< Start of driver specific errors
    DRV_ERROR_SPECIFIC3,           ///< Start of driver specific errors
    DRV_ERROR_SPECIFIC4,           ///< Start of driver specific errors
    DRV_ERROR_SPECIFIC5,           ///< Start of driver specific errors
    DRV_ERROR_SPECIFIC6,           ///< Start of driver specific errors
    DRV_ERROR_SPECIFIC7,           ///< Start of driver specific errors
    DRV_ERROR_SPECIFIC8,           ///< Start of driver specific errors
    DRV_ERROR_SPECIFIC9,           ///< Start of driver specific errors
} drv_err_e;


/** Get error type */
#define GET_ERROR_TYPE(errno) \
    (error & 0xFF000000 >> 24)
/** Get error module */
#define GET_ERROR_MODULE(error) \
    (error & 0x00FF0000 >> 16)
/** Get error API */
#define GET_ERROR_API(error) \
    (error & 0x0000FF00 >> 8)
/** Get errno */
#define GET_ERROR_NUM(error) \
    (error & 0x000000FF)

#ifndef CSI_DRV_ERRNO_BASE
#define CSI_DRV_ERRNO_BASE          0x81000000
#endif

/** driver module id definition*/
#define CSI_DRV_ERRNO_GPIO_BASE     0x81010000
#define CSI_DRV_ERRNO_USART_BASE    0x81020000
#define CSI_DRV_ERRNO_SPI_BASE      0x81030000
#define CSI_DRV_ERRNO_I2C_BASE      0x81040000
#define CSI_DRV_ERRNO_PWM_BASE      0x81060000
#define CSI_DRV_ERRNO_RTC_BASE      0x81070000
#define CSI_DRV_ERRNO_TIMER_BASE    0x81080000
#define CSI_DRV_ERRNO_WDT_BASE      0x81090000
#define CSI_DRV_ERRNO_AES_BASE      0x810A0000
#define CSI_DRV_ERRNO_CRC_BASE      0x810B0000
#define CSI_DRV_ERRNO_RSA_BASE      0x810C0000
#define CSI_DRV_ERRNO_SHA_BASE      0x810D0000
#define CSI_DRV_ERRNO_TRNG_BASE     0x810E0000
#define CSI_DRV_ERRNO_EFLASH_BASE   0x810F0000
#define CSI_DRV_ERRNO_DMA_BASE      0x81100000
#define CSI_DRV_ERRNO_NORFLASH_BASE 0x81110000
#define CSI_DRV_ERRNO_INTC_BASE     0x81120000
#define CSI_DRV_ERRNO_ADC_BASE      0x81140000
#define CSI_DRV_ERRNO_SYSCON_BASE   0x81160000
#define CSI_DRV_ERRNO_IFC_BASE		0x81180000

#endif /* CSI_DRV_ERRNO_H */
