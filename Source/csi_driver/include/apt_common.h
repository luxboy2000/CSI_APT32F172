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
 * @file     drv_common.h
 * @brief    Header File for Common Driver
 * @version  V1.0
 * @date     02. June 2017
 ******************************************************************************/

#ifndef _DRV_COMMON_H_
#define _DRV_COMMON_H_

#include <stdint.h>
//#include <drv_errno.h>

/*----- EXI Interrupt Event  -----*/
typedef enum {
    // ---------    EXI    ---------
    EXI_EVENT_0           =0,
    EXI_EVENT_1             ,
    EXI_EVENT_2             ,
    EXI_EVENT_3             ,
    EXI_EVENT_4             ,
    EXI_EVENT_5             ,
    EXI_EVENT_6             ,
    EXI_EVENT_7             ,
    EXI_EVENT_8             ,
    EXI_EVENT_9             ,
    EXI_EVENT_10            ,
    EXI_EVENT_11            ,
    EXI_EVENT_12            ,
    EXI_EVENT_13            ,
    EXI_EVENT_14            ,
    EXI_EVENT_15            ,
    EXI_EVENT_16            ,
    EXI_EVENT_17            ,
    EXI_EVENT_18            ,
    EXI_EVENT_19            ,
} exi_event_e;

/*----- System clock option -----*/
typedef enum {
    ISOSC_3M             = 0,    ///< EMOSC Normal option
    IMOSC_20M               ,    ///< EMOSC Low frequence option
    IMOSC_40M               ,    ///< EMOSC Low frequence option
    EMOSC_24M               ,    ///< EMOSC Low frequence option
} syscon_sysclk_e;

typedef struct {
	syscon_sysclk_e _cur_sysclk;
	uint32_t _cur_hclk_freq;
	uint32_t _cur_pclk_freq;
} sysclk_cfg_t;

///// \details driver handle
//typedef void *drv_handle_t;
//
///**
//\brief General power states
//*/
//typedef enum  {
//    DRV_POWER_OFF,                        ///< Power off: no operation possible
//    DRV_POWER_LOW,                        ///< Low Power mode: retain state, detect and signal wake-up events
//    DRV_POWER_FULL                        ///< Power on: full operation at maximum performance
//} csi_power_stat_e;

#endif /* _DRV_COMMON_H */

