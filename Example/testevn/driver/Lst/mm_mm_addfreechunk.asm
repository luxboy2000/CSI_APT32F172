
Obj/mm_mm_addfreechunk.o:     file format elf32-csky-little


Disassembly of section .text:

00000000 <mm_addfreechunk>:
 *   the mm semaphore
 *
 ****************************************************************************/

void mm_addfreechunk(struct mm_heap_s *heap, struct mm_freenode_s *node)
{
   0:	1423      	subi      	r14, r14, 12
   2:	b880      	st.w      	r4, (r14, 0x0)
   4:	dd0e2001 	st.w      	r8, (r14, 0x4)
   8:	ddee2002 	st.w      	r15, (r14, 0x8)
   c:	6e3b      	mov      	r8, r14
   e:	1425      	subi      	r14, r14, 20
  10:	3300      	movi      	r3, 0
  12:	2b0f      	subi      	r3, 16
  14:	60e0      	addu      	r3, r8
  16:	b300      	st.w      	r0, (r3, 0x0)
  18:	3300      	movi      	r3, 0
  1a:	2b13      	subi      	r3, 20
  1c:	60e0      	addu      	r3, r8
  1e:	b320      	st.w      	r1, (r3, 0x0)
  struct mm_freenode_s *next;
  struct mm_freenode_s *prev;

  /* Convert the size to a nodelist index */

  int ndx = mm_size2ndx(node->size);
  20:	3300      	movi      	r3, 0
  22:	2b13      	subi      	r3, 20
  24:	60e0      	addu      	r3, r8
  26:	9360      	ld.w      	r3, (r3, 0x0)
  28:	9360      	ld.w      	r3, (r3, 0x0)
  2a:	3400      	movi      	r4, 0
  2c:	2c0b      	subi      	r4, 12
  2e:	6120      	addu      	r4, r8
  30:	6c0f      	mov      	r0, r3
  32:	e0000000 	bsr      	0x0	// 0 <mm_size2ndx>
  36:	6cc3      	mov      	r3, r0
  38:	b460      	st.w      	r3, (r4, 0x0)

  /* Now put the new node int the next */

  for (prev = &heap->mm_nodelist[ndx], next = heap->mm_nodelist[ndx].flink;
  3a:	3300      	movi      	r3, 0
  3c:	2b07      	subi      	r3, 8
  3e:	60e0      	addu      	r3, r8
  40:	3100      	movi      	r1, 0
  42:	290f      	subi      	r1, 16
  44:	6060      	addu      	r1, r8
  46:	3200      	movi      	r2, 0
  48:	2a0b      	subi      	r2, 12
  4a:	60a0      	addu      	r2, r8
  4c:	9240      	ld.w      	r2, (r2, 0x0)
  4e:	4244      	lsli      	r2, r2, 4
  50:	2217      	addi      	r2, 24
  52:	9120      	ld.w      	r1, (r1, 0x0)
  54:	6084      	addu      	r2, r1
  56:	b340      	st.w      	r2, (r3, 0x0)
  58:	3300      	movi      	r3, 0
  5a:	2b03      	subi      	r3, 4
  5c:	60e0      	addu      	r3, r8
  5e:	3200      	movi      	r2, 0
  60:	2a0f      	subi      	r2, 16
  62:	60a0      	addu      	r2, r8
  64:	9220      	ld.w      	r1, (r2, 0x0)
  66:	3200      	movi      	r2, 0
  68:	2a0b      	subi      	r2, 12
  6a:	60a0      	addu      	r2, r8
  6c:	9240      	ld.w      	r2, (r2, 0x0)
  6e:	2201      	addi      	r2, 2
  70:	4244      	lsli      	r2, r2, 4
  72:	6084      	addu      	r2, r1
  74:	9240      	ld.w      	r2, (r2, 0x0)
  76:	b340      	st.w      	r2, (r3, 0x0)
  78:	0412      	br      	0x9c	// 9c <mm_addfreechunk+0x9c>
       next && next->size && next->size < node->size;
       prev = next, next = next->flink);
  7a:	3300      	movi      	r3, 0
  7c:	2b07      	subi      	r3, 8
  7e:	60e0      	addu      	r3, r8
  80:	3200      	movi      	r2, 0
  82:	2a03      	subi      	r2, 4
  84:	60a0      	addu      	r2, r8
  86:	9240      	ld.w      	r2, (r2, 0x0)
  88:	b340      	st.w      	r2, (r3, 0x0)
  8a:	3300      	movi      	r3, 0
  8c:	2b03      	subi      	r3, 4
  8e:	60e0      	addu      	r3, r8
  90:	3200      	movi      	r2, 0
  92:	2a03      	subi      	r2, 4
  94:	60a0      	addu      	r2, r8
  96:	9240      	ld.w      	r2, (r2, 0x0)
  98:	9242      	ld.w      	r2, (r2, 0x8)
  9a:	b340      	st.w      	r2, (r3, 0x0)
  for (prev = &heap->mm_nodelist[ndx], next = heap->mm_nodelist[ndx].flink;
  9c:	3300      	movi      	r3, 0
  9e:	2b03      	subi      	r3, 4
  a0:	60e0      	addu      	r3, r8
  a2:	9360      	ld.w      	r3, (r3, 0x0)
  a4:	3b40      	cmpnei      	r3, 0
  a6:	0c14      	bf      	0xce	// ce <mm_addfreechunk+0xce>
       next && next->size && next->size < node->size;
  a8:	3300      	movi      	r3, 0
  aa:	2b03      	subi      	r3, 4
  ac:	60e0      	addu      	r3, r8
  ae:	9360      	ld.w      	r3, (r3, 0x0)
  b0:	9360      	ld.w      	r3, (r3, 0x0)
  b2:	3b40      	cmpnei      	r3, 0
  b4:	0c0d      	bf      	0xce	// ce <mm_addfreechunk+0xce>
  b6:	3300      	movi      	r3, 0
  b8:	2b03      	subi      	r3, 4
  ba:	60e0      	addu      	r3, r8
  bc:	9360      	ld.w      	r3, (r3, 0x0)
  be:	9340      	ld.w      	r2, (r3, 0x0)
  c0:	3300      	movi      	r3, 0
  c2:	2b13      	subi      	r3, 20
  c4:	60e0      	addu      	r3, r8
  c6:	9360      	ld.w      	r3, (r3, 0x0)
  c8:	9360      	ld.w      	r3, (r3, 0x0)
  ca:	64c8      	cmphs      	r2, r3
  cc:	0fd7      	bf      	0x7a	// 7a <mm_addfreechunk+0x7a>

  /* Does it go in mid next or at the end? */

  prev->flink = node;
  ce:	3300      	movi      	r3, 0
  d0:	2b07      	subi      	r3, 8
  d2:	60e0      	addu      	r3, r8
  d4:	9360      	ld.w      	r3, (r3, 0x0)
  d6:	3200      	movi      	r2, 0
  d8:	2a13      	subi      	r2, 20
  da:	60a0      	addu      	r2, r8
  dc:	9240      	ld.w      	r2, (r2, 0x0)
  de:	b342      	st.w      	r2, (r3, 0x8)
  node->blink = prev;
  e0:	3300      	movi      	r3, 0
  e2:	2b13      	subi      	r3, 20
  e4:	60e0      	addu      	r3, r8
  e6:	9360      	ld.w      	r3, (r3, 0x0)
  e8:	3200      	movi      	r2, 0
  ea:	2a07      	subi      	r2, 8
  ec:	60a0      	addu      	r2, r8
  ee:	9240      	ld.w      	r2, (r2, 0x0)
  f0:	b343      	st.w      	r2, (r3, 0xc)
  node->flink = next;
  f2:	3300      	movi      	r3, 0
  f4:	2b13      	subi      	r3, 20
  f6:	60e0      	addu      	r3, r8
  f8:	9360      	ld.w      	r3, (r3, 0x0)
  fa:	3200      	movi      	r2, 0
  fc:	2a03      	subi      	r2, 4
  fe:	60a0      	addu      	r2, r8
 100:	9240      	ld.w      	r2, (r2, 0x0)
 102:	b342      	st.w      	r2, (r3, 0x8)

  if (next)
 104:	3300      	movi      	r3, 0
 106:	2b03      	subi      	r3, 4
 108:	60e0      	addu      	r3, r8
 10a:	9360      	ld.w      	r3, (r3, 0x0)
 10c:	3b40      	cmpnei      	r3, 0
 10e:	0c0a      	bf      	0x122	// 122 <mm_addfreechunk+0x122>
    {
      /* The new node goes between prev and next */

      next->blink = node;
 110:	3300      	movi      	r3, 0
 112:	2b03      	subi      	r3, 4
 114:	60e0      	addu      	r3, r8
 116:	9360      	ld.w      	r3, (r3, 0x0)
 118:	3200      	movi      	r2, 0
 11a:	2a13      	subi      	r2, 20
 11c:	60a0      	addu      	r2, r8
 11e:	9240      	ld.w      	r2, (r2, 0x0)
 120:	b343      	st.w      	r2, (r3, 0xc)
    }
}
 122:	6c00      	or      	r0, r0
 124:	6fa3      	mov      	r14, r8
 126:	d9ee2002 	ld.w      	r15, (r14, 0x8)
 12a:	d90e2001 	ld.w      	r8, (r14, 0x4)
 12e:	9880      	ld.w      	r4, (r14, 0x0)
 130:	1403      	addi      	r14, r14, 12
 132:	783c      	jmp      	r15
