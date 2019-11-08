
Obj/drv_startup.o:     file format elf32-csky-little


Disassembly of section .text:

00000000 <Reset_Handler-0x4>:
   0:	00000000 	.long	0x00000000

00000004 <Reset_Handler>:
	.type	Reset_Handler, %function
Reset_Handler:
    /* under normal circumstances,  it should not be opened */

#ifndef CONFIG_SYSTEM_SECURE
    lrw   r0, 0x80000000
   4:	1015      	lrw      	r0, 0x80000000	// 58 <__exit+0x2>
    mtcr  r0, psr
   6:	c0006420 	mtcr      	r0, cr<0, 0>
#endif

/* Initialize the normal stack pointer from the linker definition. */
    lrw a1, __StackTop
   a:	1035      	lrw      	r1, 0	// 5c <__exit+0x6>
    mov sp, a1
   c:	6f87      	mov      	sp, r1
 *    __data_start__: VMA of start of the section to copy to
 *    __data_end__: VMA of end of the section to copy to
 *
 *  All addresses must be aligned to 4 bytes boundary.
 */
	lrw	r1, __erodata
   e:	1035      	lrw      	r1, 0	// 60 <__exit+0xa>
	lrw	r2, __data_start__
  10:	1055      	lrw      	r2, 0	// 64 <__exit+0xe>
	lrw	r3, __data_end__
  12:	1076      	lrw      	r3, 0	// 68 <__exit+0x12>

	subu	r3, r2
  14:	60ca      	subu      	r3, r2
	cmpnei	r3, 0
  16:	3b40      	cmpnei      	r3, 0
	bf	.L_loop0_done
  18:	0c08      	bf      	0x28	// 28 <Reset_Handler+0x24>

.L_loop0:
	ldw	r0, (r1, 0)
  1a:	9100      	ld.w      	r0, (r1, 0)
	stw	r0, (r2, 0)
  1c:	b200      	st.w      	r0, (r2, 0)
	addi	r1, 4
  1e:	2103      	addi      	r1, 4
	addi	r2, 4
  20:	2203      	addi      	r2, 4
	subi	r3, 4
  22:	2b03      	subi      	r3, 4
	cmpnei	r3, 0
  24:	3b40      	cmpnei      	r3, 0
	bt	.L_loop0
  26:	0bfa      	bt      	0x1a	// 1a <Reset_Handler+0x16>
 *    __bss_start__: start of the BSS section.
 *    __bss_end__: end of the BSS section.
 *
 *  Both addresses must be aligned to 4 bytes boundary.
 */
	lrw	r1, __bss_start__
  28:	1031      	lrw      	r1, 0	// 6c <__exit+0x16>
	lrw	r2, __bss_end__
  2a:	1052      	lrw      	r2, 0	// 70 <__exit+0x1a>

	movi	r0, 0
  2c:	3000      	movi      	r0, 0

	subu	r2, r1
  2e:	6086      	subu      	r2, r1
	cmpnei	r2, 0
  30:	3a40      	cmpnei      	r2, 0
	bf	.L_loop1_done
  32:	0c06      	bf      	0x3e	// 3e <Reset_Handler+0x3a>

.L_loop1:
	stw	r0, (r1, 0)
  34:	b100      	st.w      	r0, (r1, 0)
	addi	r1, 4
  36:	2103      	addi      	r1, 4
	subi	r2, 4
  38:	2a03      	subi      	r2, 4
	cmpnei	r2, 0
  3a:	3a40      	cmpnei      	r2, 0
	bt	.L_loop1
  3c:	0bfc      	bt      	0x34	// 34 <Reset_Handler+0x30>
.L_loop1_done:

#ifdef CONFIG_SEPARATE_IRQ_SP
        /* init hardware separate interrupt sp*/
        lrw    r0, g_top_irqstack
  3e:	100e      	lrw      	r0, 0	// 74 <__exit+0x1e>
        mtcr   r0, cr<15, 1>
  40:	c020642f 	mtcr      	r0, cr<15, 1>

        mfcr   r0, cr<31, 0>
  44:	c01f6020 	mfcr      	r0, cr<31, 0>
        bseti  r0, 14
  48:	38ae      	bseti      	r0, r0, 14
        mtcr   r0, cr<31, 0>
  4a:	c000643f 	mtcr      	r0, cr<31, 0>
#endif

#ifndef __NO_SYSTEM_INIT
	bsr	SystemInit
  4e:	e0000000 	bsr      	0	// 0 <SystemInit>
	lrw    r0, VIC_TSPR
	movi   r1, 0xb00
	stw    r1, (r0)
#endif

	bsr	main    // call main
  52:	e0000000 	bsr      	0	// 0 <main>

00000056 <__exit>:
	.size	Reset_Handler, . - Reset_Handler

__exit:
    br __exit
  56:	0400      	br      	0x56	// 56 <__exit>
  58:	80000000 	.long	0x80000000
	...
