
Obj/drv_vectors.o:     file format elf32-csky-little


Disassembly of section .text:

00000000 <trap>:
 * default exception handler
 ******************************************************************************/
    .global trap
    .type   trap, %function
trap:
    psrset  ee
   0:	c1007420 	psrset      	ee

    mov     r0, r0
   4:	6c03      	mov      	r0, r0
    subi    sp, 72
   6:	1432      	subi      	r14, r14, 72
#if defined(__CK802__)   
	stm     r0-r13, (sp)
#elif defined(__CK801__)
	stw		r0, (sp)
   8:	b800      	st.w      	r0, (r14, 0x0)
	stw		r1, (sp,0x4)
   a:	b821      	st.w      	r1, (r14, 0x4)
	stw		r2, (sp,0x8)
   c:	b842      	st.w      	r2, (r14, 0x8)
	stw		r3, (sp,0xc)
   e:	b863      	st.w      	r3, (r14, 0xc)
	stw		r4, (sp,0x10)
  10:	b884      	st.w      	r4, (r14, 0x10)
	stw		r5, (sp,0x14)
  12:	b8a5      	st.w      	r5, (r14, 0x14)
	stw		r6, (sp,0x18)
  14:	b8c6      	st.w      	r6, (r14, 0x18)
	stw		r7, (sp,0x1c)
  16:	b8e7      	st.w      	r7, (r14, 0x1c)
	stw		r8, (sp,0x20)
  18:	dd0e2008 	st.w      	r8, (r14, 0x20)
	stw		r13, (sp,0x24)
  1c:	ddae2009 	st.w      	r13, (r14, 0x24)
#endif
	mov     r0, sp
  20:	6c3b      	mov      	r0, r14
    addi    r0, 72
  22:	2047      	addi      	r0, 72
    stw     r0, (sp, 56)
  24:	b80e      	st.w      	r0, (r14, 0x38)
    stw     r15, (sp, 60)
  26:	ddee200f 	st.w      	r15, (r14, 0x3c)
    mfcr    r0, epsr
  2a:	c0026020 	mfcr      	r0, cr<2, 0>
    stw     r0, (sp, 64)
  2e:	b810      	st.w      	r0, (r14, 0x40)
    mfcr    r0, epc
  30:	c0046020 	mfcr      	r0, cr<4, 0>
    stw     r0, (sp, 68)
  34:	b811      	st.w      	r0, (r14, 0x44)
    mov     r0, sp
  36:	6c3b      	mov      	r0, r14

    /* for backtrace */
    subi    sp, 8
  38:	1422      	subi      	r14, r14, 8
    stw     r8, (sp, 0)
  3a:	dd0e2000 	st.w      	r8, (r14, 0x0)
    stw     r15, (sp, 4)
  3e:	ddee2001 	st.w      	r15, (r14, 0x4)
    mov     r8, sp
  42:	6e3b      	mov      	r8, r14

    lrw     r1, trap_c
  44:	1022      	lrw      	r1, 0x0	// 4c <ADC_IRQHandler+0x4>
    jmp     r1
  46:	7804      	jmp      	r1

00000048 <ADC_IRQHandler>:

    .align  1
    .weak   Default_Handler
    .type   Default_Handler, %function
Default_Handler:
    br      trap
  48:	07dc      	br      	0x0	// 0 <trap>
  4a:	0000      	.short	0x0000
  4c:	00000000 	.long	0x00000000
