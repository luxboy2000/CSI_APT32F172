
Obj/mm_mm_size2ndx.o:     file format elf32-csky-little


Disassembly of section .text:

00000000 <mm_size2ndx>:
 *    Convert the size to a nodelist index.
 *
 ****************************************************************************/

int mm_size2ndx(size_t size)
{
   0:	1421      	subi      	r14, r14, 4
   2:	dd0e2000 	st.w      	r8, (r14, 0x0)
   6:	6e3b      	mov      	r8, r14
   8:	1422      	subi      	r14, r14, 8
   a:	3300      	movi      	r3, 0
   c:	2b07      	subi      	r3, 8
   e:	60e0      	addu      	r3, r8
  10:	b300      	st.w      	r0, (r3, 0x0)
  int ndx = 0;
  12:	3300      	movi      	r3, 0
  14:	2b03      	subi      	r3, 4
  16:	60e0      	addu      	r3, r8
  18:	3200      	movi      	r2, 0
  1a:	b340      	st.w      	r2, (r3, 0x0)

  if (size >= MM_MAX_CHUNK)
  1c:	3300      	movi      	r3, 0
  1e:	2b07      	subi      	r3, 8
  20:	60e0      	addu      	r3, r8
  22:	9340      	ld.w      	r2, (r3, 0x0)
  24:	1079      	lrw      	r3, 0x3fffff	// 88 <mm_size2ndx+0x88>
  26:	648c      	cmphs      	r3, r2
  28:	0803      	bt      	0x2e	// 2e <mm_size2ndx+0x2e>
    {
       return MM_NNODES-1;
  2a:	3312      	movi      	r3, 18
  2c:	0427      	br      	0x7a	// 7a <mm_size2ndx+0x7a>
    }

  size >>= MM_MIN_SHIFT;
  2e:	3300      	movi      	r3, 0
  30:	2b07      	subi      	r3, 8
  32:	60e0      	addu      	r3, r8
  34:	3200      	movi      	r2, 0
  36:	2a07      	subi      	r2, 8
  38:	60a0      	addu      	r2, r8
  3a:	9240      	ld.w      	r2, (r2, 0x0)
  3c:	4a44      	lsri      	r2, r2, 4
  3e:	b340      	st.w      	r2, (r3, 0x0)
  while (size > 1)
  40:	0413      	br      	0x66	// 66 <mm_size2ndx+0x66>
    {
      ndx++;
  42:	3300      	movi      	r3, 0
  44:	2b03      	subi      	r3, 4
  46:	60e0      	addu      	r3, r8
  48:	3200      	movi      	r2, 0
  4a:	2a03      	subi      	r2, 4
  4c:	60a0      	addu      	r2, r8
  4e:	9240      	ld.w      	r2, (r2, 0x0)
  50:	2200      	addi      	r2, 1
  52:	b340      	st.w      	r2, (r3, 0x0)
      size >>= 1;
  54:	3300      	movi      	r3, 0
  56:	2b07      	subi      	r3, 8
  58:	60e0      	addu      	r3, r8
  5a:	3200      	movi      	r2, 0
  5c:	2a07      	subi      	r2, 8
  5e:	60a0      	addu      	r2, r8
  60:	9240      	ld.w      	r2, (r2, 0x0)
  62:	4a41      	lsri      	r2, r2, 1
  64:	b340      	st.w      	r2, (r3, 0x0)
  while (size > 1)
  66:	3300      	movi      	r3, 0
  68:	2b07      	subi      	r3, 8
  6a:	60e0      	addu      	r3, r8
  6c:	9360      	ld.w      	r3, (r3, 0x0)
  6e:	3b01      	cmphsi      	r3, 2
  70:	0be9      	bt      	0x42	// 42 <mm_size2ndx+0x42>
    }

  return ndx;
  72:	3300      	movi      	r3, 0
  74:	2b03      	subi      	r3, 4
  76:	60e0      	addu      	r3, r8
  78:	9360      	ld.w      	r3, (r3, 0x0)
}
  7a:	6c0f      	mov      	r0, r3
  7c:	6fa3      	mov      	r14, r8
  7e:	d90e2000 	ld.w      	r8, (r14, 0x0)
  82:	1401      	addi      	r14, r14, 4
  84:	783c      	jmp      	r15
  86:	0000      	bkpt
  88:	003fffff 	.long	0x003fffff
