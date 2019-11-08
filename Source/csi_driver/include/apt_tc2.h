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

#ifndef _CSI_TC2_H_
#define _CSI_TC2_H_

#ifdef __cplusplus
extern "C" {
#endif

#include <stdint.h>
#include <stdbool.h>
#include <drv_common.h>

/* TC2 Individual Channel Config Registers */
typedef struct
{
    __IOM uint32_t IDR;            /**< IP ID-CODE Register              */
    __IOM uint32_t CEDR;           /**< Clock enable/disable register    */
    __IOM uint32_t RSSR;           /**< Software reset start stop        */
    __IOM uint32_t IMSCR;          /**< Interrupt mask set clear         */
    __IOM uint32_t RISR;           /**< Raw interrupt status             */
    __IOM uint32_t MISR;           /**< Masked interrupt status          */
    __IOM uint32_t ICR;            /**< Interrupt clear                  */
    __IOM uint32_t SR;             /**< Counter status                   */
    __IOM uint32_t ReservedA;       
    __IOM uint32_t MR;             /**< Mode                             */
    __IOM uint32_t ReservedB[2];  
    __IOM uint32_t CNTBR;          /**< Counter size base                */
    __IOM uint32_t CNTR;           /**< Counter value                    */
    __IOM uint32_t CDR;            /**< Clock divider                    */
    __IOM uint32_t ReservedC[5];  
    __IOM uint32_t PCNTR;          /**< Pending counter value            */
    __IOM uint32_t ReservedD[11];  
    __IOM uint32_t CRR;            /**< Channel enable/disable           */
    __IOM uint32_t CMR;            /**< Channel mode                     */
    __IOM uint32_t CIMSCR;         /**< Capture/compare interrupt en/dis */
    __IOM uint32_t CRISR;          /**< Capture/compare interrupt RISR   */
    __IOM uint32_t CMISR;          /**< Capture/compare interrupt MISR   */
    __IOM uint32_t CICR;           /**< Capture/compare interrupt clear  */
    __IOM uint32_t ReservedE;       
    __IOM uint32_t CAPSR;          /**< Latest capture status            */
    __IOM uint32_t ReservedF[8];  
    __IOM uint32_t CC0R;;          /**< Capture/compare register base    */
    __IOM uint32_t CC1R;;          /**< Capture/compare register base    */
} APT_TC2_Reg_t, *tc2_handle_t;

extern tc2_handle_t H_TC2;

#ifdef __cplusplus
}
#endif

#endif /* _CSI_TC2*/
