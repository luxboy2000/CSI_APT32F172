/*
 * Copyright (C) 2019 APTCHIP Microelectronics Co., Ltd. All rights reserved.
 *
 *   http://www.aptchip.com
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 */

//*************************************************************************
//* @file     dw_syscon.h
//* @brief    SYSCON driver private include file
//* @version  V1.0
//* @date     02. Sept 2019
//*************************************************************************

typedef union {
    struct {
        uint32_t PCLKCR0;
        uint32_t PCLKCR1;
    } w;
    uint64_t PCLKCR;
} pclk_conr_type;