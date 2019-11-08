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
#include <drv_common.h>
#include <csi_config.h>
#include "soc.h"
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

ATTRIBUTE_WEAK void ck_coret_irqhandler(void) {
    readl(0xE000E010);
}

ATTRIBUTE_WEAK void isr_syscon_irqhandler(void) {
    H_SYSCON->ICR = 0xffffffff;
}

ATTRIBUTE_WEAK void isr_ifc_irqhandler(void) {
    H_IFC->ICR = 0xffffffff;
}

ATTRIBUTE_WEAK void isr_adc_irqhandler(APT_ADC_Reg_t *handle) {
    handle->CSR = 0xffffffff;
}

ATTRIBUTE_WEAK void isr_tc0_0_irqhandler(void) {
    H_TC0->CH[0].CSR = 0xffffffff;
}

ATTRIBUTE_WEAK void isr_tc0_1_irqhandler(void) {
    H_TC0->CH[1].CSR = 0xffffffff;
}

ATTRIBUTE_WEAK void isr_tc0_2_irqhandler(void) {
    H_TC0->CH[2].CSR = 0xffffffff;
}

ATTRIBUTE_WEAK void isr_tc1_irqhandler(void) {
    H_TC1->ICR = 0xffffffff;
}

ATTRIBUTE_WEAK void isr_tc2_irqhandler(void) {
    H_TC2->ICR = 0xffffffff;
}

ATTRIBUTE_WEAK void isr_tc3_irqhandler(void) {
    H_TC3->ICR = 0xffffffff;
}

ATTRIBUTE_WEAK void isr_led_irqhandler(void) {
    H_LED->ICR = 0xffffffff;
}

ATTRIBUTE_WEAK void isr_epwm_irqhandler(void) {
    H_EPWM->ICR = 0xffffffff;
}

ATTRIBUTE_WEAK void isr_exi_irqhandler(uint32_t exi_num)
{
    H_SYSCON->EXICR = 0xffffffff;
}

ATTRIBUTE_WEAK void isr_usart_irqhandler(APT_USART_Reg_t *handle)
{
    handle->ICR = 0xffffffff;
}

ATTRIBUTE_WEAK void isr_uart_irqhandler(APT_UART_Reg_t *handle)
{
    handle->ISR = 0xffffffff;
}

ATTRIBUTE_WEAK void isr_i2c_irqhandler(APT_I2C_Reg_t *handle)
{
    handle->CR &= ~(0x1ul<<4);
}

ATTRIBUTE_WEAK void isr_spi_irqhandler(APT_SPI_Reg_t *handle)
{
    handle->ICR = 0xffffffff;
}

ATTRIBUTE_WEAK void isr_tkey_irqhandler(void)
{
    H_TKEY->ICR = 0xffffffff;
}

ATTRIBUTE_WEAK void isr_comp0_irqhandler(void)
{
    H_CMP->ICR = 0xffffffff;
}

ATTRIBUTE_WEAK void isr_comp1_irqhandler(void)
{
    H_CMP->ICR = 0xffffffff;
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
    isr_syscon_irqhandler();
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
    isr_adc_irqhandler(H_ADC);
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
    isr_exi_irqhandler(0);
    CSI_INTRPT_EXIT();
}

ATTRIBUTE_ISR void EXI1_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    isr_exi_irqhandler(1);
    CSI_INTRPT_EXIT();
}

ATTRIBUTE_ISR void EXI2_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    isr_exi_irqhandler(2);
    CSI_INTRPT_EXIT();
}

ATTRIBUTE_ISR void EXI3_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    isr_exi_irqhandler(3);
    CSI_INTRPT_EXIT();
}

ATTRIBUTE_ISR void EXI4_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    isr_exi_irqhandler(4);
    CSI_INTRPT_EXIT();
}

ATTRIBUTE_ISR void UART0_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    isr_usart_irqhandler(H_UART0);
    CSI_INTRPT_EXIT();
}

ATTRIBUTE_ISR void UART1_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    isr_uart_irqhandler(H_UART1);
    CSI_INTRPT_EXIT();
}

ATTRIBUTE_ISR void I2C0_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    isr_i2c_irqhandler(H_I2C);
    CSI_INTRPT_EXIT();
}

ATTRIBUTE_ISR void SPI0_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    isr_spi_irqhandler(H_SPI);
    CSI_INTRPT_EXIT();
}

ATTRIBUTE_ISR void TKEY_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    isr_tkey_irqhandler();
    CSI_INTRPT_EXIT();
}

ATTRIBUTE_ISR void CMP0_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    isr_comp0_irqhandler();
    CSI_INTRPT_EXIT();
}

ATTRIBUTE_ISR void CMP1_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    isr_comp1_irqhandler();
    CSI_INTRPT_EXIT();
}

