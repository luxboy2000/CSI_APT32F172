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

#ifndef _CSI_CMP_H_
#define _CSI_CMP_H_

#ifdef __cplusplus
extern "C" {
#endif

#include <stdint.h>
#include <stdbool.h>
#include <drv_common.h>

/* CMP Individual Channel Config Registers */
typedef struct
{
    __IOM uint32_t CEDR;           /**< ID and Clock Control Register    */
    __IOM uint32_t CR0;            /**< Control Register0                */
    __IOM uint32_t CR1;            /**< Control Register1                */
    __IOM uint32_t CR2;            /**< Control Register2                */
    __IOM uint32_t CR3;            /**< Control Register3                */
    __IOM uint32_t CR4;            /**< Control Register4                */
    __IOM uint32_t FLTCR0;         /**< Filter Control Register0         */
    __IOM uint32_t FLTCR1;         /**< Filter Control Register1         */
    __IOM uint32_t FLTCR2;         /**< Filter Control Register2         */
    __IOM uint32_t FLTCR3;         /**< Filter Control Register3         */
    __IOM uint32_t FLTCR4;         /**< Filter Control Register4         */
    __IOM uint32_t WCNT0;          /**< Capture Window Control Register0 */
    __IOM uint32_t WCNT1;          /**< Capture Window Control Register1 */
    __IOM uint32_t WCNT2;          /**< Capture Window Control Register2 */
    __IOM uint32_t INPCR0;         /**< Input Config Register            */
    __IOM uint32_t INPCR1;         /**< Input Config Register            */
    __IOM uint32_t INPCR2;         /**< Input Config Register            */
    __IOM uint32_t INPCR3;         /**< Input Config Register            */
    __IOM uint32_t INPCR4;         /**< Input Config Register            */
    __IOM uint32_t TRGCR;          /**< Trigger Config Register          */
    __IOM uint32_t IMCR;           /**< Interrupt Masking Control Reg.   */
    __IOM uint32_t RISR;           /**< Raw Interrupt Status Reg.        */
    __IOM uint32_t MISR;           /**< Masked Interrupt Status Reg.     */
    __IOM uint32_t ICR;            /**< Interrupt Clear Register         */
} APT_CMP_Reg_t, *cmp_handle_t;

extern cmp_handle_t H_CMP;

#ifdef __cplusplus
}
#endif

#endif /* _CSI_CMP*/
