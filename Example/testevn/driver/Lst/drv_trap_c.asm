
Obj/drv_trap_c.o:     file format elf32-csky-little


Disassembly of section .text:

00000000 <trap_c>:
#include <stdio.h>
#include <stdlib.h>
#include <csi_config.h>

void trap_c(uint32_t *regs)
{
   0:	1421      	subi      	r14, r14, 4
   2:	dd0e2000 	st.w      	r8, (r14, 0x0)
   6:	6e3b      	mov      	r8, r14
   8:	1421      	subi      	r14, r14, 4
   a:	3300      	movi      	r3, 0
   c:	2b03      	subi      	r3, 4
   e:	60e0      	addu      	r3, r8
  10:	b300      	st.w      	r0, (r3, 0x0)
//
//    printf("\n");
//    printf("epsr: %8x\n", regs[16]);
//    printf("epc : %8x\n", regs[17]);

    while (1);
  12:	0400      	br      	0x12	// 12 <trap_c+0x12>
