
Obj/mm_mm_leak.o:     file format elf32-csky-little


Disassembly of section .text:

00000000 <mdbg_calc_magic>:

#define MDBG_SZ_HEAD sizeof(struct m_dbg_hdr)
#define MDBG_SZ_TAIL 16

static inline bool mdbg_calc_magic(struct m_dbg_hdr *hdr)
{
   0:	1421      	subi      	r14, r14, 4
   2:	dd0e2000 	st.w      	r8, (r14, 0x0)
   6:	6e3b      	mov      	r8, r14
   8:	1422      	subi      	r14, r14, 8
   a:	3300      	movi      	r3, 0
   c:	2b07      	subi      	r3, 8
   e:	60e0      	addu      	r3, r8
  10:	b300      	st.w      	r0, (r3, 0x0)
    uint32_t magic = (uint32_t)hdr->caller;
  12:	3300      	movi      	r3, 0
  14:	2b07      	subi      	r3, 8
  16:	60e0      	addu      	r3, r8
  18:	9360      	ld.w      	r3, (r3, 0x0)
  1a:	9342      	ld.w      	r2, (r3, 0x8)
  1c:	3300      	movi      	r3, 0
  1e:	2b03      	subi      	r3, 4
  20:	60e0      	addu      	r3, r8
  22:	b340      	st.w      	r2, (r3, 0x0)
    magic ^= hdr->size;
  24:	3300      	movi      	r3, 0
  26:	2b07      	subi      	r3, 8
  28:	60e0      	addu      	r3, r8
  2a:	9360      	ld.w      	r3, (r3, 0x0)
  2c:	9363      	ld.w      	r3, (r3, 0xc)
  2e:	4369      	lsli      	r3, r3, 9
  30:	4b69      	lsri      	r3, r3, 9
  32:	6c4f      	mov      	r1, r3
  34:	3300      	movi      	r3, 0
  36:	2b03      	subi      	r3, 4
  38:	60e0      	addu      	r3, r8
  3a:	3200      	movi      	r2, 0
  3c:	2a03      	subi      	r2, 4
  3e:	60a0      	addu      	r2, r8
  40:	9240      	ld.w      	r2, (r2, 0x0)
  42:	6c49      	xor      	r1, r2
  44:	6c87      	mov      	r2, r1
  46:	b340      	st.w      	r2, (r3, 0x0)
    magic ^= hdr->pid;
  48:	3300      	movi      	r3, 0
  4a:	2b07      	subi      	r3, 8
  4c:	60e0      	addu      	r3, r8
  4e:	9360      	ld.w      	r3, (r3, 0x0)
  50:	836f      	ld.b      	r3, (r3, 0xf)
  52:	74cc      	zextb      	r3, r3
  54:	6c4f      	mov      	r1, r3
  56:	3300      	movi      	r3, 0
  58:	2b03      	subi      	r3, 4
  5a:	60e0      	addu      	r3, r8
  5c:	3200      	movi      	r2, 0
  5e:	2a03      	subi      	r2, 4
  60:	60a0      	addu      	r2, r8
  62:	9240      	ld.w      	r2, (r2, 0x0)
  64:	6c49      	xor      	r1, r2
  66:	6c87      	mov      	r2, r1
  68:	b340      	st.w      	r2, (r3, 0x0)
    magic ^= MAGIC_INUSE;
  6a:	3300      	movi      	r3, 0
  6c:	2b03      	subi      	r3, 4
  6e:	60e0      	addu      	r3, r8
  70:	3200      	movi      	r2, 0
  72:	2a03      	subi      	r2, 4
  74:	60a0      	addu      	r2, r8
  76:	9220      	ld.w      	r1, (r2, 0x0)
  78:	1049      	lrw      	r2, 0x65657575	// 9c <mdbg_calc_magic+0x9c>
  7a:	6c49      	xor      	r1, r2
  7c:	6c87      	mov      	r2, r1
  7e:	b340      	st.w      	r2, (r3, 0x0)
    return magic;
  80:	3300      	movi      	r3, 0
  82:	2b03      	subi      	r3, 4
  84:	60e0      	addu      	r3, r8
  86:	9360      	ld.w      	r3, (r3, 0x0)
  88:	3b40      	cmpnei      	r3, 0
  8a:	3300      	movi      	r3, 0
  8c:	60cd      	addc      	r3, r3
  8e:	74cc      	zextb      	r3, r3
}
  90:	6c0f      	mov      	r0, r3
  92:	6fa3      	mov      	r14, r8
  94:	d90e2000 	ld.w      	r8, (r14, 0x0)
  98:	1401      	addi      	r14, r14, 4
  9a:	783c      	jmp      	r15
  9c:	65657575 	.long	0x65657575

000000a0 <mdbg_check_magic_hdr>:

static inline bool mdbg_check_magic_hdr(struct m_dbg_hdr *hdr)
{
  a0:	1422      	subi      	r14, r14, 8
  a2:	dd0e2000 	st.w      	r8, (r14, 0x0)
  a6:	ddee2001 	st.w      	r15, (r14, 0x4)
  aa:	6e3b      	mov      	r8, r14
  ac:	1421      	subi      	r14, r14, 4
  ae:	3300      	movi      	r3, 0
  b0:	2b03      	subi      	r3, 4
  b2:	60e0      	addu      	r3, r8
  b4:	b300      	st.w      	r0, (r3, 0x0)
    return mdbg_calc_magic(hdr) == hdr->magic;
  b6:	3300      	movi      	r3, 0
  b8:	2b03      	subi      	r3, 4
  ba:	60e0      	addu      	r3, r8
  bc:	9300      	ld.w      	r0, (r3, 0x0)
  be:	e0000000 	bsr      	0x0	// 0 <mdbg_calc_magic>
  c2:	6cc3      	mov      	r3, r0
  c4:	6c8f      	mov      	r2, r3
  c6:	3300      	movi      	r3, 0
  c8:	2b03      	subi      	r3, 4
  ca:	60e0      	addu      	r3, r8
  cc:	9360      	ld.w      	r3, (r3, 0x0)
  ce:	9364      	ld.w      	r3, (r3, 0x10)
  d0:	64ca      	cmpne      	r2, r3
  d2:	64c3      	mvcv      	r3
  d4:	74cc      	zextb      	r3, r3
}
  d6:	6c0f      	mov      	r0, r3
  d8:	6fa3      	mov      	r14, r8
  da:	d9ee2001 	ld.w      	r15, (r14, 0x4)
  de:	d90e2000 	ld.w      	r8, (r14, 0x0)
  e2:	1402      	addi      	r14, r14, 8
  e4:	783c      	jmp      	r15
	...

000000e8 <mdbg_check_magic_end>:

static inline bool mdbg_check_magic_end(struct m_dbg_hdr *hdr)
{
  e8:	1421      	subi      	r14, r14, 4
  ea:	dd0e2000 	st.w      	r8, (r14, 0x0)
  ee:	6e3b      	mov      	r8, r14
  f0:	1425      	subi      	r14, r14, 20
  f2:	3300      	movi      	r3, 0
  f4:	2b13      	subi      	r3, 20
  f6:	60e0      	addu      	r3, r8
  f8:	b300      	st.w      	r0, (r3, 0x0)
    void *p = hdr + 1;
  fa:	3300      	movi      	r3, 0
  fc:	2b07      	subi      	r3, 8
  fe:	60e0      	addu      	r3, r8
 100:	3200      	movi      	r2, 0
 102:	2a13      	subi      	r2, 20
 104:	60a0      	addu      	r2, r8
 106:	9240      	ld.w      	r2, (r2, 0x0)
 108:	2213      	addi      	r2, 20
 10a:	b340      	st.w      	r2, (r3, 0x0)
    uint32_t *m = (uint32_t *)((uint8_t *)p + hdr->size);
 10c:	3300      	movi      	r3, 0
 10e:	2b13      	subi      	r3, 20
 110:	60e0      	addu      	r3, r8
 112:	9360      	ld.w      	r3, (r3, 0x0)
 114:	9363      	ld.w      	r3, (r3, 0xc)
 116:	4369      	lsli      	r3, r3, 9
 118:	4b69      	lsri      	r3, r3, 9
 11a:	6c4f      	mov      	r1, r3
 11c:	3300      	movi      	r3, 0
 11e:	2b0b      	subi      	r3, 12
 120:	60e0      	addu      	r3, r8
 122:	3200      	movi      	r2, 0
 124:	2a07      	subi      	r2, 8
 126:	60a0      	addu      	r2, r8
 128:	9240      	ld.w      	r2, (r2, 0x0)
 12a:	6084      	addu      	r2, r1
 12c:	b340      	st.w      	r2, (r3, 0x0)
    uint32_t magic = MAGIC_END ^ hdr->magic;
 12e:	3300      	movi      	r3, 0
 130:	2b13      	subi      	r3, 20
 132:	60e0      	addu      	r3, r8
 134:	9360      	ld.w      	r3, (r3, 0x0)
 136:	9324      	ld.w      	r1, (r3, 0x10)
 138:	3300      	movi      	r3, 0
 13a:	2b0f      	subi      	r3, 16
 13c:	60e0      	addu      	r3, r8
 13e:	ea820133 	lrw      	r2, 0xe5e5e5e5	// 608 <is_valid_address+0x64>
 142:	6c49      	xor      	r1, r2
 144:	6c87      	mov      	r2, r1
 146:	b340      	st.w      	r2, (r3, 0x0)
    int i;

    for (i=0;i<MDBG_SZ_TAIL/4;i++) {
 148:	3300      	movi      	r3, 0
 14a:	2b03      	subi      	r3, 4
 14c:	60e0      	addu      	r3, r8
 14e:	3200      	movi      	r2, 0
 150:	b340      	st.w      	r2, (r3, 0x0)
 152:	041d      	br      	0x18c	// 18c <mdbg_check_magic_end+0xa4>
        if (m[i] != magic)
 154:	3300      	movi      	r3, 0
 156:	2b03      	subi      	r3, 4
 158:	60e0      	addu      	r3, r8
 15a:	9360      	ld.w      	r3, (r3, 0x0)
 15c:	4362      	lsli      	r3, r3, 2
 15e:	3200      	movi      	r2, 0
 160:	2a0b      	subi      	r2, 12
 162:	60a0      	addu      	r2, r8
 164:	9240      	ld.w      	r2, (r2, 0x0)
 166:	60c8      	addu      	r3, r2
 168:	9340      	ld.w      	r2, (r3, 0x0)
 16a:	3300      	movi      	r3, 0
 16c:	2b0f      	subi      	r3, 16
 16e:	60e0      	addu      	r3, r8
 170:	9360      	ld.w      	r3, (r3, 0x0)
 172:	64ca      	cmpne      	r2, r3
 174:	0c03      	bf      	0x17a	// 17a <mdbg_check_magic_end+0x92>
            return false;
 176:	3300      	movi      	r3, 0
 178:	0411      	br      	0x19a	// 19a <mdbg_check_magic_end+0xb2>
    for (i=0;i<MDBG_SZ_TAIL/4;i++) {
 17a:	3300      	movi      	r3, 0
 17c:	2b03      	subi      	r3, 4
 17e:	60e0      	addu      	r3, r8
 180:	3200      	movi      	r2, 0
 182:	2a03      	subi      	r2, 4
 184:	60a0      	addu      	r2, r8
 186:	9240      	ld.w      	r2, (r2, 0x0)
 188:	2200      	addi      	r2, 1
 18a:	b340      	st.w      	r2, (r3, 0x0)
 18c:	3300      	movi      	r3, 0
 18e:	2b03      	subi      	r3, 4
 190:	60e0      	addu      	r3, r8
 192:	9360      	ld.w      	r3, (r3, 0x0)
 194:	3b23      	cmplti      	r3, 4
 196:	0bdf      	bt      	0x154	// 154 <mdbg_check_magic_end+0x6c>
    }

    return true;
 198:	3301      	movi      	r3, 1
}
 19a:	6c0f      	mov      	r0, r3
 19c:	6fa3      	mov      	r14, r8
 19e:	d90e2000 	ld.w      	r8, (r14, 0x0)
 1a2:	1401      	addi      	r14, r14, 4
 1a4:	783c      	jmp      	r15
	...

000001a8 <addr2hash>:
static bool start_statistics = false;
static struct m_dbg_hdr *caddr;
static struct m_dbg_hdr *caddr_l;

static inline int addr2hash(void *p)
{
 1a8:	1421      	subi      	r14, r14, 4
 1aa:	dd0e2000 	st.w      	r8, (r14, 0x0)
 1ae:	6e3b      	mov      	r8, r14
 1b0:	1422      	subi      	r14, r14, 8
 1b2:	3300      	movi      	r3, 0
 1b4:	2b07      	subi      	r3, 8
 1b6:	60e0      	addu      	r3, r8
 1b8:	b300      	st.w      	r0, (r3, 0x0)
    uint32_t addr = (uint32_t)p;
 1ba:	3300      	movi      	r3, 0
 1bc:	2b03      	subi      	r3, 4
 1be:	60e0      	addu      	r3, r8
 1c0:	3200      	movi      	r2, 0
 1c2:	2a07      	subi      	r2, 8
 1c4:	60a0      	addu      	r2, r8
 1c6:	9240      	ld.w      	r2, (r2, 0x0)
 1c8:	b340      	st.w      	r2, (r3, 0x0)
    addr >>= 3;
 1ca:	3300      	movi      	r3, 0
 1cc:	2b03      	subi      	r3, 4
 1ce:	60e0      	addu      	r3, r8
 1d0:	3200      	movi      	r2, 0
 1d2:	2a03      	subi      	r2, 4
 1d4:	60a0      	addu      	r2, r8
 1d6:	9240      	ld.w      	r2, (r2, 0x0)
 1d8:	4a43      	lsri      	r2, r2, 3
 1da:	b340      	st.w      	r2, (r3, 0x0)
    addr ^= addr >> 11;
 1dc:	3300      	movi      	r3, 0
 1de:	2b03      	subi      	r3, 4
 1e0:	60e0      	addu      	r3, r8
 1e2:	9360      	ld.w      	r3, (r3, 0x0)
 1e4:	4b2b      	lsri      	r1, r3, 11
 1e6:	3300      	movi      	r3, 0
 1e8:	2b03      	subi      	r3, 4
 1ea:	60e0      	addu      	r3, r8
 1ec:	3200      	movi      	r2, 0
 1ee:	2a03      	subi      	r2, 4
 1f0:	60a0      	addu      	r2, r8
 1f2:	9240      	ld.w      	r2, (r2, 0x0)
 1f4:	6c49      	xor      	r1, r2
 1f6:	6c87      	mov      	r2, r1
 1f8:	b340      	st.w      	r2, (r3, 0x0)
    return addr & (MAX_HASH - 1);
 1fa:	3300      	movi      	r3, 0
 1fc:	2b03      	subi      	r3, 4
 1fe:	60e0      	addu      	r3, r8
 200:	9340      	ld.w      	r2, (r3, 0x0)
 202:	330f      	movi      	r3, 15
 204:	68c8      	and      	r3, r2
}
 206:	6c0f      	mov      	r0, r3
 208:	6fa3      	mov      	r14, r8
 20a:	d90e2000 	ld.w      	r8, (r14, 0x0)
 20e:	1401      	addi      	r14, r14, 4
 210:	783c      	jmp      	r15
	...

00000214 <mm_dbg_clone>:
struct mm_status {
    dq_queue_t  list[MAX_HASH];
};

void mm_dbg_clone(struct m_dbg_hdr * src , struct m_dbg_hdr * dst)
{
 214:	1421      	subi      	r14, r14, 4
 216:	dd0e2000 	st.w      	r8, (r14, 0x0)
 21a:	6e3b      	mov      	r8, r14
 21c:	1422      	subi      	r14, r14, 8
 21e:	3300      	movi      	r3, 0
 220:	2b03      	subi      	r3, 4
 222:	60e0      	addu      	r3, r8
 224:	b300      	st.w      	r0, (r3, 0x0)
 226:	3300      	movi      	r3, 0
 228:	2b07      	subi      	r3, 8
 22a:	60e0      	addu      	r3, r8
 22c:	b320      	st.w      	r1, (r3, 0x0)
    dst->caller  = src->caller;
 22e:	3300      	movi      	r3, 0
 230:	2b03      	subi      	r3, 4
 232:	60e0      	addu      	r3, r8
 234:	9360      	ld.w      	r3, (r3, 0x0)
 236:	9342      	ld.w      	r2, (r3, 0x8)
 238:	3300      	movi      	r3, 0
 23a:	2b07      	subi      	r3, 8
 23c:	60e0      	addu      	r3, r8
 23e:	9360      	ld.w      	r3, (r3, 0x0)
 240:	b342      	st.w      	r2, (r3, 0x8)
    dst->size = src->size;
 242:	3300      	movi      	r3, 0
 244:	2b03      	subi      	r3, 4
 246:	60e0      	addu      	r3, r8
 248:	9360      	ld.w      	r3, (r3, 0x0)
 24a:	9363      	ld.w      	r3, (r3, 0xc)
 24c:	4369      	lsli      	r3, r3, 9
 24e:	4b49      	lsri      	r2, r3, 9
 250:	3300      	movi      	r3, 0
 252:	2b07      	subi      	r3, 8
 254:	60e0      	addu      	r3, r8
 256:	9360      	ld.w      	r3, (r3, 0x0)
 258:	4249      	lsli      	r2, r2, 9
 25a:	4a49      	lsri      	r2, r2, 9
 25c:	9323      	ld.w      	r1, (r3, 0xc)
 25e:	4937      	lsri      	r1, r1, 23
 260:	4137      	lsli      	r1, r1, 23
 262:	6c84      	or      	r2, r1
 264:	b343      	st.w      	r2, (r3, 0xc)
    dst->referenced = src->referenced;
 266:	3300      	movi      	r3, 0
 268:	2b03      	subi      	r3, 4
 26a:	60e0      	addu      	r3, r8
 26c:	9360      	ld.w      	r3, (r3, 0x0)
 26e:	836e      	ld.b      	r3, (r3, 0xe)
 270:	4378      	lsli      	r3, r3, 24
 272:	4b7f      	lsri      	r3, r3, 31
 274:	748c      	zextb      	r2, r3
 276:	3300      	movi      	r3, 0
 278:	2b07      	subi      	r3, 8
 27a:	60e0      	addu      	r3, r8
 27c:	9360      	ld.w      	r3, (r3, 0x0)
 27e:	4207      	lsli      	r0, r2, 7
 280:	832e      	ld.b      	r1, (r3, 0xe)
 282:	327f      	movi      	r2, 127
 284:	6884      	and      	r2, r1
 286:	6c4b      	mov      	r1, r2
 288:	6c83      	mov      	r2, r0
 28a:	6c84      	or      	r2, r1
 28c:	a34e      	st.b      	r2, (r3, 0xe)
    dst->pid = src->pid;
 28e:	3300      	movi      	r3, 0
 290:	2b03      	subi      	r3, 4
 292:	60e0      	addu      	r3, r8
 294:	9360      	ld.w      	r3, (r3, 0x0)
 296:	836f      	ld.b      	r3, (r3, 0xf)
 298:	748c      	zextb      	r2, r3
 29a:	3300      	movi      	r3, 0
 29c:	2b07      	subi      	r3, 8
 29e:	60e0      	addu      	r3, r8
 2a0:	9360      	ld.w      	r3, (r3, 0x0)
 2a2:	a34f      	st.b      	r2, (r3, 0xf)
    dst->magic = src->magic;
 2a4:	3300      	movi      	r3, 0
 2a6:	2b03      	subi      	r3, 4
 2a8:	60e0      	addu      	r3, r8
 2aa:	9360      	ld.w      	r3, (r3, 0x0)
 2ac:	9344      	ld.w      	r2, (r3, 0x10)
 2ae:	3300      	movi      	r3, 0
 2b0:	2b07      	subi      	r3, 8
 2b2:	60e0      	addu      	r3, r8
 2b4:	9360      	ld.w      	r3, (r3, 0x0)
 2b6:	b344      	st.w      	r2, (r3, 0x10)
}
 2b8:	6c00      	or      	r0, r0
 2ba:	6fa3      	mov      	r14, r8
 2bc:	d90e2000 	ld.w      	r8, (r14, 0x0)
 2c0:	1401      	addi      	r14, r14, 4
 2c2:	783c      	jmp      	r15

000002c4 <mm_statistics_save>:
void mm_statistics_save(void)
{
 2c4:	1421      	subi      	r14, r14, 4
 2c6:	dd0e2000 	st.w      	r8, (r14, 0x0)
 2ca:	6e3b      	mov      	r8, r14
    start_statistics = false;
 2cc:	016f      	lrw      	r3, 0x0	// 60c <is_valid_address+0x68>
 2ce:	3200      	movi      	r2, 0
 2d0:	a340      	st.b      	r2, (r3, 0x0)
}
 2d2:	6c00      	or      	r0, r0
 2d4:	6fa3      	mov      	r14, r8
 2d6:	d90e2000 	ld.w      	r8, (r14, 0x0)
 2da:	1401      	addi      	r14, r14, 4
 2dc:	783c      	jmp      	r15
	...

000002e0 <mm_statistics_restore>:

void mm_statistics_restore(void)
{
 2e0:	1421      	subi      	r14, r14, 4
 2e2:	dd0e2000 	st.w      	r8, (r14, 0x0)
 2e6:	6e3b      	mov      	r8, r14
    start_statistics = true;
 2e8:	0176      	lrw      	r3, 0x0	// 60c <is_valid_address+0x68>
 2ea:	3201      	movi      	r2, 1
 2ec:	a340      	st.b      	r2, (r3, 0x0)
}
 2ee:	6c00      	or      	r0, r0
 2f0:	6fa3      	mov      	r14, r8
 2f2:	d90e2000 	ld.w      	r8, (r14, 0x0)
 2f6:	1401      	addi      	r14, r14, 4
 2f8:	783c      	jmp      	r15
	...

000002fc <mm_do_snapshoot>:

void mm_do_snapshoot(struct mm_status * src, struct mm_status * dst)
{
 2fc:	1423      	subi      	r14, r14, 12
 2fe:	b880      	st.w      	r4, (r14, 0x0)
 300:	dd0e2001 	st.w      	r8, (r14, 0x4)
 304:	ddee2002 	st.w      	r15, (r14, 0x8)
 308:	6e3b      	mov      	r8, r14
 30a:	1427      	subi      	r14, r14, 28
 30c:	3300      	movi      	r3, 0
 30e:	2b17      	subi      	r3, 24
 310:	60e0      	addu      	r3, r8
 312:	b300      	st.w      	r0, (r3, 0x0)
 314:	3300      	movi      	r3, 0
 316:	2b1b      	subi      	r3, 28
 318:	60e0      	addu      	r3, r8
 31a:	b320      	st.w      	r1, (r3, 0x0)
    int item = 0;
 31c:	3300      	movi      	r3, 0
 31e:	2b03      	subi      	r3, 4
 320:	60e0      	addu      	r3, r8
 322:	3200      	movi      	r2, 0
 324:	b340      	st.w      	r2, (r3, 0x0)
    dq_queue_t * queue = NULL;
 326:	3300      	movi      	r3, 0
 328:	2b0b      	subi      	r3, 12
 32a:	60e0      	addu      	r3, r8
 32c:	3200      	movi      	r2, 0
 32e:	b340      	st.w      	r2, (r3, 0x0)
    dq_entry_t * entry = NULL;
 330:	3300      	movi      	r3, 0
 332:	2b07      	subi      	r3, 8
 334:	60e0      	addu      	r3, r8
 336:	3200      	movi      	r2, 0
 338:	b340      	st.w      	r2, (r3, 0x0)

    struct m_dbg_hdr *node = NULL;
 33a:	3300      	movi      	r3, 0
 33c:	2b0f      	subi      	r3, 16
 33e:	60e0      	addu      	r3, r8
 340:	3200      	movi      	r2, 0
 342:	b340      	st.w      	r2, (r3, 0x0)
    struct m_dbg_hdr *chunk = NULL;
 344:	3300      	movi      	r3, 0
 346:	2b13      	subi      	r3, 20
 348:	60e0      	addu      	r3, r8
 34a:	3200      	movi      	r2, 0
 34c:	b340      	st.w      	r2, (r3, 0x0)

    for(; item < MAX_HASH; item++) {
 34e:	045c      	br      	0x406	// 406 <mm_do_snapshoot+0x10a>
        queue = &(src->list[item]);
 350:	3300      	movi      	r3, 0
 352:	2b0b      	subi      	r3, 12
 354:	60e0      	addu      	r3, r8
 356:	3100      	movi      	r1, 0
 358:	2917      	subi      	r1, 24
 35a:	6060      	addu      	r1, r8
 35c:	3200      	movi      	r2, 0
 35e:	2a03      	subi      	r2, 4
 360:	60a0      	addu      	r2, r8
 362:	9240      	ld.w      	r2, (r2, 0x0)
 364:	4243      	lsli      	r2, r2, 3
 366:	9120      	ld.w      	r1, (r1, 0x0)
 368:	6084      	addu      	r2, r1
 36a:	b340      	st.w      	r2, (r3, 0x0)
        entry = queue->head;
 36c:	3300      	movi      	r3, 0
 36e:	2b07      	subi      	r3, 8
 370:	60e0      	addu      	r3, r8
 372:	3200      	movi      	r2, 0
 374:	2a0b      	subi      	r2, 12
 376:	60a0      	addu      	r2, r8
 378:	9240      	ld.w      	r2, (r2, 0x0)
 37a:	9240      	ld.w      	r2, (r2, 0x0)
 37c:	b340      	st.w      	r2, (r3, 0x0)

        for(; entry != NULL; ) {
 37e:	0435      	br      	0x3e8	// 3e8 <mm_do_snapshoot+0xec>
            chunk = (struct m_dbg_hdr *)malloc (sizeof (struct m_dbg_hdr));
 380:	3400      	movi      	r4, 0
 382:	2c13      	subi      	r4, 20
 384:	6120      	addu      	r4, r8
 386:	3014      	movi      	r0, 20
 388:	e0000000 	bsr      	0x0	// 0 <malloc>
 38c:	6cc3      	mov      	r3, r0
 38e:	b460      	st.w      	r3, (r4, 0x0)
            node = (struct m_dbg_hdr *)entry;
 390:	3300      	movi      	r3, 0
 392:	2b0f      	subi      	r3, 16
 394:	60e0      	addu      	r3, r8
 396:	3200      	movi      	r2, 0
 398:	2a07      	subi      	r2, 8
 39a:	60a0      	addu      	r2, r8
 39c:	9240      	ld.w      	r2, (r2, 0x0)
 39e:	b340      	st.w      	r2, (r3, 0x0)
            mm_dbg_clone(node, chunk);
 3a0:	3200      	movi      	r2, 0
 3a2:	2a13      	subi      	r2, 20
 3a4:	60a0      	addu      	r2, r8
 3a6:	3300      	movi      	r3, 0
 3a8:	2b0f      	subi      	r3, 16
 3aa:	60e0      	addu      	r3, r8
 3ac:	9220      	ld.w      	r1, (r2, 0x0)
 3ae:	9300      	ld.w      	r0, (r3, 0x0)
 3b0:	e0000000 	bsr      	0x0	// 214 <mm_dbg_clone>
            dq_addlast(&chunk->node, &(dst->list[item]));
 3b4:	3300      	movi      	r3, 0
 3b6:	2b13      	subi      	r3, 20
 3b8:	60e0      	addu      	r3, r8
 3ba:	9300      	ld.w      	r0, (r3, 0x0)
 3bc:	3200      	movi      	r2, 0
 3be:	2a1b      	subi      	r2, 28
 3c0:	60a0      	addu      	r2, r8
 3c2:	3300      	movi      	r3, 0
 3c4:	2b03      	subi      	r3, 4
 3c6:	60e0      	addu      	r3, r8
 3c8:	9360      	ld.w      	r3, (r3, 0x0)
 3ca:	4363      	lsli      	r3, r3, 3
 3cc:	9240      	ld.w      	r2, (r2, 0x0)
 3ce:	60c8      	addu      	r3, r2
 3d0:	6c4f      	mov      	r1, r3
 3d2:	e0000000 	bsr      	0x0	// 0 <dq_addlast>
            entry = dq_next(entry);
 3d6:	3300      	movi      	r3, 0
 3d8:	2b07      	subi      	r3, 8
 3da:	60e0      	addu      	r3, r8
 3dc:	3200      	movi      	r2, 0
 3de:	2a07      	subi      	r2, 8
 3e0:	60a0      	addu      	r2, r8
 3e2:	9240      	ld.w      	r2, (r2, 0x0)
 3e4:	9240      	ld.w      	r2, (r2, 0x0)
 3e6:	b340      	st.w      	r2, (r3, 0x0)
        for(; entry != NULL; ) {
 3e8:	3300      	movi      	r3, 0
 3ea:	2b07      	subi      	r3, 8
 3ec:	60e0      	addu      	r3, r8
 3ee:	9360      	ld.w      	r3, (r3, 0x0)
 3f0:	3b40      	cmpnei      	r3, 0
 3f2:	0bc7      	bt      	0x380	// 380 <mm_do_snapshoot+0x84>
    for(; item < MAX_HASH; item++) {
 3f4:	3300      	movi      	r3, 0
 3f6:	2b03      	subi      	r3, 4
 3f8:	60e0      	addu      	r3, r8
 3fa:	3200      	movi      	r2, 0
 3fc:	2a03      	subi      	r2, 4
 3fe:	60a0      	addu      	r2, r8
 400:	9240      	ld.w      	r2, (r2, 0x0)
 402:	2200      	addi      	r2, 1
 404:	b340      	st.w      	r2, (r3, 0x0)
 406:	3300      	movi      	r3, 0
 408:	2b03      	subi      	r3, 4
 40a:	60e0      	addu      	r3, r8
 40c:	9360      	ld.w      	r3, (r3, 0x0)
 40e:	3b2f      	cmplti      	r3, 16
 410:	0ba0      	bt      	0x350	// 350 <mm_do_snapshoot+0x54>
        }
    }
}
 412:	6c00      	or      	r0, r0
 414:	6fa3      	mov      	r14, r8
 416:	d9ee2002 	ld.w      	r15, (r14, 0x8)
 41a:	d90e2001 	ld.w      	r8, (r14, 0x4)
 41e:	9880      	ld.w      	r4, (r14, 0x0)
 420:	1403      	addi      	r14, r14, 12
 422:	783c      	jmp      	r15

00000424 <mm_release_snapshoot>:

void mm_release_snapshoot(void)
{
 424:	1422      	subi      	r14, r14, 8
 426:	dd0e2000 	st.w      	r8, (r14, 0x0)
 42a:	ddee2001 	st.w      	r15, (r14, 0x4)
 42e:	6e3b      	mov      	r8, r14
 430:	1424      	subi      	r14, r14, 16
    int item = 0;
 432:	3300      	movi      	r3, 0
 434:	2b03      	subi      	r3, 4
 436:	60e0      	addu      	r3, r8
 438:	3200      	movi      	r2, 0
 43a:	b340      	st.w      	r2, (r3, 0x0)
    dq_queue_t * queue = NULL;
 43c:	3300      	movi      	r3, 0
 43e:	2b0b      	subi      	r3, 12
 440:	60e0      	addu      	r3, r8
 442:	3200      	movi      	r2, 0
 444:	b340      	st.w      	r2, (r3, 0x0)
    dq_entry_t * entry = NULL;
 446:	3300      	movi      	r3, 0
 448:	2b07      	subi      	r3, 8
 44a:	60e0      	addu      	r3, r8
 44c:	3200      	movi      	r2, 0
 44e:	b340      	st.w      	r2, (r3, 0x0)
    struct m_dbg_hdr * node = NULL;
 450:	3300      	movi      	r3, 0
 452:	2b0f      	subi      	r3, 16
 454:	60e0      	addu      	r3, r8
 456:	3200      	movi      	r2, 0
 458:	b340      	st.w      	r2, (r3, 0x0)

    for(; item < MAX_HASH ; item ++) {
 45a:	0446      	br      	0x4e6	// 4e6 <mm_release_snapshoot+0xc2>
        queue = &(mm_status_snapshoot.list[item]);
 45c:	3300      	movi      	r3, 0
 45e:	2b0b      	subi      	r3, 12
 460:	60e0      	addu      	r3, r8
 462:	3200      	movi      	r2, 0
 464:	2a03      	subi      	r2, 4
 466:	60a0      	addu      	r2, r8
 468:	9240      	ld.w      	r2, (r2, 0x0)
 46a:	4243      	lsli      	r2, r2, 3
 46c:	1329      	lrw      	r1, 0x0	// 610 <is_valid_address+0x6c>
 46e:	6084      	addu      	r2, r1
 470:	b340      	st.w      	r2, (r3, 0x0)
        entry = queue->head;
 472:	3300      	movi      	r3, 0
 474:	2b07      	subi      	r3, 8
 476:	60e0      	addu      	r3, r8
 478:	3200      	movi      	r2, 0
 47a:	2a0b      	subi      	r2, 12
 47c:	60a0      	addu      	r2, r8
 47e:	9240      	ld.w      	r2, (r2, 0x0)
 480:	9240      	ld.w      	r2, (r2, 0x0)
 482:	b340      	st.w      	r2, (r3, 0x0)

        for(; entry != NULL; ) {
 484:	0422      	br      	0x4c8	// 4c8 <mm_release_snapshoot+0xa4>
            dq_rem(entry, queue);
 486:	3200      	movi      	r2, 0
 488:	2a0b      	subi      	r2, 12
 48a:	60a0      	addu      	r2, r8
 48c:	3300      	movi      	r3, 0
 48e:	2b07      	subi      	r3, 8
 490:	60e0      	addu      	r3, r8
 492:	9220      	ld.w      	r1, (r2, 0x0)
 494:	9300      	ld.w      	r0, (r3, 0x0)
 496:	e0000000 	bsr      	0x0	// 0 <dq_rem>
            node = (struct m_dbg_hdr *)entry;
 49a:	3300      	movi      	r3, 0
 49c:	2b0f      	subi      	r3, 16
 49e:	60e0      	addu      	r3, r8
 4a0:	3200      	movi      	r2, 0
 4a2:	2a07      	subi      	r2, 8
 4a4:	60a0      	addu      	r2, r8
 4a6:	9240      	ld.w      	r2, (r2, 0x0)
 4a8:	b340      	st.w      	r2, (r3, 0x0)
            free(node);
 4aa:	3300      	movi      	r3, 0
 4ac:	2b0f      	subi      	r3, 16
 4ae:	60e0      	addu      	r3, r8
 4b0:	9300      	ld.w      	r0, (r3, 0x0)
 4b2:	e0000000 	bsr      	0x0	// 0 <free>
            entry = dq_peek(queue);
 4b6:	3300      	movi      	r3, 0
 4b8:	2b07      	subi      	r3, 8
 4ba:	60e0      	addu      	r3, r8
 4bc:	3200      	movi      	r2, 0
 4be:	2a0b      	subi      	r2, 12
 4c0:	60a0      	addu      	r2, r8
 4c2:	9240      	ld.w      	r2, (r2, 0x0)
 4c4:	9240      	ld.w      	r2, (r2, 0x0)
 4c6:	b340      	st.w      	r2, (r3, 0x0)
        for(; entry != NULL; ) {
 4c8:	3300      	movi      	r3, 0
 4ca:	2b07      	subi      	r3, 8
 4cc:	60e0      	addu      	r3, r8
 4ce:	9360      	ld.w      	r3, (r3, 0x0)
 4d0:	3b40      	cmpnei      	r3, 0
 4d2:	0bda      	bt      	0x486	// 486 <mm_release_snapshoot+0x62>
    for(; item < MAX_HASH ; item ++) {
 4d4:	3300      	movi      	r3, 0
 4d6:	2b03      	subi      	r3, 4
 4d8:	60e0      	addu      	r3, r8
 4da:	3200      	movi      	r2, 0
 4dc:	2a03      	subi      	r2, 4
 4de:	60a0      	addu      	r2, r8
 4e0:	9240      	ld.w      	r2, (r2, 0x0)
 4e2:	2200      	addi      	r2, 1
 4e4:	b340      	st.w      	r2, (r3, 0x0)
 4e6:	3300      	movi      	r3, 0
 4e8:	2b03      	subi      	r3, 4
 4ea:	60e0      	addu      	r3, r8
 4ec:	9360      	ld.w      	r3, (r3, 0x0)
 4ee:	3b2f      	cmplti      	r3, 16
 4f0:	0bb6      	bt      	0x45c	// 45c <mm_release_snapshoot+0x38>
        }
    }
}
 4f2:	6c00      	or      	r0, r0
 4f4:	6fa3      	mov      	r14, r8
 4f6:	d9ee2001 	ld.w      	r15, (r14, 0x4)
 4fa:	d90e2000 	ld.w      	r8, (r14, 0x0)
 4fe:	1402      	addi      	r14, r14, 8
 500:	783c      	jmp      	r15
	...

00000504 <mm_leak_add_chunk>:

void mm_leak_add_chunk(struct m_dbg_hdr *chunk)
{
 504:	1423      	subi      	r14, r14, 12
 506:	b880      	st.w      	r4, (r14, 0x0)
 508:	dd0e2001 	st.w      	r8, (r14, 0x4)
 50c:	ddee2002 	st.w      	r15, (r14, 0x8)
 510:	6e3b      	mov      	r8, r14
 512:	1421      	subi      	r14, r14, 4
 514:	3300      	movi      	r3, 0
 516:	2b03      	subi      	r3, 4
 518:	60e0      	addu      	r3, r8
 51a:	b300      	st.w      	r0, (r3, 0x0)
    dq_addlast(&chunk->node, &mm_status.list[addr2hash(chunk)]);
 51c:	3300      	movi      	r3, 0
 51e:	2b03      	subi      	r3, 4
 520:	60e0      	addu      	r3, r8
 522:	9380      	ld.w      	r4, (r3, 0x0)
 524:	3300      	movi      	r3, 0
 526:	2b03      	subi      	r3, 4
 528:	60e0      	addu      	r3, r8
 52a:	9300      	ld.w      	r0, (r3, 0x0)
 52c:	e0000000 	bsr      	0x0	// 1a8 <addr2hash>
 530:	6cc3      	mov      	r3, r0
 532:	4363      	lsli      	r3, r3, 3
 534:	1158      	lrw      	r2, 0x0	// 614 <is_valid_address+0x70>
 536:	60c8      	addu      	r3, r2
 538:	6c4f      	mov      	r1, r3
 53a:	6c13      	mov      	r0, r4
 53c:	e0000000 	bsr      	0x0	// 0 <dq_addlast>
}
 540:	6c00      	or      	r0, r0
 542:	6fa3      	mov      	r14, r8
 544:	d9ee2002 	ld.w      	r15, (r14, 0x8)
 548:	d90e2001 	ld.w      	r8, (r14, 0x4)
 54c:	9880      	ld.w      	r4, (r14, 0x0)
 54e:	1403      	addi      	r14, r14, 12
 550:	783c      	jmp      	r15
	...

00000554 <mm_leak_del_chunk>:

void mm_leak_del_chunk(struct m_dbg_hdr *chunk)
{
 554:	1423      	subi      	r14, r14, 12
 556:	b880      	st.w      	r4, (r14, 0x0)
 558:	dd0e2001 	st.w      	r8, (r14, 0x4)
 55c:	ddee2002 	st.w      	r15, (r14, 0x8)
 560:	6e3b      	mov      	r8, r14
 562:	1421      	subi      	r14, r14, 4
 564:	3300      	movi      	r3, 0
 566:	2b03      	subi      	r3, 4
 568:	60e0      	addu      	r3, r8
 56a:	b300      	st.w      	r0, (r3, 0x0)
    dq_rem(&chunk->node, &mm_status.list[addr2hash(chunk)]);
 56c:	3300      	movi      	r3, 0
 56e:	2b03      	subi      	r3, 4
 570:	60e0      	addu      	r3, r8
 572:	9380      	ld.w      	r4, (r3, 0x0)
 574:	3300      	movi      	r3, 0
 576:	2b03      	subi      	r3, 4
 578:	60e0      	addu      	r3, r8
 57a:	9300      	ld.w      	r0, (r3, 0x0)
 57c:	e0000000 	bsr      	0x0	// 1a8 <addr2hash>
 580:	6cc3      	mov      	r3, r0
 582:	4363      	lsli      	r3, r3, 3
 584:	1144      	lrw      	r2, 0x0	// 614 <is_valid_address+0x70>
 586:	60c8      	addu      	r3, r2
 588:	6c4f      	mov      	r1, r3
 58a:	6c13      	mov      	r0, r4
 58c:	e0000000 	bsr      	0x0	// 0 <dq_rem>
}
 590:	6c00      	or      	r0, r0
 592:	6fa3      	mov      	r14, r8
 594:	d9ee2002 	ld.w      	r15, (r14, 0x8)
 598:	d90e2001 	ld.w      	r8, (r14, 0x4)
 59c:	9880      	ld.w      	r4, (r14, 0x0)
 59e:	1403      	addi      	r14, r14, 12
 5a0:	783c      	jmp      	r15
	...

000005a4 <is_valid_address>:

static bool is_valid_address(void *p)
{
 5a4:	1421      	subi      	r14, r14, 4
 5a6:	dd0e2000 	st.w      	r8, (r14, 0x0)
 5aa:	6e3b      	mov      	r8, r14
 5ac:	1424      	subi      	r14, r14, 16
 5ae:	3300      	movi      	r3, 0
 5b0:	2b0f      	subi      	r3, 16
 5b2:	60e0      	addu      	r3, r8
 5b4:	b300      	st.w      	r0, (r3, 0x0)
    int i;

    for (i = 0; i < CONFIG_MM_REGIONS; i++) {
 5b6:	3300      	movi      	r3, 0
 5b8:	2b03      	subi      	r3, 4
 5ba:	60e0      	addu      	r3, r8
 5bc:	3200      	movi      	r2, 0
 5be:	b340      	st.w      	r2, (r3, 0x0)
 5c0:	0437      	br      	0x62e	// 62e <is_valid_address+0x8a>
        void *s = (USR_HEAP)->mm_heapstart[0];
 5c2:	3300      	movi      	r3, 0
 5c4:	2b07      	subi      	r3, 8
 5c6:	60e0      	addu      	r3, r8
 5c8:	1054      	lrw      	r2, 0x0	// 618 <is_valid_address+0x74>
 5ca:	9244      	ld.w      	r2, (r2, 0x10)
 5cc:	b340      	st.w      	r2, (r3, 0x0)
        void *e = (USR_HEAP)->mm_heapend[0];
 5ce:	3300      	movi      	r3, 0
 5d0:	2b0b      	subi      	r3, 12
 5d2:	60e0      	addu      	r3, r8
 5d4:	1051      	lrw      	r2, 0x0	// 618 <is_valid_address+0x74>
 5d6:	9245      	ld.w      	r2, (r2, 0x14)
 5d8:	b340      	st.w      	r2, (r3, 0x0)
        if (p >= s && p < e) {
 5da:	3200      	movi      	r2, 0
 5dc:	2a0f      	subi      	r2, 16
 5de:	60a0      	addu      	r2, r8
 5e0:	3300      	movi      	r3, 0
 5e2:	2b07      	subi      	r3, 8
 5e4:	60e0      	addu      	r3, r8
 5e6:	9240      	ld.w      	r2, (r2, 0x0)
 5e8:	9360      	ld.w      	r3, (r3, 0x0)
 5ea:	64c8      	cmphs      	r2, r3
 5ec:	0c18      	bf      	0x61c	// 61c <is_valid_address+0x78>
 5ee:	3200      	movi      	r2, 0
 5f0:	2a0f      	subi      	r2, 16
 5f2:	60a0      	addu      	r2, r8
 5f4:	3300      	movi      	r3, 0
 5f6:	2b0b      	subi      	r3, 12
 5f8:	60e0      	addu      	r3, r8
 5fa:	9240      	ld.w      	r2, (r2, 0x0)
 5fc:	9360      	ld.w      	r3, (r3, 0x0)
 5fe:	64c8      	cmphs      	r2, r3
 600:	080e      	bt      	0x61c	// 61c <is_valid_address+0x78>
            return true;
 602:	3301      	movi      	r3, 1
 604:	041c      	br      	0x63c	// 63c <is_valid_address+0x98>
 606:	0000      	bkpt
 608:	e5e5e5e5 	.long	0xe5e5e5e5
	...
    for (i = 0; i < CONFIG_MM_REGIONS; i++) {
 61c:	3300      	movi      	r3, 0
 61e:	2b03      	subi      	r3, 4
 620:	60e0      	addu      	r3, r8
 622:	3200      	movi      	r2, 0
 624:	2a03      	subi      	r2, 4
 626:	60a0      	addu      	r2, r8
 628:	9240      	ld.w      	r2, (r2, 0x0)
 62a:	2200      	addi      	r2, 1
 62c:	b340      	st.w      	r2, (r3, 0x0)
 62e:	3300      	movi      	r3, 0
 630:	2b03      	subi      	r3, 4
 632:	60e0      	addu      	r3, r8
 634:	9360      	ld.w      	r3, (r3, 0x0)
 636:	3b20      	cmplti      	r3, 1
 638:	0bc5      	bt      	0x5c2	// 5c2 <is_valid_address+0x1e>
        }
    }

    return false;
 63a:	3300      	movi      	r3, 0
}
 63c:	6c0f      	mov      	r0, r3
 63e:	6fa3      	mov      	r14, r8
 640:	d90e2000 	ld.w      	r8, (r14, 0x0)
 644:	1401      	addi      	r14, r14, 4
 646:	783c      	jmp      	r15

00000648 <traverse_one_list>:

typedef int (*scan_cb)(struct m_dbg_hdr *, void *);
static void traverse_one_list(struct m_dbg_hdr *cur, scan_cb cb, void *cookie)
{
 648:	1424      	subi      	r14, r14, 16
 64a:	b880      	st.w      	r4, (r14, 0x0)
 64c:	b8a1      	st.w      	r5, (r14, 0x4)
 64e:	dd0e2002 	st.w      	r8, (r14, 0x8)
 652:	ddee2003 	st.w      	r15, (r14, 0xc)
 656:	6e3b      	mov      	r8, r14
 658:	1427      	subi      	r14, r14, 28
 65a:	3300      	movi      	r3, 0
 65c:	2b0b      	subi      	r3, 12
 65e:	60e0      	addu      	r3, r8
 660:	b300      	st.w      	r0, (r3, 0x0)
 662:	3300      	movi      	r3, 0
 664:	2b0f      	subi      	r3, 16
 666:	60e0      	addu      	r3, r8
 668:	b320      	st.w      	r1, (r3, 0x0)
 66a:	3300      	movi      	r3, 0
 66c:	2b13      	subi      	r3, 20
 66e:	60e0      	addu      	r3, r8
 670:	b340      	st.w      	r2, (r3, 0x0)
    void *prev = cur;
 672:	3300      	movi      	r3, 0
 674:	2b03      	subi      	r3, 4
 676:	60e0      	addu      	r3, r8
 678:	3200      	movi      	r2, 0
 67a:	2a0b      	subi      	r2, 12
 67c:	60a0      	addu      	r2, r8
 67e:	9240      	ld.w      	r2, (r2, 0x0)
 680:	b340      	st.w      	r2, (r3, 0x0)

    while (cur) {
 682:	0473      	br      	0x768	// 768 <traverse_one_list+0x120>
        if (!is_valid_address(cur)) {
 684:	3300      	movi      	r3, 0
 686:	2b0b      	subi      	r3, 12
 688:	60e0      	addu      	r3, r8
 68a:	9300      	ld.w      	r0, (r3, 0x0)
 68c:	e0000000 	bsr      	0x0	// 5a4 <is_valid_address>
 690:	6cc3      	mov      	r3, r0
 692:	6c8f      	mov      	r2, r3
 694:	3301      	movi      	r3, 1
 696:	6c8d      	xor      	r2, r3
 698:	6ccb      	mov      	r3, r2
 69a:	74cc      	zextb      	r3, r3
 69c:	3b40      	cmpnei      	r3, 0
 69e:	0c3c      	bf      	0x716	// 716 <traverse_one_list+0xce>
            cur = prev;
 6a0:	3300      	movi      	r3, 0
 6a2:	2b0b      	subi      	r3, 12
 6a4:	60e0      	addu      	r3, r8
 6a6:	3200      	movi      	r2, 0
 6a8:	2a03      	subi      	r2, 4
 6aa:	60a0      	addu      	r2, r8
 6ac:	9240      	ld.w      	r2, (r2, 0x0)
 6ae:	b340      	st.w      	r2, (r3, 0x0)
            printf("!!!already corrupted after, stop traversaling!!!ptr=%x size=%d pid=%d caller=%x leak=%c\n",
                   (uint32_t)(cur + 1), cur->size, cur->pid, (uint32_t)cur->caller, cur->referenced ? 'N' : 'Y');
 6b0:	3300      	movi      	r3, 0
 6b2:	2b0b      	subi      	r3, 12
 6b4:	60e0      	addu      	r3, r8
 6b6:	9360      	ld.w      	r3, (r3, 0x0)
 6b8:	2313      	addi      	r3, 20
            printf("!!!already corrupted after, stop traversaling!!!ptr=%x size=%d pid=%d caller=%x leak=%c\n",
 6ba:	6c0f      	mov      	r0, r3
                   (uint32_t)(cur + 1), cur->size, cur->pid, (uint32_t)cur->caller, cur->referenced ? 'N' : 'Y');
 6bc:	3300      	movi      	r3, 0
 6be:	2b0b      	subi      	r3, 12
 6c0:	60e0      	addu      	r3, r8
 6c2:	9360      	ld.w      	r3, (r3, 0x0)
 6c4:	9363      	ld.w      	r3, (r3, 0xc)
 6c6:	4369      	lsli      	r3, r3, 9
 6c8:	4b69      	lsri      	r3, r3, 9
            printf("!!!already corrupted after, stop traversaling!!!ptr=%x size=%d pid=%d caller=%x leak=%c\n",
 6ca:	6d0f      	mov      	r4, r3
                   (uint32_t)(cur + 1), cur->size, cur->pid, (uint32_t)cur->caller, cur->referenced ? 'N' : 'Y');
 6cc:	3300      	movi      	r3, 0
 6ce:	2b0b      	subi      	r3, 12
 6d0:	60e0      	addu      	r3, r8
 6d2:	9360      	ld.w      	r3, (r3, 0x0)
 6d4:	836f      	ld.b      	r3, (r3, 0xf)
 6d6:	74cc      	zextb      	r3, r3
            printf("!!!already corrupted after, stop traversaling!!!ptr=%x size=%d pid=%d caller=%x leak=%c\n",
 6d8:	6d4f      	mov      	r5, r3
                   (uint32_t)(cur + 1), cur->size, cur->pid, (uint32_t)cur->caller, cur->referenced ? 'N' : 'Y');
 6da:	3300      	movi      	r3, 0
 6dc:	2b0b      	subi      	r3, 12
 6de:	60e0      	addu      	r3, r8
 6e0:	9360      	ld.w      	r3, (r3, 0x0)
 6e2:	9362      	ld.w      	r3, (r3, 0x8)
            printf("!!!already corrupted after, stop traversaling!!!ptr=%x size=%d pid=%d caller=%x leak=%c\n",
 6e4:	6c4f      	mov      	r1, r3
                   (uint32_t)(cur + 1), cur->size, cur->pid, (uint32_t)cur->caller, cur->referenced ? 'N' : 'Y');
 6e6:	3300      	movi      	r3, 0
 6e8:	2b0b      	subi      	r3, 12
 6ea:	60e0      	addu      	r3, r8
 6ec:	9360      	ld.w      	r3, (r3, 0x0)
 6ee:	836e      	ld.b      	r3, (r3, 0xe)
 6f0:	74cc      	zextb      	r3, r3
 6f2:	327f      	movi      	r2, 127
 6f4:	68c9      	andn      	r3, r2
 6f6:	74cc      	zextb      	r3, r3
            printf("!!!already corrupted after, stop traversaling!!!ptr=%x size=%d pid=%d caller=%x leak=%c\n",
 6f8:	3b40      	cmpnei      	r3, 0
 6fa:	0c03      	bf      	0x700	// 700 <traverse_one_list+0xb8>
 6fc:	334e      	movi      	r3, 78
 6fe:	0402      	br      	0x702	// 702 <traverse_one_list+0xba>
 700:	3359      	movi      	r3, 89
 702:	b861      	st.w      	r3, (r14, 0x4)
 704:	b820      	st.w      	r1, (r14, 0x0)
 706:	6cd7      	mov      	r3, r5
 708:	6c93      	mov      	r2, r4
 70a:	6c43      	mov      	r1, r0
 70c:	ea800125 	lrw      	r0, 0x0	// ba0 <mm_leak_search_chunk+0x74>
 710:	e0000000 	bsr      	0x0	// 0 <printf>
            break;
 714:	0432      	br      	0x778	// 778 <traverse_one_list+0x130>
        }

        int done = cb(cur, cookie);
 716:	3400      	movi      	r4, 0
 718:	2c07      	subi      	r4, 8
 71a:	6120      	addu      	r4, r8
 71c:	3100      	movi      	r1, 0
 71e:	2913      	subi      	r1, 20
 720:	6060      	addu      	r1, r8
 722:	3200      	movi      	r2, 0
 724:	2a0b      	subi      	r2, 12
 726:	60a0      	addu      	r2, r8
 728:	3300      	movi      	r3, 0
 72a:	2b0f      	subi      	r3, 16
 72c:	60e0      	addu      	r3, r8
 72e:	9360      	ld.w      	r3, (r3, 0x0)
 730:	9120      	ld.w      	r1, (r1, 0x0)
 732:	9200      	ld.w      	r0, (r2, 0x0)
 734:	7bcd      	jsr      	r3
 736:	6cc3      	mov      	r3, r0
 738:	b460      	st.w      	r3, (r4, 0x0)
        if (done) {
 73a:	3300      	movi      	r3, 0
 73c:	2b07      	subi      	r3, 8
 73e:	60e0      	addu      	r3, r8
 740:	9360      	ld.w      	r3, (r3, 0x0)
 742:	3b40      	cmpnei      	r3, 0
 744:	0819      	bt      	0x776	// 776 <traverse_one_list+0x12e>
            break;
        }
        prev = cur;
 746:	3300      	movi      	r3, 0
 748:	2b03      	subi      	r3, 4
 74a:	60e0      	addu      	r3, r8
 74c:	3200      	movi      	r2, 0
 74e:	2a0b      	subi      	r2, 12
 750:	60a0      	addu      	r2, r8
 752:	9240      	ld.w      	r2, (r2, 0x0)
 754:	b340      	st.w      	r2, (r3, 0x0)
        cur = (struct m_dbg_hdr *)cur->node.flink;
 756:	3300      	movi      	r3, 0
 758:	2b0b      	subi      	r3, 12
 75a:	60e0      	addu      	r3, r8
 75c:	3200      	movi      	r2, 0
 75e:	2a0b      	subi      	r2, 12
 760:	60a0      	addu      	r2, r8
 762:	9240      	ld.w      	r2, (r2, 0x0)
 764:	9240      	ld.w      	r2, (r2, 0x0)
 766:	b340      	st.w      	r2, (r3, 0x0)
    while (cur) {
 768:	3300      	movi      	r3, 0
 76a:	2b0b      	subi      	r3, 12
 76c:	60e0      	addu      	r3, r8
 76e:	9360      	ld.w      	r3, (r3, 0x0)
 770:	3b40      	cmpnei      	r3, 0
 772:	0b89      	bt      	0x684	// 684 <traverse_one_list+0x3c>
    }
}
 774:	0402      	br      	0x778	// 778 <traverse_one_list+0x130>
            break;
 776:	6c00      	or      	r0, r0
}
 778:	6c00      	or      	r0, r0
 77a:	6fa3      	mov      	r14, r8
 77c:	d9ee2003 	ld.w      	r15, (r14, 0xc)
 780:	d90e2002 	ld.w      	r8, (r14, 0x8)
 784:	98a1      	ld.w      	r5, (r14, 0x4)
 786:	9880      	ld.w      	r4, (r14, 0x0)
 788:	1404      	addi      	r14, r14, 16
 78a:	783c      	jmp      	r15

0000078c <is_corrupted>:

static bool is_corrupted(struct m_dbg_hdr *cur)
{
 78c:	1422      	subi      	r14, r14, 8
 78e:	dd0e2000 	st.w      	r8, (r14, 0x0)
 792:	ddee2001 	st.w      	r15, (r14, 0x4)
 796:	6e3b      	mov      	r8, r14
 798:	1422      	subi      	r14, r14, 8
 79a:	3300      	movi      	r3, 0
 79c:	2b07      	subi      	r3, 8
 79e:	60e0      	addu      	r3, r8
 7a0:	b300      	st.w      	r0, (r3, 0x0)
    bool corrupted = !mdbg_check_magic_hdr(cur);
 7a2:	3300      	movi      	r3, 0
 7a4:	2b07      	subi      	r3, 8
 7a6:	60e0      	addu      	r3, r8
 7a8:	9300      	ld.w      	r0, (r3, 0x0)
 7aa:	e0000000 	bsr      	0x0	// a0 <mdbg_check_magic_hdr>
 7ae:	6cc3      	mov      	r3, r0
 7b0:	3b40      	cmpnei      	r3, 0
 7b2:	3300      	movi      	r3, 0
 7b4:	60cd      	addc      	r3, r3
 7b6:	748c      	zextb      	r2, r3
 7b8:	3301      	movi      	r3, 1
 7ba:	6c8d      	xor      	r2, r3
 7bc:	6ccb      	mov      	r3, r2
 7be:	74cc      	zextb      	r3, r3
 7c0:	6c8f      	mov      	r2, r3
 7c2:	3300      	movi      	r3, 0
 7c4:	2b00      	subi      	r3, 1
 7c6:	60e0      	addu      	r3, r8
 7c8:	a340      	st.b      	r2, (r3, 0x0)
 7ca:	8320      	ld.b      	r1, (r3, 0x0)
 7cc:	3201      	movi      	r2, 1
 7ce:	6884      	and      	r2, r1
 7d0:	a340      	st.b      	r2, (r3, 0x0)

    corrupted = corrupted || !mdbg_check_magic_end(cur);
 7d2:	3300      	movi      	r3, 0
 7d4:	2b00      	subi      	r3, 1
 7d6:	60e0      	addu      	r3, r8
 7d8:	8360      	ld.b      	r3, (r3, 0x0)
 7da:	74cc      	zextb      	r3, r3
 7dc:	3b40      	cmpnei      	r3, 0
 7de:	080f      	bt      	0x7fc	// 7fc <is_corrupted+0x70>
 7e0:	3300      	movi      	r3, 0
 7e2:	2b07      	subi      	r3, 8
 7e4:	60e0      	addu      	r3, r8
 7e6:	9300      	ld.w      	r0, (r3, 0x0)
 7e8:	e0000000 	bsr      	0x0	// e8 <mdbg_check_magic_end>
 7ec:	6cc3      	mov      	r3, r0
 7ee:	6c8f      	mov      	r2, r3
 7f0:	3301      	movi      	r3, 1
 7f2:	6c8d      	xor      	r2, r3
 7f4:	6ccb      	mov      	r3, r2
 7f6:	74cc      	zextb      	r3, r3
 7f8:	3b40      	cmpnei      	r3, 0
 7fa:	0c03      	bf      	0x800	// 800 <is_corrupted+0x74>
 7fc:	3201      	movi      	r2, 1
 7fe:	0402      	br      	0x802	// 802 <is_corrupted+0x76>
 800:	3200      	movi      	r2, 0
 802:	3300      	movi      	r3, 0
 804:	2b00      	subi      	r3, 1
 806:	60e0      	addu      	r3, r8
 808:	a340      	st.b      	r2, (r3, 0x0)
 80a:	8320      	ld.b      	r1, (r3, 0x0)
 80c:	3201      	movi      	r2, 1
 80e:	6884      	and      	r2, r1
 810:	a340      	st.b      	r2, (r3, 0x0)

    return corrupted;
 812:	3300      	movi      	r3, 0
 814:	2b00      	subi      	r3, 1
 816:	60e0      	addu      	r3, r8
 818:	8360      	ld.b      	r3, (r3, 0x0)
 81a:	74cc      	zextb      	r3, r3
}
 81c:	6c0f      	mov      	r0, r3
 81e:	6fa3      	mov      	r14, r8
 820:	d9ee2001 	ld.w      	r15, (r14, 0x4)
 824:	d90e2000 	ld.w      	r8, (r14, 0x0)
 828:	1402      	addi      	r14, r14, 8
 82a:	783c      	jmp      	r15

0000082c <show_chunk_snapshot>:

static int show_chunk_snapshot(struct m_dbg_hdr *cur, void *unused)
{
 82c:	1422      	subi      	r14, r14, 8
 82e:	dd0e2000 	st.w      	r8, (r14, 0x0)
 832:	ddee2001 	st.w      	r15, (r14, 0x4)
 836:	6e3b      	mov      	r8, r14
 838:	1423      	subi      	r14, r14, 12
 83a:	3300      	movi      	r3, 0
 83c:	2b03      	subi      	r3, 4
 83e:	60e0      	addu      	r3, r8
 840:	b300      	st.w      	r0, (r3, 0x0)
 842:	3300      	movi      	r3, 0
 844:	2b07      	subi      	r3, 8
 846:	60e0      	addu      	r3, r8
 848:	b320      	st.w      	r1, (r3, 0x0)
    printf("ptr=%x size=%d pid=%d caller=%x\n",
           (uint32_t)cur + 1, cur->size, cur->pid, (uint32_t)cur->caller);
 84a:	3300      	movi      	r3, 0
 84c:	2b03      	subi      	r3, 4
 84e:	60e0      	addu      	r3, r8
 850:	9360      	ld.w      	r3, (r3, 0x0)
    printf("ptr=%x size=%d pid=%d caller=%x\n",
 852:	5b22      	addi      	r1, r3, 1
           (uint32_t)cur + 1, cur->size, cur->pid, (uint32_t)cur->caller);
 854:	3300      	movi      	r3, 0
 856:	2b03      	subi      	r3, 4
 858:	60e0      	addu      	r3, r8
 85a:	9360      	ld.w      	r3, (r3, 0x0)
 85c:	9363      	ld.w      	r3, (r3, 0xc)
 85e:	4369      	lsli      	r3, r3, 9
 860:	4b69      	lsri      	r3, r3, 9
    printf("ptr=%x size=%d pid=%d caller=%x\n",
 862:	6c8f      	mov      	r2, r3
           (uint32_t)cur + 1, cur->size, cur->pid, (uint32_t)cur->caller);
 864:	3300      	movi      	r3, 0
 866:	2b03      	subi      	r3, 4
 868:	60e0      	addu      	r3, r8
 86a:	9360      	ld.w      	r3, (r3, 0x0)
 86c:	836f      	ld.b      	r3, (r3, 0xf)
 86e:	74cc      	zextb      	r3, r3
    printf("ptr=%x size=%d pid=%d caller=%x\n",
 870:	6c0f      	mov      	r0, r3
           (uint32_t)cur + 1, cur->size, cur->pid, (uint32_t)cur->caller);
 872:	3300      	movi      	r3, 0
 874:	2b03      	subi      	r3, 4
 876:	60e0      	addu      	r3, r8
 878:	9360      	ld.w      	r3, (r3, 0x0)
 87a:	9362      	ld.w      	r3, (r3, 0x8)
    printf("ptr=%x size=%d pid=%d caller=%x\n",
 87c:	b860      	st.w      	r3, (r14, 0x0)
 87e:	6cc3      	mov      	r3, r0
 880:	0116      	lrw      	r0, 0x0	// ba4 <mm_leak_search_chunk+0x78>
 882:	e0000000 	bsr      	0x0	// 0 <printf>

    return 0;
 886:	3300      	movi      	r3, 0
}
 888:	6c0f      	mov      	r0, r3
 88a:	6fa3      	mov      	r14, r8
 88c:	d9ee2001 	ld.w      	r15, (r14, 0x4)
 890:	d90e2000 	ld.w      	r8, (r14, 0x0)
 894:	1402      	addi      	r14, r14, 8
 896:	783c      	jmp      	r15

00000898 <mm_snapshoot_dump>:

static void mm_snapshoot_dump(void)
{
 898:	1422      	subi      	r14, r14, 8
 89a:	dd0e2000 	st.w      	r8, (r14, 0x0)
 89e:	ddee2001 	st.w      	r15, (r14, 0x4)
 8a2:	6e3b      	mov      	r8, r14
 8a4:	1421      	subi      	r14, r14, 4
    int i;
    for(i = 0; i < MAX_HASH; i++) {
 8a6:	3300      	movi      	r3, 0
 8a8:	2b03      	subi      	r3, 4
 8aa:	60e0      	addu      	r3, r8
 8ac:	3200      	movi      	r2, 0
 8ae:	b340      	st.w      	r2, (r3, 0x0)
 8b0:	041a      	br      	0x8e4	// 8e4 <mm_snapshoot_dump+0x4c>
        printf("-----------------------------\n");
 8b2:	0201      	lrw      	r0, 0x0	// ba8 <mm_leak_search_chunk+0x7c>
 8b4:	e0000000 	bsr      	0x0	// 0 <puts>
        traverse_one_list((struct m_dbg_hdr *)(mm_status_snapshoot.list[i].head), show_chunk_snapshot, NULL);
 8b8:	0242      	lrw      	r2, 0x0	// bac <mm_leak_search_chunk+0x80>
 8ba:	3300      	movi      	r3, 0
 8bc:	2b03      	subi      	r3, 4
 8be:	60e0      	addu      	r3, r8
 8c0:	9360      	ld.w      	r3, (r3, 0x0)
 8c2:	4363      	lsli      	r3, r3, 3
 8c4:	60c8      	addu      	r3, r2
 8c6:	9360      	ld.w      	r3, (r3, 0x0)
 8c8:	3200      	movi      	r2, 0
 8ca:	0225      	lrw      	r1, 0x0	// bb0 <mm_leak_search_chunk+0x84>
 8cc:	6c0f      	mov      	r0, r3
 8ce:	e0000000 	bsr      	0x0	// 648 <traverse_one_list>
    for(i = 0; i < MAX_HASH; i++) {
 8d2:	3300      	movi      	r3, 0
 8d4:	2b03      	subi      	r3, 4
 8d6:	60e0      	addu      	r3, r8
 8d8:	3200      	movi      	r2, 0
 8da:	2a03      	subi      	r2, 4
 8dc:	60a0      	addu      	r2, r8
 8de:	9240      	ld.w      	r2, (r2, 0x0)
 8e0:	2200      	addi      	r2, 1
 8e2:	b340      	st.w      	r2, (r3, 0x0)
 8e4:	3300      	movi      	r3, 0
 8e6:	2b03      	subi      	r3, 4
 8e8:	60e0      	addu      	r3, r8
 8ea:	9360      	ld.w      	r3, (r3, 0x0)
 8ec:	3b2f      	cmplti      	r3, 16
 8ee:	0be2      	bt      	0x8b2	// 8b2 <mm_snapshoot_dump+0x1a>
    }
}
 8f0:	6c00      	or      	r0, r0
 8f2:	6fa3      	mov      	r14, r8
 8f4:	d9ee2001 	ld.w      	r15, (r14, 0x4)
 8f8:	d90e2000 	ld.w      	r8, (r14, 0x0)
 8fc:	1402      	addi      	r14, r14, 8
 8fe:	783c      	jmp      	r15

00000900 <mm_do_statistics>:

void mm_do_statistics(void)
{
 900:	1422      	subi      	r14, r14, 8
 902:	dd0e2000 	st.w      	r8, (r14, 0x0)
 906:	ddee2001 	st.w      	r15, (r14, 0x4)
 90a:	6e3b      	mov      	r8, r14
    if(start_statistics) {
 90c:	0275      	lrw      	r3, 0x0	// bb4 <mm_leak_search_chunk+0x88>
 90e:	8360      	ld.b      	r3, (r3, 0x0)
 910:	74cc      	zextb      	r3, r3
 912:	3b40      	cmpnei      	r3, 0
 914:	0c0d      	bf      	0x92e	// 92e <mm_do_statistics+0x2e>
        start_statistics = false;
 916:	0277      	lrw      	r3, 0x0	// bb4 <mm_leak_search_chunk+0x88>
 918:	3200      	movi      	r2, 0
 91a:	a340      	st.b      	r2, (r3, 0x0)
        printf("------------min_free:%d,show max mem use statistic-----------------\n", min_free);
 91c:	0278      	lrw      	r3, 0x0	// bb8 <mm_leak_search_chunk+0x8c>
 91e:	9360      	ld.w      	r3, (r3, 0x0)
 920:	6c4f      	mov      	r1, r3
 922:	0218      	lrw      	r0, 0x0	// bbc <mm_leak_search_chunk+0x90>
 924:	e0000000 	bsr      	0x0	// 0 <printf>
        mm_snapshoot_dump();
 928:	e0000000 	bsr      	0x0	// 898 <mm_snapshoot_dump>
    } else {
        printf("------------start max mem use statistic-----------------\n");
        start_statistics = true;
    }
}
 92c:	0407      	br      	0x93a	// 93a <mm_do_statistics+0x3a>
        printf("------------start max mem use statistic-----------------\n");
 92e:	021a      	lrw      	r0, 0x0	// bc0 <mm_leak_search_chunk+0x94>
 930:	e0000000 	bsr      	0x0	// 0 <puts>
        start_statistics = true;
 934:	027f      	lrw      	r3, 0x0	// bb4 <mm_leak_search_chunk+0x88>
 936:	3201      	movi      	r2, 1
 938:	a340      	st.b      	r2, (r3, 0x0)
}
 93a:	6c00      	or      	r0, r0
 93c:	6fa3      	mov      	r14, r8
 93e:	d9ee2001 	ld.w      	r15, (r14, 0x4)
 942:	d90e2000 	ld.w      	r8, (r14, 0x0)
 946:	1402      	addi      	r14, r14, 8
 948:	783c      	jmp      	r15
	...

0000094c <mm_record_minfree>:

void mm_record_minfree(void)
{
 94c:	1421      	subi      	r14, r14, 4
 94e:	dd0e2000 	st.w      	r8, (r14, 0x0)
 952:	6e3b      	mov      	r8, r14
    if(!start_statistics) {
 954:	0367      	lrw      	r3, 0x0	// bb4 <mm_leak_search_chunk+0x88>
 956:	8360      	ld.b      	r3, (r3, 0x0)
 958:	748c      	zextb      	r2, r3
 95a:	3301      	movi      	r3, 1
 95c:	6c8d      	xor      	r2, r3
 95e:	6ccb      	mov      	r3, r2
 960:	74cc      	zextb      	r3, r3
 962:	3b40      	cmpnei      	r3, 0
 964:	0804      	bt      	0x96c	// 96c <mm_record_minfree+0x20>
        mm_release_snapshoot();
        mm_do_snapshoot(&mm_status, &mm_status_snapshoot);
        mm_statistics_restore();
    }
#else
    asm("bkpt");
 966:	0000      	bkpt
//    (void)mallinfo(&mem);
#endif
    return;
 968:	6c00      	or      	r0, r0
 96a:	0402      	br      	0x96e	// 96e <mm_record_minfree+0x22>
        return;
 96c:	6c00      	or      	r0, r0
}
 96e:	6fa3      	mov      	r14, r8
 970:	d90e2000 	ld.w      	r8, (r14, 0x0)
 974:	1401      	addi      	r14, r14, 4
 976:	783c      	jmp      	r15

00000978 <show_corrupted_chunk>:
    return 0;
}
#endif

static int show_corrupted_chunk(struct m_dbg_hdr *cur, void *unused)
{
 978:	14d5      	push      	r4-r8, r15
 97a:	6e3b      	mov      	r8, r14
 97c:	1426      	subi      	r14, r14, 24
 97e:	3300      	movi      	r3, 0
 980:	2b03      	subi      	r3, 4
 982:	60e0      	addu      	r3, r8
 984:	b300      	st.w      	r0, (r3, 0x0)
 986:	3300      	movi      	r3, 0
 988:	2b07      	subi      	r3, 8
 98a:	60e0      	addu      	r3, r8
 98c:	b320      	st.w      	r1, (r3, 0x0)
    if (!is_corrupted(cur)) {
 98e:	3300      	movi      	r3, 0
 990:	2b03      	subi      	r3, 4
 992:	60e0      	addu      	r3, r8
 994:	9300      	ld.w      	r0, (r3, 0x0)
 996:	e0000000 	bsr      	0x0	// 78c <is_corrupted>
 99a:	6cc3      	mov      	r3, r0
 99c:	6c8f      	mov      	r2, r3
 99e:	3301      	movi      	r3, 1
 9a0:	6c8d      	xor      	r2, r3
 9a2:	6ccb      	mov      	r3, r2
 9a4:	74cc      	zextb      	r3, r3
 9a6:	3b40      	cmpnei      	r3, 0
 9a8:	0c03      	bf      	0x9ae	// 9ae <show_corrupted_chunk+0x36>
        return 0;
 9aa:	3300      	movi      	r3, 0
 9ac:	0446      	br      	0xa38	// a38 <show_corrupted_chunk+0xc0>
    }

    printf("caller=%x ptr=%x size=%d  pid=%d leak=%c corrupted=%c\n",
           (uint32_t)cur->caller, (uint32_t)(cur + 1), cur->size, cur->pid,
 9ae:	3300      	movi      	r3, 0
 9b0:	2b03      	subi      	r3, 4
 9b2:	60e0      	addu      	r3, r8
 9b4:	9360      	ld.w      	r3, (r3, 0x0)
 9b6:	9362      	ld.w      	r3, (r3, 0x8)
    printf("caller=%x ptr=%x size=%d  pid=%d leak=%c corrupted=%c\n",
 9b8:	6d8f      	mov      	r6, r3
           (uint32_t)cur->caller, (uint32_t)(cur + 1), cur->size, cur->pid,
 9ba:	3300      	movi      	r3, 0
 9bc:	2b03      	subi      	r3, 4
 9be:	60e0      	addu      	r3, r8
 9c0:	9360      	ld.w      	r3, (r3, 0x0)
 9c2:	2313      	addi      	r3, 20
    printf("caller=%x ptr=%x size=%d  pid=%d leak=%c corrupted=%c\n",
 9c4:	6dcf      	mov      	r7, r3
           (uint32_t)cur->caller, (uint32_t)(cur + 1), cur->size, cur->pid,
 9c6:	3300      	movi      	r3, 0
 9c8:	2b03      	subi      	r3, 4
 9ca:	60e0      	addu      	r3, r8
 9cc:	9360      	ld.w      	r3, (r3, 0x0)
 9ce:	9363      	ld.w      	r3, (r3, 0xc)
 9d0:	4369      	lsli      	r3, r3, 9
 9d2:	4b69      	lsri      	r3, r3, 9
    printf("caller=%x ptr=%x size=%d  pid=%d leak=%c corrupted=%c\n",
 9d4:	3200      	movi      	r2, 0
 9d6:	2a0b      	subi      	r2, 12
 9d8:	60a0      	addu      	r2, r8
 9da:	b260      	st.w      	r3, (r2, 0x0)
           (uint32_t)cur->caller, (uint32_t)(cur + 1), cur->size, cur->pid,
 9dc:	3300      	movi      	r3, 0
 9de:	2b03      	subi      	r3, 4
 9e0:	60e0      	addu      	r3, r8
 9e2:	9360      	ld.w      	r3, (r3, 0x0)
 9e4:	836f      	ld.b      	r3, (r3, 0xf)
 9e6:	74cc      	zextb      	r3, r3
    printf("caller=%x ptr=%x size=%d  pid=%d leak=%c corrupted=%c\n",
 9e8:	6d4f      	mov      	r5, r3
           cur->referenced ? 'N' : 'Y', is_corrupted(cur) ? 'Y' : 'N');
 9ea:	3300      	movi      	r3, 0
 9ec:	2b03      	subi      	r3, 4
 9ee:	60e0      	addu      	r3, r8
 9f0:	9360      	ld.w      	r3, (r3, 0x0)
 9f2:	836e      	ld.b      	r3, (r3, 0xe)
 9f4:	74cc      	zextb      	r3, r3
 9f6:	327f      	movi      	r2, 127
 9f8:	68c9      	andn      	r3, r2
 9fa:	74cc      	zextb      	r3, r3
    printf("caller=%x ptr=%x size=%d  pid=%d leak=%c corrupted=%c\n",
 9fc:	3b40      	cmpnei      	r3, 0
 9fe:	0c03      	bf      	0xa04	// a04 <show_corrupted_chunk+0x8c>
 a00:	344e      	movi      	r4, 78
 a02:	0402      	br      	0xa06	// a06 <show_corrupted_chunk+0x8e>
 a04:	3459      	movi      	r4, 89
           cur->referenced ? 'N' : 'Y', is_corrupted(cur) ? 'Y' : 'N');
 a06:	3300      	movi      	r3, 0
 a08:	2b03      	subi      	r3, 4
 a0a:	60e0      	addu      	r3, r8
 a0c:	9300      	ld.w      	r0, (r3, 0x0)
 a0e:	e0000000 	bsr      	0x0	// 78c <is_corrupted>
 a12:	6cc3      	mov      	r3, r0
    printf("caller=%x ptr=%x size=%d  pid=%d leak=%c corrupted=%c\n",
 a14:	3b40      	cmpnei      	r3, 0
 a16:	0c03      	bf      	0xa1c	// a1c <show_corrupted_chunk+0xa4>
 a18:	3359      	movi      	r3, 89
 a1a:	0402      	br      	0xa1e	// a1e <show_corrupted_chunk+0xa6>
 a1c:	334e      	movi      	r3, 78
 a1e:	b862      	st.w      	r3, (r14, 0x8)
 a20:	b881      	st.w      	r4, (r14, 0x4)
 a22:	b8a0      	st.w      	r5, (r14, 0x0)
 a24:	3300      	movi      	r3, 0
 a26:	2b0b      	subi      	r3, 12
 a28:	60e0      	addu      	r3, r8
 a2a:	9360      	ld.w      	r3, (r3, 0x0)
 a2c:	6c9f      	mov      	r2, r7
 a2e:	6c5b      	mov      	r1, r6
 a30:	1305      	lrw      	r0, 0x0	// bc4 <mm_leak_search_chunk+0x98>
 a32:	e0000000 	bsr      	0x0	// 0 <printf>

    return 0;
 a36:	3300      	movi      	r3, 0
}
 a38:	6c0f      	mov      	r0, r3
 a3a:	6fa3      	mov      	r14, r8
 a3c:	1495      	pop      	r4-r8, r15
	...

00000a40 <dump_corrupted_list>:

static void dump_corrupted_list(struct m_dbg_hdr *cur)
{
 a40:	1422      	subi      	r14, r14, 8
 a42:	dd0e2000 	st.w      	r8, (r14, 0x0)
 a46:	ddee2001 	st.w      	r15, (r14, 0x4)
 a4a:	6e3b      	mov      	r8, r14
 a4c:	1421      	subi      	r14, r14, 4
 a4e:	3300      	movi      	r3, 0
 a50:	2b03      	subi      	r3, 4
 a52:	60e0      	addu      	r3, r8
 a54:	b300      	st.w      	r0, (r3, 0x0)
    traverse_one_list(cur, show_corrupted_chunk, NULL);
 a56:	3300      	movi      	r3, 0
 a58:	2b03      	subi      	r3, 4
 a5a:	60e0      	addu      	r3, r8
 a5c:	3200      	movi      	r2, 0
 a5e:	123b      	lrw      	r1, 0x0	// bc8 <mm_leak_search_chunk+0x9c>
 a60:	9300      	ld.w      	r0, (r3, 0x0)
 a62:	e0000000 	bsr      	0x0	// 648 <traverse_one_list>
}
 a66:	6c00      	or      	r0, r0
 a68:	6fa3      	mov      	r14, r8
 a6a:	d9ee2001 	ld.w      	r15, (r14, 0x4)
 a6e:	d90e2000 	ld.w      	r8, (r14, 0x0)
 a72:	1402      	addi      	r14, r14, 8
 a74:	783c      	jmp      	r15
	...

00000a78 <mm_leak_dump>:

void mm_leak_dump(void)
{
 a78:	1422      	subi      	r14, r14, 8
 a7a:	dd0e2000 	st.w      	r8, (r14, 0x0)
 a7e:	ddee2001 	st.w      	r15, (r14, 0x4)
 a82:	6e3b      	mov      	r8, r14
 a84:	1425      	subi      	r14, r14, 20
    for(i = 0; i < MAX_HASH; i++) {
        dump_one_list((struct m_dbg_hdr *)(mm_status.list[i].head));
    }
#endif

    mm_mallinfo(USR_HEAP, &info);
 a86:	3300      	movi      	r3, 0
 a88:	2b13      	subi      	r3, 20
 a8a:	60e0      	addu      	r3, r8
 a8c:	6c4f      	mov      	r1, r3
 a8e:	1210      	lrw      	r0, 0x0	// bcc <mm_leak_search_chunk+0xa0>
 a90:	e0000000 	bsr      	0x0	// 0 <mm_mallinfo>
}
 a94:	6c00      	or      	r0, r0
 a96:	6fa3      	mov      	r14, r8
 a98:	d9ee2001 	ld.w      	r15, (r14, 0x4)
 a9c:	d90e2000 	ld.w      	r8, (r14, 0x0)
 aa0:	1402      	addi      	r14, r14, 8
 aa2:	783c      	jmp      	r15

00000aa4 <search_nearest>:

static int search_nearest(struct m_dbg_hdr *cur, void *p)
{
 aa4:	1421      	subi      	r14, r14, 4
 aa6:	dd0e2000 	st.w      	r8, (r14, 0x0)
 aaa:	6e3b      	mov      	r8, r14
 aac:	1422      	subi      	r14, r14, 8
 aae:	3300      	movi      	r3, 0
 ab0:	2b03      	subi      	r3, 4
 ab2:	60e0      	addu      	r3, r8
 ab4:	b300      	st.w      	r0, (r3, 0x0)
 ab6:	3300      	movi      	r3, 0
 ab8:	2b07      	subi      	r3, 8
 aba:	60e0      	addu      	r3, r8
 abc:	b320      	st.w      	r1, (r3, 0x0)
    if ((void *)cur < p && cur > caddr) {
 abe:	3200      	movi      	r2, 0
 ac0:	2a03      	subi      	r2, 4
 ac2:	60a0      	addu      	r2, r8
 ac4:	3300      	movi      	r3, 0
 ac6:	2b07      	subi      	r3, 8
 ac8:	60e0      	addu      	r3, r8
 aca:	9240      	ld.w      	r2, (r2, 0x0)
 acc:	9360      	ld.w      	r3, (r3, 0x0)
 ace:	64c8      	cmphs      	r2, r3
 ad0:	080f      	bt      	0xaee	// aee <search_nearest+0x4a>
 ad2:	1260      	lrw      	r3, 0x0	// bd0 <mm_leak_search_chunk+0xa4>
 ad4:	9360      	ld.w      	r3, (r3, 0x0)
 ad6:	3200      	movi      	r2, 0
 ad8:	2a03      	subi      	r2, 4
 ada:	60a0      	addu      	r2, r8
 adc:	9240      	ld.w      	r2, (r2, 0x0)
 ade:	648c      	cmphs      	r3, r2
 ae0:	0807      	bt      	0xaee	// aee <search_nearest+0x4a>
        caddr = cur;
 ae2:	117c      	lrw      	r3, 0x0	// bd0 <mm_leak_search_chunk+0xa4>
 ae4:	3200      	movi      	r2, 0
 ae6:	2a03      	subi      	r2, 4
 ae8:	60a0      	addu      	r2, r8
 aea:	9240      	ld.w      	r2, (r2, 0x0)
 aec:	b340      	st.w      	r2, (r3, 0x0)
    }

    if ((void *)cur > p && cur < caddr_l) {
 aee:	3200      	movi      	r2, 0
 af0:	2a03      	subi      	r2, 4
 af2:	60a0      	addu      	r2, r8
 af4:	3300      	movi      	r3, 0
 af6:	2b07      	subi      	r3, 8
 af8:	60e0      	addu      	r3, r8
 afa:	9240      	ld.w      	r2, (r2, 0x0)
 afc:	9360      	ld.w      	r3, (r3, 0x0)
 afe:	648c      	cmphs      	r3, r2
 b00:	080f      	bt      	0xb1e	// b1e <search_nearest+0x7a>
 b02:	1175      	lrw      	r3, 0x0	// bd4 <mm_leak_search_chunk+0xa8>
 b04:	9360      	ld.w      	r3, (r3, 0x0)
 b06:	3200      	movi      	r2, 0
 b08:	2a03      	subi      	r2, 4
 b0a:	60a0      	addu      	r2, r8
 b0c:	9240      	ld.w      	r2, (r2, 0x0)
 b0e:	64c8      	cmphs      	r2, r3
 b10:	0807      	bt      	0xb1e	// b1e <search_nearest+0x7a>
        caddr_l = cur;
 b12:	1171      	lrw      	r3, 0x0	// bd4 <mm_leak_search_chunk+0xa8>
 b14:	3200      	movi      	r2, 0
 b16:	2a03      	subi      	r2, 4
 b18:	60a0      	addu      	r2, r8
 b1a:	9240      	ld.w      	r2, (r2, 0x0)
 b1c:	b340      	st.w      	r2, (r3, 0x0)
    }

    return 0;
 b1e:	3300      	movi      	r3, 0
}
 b20:	6c0f      	mov      	r0, r3
 b22:	6fa3      	mov      	r14, r8
 b24:	d90e2000 	ld.w      	r8, (r14, 0x0)
 b28:	1401      	addi      	r14, r14, 4
 b2a:	783c      	jmp      	r15

00000b2c <mm_leak_search_chunk>:

void mm_leak_search_chunk(void *p)
{
 b2c:	1422      	subi      	r14, r14, 8
 b2e:	dd0e2000 	st.w      	r8, (r14, 0x0)
 b32:	ddee2001 	st.w      	r15, (r14, 0x4)
 b36:	6e3b      	mov      	r8, r14
 b38:	1422      	subi      	r14, r14, 8
 b3a:	3300      	movi      	r3, 0
 b3c:	2b07      	subi      	r3, 8
 b3e:	60e0      	addu      	r3, r8
 b40:	b300      	st.w      	r0, (r3, 0x0)
    int i;
    caddr = NULL;
 b42:	1164      	lrw      	r3, 0x0	// bd0 <mm_leak_search_chunk+0xa4>
 b44:	3200      	movi      	r2, 0
 b46:	b340      	st.w      	r2, (r3, 0x0)
    caddr_l = (void *) - 1UL;
 b48:	1143      	lrw      	r2, 0x0	// bd4 <mm_leak_search_chunk+0xa8>
 b4a:	3300      	movi      	r3, 0
 b4c:	2b00      	subi      	r3, 1
 b4e:	b260      	st.w      	r3, (r2, 0x0)

    for(i = 0; i < MAX_HASH; i++) {
 b50:	3300      	movi      	r3, 0
 b52:	2b03      	subi      	r3, 4
 b54:	60e0      	addu      	r3, r8
 b56:	3200      	movi      	r2, 0
 b58:	b340      	st.w      	r2, (r3, 0x0)
 b5a:	0445      	br      	0xbe4	// be4 <mm_leak_search_chunk+0xb8>
        dump_corrupted_list((struct m_dbg_hdr *)(mm_status.list[i].head));
 b5c:	105f      	lrw      	r2, 0x0	// bd8 <mm_leak_search_chunk+0xac>
 b5e:	3300      	movi      	r3, 0
 b60:	2b03      	subi      	r3, 4
 b62:	60e0      	addu      	r3, r8
 b64:	9360      	ld.w      	r3, (r3, 0x0)
 b66:	4363      	lsli      	r3, r3, 3
 b68:	60c8      	addu      	r3, r2
 b6a:	9360      	ld.w      	r3, (r3, 0x0)
 b6c:	6c0f      	mov      	r0, r3
 b6e:	e0000000 	bsr      	0x0	// a40 <dump_corrupted_list>
        traverse_one_list((struct m_dbg_hdr *)(mm_status.list[i].head), search_nearest, p);
 b72:	105a      	lrw      	r2, 0x0	// bd8 <mm_leak_search_chunk+0xac>
 b74:	3300      	movi      	r3, 0
 b76:	2b03      	subi      	r3, 4
 b78:	60e0      	addu      	r3, r8
 b7a:	9360      	ld.w      	r3, (r3, 0x0)
 b7c:	4363      	lsli      	r3, r3, 3
 b7e:	60c8      	addu      	r3, r2
 b80:	9300      	ld.w      	r0, (r3, 0x0)
 b82:	3300      	movi      	r3, 0
 b84:	2b07      	subi      	r3, 8
 b86:	60e0      	addu      	r3, r8
 b88:	9340      	ld.w      	r2, (r3, 0x0)
 b8a:	1035      	lrw      	r1, 0x0	// bdc <mm_leak_search_chunk+0xb0>
 b8c:	e0000000 	bsr      	0x0	// 648 <traverse_one_list>
    for(i = 0; i < MAX_HASH; i++) {
 b90:	3300      	movi      	r3, 0
 b92:	2b03      	subi      	r3, 4
 b94:	60e0      	addu      	r3, r8
 b96:	3200      	movi      	r2, 0
 b98:	2a03      	subi      	r2, 4
 b9a:	60a0      	addu      	r2, r8
 b9c:	9240      	ld.w      	r2, (r2, 0x0)
 b9e:	0421      	br      	0xbe0	// be0 <mm_leak_search_chunk+0xb4>
	...
 be0:	2200      	addi      	r2, 1
 be2:	b340      	st.w      	r2, (r3, 0x0)
 be4:	3300      	movi      	r3, 0
 be6:	2b03      	subi      	r3, 4
 be8:	60e0      	addu      	r3, r8
 bea:	9360      	ld.w      	r3, (r3, 0x0)
 bec:	3b2f      	cmplti      	r3, 16
 bee:	0bb7      	bt      	0xb5c	// b5c <mm_leak_search_chunk+0x30>
    }

    if (caddr) {
 bf0:	116b      	lrw      	r3, 0x0	// c9c <mm_show_corrupted+0x60>
 bf2:	9360      	ld.w      	r3, (r3, 0x0)
 bf4:	3b40      	cmpnei      	r3, 0
 bf6:	0c0b      	bf      	0xc0c	// c0c <mm_leak_search_chunk+0xe0>
        printf("%s before : addr=%x caller=%x\n", __func__, (uint32_t)caddr, (uint32_t)caddr->caller);
 bf8:	1169      	lrw      	r3, 0x0	// c9c <mm_show_corrupted+0x60>
 bfa:	9360      	ld.w      	r3, (r3, 0x0)
 bfc:	6c8f      	mov      	r2, r3
 bfe:	1168      	lrw      	r3, 0x0	// c9c <mm_show_corrupted+0x60>
 c00:	9360      	ld.w      	r3, (r3, 0x0)
 c02:	9362      	ld.w      	r3, (r3, 0x8)
 c04:	1127      	lrw      	r1, 0x0	// ca0 <mm_show_corrupted+0x64>
 c06:	1108      	lrw      	r0, 0x0	// ca4 <mm_show_corrupted+0x68>
 c08:	e0000000 	bsr      	0x0	// 0 <printf>
    }

    if (caddr_l != (void *) - 1UL) {
 c0c:	1167      	lrw      	r3, 0x0	// ca8 <mm_show_corrupted+0x6c>
 c0e:	9340      	ld.w      	r2, (r3, 0x0)
 c10:	3300      	movi      	r3, 0
 c12:	2b00      	subi      	r3, 1
 c14:	64ca      	cmpne      	r2, r3
 c16:	0c0b      	bf      	0xc2c	// c2c <mm_leak_search_chunk+0x100>
        printf("%s after : addr=%x caller=%x\n", __func__, (uint32_t)caddr_l, (uint32_t)caddr_l->caller);
 c18:	1164      	lrw      	r3, 0x0	// ca8 <mm_show_corrupted+0x6c>
 c1a:	9360      	ld.w      	r3, (r3, 0x0)
 c1c:	6c8f      	mov      	r2, r3
 c1e:	1163      	lrw      	r3, 0x0	// ca8 <mm_show_corrupted+0x6c>
 c20:	9360      	ld.w      	r3, (r3, 0x0)
 c22:	9362      	ld.w      	r3, (r3, 0x8)
 c24:	103f      	lrw      	r1, 0x0	// ca0 <mm_show_corrupted+0x64>
 c26:	1102      	lrw      	r0, 0x0	// cac <mm_show_corrupted+0x70>
 c28:	e0000000 	bsr      	0x0	// 0 <printf>
    }
}
 c2c:	6c00      	or      	r0, r0
 c2e:	6fa3      	mov      	r14, r8
 c30:	d9ee2001 	ld.w      	r15, (r14, 0x4)
 c34:	d90e2000 	ld.w      	r8, (r14, 0x0)
 c38:	1402      	addi      	r14, r14, 8
 c3a:	783c      	jmp      	r15

00000c3c <mm_show_corrupted>:

void mm_show_corrupted(void)
{
 c3c:	1422      	subi      	r14, r14, 8
 c3e:	dd0e2000 	st.w      	r8, (r14, 0x0)
 c42:	ddee2001 	st.w      	r15, (r14, 0x4)
 c46:	6e3b      	mov      	r8, r14
 c48:	1421      	subi      	r14, r14, 4
    int i;

    for(i = 0; i < MAX_HASH; i++) {
 c4a:	3300      	movi      	r3, 0
 c4c:	2b03      	subi      	r3, 4
 c4e:	60e0      	addu      	r3, r8
 c50:	3200      	movi      	r2, 0
 c52:	b340      	st.w      	r2, (r3, 0x0)
 c54:	0415      	br      	0xc7e	// c7e <mm_show_corrupted+0x42>
        dump_corrupted_list((struct m_dbg_hdr *)(mm_status.list[i].head));
 c56:	1057      	lrw      	r2, 0x0	// cb0 <mm_show_corrupted+0x74>
 c58:	3300      	movi      	r3, 0
 c5a:	2b03      	subi      	r3, 4
 c5c:	60e0      	addu      	r3, r8
 c5e:	9360      	ld.w      	r3, (r3, 0x0)
 c60:	4363      	lsli      	r3, r3, 3
 c62:	60c8      	addu      	r3, r2
 c64:	9360      	ld.w      	r3, (r3, 0x0)
 c66:	6c0f      	mov      	r0, r3
 c68:	e0000000 	bsr      	0x0	// a40 <dump_corrupted_list>
    for(i = 0; i < MAX_HASH; i++) {
 c6c:	3300      	movi      	r3, 0
 c6e:	2b03      	subi      	r3, 4
 c70:	60e0      	addu      	r3, r8
 c72:	3200      	movi      	r2, 0
 c74:	2a03      	subi      	r2, 4
 c76:	60a0      	addu      	r2, r8
 c78:	9240      	ld.w      	r2, (r2, 0x0)
 c7a:	2200      	addi      	r2, 1
 c7c:	b340      	st.w      	r2, (r3, 0x0)
 c7e:	3300      	movi      	r3, 0
 c80:	2b03      	subi      	r3, 4
 c82:	60e0      	addu      	r3, r8
 c84:	9360      	ld.w      	r3, (r3, 0x0)
 c86:	3b2f      	cmplti      	r3, 16
 c88:	0be7      	bt      	0xc56	// c56 <mm_show_corrupted+0x1a>
    }
}
 c8a:	6c00      	or      	r0, r0
 c8c:	6fa3      	mov      	r14, r8
 c8e:	d9ee2001 	ld.w      	r15, (r14, 0x4)
 c92:	d90e2000 	ld.w      	r8, (r14, 0x0)
 c96:	1402      	addi      	r14, r14, 8
 c98:	783c      	jmp      	r15
	...
