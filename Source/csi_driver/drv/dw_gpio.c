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
#include "soc.h"
#include "apt_errno.h"
#include "apt_gpio.h"
#include "csi_core.h"

#define ERR_GPIO(errno) (CSI_DRV_ERRNO_GPIO_BASE | errno)
#define GPIO_NULL_PARAM_CHK(para)                         \
        do {                                        \
            if (para == NULL) {                     \
                return ERR_GPIO(DRV_ERROR_PARAMETER);   \
            }                                       \
        } while (0)

/// GPIOA0 resource handler
gpio_handle_t H_GPIOA0  = (APT_GPIO_Reg_t   *)APT_GPIOA0_BASE;

/// GPIOA1 resource handler
gpio_handle_t H_GPIOA1  = (APT_GPIO_Reg_t   *)APT_GPIOA1_BASE;

/// GPIOB0 resource handler
gpio_handle_t H_GPIOB0  = (APT_GPIO_Reg_t   *)APT_GPIOB0_BASE;

/// GPIOC0 resource handler
gpio_handle_t H_GPIOC0  = (APT_GPIO_Reg_t   *)APT_GPIOC0_BASE;

/// GPIOD0 resource handler
gpio_handle_t H_GPIOD0  = (APT_GPIO_Reg_t   *)APT_GPIOD0_BASE;

/// EXI group config resource handler
igrp_handle_t H_EXIGRP  = (APT_IGRP_Reg_t   *)APT_EXIGRP_BASE;


/// Declaration of variable to store EXI call-back routine pointer
gpio_event_cb_t gpio_exi_cb = NULL;

static gpio_conr_type gpio_pa0_config = {.CONR=0ull}; ///< GPIOA0 CONR mirror stores in ram
static gpio_conr_type gpio_pa1_config = {.CONR=0ull}; ///< GPIOA1 CONR mirror stores in ram
static gpio_conr_type gpio_pb0_config = {.CONR=0ull}; ///< GPIOB0 CONR mirror stores in ram
static gpio_conr_type gpio_pc0_config = {.CONR=0ull}; ///< GPIOC0 CONR mirror stores in ram
static gpio_conr_type gpio_pd0_config = {.CONR=0ull}; ///< GPIOD0 CONR mirror stores in ram

//
// Functions
//


static uint32_t gpio_pin_char_set(uint32_t target, uint32_t pin_idx, uint32_t value)
{
    uint32_t cur_val = target;
    cur_val &= ~(3ul<<pin_idx);
    cur_val |= (value<<pin_idx);
    return cur_val;
}

static void gpio_set_pin_con (gpio_conr_type* gpio_config, uint32_t pin_idx, gpio_mode_e pin_mode)
{
	(*gpio_config).CONR &= ~(0xful<<pin_idx*4);
	(*gpio_config).CONR |= (pin_mode << pin_idx*4);
}

////////////////////////////////// Public //////////////////////////////////////

/**
   @brief ISR call-back registration
 
   When exi interrupt is triggered, the system isr will call a specific function
   to deal with, the pointer of a user defined function to process the event is 
   registered by this function
   
   @param[in]   cb   pointer to customer ISR when EXI is called 
   @return      zero on success
 */ 
int32_t csi_gpio_exi_cb_init (gpio_event_cb_t cb)
{
    GPIO_NULL_PARAM_CHK(cb);
    gpio_exi_cb = cb;
    return 0;
}

/** 
   @brief      PORT function config 
    
   Set a GPIO port with specific control data. The control data should be transferred
   by a struct. The pull-up/pull-down resistor status on the GPIO also should be configured
   as well.
  
   @param[in]  port_idx    target port name to be configured
   @param[in]  conr_val    expected control register value to be set
   @param[in]  pullst      pull-up/pull-down config
   @return    error code
 */
int32_t csi_gpio_port_config(gpio_port_name port_idx, gpio_conr_type conr_val, uint32_t pullst)
{
    switch (port_idx) {
        case PORTA0:
            gpio_pa0_config = conr_val;
            H_GPIOA0->CONLR = gpio_pa0_config.w.CONLR;
            H_GPIOA0->CONHR = gpio_pa0_config.w.CONHR;
            H_GPIOA0->PUDR = pullst;
            break;
        case PORTA1:
            gpio_pa1_config = conr_val;
            H_GPIOA1->CONLR = gpio_pa1_config.w.CONLR;
            H_GPIOA1->CONHR = gpio_pa1_config.w.CONHR;
            H_GPIOA1->PUDR = pullst;
            break;
        case PORTB0:
            gpio_pb0_config = conr_val;
            H_GPIOB0->CONLR = gpio_pb0_config.w.CONLR;
            H_GPIOB0->CONHR = gpio_pb0_config.w.CONHR;
            H_GPIOB0->PUDR = pullst;
            break;
        case PORTC0:
            gpio_pc0_config = conr_val;
            H_GPIOC0->CONLR = gpio_pc0_config.w.CONLR;
            H_GPIOC0->CONHR = gpio_pc0_config.w.CONHR;
            H_GPIOC0->PUDR = pullst;
            break;
        case PORTD0:
            gpio_pd0_config = conr_val;
            H_GPIOD0->CONLR = gpio_pd0_config.w.CONLR;
            H_GPIOD0->CONHR = gpio_pd0_config.w.CONHR;
            H_GPIOD0->PUDR = pullst;
            break;
        default:
            return ERR_GPIO(DRV_ERROR_UNSUPPORTED);
    }

    return 0;
}

/**
  @brief       Individual pin function config

  Config a single pin
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
            gpio_set_pin_con (&gpio_pa0_config,pin_idx,pin_mode);
            H_GPIOA0->CONLR = gpio_pa0_config.w.CONLR;
            H_GPIOA0->CONHR = gpio_pa0_config.w.CONHR;
            break;
        case 2: // PORTA1
            gpio_set_pin_con (&gpio_pa1_config,pin_idx,pin_mode);
            H_GPIOA1->CONLR = gpio_pa1_config.w.CONLR;
            H_GPIOA1->CONHR = gpio_pa1_config.w.CONHR;
            break;
        case 3: // PORTB0
            gpio_set_pin_con (&gpio_pb0_config,pin_idx,pin_mode);
            H_GPIOB0->CONLR = gpio_pb0_config.w.CONLR;
            H_GPIOB0->CONHR = gpio_pb0_config.w.CONHR;
            break;
        case 4: // PORTC0
            gpio_set_pin_con (&gpio_pc0_config,pin_idx,pin_mode);
            H_GPIOC0->CONLR = gpio_pc0_config.w.CONLR;
            H_GPIOC0->CONHR = gpio_pc0_config.w.CONHR;
            break;
        case 5: // PORTD0
            gpio_set_pin_con (&gpio_pd0_config,pin_idx,pin_mode);
            H_GPIOD0->CONLR = gpio_pd0_config.w.CONLR;
            H_GPIOD0->CONHR = gpio_pd0_config.w.CONHR;
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

    switch (port_idx) {
        case 1: // PORTA0
            H_GPIOA0->PUDR = gpio_pin_char_set(H_GPIOA0->PUDR, pin_idx, (uint32_t)pin_mode);
            break;
        case 2: // PORTA1
            H_GPIOA1->PUDR = gpio_pin_char_set(H_GPIOA1->PUDR, pin_idx, (uint32_t)pin_mode);
            break;
        case 3: // PORTB0
            H_GPIOB0->PUDR = gpio_pin_char_set(H_GPIOB0->PUDR, pin_idx, (uint32_t)pin_mode);
            break;
        case 4: // PORTC0
            H_GPIOC0->PUDR = gpio_pin_char_set(H_GPIOC0->PUDR, pin_idx, (uint32_t)pin_mode);
            break;
        case 5: // PORTD0
            H_GPIOD0->PUDR = gpio_pin_char_set(H_GPIOD0->PUDR, pin_idx, (uint32_t)pin_mode);
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
            H_GPIOA0->DSCR = gpio_pin_char_set(H_GPIOA0->DSCR, pin_idx, (uint32_t)pin_mode);
            break;
        case 2: // PORTA1
            H_GPIOA1->DSCR = gpio_pin_char_set(H_GPIOA1->DSCR, pin_idx, (uint32_t)pin_mode);
            break;
        case 3: // PORTB0
            H_GPIOB0->DSCR = gpio_pin_char_set(H_GPIOB0->DSCR, pin_idx, (uint32_t)pin_mode);
            break;
        case 4: // PORTC0
            H_GPIOC0->DSCR = gpio_pin_char_set(H_GPIOC0->DSCR, pin_idx, (uint32_t)pin_mode);
            break;
        case 5: // PORTD0
            H_GPIOD0->DSCR = gpio_pin_char_set(H_GPIOD0->DSCR, pin_idx, (uint32_t)pin_mode);
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



