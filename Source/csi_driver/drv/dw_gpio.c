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

/// GPIOA0 register direct access pointer
gpio_reg_ptr H_GPIOA0  = (APT_GPIO_Reg_t   *)APT_GPIOA0_BASE;

/// GPIOA1 register direct access pointer
gpio_reg_ptr H_GPIOA1  = (APT_GPIO_Reg_t   *)APT_GPIOA1_BASE;

/// GPIOB0 register direct access pointer
gpio_reg_ptr H_GPIOB0  = (APT_GPIO_Reg_t   *)APT_GPIOB0_BASE;

/// GPIOC0 register direct access pointer
gpio_reg_ptr H_GPIOC0  = (APT_GPIO_Reg_t   *)APT_GPIOC0_BASE;

/// GPIOD0 register direct access pointer
gpio_reg_ptr H_GPIOD0  = (APT_GPIO_Reg_t   *)APT_GPIOD0_BASE;

/// EXI group config register direct access pointer
igrp_reg_ptr H_EXIGRP  = (APT_IGRP_Reg_t   *)APT_EXIGRP_BASE;

/// type define for GPIO resource
typedef struct {
  uint32_t base;              ///< base address of resource
  gpio_conr_type gpio_config; ///< port control register
  uint32_t pullst;            ///< port pullup/down control
} dw_gpio_private_t;

/// Declaration of variable to store EXI call-back routine pointer
gpio_event_cb_t gpio_exi_cb = NULL;

//static gpio_conr_type gpio_pa0_config = {.CONR=0ull}; ///< GPIOA0 CONR mirror stores in ram
//static gpio_conr_type gpio_pa1_config = {.CONR=0ull}; ///< GPIOA1 CONR mirror stores in ram
//static gpio_conr_type gpio_pb0_config = {.CONR=0ull}; ///< GPIOB0 CONR mirror stores in ram
//static gpio_conr_type gpio_pc0_config = {.CONR=0ull}; ///< GPIOC0 CONR mirror stores in ram
//static gpio_conr_type gpio_pd0_config = {.CONR=0ull}; ///< GPIOD0 CONR mirror stores in ram
static dw_gpio_private_t gpio_intance[CONFIG_GPIO_NUM]; ///< GPIO port resource

//
// Functions
//



////////////////////////////////// Public //////////////////////////////////////
/**
   @brief GPIO port handler inintialization
 
   Initialize port instance to be the default reset status and assign
   access register pointer to the resource according to port index
   
   @param[in]   idx  GPIO port to be initialized: PORTA0, PORTA1 ... 
   @return      resource handler of specific gpio port
 */ 
gpio_port_handle_t csi_gpio_initialize (int32_t idx)
{
  if (idx<0 || idx>CONFIG_GPIO_NUM) {
    return NULL;
  }

  dw_gpio_private_t *gpio_priv = &gpio_intance[idx];

  // base address initial...
  switch (idx) {
    case 0: // PORTA0
      gpio_priv->base = APT_GPIOA0_BASE;
      gpio_priv->gpio_config.CONR = 0ull;	// reset value of pa0
      gpio_priv->pullst = 0ul;
      break;
    case 1: // PORTA1
      gpio_priv->base = APT_GPIOA1_BASE;
      gpio_priv->gpio_config.CONR = 0ull;	// reset value of pa1
      gpio_priv->pullst = 0ul;
      break;
    case 2: // PORTB0
      gpio_priv->base = APT_GPIOB0_BASE;
      gpio_priv->gpio_config.CONR = 0ull;	// reset value of pb0
      gpio_priv->pullst = 0ul;
      break;
    case 3: // PORTC0
      gpio_priv->base = APT_GPIOC0_BASE;
      gpio_priv->gpio_config.CONR = 0ull;	// reset value of pc0
      gpio_priv->pullst = 0ul;
      break;
    case 4: // PORTD0
      gpio_priv->base = APT_GPIOD0_BASE;
      gpio_priv->gpio_config.CONR = 0ull;	// reset value of pd0
      gpio_priv->pullst = 0ul;
      break;
  }

  return (gpio_port_handle_t)gpio_priv;
}

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
  
   @param[in]  handle      handle of target port to be configured
   @param[in]  conr_val    expected control register value to be set
   @param[in]  pullst      pull-up/pull-down config
   @return    error code
 */
int32_t csi_gpio_port_config(gpio_port_handle_t handle, uint64_t conr_val, uint32_t pullst)
{
    GPIO_NULL_PARAM_CHK(handle);

    dw_gpio_private_t *gpio_priv = (dw_gpio_private_t *)handle;
    gpio_reg_ptr addr = (gpio_reg_ptr)(gpio_priv->base);
	
	gpio_priv->gpio_config.CONR = conr_val;
	
	addr->CONHR = gpio_priv->gpio_config.w.CONHR;
	addr->CONLR = gpio_priv->gpio_config.w.CONLR;
	addr->PUDR = pullst;
	
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
    
	dw_gpio_private_t *gpio_priv = &gpio_intance[port_idx];
    gpio_reg_ptr addr = (gpio_reg_ptr)(gpio_priv->base);
	gpio_conr_type gpio_conr_priv = gpio_priv->gpio_config;
	
	gpio_conr_priv.CONR &= ~(0xfull<<pin_idx*4);
	gpio_conr_priv.CONR |= (pin_mode << pin_idx*4);
	
	gpio_priv->gpio_config = gpio_conr_priv;
	addr->CONHR = gpio_priv->gpio_config.w.CONHR;
	addr->CONLR = gpio_priv->gpio_config.w.CONLR;
	
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

	dw_gpio_private_t *gpio_priv = &gpio_intance[port_idx];
    gpio_reg_ptr addr = (gpio_reg_ptr)(gpio_priv->base);
	
	uint32_t pudr_priv = addr->PUDR;
	pudr_priv &= ~(3ul<<pin_idx);
    pudr_priv |= (pin_mode<<pin_idx*2);
	
	addr->PUDR = pudr_priv;

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

	dw_gpio_private_t *gpio_priv = &gpio_intance[port_idx];
    gpio_reg_ptr addr = (gpio_reg_ptr)(gpio_priv->base);
	
	uint32_t dscr_priv = addr->DSCR;
	dscr_priv &= ~(3ul<<pin_idx);
    dscr_priv |= (pin_mode<<pin_idx*2);
	
	addr->DSCR = dscr_priv;
	
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

	dw_gpio_private_t *gpio_priv = &gpio_intance[port_idx];
    gpio_reg_ptr addr = (gpio_reg_ptr)(gpio_priv->base);
	
	uint32_t omcr_priv = addr->OMCR;
	omcr_priv &= ~(1ul<<pin_idx);
    omcr_priv |= (pin_mode<<pin_idx);
	
	addr->OMCR = omcr_priv;
	
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

	dw_gpio_private_t *gpio_priv = &gpio_intance[port_idx];
    gpio_reg_ptr addr = (gpio_reg_ptr)(gpio_priv->base);
	
	addr->IEER = enable<<pin_idx;
	addr->IEDR = (~enable)<<pin_idx;
	
}



