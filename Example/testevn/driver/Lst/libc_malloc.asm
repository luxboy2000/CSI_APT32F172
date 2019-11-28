
Obj/libc_malloc.o:     file format elf32-csky-little


Disassembly of section .text:

00000000 <malloc>:
#ifndef CONFIG_KERNEL_NONE
#include <csi_kernel.h>
#endif

void *malloc(size_t size)
{
   0:	1423      	subi      	r14, r14, 12
   2:	b880      	st.w      	r4, (r14, 0x0)
   4:	dd0e2001 	st.w      	r8, (r14, 0x4)
   8:	ddee2002 	st.w      	r15, (r14, 0x8)
   c:	6e3b      	mov      	r8, r14
   e:	1422      	subi      	r14, r14, 8
  10:	6cbf      	mov      	r2, r15
  12:	3300      	movi      	r3, 0
  14:	2b07      	subi      	r3, 8
  16:	60e0      	addu      	r3, r8
  18:	b300      	st.w      	r0, (r3, 0x0)

#ifndef CONFIG_KERNEL_NONE
     csi_kernel_sched_suspend();
#endif

    ret = mm_malloc(USR_HEAP, size, __builtin_return_address(0));
  1a:	3400      	movi      	r4, 0
  1c:	2c03      	subi      	r4, 4
  1e:	6120      	addu      	r4, r8
  20:	3300      	movi      	r3, 0
  22:	2b07      	subi      	r3, 8
  24:	60e0      	addu      	r3, r8
  26:	9320      	ld.w      	r1, (r3, 0x0)
  28:	1009      	lrw      	r0, 0x0	// 4c <malloc+0x4c>
  2a:	e0000000 	bsr      	0x0	// 0 <mm_malloc>
  2e:	6cc3      	mov      	r3, r0
  30:	b460      	st.w      	r3, (r4, 0x0)

#ifndef CONFIG_KERNEL_NONE
    csi_kernel_sched_resume(0);
#endif

    return ret;
  32:	3300      	movi      	r3, 0
  34:	2b03      	subi      	r3, 4
  36:	60e0      	addu      	r3, r8
  38:	9360      	ld.w      	r3, (r3, 0x0)
}
  3a:	6c0f      	mov      	r0, r3
  3c:	6fa3      	mov      	r14, r8
  3e:	d9ee2002 	ld.w      	r15, (r14, 0x8)
  42:	d90e2001 	ld.w      	r8, (r14, 0x4)
  46:	9880      	ld.w      	r4, (r14, 0x0)
  48:	1403      	addi      	r14, r14, 12
  4a:	783c      	jmp      	r15
  4c:	00000000 	.long	0x00000000

00000050 <free>:

void free(void *ptr)
{
  50:	1422      	subi      	r14, r14, 8
  52:	dd0e2000 	st.w      	r8, (r14, 0x0)
  56:	ddee2001 	st.w      	r15, (r14, 0x4)
  5a:	6e3b      	mov      	r8, r14
  5c:	1421      	subi      	r14, r14, 4
  5e:	6cbf      	mov      	r2, r15
  60:	3300      	movi      	r3, 0
  62:	2b03      	subi      	r3, 4
  64:	60e0      	addu      	r3, r8
  66:	b300      	st.w      	r0, (r3, 0x0)
#ifndef CONFIG_KERNEL_NONE
     csi_kernel_sched_suspend();
#endif

    mm_free(USR_HEAP, ptr, __builtin_return_address(0));
  68:	3300      	movi      	r3, 0
  6a:	2b03      	subi      	r3, 4
  6c:	60e0      	addu      	r3, r8
  6e:	9320      	ld.w      	r1, (r3, 0x0)
  70:	1211      	lrw      	r0, 0x0	// 1b4 <calloc+0x98>
  72:	e0000000 	bsr      	0x0	// 0 <mm_free>

#ifndef CONFIG_KERNEL_NONE
    csi_kernel_sched_resume(0);
#endif
}
  76:	6c00      	or      	r0, r0
  78:	6fa3      	mov      	r14, r8
  7a:	d9ee2001 	ld.w      	r15, (r14, 0x4)
  7e:	d90e2000 	ld.w      	r8, (r14, 0x0)
  82:	1402      	addi      	r14, r14, 8
  84:	783c      	jmp      	r15
	...

00000088 <realloc>:

void *realloc(void *ptr, size_t size)
{
  88:	1424      	subi      	r14, r14, 16
  8a:	b880      	st.w      	r4, (r14, 0x0)
  8c:	b8a1      	st.w      	r5, (r14, 0x4)
  8e:	dd0e2002 	st.w      	r8, (r14, 0x8)
  92:	ddee2003 	st.w      	r15, (r14, 0xc)
  96:	6e3b      	mov      	r8, r14
  98:	1423      	subi      	r14, r14, 12
  9a:	6d7f      	mov      	r5, r15
  9c:	3300      	movi      	r3, 0
  9e:	2b07      	subi      	r3, 8
  a0:	60e0      	addu      	r3, r8
  a2:	b300      	st.w      	r0, (r3, 0x0)
  a4:	3300      	movi      	r3, 0
  a6:	2b0b      	subi      	r3, 12
  a8:	60e0      	addu      	r3, r8
  aa:	b320      	st.w      	r1, (r3, 0x0)

#ifndef CONFIG_KERNEL_NONE
     csi_kernel_sched_suspend();
#endif

    new_ptr = mm_malloc(USR_HEAP, size, __builtin_return_address(0));
  ac:	6c97      	mov      	r2, r5
  ae:	3400      	movi      	r4, 0
  b0:	2c03      	subi      	r4, 4
  b2:	6120      	addu      	r4, r8
  b4:	3300      	movi      	r3, 0
  b6:	2b0b      	subi      	r3, 12
  b8:	60e0      	addu      	r3, r8
  ba:	9320      	ld.w      	r1, (r3, 0x0)
  bc:	111e      	lrw      	r0, 0x0	// 1b4 <calloc+0x98>
  be:	e0000000 	bsr      	0x0	// 0 <mm_malloc>
  c2:	6cc3      	mov      	r3, r0
  c4:	b460      	st.w      	r3, (r4, 0x0)

#ifndef CONFIG_KERNEL_NONE
    csi_kernel_sched_resume(0);
#endif

    if (ptr) {
  c6:	3300      	movi      	r3, 0
  c8:	2b07      	subi      	r3, 8
  ca:	60e0      	addu      	r3, r8
  cc:	9360      	ld.w      	r3, (r3, 0x0)
  ce:	3b40      	cmpnei      	r3, 0
  d0:	0c17      	bf      	0xfe	// fe <realloc+0x76>
        memcpy(new_ptr, ptr, size);
  d2:	3200      	movi      	r2, 0
  d4:	2a0b      	subi      	r2, 12
  d6:	60a0      	addu      	r2, r8
  d8:	3100      	movi      	r1, 0
  da:	2907      	subi      	r1, 8
  dc:	6060      	addu      	r1, r8
  de:	3300      	movi      	r3, 0
  e0:	2b03      	subi      	r3, 4
  e2:	60e0      	addu      	r3, r8
  e4:	9240      	ld.w      	r2, (r2, 0x0)
  e6:	9120      	ld.w      	r1, (r1, 0x0)
  e8:	9300      	ld.w      	r0, (r3, 0x0)
  ea:	e0000000 	bsr      	0x0	// 0 <memcpy>

#ifndef CONFIG_KERNEL_NONE
     csi_kernel_sched_suspend();
#endif

    mm_free(USR_HEAP, ptr, __builtin_return_address(0));
  ee:	6c97      	mov      	r2, r5
  f0:	3300      	movi      	r3, 0
  f2:	2b07      	subi      	r3, 8
  f4:	60e0      	addu      	r3, r8
  f6:	9320      	ld.w      	r1, (r3, 0x0)
  f8:	110f      	lrw      	r0, 0x0	// 1b4 <calloc+0x98>
  fa:	e0000000 	bsr      	0x0	// 0 <mm_free>
#ifndef CONFIG_KERNEL_NONE
    csi_kernel_sched_resume(0);
#endif
    }

    return new_ptr;
  fe:	3300      	movi      	r3, 0
 100:	2b03      	subi      	r3, 4
 102:	60e0      	addu      	r3, r8
 104:	9360      	ld.w      	r3, (r3, 0x0)
}
 106:	6c0f      	mov      	r0, r3
 108:	6fa3      	mov      	r14, r8
 10a:	d9ee2003 	ld.w      	r15, (r14, 0xc)
 10e:	d90e2002 	ld.w      	r8, (r14, 0x8)
 112:	98a1      	ld.w      	r5, (r14, 0x4)
 114:	9880      	ld.w      	r4, (r14, 0x0)
 116:	1404      	addi      	r14, r14, 16
 118:	783c      	jmp      	r15
	...

0000011c <calloc>:

void *calloc(size_t nmemb, size_t size)
{
 11c:	1423      	subi      	r14, r14, 12
 11e:	b880      	st.w      	r4, (r14, 0x0)
 120:	dd0e2001 	st.w      	r8, (r14, 0x4)
 124:	ddee2002 	st.w      	r15, (r14, 0x8)
 128:	6e3b      	mov      	r8, r14
 12a:	1423      	subi      	r14, r14, 12
 12c:	6d3f      	mov      	r4, r15
 12e:	3300      	movi      	r3, 0
 130:	2b07      	subi      	r3, 8
 132:	60e0      	addu      	r3, r8
 134:	b300      	st.w      	r0, (r3, 0x0)
 136:	3300      	movi      	r3, 0
 138:	2b0b      	subi      	r3, 12
 13a:	60e0      	addu      	r3, r8
 13c:	b320      	st.w      	r1, (r3, 0x0)
    void *ptr = NULL;
 13e:	3300      	movi      	r3, 0
 140:	2b03      	subi      	r3, 4
 142:	60e0      	addu      	r3, r8
 144:	3200      	movi      	r2, 0
 146:	b340      	st.w      	r2, (r3, 0x0)

#ifndef CONFIG_KERNEL_NONE
     csi_kernel_sched_suspend();
#endif

    ptr = mm_malloc(USR_HEAP, size * nmemb, __builtin_return_address(0));
 148:	3200      	movi      	r2, 0
 14a:	2a0b      	subi      	r2, 12
 14c:	60a0      	addu      	r2, r8
 14e:	3300      	movi      	r3, 0
 150:	2b07      	subi      	r3, 8
 152:	60e0      	addu      	r3, r8
 154:	9240      	ld.w      	r2, (r2, 0x0)
 156:	9360      	ld.w      	r3, (r3, 0x0)
 158:	7cc8      	mult      	r3, r2
 15a:	6c93      	mov      	r2, r4
 15c:	3400      	movi      	r4, 0
 15e:	2c03      	subi      	r4, 4
 160:	6120      	addu      	r4, r8
 162:	6c4f      	mov      	r1, r3
 164:	1014      	lrw      	r0, 0x0	// 1b4 <calloc+0x98>
 166:	e0000000 	bsr      	0x0	// 0 <mm_malloc>
 16a:	6cc3      	mov      	r3, r0
 16c:	b460      	st.w      	r3, (r4, 0x0)

#ifndef CONFIG_KERNEL_NONE
    csi_kernel_sched_resume(0);
#endif

    if (ptr) {
 16e:	3300      	movi      	r3, 0
 170:	2b03      	subi      	r3, 4
 172:	60e0      	addu      	r3, r8
 174:	9360      	ld.w      	r3, (r3, 0x0)
 176:	3b40      	cmpnei      	r3, 0
 178:	0c11      	bf      	0x19a	// 19a <calloc+0x7e>
        memset(ptr, 0, size * nmemb);
 17a:	3200      	movi      	r2, 0
 17c:	2a0b      	subi      	r2, 12
 17e:	60a0      	addu      	r2, r8
 180:	3300      	movi      	r3, 0
 182:	2b07      	subi      	r3, 8
 184:	60e0      	addu      	r3, r8
 186:	9240      	ld.w      	r2, (r2, 0x0)
 188:	9360      	ld.w      	r3, (r3, 0x0)
 18a:	7c8c      	mult      	r2, r3
 18c:	3300      	movi      	r3, 0
 18e:	2b03      	subi      	r3, 4
 190:	60e0      	addu      	r3, r8
 192:	3100      	movi      	r1, 0
 194:	9300      	ld.w      	r0, (r3, 0x0)
 196:	e0000000 	bsr      	0x0	// 0 <memset>
    }

    return ptr;
 19a:	3300      	movi      	r3, 0
 19c:	2b03      	subi      	r3, 4
 19e:	60e0      	addu      	r3, r8
 1a0:	9360      	ld.w      	r3, (r3, 0x0)
}
 1a2:	6c0f      	mov      	r0, r3
 1a4:	6fa3      	mov      	r14, r8
 1a6:	d9ee2002 	ld.w      	r15, (r14, 0x8)
 1aa:	d90e2001 	ld.w      	r8, (r14, 0x4)
 1ae:	9880      	ld.w      	r4, (r14, 0x0)
 1b0:	1403      	addi      	r14, r14, 12
 1b2:	783c      	jmp      	r15
 1b4:	00000000 	.long	0x00000000
