/*
 * Copyright (C) 2019 APTCHIP Microelectronics Co., Ltd. All rights reserved.
 *
 *   http://www.aptchip.com
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 */

//******************************************************************************
//* @file     devices.c
//* @brief    source file for the devices
//* @version  V1.0
//* @date     02. Sept 2019
//******************************************************************************
#include "soc.h"

/* ================================================================================ */
/* ================               Peripheral Resource Map          ================ */
/* ================================================================================ */
extern APT_SFR_Reg_t       * H_SFR     ;
extern APT_GPIO_Reg_t      * H_GPIOA0  ;
extern APT_GPIO_Reg_t      * H_GPIOA1  ;
extern APT_GPIO_Reg_t      * H_GPIOB0  ;
extern APT_GPIO_Reg_t      * H_GPIOC0  ;
extern APT_GPIO_Reg_t      * H_GPIOD0  ;
extern APT_IGRP_Reg_t      * H_EXIGRP  ;

extern APT_SYSCON_Reg_t    * H_SYSCON  ;
extern APT_IFC_Reg_t       * H_IFC     ;
extern APT_TKEY_Reg_t      * H_TKEY    ;
extern APT_ADC_Reg_t       * H_ADC     ;
extern APT_TC0_Reg_t       * H_TC0     ;
extern APT_TC1_Reg_t       * H_TC1     ;
extern APT_TC2_Reg_t       * H_TC2     ;
extern APT_TC3_Reg_t       * H_TC3     ;
extern APT_EPWM_Reg_t      * H_EPWM    ;
extern APT_I2C_Reg_t       * H_I2C     ;
extern APT_SPI_Reg_t       * H_SPI     ;
extern APT_USART_Reg_t     * H_UART0   ;
extern APT_UART_Reg_t      * H_UART1   ;
extern APT_LED_Reg_t       * H_LED     ;
extern APT_CMP_Reg_t       * H_CMP     ;
extern APT_OPA_Reg_t       * H_OPA     ;

