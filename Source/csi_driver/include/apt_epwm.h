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

#ifndef _CSI_EPWM_H_
#define _CSI_EPWM_H_

#ifdef __cplusplus
extern "C" {
#endif

#include <stdint.h>
#include <stdbool.h>
#include <drv_common.h>

/* EPWM Individual Channel Config Registers */
typedef struct
{
    __IOM uint32_t CR;              /*<<0x0000  Control                             */
    __IOM uint32_t LKCR;            /*<<0x0004  Link Mode Control                   */
    __IOM uint32_t LKTRG;           /*<<0x0008  Link Mode Trigger Control           */
    __IOM uint32_t CNTR0;           /*<<0x000C  Counter Value                       */
    __IOM uint32_t CNTBR0;          /*<<0x0010  Counter Base Value                  */
    __IOM uint32_t PCNTR0;          /*<<0x0014  Pending Counter Value               */
    __IOM uint32_t SLPCNTR0;        /*<<0x0018  Soft-lock Pending Counter Value     */
    __IOM uint32_t CNTR1;           /*<<0x001C  Counter Value                       */
    __IOM uint32_t CNTBR1;          /*<<0x0020  Counter Base Value                  */
    __IOM uint32_t PCNTR1;          /*<<0x0024  Pending Counter Value               */
    __IOM uint32_t SLPCNTR1;        /*<<0x0028  Soft-lock Pending Counter Value     */
    __IOM uint32_t CNTR2;           /*<<0x002C  Counter Value                       */
    __IOM uint32_t CNTBR2;          /*<<0x0030  Counter Base Value                  */
    __IOM uint32_t PCNTR2;          /*<<0x0034  Pending Counter Value               */
    __IOM uint32_t SLPCNTR2;        /*<<0x0038  Soft-lock Pending Counter Value     */
    __IOM uint32_t CMPAR0;          /*<<0x003C  Compare Value A                     */
    __IOM uint32_t PCMPAR0;         /*<<0x0040  Pending Compare Value A             */
    __IOM uint32_t SLPCMPAR0;       /*<<0x0044  Soft-lock Pending Compare Value A   */
    __IOM uint32_t CMPBR0;          /*<<0x0048  Compare Value B                     */
    __IOM uint32_t PCMPBR0;         /*<<0x004C  Pending Compare Value B             */
    __IOM uint32_t SLPCMPBR0;       /*<<0x0050  Soft-lock Pending Compare Value B   */
    __IOM uint32_t CMPAR1;          /*<<0x0054  Compare Value A                     */
    __IOM uint32_t PCMPAR1;         /*<<0x0058  Pending Compare Value A             */
    __IOM uint32_t SLPCMPAR1;       /*<<0x005C  Soft-lock Pending Compare Value A   */
    __IOM uint32_t CMPBR1;          /*<<0x0060  Compare Value B                     */
    __IOM uint32_t PCMPBR1;         /*<<0x0064  Pending Compare Value B             */
    __IOM uint32_t SLPCMPBR1;       /*<<0x0068  Soft-lock Pending Compare Value B   */
    __IOM uint32_t CMPAR2;          /*<<0x006C  Compare Value A                     */
    __IOM uint32_t PCMPAR2;         /*<<0x0070  Pending Compare Value A             */
    __IOM uint32_t SLPCMPAR2;       /*<<0x0074  Soft-lock Pending Compare Value A   */
    __IOM uint32_t CMPBR2;          /*<<0x0078  Compare Value B                     */
    __IOM uint32_t PCMPBR2;         /*<<0x007C  Pending Compare Value B             */
    __IOM uint32_t SLPCMPBR2;       /*<<0x0080  Soft-lock Pending Compare Value B   */
    __IOM uint32_t WGCR0;           /*<<0x0084  Waveform Generator Engine Control   */
    __IOM uint32_t WGCR1;           /*<<0x0088  Waveform Generator Engine Control   */
    __IOM uint32_t WGCR2;           /*<<0x008C  Waveform Generator Engine Control   */
    __IOM uint32_t OUTCR0;          /*<<0x0090  Output Control                      */
    __IOM uint32_t OUTCR1;          /*<<0x0094  Output Control                      */
    __IOM uint32_t OUTCR2;          /*<<0x0098  Output Control                      */
    __IOM uint32_t CFCR0;           /*<<0x009C  Carrier Frequency Output Control    */
    __IOM uint32_t CFCR1;           /*<<0x00A0  Carrier Frequency Output Control    */
    __IOM uint32_t CFCR2;           /*<<0x00A4  Carrier Frequency Output Control    */
    __IOM uint32_t EMR;             /*<<0x00A8  Emergency Control                   */
    __IOM uint32_t SLCON;           /*<<0x00AC  Emergency Control                   */
    __IOM uint32_t SLSTEP0;         /*<<0x00B0  Soft lock auto-dec/inc step Control */
    __IOM uint32_t SLSTEP1;         /*<<0x00B4  Soft lock auto-dec/inc step Control */
    __IOM uint32_t IER;             /*<<0x00B8  INT Enable/Disable Register         */
    __IOM uint32_t ICR;             /*<<0x00BC  INT Pending Clear Register          */
    __IOM uint32_t RISR;            /*<<0x00C0  INT Raw Status Register             */
    __IOM uint32_t MISR;            /*<<0x00C4  INT Masked Status Register          */
    __IOM uint32_t EXTRG0;          /*<<0x00C8  External Trigger Register           */
    __IOM uint32_t EXTRG1;          /*<<0x00CC  External Trigger Register           */
} APT_EPWM_Reg_t, *epwm_handle_t;

extern epwm_handle_t H_EPWM;

#ifdef __cplusplus
}
#endif

#endif /* _CSI_EPWM*/
