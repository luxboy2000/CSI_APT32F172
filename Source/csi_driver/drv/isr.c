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
//@file     isr.c
//@brief    source file for the interrupt server route
//@version  V1.0
//@date     02. Sept 2019
//*****************************************************************************
#include <apt_common.h>
#include <csi_config.h>
#include <apt_syscon.h>
#include <apt_gpio.h>

#ifndef CONFIG_KERNEL_NONE
#include <csi_kernel.h>
#endif

#define  ATTRIBUTE_WEAK __attribute__((weak))
#define  ATTRIBUTE_ISR __attribute__((isr))

#define readl(addr) \
    ({ unsigned int __v = (*(volatile unsigned int *) (addr)); __v; })

#ifndef CONFIG_KERNEL_NONE
#define  CSI_INTRPT_ENTER() csi_kernel_intrpt_enter()
#define  CSI_INTRPT_EXIT()  csi_kernel_intrpt_exit()
#else
#define  CSI_INTRPT_ENTER()
#define  CSI_INTRPT_EXIT()
#endif

extern void systick_handler(void);
extern void xPortSysTickHandler(void);
extern void OSTimeTick(void);

extern gpio_event_cb_t gpio_exi_cb;
extern syscon_event_cb_t syscon_event_cb;

ATTRIBUTE_WEAK void ck_coret_irqhandler(void) {
    readl(0xE000E010);
}

//ATTRIBUTE_WEAK void isr_syscon_irqhandler(void) {
//    H_SYSCON->ICR = 0xffffffff;
//}

ATTRIBUTE_WEAK void isr_ifc_irqhandler(void) {
//    H_IFC->ICR = 0xffffffff;
}

ATTRIBUTE_WEAK void isr_adc_irqhandler(void) {
//    handle->CSR = 0xffffffff;
}

ATTRIBUTE_WEAK void isr_tc0_0_irqhandler(void) {
//    H_TC0->CH[0].CSR = 0xffffffff;
}

ATTRIBUTE_WEAK void isr_tc0_1_irqhandler(void) {
//    H_TC0->CH[1].CSR = 0xffffffff;
}

ATTRIBUTE_WEAK void isr_tc0_2_irqhandler(void) {
//    H_TC0->CH[2].CSR = 0xffffffff;
}

ATTRIBUTE_WEAK void isr_tc1_irqhandler(void) {
//    H_TC1->ICR = 0xffffffff;
}

ATTRIBUTE_WEAK void isr_tc2_irqhandler(void) {
//    H_TC2->ICR = 0xffffffff;
}

ATTRIBUTE_WEAK void isr_tc3_irqhandler(void) {
//    H_TC3->ICR = 0xffffffff;
}

ATTRIBUTE_WEAK void isr_led_irqhandler(void) {
//    H_LED->ICR = 0xffffffff;
}

ATTRIBUTE_WEAK void isr_epwm_irqhandler(void) {
//    H_EPWM->ICR = 0xffffffff;
}

//ATTRIBUTE_WEAK void isr_exi_irqhandler(uint32_t exi_num)
//{
//    H_SYSCON->EXICR = 0xffffffff;
//}

ATTRIBUTE_WEAK void isr_usart_irqhandler(void)
{
//    handle->ICR = 0xffffffff;
}

ATTRIBUTE_WEAK void isr_uart_irqhandler(void)
{
//    handle->ISR = 0xffffffff;
}

ATTRIBUTE_WEAK void isr_i2c_irqhandler(void)
{
//    handle->CR &= ~(0x1ul<<4);
}

ATTRIBUTE_WEAK void isr_spi_irqhandler(void)
{
//    handle->ICR = 0xffffffff;
}

ATTRIBUTE_WEAK void isr_tkey_irqhandler(void)
{
//    H_TKEY->ICR = 0xffffffff;
}

ATTRIBUTE_WEAK void isr_comp0_irqhandler(void)
{
//    H_CMP->ICR = 0xffffffff;
}

ATTRIBUTE_WEAK void isr_comp1_irqhandler(void)
{
//    H_CMP->ICR = 0xffffffff;
}




ATTRIBUTE_ISR void CORET_IRQHandler(void)
{
#ifndef CONFIG_KERNEL_NONE
    #ifndef CONFIG_KERNEL_FREERTOS
        CSI_INTRPT_ENTER();
    #endif
    
        readl(0xE000E010);
    
    #if defined(CONFIG_KERNEL_RHINO)
        systick_handler();
    #elif defined(CONFIG_KERNEL_FREERTOS)
        xPortSysTickHandler();
    #elif defined(CONFIG_KERNEL_UCOS)
        OSTimeTick();
    #endif
    
    #ifndef CONFIG_KERNEL_FREERTOS
        CSI_INTRPT_EXIT();
    #endif
#else
    ck_coret_irqhandler();
#endif
}

ATTRIBUTE_ISR void SYSCON_IRQHandler(void)
{
    CSI_INTRPT_ENTER();

    if (H_SYSCON->ISR & (1ul<<ISOSTBL_EVENT)) {
        syscon_event_cb (ISOSTBL_EVENT);
        H_SYSCON->ICR = (1ul<<ISOSTBL_EVENT);
    } else if (H_SYSCON->ISR & (1ul<<IMOSTBL_EVENT)) {
        syscon_event_cb (IMOSTBL_EVENT);
        H_SYSCON->ICR = (1ul<<IMOSTBL_EVENT);
    } else if (H_SYSCON->ISR & (1ul<<EMOSTBL_EVENT)) {
        syscon_event_cb (EMOSTBL_EVENT);
        H_SYSCON->ICR = (1ul<<EMOSTBL_EVENT);
    } else if (H_SYSCON->ISR & (1ul<<SYSCLK_EVENT)) {
        syscon_event_cb (SYSCLK_EVENT);
        H_SYSCON->ICR = (1ul<<SYSCLK_EVENT);
    } else if (H_SYSCON->ISR & (1ul<<IWDTINT_EVENT)) {
        syscon_event_cb (IWDTINT_EVENT);
        H_SYSCON->ICR = (1ul<<IWDTINT_EVENT);
    } else if (H_SYSCON->ISR & (1ul<<LVDINT_EVENT)) {
        syscon_event_cb (LVDINT_EVENT);
        H_SYSCON->ICR = (1ul<<LVDINT_EVENT);
    } else if (H_SYSCON->ISR & (1ul<<EMFAIL_EVENT)) {
        syscon_event_cb (EMFAIL_EVENT);
        H_SYSCON->ICR = (1ul<<EMFAIL_EVENT);
    } else if (H_SYSCON->ISR & (1ul<<EMRCV_EVENT)) {
        syscon_event_cb (EMRCV_EVENT);
        H_SYSCON->ICR = (1ul<<EMRCV_EVENT);
    } else {
        syscon_event_cb (CMDERR_EVENT);
        H_SYSCON->ICR = (1ul<<CMDERR_EVENT);
    }

    CSI_INTRPT_EXIT();
}

ATTRIBUTE_ISR void IFC_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    isr_ifc_irqhandler();
    CSI_INTRPT_EXIT();
}

ATTRIBUTE_ISR void ADC_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    isr_adc_irqhandler();
    CSI_INTRPT_EXIT();
}

ATTRIBUTE_ISR void TC0_0_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    isr_tc0_0_irqhandler();
    CSI_INTRPT_EXIT();
}

ATTRIBUTE_ISR void TC0_1_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    isr_tc0_1_irqhandler();
    CSI_INTRPT_EXIT();
}

ATTRIBUTE_ISR void TC0_2_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    isr_tc0_2_irqhandler();
    CSI_INTRPT_EXIT();
}

ATTRIBUTE_ISR void TC1_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    isr_tc1_irqhandler();
    CSI_INTRPT_EXIT();
}

ATTRIBUTE_ISR void TC2_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    isr_tc2_irqhandler();
    CSI_INTRPT_EXIT();
}

ATTRIBUTE_ISR void TC3_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    isr_tc3_irqhandler();
    CSI_INTRPT_EXIT();
}

ATTRIBUTE_ISR void LED_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    isr_led_irqhandler();
    CSI_INTRPT_EXIT();
}

ATTRIBUTE_ISR void EPWM_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    isr_epwm_irqhandler();
    CSI_INTRPT_EXIT();
}

ATTRIBUTE_ISR void EXI0_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    gpio_exi_cb(EXI_EVENT_0);
    H_SYSCON->EXICR = 1ul<<EXI_EVENT_0;
    CSI_INTRPT_EXIT();
}

ATTRIBUTE_ISR void EXI1_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    gpio_exi_cb(EXI_EVENT_1);
    H_SYSCON->EXICR = 1ul<<EXI_EVENT_1;
    CSI_INTRPT_EXIT();
}

ATTRIBUTE_ISR void EXI2_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    if (H_SYSCON->EXICR & (1ul<<EXI_EVENT_2)) {
        gpio_exi_cb(EXI_EVENT_2);
        H_SYSCON->EXICR = (1ul<<EXI_EVENT_2);
    } else {
        gpio_exi_cb(EXI_EVENT_3);
        H_SYSCON->EXICR = (1ul<<EXI_EVENT_3);
    }
    CSI_INTRPT_EXIT();
}

ATTRIBUTE_ISR void EXI3_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    if (H_SYSCON->EXICR & (1ul<<EXI_EVENT_4)) {
        gpio_exi_cb(EXI_EVENT_4);
        H_SYSCON->EXICR = (1ul<<EXI_EVENT_4);
    } else if (H_SYSCON->EXICR & (1ul<<EXI_EVENT_5)) {
        gpio_exi_cb(EXI_EVENT_5);
        H_SYSCON->EXICR = (1ul<<EXI_EVENT_5);
    } else if (H_SYSCON->EXICR & (1ul<<EXI_EVENT_6)) {
        gpio_exi_cb(EXI_EVENT_6);
        H_SYSCON->EXICR = 1ul<<EXI_EVENT_6;
    } else if (H_SYSCON->EXICR & (1ul<<EXI_EVENT_7)) {
        gpio_exi_cb(EXI_EVENT_7);
        H_SYSCON->EXICR = 1ul<<EXI_EVENT_7;
    } else if (H_SYSCON->EXICR & (1ul<<EXI_EVENT_8)) {
        gpio_exi_cb(EXI_EVENT_8);
        H_SYSCON->EXICR = 1ul<<EXI_EVENT_8;
    } else {
        gpio_exi_cb(EXI_EVENT_9);
        H_SYSCON->EXICR = 1ul<<EXI_EVENT_9;
    }
    CSI_INTRPT_EXIT();
}

ATTRIBUTE_ISR void EXI4_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    if (H_SYSCON->EXICR & (1ul<<EXI_EVENT_10)) {
        gpio_exi_cb(EXI_EVENT_10);
        H_SYSCON->EXICR = 1ul<<EXI_EVENT_10;
    } else if (H_SYSCON->EXICR & (1ul<<EXI_EVENT_11)) {
        gpio_exi_cb(EXI_EVENT_11);
        H_SYSCON->EXICR = 1ul<<EXI_EVENT_11;
    } else if (H_SYSCON->EXICR & (1ul<<EXI_EVENT_12)) {
        gpio_exi_cb(EXI_EVENT_12);
        H_SYSCON->EXICR = 1ul<<EXI_EVENT_12;
    } else if (H_SYSCON->EXICR & (1ul<<EXI_EVENT_13)) {
        gpio_exi_cb(EXI_EVENT_13);
        H_SYSCON->EXICR = 1ul<<EXI_EVENT_13;
    } else if (H_SYSCON->EXICR & (1ul<<EXI_EVENT_14)) {
        gpio_exi_cb(EXI_EVENT_14);
        H_SYSCON->EXICR = 1ul<<EXI_EVENT_14;
    } else {
        gpio_exi_cb(EXI_EVENT_15);
        H_SYSCON->EXICR = 1ul<<EXI_EVENT_15;
    }
    CSI_INTRPT_EXIT();
}

ATTRIBUTE_ISR void UART0_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
//    isr_usart_irqhandler(H_UART0);
    CSI_INTRPT_EXIT();
}

ATTRIBUTE_ISR void UART1_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
//    isr_uart_irqhandler(H_UART1);
    CSI_INTRPT_EXIT();
}

ATTRIBUTE_ISR void I2C0_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
//    isr_i2c_irqhandler(H_I2C);
    CSI_INTRPT_EXIT();
}

ATTRIBUTE_ISR void SPI0_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
//    isr_spi_irqhandler(H_SPI);
    CSI_INTRPT_EXIT();
}

ATTRIBUTE_ISR void TKEY_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
//    isr_tkey_irqhandler();
    CSI_INTRPT_EXIT();
}

ATTRIBUTE_ISR void CMP0_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
//    isr_comp0_irqhandler();
    CSI_INTRPT_EXIT();
}

ATTRIBUTE_ISR void CMP1_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    isr_comp1_irqhandler();
    CSI_INTRPT_EXIT();
}

