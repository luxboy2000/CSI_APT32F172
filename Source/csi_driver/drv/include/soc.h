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
//* @file     soc.h
//* @brief    CSI Core Peripheral Access Layer Header File for
//*           CSKYSOC Device Series
//* @version  V1.0
//* @date     02. Sept 2019
//*************************************************************************


#ifndef SOC_H
#define SOC_H

#ifndef DEVICE_NAME
#define DEVICE_NAME APT32F102
#endif

#ifdef __cplusplus
extern "C" {
#endif

//#define SYSTEM_CLOCK 


/* -------------------------  Interrupt Number Definition  ------------------------ */

typedef enum IRQn
{
    /* ----------------------  SmartL Specific Interrupt Numbers  --------------------- */
    CORET_IRQn                      =   0,      /* core timer Interrupt */
    SYSCON_IRQn                     =   1,      /* syscon Interrupt */
    IFC_IRQn                        =   2,      /* IFC Interrupt */
    ADC_IRQn                        =   3,      /* ADC Interrupt */
    TC0_0_IRQn                      =   4,      /* TC0 Interrupt */
    TC0_1_IRQn                      =   5,      /* TC0 Interrupt */
    TC0_2_IRQn                      =   6,      /* TC0 Interrupt */
    EXI0_IRQn                       =   7,      /* exi0 Interrupt */
    EXI1_IRQn                       =   8,      /* exi1 Interrupt */
    EPWM_IRQn                       =   9,      /* epwm Interrupt */
    TC1_IRQn                        =   10,     /* TC16 Interrupt */
    TC2_IRQn                        =   11,     /* Simple Timer Interrupt */
    TC3_IRQn                        =   12,     /* Watch Timer Interrupt */
    UART0_IRQn                      =   13,     /* uart0 Interrupt */
    UART1_IRQn                      =   14,     /* uart1 Interrupt */
    I2C_IRQn                        =   17,     /* i2c Interrupt */
    SPI_IRQn                        =   19,     /* spi Interrupt */
    EXI2_IRQn                       =   21,     /* exi2 Interrupt */
    EXI3_IRQn                       =   22,     /* exi3 Interrupt */
    EXI4_IRQn                       =   23,     /* exi4 Interrupt */
    TKEY_IRQn                       =   25,     /* tkey Interrupt */
    LED_IRQn                        =   27,     /* led Interrupt */
    CMP0_IRQn                       =   28,     /* cmp0,cmp2 Interrupt */
    CMP1_IRQn                       =   29,     /* cmp1,cmp3,cmp4 Interrupt */

}
IRQn_Type;


/* ================================================================================ */
/* ================      Processor and Core Peripheral Section     ================ */
/* ================================================================================ */

/* --------  Configuration of the CK801 Processor and Core Peripherals  ------- */
#define __CK801_REV              0x0000U  /* Core revision r0p0 */
#define __MPU_PRESENT            0        /* MGU present or not */
#define __VIC_PRIO_BITS          2        /* Number of Bits used for Priority Levels */
#define __Vendor_SysTickConfig   0        /* Set to 1 if different SysTick Config is used */

#include "csi_core.h"                     /* Processor and core peripherals */
#include "stdint.h"
#include "apt_common.h"

extern sysclk_cfg_t sysclk_cfg;
 
#define CONFIG_GPIO_NUM 5

/* ================================================================================ */
/* ================              Peripheral memory map             ================ */
/* ================================================================================ */
/* --------------------------  CPU FPGA memory map  ------------------------------- */
#define APT_DEFL_BASE              (0x10000000UL)   // Embedded data flash memory
#define APT_SRAM_BASE              (0x20000000UL)

#define APT_APB_BASE               (0x40000000UL)

#define APT_SFR_BASE               (APT_APB_BASE+0x00000UL)
#define APT_IFC_BASE               (APT_APB_BASE+0x10000UL)
#define APT_SYSCON_BASE            (APT_APB_BASE+0x11000UL)
#define APT_TKEY_BASE              (APT_APB_BASE+0x20000UL)
#define APT_ADC0_BASE              (APT_APB_BASE+0x30000UL)
#define APT_GPIOA0_BASE            (APT_APB_BASE+0x40000UL)
#define APT_GPIOA1_BASE            (APT_APB_BASE+0x40100UL)
#define APT_GPIOB0_BASE            (APT_APB_BASE+0x41000UL)
#define APT_GPIOC0_BASE            (APT_APB_BASE+0x42000UL)
#define APT_GPIOD0_BASE            (APT_APB_BASE+0x43000UL)
#define APT_EXIGRP_BASE            (APT_APB_BASE+0x44000UL)
#define APT_TC0_BASE               (APT_APB_BASE+0x50000UL)
#define APT_TC1_BASE               (APT_APB_BASE+0x51000UL)
#define APT_TC2_BASE               (APT_APB_BASE+0x52000UL)
#define APT_TC3_BASE               (APT_APB_BASE+0x53000UL)
#define APT_EPWM_BASE              (APT_APB_BASE+0x54000UL)
#define APT_LED_BASE               (APT_APB_BASE+0x60000UL)
#define APT_USART0_BASE            (APT_APB_BASE+0x80000UL)
#define APT_UART1_BASE             (APT_APB_BASE+0x81000UL)
#define APT_SPI0_BASE              (APT_APB_BASE+0x90000UL)
#define APT_SPI1_BASE              (APT_APB_BASE+0x91000UL)
#define APT_SPI2_BASE              (APT_APB_BASE+0x92000UL)
#define APT_SPI3_BASE              (APT_APB_BASE+0x93000UL)
#define APT_I2C0_BASE              (APT_APB_BASE+0xA0000UL)
#define APT_I2C1_BASE              (APT_APB_BASE+0xA1000UL)
#define APT_CMP_BASE               (APT_APB_BASE+0xB0000UL)
#define APT_CMP1_BASE              (APT_APB_BASE+0xB1000UL)
#define APT_CMP2_BASE              (APT_APB_BASE+0xB2000UL)
#define APT_CMP3_BASE              (APT_APB_BASE+0xB3000UL)
#define APT_CMP4_BASE              (APT_APB_BASE+0xB4000UL)
#define APT_OPA_BASE               (APT_APB_BASE+0xC0000UL)

#ifdef __cplusplus
}
#endif

#endif  /* SOC_H */
