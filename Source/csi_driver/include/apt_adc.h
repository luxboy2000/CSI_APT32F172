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

#ifndef _CSI_ADC_H_
#define _CSI_ADC_H_

#ifdef __cplusplus
extern "C" {
#endif

#include <stdint.h>
#include <stdbool.h>
#include <drv_common.h>

/* ADC Individual Channel Config Registers */
typedef struct {
    __IOM uint32_t ECR;            /**< Clock Enable Register             */
    __IOM uint32_t DCR;            /**< Clock Disable Register            */
    __IOM uint32_t PMSR;           /**< Power Management Status Register  */
    __IOM uint32_t ReservedB;
    __IOM uint32_t CR;             /**< Control Register                  */
    __IOM uint32_t MR;             /**< Mode Register                     */
    __IOM uint32_t ReservedC;
    __IOM uint32_t CSR;            /**< Clear Status Register             */
    __IOM uint32_t SR;             /**< Status Register                   */
    __IOM uint32_t IER;            /**< Interrupt Enable Register         */
    __IOM uint32_t IDR;            /**< Interrupt Disable Register        */
    __IOM uint32_t IMR;            /**< Interrupt Mask Register           */
    __IOM uint32_t SEQ[16];        /**< Conversion Mode Register 0~11     */
    __IOM uint32_t PRI;            /**< Conversion Priority Register      */
    __IOM uint32_t TDL0;           /**< ADC Trigger delay time 0          */
    __IOM uint32_t TDL1;           /**< ADC Trigger delay time 1          */
    __IOM uint32_t ReservedD[33];
    __IOM uint32_t DR[16];         /**< Convert Data Register             */
    __IOM uint32_t CMP0;           /**< Comparison Data Register             */
    __IOM uint32_t CMP1;           /**< Comparison Data Register             */
} APT_ADC_Reg_t, *adc_handle_t;

extern adc_handle_t H_ADC;

#ifdef __cplusplus
}
#endif

#endif /* _CSI_ADC*/
