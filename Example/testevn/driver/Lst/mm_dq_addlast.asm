
Obj/mm_dq_addlast.o:     file format elf32-csky-little


Disassembly of section .text:

00000000 <dq_addlast>:
 *   dq_addlast adds 'node' to the end of 'queue'
 *
 ****************************************************************************/

void dq_addlast(dq_entry_t *node, dq_queue_t *queue)
{
   0:	1421      	subi      	r14, r14, 4
   2:	dd0e2000 	st.w      	r8, (r14, 0x0)
   6:	6e3b      	mov      	r8, r14
   8:	1422      	subi      	r14, r14, 8
   a:	3300      	movi      	r3, 0
   c:	2b03      	subi      	r3, 4
   e:	60e0      	addu      	r3, r8
  10:	b300      	st.w      	r0, (r3, 0x0)
  12:	3300      	movi      	r3, 0
  14:	2b07      	subi      	r3, 8
  16:	60e0      	addu      	r3, r8
  18:	b320      	st.w      	r1, (r3, 0x0)
  node->flink = NULL;
  1a:	3300      	movi      	r3, 0
  1c:	2b03      	subi      	r3, 4
  1e:	60e0      	addu      	r3, r8
  20:	9360      	ld.w      	r3, (r3, 0x0)
  22:	3200      	movi      	r2, 0
  24:	b340      	st.w      	r2, (r3, 0x0)
  node->blink = queue->tail;
  26:	3300      	movi      	r3, 0
  28:	2b07      	subi      	r3, 8
  2a:	60e0      	addu      	r3, r8
  2c:	9360      	ld.w      	r3, (r3, 0x0)
  2e:	9341      	ld.w      	r2, (r3, 0x4)
  30:	3300      	movi      	r3, 0
  32:	2b03      	subi      	r3, 4
  34:	60e0      	addu      	r3, r8
  36:	9360      	ld.w      	r3, (r3, 0x0)
  38:	b341      	st.w      	r2, (r3, 0x4)

  if (!queue->head)
  3a:	3300      	movi      	r3, 0
  3c:	2b07      	subi      	r3, 8
  3e:	60e0      	addu      	r3, r8
  40:	9360      	ld.w      	r3, (r3, 0x0)
  42:	9360      	ld.w      	r3, (r3, 0x0)
  44:	3b40      	cmpnei      	r3, 0
  46:	0814      	bt      	0x6e	// 6e <dq_addlast+0x6e>
    {
      queue->head = node;
  48:	3300      	movi      	r3, 0
  4a:	2b07      	subi      	r3, 8
  4c:	60e0      	addu      	r3, r8
  4e:	9360      	ld.w      	r3, (r3, 0x0)
  50:	3200      	movi      	r2, 0
  52:	2a03      	subi      	r2, 4
  54:	60a0      	addu      	r2, r8
  56:	9240      	ld.w      	r2, (r2, 0x0)
  58:	b340      	st.w      	r2, (r3, 0x0)
      queue->tail = node;
  5a:	3300      	movi      	r3, 0
  5c:	2b07      	subi      	r3, 8
  5e:	60e0      	addu      	r3, r8
  60:	9360      	ld.w      	r3, (r3, 0x0)
  62:	3200      	movi      	r2, 0
  64:	2a03      	subi      	r2, 4
  66:	60a0      	addu      	r2, r8
  68:	9240      	ld.w      	r2, (r2, 0x0)
  6a:	b341      	st.w      	r2, (r3, 0x4)
  else
    {
      queue->tail->flink = node;
      queue->tail        = node;
    }
}
  6c:	0414      	br      	0x94	// 94 <dq_addlast+0x94>
      queue->tail->flink = node;
  6e:	3300      	movi      	r3, 0
  70:	2b07      	subi      	r3, 8
  72:	60e0      	addu      	r3, r8
  74:	9360      	ld.w      	r3, (r3, 0x0)
  76:	9361      	ld.w      	r3, (r3, 0x4)
  78:	3200      	movi      	r2, 0
  7a:	2a03      	subi      	r2, 4
  7c:	60a0      	addu      	r2, r8
  7e:	9240      	ld.w      	r2, (r2, 0x0)
  80:	b340      	st.w      	r2, (r3, 0x0)
      queue->tail        = node;
  82:	3300      	movi      	r3, 0
  84:	2b07      	subi      	r3, 8
  86:	60e0      	addu      	r3, r8
  88:	9360      	ld.w      	r3, (r3, 0x0)
  8a:	3200      	movi      	r2, 0
  8c:	2a03      	subi      	r2, 4
  8e:	60a0      	addu      	r2, r8
  90:	9240      	ld.w      	r2, (r2, 0x0)
  92:	b341      	st.w      	r2, (r3, 0x4)
}
  94:	6c00      	or      	r0, r0
  96:	6fa3      	mov      	r14, r8
  98:	d90e2000 	ld.w      	r8, (r14, 0x0)
  9c:	1401      	addi      	r14, r14, 4
  9e:	783c      	jmp      	r15
