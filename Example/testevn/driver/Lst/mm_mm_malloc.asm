
Obj/mm_mm_malloc.o:     file format elf32-csky-little


Disassembly of section .text:

00000000 <mm_malloc>:
 *  8-byte alignment of the allocated data is assured.
 *
 ****************************************************************************/

void *mm_malloc(struct mm_heap_s *heap, size_t size, void *caller)
{
   0:	1423      	subi      	r14, r14, 12
   2:	b880      	st.w      	r4, (r14, 0x0)
   4:	dd0e2001 	st.w      	r8, (r14, 0x4)
   8:	ddee2002 	st.w      	r15, (r14, 0x8)
   c:	6e3b      	mov      	r8, r14
   e:	1429      	subi      	r14, r14, 36
  10:	3300      	movi      	r3, 0
  12:	2b1b      	subi      	r3, 28
  14:	60e0      	addu      	r3, r8
  16:	b300      	st.w      	r0, (r3, 0x0)
  18:	3300      	movi      	r3, 0
  1a:	2b1f      	subi      	r3, 32
  1c:	60e0      	addu      	r3, r8
  1e:	b320      	st.w      	r1, (r3, 0x0)
  20:	3300      	movi      	r3, 0
  22:	2b23      	subi      	r3, 36
  24:	60e0      	addu      	r3, r8
  26:	b340      	st.w      	r2, (r3, 0x0)
  struct mm_freenode_s *node;
  void *ret = NULL;
  28:	3300      	movi      	r3, 0
  2a:	2b07      	subi      	r3, 8
  2c:	60e0      	addu      	r3, r8
  2e:	3200      	movi      	r2, 0
  30:	b340      	st.w      	r2, (r3, 0x0)
  size_t real_size;
#endif

  /* Handle bad sizes */

  if (size < 1)
  32:	3300      	movi      	r3, 0
  34:	2b1f      	subi      	r3, 32
  36:	60e0      	addu      	r3, r8
  38:	9360      	ld.w      	r3, (r3, 0x0)
  3a:	3b40      	cmpnei      	r3, 0
  3c:	0803      	bt      	0x42	// 42 <mm_malloc+0x42>
    {
      return NULL;
  3e:	3300      	movi      	r3, 0
  40:	0504      	br      	0x248	// 248 <mm_malloc+0x248>

  /* Adjust the size to account for (1) the size of the allocated node and
   * (2) to make sure that it is an even multiple of our granule size.
   */

  size = MM_ALIGN_UP(size + SIZEOF_MM_ALLOCNODE);
  42:	3300      	movi      	r3, 0
  44:	2b1f      	subi      	r3, 32
  46:	60e0      	addu      	r3, r8
  48:	9360      	ld.w      	r3, (r3, 0x0)
  4a:	2316      	addi      	r3, 23
  4c:	6c8f      	mov      	r2, r3
  4e:	3300      	movi      	r3, 0
  50:	2b1f      	subi      	r3, 32
  52:	60e0      	addu      	r3, r8
  54:	310f      	movi      	r1, 15
  56:	6885      	andn      	r2, r1
  58:	b340      	st.w      	r2, (r3, 0x0)

  /* Get the location in the node list to start the search. Special case
   * really big allocations
   */

  if (size >= MM_MAX_CHUNK)
  5a:	3300      	movi      	r3, 0
  5c:	2b1f      	subi      	r3, 32
  5e:	60e0      	addu      	r3, r8
  60:	9340      	ld.w      	r2, (r3, 0x0)
  62:	137f      	lrw      	r3, 0x3fffff	// 25c <mm_malloc+0x25c>
  64:	648c      	cmphs      	r3, r2
  66:	0807      	bt      	0x74	// 74 <mm_malloc+0x74>
    {
      ndx = MM_NNODES-1;
  68:	3300      	movi      	r3, 0
  6a:	2b0b      	subi      	r3, 12
  6c:	60e0      	addu      	r3, r8
  6e:	3212      	movi      	r2, 18
  70:	b340      	st.w      	r2, (r3, 0x0)
  72:	040c      	br      	0x8a	// 8a <mm_malloc+0x8a>
    }
  else
    {
      /* Convert the request size into a nodelist index */

      ndx = mm_size2ndx(size);
  74:	3400      	movi      	r4, 0
  76:	2c0b      	subi      	r4, 12
  78:	6120      	addu      	r4, r8
  7a:	3300      	movi      	r3, 0
  7c:	2b1f      	subi      	r3, 32
  7e:	60e0      	addu      	r3, r8
  80:	9300      	ld.w      	r0, (r3, 0x0)
  82:	e0000000 	bsr      	0x0	// 0 <mm_size2ndx>
  86:	6cc3      	mov      	r3, r0
  88:	b460      	st.w      	r3, (r4, 0x0)
  /* Search for a large enough chunk in the list of nodes. This list is
   * ordered by size, but will have occasional zero sized nodes as we visit
   * other mm_nodelist[] entries.
   */

  for (node = heap->mm_nodelist[ndx].flink;
  8a:	3300      	movi      	r3, 0
  8c:	2b03      	subi      	r3, 4
  8e:	60e0      	addu      	r3, r8
  90:	3200      	movi      	r2, 0
  92:	2a1b      	subi      	r2, 28
  94:	60a0      	addu      	r2, r8
  96:	9220      	ld.w      	r1, (r2, 0x0)
  98:	3200      	movi      	r2, 0
  9a:	2a0b      	subi      	r2, 12
  9c:	60a0      	addu      	r2, r8
  9e:	9240      	ld.w      	r2, (r2, 0x0)
  a0:	2201      	addi      	r2, 2
  a2:	4244      	lsli      	r2, r2, 4
  a4:	6084      	addu      	r2, r1
  a6:	9240      	ld.w      	r2, (r2, 0x0)
  a8:	b340      	st.w      	r2, (r3, 0x0)
  aa:	040a      	br      	0xbe	// be <mm_malloc+0xbe>
       node && node->size < size;
       node = node->flink);
  ac:	3300      	movi      	r3, 0
  ae:	2b03      	subi      	r3, 4
  b0:	60e0      	addu      	r3, r8
  b2:	3200      	movi      	r2, 0
  b4:	2a03      	subi      	r2, 4
  b6:	60a0      	addu      	r2, r8
  b8:	9240      	ld.w      	r2, (r2, 0x0)
  ba:	9242      	ld.w      	r2, (r2, 0x8)
  bc:	b340      	st.w      	r2, (r3, 0x0)
  for (node = heap->mm_nodelist[ndx].flink;
  be:	3300      	movi      	r3, 0
  c0:	2b03      	subi      	r3, 4
  c2:	60e0      	addu      	r3, r8
  c4:	9360      	ld.w      	r3, (r3, 0x0)
  c6:	3b40      	cmpnei      	r3, 0
  c8:	0c0c      	bf      	0xe0	// e0 <mm_malloc+0xe0>
       node && node->size < size;
  ca:	3300      	movi      	r3, 0
  cc:	2b03      	subi      	r3, 4
  ce:	60e0      	addu      	r3, r8
  d0:	9360      	ld.w      	r3, (r3, 0x0)
  d2:	9340      	ld.w      	r2, (r3, 0x0)
  d4:	3300      	movi      	r3, 0
  d6:	2b1f      	subi      	r3, 32
  d8:	60e0      	addu      	r3, r8
  da:	9360      	ld.w      	r3, (r3, 0x0)
  dc:	64c8      	cmphs      	r2, r3
  de:	0fe7      	bf      	0xac	// ac <mm_malloc+0xac>
  /* If we found a node with non-zero size, then this is one to use. Since
   * the list is ordered, we know that is must be best fitting chunk
   * available.
   */

  if (node)
  e0:	3300      	movi      	r3, 0
  e2:	2b03      	subi      	r3, 4
  e4:	60e0      	addu      	r3, r8
  e6:	9360      	ld.w      	r3, (r3, 0x0)
  e8:	3b40      	cmpnei      	r3, 0
  ea:	0c98      	bf      	0x21a	// 21a <mm_malloc+0x21a>
      /* Remove the node.  There must be a predecessor, but there may not be
       * a successor node.
       */

      //DEBUGASSERT(node->blink);
      node->blink->flink = node->flink;
  ec:	3300      	movi      	r3, 0
  ee:	2b03      	subi      	r3, 4
  f0:	60e0      	addu      	r3, r8
  f2:	9360      	ld.w      	r3, (r3, 0x0)
  f4:	9363      	ld.w      	r3, (r3, 0xc)
  f6:	3200      	movi      	r2, 0
  f8:	2a03      	subi      	r2, 4
  fa:	60a0      	addu      	r2, r8
  fc:	9240      	ld.w      	r2, (r2, 0x0)
  fe:	9242      	ld.w      	r2, (r2, 0x8)
 100:	b342      	st.w      	r2, (r3, 0x8)
      if (node->flink)
 102:	3300      	movi      	r3, 0
 104:	2b03      	subi      	r3, 4
 106:	60e0      	addu      	r3, r8
 108:	9360      	ld.w      	r3, (r3, 0x0)
 10a:	9362      	ld.w      	r3, (r3, 0x8)
 10c:	3b40      	cmpnei      	r3, 0
 10e:	0c0c      	bf      	0x126	// 126 <mm_malloc+0x126>
        {
          node->flink->blink = node->blink;
 110:	3300      	movi      	r3, 0
 112:	2b03      	subi      	r3, 4
 114:	60e0      	addu      	r3, r8
 116:	9360      	ld.w      	r3, (r3, 0x0)
 118:	9362      	ld.w      	r3, (r3, 0x8)
 11a:	3200      	movi      	r2, 0
 11c:	2a03      	subi      	r2, 4
 11e:	60a0      	addu      	r2, r8
 120:	9240      	ld.w      	r2, (r2, 0x0)
 122:	9243      	ld.w      	r2, (r2, 0xc)
 124:	b343      	st.w      	r2, (r3, 0xc)
       * bytes can be smaller (they may be SIZEOF_MM_ALLOCNODE).  In that
       * case, we will just carry the few wasted bytes at the end of the
       * allocation.
       */

      remaining = node->size - size;
 126:	3300      	movi      	r3, 0
 128:	2b03      	subi      	r3, 4
 12a:	60e0      	addu      	r3, r8
 12c:	9360      	ld.w      	r3, (r3, 0x0)
 12e:	9320      	ld.w      	r1, (r3, 0x0)
 130:	3300      	movi      	r3, 0
 132:	2b0f      	subi      	r3, 16
 134:	60e0      	addu      	r3, r8
 136:	3200      	movi      	r2, 0
 138:	2a1f      	subi      	r2, 32
 13a:	60a0      	addu      	r2, r8
 13c:	9240      	ld.w      	r2, (r2, 0x0)
 13e:	5949      	subu      	r2, r1, r2
 140:	b340      	st.w      	r2, (r3, 0x0)
      if (remaining >= SIZEOF_MM_FREENODE)
 142:	3300      	movi      	r3, 0
 144:	2b0f      	subi      	r3, 16
 146:	60e0      	addu      	r3, r8
 148:	9360      	ld.w      	r3, (r3, 0x0)
 14a:	3b0f      	cmphsi      	r3, 16
 14c:	0c52      	bf      	0x1f0	// 1f0 <mm_malloc+0x1f0>
        {
          /* Get a pointer to the next node in physical memory */

          next = (struct mm_freenode_s *)(((char *)node) + node->size);
 14e:	3300      	movi      	r3, 0
 150:	2b03      	subi      	r3, 4
 152:	60e0      	addu      	r3, r8
 154:	9360      	ld.w      	r3, (r3, 0x0)
 156:	9340      	ld.w      	r2, (r3, 0x0)
 158:	3300      	movi      	r3, 0
 15a:	2b13      	subi      	r3, 20
 15c:	60e0      	addu      	r3, r8
 15e:	3100      	movi      	r1, 0
 160:	2903      	subi      	r1, 4
 162:	6060      	addu      	r1, r8
 164:	9120      	ld.w      	r1, (r1, 0x0)
 166:	6084      	addu      	r2, r1
 168:	b340      	st.w      	r2, (r3, 0x0)

          /* Create the remainder node */

          remainder = (struct mm_freenode_s *)(((char *)node) + size);
 16a:	3300      	movi      	r3, 0
 16c:	2b17      	subi      	r3, 24
 16e:	60e0      	addu      	r3, r8
 170:	3100      	movi      	r1, 0
 172:	2903      	subi      	r1, 4
 174:	6060      	addu      	r1, r8
 176:	3200      	movi      	r2, 0
 178:	2a1f      	subi      	r2, 32
 17a:	60a0      	addu      	r2, r8
 17c:	9120      	ld.w      	r1, (r1, 0x0)
 17e:	9240      	ld.w      	r2, (r2, 0x0)
 180:	6084      	addu      	r2, r1
 182:	b340      	st.w      	r2, (r3, 0x0)
          remainder->size = remaining;
 184:	3300      	movi      	r3, 0
 186:	2b17      	subi      	r3, 24
 188:	60e0      	addu      	r3, r8
 18a:	9360      	ld.w      	r3, (r3, 0x0)
 18c:	3200      	movi      	r2, 0
 18e:	2a0f      	subi      	r2, 16
 190:	60a0      	addu      	r2, r8
 192:	9240      	ld.w      	r2, (r2, 0x0)
 194:	b340      	st.w      	r2, (r3, 0x0)
          remainder->preceding = size;
 196:	3300      	movi      	r3, 0
 198:	2b17      	subi      	r3, 24
 19a:	60e0      	addu      	r3, r8
 19c:	9360      	ld.w      	r3, (r3, 0x0)
 19e:	3200      	movi      	r2, 0
 1a0:	2a1f      	subi      	r2, 32
 1a2:	60a0      	addu      	r2, r8
 1a4:	9240      	ld.w      	r2, (r2, 0x0)
 1a6:	b341      	st.w      	r2, (r3, 0x4)

          /* Adjust the size of the node under consideration */

          node->size = size;
 1a8:	3300      	movi      	r3, 0
 1aa:	2b03      	subi      	r3, 4
 1ac:	60e0      	addu      	r3, r8
 1ae:	9360      	ld.w      	r3, (r3, 0x0)
 1b0:	3200      	movi      	r2, 0
 1b2:	2a1f      	subi      	r2, 32
 1b4:	60a0      	addu      	r2, r8
 1b6:	9240      	ld.w      	r2, (r2, 0x0)
 1b8:	b340      	st.w      	r2, (r3, 0x0)

          /* Adjust the 'preceding' size of the (old) next node, preserving
           * the allocated flag.
           */

          next->preceding = remaining | (next->preceding & MM_ALLOC_BIT);
 1ba:	3300      	movi      	r3, 0
 1bc:	2b13      	subi      	r3, 20
 1be:	60e0      	addu      	r3, r8
 1c0:	9360      	ld.w      	r3, (r3, 0x0)
 1c2:	9361      	ld.w      	r3, (r3, 0x4)
 1c4:	4b7f      	lsri      	r3, r3, 31
 1c6:	435f      	lsli      	r2, r3, 31
 1c8:	3300      	movi      	r3, 0
 1ca:	2b0f      	subi      	r3, 16
 1cc:	60e0      	addu      	r3, r8
 1ce:	9360      	ld.w      	r3, (r3, 0x0)
 1d0:	6c8c      	or      	r2, r3
 1d2:	3300      	movi      	r3, 0
 1d4:	2b13      	subi      	r3, 20
 1d6:	60e0      	addu      	r3, r8
 1d8:	9360      	ld.w      	r3, (r3, 0x0)
 1da:	b341      	st.w      	r2, (r3, 0x4)

          /* Add the remainder back into the nodelist */

          mm_addfreechunk(heap, remainder);
 1dc:	3200      	movi      	r2, 0
 1de:	2a17      	subi      	r2, 24
 1e0:	60a0      	addu      	r2, r8
 1e2:	3300      	movi      	r3, 0
 1e4:	2b1b      	subi      	r3, 28
 1e6:	60e0      	addu      	r3, r8
 1e8:	9220      	ld.w      	r1, (r2, 0x0)
 1ea:	9300      	ld.w      	r0, (r3, 0x0)
 1ec:	e0000000 	bsr      	0x0	// 0 <mm_addfreechunk>
        }

      /* Handle the case of an exact size match */

      node->preceding |= MM_ALLOC_BIT;
 1f0:	3300      	movi      	r3, 0
 1f2:	2b03      	subi      	r3, 4
 1f4:	60e0      	addu      	r3, r8
 1f6:	9360      	ld.w      	r3, (r3, 0x0)
 1f8:	9361      	ld.w      	r3, (r3, 0x4)
 1fa:	3bbf      	bseti      	r3, 31
 1fc:	6c8f      	mov      	r2, r3
 1fe:	3300      	movi      	r3, 0
 200:	2b03      	subi      	r3, 4
 202:	60e0      	addu      	r3, r8
 204:	9360      	ld.w      	r3, (r3, 0x0)
 206:	b341      	st.w      	r2, (r3, 0x4)
      ret = (void *)((char *)node + SIZEOF_MM_ALLOCNODE);
 208:	3300      	movi      	r3, 0
 20a:	2b07      	subi      	r3, 8
 20c:	60e0      	addu      	r3, r8
 20e:	3200      	movi      	r2, 0
 210:	2a03      	subi      	r2, 4
 212:	60a0      	addu      	r2, r8
 214:	9240      	ld.w      	r2, (r2, 0x0)
 216:	2207      	addi      	r2, 8
 218:	b340      	st.w      	r2, (r3, 0x0)
    mm_leak_add_chunk(hdr);
    mm_record_minfree();
  }
#endif
  mm_givesemaphore(heap);
  if (!ret) {
 21a:	3300      	movi      	r3, 0
 21c:	2b07      	subi      	r3, 8
 21e:	60e0      	addu      	r3, r8
 220:	9360      	ld.w      	r3, (r3, 0x0)
 222:	3b40      	cmpnei      	r3, 0
 224:	0808      	bt      	0x234	// 234 <mm_malloc+0x234>
    printf("Allocation failed, size %d\n", size);
 226:	3300      	movi      	r3, 0
 228:	2b1f      	subi      	r3, 32
 22a:	60e0      	addu      	r3, r8
 22c:	9320      	ld.w      	r1, (r3, 0x0)
 22e:	100d      	lrw      	r0, 0x0	// 260 <mm_malloc+0x260>
 230:	e0000000 	bsr      	0x0	// 0 <printf>
    mm_leak_dump();
#endif
  }

#if (CONFIG_MM_MAX_USED)
  mm_max_usedsize_update(heap);
 234:	3300      	movi      	r3, 0
 236:	2b1b      	subi      	r3, 28
 238:	60e0      	addu      	r3, r8
 23a:	9300      	ld.w      	r0, (r3, 0x0)
 23c:	e0000000 	bsr      	0x0	// 0 <mm_max_usedsize_update>
#endif
  return ret;
 240:	3300      	movi      	r3, 0
 242:	2b07      	subi      	r3, 8
 244:	60e0      	addu      	r3, r8
 246:	9360      	ld.w      	r3, (r3, 0x0)
}
 248:	6c0f      	mov      	r0, r3
 24a:	6fa3      	mov      	r14, r8
 24c:	d9ee2002 	ld.w      	r15, (r14, 0x8)
 250:	d90e2001 	ld.w      	r8, (r14, 0x4)
 254:	9880      	ld.w      	r4, (r14, 0x0)
 256:	1403      	addi      	r14, r14, 12
 258:	783c      	jmp      	r15
 25a:	0000      	bkpt
 25c:	003fffff 	.long	0x003fffff
 260:	00000000 	.long	0x00000000
