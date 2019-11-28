
Obj/mm_mm_free.o:     file format elf32-csky-little


Disassembly of section .text:

00000000 <mm_free>:
 *   adjacent free chunks if possible.
 *
 ****************************************************************************/

void mm_free(struct mm_heap_s *heap, void *mem, void *caller)
{
   0:	1422      	subi      	r14, r14, 8
   2:	dd0e2000 	st.w      	r8, (r14, 0x0)
   6:	ddee2001 	st.w      	r15, (r14, 0x4)
   a:	6e3b      	mov      	r8, r14
   c:	1427      	subi      	r14, r14, 28
   e:	3300      	movi      	r3, 0
  10:	2b13      	subi      	r3, 20
  12:	60e0      	addu      	r3, r8
  14:	b300      	st.w      	r0, (r3, 0x0)
  16:	3300      	movi      	r3, 0
  18:	2b17      	subi      	r3, 24
  1a:	60e0      	addu      	r3, r8
  1c:	b320      	st.w      	r1, (r3, 0x0)
  1e:	3300      	movi      	r3, 0
  20:	2b1b      	subi      	r3, 28
  22:	60e0      	addu      	r3, r8
  24:	b340      	st.w      	r2, (r3, 0x0)

  //mvdbg("Freeing %p\n", mem);

  /* Protect against attempts to free a NULL reference */

  if (!mem)
  26:	3300      	movi      	r3, 0
  28:	2b17      	subi      	r3, 24
  2a:	60e0      	addu      	r3, r8
  2c:	9360      	ld.w      	r3, (r3, 0x0)
  2e:	3b40      	cmpnei      	r3, 0
  30:	0ce9      	bf      	0x202	// 202 <mm_free+0x202>

  mm_takesemaphore(heap);

  /* Map the memory chunk into a free node */

  node = (struct mm_freenode_s *)((char *)mem - SIZEOF_MM_ALLOCNODE);
  32:	3300      	movi      	r3, 0
  34:	2b03      	subi      	r3, 4
  36:	60e0      	addu      	r3, r8
  38:	3200      	movi      	r2, 0
  3a:	2a17      	subi      	r2, 24
  3c:	60a0      	addu      	r2, r8
  3e:	9240      	ld.w      	r2, (r2, 0x0)
  40:	2a07      	subi      	r2, 8
  42:	b340      	st.w      	r2, (r3, 0x0)
  node->preceding &= ~MM_ALLOC_BIT;
  44:	3300      	movi      	r3, 0
  46:	2b03      	subi      	r3, 4
  48:	60e0      	addu      	r3, r8
  4a:	9360      	ld.w      	r3, (r3, 0x0)
  4c:	9361      	ld.w      	r3, (r3, 0x4)
  4e:	4361      	lsli      	r3, r3, 1
  50:	4b41      	lsri      	r2, r3, 1
  52:	3300      	movi      	r3, 0
  54:	2b03      	subi      	r3, 4
  56:	60e0      	addu      	r3, r8
  58:	9360      	ld.w      	r3, (r3, 0x0)
  5a:	b341      	st.w      	r2, (r3, 0x4)

  /* Check if the following node is free and, if so, merge it */

  next = (struct mm_freenode_s *)((char *)node + node->size);
  5c:	3300      	movi      	r3, 0
  5e:	2b03      	subi      	r3, 4
  60:	60e0      	addu      	r3, r8
  62:	9360      	ld.w      	r3, (r3, 0x0)
  64:	9340      	ld.w      	r2, (r3, 0x0)
  66:	3300      	movi      	r3, 0
  68:	2b07      	subi      	r3, 8
  6a:	60e0      	addu      	r3, r8
  6c:	3100      	movi      	r1, 0
  6e:	2903      	subi      	r1, 4
  70:	6060      	addu      	r1, r8
  72:	9120      	ld.w      	r1, (r1, 0x0)
  74:	6084      	addu      	r2, r1
  76:	b340      	st.w      	r2, (r3, 0x0)
  if ((next->preceding & MM_ALLOC_BIT) == 0)
  78:	3300      	movi      	r3, 0
  7a:	2b07      	subi      	r3, 8
  7c:	60e0      	addu      	r3, r8
  7e:	9360      	ld.w      	r3, (r3, 0x0)
  80:	9361      	ld.w      	r3, (r3, 0x4)
  82:	3bdf      	btsti      	r3, 31
  84:	0856      	bt      	0x130	// 130 <mm_free+0x130>
      /* Get the node following the next node (which will
       * become the new next node). We know that we can never
       * index past the tail chunk because it is always allocated.
       */

      andbeyond = (struct mm_allocnode_s *)((char *)next + next->size);
  86:	3300      	movi      	r3, 0
  88:	2b07      	subi      	r3, 8
  8a:	60e0      	addu      	r3, r8
  8c:	9360      	ld.w      	r3, (r3, 0x0)
  8e:	9340      	ld.w      	r2, (r3, 0x0)
  90:	3300      	movi      	r3, 0
  92:	2b0b      	subi      	r3, 12
  94:	60e0      	addu      	r3, r8
  96:	3100      	movi      	r1, 0
  98:	2907      	subi      	r1, 8
  9a:	6060      	addu      	r1, r8
  9c:	9120      	ld.w      	r1, (r1, 0x0)
  9e:	6084      	addu      	r2, r1
  a0:	b340      	st.w      	r2, (r3, 0x0)
      /* Remove the next node.  There must be a predecessor,
       * but there may not be a successor node.
       */

      //DEBUGASSERT(next->blink);
      next->blink->flink = next->flink;
  a2:	3300      	movi      	r3, 0
  a4:	2b07      	subi      	r3, 8
  a6:	60e0      	addu      	r3, r8
  a8:	9360      	ld.w      	r3, (r3, 0x0)
  aa:	9363      	ld.w      	r3, (r3, 0xc)
  ac:	3200      	movi      	r2, 0
  ae:	2a07      	subi      	r2, 8
  b0:	60a0      	addu      	r2, r8
  b2:	9240      	ld.w      	r2, (r2, 0x0)
  b4:	9242      	ld.w      	r2, (r2, 0x8)
  b6:	b342      	st.w      	r2, (r3, 0x8)
      if (next->flink)
  b8:	3300      	movi      	r3, 0
  ba:	2b07      	subi      	r3, 8
  bc:	60e0      	addu      	r3, r8
  be:	9360      	ld.w      	r3, (r3, 0x0)
  c0:	9362      	ld.w      	r3, (r3, 0x8)
  c2:	3b40      	cmpnei      	r3, 0
  c4:	0c0c      	bf      	0xdc	// dc <mm_free+0xdc>
        {
          next->flink->blink = next->blink;
  c6:	3300      	movi      	r3, 0
  c8:	2b07      	subi      	r3, 8
  ca:	60e0      	addu      	r3, r8
  cc:	9360      	ld.w      	r3, (r3, 0x0)
  ce:	9362      	ld.w      	r3, (r3, 0x8)
  d0:	3200      	movi      	r2, 0
  d2:	2a07      	subi      	r2, 8
  d4:	60a0      	addu      	r2, r8
  d6:	9240      	ld.w      	r2, (r2, 0x0)
  d8:	9243      	ld.w      	r2, (r2, 0xc)
  da:	b343      	st.w      	r2, (r3, 0xc)
        }

      /* Then merge the two chunks */

      node->size          += next->size;
  dc:	3300      	movi      	r3, 0
  de:	2b03      	subi      	r3, 4
  e0:	60e0      	addu      	r3, r8
  e2:	9360      	ld.w      	r3, (r3, 0x0)
  e4:	9340      	ld.w      	r2, (r3, 0x0)
  e6:	3300      	movi      	r3, 0
  e8:	2b07      	subi      	r3, 8
  ea:	60e0      	addu      	r3, r8
  ec:	9360      	ld.w      	r3, (r3, 0x0)
  ee:	9360      	ld.w      	r3, (r3, 0x0)
  f0:	608c      	addu      	r2, r3
  f2:	3300      	movi      	r3, 0
  f4:	2b03      	subi      	r3, 4
  f6:	60e0      	addu      	r3, r8
  f8:	9360      	ld.w      	r3, (r3, 0x0)
  fa:	b340      	st.w      	r2, (r3, 0x0)
      andbeyond->preceding =  node->size | (andbeyond->preceding & MM_ALLOC_BIT);
  fc:	3300      	movi      	r3, 0
  fe:	2b03      	subi      	r3, 4
 100:	60e0      	addu      	r3, r8
 102:	9360      	ld.w      	r3, (r3, 0x0)
 104:	9340      	ld.w      	r2, (r3, 0x0)
 106:	3300      	movi      	r3, 0
 108:	2b0b      	subi      	r3, 12
 10a:	60e0      	addu      	r3, r8
 10c:	9360      	ld.w      	r3, (r3, 0x0)
 10e:	9361      	ld.w      	r3, (r3, 0x4)
 110:	4b7f      	lsri      	r3, r3, 31
 112:	437f      	lsli      	r3, r3, 31
 114:	6c8c      	or      	r2, r3
 116:	3300      	movi      	r3, 0
 118:	2b0b      	subi      	r3, 12
 11a:	60e0      	addu      	r3, r8
 11c:	9360      	ld.w      	r3, (r3, 0x0)
 11e:	b341      	st.w      	r2, (r3, 0x4)
      next                 = (struct mm_freenode_s *)andbeyond;
 120:	3300      	movi      	r3, 0
 122:	2b07      	subi      	r3, 8
 124:	60e0      	addu      	r3, r8
 126:	3200      	movi      	r2, 0
 128:	2a0b      	subi      	r2, 12
 12a:	60a0      	addu      	r2, r8
 12c:	9240      	ld.w      	r2, (r2, 0x0)
 12e:	b340      	st.w      	r2, (r3, 0x0)

  /* Check if the preceding node is also free and, if so, merge
   * it with this node
   */

  prev = (struct mm_freenode_s *)((char *)node - node->preceding);
 130:	3300      	movi      	r3, 0
 132:	2b03      	subi      	r3, 4
 134:	60e0      	addu      	r3, r8
 136:	9360      	ld.w      	r3, (r3, 0x0)
 138:	9361      	ld.w      	r3, (r3, 0x4)
 13a:	3200      	movi      	r2, 0
 13c:	608e      	subu      	r2, r3
 13e:	3300      	movi      	r3, 0
 140:	2b0f      	subi      	r3, 16
 142:	60e0      	addu      	r3, r8
 144:	3100      	movi      	r1, 0
 146:	2903      	subi      	r1, 4
 148:	6060      	addu      	r1, r8
 14a:	9120      	ld.w      	r1, (r1, 0x0)
 14c:	6084      	addu      	r2, r1
 14e:	b340      	st.w      	r2, (r3, 0x0)
  if ((prev->preceding & MM_ALLOC_BIT) == 0)
 150:	3300      	movi      	r3, 0
 152:	2b0f      	subi      	r3, 16
 154:	60e0      	addu      	r3, r8
 156:	9360      	ld.w      	r3, (r3, 0x0)
 158:	9361      	ld.w      	r3, (r3, 0x4)
 15a:	3bdf      	btsti      	r3, 31
 15c:	0848      	bt      	0x1ec	// 1ec <mm_free+0x1ec>
      /* Remove the node.  There must be a predecessor, but there may
       * not be a successor node.
       */

      //DEBUGASSERT(prev->blink);
      prev->blink->flink = prev->flink;
 15e:	3300      	movi      	r3, 0
 160:	2b0f      	subi      	r3, 16
 162:	60e0      	addu      	r3, r8
 164:	9360      	ld.w      	r3, (r3, 0x0)
 166:	9363      	ld.w      	r3, (r3, 0xc)
 168:	3200      	movi      	r2, 0
 16a:	2a0f      	subi      	r2, 16
 16c:	60a0      	addu      	r2, r8
 16e:	9240      	ld.w      	r2, (r2, 0x0)
 170:	9242      	ld.w      	r2, (r2, 0x8)
 172:	b342      	st.w      	r2, (r3, 0x8)
      if (prev->flink)
 174:	3300      	movi      	r3, 0
 176:	2b0f      	subi      	r3, 16
 178:	60e0      	addu      	r3, r8
 17a:	9360      	ld.w      	r3, (r3, 0x0)
 17c:	9362      	ld.w      	r3, (r3, 0x8)
 17e:	3b40      	cmpnei      	r3, 0
 180:	0c0c      	bf      	0x198	// 198 <mm_free+0x198>
        {
          prev->flink->blink = prev->blink;
 182:	3300      	movi      	r3, 0
 184:	2b0f      	subi      	r3, 16
 186:	60e0      	addu      	r3, r8
 188:	9360      	ld.w      	r3, (r3, 0x0)
 18a:	9362      	ld.w      	r3, (r3, 0x8)
 18c:	3200      	movi      	r2, 0
 18e:	2a0f      	subi      	r2, 16
 190:	60a0      	addu      	r2, r8
 192:	9240      	ld.w      	r2, (r2, 0x0)
 194:	9243      	ld.w      	r2, (r2, 0xc)
 196:	b343      	st.w      	r2, (r3, 0xc)
        }

      /* Then merge the two chunks */

      prev->size     += node->size;
 198:	3300      	movi      	r3, 0
 19a:	2b0f      	subi      	r3, 16
 19c:	60e0      	addu      	r3, r8
 19e:	9360      	ld.w      	r3, (r3, 0x0)
 1a0:	9340      	ld.w      	r2, (r3, 0x0)
 1a2:	3300      	movi      	r3, 0
 1a4:	2b03      	subi      	r3, 4
 1a6:	60e0      	addu      	r3, r8
 1a8:	9360      	ld.w      	r3, (r3, 0x0)
 1aa:	9360      	ld.w      	r3, (r3, 0x0)
 1ac:	608c      	addu      	r2, r3
 1ae:	3300      	movi      	r3, 0
 1b0:	2b0f      	subi      	r3, 16
 1b2:	60e0      	addu      	r3, r8
 1b4:	9360      	ld.w      	r3, (r3, 0x0)
 1b6:	b340      	st.w      	r2, (r3, 0x0)
      next->preceding = prev->size | (next->preceding & MM_ALLOC_BIT);
 1b8:	3300      	movi      	r3, 0
 1ba:	2b0f      	subi      	r3, 16
 1bc:	60e0      	addu      	r3, r8
 1be:	9360      	ld.w      	r3, (r3, 0x0)
 1c0:	9340      	ld.w      	r2, (r3, 0x0)
 1c2:	3300      	movi      	r3, 0
 1c4:	2b07      	subi      	r3, 8
 1c6:	60e0      	addu      	r3, r8
 1c8:	9360      	ld.w      	r3, (r3, 0x0)
 1ca:	9361      	ld.w      	r3, (r3, 0x4)
 1cc:	4b7f      	lsri      	r3, r3, 31
 1ce:	437f      	lsli      	r3, r3, 31
 1d0:	6c8c      	or      	r2, r3
 1d2:	3300      	movi      	r3, 0
 1d4:	2b07      	subi      	r3, 8
 1d6:	60e0      	addu      	r3, r8
 1d8:	9360      	ld.w      	r3, (r3, 0x0)
 1da:	b341      	st.w      	r2, (r3, 0x4)
      node            = prev;
 1dc:	3300      	movi      	r3, 0
 1de:	2b03      	subi      	r3, 4
 1e0:	60e0      	addu      	r3, r8
 1e2:	3200      	movi      	r2, 0
 1e4:	2a0f      	subi      	r2, 16
 1e6:	60a0      	addu      	r2, r8
 1e8:	9240      	ld.w      	r2, (r2, 0x0)
 1ea:	b340      	st.w      	r2, (r3, 0x0)
    }

  /* Add the merged node to the nodelist */

  mm_addfreechunk(heap, node);
 1ec:	3200      	movi      	r2, 0
 1ee:	2a03      	subi      	r2, 4
 1f0:	60a0      	addu      	r2, r8
 1f2:	3300      	movi      	r3, 0
 1f4:	2b13      	subi      	r3, 20
 1f6:	60e0      	addu      	r3, r8
 1f8:	9220      	ld.w      	r1, (r2, 0x0)
 1fa:	9300      	ld.w      	r0, (r3, 0x0)
 1fc:	e0000000 	bsr      	0x0	// 0 <mm_addfreechunk>
 200:	0402      	br      	0x204	// 204 <mm_free+0x204>
      return;
 202:	6c00      	or      	r0, r0
  mm_givesemaphore(heap);
}
 204:	6fa3      	mov      	r14, r8
 206:	d9ee2001 	ld.w      	r15, (r14, 0x4)
 20a:	d90e2000 	ld.w      	r8, (r14, 0x0)
 20e:	1402      	addi      	r14, r14, 8
 210:	783c      	jmp      	r15
