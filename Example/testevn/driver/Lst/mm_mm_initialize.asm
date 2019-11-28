
Obj/mm_mm_initialize.o:     file format elf32-csky-little


Disassembly of section .text:

00000000 <mm_addregion>:
 *
 ****************************************************************************/

void mm_addregion(struct mm_heap_s *heap, void *heapstart,
                  size_t heapsize)
{
   0:	1422      	subi      	r14, r14, 8
   2:	dd0e2000 	st.w      	r8, (r14, 0x0)
   6:	ddee2001 	st.w      	r15, (r14, 0x4)
   a:	6e3b      	mov      	r8, r14
   c:	1426      	subi      	r14, r14, 24
   e:	3300      	movi      	r3, 0
  10:	2b0f      	subi      	r3, 16
  12:	60e0      	addu      	r3, r8
  14:	b300      	st.w      	r0, (r3, 0x0)
  16:	3300      	movi      	r3, 0
  18:	2b13      	subi      	r3, 20
  1a:	60e0      	addu      	r3, r8
  1c:	b320      	st.w      	r1, (r3, 0x0)
  1e:	3300      	movi      	r3, 0
  20:	2b17      	subi      	r3, 24
  22:	60e0      	addu      	r3, r8
  24:	b340      	st.w      	r2, (r3, 0x0)

  /* Adjust the provide heap start and size so that they are both aligned
   * with the MM_MIN_CHUNK size.
   */

  heapbase = MM_ALIGN_UP((uintptr_t)heapstart);
  26:	3300      	movi      	r3, 0
  28:	2b13      	subi      	r3, 20
  2a:	60e0      	addu      	r3, r8
  2c:	9360      	ld.w      	r3, (r3, 0x0)
  2e:	230e      	addi      	r3, 15
  30:	6c8f      	mov      	r2, r3
  32:	3300      	movi      	r3, 0
  34:	2b03      	subi      	r3, 4
  36:	60e0      	addu      	r3, r8
  38:	310f      	movi      	r1, 15
  3a:	6885      	andn      	r2, r1
  3c:	b340      	st.w      	r2, (r3, 0x0)
  heapend  = MM_ALIGN_DOWN((uintptr_t)heapstart + (uintptr_t)heapsize);
  3e:	3300      	movi      	r3, 0
  40:	2b13      	subi      	r3, 20
  42:	60e0      	addu      	r3, r8
  44:	9340      	ld.w      	r2, (r3, 0x0)
  46:	3300      	movi      	r3, 0
  48:	2b17      	subi      	r3, 24
  4a:	60e0      	addu      	r3, r8
  4c:	9360      	ld.w      	r3, (r3, 0x0)
  4e:	608c      	addu      	r2, r3
  50:	3300      	movi      	r3, 0
  52:	2b07      	subi      	r3, 8
  54:	60e0      	addu      	r3, r8
  56:	310f      	movi      	r1, 15
  58:	6885      	andn      	r2, r1
  5a:	b340      	st.w      	r2, (r3, 0x0)
  heapsize = heapend - heapbase;
  5c:	3300      	movi      	r3, 0
  5e:	2b17      	subi      	r3, 24
  60:	60e0      	addu      	r3, r8
  62:	3100      	movi      	r1, 0
  64:	2907      	subi      	r1, 8
  66:	6060      	addu      	r1, r8
  68:	3200      	movi      	r2, 0
  6a:	2a03      	subi      	r2, 4
  6c:	60a0      	addu      	r2, r8
  6e:	9120      	ld.w      	r1, (r1, 0x0)
  70:	9240      	ld.w      	r2, (r2, 0x0)
  72:	5949      	subu      	r2, r1, r2
  74:	b340      	st.w      	r2, (r3, 0x0)

  //mlldbg("Region %d: base=%p size=%u\n", IDX+1, heapstart, heapsize);

  /* Add the size of this region to the total size of the heap */

  heap->mm_heapsize += heapsize;
  76:	3300      	movi      	r3, 0
  78:	2b0f      	subi      	r3, 16
  7a:	60e0      	addu      	r3, r8
  7c:	9360      	ld.w      	r3, (r3, 0x0)
  7e:	9343      	ld.w      	r2, (r3, 0xc)
  80:	3300      	movi      	r3, 0
  82:	2b17      	subi      	r3, 24
  84:	60e0      	addu      	r3, r8
  86:	9360      	ld.w      	r3, (r3, 0x0)
  88:	608c      	addu      	r2, r3
  8a:	3300      	movi      	r3, 0
  8c:	2b0f      	subi      	r3, 16
  8e:	60e0      	addu      	r3, r8
  90:	9360      	ld.w      	r3, (r3, 0x0)
  92:	b343      	st.w      	r2, (r3, 0xc)
   *
   * And create one free node between the guard nodes that contains
   * all available memory.
   */

  heap->mm_heapstart[IDX]            = (struct mm_allocnode_s *)heapbase;
  94:	3300      	movi      	r3, 0
  96:	2b03      	subi      	r3, 4
  98:	60e0      	addu      	r3, r8
  9a:	9340      	ld.w      	r2, (r3, 0x0)
  9c:	3300      	movi      	r3, 0
  9e:	2b0f      	subi      	r3, 16
  a0:	60e0      	addu      	r3, r8
  a2:	9360      	ld.w      	r3, (r3, 0x0)
  a4:	b344      	st.w      	r2, (r3, 0x10)
  heap->mm_heapstart[IDX]->size      = SIZEOF_MM_ALLOCNODE;
  a6:	3300      	movi      	r3, 0
  a8:	2b0f      	subi      	r3, 16
  aa:	60e0      	addu      	r3, r8
  ac:	9360      	ld.w      	r3, (r3, 0x0)
  ae:	9364      	ld.w      	r3, (r3, 0x10)
  b0:	3208      	movi      	r2, 8
  b2:	b340      	st.w      	r2, (r3, 0x0)
  heap->mm_heapstart[IDX]->preceding = MM_ALLOC_BIT;
  b4:	3300      	movi      	r3, 0
  b6:	2b0f      	subi      	r3, 16
  b8:	60e0      	addu      	r3, r8
  ba:	9360      	ld.w      	r3, (r3, 0x0)
  bc:	9344      	ld.w      	r2, (r3, 0x10)
  be:	3380      	movi      	r3, 128
  c0:	4378      	lsli      	r3, r3, 24
  c2:	b261      	st.w      	r3, (r2, 0x4)

  node                        = (struct mm_freenode_s *)(heapbase + SIZEOF_MM_ALLOCNODE);
  c4:	3300      	movi      	r3, 0
  c6:	2b03      	subi      	r3, 4
  c8:	60e0      	addu      	r3, r8
  ca:	9360      	ld.w      	r3, (r3, 0x0)
  cc:	5b5e      	addi      	r2, r3, 8
  ce:	3300      	movi      	r3, 0
  d0:	2b0b      	subi      	r3, 12
  d2:	60e0      	addu      	r3, r8
  d4:	b340      	st.w      	r2, (r3, 0x0)
  node->size                  = heapsize - 2*SIZEOF_MM_ALLOCNODE;
  d6:	3300      	movi      	r3, 0
  d8:	2b17      	subi      	r3, 24
  da:	60e0      	addu      	r3, r8
  dc:	9360      	ld.w      	r3, (r3, 0x0)
  de:	2b0f      	subi      	r3, 16
  e0:	6c8f      	mov      	r2, r3
  e2:	3300      	movi      	r3, 0
  e4:	2b0b      	subi      	r3, 12
  e6:	60e0      	addu      	r3, r8
  e8:	9360      	ld.w      	r3, (r3, 0x0)
  ea:	b340      	st.w      	r2, (r3, 0x0)
  node->preceding             = SIZEOF_MM_ALLOCNODE;
  ec:	3300      	movi      	r3, 0
  ee:	2b0b      	subi      	r3, 12
  f0:	60e0      	addu      	r3, r8
  f2:	9360      	ld.w      	r3, (r3, 0x0)
  f4:	3208      	movi      	r2, 8
  f6:	b341      	st.w      	r2, (r3, 0x4)

  heap->mm_heapend[IDX]              = (struct mm_allocnode_s *)(heapend - SIZEOF_MM_ALLOCNODE);
  f8:	3300      	movi      	r3, 0
  fa:	2b07      	subi      	r3, 8
  fc:	60e0      	addu      	r3, r8
  fe:	9360      	ld.w      	r3, (r3, 0x0)
 100:	2b07      	subi      	r3, 8
 102:	6c8f      	mov      	r2, r3
 104:	3300      	movi      	r3, 0
 106:	2b0f      	subi      	r3, 16
 108:	60e0      	addu      	r3, r8
 10a:	9360      	ld.w      	r3, (r3, 0x0)
 10c:	b345      	st.w      	r2, (r3, 0x14)
  heap->mm_heapend[IDX]->size        = SIZEOF_MM_ALLOCNODE;
 10e:	3300      	movi      	r3, 0
 110:	2b0f      	subi      	r3, 16
 112:	60e0      	addu      	r3, r8
 114:	9360      	ld.w      	r3, (r3, 0x0)
 116:	9365      	ld.w      	r3, (r3, 0x14)
 118:	3208      	movi      	r2, 8
 11a:	b340      	st.w      	r2, (r3, 0x0)
  heap->mm_heapend[IDX]->preceding   = node->size | MM_ALLOC_BIT;
 11c:	3300      	movi      	r3, 0
 11e:	2b0f      	subi      	r3, 16
 120:	60e0      	addu      	r3, r8
 122:	9360      	ld.w      	r3, (r3, 0x0)
 124:	9365      	ld.w      	r3, (r3, 0x14)
 126:	3200      	movi      	r2, 0
 128:	2a0b      	subi      	r2, 12
 12a:	60a0      	addu      	r2, r8
 12c:	9240      	ld.w      	r2, (r2, 0x0)
 12e:	9240      	ld.w      	r2, (r2, 0x0)
 130:	3abf      	bseti      	r2, 31
 132:	b341      	st.w      	r2, (r3, 0x4)
  heap->mm_nregions++;
#endif

  /* Add the single, large free node to the nodelist */

  mm_addfreechunk(heap, node);
 134:	3200      	movi      	r2, 0
 136:	2a0b      	subi      	r2, 12
 138:	60a0      	addu      	r2, r8
 13a:	3300      	movi      	r3, 0
 13c:	2b0f      	subi      	r3, 16
 13e:	60e0      	addu      	r3, r8
 140:	9220      	ld.w      	r1, (r2, 0x0)
 142:	9300      	ld.w      	r0, (r3, 0x0)
 144:	e0000000 	bsr      	0x0	// 0 <mm_addfreechunk>
}
 148:	6c00      	or      	r0, r0
 14a:	6fa3      	mov      	r14, r8
 14c:	d9ee2001 	ld.w      	r15, (r14, 0x4)
 150:	d90e2000 	ld.w      	r8, (r14, 0x0)
 154:	1402      	addi      	r14, r14, 8
 156:	783c      	jmp      	r15

00000158 <mm_initialize>:
 *
 ****************************************************************************/

void mm_initialize(struct mm_heap_s *heap, void *heapstart,
                   size_t heapsize)
{
 158:	1422      	subi      	r14, r14, 8
 15a:	dd0e2000 	st.w      	r8, (r14, 0x0)
 15e:	ddee2001 	st.w      	r15, (r14, 0x4)
 162:	6e3b      	mov      	r8, r14
 164:	1424      	subi      	r14, r14, 16
 166:	3300      	movi      	r3, 0
 168:	2b07      	subi      	r3, 8
 16a:	60e0      	addu      	r3, r8
 16c:	b300      	st.w      	r0, (r3, 0x0)
 16e:	3300      	movi      	r3, 0
 170:	2b0b      	subi      	r3, 12
 172:	60e0      	addu      	r3, r8
 174:	b320      	st.w      	r1, (r3, 0x0)
 176:	3300      	movi      	r3, 0
 178:	2b0f      	subi      	r3, 16
 17a:	60e0      	addu      	r3, r8
 17c:	b340      	st.w      	r2, (r3, 0x0)
  //CHECK_FREENODE_SIZE;
#endif

  /* Set up global variables */

  heap->mm_heapsize = 0;
 17e:	3300      	movi      	r3, 0
 180:	2b07      	subi      	r3, 8
 182:	60e0      	addu      	r3, r8
 184:	9360      	ld.w      	r3, (r3, 0x0)
 186:	3200      	movi      	r2, 0
 188:	b343      	st.w      	r2, (r3, 0xc)
  heap->mm_nregions = 0;
#endif

  /* Initialize the node array */

  memset(heap->mm_nodelist, 0, sizeof(struct mm_freenode_s) * MM_NNODES);
 18a:	3300      	movi      	r3, 0
 18c:	2b07      	subi      	r3, 8
 18e:	60e0      	addu      	r3, r8
 190:	9360      	ld.w      	r3, (r3, 0x0)
 192:	2317      	addi      	r3, 24
 194:	3298      	movi      	r2, 152
 196:	4241      	lsli      	r2, r2, 1
 198:	3100      	movi      	r1, 0
 19a:	6c0f      	mov      	r0, r3
 19c:	e0000000 	bsr      	0x0	// 0 <memset>
  for (i = 1; i < MM_NNODES; i++)
 1a0:	3300      	movi      	r3, 0
 1a2:	2b03      	subi      	r3, 4
 1a4:	60e0      	addu      	r3, r8
 1a6:	3201      	movi      	r2, 1
 1a8:	b340      	st.w      	r2, (r3, 0x0)
 1aa:	043a      	br      	0x21e	// 21e <mm_initialize+0xc6>
    {
      heap->mm_nodelist[i-1].flink = &heap->mm_nodelist[i];
 1ac:	3300      	movi      	r3, 0
 1ae:	2b03      	subi      	r3, 4
 1b0:	60e0      	addu      	r3, r8
 1b2:	9360      	ld.w      	r3, (r3, 0x0)
 1b4:	2b00      	subi      	r3, 1
 1b6:	3100      	movi      	r1, 0
 1b8:	2907      	subi      	r1, 8
 1ba:	6060      	addu      	r1, r8
 1bc:	3200      	movi      	r2, 0
 1be:	2a03      	subi      	r2, 4
 1c0:	60a0      	addu      	r2, r8
 1c2:	9240      	ld.w      	r2, (r2, 0x0)
 1c4:	4244      	lsli      	r2, r2, 4
 1c6:	2217      	addi      	r2, 24
 1c8:	9120      	ld.w      	r1, (r1, 0x0)
 1ca:	6084      	addu      	r2, r1
 1cc:	3100      	movi      	r1, 0
 1ce:	2907      	subi      	r1, 8
 1d0:	6060      	addu      	r1, r8
 1d2:	9120      	ld.w      	r1, (r1, 0x0)
 1d4:	2301      	addi      	r3, 2
 1d6:	4364      	lsli      	r3, r3, 4
 1d8:	60c4      	addu      	r3, r1
 1da:	b340      	st.w      	r2, (r3, 0x0)
      heap->mm_nodelist[i].blink   = &heap->mm_nodelist[i-1];
 1dc:	3300      	movi      	r3, 0
 1de:	2b03      	subi      	r3, 4
 1e0:	60e0      	addu      	r3, r8
 1e2:	9360      	ld.w      	r3, (r3, 0x0)
 1e4:	2b00      	subi      	r3, 1
 1e6:	3200      	movi      	r2, 0
 1e8:	2a07      	subi      	r2, 8
 1ea:	60a0      	addu      	r2, r8
 1ec:	4364      	lsli      	r3, r3, 4
 1ee:	2317      	addi      	r3, 24
 1f0:	9240      	ld.w      	r2, (r2, 0x0)
 1f2:	608c      	addu      	r2, r3
 1f4:	3300      	movi      	r3, 0
 1f6:	2b07      	subi      	r3, 8
 1f8:	60e0      	addu      	r3, r8
 1fa:	9320      	ld.w      	r1, (r3, 0x0)
 1fc:	3300      	movi      	r3, 0
 1fe:	2b03      	subi      	r3, 4
 200:	60e0      	addu      	r3, r8
 202:	9360      	ld.w      	r3, (r3, 0x0)
 204:	4364      	lsli      	r3, r3, 4
 206:	60c4      	addu      	r3, r1
 208:	2323      	addi      	r3, 36
 20a:	b340      	st.w      	r2, (r3, 0x0)
  for (i = 1; i < MM_NNODES; i++)
 20c:	3300      	movi      	r3, 0
 20e:	2b03      	subi      	r3, 4
 210:	60e0      	addu      	r3, r8
 212:	3200      	movi      	r2, 0
 214:	2a03      	subi      	r2, 4
 216:	60a0      	addu      	r2, r8
 218:	9240      	ld.w      	r2, (r2, 0x0)
 21a:	2200      	addi      	r2, 1
 21c:	b340      	st.w      	r2, (r3, 0x0)
 21e:	3300      	movi      	r3, 0
 220:	2b03      	subi      	r3, 4
 222:	60e0      	addu      	r3, r8
 224:	9360      	ld.w      	r3, (r3, 0x0)
 226:	3b32      	cmplti      	r3, 19
 228:	0bc2      	bt      	0x1ac	// 1ac <mm_initialize+0x54>

  mm_seminitialize(heap);

  /* Add the initial region of memory to the heap */

  mm_addregion(heap, heapstart, heapsize);
 22a:	3200      	movi      	r2, 0
 22c:	2a0f      	subi      	r2, 16
 22e:	60a0      	addu      	r2, r8
 230:	3100      	movi      	r1, 0
 232:	290b      	subi      	r1, 12
 234:	6060      	addu      	r1, r8
 236:	3300      	movi      	r3, 0
 238:	2b07      	subi      	r3, 8
 23a:	60e0      	addu      	r3, r8
 23c:	9240      	ld.w      	r2, (r2, 0x0)
 23e:	9120      	ld.w      	r1, (r1, 0x0)
 240:	9300      	ld.w      	r0, (r3, 0x0)
 242:	e0000000 	bsr      	0x0	// 0 <mm_addregion>
}
 246:	6c00      	or      	r0, r0
 248:	6fa3      	mov      	r14, r8
 24a:	d9ee2001 	ld.w      	r15, (r14, 0x4)
 24e:	d90e2000 	ld.w      	r8, (r14, 0x0)
 252:	1402      	addi      	r14, r14, 8
 254:	783c      	jmp      	r15
	...

00000258 <mm_heap_initialize>:

void mm_heap_initialize(void)
{
 258:	1422      	subi      	r14, r14, 8
 25a:	dd0e2000 	st.w      	r8, (r14, 0x0)
 25e:	ddee2001 	st.w      	r15, (r14, 0x4)
 262:	6e3b      	mov      	r8, r14
    mm_initialize(&g_mmheap, &g_mmheap_pool, CONFIG_MM_KERNEL_HEAPSIZE);
 264:	32c0      	movi      	r2, 192
 266:	4247      	lsli      	r2, r2, 7
 268:	1026      	lrw      	r1, 0x0	// 280 <mm_heap_initialize+0x28>
 26a:	1007      	lrw      	r0, 0x0	// 284 <mm_heap_initialize+0x2c>
 26c:	e0000000 	bsr      	0x0	// 158 <mm_initialize>
}
 270:	6c00      	or      	r0, r0
 272:	6fa3      	mov      	r14, r8
 274:	d9ee2001 	ld.w      	r15, (r14, 0x4)
 278:	d90e2000 	ld.w      	r8, (r14, 0x0)
 27c:	1402      	addi      	r14, r14, 8
 27e:	783c      	jmp      	r15
	...
