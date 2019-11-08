/*
 * Copyright (C) 2019 APTCHIP Microelectronics Co., Ltd. All rights reserved.
 *
 *   http://www.aptchip.com
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 */

///***************************************************************************
// @file     startup.S
// @brief    startup file for CSKY processor embedded platform 
//           used along with GCC
// @version  V1.0
// @date     02. Sept 2019
//****************************************************************************

#include <csi_config.h>

#undef  VIC_TSPR
#define VIC_TSPR  0xE000EC10

// Protection Option Check
#ifdef  CODE_SEC_RDP
    #define RPD_SECT 0x55000000
#else
    #define RDP_SECT 0x00000000 
#endif

#ifdef  CODE_SEC_SDP
    #define SDP_SECT 0x00005500
#else
    #define SDP_SECT 0x00000000 
#endif

#ifdef  CODE_CIP_SDP
    #define CIP_SECT 0x000000A5
#else
    #define CIP_SECT 0x00000000 
#endif

#define UserOption (RDP_SECT|SDP_SECT|CIP_SECT)

.import tspend_handler
.import Default_Handler

	.section .vectors
	.align 10
	.globl	__Vectors
	.type	__Vectors, @object    /* Define __Vectors as variable, to referred in C */
__Vectors:
	.long	Reset_Handler         /* 0: Reset Handler */
	.long   Default_Handler	      /* 1: Unaligned Access Exception*/
	.long   Default_Handler       /* 2: Access Error Exception */
	.long   Default_Handler       /* 3: Rsvd */
	.long   Default_Handler       /* 4: Unsupported Instruction */
	.long   Default_Handler       /* 5: Priviege Violation*/
	.long   Default_Handler       /* 6: Rsvd */
	.long   Default_Handler       /* 7: BreakPoint*/
	.long   Default_Handler       /* 8: Unrecoverable Exception*/
	.long   Default_Handler       /* 9: Rsvd */
	.long   Default_Handler       /*10: Rsvd */
	.long   Default_Handler       /*11: Rsvd */
	.long   Default_Handler       /*12: Rsvd */
	.long   Default_Handler       /*13: Rsvd */
	.long   Default_Handler       /*14: Rsvd */
	.long   Default_Handler       /*15: Rsvd */
	.long   Default_Handler       /*16: TRAP#1 */
	.long   Default_Handler       /*17: TRAP#2 */
	.long   Default_Handler       /*18: TRAP#3 */
	.long   Default_Handler       /*19: TRAP#4 */
	.long   Default_Handler       /*20: Rsvd */
	.long   Default_Handler       /*21: Rsvd */
#ifndef CONFIG_KERNEL_NONE
	.long   tspend_handler        /*22: TSPEND */
#else
	.long   Default_Handler       /*22: Rsvd */
#endif
	.long   Default_Handler       /*23: Rsvd */
	.long   Default_Handler       /*24: Rsvd */
	.long   Default_Handler       /*25: Rsvd */
	.long   Default_Handler       /*26: Rsvd */
	.long   Default_Handler       /*27: Rsvd */
	.long   Default_Handler       /*28: Rsvd */
	.long   Default_Handler       /*29: Rsvd */
	.long   Default_Handler       /*30: Rsvd */
	.long   Default_Handler       /*31: Rsvd */

	/* External interrupts */
	.long	CORET_IRQHandler      /*   0:  CORET        */
	.long   SYSCON_IRQHandler     /*   1:  SYSCON       */
	.long	IFC_IRQHandler        /*   2:  IFC          */
	.long	ADC_IRQHandler        /*   3:  ADC          */
	.long	TC0_0_IRQHandler      /*   4:  16bit TC     */
	.long	TC0_1_IRQHandler      /*   5:  16bit TC     */
	.long	TC0_2_IRQHandler      /*   6:  16bit TC     */
	.long	EXI0_IRQHandler       /*   7:  EXI1         */
	.long	EXI1_IRQHandler       /*   8:  EXI1         */
	.long	EPWM_IRQHandler       /*   9:  EPWM         */
	.long	TC1_IRQHandler        /*  10:  32bit TC     */
	.long	TC2_IRQHandler        /*  11:  Simple Timer */
	.long	TC3_IRQHandler        /*  12:  Watch Timer  */
	.long	UART0_IRQHandler      /*  13:  UART0        */
	.long	UART1_IRQHandler      /*  14:  UART1        */
	.long	Default_Handler       /*  15:  Rsvd         */
	.long	Default_Handler       /*  16:  Rsvd         */
	.long	I2C0_IRQHandler       /*  17:  I2C          */
	.long	Default_Handler       /*  18:  Rsvd         */
	.long	SPI0_IRQHandler       /*  19:  SPI          */
	.long   Default_Handler       /*  20:  Rsvd         */
	.long   EXI2_IRQHandler       /*  21:  EXI2         */
	.long   EXI3_IRQHandler       /*  22:  EXI3         */
	.long   EXI4_IRQHandler       /*  23:  EXI4         */
	.long   Default_Handler       /*  24:  Rsvd         */
	.long   TKEY_IRQHandler       /*  25:  TKEY         */
	.long   Default_Handler       /*  26:  Rsvd         */
	.long   LED_IRQHandler        /*  27:  LED          */
	.long   CMP0_IRQHandler       /*  28:  CMP0,2       */
	.long   CMP1_IRQHandler       /*  29:  CMP1,3,4     */
	.long   Default_Handler       /*  30:  Rsvd         */
	.long   Default_Handler       /*  31:  Rsvd         */

	.size	__Vectors, . - __Vectors

	.text
	.align	1
    .long   UserOption

_start:
	.text
	.align	1
	.globl	Reset_Handler
	.type	Reset_Handler, %function
Reset_Handler:
    /* under normal circumstances,  it should not be opened */

#ifndef CONFIG_SYSTEM_SECURE
    lrw   r0, 0x80000000
    mtcr  r0, psr
#endif

/* Initialize the normal stack pointer from the linker definition. */
    lrw a1, __StackTop
    mov sp, a1

/*
 *  The ranges of copy from/to are specified by following symbols
 *    __etext: LMA of start of the section to copy from. Usually end of text
 *    __data_start__: VMA of start of the section to copy to
 *    __data_end__: VMA of end of the section to copy to
 *
 *  All addresses must be aligned to 4 bytes boundary.
 */
	lrw	r1, __erodata
	lrw	r2, __data_start__
	lrw	r3, __data_end__

	subu	r3, r2
	cmpnei	r3, 0
	bf	.L_loop0_done

.L_loop0:
	ldw	r0, (r1, 0)
	stw	r0, (r2, 0)
	addi	r1, 4
	addi	r2, 4
	subi	r3, 4
	cmpnei	r3, 0
	bt	.L_loop0

.L_loop0_done:

/*
 *  The BSS section is specified by following symbols
 *    __bss_start__: start of the BSS section.
 *    __bss_end__: end of the BSS section.
 *
 *  Both addresses must be aligned to 4 bytes boundary.
 */
	lrw	r1, __bss_start__
	lrw	r2, __bss_end__

	movi	r0, 0

	subu	r2, r1
	cmpnei	r2, 0
	bf	.L_loop1_done

.L_loop1:
	stw	r0, (r1, 0)
	addi	r1, 4
	subi	r2, 4
	cmpnei	r2, 0
	bt	.L_loop1
.L_loop1_done:

#ifdef CONFIG_SEPARATE_IRQ_SP
        /* init hardware separate interrupt sp*/
        lrw    r0, g_top_irqstack
        mtcr   r0, cr<15, 1>

        mfcr   r0, cr<31, 0>
        bseti  r0, 14
        mtcr   r0, cr<31, 0>
#endif

#ifndef __NO_SYSTEM_INIT
	bsr	SystemInit
#endif

#ifndef __NO_BOARD_INIT
	//bsr	board_init
#endif

#ifndef CONFIG_KERNEL_NONE
        /* tspend init*/
	lrw    r0, VIC_TSPR
	movi   r1, 0xb00
	stw    r1, (r0)
#endif

	bsr	main    // call main
	.size	Reset_Handler, . - Reset_Handler

__exit:
    br __exit

.section .bss

	.align  2
	.globl  g_intstackalloc
	.global g_intstackbase
	.global g_top_irqstack
g_intstackalloc:
g_intstackbase:
	.space CONFIG_ARCH_INTERRUPTSTACK
g_top_irqstack:

	.end
