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

#ifndef _CSI_OPA_H_
#define _CSI_OPA_H_

#ifdef __cplusplus
extern "C" {
#endif

#include <stdint.h>
#include <stdbool.h>
#include <drv_common.h>

/* OPA Individual Channel Config Registers */
typedef struct
{
    __IOM uint32_t CR0;            /**< OAMP0 Control Register                */
    __IOM uint32_t CR1;            /**< OAMP1 Control Register                */
    __IOM uint32_t GATR0;          /**< OAMP0 Gain tuning Register            */
    __IOM uint32_t GATR1;          /**< OAMP1 Gain tuning Register            */
} APT_OPA_Reg_t, *opa_handle_t;

extern opa_handle_t H_OPA;

#ifdef __cplusplus
}
#endif

#endif /* _CSI_OPA*/
