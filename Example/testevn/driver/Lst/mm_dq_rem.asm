
Obj/mm_dq_rem.o:     file format elf32-csky-little


Disassembly of section .text:

00000000 <dq_rem>:
 *   dq_rem removes 'node' from 'queue'
 *
 ****************************************************************************/

void dq_rem(dq_entry_t *node, dq_queue_t *queue)
{
   0:	1421      	subi      	r14, r14, 4
   2:	dd0e2000 	st.w      	r8, (r14, 0x0)
   6:	6e3b      	mov      	r8, r14
   8:	1424      	subi      	r14, r14, 16
   a:	3300      	movi      	r3, 0
   c:	2b0b      	subi      	r3, 12
   e:	60e0      	addu      	r3, r8
  10:	b300      	st.w      	r0, (r3, 0x0)
  12:	3300      	movi      	r3, 0
  14:	2b0f      	subi      	r3, 16
  16:	60e0      	addu      	r3, r8
  18:	b320      	st.w      	r1, (r3, 0x0)
  dq_entry_t *prev = node->blink;
  1a:	3300      	movi      	r3, 0
  1c:	2b03      	subi      	r3, 4
  1e:	60e0      	addu      	r3, r8
  20:	3200      	movi      	r2, 0
  22:	2a0b      	subi      	r2, 12
  24:	60a0      	addu      	r2, r8
  26:	9240      	ld.w      	r2, (r2, 0x0)
  28:	9241      	ld.w      	r2, (r2, 0x4)
  2a:	b340      	st.w      	r2, (r3, 0x0)
  dq_entry_t *next = node->flink;
  2c:	3300      	movi      	r3, 0
  2e:	2b07      	subi      	r3, 8
  30:	60e0      	addu      	r3, r8
  32:	3200      	movi      	r2, 0
  34:	2a0b      	subi      	r2, 12
  36:	60a0      	addu      	r2, r8
  38:	9240      	ld.w      	r2, (r2, 0x0)
  3a:	9240      	ld.w      	r2, (r2, 0x0)
  3c:	b340      	st.w      	r2, (r3, 0x0)

  if (!prev)
  3e:	3300      	movi      	r3, 0
  40:	2b03      	subi      	r3, 4
  42:	60e0      	addu      	r3, r8
  44:	9360      	ld.w      	r3, (r3, 0x0)
  46:	3b40      	cmpnei      	r3, 0
  48:	080b      	bt      	0x5e	// 5e <dq_rem+0x5e>
    {
      queue->head = next;
  4a:	3300      	movi      	r3, 0
  4c:	2b0f      	subi      	r3, 16
  4e:	60e0      	addu      	r3, r8
  50:	9360      	ld.w      	r3, (r3, 0x0)
  52:	3200      	movi      	r2, 0
  54:	2a07      	subi      	r2, 8
  56:	60a0      	addu      	r2, r8
  58:	9240      	ld.w      	r2, (r2, 0x0)
  5a:	b340      	st.w      	r2, (r3, 0x0)
  5c:	040a      	br      	0x70	// 70 <dq_rem+0x70>
    }
  else
    {
      prev->flink = next;
  5e:	3300      	movi      	r3, 0
  60:	2b03      	subi      	r3, 4
  62:	60e0      	addu      	r3, r8
  64:	9360      	ld.w      	r3, (r3, 0x0)
  66:	3200      	movi      	r2, 0
  68:	2a07      	subi      	r2, 8
  6a:	60a0      	addu      	r2, r8
  6c:	9240      	ld.w      	r2, (r2, 0x0)
  6e:	b340      	st.w      	r2, (r3, 0x0)
    }

  if (!next)
  70:	3300      	movi      	r3, 0
  72:	2b07      	subi      	r3, 8
  74:	60e0      	addu      	r3, r8
  76:	9360      	ld.w      	r3, (r3, 0x0)
  78:	3b40      	cmpnei      	r3, 0
  7a:	080b      	bt      	0x90	// 90 <dq_rem+0x90>
    {
      queue->tail = prev;
  7c:	3300      	movi      	r3, 0
  7e:	2b0f      	subi      	r3, 16
  80:	60e0      	addu      	r3, r8
  82:	9360      	ld.w      	r3, (r3, 0x0)
  84:	3200      	movi      	r2, 0
  86:	2a03      	subi      	r2, 4
  88:	60a0      	addu      	r2, r8
  8a:	9240      	ld.w      	r2, (r2, 0x0)
  8c:	b341      	st.w      	r2, (r3, 0x4)
  8e:	040a      	br      	0xa2	// a2 <dq_rem+0xa2>
    }
  else
    {
      next->blink = prev;
  90:	3300      	movi      	r3, 0
  92:	2b07      	subi      	r3, 8
  94:	60e0      	addu      	r3, r8
  96:	9360      	ld.w      	r3, (r3, 0x0)
  98:	3200      	movi      	r2, 0
  9a:	2a03      	subi      	r2, 4
  9c:	60a0      	addu      	r2, r8
  9e:	9240      	ld.w      	r2, (r2, 0x0)
  a0:	b341      	st.w      	r2, (r3, 0x4)
    }

  node->flink = NULL;
  a2:	3300      	movi      	r3, 0
  a4:	2b0b      	subi      	r3, 12
  a6:	60e0      	addu      	r3, r8
  a8:	9360      	ld.w      	r3, (r3, 0x0)
  aa:	3200      	movi      	r2, 0
  ac:	b340      	st.w      	r2, (r3, 0x0)
  node->blink = NULL;
  ae:	3300      	movi      	r3, 0
  b0:	2b0b      	subi      	r3, 12
  b2:	60e0      	addu      	r3, r8
  b4:	9360      	ld.w      	r3, (r3, 0x0)
  b6:	3200      	movi      	r2, 0
  b8:	b341      	st.w      	r2, (r3, 0x4)
}
  ba:	6c00      	or      	r0, r0
  bc:	6fa3      	mov      	r14, r8
  be:	d90e2000 	ld.w      	r8, (r14, 0x0)
  c2:	1401      	addi      	r14, r14, 4
  c4:	783c      	jmp      	r15
