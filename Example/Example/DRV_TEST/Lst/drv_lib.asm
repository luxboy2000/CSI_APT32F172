
Obj/drv_lib.o:     file format elf32-csky-little


Disassembly of section .text:

00000000 <csi_coret_get_load>:
/**
  \brief   get CORE timer reload value
  \return          CORE timer counter value.
 */
__STATIC_INLINE uint32_t csi_coret_get_load(void)
{
   0:	1421      	subi      	sp, sp, 4
   2:	dd0e2000 	st.w      	r8, (sp, 0)
   6:	6e3b      	mov      	r8, sp
    return CORET->LOAD;
   8:	1064      	lrw      	r3, 0xe000e010	// 18 <csi_coret_get_load+0x18>
   a:	9361      	ld.w      	r3, (r3, 0x4)
}
   c:	6c0f      	mov      	r0, r3
   e:	6fa3      	mov      	sp, r8
  10:	d90e2000 	ld.w      	r8, (sp, 0)
  14:	1401      	addi      	sp, sp, 4
  16:	783c      	rts
  18:	e000e010 	.long	0xe000e010

0000001c <csi_coret_get_value>:
/**
  \brief   get CORE timer counter value
  \return          CORE timer counter value.
 */
__STATIC_INLINE uint32_t csi_coret_get_value(void)
{
  1c:	1421      	subi      	sp, sp, 4
  1e:	dd0e2000 	st.w      	r8, (sp, 0)
  22:	6e3b      	mov      	r8, sp
    return CORET->VAL;
  24:	1265      	lrw      	r3, 0xe000e010	// 138 <mdelay+0x50>
  26:	9362      	ld.w      	r3, (r3, 0x8)
}
  28:	6c0f      	mov      	r0, r3
  2a:	6fa3      	mov      	sp, r8
  2c:	d90e2000 	ld.w      	r8, (sp, 0)
  30:	1401      	addi      	sp, sp, 4
  32:	783c      	rts

00000034 <_mdelay>:

//extern int32_t csi_usart_putchar(usart_handle_t handle, uint8_t ch);
//extern int32_t csi_usart_getchar(usart_handle_t handle, uint8_t *ch);

static void _mdelay(void)
{
  34:	1423      	subi      	sp, sp, 12
  36:	b880      	st.w      	r4, (sp, 0)
  38:	dd0e2001 	st.w      	r8, (sp, 0x4)
  3c:	ddee2002 	st.w      	r15, (sp, 0x8)
  40:	6e3b      	mov      	r8, sp
  42:	1424      	subi      	sp, sp, 16
    uint32_t load = csi_coret_get_load();
  44:	3400      	movi      	r4, 0
  46:	2c03      	subi      	r4, 4
  48:	6120      	addu      	r4, r8
  4a:	e0000000 	bsr      	0	// 0 <csi_coret_get_load>
  4e:	6cc3      	mov      	r3, r0
  50:	b460      	st.w      	r3, (r4, 0)
    uint32_t start = csi_coret_get_value();
  52:	3400      	movi      	r4, 0
  54:	2c07      	subi      	r4, 8
  56:	6120      	addu      	r4, r8
  58:	e0000000 	bsr      	0	// 1c <csi_coret_get_value>
  5c:	6cc3      	mov      	r3, r0
  5e:	b460      	st.w      	r3, (r4, 0)
    uint32_t cur;
    uint32_t cnt = (SYSTEM_CLOCK / 1000);
  60:	3300      	movi      	r3, 0
  62:	2b0b      	subi      	r3, 12
  64:	60e0      	addu      	r3, r8
  66:	1156      	lrw      	r2, 0x4e20	// 13c <mdelay+0x54>
  68:	b340      	st.w      	r2, (r3, 0)

    while (1) {
        cur = csi_coret_get_value();
  6a:	3400      	movi      	r4, 0
  6c:	2c0f      	subi      	r4, 16
  6e:	6120      	addu      	r4, r8
  70:	e0000000 	bsr      	0	// 1c <csi_coret_get_value>
  74:	6cc3      	mov      	r3, r0
  76:	b460      	st.w      	r3, (r4, 0)

        if (start > cur) {
  78:	3200      	movi      	r2, 0
  7a:	2a07      	subi      	r2, 8
  7c:	60a0      	addu      	r2, r8
  7e:	3300      	movi      	r3, 0
  80:	2b0f      	subi      	r3, 16
  82:	60e0      	addu      	r3, r8
  84:	9240      	ld.w      	r2, (r2, 0)
  86:	9360      	ld.w      	r3, (r3, 0)
  88:	648c      	cmphs      	r3, r2
  8a:	0811      	bt      	0xac	// ac <_mdelay+0x78>
            if (start - cur >= cnt) {
  8c:	3200      	movi      	r2, 0
  8e:	2a07      	subi      	r2, 8
  90:	60a0      	addu      	r2, r8
  92:	3300      	movi      	r3, 0
  94:	2b0f      	subi      	r3, 16
  96:	60e0      	addu      	r3, r8
  98:	9240      	ld.w      	r2, (r2, 0)
  9a:	9360      	ld.w      	r3, (r3, 0)
  9c:	608e      	subu      	r2, r3
  9e:	3300      	movi      	r3, 0
  a0:	2b0b      	subi      	r3, 12
  a2:	60e0      	addu      	r3, r8
  a4:	9360      	ld.w      	r3, (r3, 0)
  a6:	64c8      	cmphs      	r2, r3
  a8:	0fe1      	bf      	0x6a	// 6a <_mdelay+0x36>
                return;
  aa:	0417      	br      	0xd8	// d8 <_mdelay+0xa4>
            }
        } else {
            if (cur + load - start > cnt) {
  ac:	3200      	movi      	r2, 0
  ae:	2a0f      	subi      	r2, 16
  b0:	60a0      	addu      	r2, r8
  b2:	3300      	movi      	r3, 0
  b4:	2b03      	subi      	r3, 4
  b6:	60e0      	addu      	r3, r8
  b8:	9240      	ld.w      	r2, (r2, 0)
  ba:	9360      	ld.w      	r3, (r3, 0)
  bc:	608c      	addu      	r2, r3
  be:	3300      	movi      	r3, 0
  c0:	2b07      	subi      	r3, 8
  c2:	60e0      	addu      	r3, r8
  c4:	9360      	ld.w      	r3, (r3, 0)
  c6:	608e      	subu      	r2, r3
  c8:	3300      	movi      	r3, 0
  ca:	2b0b      	subi      	r3, 12
  cc:	60e0      	addu      	r3, r8
  ce:	9360      	ld.w      	r3, (r3, 0)
  d0:	648c      	cmphs      	r3, r2
  d2:	0c02      	bf      	0xd6	// d6 <_mdelay+0xa2>
        cur = csi_coret_get_value();
  d4:	07cb      	br      	0x6a	// 6a <_mdelay+0x36>
                return;
  d6:	6c00      	or      	r0, r0
            }
        }
    }
}
  d8:	6fa3      	mov      	sp, r8
  da:	d9ee2002 	ld.w      	r15, (sp, 0x8)
  de:	d90e2001 	ld.w      	r8, (sp, 0x4)
  e2:	9880      	ld.w      	r4, (sp, 0)
  e4:	1403      	addi      	sp, sp, 12
  e6:	783c      	rts

000000e8 <mdelay>:

void mdelay(uint32_t ms)
{
  e8:	1422      	subi      	sp, sp, 8
  ea:	dd0e2000 	st.w      	r8, (sp, 0)
  ee:	ddee2001 	st.w      	r15, (sp, 0x4)
  f2:	6e3b      	mov      	r8, sp
  f4:	1421      	subi      	sp, sp, 4
  f6:	3300      	movi      	r3, 0
  f8:	2b03      	subi      	r3, 4
  fa:	60e0      	addu      	r3, r8
  fc:	b300      	st.w      	r0, (r3, 0)
    if (ms == 0) {
  fe:	3300      	movi      	r3, 0
 100:	2b03      	subi      	r3, 4
 102:	60e0      	addu      	r3, r8
 104:	9360      	ld.w      	r3, (r3, 0)
 106:	3b40      	cmpnei      	r3, 0
 108:	0c10      	bf      	0x128	// 128 <mdelay+0x40>
        return;
    }

    while (ms--) {
 10a:	0403      	br      	0x110	// 110 <mdelay+0x28>
        _mdelay();
 10c:	e0000000 	bsr      	0	// 34 <_mdelay>
    while (ms--) {
 110:	3300      	movi      	r3, 0
 112:	2b03      	subi      	r3, 4
 114:	60e0      	addu      	r3, r8
 116:	9360      	ld.w      	r3, (r3, 0)
 118:	3200      	movi      	r2, 0
 11a:	2a03      	subi      	r2, 4
 11c:	60a0      	addu      	r2, r8
 11e:	5b23      	subi      	r1, r3, 1
 120:	b220      	st.w      	r1, (r2, 0)
 122:	3b40      	cmpnei      	r3, 0
 124:	0bf4      	bt      	0x10c	// 10c <mdelay+0x24>
 126:	0402      	br      	0x12a	// 12a <mdelay+0x42>
        return;
 128:	6c00      	or      	r0, r0
    }
}
 12a:	6fa3      	mov      	sp, r8
 12c:	d9ee2001 	ld.w      	r15, (sp, 0x4)
 130:	d90e2000 	ld.w      	r8, (sp, 0)
 134:	1402      	addi      	sp, sp, 8
 136:	783c      	rts
 138:	e000e010 	.long	0xe000e010
 13c:	00004e20 	.long	0x00004e20
