
Obj/mm_mm_mallinfo.o:     file format elf32-csky-little


Disassembly of section .text:

00000000 <mm_mallinfo>:
 *   mallinfo returns a copy of updated current heap information.
 *
 ****************************************************************************/

int mm_mallinfo(struct mm_heap_s *heap, struct mallinfo *info)
{
   0:	1421      	subi      	r14, r14, 4
   2:	dd0e2000 	st.w      	r8, (r14, 0x0)
   6:	6e3b      	mov      	r8, r14
   8:	1427      	subi      	r14, r14, 28
   a:	3300      	movi      	r3, 0
   c:	2b17      	subi      	r3, 24
   e:	60e0      	addu      	r3, r8
  10:	b300      	st.w      	r0, (r3, 0x0)
  12:	3300      	movi      	r3, 0
  14:	2b1b      	subi      	r3, 28
  16:	60e0      	addu      	r3, r8
  18:	b320      	st.w      	r1, (r3, 0x0)
  struct mm_allocnode_s *node;
  size_t mxordblk = 0;
  1a:	3300      	movi      	r3, 0
  1c:	2b07      	subi      	r3, 8
  1e:	60e0      	addu      	r3, r8
  20:	3200      	movi      	r2, 0
  22:	b340      	st.w      	r2, (r3, 0x0)
  int    ordblks  = 0;  /* Number of non-inuse chunks */
  24:	3300      	movi      	r3, 0
  26:	2b0b      	subi      	r3, 12
  28:	60e0      	addu      	r3, r8
  2a:	3200      	movi      	r2, 0
  2c:	b340      	st.w      	r2, (r3, 0x0)
  size_t uordblks = 0;  /* Total allocated space */
  2e:	3300      	movi      	r3, 0
  30:	2b0f      	subi      	r3, 16
  32:	60e0      	addu      	r3, r8
  34:	3200      	movi      	r2, 0
  36:	b340      	st.w      	r2, (r3, 0x0)
  size_t fordblks = 0;  /* Total non-inuse space */
  38:	3300      	movi      	r3, 0
  3a:	2b13      	subi      	r3, 20
  3c:	60e0      	addu      	r3, r8
  3e:	3200      	movi      	r2, 0
  40:	b340      	st.w      	r2, (r3, 0x0)
       * Retake the semaphore for each region to reduce latencies
       */

      mm_takesemaphore(heap);

      for (node = heap->mm_heapstart[region];
  42:	3300      	movi      	r3, 0
  44:	2b03      	subi      	r3, 4
  46:	60e0      	addu      	r3, r8
  48:	3200      	movi      	r2, 0
  4a:	2a17      	subi      	r2, 24
  4c:	60a0      	addu      	r2, r8
  4e:	9240      	ld.w      	r2, (r2, 0x0)
  50:	9244      	ld.w      	r2, (r2, 0x10)
  52:	b340      	st.w      	r2, (r3, 0x0)
  54:	0450      	br      	0xf4	// f4 <mm_mallinfo+0xf4>
          //      region, node, node->size, (node->preceding & ~MM_ALLOC_BIT),
          //      (node->preceding & MM_ALLOC_BIT) ? 'A' : 'F');

          /* Check if the node corresponds to an allocated memory chunk */

          if ((node->preceding & MM_ALLOC_BIT) != 0)
  56:	3300      	movi      	r3, 0
  58:	2b03      	subi      	r3, 4
  5a:	60e0      	addu      	r3, r8
  5c:	9360      	ld.w      	r3, (r3, 0x0)
  5e:	9361      	ld.w      	r3, (r3, 0x4)
  60:	3bdf      	btsti      	r3, 31
  62:	0c10      	bf      	0x82	// 82 <mm_mallinfo+0x82>
            {
              uordblks += node->size;
  64:	3300      	movi      	r3, 0
  66:	2b03      	subi      	r3, 4
  68:	60e0      	addu      	r3, r8
  6a:	9360      	ld.w      	r3, (r3, 0x0)
  6c:	9320      	ld.w      	r1, (r3, 0x0)
  6e:	3300      	movi      	r3, 0
  70:	2b0f      	subi      	r3, 16
  72:	60e0      	addu      	r3, r8
  74:	3200      	movi      	r2, 0
  76:	2a0f      	subi      	r2, 16
  78:	60a0      	addu      	r2, r8
  7a:	9240      	ld.w      	r2, (r2, 0x0)
  7c:	6084      	addu      	r2, r1
  7e:	b340      	st.w      	r2, (r3, 0x0)
  80:	042c      	br      	0xd8	// d8 <mm_mallinfo+0xd8>
            }
          else
            {
              ordblks++;
  82:	3300      	movi      	r3, 0
  84:	2b0b      	subi      	r3, 12
  86:	60e0      	addu      	r3, r8
  88:	3200      	movi      	r2, 0
  8a:	2a0b      	subi      	r2, 12
  8c:	60a0      	addu      	r2, r8
  8e:	9240      	ld.w      	r2, (r2, 0x0)
  90:	2200      	addi      	r2, 1
  92:	b340      	st.w      	r2, (r3, 0x0)
              fordblks += node->size;
  94:	3300      	movi      	r3, 0
  96:	2b03      	subi      	r3, 4
  98:	60e0      	addu      	r3, r8
  9a:	9360      	ld.w      	r3, (r3, 0x0)
  9c:	9320      	ld.w      	r1, (r3, 0x0)
  9e:	3300      	movi      	r3, 0
  a0:	2b13      	subi      	r3, 20
  a2:	60e0      	addu      	r3, r8
  a4:	3200      	movi      	r2, 0
  a6:	2a13      	subi      	r2, 20
  a8:	60a0      	addu      	r2, r8
  aa:	9240      	ld.w      	r2, (r2, 0x0)
  ac:	6084      	addu      	r2, r1
  ae:	b340      	st.w      	r2, (r3, 0x0)
              if (node->size > mxordblk)
  b0:	3300      	movi      	r3, 0
  b2:	2b03      	subi      	r3, 4
  b4:	60e0      	addu      	r3, r8
  b6:	9360      	ld.w      	r3, (r3, 0x0)
  b8:	9340      	ld.w      	r2, (r3, 0x0)
  ba:	3300      	movi      	r3, 0
  bc:	2b07      	subi      	r3, 8
  be:	60e0      	addu      	r3, r8
  c0:	9360      	ld.w      	r3, (r3, 0x0)
  c2:	648c      	cmphs      	r3, r2
  c4:	080a      	bt      	0xd8	// d8 <mm_mallinfo+0xd8>
                {
                  mxordblk = node->size;
  c6:	3300      	movi      	r3, 0
  c8:	2b07      	subi      	r3, 8
  ca:	60e0      	addu      	r3, r8
  cc:	3200      	movi      	r2, 0
  ce:	2a03      	subi      	r2, 4
  d0:	60a0      	addu      	r2, r8
  d2:	9240      	ld.w      	r2, (r2, 0x0)
  d4:	9240      	ld.w      	r2, (r2, 0x0)
  d6:	b340      	st.w      	r2, (r3, 0x0)
           node = (struct mm_allocnode_s *)((char *)node + node->size))
  d8:	3300      	movi      	r3, 0
  da:	2b03      	subi      	r3, 4
  dc:	60e0      	addu      	r3, r8
  de:	9360      	ld.w      	r3, (r3, 0x0)
  e0:	9340      	ld.w      	r2, (r3, 0x0)
  e2:	3300      	movi      	r3, 0
  e4:	2b03      	subi      	r3, 4
  e6:	60e0      	addu      	r3, r8
  e8:	3100      	movi      	r1, 0
  ea:	2903      	subi      	r1, 4
  ec:	6060      	addu      	r1, r8
  ee:	9120      	ld.w      	r1, (r1, 0x0)
  f0:	6084      	addu      	r2, r1
  f2:	b340      	st.w      	r2, (r3, 0x0)
           node < heap->mm_heapend[region];
  f4:	3300      	movi      	r3, 0
  f6:	2b17      	subi      	r3, 24
  f8:	60e0      	addu      	r3, r8
  fa:	9360      	ld.w      	r3, (r3, 0x0)
  fc:	9345      	ld.w      	r2, (r3, 0x14)
      for (node = heap->mm_heapstart[region];
  fe:	3300      	movi      	r3, 0
 100:	2b03      	subi      	r3, 4
 102:	60e0      	addu      	r3, r8
 104:	9360      	ld.w      	r3, (r3, 0x0)
 106:	648c      	cmphs      	r3, r2
 108:	0fa7      	bf      	0x56	// 56 <mm_mallinfo+0x56>

      mm_givesemaphore(heap);

      //LOG_D("region=%d node=%p heapend=%p\n", region, node, heap->mm_heapend[region]);
      //DEBUGASSERT(node == heap->mm_heapend[region]);
      uordblks += SIZEOF_MM_ALLOCNODE; /* account for the tail node */
 10a:	3300      	movi      	r3, 0
 10c:	2b0f      	subi      	r3, 16
 10e:	60e0      	addu      	r3, r8
 110:	3200      	movi      	r2, 0
 112:	2a0f      	subi      	r2, 16
 114:	60a0      	addu      	r2, r8
 116:	9240      	ld.w      	r2, (r2, 0x0)
 118:	2207      	addi      	r2, 8
 11a:	b340      	st.w      	r2, (r3, 0x0)
    }
#undef region

  //DEBUGASSERT(uordblks + fordblks == heap->mm_heapsize);

  info->arena    = heap->mm_heapsize;
 11c:	3300      	movi      	r3, 0
 11e:	2b17      	subi      	r3, 24
 120:	60e0      	addu      	r3, r8
 122:	9360      	ld.w      	r3, (r3, 0x0)
 124:	9363      	ld.w      	r3, (r3, 0xc)
 126:	6c8f      	mov      	r2, r3
 128:	3300      	movi      	r3, 0
 12a:	2b1b      	subi      	r3, 28
 12c:	60e0      	addu      	r3, r8
 12e:	9360      	ld.w      	r3, (r3, 0x0)
 130:	b340      	st.w      	r2, (r3, 0x0)
  info->ordblks  = ordblks;
 132:	3300      	movi      	r3, 0
 134:	2b1b      	subi      	r3, 28
 136:	60e0      	addu      	r3, r8
 138:	9360      	ld.w      	r3, (r3, 0x0)
 13a:	3200      	movi      	r2, 0
 13c:	2a0b      	subi      	r2, 12
 13e:	60a0      	addu      	r2, r8
 140:	9240      	ld.w      	r2, (r2, 0x0)
 142:	b341      	st.w      	r2, (r3, 0x4)
  info->mxordblk = mxordblk;
 144:	3300      	movi      	r3, 0
 146:	2b07      	subi      	r3, 8
 148:	60e0      	addu      	r3, r8
 14a:	9340      	ld.w      	r2, (r3, 0x0)
 14c:	3300      	movi      	r3, 0
 14e:	2b1b      	subi      	r3, 28
 150:	60e0      	addu      	r3, r8
 152:	9360      	ld.w      	r3, (r3, 0x0)
 154:	b342      	st.w      	r2, (r3, 0x8)
  info->uordblks = uordblks;
 156:	3300      	movi      	r3, 0
 158:	2b0f      	subi      	r3, 16
 15a:	60e0      	addu      	r3, r8
 15c:	9340      	ld.w      	r2, (r3, 0x0)
 15e:	3300      	movi      	r3, 0
 160:	2b1b      	subi      	r3, 28
 162:	60e0      	addu      	r3, r8
 164:	9360      	ld.w      	r3, (r3, 0x0)
 166:	b343      	st.w      	r2, (r3, 0xc)
  info->fordblks = fordblks;
 168:	3300      	movi      	r3, 0
 16a:	2b13      	subi      	r3, 20
 16c:	60e0      	addu      	r3, r8
 16e:	9340      	ld.w      	r2, (r3, 0x0)
 170:	3300      	movi      	r3, 0
 172:	2b1b      	subi      	r3, 28
 174:	60e0      	addu      	r3, r8
 176:	9360      	ld.w      	r3, (r3, 0x0)
 178:	b344      	st.w      	r2, (r3, 0x10)
  return OK;
 17a:	3300      	movi      	r3, 0
}
 17c:	6c0f      	mov      	r0, r3
 17e:	6fa3      	mov      	r14, r8
 180:	d90e2000 	ld.w      	r8, (r14, 0x0)
 184:	1401      	addi      	r14, r14, 4
 186:	783c      	jmp      	r15

00000188 <mm_max_usedsize_update>:

#if (CONFIG_MM_MAX_USED)
static int g_max_used_size = 0;
static int g_max_size_base = CONFIG_MM_KERNEL_HEAPSIZE - 1024 * 2;
int mm_max_usedsize_update(struct mm_heap_s *heap)
{
 188:	1422      	subi      	r14, r14, 8
 18a:	dd0e2000 	st.w      	r8, (r14, 0x0)
 18e:	ddee2001 	st.w      	r15, (r14, 0x4)
 192:	6e3b      	mov      	r8, r14
 194:	1426      	subi      	r14, r14, 24
 196:	3300      	movi      	r3, 0
 198:	2b17      	subi      	r3, 24
 19a:	60e0      	addu      	r3, r8
 19c:	b300      	st.w      	r0, (r3, 0x0)
    struct mallinfo info;
    mm_mallinfo(heap, &info);
 19e:	3200      	movi      	r2, 0
 1a0:	2a13      	subi      	r2, 20
 1a2:	60a0      	addu      	r2, r8
 1a4:	3300      	movi      	r3, 0
 1a6:	2b17      	subi      	r3, 24
 1a8:	60e0      	addu      	r3, r8
 1aa:	6c4b      	mov      	r1, r2
 1ac:	9300      	ld.w      	r0, (r3, 0x0)
 1ae:	e0000000 	bsr      	0x0	// 0 <mm_mallinfo>

    if(info.uordblks > g_max_used_size)
 1b2:	3300      	movi      	r3, 0
 1b4:	2b13      	subi      	r3, 20
 1b6:	60e0      	addu      	r3, r8
 1b8:	9343      	ld.w      	r2, (r3, 0xc)
 1ba:	107a      	lrw      	r3, 0x0	// 220 <mm_get_max_usedsize+0x18>
 1bc:	9360      	ld.w      	r3, (r3, 0x0)
 1be:	648d      	cmplt      	r3, r2
 1c0:	0c19      	bf      	0x1f2	// 1f2 <mm_max_usedsize_update+0x6a>
    {
        g_max_used_size = info.uordblks;
 1c2:	3300      	movi      	r3, 0
 1c4:	2b13      	subi      	r3, 20
 1c6:	60e0      	addu      	r3, r8
 1c8:	9343      	ld.w      	r2, (r3, 0xc)
 1ca:	1076      	lrw      	r3, 0x0	// 220 <mm_get_max_usedsize+0x18>
 1cc:	b340      	st.w      	r2, (r3, 0x0)
        if(g_max_used_size >= g_max_size_base)
 1ce:	1075      	lrw      	r3, 0x0	// 220 <mm_get_max_usedsize+0x18>
 1d0:	9340      	ld.w      	r2, (r3, 0x0)
 1d2:	1075      	lrw      	r3, 0x0	// 224 <mm_get_max_usedsize+0x1c>
 1d4:	9360      	ld.w      	r3, (r3, 0x0)
 1d6:	64c9      	cmplt      	r2, r3
 1d8:	080d      	bt      	0x1f2	// 1f2 <mm_max_usedsize_update+0x6a>
        {
            printf("<mem space warning> peak value %d \n", g_max_used_size);
 1da:	1072      	lrw      	r3, 0x0	// 220 <mm_get_max_usedsize+0x18>
 1dc:	9360      	ld.w      	r3, (r3, 0x0)
 1de:	6c4f      	mov      	r1, r3
 1e0:	1012      	lrw      	r0, 0x0	// 228 <mm_get_max_usedsize+0x20>
 1e2:	e0000000 	bsr      	0x0	// 0 <printf>
#if defined(CONFIG_MM_DETECT_ERROR)
            mm_leak_dump();
#endif
            g_max_size_base += 1024;
 1e6:	1070      	lrw      	r3, 0x0	// 224 <mm_get_max_usedsize+0x1c>
 1e8:	9360      	ld.w      	r3, (r3, 0x0)
 1ea:	1051      	lrw      	r2, 0x400	// 22c <mm_get_max_usedsize+0x24>
 1ec:	608c      	addu      	r2, r3
 1ee:	106e      	lrw      	r3, 0x0	// 224 <mm_get_max_usedsize+0x1c>
 1f0:	b340      	st.w      	r2, (r3, 0x0)
        }
    }
    return g_max_used_size;
 1f2:	106c      	lrw      	r3, 0x0	// 220 <mm_get_max_usedsize+0x18>
 1f4:	9360      	ld.w      	r3, (r3, 0x0)
}
 1f6:	6c0f      	mov      	r0, r3
 1f8:	6fa3      	mov      	r14, r8
 1fa:	d9ee2001 	ld.w      	r15, (r14, 0x4)
 1fe:	d90e2000 	ld.w      	r8, (r14, 0x0)
 202:	1402      	addi      	r14, r14, 8
 204:	783c      	jmp      	r15
	...

00000208 <mm_get_max_usedsize>:

int mm_get_max_usedsize(void)
{
 208:	1421      	subi      	r14, r14, 4
 20a:	dd0e2000 	st.w      	r8, (r14, 0x0)
 20e:	6e3b      	mov      	r8, r14
    return g_max_used_size;
 210:	1064      	lrw      	r3, 0x0	// 220 <mm_get_max_usedsize+0x18>
 212:	9360      	ld.w      	r3, (r3, 0x0)
}
 214:	6c0f      	mov      	r0, r3
 216:	6fa3      	mov      	r14, r8
 218:	d90e2000 	ld.w      	r8, (r14, 0x0)
 21c:	1401      	addi      	r14, r14, 4
 21e:	783c      	jmp      	r15
	...
 22c:	00000400 	.long	0x00000400
