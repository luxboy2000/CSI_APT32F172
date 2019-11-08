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
//APT_SFR_Reg_t       * H_SFR     = (APT_SFR_Reg_t    *)APT_SFR_BASE;
//APT_GPIO_Reg_t      * H_GPIOA0  = (APT_GPIO_Reg_t   *)APT_GPIOA0_BASE;
//APT_GPIO_Reg_t      * H_GPIOA1  = (APT_GPIO_Reg_t   *)APT_GPIOA1_BASE;
//APT_GPIO_Reg_t      * H_GPIOB0  = (APT_GPIO_Reg_t   *)APT_GPIOB0_BASE;
//APT_GPIO_Reg_t      * H_GPIOC0  = (APT_GPIO_Reg_t   *)APT_GPIOC0_BASE;
//APT_GPIO_Reg_t      * H_GPIOD0  = (APT_GPIO_Reg_t   *)APT_GPIOD0_BASE;
//APT_IGRP_Reg_t      * H_EXIGRP  = (APT_IGRP_Reg_t   *)APT_EXIGRP_BASE;

APT_SYSCON_Reg_t    * H_SYSCON  = (APT_SYSCON_Reg_t *)APT_SYSCON_BASE;
APT_IFC_Reg_t       * H_IFC     = (APT_IFC_Reg_t    *)APT_IFC_BASE;
APT_TKEY_Reg_t      * H_TKEY    = (APT_TKEY_Reg_t   *)APT_TKEY_BASE;
APT_ADC_Reg_t       * H_ADC     = (APT_ADC_Reg_t    *)APT_ADC0_BASE;
APT_TC0_Reg_t       * H_TC0     = (APT_TC0_Reg_t    *)APT_TC0_BASE;
APT_TC1_Reg_t       * H_TC1     = (APT_TC1_Reg_t    *)APT_TC1_BASE;
APT_TC2_Reg_t       * H_TC2     = (APT_TC2_Reg_t    *)APT_TC2_BASE;
APT_TC3_Reg_t       * H_TC3     = (APT_TC3_Reg_t    *)APT_TC3_BASE;
APT_EPWM_Reg_t      * H_EPWM    = (APT_EPWM_Reg_t   *)APT_EPWM_BASE;
APT_I2C_Reg_t       * H_I2C     = (APT_I2C_Reg_t    *)APT_I2C0_BASE;
APT_SPI_Reg_t       * H_SPI     = (APT_SPI_Reg_t    *)APT_SPI0_BASE;
APT_USART_Reg_t     * H_UART0   = (APT_USART_Reg_t  *)APT_USART0_BASE;
APT_UART_Reg_t      * H_UART1   = (APT_UART_Reg_t   *)APT_UART1_BASE;
APT_LED_Reg_t       * H_LED     = (APT_LED_Reg_t    *)APT_LED_BASE;
APT_CMP_Reg_t       * H_CMP     = (APT_CMP_Reg_t    *)APT_CMP_BASE;
APT_OPA_Reg_t       * H_OPA     = (APT_OPA_Reg_t    *)APT_OPA_BASE;


