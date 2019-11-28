
Obj/drv_lib.o:     file format elf32-csky-little


Disassembly of section .text:

00000000 <_mdelay>:

//extern int32_t csi_usart_putchar(usart_handle_t handle, uint8_t ch);
//extern int32_t csi_usart_getchar(usart_handle_t handle, uint8_t *ch);

static void _mdelay(void)
{
   0:	1423      	subi      	r14, r14, 12
   2:	b880      	st.w      	r4, (r14, 0x0)
   4:	dd0e2001 	st.w      	r8, (r14, 0x4)
   8:	ddee2002 	st.w      	r15, (r14, 0x8)
   c:	6e3b      	mov      	r8, r14
   e:	1424      	subi      	r14, r14, 16
  \brief   get CORE timer reload value
  \return          CORE timer counter value.
 */
__ALWAYS_INLINE uint32_t csi_coret_get_load(void)
{
    return CORET->LOAD;
  10:	116b      	lrw      	r3, 0xe000e010	// bc <_mdelay+0xbc>
  12:	9341      	ld.w      	r2, (r3, 0x4)
    uint32_t load = csi_coret_get_load();
  14:	3300      	movi      	r3, 0
  16:	2b03      	subi      	r3, 4
  18:	60e0      	addu      	r3, r8
  1a:	b340      	st.w      	r2, (r3, 0x0)
  \brief   get CORE timer counter value
  \return          CORE timer counter value.
 */
__ALWAYS_INLINE uint32_t csi_coret_get_value(void)
{
    return CORET->VAL;
  1c:	1168      	lrw      	r3, 0xe000e010	// bc <_mdelay+0xbc>
  1e:	9342      	ld.w      	r2, (r3, 0x8)
    uint32_t start = csi_coret_get_value();
  20:	3300      	movi      	r3, 0
  22:	2b07      	subi      	r3, 8
  24:	60e0      	addu      	r3, r8
  26:	b340      	st.w      	r2, (r3, 0x0)
    uint32_t cur;
    //uint32_t cnt = (SYSTEM_CLOCK / 1000);
	uint32_t cnt = (sysclk_cfg._cur_hclk_freq / 1000);
  28:	1166      	lrw      	r3, 0x0	// c0 <_mdelay+0xc0>
  2a:	9361      	ld.w      	r3, (r3, 0x4)
  2c:	3400      	movi      	r4, 0
  2e:	2c0b      	subi      	r4, 12
  30:	6120      	addu      	r4, r8
  32:	31fa      	movi      	r1, 250
  34:	4122      	lsli      	r1, r1, 2
  36:	6c0f      	mov      	r0, r3
  38:	e0000000 	bsr      	0x0	// 0 <__udivsi3>
  3c:	6cc3      	mov      	r3, r0
  3e:	b460      	st.w      	r3, (r4, 0x0)
  40:	107f      	lrw      	r3, 0xe000e010	// bc <_mdelay+0xbc>
  42:	9342      	ld.w      	r2, (r3, 0x8)
    while (1) {
        cur = csi_coret_get_value();
  44:	3300      	movi      	r3, 0
  46:	2b0f      	subi      	r3, 16
  48:	60e0      	addu      	r3, r8
  4a:	b340      	st.w      	r2, (r3, 0x0)

        if (start > cur) {
  4c:	3200      	movi      	r2, 0
  4e:	2a07      	subi      	r2, 8
  50:	60a0      	addu      	r2, r8
  52:	3300      	movi      	r3, 0
  54:	2b0f      	subi      	r3, 16
  56:	60e0      	addu      	r3, r8
  58:	9240      	ld.w      	r2, (r2, 0x0)
  5a:	9360      	ld.w      	r3, (r3, 0x0)
  5c:	648c      	cmphs      	r3, r2
  5e:	0811      	bt      	0x80	// 80 <_mdelay+0x80>
            if (start - cur >= cnt) {
  60:	3200      	movi      	r2, 0
  62:	2a07      	subi      	r2, 8
  64:	60a0      	addu      	r2, r8
  66:	3300      	movi      	r3, 0
  68:	2b0f      	subi      	r3, 16
  6a:	60e0      	addu      	r3, r8
  6c:	9240      	ld.w      	r2, (r2, 0x0)
  6e:	9360      	ld.w      	r3, (r3, 0x0)
  70:	608e      	subu      	r2, r3
  72:	3300      	movi      	r3, 0
  74:	2b0b      	subi      	r3, 12
  76:	60e0      	addu      	r3, r8
  78:	9360      	ld.w      	r3, (r3, 0x0)
  7a:	64c8      	cmphs      	r2, r3
  7c:	0fe2      	bf      	0x40	// 40 <_mdelay+0x40>
                return;
  7e:	0417      	br      	0xac	// ac <_mdelay+0xac>
            }
        } else {
            if (cur + load - start > cnt) {
  80:	3200      	movi      	r2, 0
  82:	2a0f      	subi      	r2, 16
  84:	60a0      	addu      	r2, r8
  86:	3300      	movi      	r3, 0
  88:	2b03      	subi      	r3, 4
  8a:	60e0      	addu      	r3, r8
  8c:	9240      	ld.w      	r2, (r2, 0x0)
  8e:	9360      	ld.w      	r3, (r3, 0x0)
  90:	608c      	addu      	r2, r3
  92:	3300      	movi      	r3, 0
  94:	2b07      	subi      	r3, 8
  96:	60e0      	addu      	r3, r8
  98:	9360      	ld.w      	r3, (r3, 0x0)
  9a:	608e      	subu      	r2, r3
  9c:	3300      	movi      	r3, 0
  9e:	2b0b      	subi      	r3, 12
  a0:	60e0      	addu      	r3, r8
  a2:	9360      	ld.w      	r3, (r3, 0x0)
  a4:	648c      	cmphs      	r3, r2
  a6:	0c02      	bf      	0xaa	// aa <_mdelay+0xaa>
        cur = csi_coret_get_value();
  a8:	07cc      	br      	0x40	// 40 <_mdelay+0x40>
                return;
  aa:	6c00      	or      	r0, r0
            }
        }
    }
}
  ac:	6fa3      	mov      	r14, r8
  ae:	d9ee2002 	ld.w      	r15, (r14, 0x8)
  b2:	d90e2001 	ld.w      	r8, (r14, 0x4)
  b6:	9880      	ld.w      	r4, (r14, 0x0)
  b8:	1403      	addi      	r14, r14, 12
  ba:	783c      	jmp      	r15
  bc:	e000e010 	.long	0xe000e010
  c0:	00000000 	.long	0x00000000

000000c4 <mdelay>:

void mdelay(uint32_t ms)
{
  c4:	1422      	subi      	r14, r14, 8
  c6:	dd0e2000 	st.w      	r8, (r14, 0x0)
  ca:	ddee2001 	st.w      	r15, (r14, 0x4)
  ce:	6e3b      	mov      	r8, r14
  d0:	1421      	subi      	r14, r14, 4
  d2:	3300      	movi      	r3, 0
  d4:	2b03      	subi      	r3, 4
  d6:	60e0      	addu      	r3, r8
  d8:	b300      	st.w      	r0, (r3, 0x0)
    if (ms == 0) {
  da:	3300      	movi      	r3, 0
  dc:	2b03      	subi      	r3, 4
  de:	60e0      	addu      	r3, r8
  e0:	9360      	ld.w      	r3, (r3, 0x0)
  e2:	3b40      	cmpnei      	r3, 0
  e4:	0c10      	bf      	0x104	// 104 <mdelay+0x40>
        return;
    }

    while (ms--) {
  e6:	0403      	br      	0xec	// ec <mdelay+0x28>
        _mdelay();
  e8:	e0000000 	bsr      	0x0	// 0 <_mdelay>
    while (ms--) {
  ec:	3300      	movi      	r3, 0
  ee:	2b03      	subi      	r3, 4
  f0:	60e0      	addu      	r3, r8
  f2:	9360      	ld.w      	r3, (r3, 0x0)
  f4:	3200      	movi      	r2, 0
  f6:	2a03      	subi      	r2, 4
  f8:	60a0      	addu      	r2, r8
  fa:	5b23      	subi      	r1, r3, 1
  fc:	b220      	st.w      	r1, (r2, 0x0)
  fe:	3b40      	cmpnei      	r3, 0
 100:	0bf4      	bt      	0xe8	// e8 <mdelay+0x24>
 102:	0402      	br      	0x106	// 106 <mdelay+0x42>
        return;
 104:	6c00      	or      	r0, r0
    }
}
 106:	6fa3      	mov      	r14, r8
 108:	d9ee2001 	ld.w      	r15, (r14, 0x4)
 10c:	d90e2000 	ld.w      	r8, (r14, 0x0)
 110:	1402      	addi      	r14, r14, 8
 112:	783c      	jmp      	r15
