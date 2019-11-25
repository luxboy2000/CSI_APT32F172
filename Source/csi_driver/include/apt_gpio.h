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

#ifndef _CSI_GPIO_H_
#define _CSI_GPIO_H_

#ifdef __cplusplus
extern "C" {
#endif

#include <stdint.h>
#include <stdbool.h>
#include <apt_common.h>
#include <csi_gcc.h>
#include <core_ck801.h>

/*----- GPIO Register Define -----*/
typedef struct {
    __IOM uint32_t CONLR;           /*!<<B> 0x000: Control low register </B>*/
    __IOM uint32_t CONHR;           /*!< 0x004: Control high register */
    __OM  uint32_t WODR;            /*!< 0x008: Write output register */
    __OM  uint32_t SODR;            /*!< 0x00C: Set output register */
    __OM  uint32_t CODR;            /*!< 0x010: Clear output register */
    __IM  uint32_t ODSR;            /*!< 0x014: Output data status register */
    __IM  uint32_t PSDR;            /*!< 0x018: Pin status register */
    __IM  uint32_t RSVD;            /*!< 0x01C: Reserved*/
    __IOM uint32_t PUDR;            /*!< 0x020: Pull-up/down control register */
    __IOM uint32_t DSCR;            /*!< 0x024: Drive strength control register */
    __IOM uint32_t OMCR;            /*!< 0x028: Output Mode register */
    __IOM uint32_t IECR;            /*!< 0x02C: Interrupt Enable/disable register */
    __OM  uint32_t IEER;            /*!< 0x030: Interrupt Enable register */
    __OM  uint32_t IEDR;            /*!< 0x034: Interrupt Disable register*/
} APT_GPIO_Reg_t, *gpio_reg_ptr;

typedef struct {
    __IOM uint32_t IGRPL;           /*!< 0x000: Interrupt group low register*/
    __IOM uint32_t IGRPH;           /*!< 0x004: Interrupt group high register*/
} APT_IGRP_Reg_t, *igrp_reg_ptr;


typedef void *gpio_port_handle_t;

typedef void (*gpio_event_cb_t)(exi_event_e event);   ///< GPIO EXI Event call back.

extern gpio_reg_ptr H_GPIOA0;
extern gpio_reg_ptr H_GPIOA1;
extern gpio_reg_ptr H_GPIOB0;
extern gpio_reg_ptr H_GPIOC0;
extern gpio_reg_ptr H_GPIOD0;
extern igrp_reg_ptr H_EXIGRP;


/*----- GPIO SPEC -----*/
typedef enum {
    PA0_0   = 0x00,
    PA0_1       ,
    PA0_2       ,
    PA0_3       ,
    PA0_4       ,
    PA0_5       ,
    PA0_6       ,
    PA0_7       ,
    PA0_8       ,
    PA0_9       ,
    PA0_10      ,
    PA0_11      ,
    PA0_12      ,
    PA0_13      ,
    PA0_14      ,
    PA0_15      ,
    PA1_0   = 0x10,
    PA1_1       ,
    PA1_2       ,
    PA1_3       ,
    PA1_4       ,
    PA1_5       ,
    PB0_0   = 0x20,
    PB0_1       ,
    PC0_0   = 0x30,
    PC0_1       ,
    PC0_2       ,
    PC0_3       ,
    PD0_0   = 0x40,
    PD0_1       ,
} gpio_pin_name;

typedef enum {
    PORTA0   = 0,
    PORTA1      ,
    PORTB0      ,
    PORTC0      ,
    PORTD0      ,
} gpio_port_name;


/*----- GPIO Control Codes: Mode -----*/
typedef enum {
    GPIO_MODE_DISABLE          = 0,    ///< Disabled, High-Z
    GPIO_MODE_INPUT               ,    ///< Input
    GPIO_MODE_OUTPUT              ,    ///< Output
    GPIO_MODE_BIDIR               ,    ///< Output, with monitor
    GPIO_MODE_AF1                 ,    ///< AF1
    GPIO_MODE_AF2                 ,    ///< AF2
    GPIO_MODE_AF3                 ,    ///< AF3
    GPIO_MODE_AF4                 ,    ///< AF4
    GPIO_MODE_AF5                 ,    ///< AF5
    GPIO_MODE_AF6                 ,    ///< AF6
    GPIO_MODE_AF7                 ,    ///< AF7
} gpio_mode_e;

/*----- GPIO Pullup/Down: Mode Parameters: Data Bits -----*/
typedef enum {
    GPIO_PULLDIS               = 0,    ///< gpio pull disable
    GPIO_PULLUP                   ,    ///< gpio as pullup
    GPIO_PULLDOWN                 ,    ///< gpio as pulldown
} gpio_pull_e;

/*----- GPIO Drive Control Codes: Mode Parameters: Data Bits -----*/
typedef enum {
    GPIO_SLOW_WEAK             = 0,    ///< gpio as slow/weak drive
    GPIO_SLOW_STRG                ,    ///< gpio as slow/strong drive
    GPIO_FAST_WEAK                ,    ///< gpio as fast/strong drive
    GPIO_FAST_STRG                ,    ///< gpio as fast/strong drive
} gpio_char_e;

/*----- GPIO Output Mode Codes: Mode Parameters: Data Bits -----*/
typedef enum {
    GPIO_PUSHPULL              = 0,    ///< gpio as slow/weak drive
    GPIO_OPENDRAIN                ,    ///< gpio as slow/strong drive
} gpio_output_mode_e;

/*----- GPIO Interrupt Control Codes: Mode Parameters: Parity -----*/
typedef enum {
    GPIO_IRQ_MODE_RISING_EDGE     = 0,       ///< interrupt mode for rising edge
    GPIO_IRQ_MODE_FALLING_EDGE       ,       ///< interrupt mode for falling edge
    GPIO_IRQ_MODE_DOUBLE_EDGE        ,       ///< interrupt mode for double edge
} gpio_irq_mode_e;


typedef union {
    struct {
        uint8_t PIN0 : 4;
		uint8_t PIN1 : 4;
		uint8_t PIN2 : 4;
		uint8_t PIN3 : 4;
		uint8_t PIN4 : 4;
		uint8_t PIN5 : 4;
		uint8_t PIN6 : 4;
		uint8_t PIN7 : 4;
		uint8_t PIN8 : 4;
		uint8_t PIN9 : 4;
		uint8_t PIN10 : 4;
		uint8_t PIN11 : 4;
		uint8_t PIN12 : 4;
		uint8_t PIN13 : 4;
		uint8_t PIN14 : 4;
		uint8_t PIN15 : 4;
    } b;
    struct {
        uint32_t CONLR;
        uint32_t CONHR;
    } w;
    uint64_t CONR;
} gpio_conr_type;


////////////////////////////////// Public //////////////////////////////////////

/**
   @brief ISR call-back registration
 
   When exi interrupt is triggered, the system isr will call a specific function
   to deal with, the pointer of a user defined function to process the event is 
   registered by this function
   
   @param[in]   cb   pointer to customer ISR when EXI is called 
   @return      zero on success
 */ 
int32_t csi_gpio_exi_cb_init (gpio_event_cb_t cb);

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
int32_t csi_gpio_port_config(gpio_port_handle_t handle, uint64_t conr_val, uint32_t pullst);

/**
  @brief       Write value to the port (multi-bits)
  @param[in]   handle    gpio port handle to operate.
  @param[in]   value     the value to be set
  @return      none
*/
__ALWAYS_INLINE void csi_gpio_port_write(gpio_reg_ptr handle, uint32_t value)
{
    handle->WODR = value;
}

/**
  @brief       Set value high to the port (multi-bits)
  @param[in]   handle    gpio port handle to operate.
  @param[in]   mask      the pin to be set (0-ignored)
  @return      none
*/
__ALWAYS_INLINE void csi_gpio_port_set(gpio_reg_ptr handle, uint32_t mask)
{
    handle->SODR = mask;
}

/**
  @brief       Clear value of the port (multi-bits)
  @param[in]   handle    gpio port handle to operate.
  @param[in]   mask      the pin to be clear (0-ignored)
  @return      none
*/
__ALWAYS_INLINE void csi_gpio_port_clear(gpio_reg_ptr handle, uint32_t mask)
{
    handle->CODR = mask;
}

/**
  @brief       Read value of the port (multi-bits)
  @param[in]   handle    gpio port handle to operate.
  @param[in]   mask      the pin to be masked
  @return      read back value
*/
__ALWAYS_INLINE uint32_t csi_gpio_port_read(gpio_reg_ptr handle, uint32_t mask)
{
    return ((handle->PSDR) & mask);
}


/**
  @brief       Individual pin function config
  @param[in]   gpio_pin    pin name.
  @param[in]   pin_mode    pin mode.
  @return      error code
*/
int32_t csi_gpio_pin_func_config(gpio_pin_name gpio_pin, gpio_mode_e pin_mode);

/**
  @brief       Individual pin pull-up/down config
  @param[in]   gpio_pin    pin name.
  @param[in]   pin_mode    pull-up/down mode to be set.
  @return      error code
*/
void csi_gpio_pin_pull_config(gpio_pin_name gpio_pin, gpio_pull_e pin_mode);

/**
  @brief       Individual pin slew-rate & drive strength config
  @param[in]   gpio_pin    pin name.
  @param[in]   pin_mode    IO character to be set.
  @return      error code
*/
void csi_gpio_pin_speed_config(gpio_pin_name gpio_pin, gpio_char_e pin_mode);

/**
  @brief       Individual pin open-drain config
  @param[in]   gpio_pin    pin name.
  @param[in]   pin_mode    IO character to be set.
  @return      error code
*/
void csi_gpio_pin_outputmode_config(gpio_pin_name gpio_pin, gpio_output_mode_e pin_mode);

/**
  @brief       Set value high to the pin
  @param[in]   handle    gpio port handle to operate.
  @param[in]   pin_num   pin number in port
  @return      none
*/
__ALWAYS_INLINE void csi_gpio_pin_set(gpio_reg_ptr handle, uint32_t pin_num)
{
    handle->SODR = (1ul<<pin_num);
}

/**
  @brief       Clear value of the pin
  @param[in]   handle    gpio port handle to operate.
  @param[in]   pin_num   pin number in port
  @return      none
*/
__ALWAYS_INLINE void csi_gpio_pin_clear(gpio_reg_ptr handle, uint32_t pin_num)
{
    handle->CODR = (1ul<<pin_num);
}


/**
  @brief       Config pin external interrupt
  @param[in]   handle    gpio port handle to operate.
  @param[in]   pin_num   pin number in port
  @return      none
*/
void csi_gpio_pin_exi_set(gpio_pin_name gpio_pin, bool enable);



#ifdef __cplusplus
}
#endif

#endif /* _CSI_GPIO_H_ */
