
Obj/mm_lib_mallinfo.o:     file format elf32-csky-little


Disassembly of section .text:

00000000 <mm_get_mallinfo>:
#include "mm.h"
#include "umm_heap.h"
#include <stdio.h>

int32_t mm_get_mallinfo(int32_t *total, int32_t *used, int32_t *free, int32_t *peak)
{
   0:	1423      	subi      	r14, r14, 12
   2:	b880      	st.w      	r4, (r14, 0x0)
   4:	dd0e2001 	st.w      	r8, (r14, 0x4)
   8:	ddee2002 	st.w      	r15, (r14, 0x8)
   c:	6e3b      	mov      	r8, r14
   e:	1429      	subi      	r14, r14, 36
  10:	3400      	movi      	r4, 0
  12:	2c17      	subi      	r4, 24
  14:	6120      	addu      	r4, r8
  16:	b400      	st.w      	r0, (r4, 0x0)
  18:	3000      	movi      	r0, 0
  1a:	281b      	subi      	r0, 28
  1c:	6020      	addu      	r0, r8
  1e:	b020      	st.w      	r1, (r0, 0x0)
  20:	3100      	movi      	r1, 0
  22:	291f      	subi      	r1, 32
  24:	6060      	addu      	r1, r8
  26:	b140      	st.w      	r2, (r1, 0x0)
  28:	3200      	movi      	r2, 0
  2a:	2a23      	subi      	r2, 36
  2c:	60a0      	addu      	r2, r8
  2e:	b260      	st.w      	r3, (r2, 0x0)
    struct mallinfo info;
    mm_mallinfo(USR_HEAP, &info);
  30:	3300      	movi      	r3, 0
  32:	2b13      	subi      	r3, 20
  34:	60e0      	addu      	r3, r8
  36:	6c4f      	mov      	r1, r3
  38:	1018      	lrw      	r0, 0x0	// 98 <mm_get_mallinfo+0x98>
  3a:	e0000000 	bsr      	0x0	// 0 <mm_mallinfo>
	*total = info.arena;
  3e:	3300      	movi      	r3, 0
  40:	2b13      	subi      	r3, 20
  42:	60e0      	addu      	r3, r8
  44:	9340      	ld.w      	r2, (r3, 0x0)
  46:	3300      	movi      	r3, 0
  48:	2b17      	subi      	r3, 24
  4a:	60e0      	addu      	r3, r8
  4c:	9360      	ld.w      	r3, (r3, 0x0)
  4e:	b340      	st.w      	r2, (r3, 0x0)
	*used = info.uordblks;
  50:	3300      	movi      	r3, 0
  52:	2b13      	subi      	r3, 20
  54:	60e0      	addu      	r3, r8
  56:	9343      	ld.w      	r2, (r3, 0xc)
  58:	3300      	movi      	r3, 0
  5a:	2b1b      	subi      	r3, 28
  5c:	60e0      	addu      	r3, r8
  5e:	9360      	ld.w      	r3, (r3, 0x0)
  60:	b340      	st.w      	r2, (r3, 0x0)
	*free = info.fordblks;
  62:	3300      	movi      	r3, 0
  64:	2b13      	subi      	r3, 20
  66:	60e0      	addu      	r3, r8
  68:	9344      	ld.w      	r2, (r3, 0x10)
  6a:	3300      	movi      	r3, 0
  6c:	2b1f      	subi      	r3, 32
  6e:	60e0      	addu      	r3, r8
  70:	9360      	ld.w      	r3, (r3, 0x0)
  72:	b340      	st.w      	r2, (r3, 0x0)
#if (CONFIG_MM_MAX_USED)
	*peak = mm_get_max_usedsize();
  74:	e0000000 	bsr      	0x0	// 0 <mm_get_max_usedsize>
  78:	6c83      	mov      	r2, r0
  7a:	3300      	movi      	r3, 0
  7c:	2b23      	subi      	r3, 36
  7e:	60e0      	addu      	r3, r8
  80:	9360      	ld.w      	r3, (r3, 0x0)
  82:	b340      	st.w      	r2, (r3, 0x0)
#endif
    return 0;
  84:	3300      	movi      	r3, 0
}
  86:	6c0f      	mov      	r0, r3
  88:	6fa3      	mov      	r14, r8
  8a:	d9ee2002 	ld.w      	r15, (r14, 0x8)
  8e:	d90e2001 	ld.w      	r8, (r14, 0x4)
  92:	9880      	ld.w      	r4, (r14, 0x0)
  94:	1403      	addi      	r14, r14, 12
  96:	783c      	jmp      	r15
  98:	00000000 	.long	0x00000000
