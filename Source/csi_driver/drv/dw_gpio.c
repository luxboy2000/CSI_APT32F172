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
//* @file     dw_gpio.c
//* @brief    CSI Source File for GPIO Driver
//* @version  V1.0
//* @date     02. Sept 2019
//******************************************************************************

#include <csi_config.h>
#include <stdbool.h>
#include <stdio.h>
#include "apt_soc.h"
#include "apt_gpio.h"
#include "csi_core.h"
#include "pin_name.h"

#define ERR_GPIO(errno) (CSI_DRV_ERRNO_GPIO_BASE | errno)
#define GPIO_NULL_PARAM_CHK(para)                         \
        do {                                        \
            if (para == NULL) {                     \
                return ERR_GPIO(DRV_ERROR_PARAMETER);   \
            }                                       \
        } while (0)

gpio_handle_t H_GPIOA0  = (APT_GPIO_Reg_t   *)APT_GPIOA0_BASE;
gpio_handle_t H_GPIOA1  = (APT_GPIO_Reg_t   *)APT_GPIOA1_BASE;
gpio_handle_t H_GPIOB0  = (APT_GPIO_Reg_t   *)APT_GPIOB0_BASE;
gpio_handle_t H_GPIOC0  = (APT_GPIO_Reg_t   *)APT_GPIOC0_BASE;
gpio_handle_t H_GPIOD0  = (APT_GPIO_Reg_t   *)APT_GPIOD0_BASE;

igrp_handle_t H_EXIGRP  = (APT_IGRP_Reg_t   *)APT_EXIGRP_BASE;

typedef union {
    struct {
        uint32_t PIN_PRIM : 4;
    } PIN[16];
    struct {
        uint32_t CONLR;
        uint32_t CONHR;
    } w;
    uint64_t CONR;
} gpio_conr_type;


// EXI interrupt call-back routine pointer
//#ifdef ISR_SUPPORT_EXI0
//static gpio_event_cb_t gpio_cb_pin0;
//#endif
//
//#ifdef ISR_SUPPORT_EXI1
//static gpio_event_cb_t gpio_cb_pin1;
//#endif
//
//#ifdef ISR_SUPPORT_EXI2
//static gpio_event_cb_t gpio_cb_pin2to3;
//#endif
//
//#ifdef ISR_SUPPORT_EXI3
//static gpio_event_cb_t gpio_cb_pin4to9;
//#endif
//
//#ifdef ISR_SUPPORT_EXI4
//static gpio_event_cb_t gpio_cb_pin10to15;
//#endif
gpio_event_cb_t gpio_exi_cb;

// Global variables stores current port conr content
static gpio_conr_type gpio_pa0_config;
static gpio_conr_type gpio_pa1_config;
static gpio_conr_type gpio_pb0_config;
static gpio_conr_type gpio_pc0_config;
static gpio_conr_type gpio_pd0_config;

//
// Functions
//


void gpio_pin_char_set(uint32_t * target, uint32_t pin_idx, uint32_t value)
{
    uint32_t cur_val = *target;
    cur_val &= ~(3ul<<pin_idx);
    cur_val |= (value<<pin_idx);
    *target = cur_val;
}



////////////////////////////////// Public //////////////////////////////////////
/**
 * @brief       ISR call-back registration
 * @param[i]    cb:     pointer to customer ISR when EXI is called 
 * @param[i]    idx:    exi isr number to be initialized
 * @return      zero on success
*/
int32_t csi_gpio_exi_cb_init (gpio_event_cb_t cb)
{
    GPIO_NULL_PARAM_CHK(cb);
    if ((idx < 0)||(idx>4)) {
        return ERR_GPIO(DRV_ERROR_PARAMETER);
    }

    gpio_exi_cb = cb;
    // transfer call-back pointer to global storage variable
    //switch (idx) {
    //    case 0: // EXI0
    //    #ifdef ISR_SUPPORT_EXI0
    //        gpio_cb_pin0 = cb;
    //    #endif
    //        break;
    //    case 1: // EXI1
    //    #ifdef ISR_SUPPORT_EXI1
    //        gpio_cb_pin1 = cb;
    //    #endif
    //        break;
    //    case 2: // EXI2
    //    #ifdef ISR_SUPPORT_EXI2
    //        gpio_cb_pin2to3 = cb;
    //    #endif
    //        break;
    //    case 3: // EXI3
    //    #ifdef ISR_SUPPORT_EXI3
    //        gpio_cb_pin4to9 = cb;
    //    #endif
    //        break;
    //    case 4: // EXI4
    //    #ifdef ISR_SUPPORT_EXI4
    //        gpio_cb_pin10to15 = cb;
    //    #endif
    //        break;
    //    default:
    //        gpio_cb_pin0 = NULL;
    //        gpio_cb_pin1 = NULL;
    //        gpio_cb_pin2to3 = NULL;
    //        gpio_cb_pin4to9 = NULL;
    //        gpio_cb_pin10to15 = NULL;
    //}

    return 0;
}

/**
  @brief       config multiple pin within one port
  @param[in]   handle    gpio port handle to operate. ()
  @return      error code
*/
int32_t csi_gpio_port_config(gpio_handle_t handle, gpio_conr_type conr_val, uint32_t pullst)
{
    GPIO_NULL_PARAM_CHK(handle);

    switch (handle) {
        case APT_GPIOA0_BASE:
            gpio_pa0_config = conr_val;
            handle->CONLR = gpio_pa0_config.CONLR;
            handle->CONHR = gpio_pa0_config.CONHR;
            handle->PUDR = pullst;
            break;
        case APT_GPIOA1_BASE:
            gpio_pa1_config = conr_val;
            handle->CONLR = gpio_pa1_config.CONLR;
            handle->CONHR = gpio_pa1_config.CONHR;
            handle->PUDR = pullst;
            break;
        case APT_GPIOB0_BASE:
            gpio_pb0_config = conr_val;
            handle->CONLR = gpio_pb0_config.CONLR;
            handle->CONHR = gpio_pb0_config.CONHR;
            handle->PUDR = pullst;
            break;
        case APT_GPIOC0_BASE:
            gpio_pc0_config = conr_val;
            handle->CONLR = gpio_pc0_config.CONLR;
            handle->CONHR = gpio_pc0_config.CONHR;
            handle->PUDR = pullst;
            break;
        case APT_GPIOD0_BASE:
            gpio_pd0_config = conr_val;
            handle->CONLR = gpio_pd0_config.CONLR;
            handle->CONHR = gpio_pd0_config.CONHR;
            handle->PUDR = pullst;
            break;
        default:
            return ERR_GPIO(GPIO_ERROR_PORTSEL);
    }

    return 0;
}

/**
  @brief       Write value to the port (multi-bits)
  @param[in]   handle    gpio port handle to operate.
  @param[in]   value     the value to be set
  @return      none
*/
__ALWAYS_INLINE void csi_gpio_port_write(gpio_handle_t handle, uint32_t value)
{
    handle->WODR = value;
}

/**
  @brief       Set value high to the port (multi-bits)
  @param[in]   handle    gpio port handle to operate.
  @param[in]   mask      the pin to be set (0-ignored)
  @return      none
*/
__ALWAYS_INLINE void csi_gpio_port_set(gpio_handle_t handle, uint32_t mask)
{
    handle->SODR = mask;
}

/**
  @brief       Clear value of the port (multi-bits)
  @param[in]   handle    gpio port handle to operate.
  @param[in]   mask      the pin to be clear (0-ignored)
  @return      none
*/
__ALWAYS_INLINE void csi_gpio_port_clear(gpio_handle_t handle, uint32_t mask)
{
    handle->CODR = mask;
}

/**
  @brief       Read value of the port (multi-bits)
  @param[in]   handle    gpio port handle to operate.
  @param[in]   mask      the pin to be masked
  @return      read back value
*/
__ALWAYS_INLINE uint32_t csi_gpio_port_read(gpio_handle_t handle, uint32_t mask)
{
    return ((handle->PSDR) & mask);
}

/**
  @brief       Individual pin function config
  @param[in]   gpio_pin    pin name.
  @param[in]   pin_mode    pin mode.
  @return      error code
*/
int32_t csi_gpio_pin_func_config(gpio_pin_name gpio_pin, gpio_mode_e pin_mode)
{
    uint32_t port_idx = (gpio_pin>>4);
    uint32_t pin_idx = (gpio_pin & 0xful);
    
    switch (port_idx) {
        case 1: // PORTA0
            gpio_pa0_config.PIN[pin_idx]= pin_mode;
            H_GPIOA0->CONLR = gpio_pa0_config.CONLR;
            H_GPIOA0->CONHR = gpio_pa0_config.CONHR;
            break;
        case 2: // PORTA1
            gpio_pa1_config.PIN[pin_idx]= pin_mode;
            H_GPIOA1->CONLR = gpio_pa1_config.CONLR;
            H_GPIOA1->CONHR = gpio_pa1_config.CONHR;
            break;
        case 3: // PORTB0
            gpio_pb0_config.PIN[pin_idx]= pin_mode;
            H_GPIOB0->CONLR = gpio_pb0_config.CONLR;
            H_GPIOB0->CONHR = gpio_pb0_config.CONHR;
            break;
        case 4: // PORTC0
            gpio_pc0_config.PIN[pin_idx]= pin_mode;
            H_GPIOC0->CONLR = gpio_pc0_config.CONLR;
            H_GPIOC0->CONHR = gpio_pc0_config.CONHR;
            break;
        case 5: // PORTD0
            gpio_pd0_config.PIN[pin_idx]= pin_mode;
            H_GPIOD0->CONLR = gpio_pd0_config.CONLR;
            H_GPIOD0->CONHR = gpio_pd0_config.CONHR;
            break;
    }

    return 0;
} 

/**
  @brief       Individual pin pull-up/down config
  @param[in]   gpio_pin    pin name.
  @param[in]   pin_mode    pull-up/down mode to be set.
  @return      error code
*/
void csi_gpio_pin_pull_config(gpio_pin_name gpio_pin, gpio_pull_e pin_mode)
{
    uint32_t port_idx = (gpio_pin>>4);
    uint32_t pin_idx = (gpio_pin & 0xful);
    uint32_t cur_pudr = 0;

    switch (port_idx) {
        case 1: // PORTA0
            gpio_pin_char_set(&H_GPIOA0->PUDR, pin_idx, (uint32_t)pin_mode);
            break;
        case 2: // PORTA1
            gpio_pin_char_set(&H_GPIOA1->PUDR, pin_idx, (uint32_t)pin_mode);
            break;
        case 3: // PORTB0
            gpio_pin_char_set(&H_GPIOB0->PUDR, pin_idx, (uint32_t)pin_mode);
            break;
        case 4: // PORTC0
            gpio_pin_char_set(&H_GPIOC0->PUDR, pin_idx, (uint32_t)pin_mode);
            break;
        case 5: // PORTD0
            gpio_pin_char_set(&H_GPIOD0->PUDR, pin_idx, (uint32_t)pin_mode);
            break;
    }

} 

/**
  @brief       Individual pin slew-rate & drive strength config
  @param[in]   gpio_pin    pin name.
  @param[in]   pin_mode    IO character to be set.
  @return      error code
*/
void csi_gpio_pin_speed_config(gpio_pin_name gpio_pin, gpio_char_e pin_mode)
{
    uint32_t port_idx = (gpio_pin>>4);
    uint32_t pin_idx = (gpio_pin & 0xful);

    switch (port_idx) {
        case 1: // PORTA0
            gpio_pin_char_set(&H_GPIOA0->DSCR, pin_idx, (uint32_t)pin_mode);
            break;
        case 2: // PORTA1
            gpio_pin_char_set(&H_GPIOA1->DSCR, pin_idx, (uint32_t)pin_mode);
            break;
        case 3: // PORTB0
            gpio_pin_char_set(&H_GPIOB0->DSCR, pin_idx, (uint32_t)pin_mode);
            break;
        case 4: // PORTC0
            gpio_pin_char_set(&H_GPIOC0->DSCR, pin_idx, (uint32_t)pin_mode);
            break;
        case 5: // PORTD0
            gpio_pin_char_set(&H_GPIOD0->DSCR, pin_idx, (uint32_t)pin_mode);
            break;
    }

} 


/**
  @brief       Individual pin open-drain config
  @param[in]   gpio_pin    pin name.
  @param[in]   pin_mode    IO character to be set.
  @return      error code
*/
void csi_gpio_pin_outputmode_config(gpio_pin_name gpio_pin, gpio_output_mode_e pin_mode)
{
    uint32_t port_idx = (gpio_pin>>4);
    uint32_t pin_idx = (gpio_pin & 0xful);

    switch (port_idx) {
        case 1: // PORTA0
            if (pin_mode == GPIO_PUSHPULL) {
                H_GPIOA0->OMCR &= ~(1ul<<pin_idx);
            } else {
                H_GPIOA0->OMCR |= 1ul<<pin_idx;
            }
            break;
        case 2: // PORTA1
            if (pin_mode == GPIO_PUSHPULL) {
                H_GPIOA1->OMCR &= ~(1ul<<pin_idx);
            } else {
                H_GPIOA1->OMCR |= 1ul<<pin_idx;
            }
            break;
        case 3: // PORTB0
            if (pin_mode == GPIO_PUSHPULL) {
                H_GPIOB0->OMCR &= ~(1ul<<pin_idx);
            } else {
                H_GPIOB0->OMCR |= 1ul<<pin_idx;
            }
            break;
        case 4: // PORTC0
            if (pin_mode == GPIO_PUSHPULL) {
                H_GPIOC0->OMCR &= ~(1ul<<pin_idx);
            } else {
                H_GPIOC0->OMCR |= 1ul<<pin_idx;
            }
            break;
        case 5: // PORTD0
            if (pin_mode == GPIO_PUSHPULL) {
                H_GPIOD0->OMCR &= ~(1ul<<pin_idx);
            } else {
                H_GPIOD0->OMCR |= 1ul<<pin_idx;
            }
            break;
    }

} 

/**
  @brief       Set value high to the pin
  @param[in]   handle    gpio port handle to operate.
  @param[in]   pin_num   pin number in port
  @return      none
*/
__ALWAYS_INLINE void csi_gpio_pin_set(gpio_handle_t handle, uint32_t pin_num)
{
    handle->SODR = (1ul<<pin_num);
}

/**
  @brief       Clear value of the pin
  @param[in]   handle    gpio port handle to operate.
  @param[in]   pin_num   pin number in port
  @return      none
*/
__ALWAYS_INLINE void csi_gpio_pin_clear(gpio_handle_t handle, uint32_t pin_num)
{
    handle->CODR = (1ul<<pin_num);
}

/**
  @brief       Config pin external interrupt
  @param[in]   handle    gpio port handle to operate.
  @param[in]   pin_num   pin number in port
  @return      none
*/
void csi_gpio_pin_exi_set(gpio_pin_name gpio_pin, bool enable)
{
    uint32_t port_idx = (gpio_pin>>4);
    uint32_t pin_idx  = (gpio_pin & 0xful);

    if (enable == true) {
        if (pin_idx < 8) {
            H_EXIGRP->IGRPL = ((H_EXIGRP->IGRPL) & ~(0xful<<(4*pin_idx))) | ((port_idx-1)<<(4*pin_idx)) ;
        } else {
            H_EXIGRP->IGRPH = ((H_EXIGRP->IGRPL) & ~(0xful<<(4*pin_idx))) | ((port_idx-1)<<(4*pin_idx)) ;
        }
    }

    switch (port_idx) {
    case 1: // PORTA0
        H_GPIOA0->IEER = enable<<pin_idx;
        H_GPIOA0->IEDR = (~enable)<<pin_idx;
        break;
    case 2: // PORTA1
        H_GPIOA1->IEER = enable<<pin_idx;
        H_GPIOA1->IEDR = (~enable)<<pin_idx;
        break;
    case 3: // PORTB0
        H_GPIOB0->IEER = enable<<pin_idx;
        H_GPIOB0->IEDR = (~enable)<<pin_idx;
        break;
    case 4: // PORTC0
        H_GPIOC0->IEER = enable<<pin_idx;
        H_GPIOC0->IEDR = (~enable)<<pin_idx;
        break;
    case 5: // PORTD0
        H_GPIOD0->IEER = enable<<pin_idx;
        H_GPIOD0->IEDR = (~enable)<<pin_idx;
        break;
    }

}



