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

#ifndef ISO_DEFAULT_FREQ
#define ISO_DEFAULT_FREQ (3000000)
#endif

#ifndef IMO_DEFAULT_FREQ
#define IMO_DEFAULT_FREQ (20000000)
#endif

#ifndef HFO_DEFAULT_FREQ
#define HFO_DEFAULT_FREQ (96000000)
#endif

#ifndef SYSTEM_CLOCK
#define SYSTEM_CLOCK    IMO_DEFAULT_FREQ 
#endif

#define ISR_SUPPORT_EXI0    // Interrupt support for Ext.Interrupt 0
#define ISR_SUPPORT_EXI1    // Interrupt support for Ext.Interrupt 1
#define ISR_SUPPORT_EXI2    // Interrupt support for Ext.Interrupt 2-3
#define ISR_SUPPORT_EXI3    // Interrupt support for Ext.Interrupt 4-9
#define ISR_SUPPORT_EXI4    // Interrupt support for Ext.Interrupt 10-15

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

#include "apt_syscon.h"
#include "apt_ifc.h"
#include "apt_adc.h"
#include "apt_cmp.h"
#include "apt_opa.h"
#include "apt_i2c.h"
#include "apt_spi.h"
#include "apt_uart.h"
#include "apt_usart.h"
#include "apt_led.h"
#include "apt_tkey.h"
#include "apt_tc0.h"
#include "apt_tc1.h"
#include "apt_tc2.h"
#include "apt_tc3.h"
#include "apt_epwm.h"
//#include "drv_gpio.h"


#define APT_DEF_DISABLE	false
#define APT_DEF_ENABLE	true
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
#define APT_GPIODd_BASE            (APT_APB_BASE+0x43000UL)
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

/* ================================================================================ */
/* ================             Peripheral Event Delaration        ================ */
/* ================================================================================ */
typedef enum {
    // ---------    EXI    ---------
    EXI_EVENT_0             ,
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

    // ---------    CORT   ---------
    CORET_EVENT_TIMEOUT     ,

    // ---------    EXI    ---------
    IFC_EVENT_END           ,
    IFC_EVENT_PROT_ERR      ,
    IFC_EVENT_UDEF_ERR      ,
    IFC_EVENT_ADDR_ERR      ,
    IFC_EVENT_OVW_ERR       ,

    // ---------    SYSCON ---------
    SC_EVENT_ISOSTBL        ,
    SC_EVENT_IMOSTBL        ,
    SC_EVENT_EMOSTBL        ,
    SC_EVENT_SCKSTBL        ,
    SC_EVENT_IWDT           ,
    SC_EVENT_LVD            ,
    SC_EVENT_CMFAIL         ,
    SC_EVENT_CMRCV          ,
    SC_EVENT_CMDERR         ,

    // ---------    ADC    ---------
    ADC_EVENT_EOC           ,
    ADC_EVENT_READY         ,
    ADC_EVENT_OVR           ,
    ADC_EVENT_CMP0H         ,
    ADC_EVENT_CMP0L         ,
    ADC_EVENT_CMP1H         ,
    ADC_EVENT_CMP1L         ,
    ADC_EVENT_SEQ0          ,
    ADC_EVENT_SEQ1          ,
    ADC_EVENT_SEQ2          ,
    ADC_EVENT_SEQ3          ,
    ADC_EVENT_SEQ4          ,
    ADC_EVENT_SEQ5          ,
    ADC_EVENT_SEQ6          ,
    ADC_EVENT_SEQ7          ,
    ADC_EVENT_SEQ8          ,
    ADC_EVENT_SEQ9          ,
    ADC_EVENT_SEQ10         ,
    ADC_EVENT_SEQ11         ,
    ADC_EVENT_SEQ12         ,
    ADC_EVENT_SEQ13         ,
    ADC_EVENT_SEQ14         ,
    ADC_EVENT_SEQ15         ,

    // ---------    CMP    ---------
    CMP_EVENT_EDET0         ,
    CMP_EVENT_EDET1         ,
    CMP_EVENT_EDET2         ,
    CMP_EVENT_EDET3         ,
    CMP_EVENT_EDET4         ,

    // ---------    GPT0   ---------
    GPT0_EVENT_COVFS        ,
    GPT0_EVENT_LOVRS        ,
    GPT0_EVENT_CPAS         ,
    GPT0_EVENT_CPBS         ,
    GPT0_EVENT_CPCS         ,
    GPT0_EVENT_LDRAS        ,
    GPT0_EVENT_LDRBS        ,
    GPT0_EVENT_ETRGS        ,

    // ---------    GPT1   ---------
    GPT1_EVENT_COVFS        ,
    GPT1_EVENT_LOVRS        ,
    GPT1_EVENT_CPAS         ,
    GPT1_EVENT_CPBS         ,
    GPT1_EVENT_CPCS         ,
    GPT1_EVENT_LDRAS        ,
    GPT1_EVENT_LDRBS        ,
    GPT1_EVENT_ETRGS        ,

    // ---------    GPT2   ---------
    GPT2_EVENT_COVFS        ,
    GPT2_EVENT_LOVRS        ,
    GPT2_EVENT_CPAS         ,
    GPT2_EVENT_CPBS         ,
    GPT2_EVENT_CPCS         ,
    GPT2_EVENT_LDRAS        ,
    GPT2_EVENT_LDRBS        ,
    GPT2_EVENT_ETRGS        ,

    // ---------    TC1    ---------
    TC1_EVENT_START         ,
    TC1_EVENT_STOP          ,
    TC1_EVENT_PSTART        ,
    TC1_EVENT_PEND          ,
    TC1_EVENT_MATCH         ,
    TC1_EVENT_OVF           ,
    TC1_EVENT_CAP           ,

    // ---------    TC2    ---------
    TC2_EVENT_PEND          ,
    TC2_EVENT_STOP          ,
    TC2_EVENT_START         ,

    // ---------    TC3    ---------
    TC3_EVENT_PEND          ,
    TC3_EVENT_OVF           ,

    // ---------    EPWM   ---------
    PWM0_EVENT_START        ,
    PWM0_EVENT_STOP         ,
    PWM0_EVENT_PEND         ,
    PWM0_EVENT_CENTER       ,
    PWM1_EVENT_START        ,
    PWM1_EVENT_STOP         ,
    PWM1_EVENT_PEND         ,
    PWM1_EVENT_CENTER       ,
    PWM2_EVENT_START        ,
    PWM2_EVENT_STOP         ,
    PWM2_EVENT_PEND         ,
    PWM2_EVENT_CENTER       ,
    PWM0_EVENT_CMPAUM       ,
    PWM0_EVENT_CMPADM       ,
    PWM0_EVENT_CMPBUM       ,
    PWM0_EVENT_CMPBDM       ,
    PWM1_EVENT_CMPAUM       ,
    PWM1_EVENT_CMPADM       ,
    PWM1_EVENT_CMPBUM       ,
    PWM1_EVENT_CMPBDM       ,
    PWM2_EVENT_CMPAUM       ,
    PWM2_EVENT_CMPADM       ,
    PWM2_EVENT_CMPBUM       ,
    PWM2_EVENT_CMPBDM       ,
    PWM0_EVENT_SLPA_OVF     ,
    PWM0_EVENT_SLPB_OVF     ,
    PWM1_EVENT_SLPA_OVF     ,
    PWM1_EVENT_SLPB_OVF     ,
    
    // ---------    LED    ---------
    LED_EVNET_CEND          ,
    LED_EVNET_PEND          ,

    // ---------    USART  ---------
    USART_EVENT_RXRDY       ,
    USART_EVENT_TXRDY       ,
    USART_EVENT_RXBRK       ,
    USART_EVENT_OVRE        ,
    USART_EVENT_FRAME       ,
    USART_EVENT_PARE        ,
    USART_EVENT_TIMEOUT     ,
    USART_EVENT_TXEMPTY     ,
    USART_EVENT_IDLE        ,

    // ---------    USART  ---------
    UART_EVENT_TX           ,
    UART_EVENT_RX           ,
    UART_EVENT_TXOVF        ,
    UART_EVENT_RXOVF        ,
    UART_EVENT_PARE         ,

    // ---------    I2C    ---------
    I2C_EVENT_SI            ,

    // ---------    SPI    ---------
    SPI_EVENT_RXOVF         ,
    SPI_EVENT_RXOVT         ,
    SPI_EVENT_RXINT         ,
    SPI_EVENT_TXINT         ,

    // ---------    TOUCH  ---------
    TCH_EVENT_CH0DNE        ,
    TCH_EVENT_CH1DNE        ,
    TCH_EVENT_CH2DNE        ,
    TCH_EVENT_CH3DNE        ,
    TCH_EVENT_CH4DNE        ,
    TCH_EVENT_CH5DNE        ,
    TCH_EVENT_CH6DNE        ,
    TCH_EVENT_CH7DNE        ,
    TCH_EVENT_CH8DNE        ,
    TCH_EVENT_CH9DNE        ,
    TCH_EVENT_CH10DNE       ,
    TCH_EVENT_CH11DNE       ,
    TCH_EVENT_CH12DNE       ,
    TCH_EVENT_CH13DNE       ,
    TCH_EVENT_CH14DNE       ,
    TCH_EVENT_CH15DNE       ,
    TCH_EVENT_CH16DNE       ,
    TCH_EVENT_CH17DNE       ,
    TCH_EVENT_CH18DNE       ,
    TCH_EVENT_CH19DNE       ,
    TCH_EVENT_KEYINT        ,
    TCH_EVENT_HWRST         ,
    TCH_EVENT_BLUPD         ,
    TCH_EVENT_PRCDNE        ,

} peri_event_e


#ifdef __cplusplus
}
#endif

#endif  /* SOC_H */
