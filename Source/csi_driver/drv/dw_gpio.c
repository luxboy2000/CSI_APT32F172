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
#include "dw_gpio.h"
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
#ifdef ISR_SUPPORT_EXI0
static gpio_event_cb_t gpio_cb_pin0;
#endif

#ifdef ISR_SUPPORT_EXI1
static gpio_event_cb_t gpio_cb_pin1;
#endif

#ifdef ISR_SUPPORT_EXI2
static gpio_event_cb_t gpio_cb_pin2to3;
#endif

#ifdef ISR_SUPPORT_EXI3
static gpio_event_cb_t gpio_cb_pin4to9;
#endif

#ifdef ISR_SUPPORT_EXI4
static gpio_event_cb_t gpio_cb_pin10to15;
#endif


static gpio_conr_type gpio_pa0_config;
static gpio_conr_type gpio_pa1_config;
static gpio_conr_type gpio_pb0_config;
static gpio_conr_type gpio_pc0_config;
static gpio_conr_type gpio_pd0_config;

//
// Functions
//

static int32_t gpio_set_direction(
    void *port,
    gpio_direction_e direction
)
{
    dw_gpio_priv_t *gpio_priv = port;
    dw_gpio_reg_t *gpio_reg = (dw_gpio_reg_t *)(gpio_priv->base);

    if (direction == GPIO_DIRECTION_INPUT) {
        gpio_reg->SWPORT_DDR &= (~gpio_priv->mask);
    } else if (direction == GPIO_DIRECTION_OUTPUT) {
        gpio_reg->SWPORT_DDR |= gpio_priv->mask;
    } else {
        return ERR_GPIO(GPIO_ERROR_DIRECTION);
    }

    return 0;
}

/*
 * Read the statu of the Port choosed.
 * Parameters:
 *   port:  use to choose a I/O port among Port A, B, or C.
 * return: the value of the corresponding Port.
 */

static int32_t gpio_read(void *port, uint32_t *value)
{
    dw_gpio_priv_t *gpio_priv = port;
    dw_gpio_control_reg_t *gpio_control_reg = (dw_gpio_control_reg_t *)(gpio_priv->base + 0x30);
    *value = gpio_control_reg->EXT_PORTA;
    return 0;
}


/*
 * Write an output value to corresponding Port.
 * Parameters:
 *   port:  use to choose a I/O port among Port A, B, or C.
 *   output: value that will be written to the corresponding Port.
 * return: SUCCESS
 */

static int32_t gpio_write(void *port, uint32_t mask)
{
    dw_gpio_priv_t *gpio_priv = port;
    dw_gpio_reg_t *gpio_reg = (dw_gpio_reg_t *)(gpio_priv->base);

    uint32_t value = gpio_reg->SWPORT_DR;

    value &= ~(mask);
    value |= gpio_priv->value;
    gpio_reg->SWPORT_DR = value;
    return 0;
}

/**
 * Configure a GPIO gpio_set_irq_mode.
 * @param[in]   pin         the addr store the pin num.
 * @param[in]   _irqmode    the irqmode of gpio
 * @return      zero on success. -1 on falure.
 */
static int32_t gpio_set_irq_mode(gpio_pin_handle_t pin, gpio_irq_mode_e irq_mode)
{
    dw_gpio_pin_priv_t *gpio_pin_priv = pin;

    /* convert portidx to port handle */
    dw_gpio_priv_t * port_handle = &gpio_handle[gpio_pin_priv->portidx];

    dw_gpio_control_reg_t *gpio_control_reg = (dw_gpio_control_reg_t *)(port_handle->base + 0x30);
    uint32_t offset = gpio_pin_priv->idx;
    uint32_t mask = 1 << offset;

    switch (irq_mode) {
        /* rising edge interrupt mode */
        case GPIO_IRQ_MODE_RISING_EDGE:
            gpio_control_reg->INTTYPE_LEVEL |= mask;
            gpio_control_reg->INT_POLARITY |= mask;
            break;

        /* falling edge interrupt mode */
        case GPIO_IRQ_MODE_FALLING_EDGE:
            gpio_control_reg->INTTYPE_LEVEL |= mask;
            gpio_control_reg->INT_POLARITY &= (~mask);
            break;

        /* low level interrupt mode */
        case GPIO_IRQ_MODE_LOW_LEVEL:
            gpio_control_reg->INTTYPE_LEVEL &= (~mask);
            gpio_control_reg->INT_POLARITY &= (~mask);
            break;

        /* high level interrupt mode */
        case GPIO_IRQ_MODE_HIGH_LEVEL:
            gpio_control_reg->INTTYPE_LEVEL &= (~mask);
            gpio_control_reg->INT_POLARITY |= mask;
            break;

        /* double edge interrupt mode */
        case GPIO_IRQ_MODE_DOUBLE_EDGE:
            return ERR_GPIO(DRV_ERROR_UNSUPPORTED);

        default:
            return ERR_GPIO(GPIO_ERROR_IRQ_MODE);
    }

    return 0;
}

/*
 * Clear one or more interrupts of PortA.
 * Parameters:
 *   pinno:
 * return: SUCCESS.
 */

static void gpio_irq_clear(gpio_pin_handle_t pin, uint32_t idx)
{
    dw_gpio_pin_priv_t *gpio_pin_priv = pin;

    /* convert portidx to port handle */
    dw_gpio_priv_t * port_handle = &gpio_handle[gpio_pin_priv->portidx];

    dw_gpio_control_reg_t *gpio_control_reg = (dw_gpio_control_reg_t *)(port_handle->base + 0x30);

    gpio_control_reg->PORTA_EOI = idx;
}


/*
 * Enable one or more interrupts of PortA.
 * Parameters:
 *   pinno:
 * return: SUCCESS.
 */
static void gpio_irq_enable(gpio_pin_handle_t pin)
{
    dw_gpio_pin_priv_t *gpio_pin_priv = pin;

    /* convert portidx to port handle */
    dw_gpio_priv_t * port_handle = &gpio_handle[gpio_pin_priv->portidx];

    dw_gpio_control_reg_t *gpio_control_reg = (dw_gpio_control_reg_t *)(port_handle->base + 0x30);
    uint32_t offset = gpio_pin_priv->idx;
    uint32_t val = gpio_control_reg->INTEN;
    val |= (1 << offset);
    gpio_control_reg->INTEN = val;
}


/*
 * Disable one or more interrupts of PortA.
 * Parameters:
 *   pinno:
 * return: SUCCESS.
 */

static void gpio_irq_disable(gpio_pin_handle_t pin)
{
    dw_gpio_pin_priv_t *gpio_pin_priv = pin;
    uint32_t offset = gpio_pin_priv->idx;

    /* convert portidx to port handle */
    dw_gpio_priv_t * port_handle = &gpio_handle[gpio_pin_priv->portidx];

    dw_gpio_control_reg_t *gpio_control_reg = (dw_gpio_control_reg_t *)(port_handle->base + 0x30);
    uint32_t val = gpio_control_reg->INTEN;
    val &= ~(1 << offset);
    gpio_control_reg->INTEN = val;
}

void dw_gpio_irqhandler(int idx)
{
    dw_gpio_control_reg_t *gpio_control_reg = (dw_gpio_control_reg_t *)(gpio_handle[idx].base + 0x30);

    uint32_t value = gpio_control_reg->INTSTATUS;
    uint8_t i;

    /* find the interrput pin */
    for (i = 0; i < 32; i++) {
        if (value == (1 << i)) {
            break;
        }
    }

    uint32_t offset = i;
    uint32_t pin_idx = offset;

    for (i = 0; i < idx; i++) {
        pin_idx += gpio_handle[i].pin_num;
    }

    dw_gpio_pin_priv_t *gpio_pin_priv = (dw_gpio_pin_priv_t *)&gpio_pin_handle[pin_idx];

    /* execute the callback function */
    if ((gpio_event_cb_t)(gpio_pin_priv->cb) && offset != 32) {
        ((gpio_event_cb_t)(gpio_pin_priv->cb))(pin_idx);
    }
    gpio_irq_clear(gpio_pin_priv, value);  //clear the gpio interrupt
}

/**
  \brief       Initialize GPIO module. 1. Initializes the resources needed for the GPIO handle 2.registers event callback function
                3.get gpio_port_handle
  \param[in]   port      port_name.
  \return      gpio_port_handle
*/
gpio_port_handle_t csi_gpio_port_initialize(int32_t port)
{
    uint32_t i;
    dw_gpio_priv_t *gpio_priv = NULL;

    for (i = 0; i <= port; i++) {
        /* obtain the gpio port information */
        uint32_t base = 0u;
        uint32_t pin_num;
        uint32_t irq;
        uint32_t idx = target_gpio_port_init(i, &base, &irq, &pin_num);

        if (idx < 0 || idx >= CONFIG_GPIO_NUM) {
            return NULL;
        }

        gpio_priv = &gpio_handle[idx];

        gpio_priv->base = base;
        gpio_priv->irq  = irq;
        gpio_priv->pin_num  = pin_num;
    }

    csi_vic_enable_irq(gpio_priv->irq);

    return (gpio_port_handle_t)gpio_priv;
}

////////////////////////////////// Public //////////////////////////////////////
/**
 * @brief       ISR call-back registration
 * @param[i]    cb:     pointer to customer ISR when EXI is called 
 * @param[i]    idx:    exi isr number to be initialized
 * @return      zero on success
*/
int32_t csi_gpio_exi_cb_init (gpio_event_cb_t cb, uint32_t idx)
{
    GPIO_NULL_PARAM_CHK(cb);
    if ((idx < 0)||(idx>4)) {
        return ERR_GPIO(DRV_ERROR_PARAMETER);
    }

    // transfer call-back pointer to global storage variable
    switch (idx) {
        case 0:
        #ifdef ISR_SUPPORT_EXI0
            gpio_cb_pin0 = cb;
        #endif
            break;
        case 1:
        #ifdef ISR_SUPPORT_EXI0
            gpio_cb_pin1 = cb;
        #endif
            break;
        case 2:
        #ifdef ISR_SUPPORT_EXI0
            gpio_cb_pin2to3 = cb;
        #endif
            break;
        case 3:
        #ifdef ISR_SUPPORT_EXI0
            gpio_cb_pin4to9 = cb;
        #endif
            break;
        case 4:
        #ifdef ISR_SUPPORT_EXI0
            gpio_cb_pin10to15 = cb;
        #endif
            break;
        default:
            gpio_cb_pin0 = NULL;
            gpio_cb_pin1 = NULL;
            gpio_cb_pin2to3 = NULL;
            gpio_cb_pin4to9 = NULL;
            gpio_cb_pin10to15 = NULL;
    }

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
  @brief       Individual pin config, including all characteristics.
  @param[in]   gpio_pin    pin name.
  @param[in]   pin_mode    pin mode.
  @param[in]   pin_pd      pin pull-up/down config
  @param[in]   pin_omcr    pin slew-rate and drive strength
  @param[in]   pin_odm     pin open-drain or push-pull
  @return      error code
*/
int32_t csi_gpio_pin_func_config(gpio_pin_name gpio_pin, gpio_mode_e pin_mode, gpio_pull_e pdmode, gpio_char_e omcr)
{

    if (gpio_pin < 0 || gpio_pin >= CONFIG_GPIO_PIN_NUM) {
        return NULL;
    }
    uint32_t i;
    for (i = 0; i < CONFIG_GPIO_NUM; i++) {
        csi_gpio_port_initialize(i);
    }
    /* obtain the gpio pin information */
    uint32_t port_idx;
    uint32_t pin_idx = target_gpio_pin_init(gpio_pin, &port_idx);

    uint32_t idx = pin_idx;

    for (i = 0; i < port_idx; i++) {
        idx += (gpio_handle[i].pin_num);
    }

    dw_gpio_pin_priv_t *gpio_pin_priv = &(gpio_pin_handle[idx]);
    gpio_pin_priv->portidx = port_idx;


    gpio_pin_priv->idx = pin_idx;
    gpio_pin_priv->cb = cb_event;

    return (gpio_pin_handle_t)gpio_pin_priv;
}


/**
  \brief       config pin mode
  \param[in]   pin       gpio pin handle to operate.
  \param[in]   mode      \ref gpio_mode_e
  \return      error code
*/
int32_t csi_gpio_pin_config_mode(gpio_pin_handle_t handle,
                            gpio_mode_e mode)
{
    return ERR_GPIO(DRV_ERROR_UNSUPPORTED);
}
/**
  \brief       config pin direction
  \param[in]   pin       gpio pin handle to operate.
  \param[in]   dir       \ref gpio_direction_e
  \return      error code
*/
int32_t csi_gpio_pin_config_direction(gpio_pin_handle_t handle,
                            gpio_direction_e dir)
{
    GPIO_NULL_PARAM_CHK(handle);

    /* config the gpio pin mode direction mask bits */
    dw_gpio_pin_priv_t *gpio_pin_priv = handle;

    /* convert portidx to port handle */
    dw_gpio_priv_t * gpio_priv = &gpio_handle[gpio_pin_priv->portidx];

    gpio_priv->dir = dir;
    gpio_priv->mask = 1 << gpio_pin_priv->idx;

    uint32_t ret = gpio_set_direction(gpio_priv, dir);
    if(ret) {
        return ret;
    }

    return 0;
}

/**
  \brief       config pin
  \param[in]   handle       gpio pin handle to operate.
  \param[in]   mode      \ref gpio_mode_e
  \param[in]   dir       \ref gpio_direction_e
  \return      error code
*/
int32_t csi_gpio_pin_config(gpio_pin_handle_t handle,
                            gpio_mode_e mode,
                            gpio_direction_e dir)
{
    GPIO_NULL_PARAM_CHK(handle);

    /* config the gpio pin mode direction mask bits */
    dw_gpio_pin_priv_t *gpio_pin_priv = handle;

    /* convert portidx to port handle */
    dw_gpio_priv_t * gpio_priv = &gpio_handle[gpio_pin_priv->portidx];

    gpio_priv->mode = mode;
    gpio_priv->dir = dir;
    gpio_priv->mask = 1 << gpio_pin_priv->idx;

    uint32_t ret = gpio_set_direction(gpio_priv, dir);
    if(ret) {
        return ret;
    }

    return 0;

}

/**
  \brief       Set one or zero to the selected GPIO pin.
  \param[in]   handle       gpio pin handle to operate.
  \param[in]   value     the value to be set
  \return      error code
*/
int32_t csi_gpio_pin_write(gpio_pin_handle_t handle, bool value)
{
    GPIO_NULL_PARAM_CHK(handle);
    if ((int32_t)value < 0) {
        return ERR_GPIO(DRV_ERROR_PARAMETER);
    }

    dw_gpio_pin_priv_t *gpio_pin_priv = handle;

    /* convert portidx to port handle */
    dw_gpio_priv_t * port_handle = &gpio_handle[gpio_pin_priv->portidx];

    uint8_t offset = gpio_pin_priv->idx;
    uint32_t port_value = value << offset;

    port_handle->value = port_value;
    gpio_write(port_handle, (1 << offset));

    return 0;

}

/**
  \brief       Get the value of  selected GPIO pin.
  \param[in]   handle       gpio pin handle to operate.
  \param[out]  value     buf to store the pin value
  \return      error code
*/
int32_t csi_gpio_pin_read(gpio_pin_handle_t handle, bool *value)
{
    GPIO_NULL_PARAM_CHK(handle);
    if (value <= 0) {
        return ERR_GPIO(DRV_ERROR_PARAMETER);
    }

    dw_gpio_pin_priv_t *gpio_pin_priv = handle;
    uint32_t port_value;
    uint8_t offset = gpio_pin_priv->idx;

    /* convert portidx to port handle */
    dw_gpio_priv_t * port_handle = &gpio_handle[gpio_pin_priv->portidx];

    gpio_read(port_handle, &port_value);
    *value = (port_value & (1 << offset)) >> offset;

    return 0;
}

/**
  \brief       set GPIO interrupt mode.
  \param[in]   handle       gpio pin handle to operate.
  \param[in]   mode      the irq mode to be set
  \param[in]   enable    the enable flag
  \return      error code
*/
int32_t csi_gpio_pin_set_irq(gpio_pin_handle_t handle, gpio_irq_mode_e mode, bool enable)
{
    GPIO_NULL_PARAM_CHK(handle);

    uint32_t ret = 0;

    ret = gpio_set_irq_mode(handle, mode);

    if (ret) {
        return ret;
    }

    if (enable) {
        gpio_irq_enable(handle);

    } else {
        gpio_irq_disable(handle);

    }

    return ret;

}

