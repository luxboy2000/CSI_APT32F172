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
 //* @file     vectors.S
 //* @brief    define default vector handlers. Should use with
 //*           GCC for CSKY Embedded Processors
 //* @version  V1.0
 //* @date     02. Sept 2019
 //******************************************************************************

.import trap_c

.text

/******************************************************************************
 * Functions:
 *     void trap(void);
 * default exception handler
 ******************************************************************************/
    .global trap
    .type   trap, %function
trap:
    psrset  ee

    mov     r0, r0
    subi    sp, 72
#if defined(__CK802__)   
	stm     r0-r13, (sp)
#elif defined(__CK801__)
	stw		r0, (sp)
	stw		r1, (sp,0x4)
	stw		r2, (sp,0x8)
	stw		r3, (sp,0xc)
	stw		r4, (sp,0x10)
	stw		r5, (sp,0x14)
	stw		r6, (sp,0x18)
	stw		r7, (sp,0x1c)
	stw		r8, (sp,0x20)
	stw		r13, (sp,0x24)
#endif
	mov     r0, sp
    addi    r0, 72
    stw     r0, (sp, 56)
    stw     r15, (sp, 60)
    mfcr    r0, epsr
    stw     r0, (sp, 64)
    mfcr    r0, epc
    stw     r0, (sp, 68)
    mov     r0, sp

    /* for backtrace */
    subi    sp, 8
    stw     r8, (sp, 0)
    stw     r15, (sp, 4)
    mov     r8, sp

    lrw     r1, trap_c
    jmp     r1


    .align  1
    .weak   Default_Handler
    .type   Default_Handler, %function
Default_Handler:
    br      trap
    .size   Default_Handler, . - Default_Handler

/*    Macro to define default handlers. Default handler
 *    will be weak symbol and just dead loops. They can be
 *    overwritten by other handlers */
    .macro  def_irq_handler handler_name
    .weak   \handler_name
    .globl  \handler_name
    .set    \handler_name, Default_Handler
    .endm

    def_irq_handler CORET_IRQHandler
    def_irq_handler SYSCON_IRQHandle
    def_irq_handler IFC_IRQHandler  
    def_irq_handler ADC_IRQHandler  
    def_irq_handler TC0_0_IRQHandler
    def_irq_handler TC0_1_IRQHandler
    def_irq_handler TC0_2_IRQHandler
    def_irq_handler EXI0_IRQHandler 
    def_irq_handler EXI1_IRQHandler 
    def_irq_handler EPWM_IRQHandler 
    def_irq_handler TC1_IRQHandler  
    def_irq_handler TC2_IRQHandler  
    def_irq_handler TC3_IRQHandler  
    def_irq_handler UART0_IRQHandler
    def_irq_handler UART1_IRQHandler
    def_irq_handler I2C0_IRQHandler 
    def_irq_handler SPI0_IRQHandler 
    def_irq_handler EXI2_IRQHandler 
    def_irq_handler EXI3_IRQHandler 
    def_irq_handler EXI4_IRQHandler 
    def_irq_handler TKEY_IRQHandler 
    def_irq_handler LED_IRQHandler  
    def_irq_handler CMP0_IRQHandler 
    def_irq_handler CMP1_IRQHandler 
