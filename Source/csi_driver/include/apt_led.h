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

#ifndef _CSI_LED_H_
#define _CSI_LED_H_

#ifdef __cplusplus
extern "C" {
#endif

#include <stdint.h>
#include <stdbool.h>
#include <drv_common.h>

/* LED Individual Channel Config Registers */
typedef struct
{
    __IOM uint32_t CR;             /**< Control Register                 */
    __IOM uint32_t BRIGHT;         /**< Brightness Control Register      */
    __IOM uint32_t RISR;           /**< Raw Interrupt Status Register    */
    __IOM uint32_t IMCR;           /**< Interrupt Masking Control Reg.   */
    __IOM uint32_t MISR;           /**< Masked Interrupt Status Register */
    __IOM uint32_t ICR;            /**< Interrupt Clear Register         */
    __IOM uint32_t RSVD;          
    __IOM uint32_t TIMCR;          /**< Timing Control                   */
    __IOM uint32_t BLKER;          /**< Blink enable Control             */
    __IOM uint32_t BLKDR;          /**< Blink Clear Control              */
    __IOM uint32_t BLKST;          /**< Blink Status Register            */
    __IOM uint32_t SEGDATA0;       /**< Segment Data0                    */
    __IOM uint32_t SEGDATA1;       /**< Segment Data1                    */
    __IOM uint32_t SEGDATA2;       /**< Segment Data2                    */
    __IOM uint32_t SEGDATA3;       /**< Segment Data3                    */
    __IOM uint32_t SEGDATA4;       /**< Segment Data4                    */
    __IOM uint32_t SEGDATA5;       /**< Segment Data5                    */
    __IOM uint32_t SEGDATA6;       /**< Segment Data6                    */
    __IOM uint32_t SEGDATA7;       /**< Segment Data7                    */
} APT_LED_Reg_t, *led_handle_t;

extern led_handle_t H_LED;

#ifdef __cplusplus
}
#endif

#endif /* _CSI_LED*/
