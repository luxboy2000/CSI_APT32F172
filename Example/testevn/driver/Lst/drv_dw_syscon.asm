
Obj/drv_dw_syscon.o:     file format elf32-csky-little


Disassembly of section .text:

00000000 <csi_syscon_cb_init>:
 * @param[i]    cb:     pointer to customer ISR when EXI is called 
 * @param[i]    idx:    exi isr number to be initialized
 * @return      zero on success
*/
int32_t csi_syscon_cb_init (syscon_event_cb_t cb)
{
       0:	1421      	subi      	r14, r14, 4
       2:	dd0e2000 	st.w      	r8, (r14, 0x0)
       6:	6e3b      	mov      	r8, r14
       8:	1422      	subi      	r14, r14, 8
       a:	3300      	movi      	r3, 0
       c:	2b07      	subi      	r3, 8
       e:	60e0      	addu      	r3, r8
      10:	b300      	st.w      	r0, (r3, 0x0)
	SYSCON_NULL_PARAM_CHK(cb);
      12:	3300      	movi      	r3, 0
      14:	2b07      	subi      	r3, 8
      16:	60e0      	addu      	r3, r8
      18:	9360      	ld.w      	r3, (r3, 0x0)
      1a:	3b40      	cmpnei      	r3, 0
      1c:	0803      	bt      	0x22	// 22 <csi_syscon_cb_init+0x22>
      1e:	1070      	lrw      	r3, 0x81160084	// 5c <csi_syscon_cb_init+0x5c>
      20:	0418      	br      	0x50	// 50 <csi_syscon_cb_init+0x50>
	syscon_event_cb = cb;
      22:	1070      	lrw      	r3, 0x0	// 60 <csi_syscon_cb_init+0x60>
      24:	3200      	movi      	r2, 0
      26:	2a07      	subi      	r2, 8
      28:	60a0      	addu      	r2, r8
      2a:	9240      	ld.w      	r2, (r2, 0x0)
      2c:	b340      	st.w      	r2, (r3, 0x0)
      2e:	3300      	movi      	r3, 0
      30:	2b03      	subi      	r3, 4
      32:	60e0      	addu      	r3, r8
      34:	3201      	movi      	r2, 1
      36:	b340      	st.w      	r2, (r3, 0x0)
  \details Enable a device-specific interrupt in the VIC interrupt controller.
  \param [in]      IRQn  External interrupt number. Value cannot be negative.
 */
__ALWAYS_INLINE void csi_vic_enable_irq(int32_t IRQn)
{
    VIC->ISER[0U] = (uint32_t)(1UL << (((uint32_t)(int32_t)IRQn) & 0x1FUL));
      38:	106b      	lrw      	r3, 0xe000e100	// 64 <csi_syscon_cb_init+0x64>
      3a:	3200      	movi      	r2, 0
      3c:	2a03      	subi      	r2, 4
      3e:	60a0      	addu      	r2, r8
      40:	9220      	ld.w      	r1, (r2, 0x0)
      42:	321f      	movi      	r2, 31
      44:	6884      	and      	r2, r1
      46:	3101      	movi      	r1, 1
      48:	7048      	lsl      	r1, r2
      4a:	6c87      	mov      	r2, r1
      4c:	b340      	st.w      	r2, (r3, 0x0)

    csi_vic_enable_irq(SYSCON_IRQn);
    
	return 0;
      4e:	3300      	movi      	r3, 0
}
      50:	6c0f      	mov      	r0, r3
      52:	6fa3      	mov      	r14, r8
      54:	d90e2000 	ld.w      	r8, (r14, 0x0)
      58:	1401      	addi      	r14, r14, 4
      5a:	783c      	jmp      	r15
      5c:	81160084 	.long	0x81160084
      60:	00000000 	.long	0x00000000
      64:	e000e100 	.long	0xe000e100

00000068 <csi_syscon_emosc_config>:
  \param[in]   osc_stabletime: stable counter value (0x7 in default)
  \param[in]   osc_gain: gain control of external osc(0xf in default)
  \return      error code
*/
void csi_syscon_emosc_config(syscon_emosc_lf_e lf_sel, uint32_t osc_stabletime, uint32_t osc_gain)
{
      68:	1421      	subi      	r14, r14, 4
      6a:	dd0e2000 	st.w      	r8, (r14, 0x0)
      6e:	6e3b      	mov      	r8, r14
      70:	1423      	subi      	r14, r14, 12
      72:	3300      	movi      	r3, 0
      74:	2b03      	subi      	r3, 4
      76:	60e0      	addu      	r3, r8
      78:	b300      	st.w      	r0, (r3, 0x0)
      7a:	3300      	movi      	r3, 0
      7c:	2b07      	subi      	r3, 8
      7e:	60e0      	addu      	r3, r8
      80:	b320      	st.w      	r1, (r3, 0x0)
      82:	3300      	movi      	r3, 0
      84:	2b0b      	subi      	r3, 12
      86:	60e0      	addu      	r3, r8
      88:	b340      	st.w      	r2, (r3, 0x0)
	switch (lf_sel) {
      8a:	3300      	movi      	r3, 0
      8c:	2b03      	subi      	r3, 4
      8e:	60e0      	addu      	r3, r8
      90:	9360      	ld.w      	r3, (r3, 0x0)
      92:	3b41      	cmpnei      	r3, 1
      94:	0820      	bt      	0xd4	// d4 <csi_syscon_emosc_config+0x6c>
		case EMOSC_LF_OPTION: /* low freq emosc */
			H_SYSCON->OSTR  = osc_stabletime;
      96:	ea830108 	lrw      	r3, 0x0	// 4b4 <csi_syscon_systemclock_config+0x2a0>
      9a:	9360      	ld.w      	r3, (r3, 0x0)
      9c:	3200      	movi      	r2, 0
      9e:	2a07      	subi      	r2, 8
      a0:	60a0      	addu      	r2, r8
      a2:	9240      	ld.w      	r2, (r2, 0x0)
      a4:	b350      	st.w      	r2, (r3, 0x40)
			H_SYSCON->PWRCR = ((H_SYSCON->PWRCR) & ~(0xful<<8)) | ((osc_gain & 7ul)<<8) | PWRCR_KEY;
      a6:	ea830104 	lrw      	r3, 0x0	// 4b4 <csi_syscon_systemclock_config+0x2a0>
      aa:	9340      	ld.w      	r2, (r3, 0x0)
      ac:	ea830102 	lrw      	r3, 0x0	// 4b4 <csi_syscon_systemclock_config+0x2a0>
      b0:	9360      	ld.w      	r3, (r3, 0x0)
      b2:	9335      	ld.w      	r1, (r3, 0x54)
      b4:	33f0      	movi      	r3, 240
      b6:	4364      	lsli      	r3, r3, 4
      b8:	684d      	andn      	r1, r3
      ba:	3300      	movi      	r3, 0
      bc:	2b0b      	subi      	r3, 12
      be:	60e0      	addu      	r3, r8
      c0:	9360      	ld.w      	r3, (r3, 0x0)
      c2:	4308      	lsli      	r0, r3, 8
      c4:	33e0      	movi      	r3, 224
      c6:	4363      	lsli      	r3, r3, 3
      c8:	68c0      	and      	r3, r0
      ca:	6c4c      	or      	r1, r3
      cc:	0064      	lrw      	r3, 0xa66a0000	// 4b8 <csi_syscon_systemclock_config+0x2a4>
      ce:	6cc4      	or      	r3, r1
      d0:	b275      	st.w      	r3, (r2, 0x54)
			break;
      d2:	0419      	br      	0x104	// 104 <csi_syscon_emosc_config+0x9c>
		default: // normal 
			H_SYSCON->OSTR  = osc_stabletime;
      d4:	0067      	lrw      	r3, 0x0	// 4b4 <csi_syscon_systemclock_config+0x2a0>
      d6:	9360      	ld.w      	r3, (r3, 0x0)
      d8:	3200      	movi      	r2, 0
      da:	2a07      	subi      	r2, 8
      dc:	60a0      	addu      	r2, r8
      de:	9240      	ld.w      	r2, (r2, 0x0)
      e0:	b350      	st.w      	r2, (r3, 0x40)
			H_SYSCON->PWRCR = ((H_SYSCON->PWRCR) & ~(0xful<<8)) | (osc_gain<<8) | PWRCR_KEY;
      e2:	006a      	lrw      	r3, 0x0	// 4b4 <csi_syscon_systemclock_config+0x2a0>
      e4:	9340      	ld.w      	r2, (r3, 0x0)
      e6:	006b      	lrw      	r3, 0x0	// 4b4 <csi_syscon_systemclock_config+0x2a0>
      e8:	9360      	ld.w      	r3, (r3, 0x0)
      ea:	9335      	ld.w      	r1, (r3, 0x54)
      ec:	33f0      	movi      	r3, 240
      ee:	4364      	lsli      	r3, r3, 4
      f0:	684d      	andn      	r1, r3
      f2:	3300      	movi      	r3, 0
      f4:	2b0b      	subi      	r3, 12
      f6:	60e0      	addu      	r3, r8
      f8:	9360      	ld.w      	r3, (r3, 0x0)
      fa:	4368      	lsli      	r3, r3, 8
      fc:	6c4c      	or      	r1, r3
      fe:	0070      	lrw      	r3, 0xa66a0000	// 4b8 <csi_syscon_systemclock_config+0x2a4>
     100:	6cc4      	or      	r3, r1
     102:	b275      	st.w      	r3, (r2, 0x54)
	}

	emosc_intialized_flag = true;
     104:	0071      	lrw      	r3, 0x0	// 4bc <csi_syscon_systemclock_config+0x2a8>
     106:	3201      	movi      	r2, 1
     108:	a340      	st.b      	r2, (r3, 0x0)
}
     10a:	6c00      	or      	r0, r0
     10c:	6fa3      	mov      	r14, r8
     10e:	d90e2000 	ld.w      	r8, (r14, 0x0)
     112:	1401      	addi      	r14, r14, 4
     114:	783c      	jmp      	r15
	...

00000118 <csi_syscon_set_clocksource_switch>:
  \param[in]   clock_source: clock source to be enable or disabled
  \param[in]   status: enable or disable
  \return      error code
*/
int32_t csi_syscon_set_clocksource_switch(syscon_oscsrc_e clock_source, syscon_endis_e status)
{
     118:	1421      	subi      	r14, r14, 4
     11a:	dd0e2000 	st.w      	r8, (r14, 0x0)
     11e:	6e3b      	mov      	r8, r14
     120:	1424      	subi      	r14, r14, 16
     122:	3300      	movi      	r3, 0
     124:	2b0b      	subi      	r3, 12
     126:	60e0      	addu      	r3, r8
     128:	b300      	st.w      	r0, (r3, 0x0)
     12a:	3300      	movi      	r3, 0
     12c:	2b0f      	subi      	r3, 16
     12e:	60e0      	addu      	r3, r8
     130:	b320      	st.w      	r1, (r3, 0x0)
	volatile uint32_t i;
	uint32_t cur_clkstatus;

	if ((clock_source == EMOSC) && !emosc_intialized_flag) {
     132:	3300      	movi      	r3, 0
     134:	2b0b      	subi      	r3, 12
     136:	60e0      	addu      	r3, r8
     138:	9360      	ld.w      	r3, (r3, 0x0)
     13a:	3b44      	cmpnei      	r3, 4
     13c:	080c      	bt      	0x154	// 154 <csi_syscon_set_clocksource_switch+0x3c>
     13e:	007f      	lrw      	r3, 0x0	// 4bc <csi_syscon_systemclock_config+0x2a8>
     140:	8360      	ld.b      	r3, (r3, 0x0)
     142:	748c      	zextb      	r2, r3
     144:	3301      	movi      	r3, 1
     146:	6c8d      	xor      	r2, r3
     148:	6ccb      	mov      	r3, r2
     14a:	74cc      	zextb      	r3, r3
     14c:	3b40      	cmpnei      	r3, 0
     14e:	0c03      	bf      	0x154	// 154 <csi_syscon_set_clocksource_switch+0x3c>
		return ERR_SYSCON(DRV_ERROR_SPECIFIC0);
     150:	0163      	lrw      	r3, 0x81160085	// 4c0 <csi_syscon_systemclock_config+0x2ac>
     152:	045b      	br      	0x208	// 208 <csi_syscon_set_clocksource_switch+0xf0>
	}

	cur_clkstatus = H_SYSCON->GCSR;
     154:	0167      	lrw      	r3, 0x0	// 4b4 <csi_syscon_systemclock_config+0x2a0>
     156:	9340      	ld.w      	r2, (r3, 0x0)
     158:	3300      	movi      	r3, 0
     15a:	2b03      	subi      	r3, 4
     15c:	60e0      	addu      	r3, r8
     15e:	9243      	ld.w      	r2, (r2, 0xc)
     160:	b340      	st.w      	r2, (r3, 0x0)
	if (status == ENABLE) {
     162:	3300      	movi      	r3, 0
     164:	2b0f      	subi      	r3, 16
     166:	60e0      	addu      	r3, r8
     168:	9360      	ld.w      	r3, (r3, 0x0)
     16a:	3b40      	cmpnei      	r3, 0
     16c:	0816      	bt      	0x198	// 198 <csi_syscon_set_clocksource_switch+0x80>
		H_SYSCON->GCER = clock_source;
     16e:	016d      	lrw      	r3, 0x0	// 4b4 <csi_syscon_systemclock_config+0x2a0>
     170:	9360      	ld.w      	r3, (r3, 0x0)
     172:	3200      	movi      	r2, 0
     174:	2a0b      	subi      	r2, 12
     176:	60a0      	addu      	r2, r8
     178:	9240      	ld.w      	r2, (r2, 0x0)
     17a:	b341      	st.w      	r2, (r3, 0x4)
		cur_clkstatus |= clock_source;
     17c:	3300      	movi      	r3, 0
     17e:	2b03      	subi      	r3, 4
     180:	60e0      	addu      	r3, r8
     182:	3100      	movi      	r1, 0
     184:	2903      	subi      	r1, 4
     186:	6060      	addu      	r1, r8
     188:	3200      	movi      	r2, 0
     18a:	2a0b      	subi      	r2, 12
     18c:	60a0      	addu      	r2, r8
     18e:	9120      	ld.w      	r1, (r1, 0x0)
     190:	9240      	ld.w      	r2, (r2, 0x0)
     192:	6c84      	or      	r2, r1
     194:	b340      	st.w      	r2, (r3, 0x0)
     196:	0417      	br      	0x1c4	// 1c4 <csi_syscon_set_clocksource_switch+0xac>
	}
	else {
		H_SYSCON->GCDR = clock_source;
     198:	0178      	lrw      	r3, 0x0	// 4b4 <csi_syscon_systemclock_config+0x2a0>
     19a:	9360      	ld.w      	r3, (r3, 0x0)
     19c:	3200      	movi      	r2, 0
     19e:	2a0b      	subi      	r2, 12
     1a0:	60a0      	addu      	r2, r8
     1a2:	9240      	ld.w      	r2, (r2, 0x0)
     1a4:	b342      	st.w      	r2, (r3, 0x8)
		cur_clkstatus &= ~clock_source;
     1a6:	3300      	movi      	r3, 0
     1a8:	2b0b      	subi      	r3, 12
     1aa:	60e0      	addu      	r3, r8
     1ac:	9360      	ld.w      	r3, (r3, 0x0)
     1ae:	6cce      	nor      	r3, r3
     1b0:	6c4f      	mov      	r1, r3
     1b2:	3300      	movi      	r3, 0
     1b4:	2b03      	subi      	r3, 4
     1b6:	60e0      	addu      	r3, r8
     1b8:	3200      	movi      	r2, 0
     1ba:	2a03      	subi      	r2, 4
     1bc:	60a0      	addu      	r2, r8
     1be:	9240      	ld.w      	r2, (r2, 0x0)
     1c0:	6884      	and      	r2, r1
     1c2:	b340      	st.w      	r2, (r3, 0x0)
	}

	for (i=0;i<100;i++);
     1c4:	3300      	movi      	r3, 0
     1c6:	2b07      	subi      	r3, 8
     1c8:	60e0      	addu      	r3, r8
     1ca:	3200      	movi      	r2, 0
     1cc:	b340      	st.w      	r2, (r3, 0x0)
     1ce:	040a      	br      	0x1e2	// 1e2 <csi_syscon_set_clocksource_switch+0xca>
     1d0:	3300      	movi      	r3, 0
     1d2:	2b07      	subi      	r3, 8
     1d4:	60e0      	addu      	r3, r8
     1d6:	9360      	ld.w      	r3, (r3, 0x0)
     1d8:	5b42      	addi      	r2, r3, 1
     1da:	3300      	movi      	r3, 0
     1dc:	2b07      	subi      	r3, 8
     1de:	60e0      	addu      	r3, r8
     1e0:	b340      	st.w      	r2, (r3, 0x0)
     1e2:	3300      	movi      	r3, 0
     1e4:	2b07      	subi      	r3, 8
     1e6:	60e0      	addu      	r3, r8
     1e8:	9340      	ld.w      	r2, (r3, 0x0)
     1ea:	3363      	movi      	r3, 99
     1ec:	648c      	cmphs      	r3, r2
     1ee:	0bf1      	bt      	0x1d0	// 1d0 <csi_syscon_set_clocksource_switch+0xb8>

	if (H_SYSCON->GCSR != cur_clkstatus) {
     1f0:	026e      	lrw      	r3, 0x0	// 4b4 <csi_syscon_systemclock_config+0x2a0>
     1f2:	9360      	ld.w      	r3, (r3, 0x0)
     1f4:	9343      	ld.w      	r2, (r3, 0xc)
     1f6:	3300      	movi      	r3, 0
     1f8:	2b03      	subi      	r3, 4
     1fa:	60e0      	addu      	r3, r8
     1fc:	9360      	ld.w      	r3, (r3, 0x0)
     1fe:	64ca      	cmpne      	r2, r3
     200:	0c03      	bf      	0x206	// 206 <csi_syscon_set_clocksource_switch+0xee>
		return ERR_SYSCON(DRV_ERROR_SPECIFIC1);
     202:	026e      	lrw      	r3, 0x81160086	// 4c4 <csi_syscon_systemclock_config+0x2b0>
     204:	0402      	br      	0x208	// 208 <csi_syscon_set_clocksource_switch+0xf0>
	}
	else {
		return 0;
     206:	3300      	movi      	r3, 0
	}
}
     208:	6c0f      	mov      	r0, r3
     20a:	6fa3      	mov      	r14, r8
     20c:	d90e2000 	ld.w      	r8, (r14, 0x0)
     210:	1401      	addi      	r14, r14, 4
     212:	783c      	jmp      	r15

00000214 <csi_syscon_systemclock_config>:
  \param[in]   hclk_freq: value of target hclk frequence
  \param[in]   pclk_freq: value of target hclk frequence
  \return      error code
*/
int32_t csi_syscon_systemclock_config(syscon_sysclk_e sysclk_setup, uint32_t hclk_freq, uint32_t pclk_freq)
{
     214:	1423      	subi      	r14, r14, 12
     216:	b880      	st.w      	r4, (r14, 0x0)
     218:	dd0e2001 	st.w      	r8, (r14, 0x4)
     21c:	ddee2002 	st.w      	r15, (r14, 0x8)
     220:	6e3b      	mov      	r8, r14
     222:	1429      	subi      	r14, r14, 36
     224:	3300      	movi      	r3, 0
     226:	2b1b      	subi      	r3, 28
     228:	60e0      	addu      	r3, r8
     22a:	b300      	st.w      	r0, (r3, 0x0)
     22c:	3300      	movi      	r3, 0
     22e:	2b1f      	subi      	r3, 32
     230:	60e0      	addu      	r3, r8
     232:	b320      	st.w      	r1, (r3, 0x0)
     234:	3300      	movi      	r3, 0
     236:	2b23      	subi      	r3, 36
     238:	60e0      	addu      	r3, r8
     23a:	b340      	st.w      	r2, (r3, 0x0)
	volatile uint32_t i;
	uint32_t target_sysclk_freq = 0;
     23c:	3300      	movi      	r3, 0
     23e:	2b03      	subi      	r3, 4
     240:	60e0      	addu      	r3, r8
     242:	3200      	movi      	r2, 0
     244:	b340      	st.w      	r2, (r3, 0x0)
	uint32_t target_hclk_freq, hclk_div;
	uint32_t target_pclk_freq, pclk_div;

	// parameter check
	if (hclk_freq < pclk_freq) {
     246:	3200      	movi      	r2, 0
     248:	2a1f      	subi      	r2, 32
     24a:	60a0      	addu      	r2, r8
     24c:	3300      	movi      	r3, 0
     24e:	2b23      	subi      	r3, 36
     250:	60e0      	addu      	r3, r8
     252:	9240      	ld.w      	r2, (r2, 0x0)
     254:	9360      	ld.w      	r3, (r3, 0x0)
     256:	64c8      	cmphs      	r2, r3
     258:	0804      	bt      	0x260	// 260 <csi_syscon_systemclock_config+0x4c>
		return ERR_SYSCON(DRV_ERROR_PARAMETER);
     25a:	0363      	lrw      	r3, 0x81160084	// 4c8 <csi_syscon_systemclock_config+0x2b4>
     25c:	e800026f 	br      	0x73a	// 73a <csi_syscon_systemclock_config+0x526>
	}

	switch (sysclk_setup) {
     260:	3300      	movi      	r3, 0
     262:	2b1b      	subi      	r3, 28
     264:	60e0      	addu      	r3, r8
     266:	9360      	ld.w      	r3, (r3, 0x0)
     268:	3b41      	cmpnei      	r3, 1
     26a:	0c18      	bf      	0x29a	// 29a <csi_syscon_systemclock_config+0x86>
     26c:	3b00      	cmphsi      	r3, 1
     26e:	0c36      	bf      	0x2da	// 2da <csi_syscon_systemclock_config+0xc6>
     270:	3b42      	cmpnei      	r3, 2
     272:	0c04      	bf      	0x27a	// 27a <csi_syscon_systemclock_config+0x66>
     274:	3b43      	cmpnei      	r3, 3
     276:	0c22      	bf      	0x2ba	// 2ba <csi_syscon_systemclock_config+0xa6>
     278:	0441      	br      	0x2fa	// 2fa <csi_syscon_systemclock_config+0xe6>
		case IMOSC_40M:
			if ( hclk_freq <= 40000000 ) {
     27a:	3300      	movi      	r3, 0
     27c:	2b1f      	subi      	r3, 32
     27e:	60e0      	addu      	r3, r8
     280:	9340      	ld.w      	r2, (r3, 0x0)
     282:	036c      	lrw      	r3, 0x2625a00	// 4cc <csi_syscon_systemclock_config+0x2b8>
     284:	648c      	cmphs      	r3, r2
     286:	0c07      	bf      	0x294	// 294 <csi_syscon_systemclock_config+0x80>
				target_sysclk_freq = 40000000;
     288:	3300      	movi      	r3, 0
     28a:	2b03      	subi      	r3, 4
     28c:	60e0      	addu      	r3, r8
     28e:	034f      	lrw      	r2, 0x2625a00	// 4cc <csi_syscon_systemclock_config+0x2b8>
     290:	b340      	st.w      	r2, (r3, 0x0)
			} else {
				return ERR_SYSCON(DRV_ERROR_PARAMETER);
			}
			break;
     292:	0434      	br      	0x2fa	// 2fa <csi_syscon_systemclock_config+0xe6>
				return ERR_SYSCON(DRV_ERROR_PARAMETER);
     294:	0372      	lrw      	r3, 0x81160084	// 4c8 <csi_syscon_systemclock_config+0x2b4>
     296:	e8000252 	br      	0x73a	// 73a <csi_syscon_systemclock_config+0x526>
		case IMOSC_20M:
			if ( hclk_freq <= 20000000 ) {
     29a:	3300      	movi      	r3, 0
     29c:	2b1f      	subi      	r3, 32
     29e:	60e0      	addu      	r3, r8
     2a0:	9340      	ld.w      	r2, (r3, 0x0)
     2a2:	0373      	lrw      	r3, 0x1312d00	// 4d0 <csi_syscon_systemclock_config+0x2bc>
     2a4:	648c      	cmphs      	r3, r2
     2a6:	0c07      	bf      	0x2b4	// 2b4 <csi_syscon_systemclock_config+0xa0>
				target_sysclk_freq = 20000000;
     2a8:	3300      	movi      	r3, 0
     2aa:	2b03      	subi      	r3, 4
     2ac:	60e0      	addu      	r3, r8
     2ae:	0356      	lrw      	r2, 0x1312d00	// 4d0 <csi_syscon_systemclock_config+0x2bc>
     2b0:	b340      	st.w      	r2, (r3, 0x0)
			} else {
				return ERR_SYSCON(DRV_ERROR_PARAMETER);
			}
			break;
     2b2:	0424      	br      	0x2fa	// 2fa <csi_syscon_systemclock_config+0xe6>
				return ERR_SYSCON(DRV_ERROR_PARAMETER);
     2b4:	037a      	lrw      	r3, 0x81160084	// 4c8 <csi_syscon_systemclock_config+0x2b4>
     2b6:	e8000242 	br      	0x73a	// 73a <csi_syscon_systemclock_config+0x526>
		case EMOSC_24M:
			if ( (hclk_freq <= EMOSC_FREQ) && (EMOSC_FREQ <= 24000000) ) {
     2ba:	3300      	movi      	r3, 0
     2bc:	2b1f      	subi      	r3, 32
     2be:	60e0      	addu      	r3, r8
     2c0:	9340      	ld.w      	r2, (r3, 0x0)
     2c2:	037a      	lrw      	r3, 0x989680	// 4d4 <csi_syscon_systemclock_config+0x2c0>
     2c4:	648c      	cmphs      	r3, r2
     2c6:	0c07      	bf      	0x2d4	// 2d4 <csi_syscon_systemclock_config+0xc0>
				target_sysclk_freq = EMOSC_FREQ;
     2c8:	3300      	movi      	r3, 0
     2ca:	2b03      	subi      	r3, 4
     2cc:	60e0      	addu      	r3, r8
     2ce:	035d      	lrw      	r2, 0x989680	// 4d4 <csi_syscon_systemclock_config+0x2c0>
     2d0:	b340      	st.w      	r2, (r3, 0x0)
			} else {
				return ERR_SYSCON(DRV_ERROR_PARAMETER);
			}
			break;
     2d2:	0414      	br      	0x2fa	// 2fa <csi_syscon_systemclock_config+0xe6>
				return ERR_SYSCON(DRV_ERROR_PARAMETER);
     2d4:	137d      	lrw      	r3, 0x81160084	// 4c8 <csi_syscon_systemclock_config+0x2b4>
     2d6:	e8000232 	br      	0x73a	// 73a <csi_syscon_systemclock_config+0x526>
		case ISOSC_3M:
			if ( (hclk_freq <= 3000000) ) {
     2da:	3300      	movi      	r3, 0
     2dc:	2b1f      	subi      	r3, 32
     2de:	60e0      	addu      	r3, r8
     2e0:	9340      	ld.w      	r2, (r3, 0x0)
     2e2:	137e      	lrw      	r3, 0x2dc6c0	// 4d8 <csi_syscon_systemclock_config+0x2c4>
     2e4:	648c      	cmphs      	r3, r2
     2e6:	0c07      	bf      	0x2f4	// 2f4 <csi_syscon_systemclock_config+0xe0>
				target_sysclk_freq = 3000000;
     2e8:	3300      	movi      	r3, 0
     2ea:	2b03      	subi      	r3, 4
     2ec:	60e0      	addu      	r3, r8
     2ee:	135b      	lrw      	r2, 0x2dc6c0	// 4d8 <csi_syscon_systemclock_config+0x2c4>
     2f0:	b340      	st.w      	r2, (r3, 0x0)
			} else {
				return ERR_SYSCON(DRV_ERROR_PARAMETER);
			}
			break;
     2f2:	0404      	br      	0x2fa	// 2fa <csi_syscon_systemclock_config+0xe6>
				return ERR_SYSCON(DRV_ERROR_PARAMETER);
     2f4:	1375      	lrw      	r3, 0x81160084	// 4c8 <csi_syscon_systemclock_config+0x2b4>
     2f6:	e8000222 	br      	0x73a	// 73a <csi_syscon_systemclock_config+0x526>
	}
	target_hclk_freq = hclk_freq;
     2fa:	3300      	movi      	r3, 0
     2fc:	2b07      	subi      	r3, 8
     2fe:	60e0      	addu      	r3, r8
     300:	3200      	movi      	r2, 0
     302:	2a1f      	subi      	r2, 32
     304:	60a0      	addu      	r2, r8
     306:	9240      	ld.w      	r2, (r2, 0x0)
     308:	b340      	st.w      	r2, (r3, 0x0)

	hclk_div = target_sysclk_freq/target_hclk_freq;
     30a:	3400      	movi      	r4, 0
     30c:	2c0b      	subi      	r4, 12
     30e:	6120      	addu      	r4, r8
     310:	3300      	movi      	r3, 0
     312:	2b03      	subi      	r3, 4
     314:	60e0      	addu      	r3, r8
     316:	3200      	movi      	r2, 0
     318:	2a07      	subi      	r2, 8
     31a:	60a0      	addu      	r2, r8
     31c:	9220      	ld.w      	r1, (r2, 0x0)
     31e:	9300      	ld.w      	r0, (r3, 0x0)
     320:	e0000000 	bsr      	0x0	// 0 <__udivsi3>
     324:	6cc3      	mov      	r3, r0
     326:	b460      	st.w      	r3, (r4, 0x0)
	target_hclk_freq = target_sysclk_freq/hclk_div;
     328:	3400      	movi      	r4, 0
     32a:	2c07      	subi      	r4, 8
     32c:	6120      	addu      	r4, r8
     32e:	3300      	movi      	r3, 0
     330:	2b03      	subi      	r3, 4
     332:	60e0      	addu      	r3, r8
     334:	3200      	movi      	r2, 0
     336:	2a0b      	subi      	r2, 12
     338:	60a0      	addu      	r2, r8
     33a:	9220      	ld.w      	r1, (r2, 0x0)
     33c:	9300      	ld.w      	r0, (r3, 0x0)
     33e:	e0000000 	bsr      	0x0	// 0 <__udivsi3>
     342:	6cc3      	mov      	r3, r0
     344:	b460      	st.w      	r3, (r4, 0x0)
	pclk_div = hclk_freq/pclk_freq;
     346:	3400      	movi      	r4, 0
     348:	2c0f      	subi      	r4, 16
     34a:	6120      	addu      	r4, r8
     34c:	3300      	movi      	r3, 0
     34e:	2b1f      	subi      	r3, 32
     350:	60e0      	addu      	r3, r8
     352:	3200      	movi      	r2, 0
     354:	2a23      	subi      	r2, 36
     356:	60a0      	addu      	r2, r8
     358:	9220      	ld.w      	r1, (r2, 0x0)
     35a:	9300      	ld.w      	r0, (r3, 0x0)
     35c:	e0000000 	bsr      	0x0	// 0 <__udivsi3>
     360:	6cc3      	mov      	r3, r0
     362:	b460      	st.w      	r3, (r4, 0x0)
	target_pclk_freq = target_hclk_freq/pclk_div;
     364:	3400      	movi      	r4, 0
     366:	2c13      	subi      	r4, 20
     368:	6120      	addu      	r4, r8
     36a:	3300      	movi      	r3, 0
     36c:	2b07      	subi      	r3, 8
     36e:	60e0      	addu      	r3, r8
     370:	3200      	movi      	r2, 0
     372:	2a0f      	subi      	r2, 16
     374:	60a0      	addu      	r2, r8
     376:	9220      	ld.w      	r1, (r2, 0x0)
     378:	9300      	ld.w      	r0, (r3, 0x0)
     37a:	e0000000 	bsr      	0x0	// 0 <__udivsi3>
     37e:	6cc3      	mov      	r3, r0
     380:	b460      	st.w      	r3, (r4, 0x0)

	// switch system clock as IMO40M
	if ((sysclk_cfg._cur_sysclk == IMOSC_20M) && (sysclk_setup == IMOSC_40M)) {
     382:	1277      	lrw      	r3, 0x0	// 4dc <csi_syscon_systemclock_config+0x2c8>
     384:	9360      	ld.w      	r3, (r3, 0x0)
     386:	3b41      	cmpnei      	r3, 1
     388:	0892      	bt      	0x4ac	// 4ac <csi_syscon_systemclock_config+0x298>
     38a:	3300      	movi      	r3, 0
     38c:	2b1b      	subi      	r3, 28
     38e:	60e0      	addu      	r3, r8
     390:	9360      	ld.w      	r3, (r3, 0x0)
     392:	3b42      	cmpnei      	r3, 2
     394:	088c      	bt      	0x4ac	// 4ac <csi_syscon_systemclock_config+0x298>
		H_SYSCON->GCER = 1; // enable ISOSC
     396:	1268      	lrw      	r3, 0x0	// 4b4 <csi_syscon_systemclock_config+0x2a0>
     398:	9360      	ld.w      	r3, (r3, 0x0)
     39a:	3201      	movi      	r2, 1
     39c:	b341      	st.w      	r2, (r3, 0x4)
		for (i=0;i<100;i++);
     39e:	3300      	movi      	r3, 0
     3a0:	2b17      	subi      	r3, 24
     3a2:	60e0      	addu      	r3, r8
     3a4:	3200      	movi      	r2, 0
     3a6:	b340      	st.w      	r2, (r3, 0x0)
     3a8:	040a      	br      	0x3bc	// 3bc <csi_syscon_systemclock_config+0x1a8>
     3aa:	3300      	movi      	r3, 0
     3ac:	2b17      	subi      	r3, 24
     3ae:	60e0      	addu      	r3, r8
     3b0:	9360      	ld.w      	r3, (r3, 0x0)
     3b2:	5b42      	addi      	r2, r3, 1
     3b4:	3300      	movi      	r3, 0
     3b6:	2b17      	subi      	r3, 24
     3b8:	60e0      	addu      	r3, r8
     3ba:	b340      	st.w      	r2, (r3, 0x0)
     3bc:	3300      	movi      	r3, 0
     3be:	2b17      	subi      	r3, 24
     3c0:	60e0      	addu      	r3, r8
     3c2:	9340      	ld.w      	r2, (r3, 0x0)
     3c4:	3363      	movi      	r3, 99
     3c6:	648c      	cmphs      	r3, r2
     3c8:	0bf1      	bt      	0x3aa	// 3aa <csi_syscon_systemclock_config+0x196>
		H_SYSCON->SCLKCR = (4 | SCLKCR_KEY); // switch to ISOSC as sysclk
     3ca:	117b      	lrw      	r3, 0x0	// 4b4 <csi_syscon_systemclock_config+0x2a0>
     3cc:	9360      	ld.w      	r3, (r3, 0x0)
     3ce:	1245      	lrw      	r2, 0xd22d0004	// 4e0 <csi_syscon_systemclock_config+0x2cc>
     3d0:	b347      	st.w      	r2, (r3, 0x1c)
		for (i=0;i<10;i++);
     3d2:	3300      	movi      	r3, 0
     3d4:	2b17      	subi      	r3, 24
     3d6:	60e0      	addu      	r3, r8
     3d8:	3200      	movi      	r2, 0
     3da:	b340      	st.w      	r2, (r3, 0x0)
     3dc:	040a      	br      	0x3f0	// 3f0 <csi_syscon_systemclock_config+0x1dc>
     3de:	3300      	movi      	r3, 0
     3e0:	2b17      	subi      	r3, 24
     3e2:	60e0      	addu      	r3, r8
     3e4:	9360      	ld.w      	r3, (r3, 0x0)
     3e6:	5b42      	addi      	r2, r3, 1
     3e8:	3300      	movi      	r3, 0
     3ea:	2b17      	subi      	r3, 24
     3ec:	60e0      	addu      	r3, r8
     3ee:	b340      	st.w      	r2, (r3, 0x0)
     3f0:	3300      	movi      	r3, 0
     3f2:	2b17      	subi      	r3, 24
     3f4:	60e0      	addu      	r3, r8
     3f6:	9360      	ld.w      	r3, (r3, 0x0)
     3f8:	3b09      	cmphsi      	r3, 10
     3fa:	0ff2      	bf      	0x3de	// 3de <csi_syscon_systemclock_config+0x1ca>
		if ((H_SYSCON->ERRINF) & (1ul<<4)) {
     3fc:	116e      	lrw      	r3, 0x0	// 4b4 <csi_syscon_systemclock_config+0x2a0>
     3fe:	9360      	ld.w      	r3, (r3, 0x0)
     400:	23eb      	addi      	r3, 236
     402:	9340      	ld.w      	r2, (r3, 0x0)
     404:	3310      	movi      	r3, 16
     406:	68c8      	and      	r3, r2
     408:	3b40      	cmpnei      	r3, 0
     40a:	0c03      	bf      	0x410	// 410 <csi_syscon_systemclock_config+0x1fc>
			return ERR_SYSCON(DRV_ERROR_SPECIFIC2);
     40c:	1176      	lrw      	r3, 0x81160087	// 4e4 <csi_syscon_systemclock_config+0x2d0>
     40e:	0596      	br      	0x73a	// 73a <csi_syscon_systemclock_config+0x526>
		}
		H_SYSCON->GCDR = 2; // disable IMOSC
     410:	1169      	lrw      	r3, 0x0	// 4b4 <csi_syscon_systemclock_config+0x2a0>
     412:	9360      	ld.w      	r3, (r3, 0x0)
     414:	3202      	movi      	r2, 2
     416:	b342      	st.w      	r2, (r3, 0x8)
		H_SYSCON->CLCR |= (1ul<<22);
     418:	1167      	lrw      	r3, 0x0	// 4b4 <csi_syscon_systemclock_config+0x2a0>
     41a:	9360      	ld.w      	r3, (r3, 0x0)
     41c:	1146      	lrw      	r2, 0x0	// 4b4 <csi_syscon_systemclock_config+0x2a0>
     41e:	9240      	ld.w      	r2, (r2, 0x0)
     420:	9254      	ld.w      	r2, (r2, 0x50)
     422:	3ab6      	bseti      	r2, 22
     424:	b354      	st.w      	r2, (r3, 0x50)
		H_SYSCON->GCER = 2; // enable IMOSC
     426:	1164      	lrw      	r3, 0x0	// 4b4 <csi_syscon_systemclock_config+0x2a0>
     428:	9360      	ld.w      	r3, (r3, 0x0)
     42a:	3202      	movi      	r2, 2
     42c:	b341      	st.w      	r2, (r3, 0x4)
		for (i=0;i<100;i++);
     42e:	3300      	movi      	r3, 0
     430:	2b17      	subi      	r3, 24
     432:	60e0      	addu      	r3, r8
     434:	3200      	movi      	r2, 0
     436:	b340      	st.w      	r2, (r3, 0x0)
     438:	040a      	br      	0x44c	// 44c <csi_syscon_systemclock_config+0x238>
     43a:	3300      	movi      	r3, 0
     43c:	2b17      	subi      	r3, 24
     43e:	60e0      	addu      	r3, r8
     440:	9360      	ld.w      	r3, (r3, 0x0)
     442:	5b42      	addi      	r2, r3, 1
     444:	3300      	movi      	r3, 0
     446:	2b17      	subi      	r3, 24
     448:	60e0      	addu      	r3, r8
     44a:	b340      	st.w      	r2, (r3, 0x0)
     44c:	3300      	movi      	r3, 0
     44e:	2b17      	subi      	r3, 24
     450:	60e0      	addu      	r3, r8
     452:	9340      	ld.w      	r2, (r3, 0x0)
     454:	3363      	movi      	r3, 99
     456:	648c      	cmphs      	r3, r2
     458:	0bf1      	bt      	0x43a	// 43a <csi_syscon_systemclock_config+0x226>
		H_SYSCON->SCLKCR = ((hclk_div<<8)|SCLKCR_KEY);
     45a:	1077      	lrw      	r3, 0x0	// 4b4 <csi_syscon_systemclock_config+0x2a0>
     45c:	9360      	ld.w      	r3, (r3, 0x0)
     45e:	3200      	movi      	r2, 0
     460:	2a0b      	subi      	r2, 12
     462:	60a0      	addu      	r2, r8
     464:	9240      	ld.w      	r2, (r2, 0x0)
     466:	4228      	lsli      	r1, r2, 8
     468:	1140      	lrw      	r2, 0xd22d0000	// 4e8 <csi_syscon_systemclock_config+0x2d4>
     46a:	6c84      	or      	r2, r1
     46c:	b347      	st.w      	r2, (r3, 0x1c)
		for (i=0;i<10;i++);
     46e:	3300      	movi      	r3, 0
     470:	2b17      	subi      	r3, 24
     472:	60e0      	addu      	r3, r8
     474:	3200      	movi      	r2, 0
     476:	b340      	st.w      	r2, (r3, 0x0)
     478:	040a      	br      	0x48c	// 48c <csi_syscon_systemclock_config+0x278>
     47a:	3300      	movi      	r3, 0
     47c:	2b17      	subi      	r3, 24
     47e:	60e0      	addu      	r3, r8
     480:	9360      	ld.w      	r3, (r3, 0x0)
     482:	5b42      	addi      	r2, r3, 1
     484:	3300      	movi      	r3, 0
     486:	2b17      	subi      	r3, 24
     488:	60e0      	addu      	r3, r8
     48a:	b340      	st.w      	r2, (r3, 0x0)
     48c:	3300      	movi      	r3, 0
     48e:	2b17      	subi      	r3, 24
     490:	60e0      	addu      	r3, r8
     492:	9360      	ld.w      	r3, (r3, 0x0)
     494:	3b09      	cmphsi      	r3, 10
     496:	0ff2      	bf      	0x47a	// 47a <csi_syscon_systemclock_config+0x266>
		if ((H_SYSCON->ERRINF) & (1ul<<4)) {
     498:	1067      	lrw      	r3, 0x0	// 4b4 <csi_syscon_systemclock_config+0x2a0>
     49a:	9360      	ld.w      	r3, (r3, 0x0)
     49c:	23eb      	addi      	r3, 236
     49e:	9340      	ld.w      	r2, (r3, 0x0)
     4a0:	3310      	movi      	r3, 16
     4a2:	68c8      	and      	r3, r2
     4a4:	3b40      	cmpnei      	r3, 0
     4a6:	0d2d      	bf      	0x700	// 700 <csi_syscon_systemclock_config+0x4ec>
			return ERR_SYSCON(DRV_ERROR_SPECIFIC3);
     4a8:	1071      	lrw      	r3, 0x81160088	// 4ec <csi_syscon_systemclock_config+0x2d8>
     4aa:	0548      	br      	0x73a	// 73a <csi_syscon_systemclock_config+0x526>
		}
	}
	// switch system clock as IMO20M
	else if ((sysclk_cfg._cur_sysclk == IMOSC_40M) && (sysclk_setup == IMOSC_20M)) {
     4ac:	106c      	lrw      	r3, 0x0	// 4dc <csi_syscon_systemclock_config+0x2c8>
     4ae:	9360      	ld.w      	r3, (r3, 0x0)
     4b0:	3b42      	cmpnei      	r3, 2
     4b2:	041f      	br      	0x4f0	// 4f0 <csi_syscon_systemclock_config+0x2dc>
     4b4:	00000000 	.long	0x00000000
     4b8:	a66a0000 	.long	0xa66a0000
     4bc:	00000000 	.long	0x00000000
     4c0:	81160085 	.long	0x81160085
     4c4:	81160086 	.long	0x81160086
     4c8:	81160084 	.long	0x81160084
     4cc:	02625a00 	.long	0x02625a00
     4d0:	01312d00 	.long	0x01312d00
     4d4:	00989680 	.long	0x00989680
     4d8:	002dc6c0 	.long	0x002dc6c0
     4dc:	00000000 	.long	0x00000000
     4e0:	d22d0004 	.long	0xd22d0004
     4e4:	81160087 	.long	0x81160087
     4e8:	d22d0000 	.long	0xd22d0000
     4ec:	81160088 	.long	0x81160088
     4f0:	0892      	bt      	0x614	// 614 <csi_syscon_systemclock_config+0x400>
     4f2:	3300      	movi      	r3, 0
     4f4:	2b1b      	subi      	r3, 28
     4f6:	60e0      	addu      	r3, r8
     4f8:	9360      	ld.w      	r3, (r3, 0x0)
     4fa:	3b41      	cmpnei      	r3, 1
     4fc:	088c      	bt      	0x614	// 614 <csi_syscon_systemclock_config+0x400>
		H_SYSCON->GCER = 1; // enable ISOSC
     4fe:	006a      	lrw      	r3, 0x0	// 8d0 <csi_syscon_clockmonitor_set_switch+0xa0>
     500:	9360      	ld.w      	r3, (r3, 0x0)
     502:	3201      	movi      	r2, 1
     504:	b341      	st.w      	r2, (r3, 0x4)
		for (i=0;i<100;i++);
     506:	3300      	movi      	r3, 0
     508:	2b17      	subi      	r3, 24
     50a:	60e0      	addu      	r3, r8
     50c:	3200      	movi      	r2, 0
     50e:	b340      	st.w      	r2, (r3, 0x0)
     510:	040a      	br      	0x524	// 524 <csi_syscon_systemclock_config+0x310>
     512:	3300      	movi      	r3, 0
     514:	2b17      	subi      	r3, 24
     516:	60e0      	addu      	r3, r8
     518:	9360      	ld.w      	r3, (r3, 0x0)
     51a:	5b42      	addi      	r2, r3, 1
     51c:	3300      	movi      	r3, 0
     51e:	2b17      	subi      	r3, 24
     520:	60e0      	addu      	r3, r8
     522:	b340      	st.w      	r2, (r3, 0x0)
     524:	3300      	movi      	r3, 0
     526:	2b17      	subi      	r3, 24
     528:	60e0      	addu      	r3, r8
     52a:	9340      	ld.w      	r2, (r3, 0x0)
     52c:	3363      	movi      	r3, 99
     52e:	648c      	cmphs      	r3, r2
     530:	0bf1      	bt      	0x512	// 512 <csi_syscon_systemclock_config+0x2fe>
		H_SYSCON->SCLKCR = (4 | SCLKCR_KEY); // switch to ISOSC as sysclk
     532:	0077      	lrw      	r3, 0x0	// 8d0 <csi_syscon_clockmonitor_set_switch+0xa0>
     534:	9360      	ld.w      	r3, (r3, 0x0)
     536:	0057      	lrw      	r2, 0xd22d0004	// 8d4 <csi_syscon_clockmonitor_set_switch+0xa4>
     538:	b347      	st.w      	r2, (r3, 0x1c)
		for (i=0;i<10;i++);
     53a:	3300      	movi      	r3, 0
     53c:	2b17      	subi      	r3, 24
     53e:	60e0      	addu      	r3, r8
     540:	3200      	movi      	r2, 0
     542:	b340      	st.w      	r2, (r3, 0x0)
     544:	040a      	br      	0x558	// 558 <csi_syscon_systemclock_config+0x344>
     546:	3300      	movi      	r3, 0
     548:	2b17      	subi      	r3, 24
     54a:	60e0      	addu      	r3, r8
     54c:	9360      	ld.w      	r3, (r3, 0x0)
     54e:	5b42      	addi      	r2, r3, 1
     550:	3300      	movi      	r3, 0
     552:	2b17      	subi      	r3, 24
     554:	60e0      	addu      	r3, r8
     556:	b340      	st.w      	r2, (r3, 0x0)
     558:	3300      	movi      	r3, 0
     55a:	2b17      	subi      	r3, 24
     55c:	60e0      	addu      	r3, r8
     55e:	9360      	ld.w      	r3, (r3, 0x0)
     560:	3b09      	cmphsi      	r3, 10
     562:	0ff2      	bf      	0x546	// 546 <csi_syscon_systemclock_config+0x332>
		if ((H_SYSCON->ERRINF) & (1ul<<4)) {
     564:	0164      	lrw      	r3, 0x0	// 8d0 <csi_syscon_clockmonitor_set_switch+0xa0>
     566:	9360      	ld.w      	r3, (r3, 0x0)
     568:	23eb      	addi      	r3, 236
     56a:	9340      	ld.w      	r2, (r3, 0x0)
     56c:	3310      	movi      	r3, 16
     56e:	68c8      	and      	r3, r2
     570:	3b40      	cmpnei      	r3, 0
     572:	0c03      	bf      	0x578	// 578 <csi_syscon_systemclock_config+0x364>
			return ERR_SYSCON(DRV_ERROR_SPECIFIC4);
     574:	0166      	lrw      	r3, 0x81160089	// 8d8 <csi_syscon_clockmonitor_set_switch+0xa8>
     576:	04e2      	br      	0x73a	// 73a <csi_syscon_systemclock_config+0x526>
		}
		H_SYSCON->GCDR = 2; // disable IMOSC
     578:	0169      	lrw      	r3, 0x0	// 8d0 <csi_syscon_clockmonitor_set_switch+0xa0>
     57a:	9360      	ld.w      	r3, (r3, 0x0)
     57c:	3202      	movi      	r2, 2
     57e:	b342      	st.w      	r2, (r3, 0x8)
		H_SYSCON->CLCR &= ~(1ul<<22);
     580:	016b      	lrw      	r3, 0x0	// 8d0 <csi_syscon_clockmonitor_set_switch+0xa0>
     582:	9360      	ld.w      	r3, (r3, 0x0)
     584:	014c      	lrw      	r2, 0x0	// 8d0 <csi_syscon_clockmonitor_set_switch+0xa0>
     586:	9240      	ld.w      	r2, (r2, 0x0)
     588:	9254      	ld.w      	r2, (r2, 0x50)
     58a:	3a96      	bclri      	r2, 22
     58c:	b354      	st.w      	r2, (r3, 0x50)
		H_SYSCON->GCER = 2; // enable IMOSC
     58e:	016e      	lrw      	r3, 0x0	// 8d0 <csi_syscon_clockmonitor_set_switch+0xa0>
     590:	9360      	ld.w      	r3, (r3, 0x0)
     592:	3202      	movi      	r2, 2
     594:	b341      	st.w      	r2, (r3, 0x4)
		for (i=0;i<100;i++);
     596:	3300      	movi      	r3, 0
     598:	2b17      	subi      	r3, 24
     59a:	60e0      	addu      	r3, r8
     59c:	3200      	movi      	r2, 0
     59e:	b340      	st.w      	r2, (r3, 0x0)
     5a0:	040a      	br      	0x5b4	// 5b4 <csi_syscon_systemclock_config+0x3a0>
     5a2:	3300      	movi      	r3, 0
     5a4:	2b17      	subi      	r3, 24
     5a6:	60e0      	addu      	r3, r8
     5a8:	9360      	ld.w      	r3, (r3, 0x0)
     5aa:	5b42      	addi      	r2, r3, 1
     5ac:	3300      	movi      	r3, 0
     5ae:	2b17      	subi      	r3, 24
     5b0:	60e0      	addu      	r3, r8
     5b2:	b340      	st.w      	r2, (r3, 0x0)
     5b4:	3300      	movi      	r3, 0
     5b6:	2b17      	subi      	r3, 24
     5b8:	60e0      	addu      	r3, r8
     5ba:	9340      	ld.w      	r2, (r3, 0x0)
     5bc:	3363      	movi      	r3, 99
     5be:	648c      	cmphs      	r3, r2
     5c0:	0bf1      	bt      	0x5a2	// 5a2 <csi_syscon_systemclock_config+0x38e>
		H_SYSCON->SCLKCR = ((hclk_div<<8)|SCLKCR_KEY);
     5c2:	017b      	lrw      	r3, 0x0	// 8d0 <csi_syscon_clockmonitor_set_switch+0xa0>
     5c4:	9360      	ld.w      	r3, (r3, 0x0)
     5c6:	3200      	movi      	r2, 0
     5c8:	2a0b      	subi      	r2, 12
     5ca:	60a0      	addu      	r2, r8
     5cc:	9240      	ld.w      	r2, (r2, 0x0)
     5ce:	4228      	lsli      	r1, r2, 8
     5d0:	015c      	lrw      	r2, 0xd22d0000	// 8dc <csi_syscon_clockmonitor_set_switch+0xac>
     5d2:	6c84      	or      	r2, r1
     5d4:	b347      	st.w      	r2, (r3, 0x1c)
		for (i=0;i<10;i++);
     5d6:	3300      	movi      	r3, 0
     5d8:	2b17      	subi      	r3, 24
     5da:	60e0      	addu      	r3, r8
     5dc:	3200      	movi      	r2, 0
     5de:	b340      	st.w      	r2, (r3, 0x0)
     5e0:	040a      	br      	0x5f4	// 5f4 <csi_syscon_systemclock_config+0x3e0>
     5e2:	3300      	movi      	r3, 0
     5e4:	2b17      	subi      	r3, 24
     5e6:	60e0      	addu      	r3, r8
     5e8:	9360      	ld.w      	r3, (r3, 0x0)
     5ea:	5b42      	addi      	r2, r3, 1
     5ec:	3300      	movi      	r3, 0
     5ee:	2b17      	subi      	r3, 24
     5f0:	60e0      	addu      	r3, r8
     5f2:	b340      	st.w      	r2, (r3, 0x0)
     5f4:	3300      	movi      	r3, 0
     5f6:	2b17      	subi      	r3, 24
     5f8:	60e0      	addu      	r3, r8
     5fa:	9360      	ld.w      	r3, (r3, 0x0)
     5fc:	3b09      	cmphsi      	r3, 10
     5fe:	0ff2      	bf      	0x5e2	// 5e2 <csi_syscon_systemclock_config+0x3ce>
		if ((H_SYSCON->ERRINF) & (1ul<<4)) {
     600:	026b      	lrw      	r3, 0x0	// 8d0 <csi_syscon_clockmonitor_set_switch+0xa0>
     602:	9360      	ld.w      	r3, (r3, 0x0)
     604:	23eb      	addi      	r3, 236
     606:	9340      	ld.w      	r2, (r3, 0x0)
     608:	3310      	movi      	r3, 16
     60a:	68c8      	and      	r3, r2
     60c:	3b40      	cmpnei      	r3, 0
     60e:	0c79      	bf      	0x700	// 700 <csi_syscon_systemclock_config+0x4ec>
			return ERR_SYSCON(DRV_ERROR_SPECIFIC5);
     610:	026b      	lrw      	r3, 0x8116008a	// 8e0 <csi_syscon_clockmonitor_set_switch+0xb0>
     612:	0494      	br      	0x73a	// 73a <csi_syscon_systemclock_config+0x526>
		}
	// switch system clock as EMO
	} else if ((sysclk_cfg._cur_sysclk != EMOSC_24M) && (sysclk_setup == EMOSC_24M)) {
     614:	026b      	lrw      	r3, 0x0	// 8e4 <csi_syscon_clockmonitor_set_switch+0xb4>
     616:	9360      	ld.w      	r3, (r3, 0x0)
     618:	3b43      	cmpnei      	r3, 3
     61a:	0c30      	bf      	0x67a	// 67a <csi_syscon_systemclock_config+0x466>
     61c:	3300      	movi      	r3, 0
     61e:	2b1b      	subi      	r3, 28
     620:	60e0      	addu      	r3, r8
     622:	9360      	ld.w      	r3, (r3, 0x0)
     624:	3b43      	cmpnei      	r3, 3
     626:	082a      	bt      	0x67a	// 67a <csi_syscon_systemclock_config+0x466>
		H_SYSCON->SCLKCR = (1 | (hclk_div<<8) | SCLKCR_KEY); // switch to EMOSC as sysclk
     628:	0275      	lrw      	r3, 0x0	// 8d0 <csi_syscon_clockmonitor_set_switch+0xa0>
     62a:	9360      	ld.w      	r3, (r3, 0x0)
     62c:	3200      	movi      	r2, 0
     62e:	2a0b      	subi      	r2, 12
     630:	60a0      	addu      	r2, r8
     632:	9240      	ld.w      	r2, (r2, 0x0)
     634:	4228      	lsli      	r1, r2, 8
     636:	0252      	lrw      	r2, 0xd22d0001	// 8e8 <csi_syscon_clockmonitor_set_switch+0xb8>
     638:	6c84      	or      	r2, r1
     63a:	b347      	st.w      	r2, (r3, 0x1c)
		for (i=0;i<10;i++);
     63c:	3300      	movi      	r3, 0
     63e:	2b17      	subi      	r3, 24
     640:	60e0      	addu      	r3, r8
     642:	3200      	movi      	r2, 0
     644:	b340      	st.w      	r2, (r3, 0x0)
     646:	040a      	br      	0x65a	// 65a <csi_syscon_systemclock_config+0x446>
     648:	3300      	movi      	r3, 0
     64a:	2b17      	subi      	r3, 24
     64c:	60e0      	addu      	r3, r8
     64e:	9360      	ld.w      	r3, (r3, 0x0)
     650:	5b42      	addi      	r2, r3, 1
     652:	3300      	movi      	r3, 0
     654:	2b17      	subi      	r3, 24
     656:	60e0      	addu      	r3, r8
     658:	b340      	st.w      	r2, (r3, 0x0)
     65a:	3300      	movi      	r3, 0
     65c:	2b17      	subi      	r3, 24
     65e:	60e0      	addu      	r3, r8
     660:	9360      	ld.w      	r3, (r3, 0x0)
     662:	3b09      	cmphsi      	r3, 10
     664:	0ff2      	bf      	0x648	// 648 <csi_syscon_systemclock_config+0x434>
		if ((H_SYSCON->ERRINF) & (1ul<<4)) {
     666:	0364      	lrw      	r3, 0x0	// 8d0 <csi_syscon_clockmonitor_set_switch+0xa0>
     668:	9360      	ld.w      	r3, (r3, 0x0)
     66a:	23eb      	addi      	r3, 236
     66c:	9340      	ld.w      	r2, (r3, 0x0)
     66e:	3310      	movi      	r3, 16
     670:	68c8      	and      	r3, r2
     672:	3b40      	cmpnei      	r3, 0
     674:	0c46      	bf      	0x700	// 700 <csi_syscon_systemclock_config+0x4ec>
			return ERR_SYSCON(DRV_ERROR_SPECIFIC6);
     676:	0361      	lrw      	r3, 0x8116008b	// 8ec <csi_syscon_clockmonitor_set_switch+0xbc>
     678:	0461      	br      	0x73a	// 73a <csi_syscon_systemclock_config+0x526>
		}
	// switch system clock as ISO3M
	} else if ((sysclk_cfg._cur_sysclk != ISOSC_3M) && (sysclk_setup == ISOSC_3M)) {
     67a:	0364      	lrw      	r3, 0x0	// 8e4 <csi_syscon_clockmonitor_set_switch+0xb4>
     67c:	9360      	ld.w      	r3, (r3, 0x0)
     67e:	3b40      	cmpnei      	r3, 0
     680:	0c30      	bf      	0x6e0	// 6e0 <csi_syscon_systemclock_config+0x4cc>
     682:	3300      	movi      	r3, 0
     684:	2b1b      	subi      	r3, 28
     686:	60e0      	addu      	r3, r8
     688:	9360      	ld.w      	r3, (r3, 0x0)
     68a:	3b40      	cmpnei      	r3, 0
     68c:	082a      	bt      	0x6e0	// 6e0 <csi_syscon_systemclock_config+0x4cc>
		H_SYSCON->SCLKCR = (4 | (hclk_div<<8) | SCLKCR_KEY); // switch to ISOSC as sysclk
     68e:	036e      	lrw      	r3, 0x0	// 8d0 <csi_syscon_clockmonitor_set_switch+0xa0>
     690:	9360      	ld.w      	r3, (r3, 0x0)
     692:	3200      	movi      	r2, 0
     694:	2a0b      	subi      	r2, 12
     696:	60a0      	addu      	r2, r8
     698:	9240      	ld.w      	r2, (r2, 0x0)
     69a:	4228      	lsli      	r1, r2, 8
     69c:	0351      	lrw      	r2, 0xd22d0004	// 8d4 <csi_syscon_clockmonitor_set_switch+0xa4>
     69e:	6c84      	or      	r2, r1
     6a0:	b347      	st.w      	r2, (r3, 0x1c)
		for (i=0;i<10;i++);
     6a2:	3300      	movi      	r3, 0
     6a4:	2b17      	subi      	r3, 24
     6a6:	60e0      	addu      	r3, r8
     6a8:	3200      	movi      	r2, 0
     6aa:	b340      	st.w      	r2, (r3, 0x0)
     6ac:	040a      	br      	0x6c0	// 6c0 <csi_syscon_systemclock_config+0x4ac>
     6ae:	3300      	movi      	r3, 0
     6b0:	2b17      	subi      	r3, 24
     6b2:	60e0      	addu      	r3, r8
     6b4:	9360      	ld.w      	r3, (r3, 0x0)
     6b6:	5b42      	addi      	r2, r3, 1
     6b8:	3300      	movi      	r3, 0
     6ba:	2b17      	subi      	r3, 24
     6bc:	60e0      	addu      	r3, r8
     6be:	b340      	st.w      	r2, (r3, 0x0)
     6c0:	3300      	movi      	r3, 0
     6c2:	2b17      	subi      	r3, 24
     6c4:	60e0      	addu      	r3, r8
     6c6:	9360      	ld.w      	r3, (r3, 0x0)
     6c8:	3b09      	cmphsi      	r3, 10
     6ca:	0ff2      	bf      	0x6ae	// 6ae <csi_syscon_systemclock_config+0x49a>
		if ((H_SYSCON->ERRINF) & (1ul<<4)) {
     6cc:	037e      	lrw      	r3, 0x0	// 8d0 <csi_syscon_clockmonitor_set_switch+0xa0>
     6ce:	9360      	ld.w      	r3, (r3, 0x0)
     6d0:	23eb      	addi      	r3, 236
     6d2:	9340      	ld.w      	r2, (r3, 0x0)
     6d4:	3310      	movi      	r3, 16
     6d6:	68c8      	and      	r3, r2
     6d8:	3b40      	cmpnei      	r3, 0
     6da:	0c13      	bf      	0x700	// 700 <csi_syscon_systemclock_config+0x4ec>
			return ERR_SYSCON(DRV_ERROR_SPECIFIC7);
     6dc:	037a      	lrw      	r3, 0x8116008c	// 8f0 <csi_syscon_clockmonitor_set_switch+0xc0>
     6de:	042e      	br      	0x73a	// 73a <csi_syscon_systemclock_config+0x526>
		}
	} else { // only change div option
		H_SYSCON->SCLKCR = ((H_SYSCON->SCLKCR)&0xff) |  (hclk_div<<8) | SCLKCR_KEY;
     6e0:	137c      	lrw      	r3, 0x0	// 8d0 <csi_syscon_clockmonitor_set_switch+0xa0>
     6e2:	9360      	ld.w      	r3, (r3, 0x0)
     6e4:	135b      	lrw      	r2, 0x0	// 8d0 <csi_syscon_clockmonitor_set_switch+0xa0>
     6e6:	9240      	ld.w      	r2, (r2, 0x0)
     6e8:	9227      	ld.w      	r1, (r2, 0x1c)
     6ea:	32ff      	movi      	r2, 255
     6ec:	6848      	and      	r1, r2
     6ee:	3200      	movi      	r2, 0
     6f0:	2a0b      	subi      	r2, 12
     6f2:	60a0      	addu      	r2, r8
     6f4:	9240      	ld.w      	r2, (r2, 0x0)
     6f6:	4248      	lsli      	r2, r2, 8
     6f8:	6c48      	or      	r1, r2
     6fa:	1359      	lrw      	r2, 0xd22d0000	// 8dc <csi_syscon_clockmonitor_set_switch+0xac>
     6fc:	6c84      	or      	r2, r1
     6fe:	b347      	st.w      	r2, (r3, 0x1c)
	}

	/* Setup PCLK divider */
	H_SYSCON->PCLKCR = ((pclk_div<<8)|PCLKCR_KEY);
     700:	1374      	lrw      	r3, 0x0	// 8d0 <csi_syscon_clockmonitor_set_switch+0xa0>
     702:	9360      	ld.w      	r3, (r3, 0x0)
     704:	3200      	movi      	r2, 0
     706:	2a0f      	subi      	r2, 16
     708:	60a0      	addu      	r2, r8
     70a:	9240      	ld.w      	r2, (r2, 0x0)
     70c:	4228      	lsli      	r1, r2, 8
     70e:	135a      	lrw      	r2, 0xc33c0000	// 8f4 <csi_syscon_clockmonitor_set_switch+0xc4>
     710:	6c84      	or      	r2, r1
     712:	b348      	st.w      	r2, (r3, 0x20)

	/* Store config to global variables */
	sysclk_cfg._cur_sysclk = sysclk_setup; 
     714:	1374      	lrw      	r3, 0x0	// 8e4 <csi_syscon_clockmonitor_set_switch+0xb4>
     716:	3200      	movi      	r2, 0
     718:	2a1b      	subi      	r2, 28
     71a:	60a0      	addu      	r2, r8
     71c:	9240      	ld.w      	r2, (r2, 0x0)
     71e:	b340      	st.w      	r2, (r3, 0x0)
	sysclk_cfg._cur_hclk_freq = target_hclk_freq;
     720:	1371      	lrw      	r3, 0x0	// 8e4 <csi_syscon_clockmonitor_set_switch+0xb4>
     722:	3200      	movi      	r2, 0
     724:	2a07      	subi      	r2, 8
     726:	60a0      	addu      	r2, r8
     728:	9240      	ld.w      	r2, (r2, 0x0)
     72a:	b341      	st.w      	r2, (r3, 0x4)
	sysclk_cfg._cur_pclk_freq = target_pclk_freq;
     72c:	136e      	lrw      	r3, 0x0	// 8e4 <csi_syscon_clockmonitor_set_switch+0xb4>
     72e:	3200      	movi      	r2, 0
     730:	2a13      	subi      	r2, 20
     732:	60a0      	addu      	r2, r8
     734:	9240      	ld.w      	r2, (r2, 0x0)
     736:	b342      	st.w      	r2, (r3, 0x8)

	return 0;
     738:	3300      	movi      	r3, 0
}
     73a:	6c0f      	mov      	r0, r3
     73c:	6fa3      	mov      	r14, r8
     73e:	d9ee2002 	ld.w      	r15, (r14, 0x8)
     742:	d90e2001 	ld.w      	r8, (r14, 0x4)
     746:	9880      	ld.w      	r4, (r14, 0x0)
     748:	1403      	addi      	r14, r14, 12
     74a:	783c      	jmp      	r15

0000074c <csi_syscon_set_solo_pclk_switch>:
						 defined as: PCLK_ADC/PCLK_UART0 ...
  \param[in]   pclk1_sel individual pclk target on PCLK1
  \return      negtive when assignment is not in right pclk domain
*/
int32_t csi_syscon_set_solo_pclk_switch(syscon_endis_e status, uint64_t pclk_sel)
{
     74c:	1422      	subi      	r14, r14, 8
     74e:	b880      	st.w      	r4, (r14, 0x0)
     750:	dd0e2001 	st.w      	r8, (r14, 0x4)
     754:	6e3b      	mov      	r8, r14
     756:	1425      	subi      	r14, r14, 20
     758:	3300      	movi      	r3, 0
     75a:	2b0b      	subi      	r3, 12
     75c:	60e0      	addu      	r3, r8
     75e:	b300      	st.w      	r0, (r3, 0x0)
     760:	3300      	movi      	r3, 0
     762:	2b13      	subi      	r3, 20
     764:	60e0      	addu      	r3, r8
     766:	b320      	st.w      	r1, (r3, 0x0)
     768:	b341      	st.w      	r2, (r3, 0x4)
	pclk_conr_type pclk_setup;
	pclk_setup.PCLKCR = pclk_sel;
     76a:	3200      	movi      	r2, 0
     76c:	2a07      	subi      	r2, 8
     76e:	60a0      	addu      	r2, r8
     770:	3300      	movi      	r3, 0
     772:	2b13      	subi      	r3, 20
     774:	60e0      	addu      	r3, r8
     776:	9381      	ld.w      	r4, (r3, 0x4)
     778:	9360      	ld.w      	r3, (r3, 0x0)
     77a:	b260      	st.w      	r3, (r2, 0x0)
     77c:	b281      	st.w      	r4, (r2, 0x4)
	
	switch (status) {
     77e:	3300      	movi      	r3, 0
     780:	2b0b      	subi      	r3, 12
     782:	60e0      	addu      	r3, r8
     784:	9360      	ld.w      	r3, (r3, 0x0)
     786:	3b40      	cmpnei      	r3, 0
     788:	0810      	bt      	0x7a8	// 7a8 <csi_syscon_set_solo_pclk_switch+0x5c>
		case ENABLE:  /*enable*/
			H_SYSCON->PCER0 = pclk_setup.w.PCLKCR0;
     78a:	1272      	lrw      	r3, 0x0	// 8d0 <csi_syscon_clockmonitor_set_switch+0xa0>
     78c:	9360      	ld.w      	r3, (r3, 0x0)
     78e:	3200      	movi      	r2, 0
     790:	2a07      	subi      	r2, 8
     792:	60a0      	addu      	r2, r8
     794:	9240      	ld.w      	r2, (r2, 0x0)
     796:	b34a      	st.w      	r2, (r3, 0x28)
			H_SYSCON->PCER1 = pclk_setup.w.PCLKCR1;
     798:	126e      	lrw      	r3, 0x0	// 8d0 <csi_syscon_clockmonitor_set_switch+0xa0>
     79a:	9360      	ld.w      	r3, (r3, 0x0)
     79c:	3200      	movi      	r2, 0
     79e:	2a07      	subi      	r2, 8
     7a0:	60a0      	addu      	r2, r8
     7a2:	9241      	ld.w      	r2, (r2, 0x4)
     7a4:	b34d      	st.w      	r2, (r3, 0x34)
			break;    
     7a6:	0410      	br      	0x7c6	// 7c6 <csi_syscon_set_solo_pclk_switch+0x7a>
		default: /*disable*/
			H_SYSCON->PCDR0 = pclk_setup.w.PCLKCR0;
     7a8:	126a      	lrw      	r3, 0x0	// 8d0 <csi_syscon_clockmonitor_set_switch+0xa0>
     7aa:	9360      	ld.w      	r3, (r3, 0x0)
     7ac:	3200      	movi      	r2, 0
     7ae:	2a07      	subi      	r2, 8
     7b0:	60a0      	addu      	r2, r8
     7b2:	9240      	ld.w      	r2, (r2, 0x0)
     7b4:	b34b      	st.w      	r2, (r3, 0x2c)
			H_SYSCON->PCDR1 = pclk_setup.w.PCLKCR1;
     7b6:	1267      	lrw      	r3, 0x0	// 8d0 <csi_syscon_clockmonitor_set_switch+0xa0>
     7b8:	9360      	ld.w      	r3, (r3, 0x0)
     7ba:	3200      	movi      	r2, 0
     7bc:	2a07      	subi      	r2, 8
     7be:	60a0      	addu      	r2, r8
     7c0:	9241      	ld.w      	r2, (r2, 0x4)
     7c2:	b34e      	st.w      	r2, (r3, 0x38)
			break;
     7c4:	6c00      	or      	r0, r0
	}
	return 0;
     7c6:	3300      	movi      	r3, 0
}
     7c8:	6c0f      	mov      	r0, r3
     7ca:	6fa3      	mov      	r14, r8
     7cc:	d90e2001 	ld.w      	r8, (r14, 0x4)
     7d0:	9880      	ld.w      	r4, (r14, 0x0)
     7d2:	1402      	addi      	r14, r14, 8
     7d4:	783c      	jmp      	r15
	...

000007d8 <csi_syscon_set_all_pclk_switch>:
  \brief       Enable/disable pclk of all peripherals
  \param[in]   status   en/dis operation (enable is default)
  \return      negtive when assignment is not in right pclk domain
*/
void csi_syscon_set_all_pclk_switch(syscon_endis_e status)
{
     7d8:	1421      	subi      	r14, r14, 4
     7da:	dd0e2000 	st.w      	r8, (r14, 0x0)
     7de:	6e3b      	mov      	r8, r14
     7e0:	1421      	subi      	r14, r14, 4
     7e2:	3300      	movi      	r3, 0
     7e4:	2b03      	subi      	r3, 4
     7e6:	60e0      	addu      	r3, r8
     7e8:	b300      	st.w      	r0, (r3, 0x0)
	switch (status) {
     7ea:	3300      	movi      	r3, 0
     7ec:	2b03      	subi      	r3, 4
     7ee:	60e0      	addu      	r3, r8
     7f0:	9360      	ld.w      	r3, (r3, 0x0)
     7f2:	3b40      	cmpnei      	r3, 0
     7f4:	080c      	bt      	0x80c	// 80c <csi_syscon_set_all_pclk_switch+0x34>
		case ENABLE:  /*enable*/
			H_SYSCON->PCER0 = 0xffffffff;
     7f6:	1177      	lrw      	r3, 0x0	// 8d0 <csi_syscon_clockmonitor_set_switch+0xa0>
     7f8:	9340      	ld.w      	r2, (r3, 0x0)
     7fa:	3300      	movi      	r3, 0
     7fc:	2b00      	subi      	r3, 1
     7fe:	b26a      	st.w      	r3, (r2, 0x28)
			H_SYSCON->PCER1 = 0xffffffff;
     800:	1174      	lrw      	r3, 0x0	// 8d0 <csi_syscon_clockmonitor_set_switch+0xa0>
     802:	9340      	ld.w      	r2, (r3, 0x0)
     804:	3300      	movi      	r3, 0
     806:	2b00      	subi      	r3, 1
     808:	b26d      	st.w      	r3, (r2, 0x34)
			break;    
     80a:	040c      	br      	0x822	// 822 <csi_syscon_set_all_pclk_switch+0x4a>
		default: /*disable*/
			H_SYSCON->PCDR0 = 0xffffffff;
     80c:	1171      	lrw      	r3, 0x0	// 8d0 <csi_syscon_clockmonitor_set_switch+0xa0>
     80e:	9340      	ld.w      	r2, (r3, 0x0)
     810:	3300      	movi      	r3, 0
     812:	2b00      	subi      	r3, 1
     814:	b26b      	st.w      	r3, (r2, 0x2c)
			H_SYSCON->PCDR1 = 0xffffffff;
     816:	116f      	lrw      	r3, 0x0	// 8d0 <csi_syscon_clockmonitor_set_switch+0xa0>
     818:	9340      	ld.w      	r2, (r3, 0x0)
     81a:	3300      	movi      	r3, 0
     81c:	2b00      	subi      	r3, 1
     81e:	b26e      	st.w      	r3, (r2, 0x38)
			break;
     820:	6c00      	or      	r0, r0
	}
}
     822:	6c00      	or      	r0, r0
     824:	6fa3      	mov      	r14, r8
     826:	d90e2000 	ld.w      	r8, (r14, 0x0)
     82a:	1401      	addi      	r14, r14, 4
     82c:	783c      	jmp      	r15
	...

00000830 <csi_syscon_clockmonitor_set_switch>:
  \param[in]   status   en/dis operation
  \param[in]   rst_on_fail  generate reset when fail or not  (disable is default)
  \return      None
*/
int32_t csi_syscon_clockmonitor_set_switch(syscon_endis_e status, syscon_ckmrst_e rst_on_fail)
{
     830:	1421      	subi      	r14, r14, 4
     832:	dd0e2000 	st.w      	r8, (r14, 0x0)
     836:	6e3b      	mov      	r8, r14
     838:	1422      	subi      	r14, r14, 8
     83a:	3300      	movi      	r3, 0
     83c:	2b03      	subi      	r3, 4
     83e:	60e0      	addu      	r3, r8
     840:	b300      	st.w      	r0, (r3, 0x0)
     842:	3300      	movi      	r3, 0
     844:	2b07      	subi      	r3, 8
     846:	60e0      	addu      	r3, r8
     848:	b320      	st.w      	r1, (r3, 0x0)
	if (!((H_SYSCON->GCSR) & 1ul)) {
     84a:	1162      	lrw      	r3, 0x0	// 8d0 <csi_syscon_clockmonitor_set_switch+0xa0>
     84c:	9360      	ld.w      	r3, (r3, 0x0)
     84e:	9343      	ld.w      	r2, (r3, 0xc)
     850:	3301      	movi      	r3, 1
     852:	68c8      	and      	r3, r2
     854:	3b40      	cmpnei      	r3, 0
     856:	0803      	bt      	0x85c	// 85c <csi_syscon_clockmonitor_set_switch+0x2c>
		return ERR_SYSCON(DRV_ERROR_UNSUPPORTED);
     858:	1168      	lrw      	r3, 0x81160083	// 8f8 <csi_syscon_clockmonitor_set_switch+0xc8>
     85a:	0452      	br      	0x8fe	// 8fe <csi_syscon_clockmonitor_set_switch+0xce>
	}

	if ((status == ENABLE) && (rst_on_fail == CKM_RST_ON)) {
     85c:	3300      	movi      	r3, 0
     85e:	2b03      	subi      	r3, 4
     860:	60e0      	addu      	r3, r8
     862:	9360      	ld.w      	r3, (r3, 0x0)
     864:	3b40      	cmpnei      	r3, 0
     866:	080d      	bt      	0x880	// 880 <csi_syscon_clockmonitor_set_switch+0x50>
     868:	3300      	movi      	r3, 0
     86a:	2b07      	subi      	r3, 8
     86c:	60e0      	addu      	r3, r8
     86e:	9360      	ld.w      	r3, (r3, 0x0)
     870:	3b41      	cmpnei      	r3, 1
     872:	0807      	bt      	0x880	// 880 <csi_syscon_clockmonitor_set_switch+0x50>
		H_SYSCON->GCER = (1ul<<18) | (1ul<<19);
     874:	1077      	lrw      	r3, 0x0	// 8d0 <csi_syscon_clockmonitor_set_switch+0xa0>
     876:	9340      	ld.w      	r2, (r3, 0x0)
     878:	33c0      	movi      	r3, 192
     87a:	436c      	lsli      	r3, r3, 12
     87c:	b261      	st.w      	r3, (r2, 0x4)
     87e:	041d      	br      	0x8b8	// 8b8 <csi_syscon_clockmonitor_set_switch+0x88>
	}
	else if ((status == ENABLE) && (rst_on_fail == CKM_RST_OFF)) {
     880:	3300      	movi      	r3, 0
     882:	2b03      	subi      	r3, 4
     884:	60e0      	addu      	r3, r8
     886:	9360      	ld.w      	r3, (r3, 0x0)
     888:	3b40      	cmpnei      	r3, 0
     88a:	0812      	bt      	0x8ae	// 8ae <csi_syscon_clockmonitor_set_switch+0x7e>
     88c:	3300      	movi      	r3, 0
     88e:	2b07      	subi      	r3, 8
     890:	60e0      	addu      	r3, r8
     892:	9360      	ld.w      	r3, (r3, 0x0)
     894:	3b40      	cmpnei      	r3, 0
     896:	080c      	bt      	0x8ae	// 8ae <csi_syscon_clockmonitor_set_switch+0x7e>
		H_SYSCON->GCER = (1ul<<18) ;
     898:	106e      	lrw      	r3, 0x0	// 8d0 <csi_syscon_clockmonitor_set_switch+0xa0>
     89a:	9340      	ld.w      	r2, (r3, 0x0)
     89c:	3380      	movi      	r3, 128
     89e:	436b      	lsli      	r3, r3, 11
     8a0:	b261      	st.w      	r3, (r2, 0x4)
		H_SYSCON->GCDR = (1ul<<19) ;
     8a2:	106c      	lrw      	r3, 0x0	// 8d0 <csi_syscon_clockmonitor_set_switch+0xa0>
     8a4:	9340      	ld.w      	r2, (r3, 0x0)
     8a6:	3380      	movi      	r3, 128
     8a8:	436c      	lsli      	r3, r3, 12
     8aa:	b262      	st.w      	r3, (r2, 0x8)
     8ac:	0406      	br      	0x8b8	// 8b8 <csi_syscon_clockmonitor_set_switch+0x88>
	}
	else {
		H_SYSCON->GCDR = (1ul<<18) | (1ul<<19) ;
     8ae:	1069      	lrw      	r3, 0x0	// 8d0 <csi_syscon_clockmonitor_set_switch+0xa0>
     8b0:	9340      	ld.w      	r2, (r3, 0x0)
     8b2:	33c0      	movi      	r3, 192
     8b4:	436c      	lsli      	r3, r3, 12
     8b6:	b262      	st.w      	r3, (r2, 0x8)
	}

	if ((H_SYSCON->ERRINF) & (1ul<<11)) {
     8b8:	1066      	lrw      	r3, 0x0	// 8d0 <csi_syscon_clockmonitor_set_switch+0xa0>
     8ba:	9360      	ld.w      	r3, (r3, 0x0)
     8bc:	23eb      	addi      	r3, 236
     8be:	9340      	ld.w      	r2, (r3, 0x0)
     8c0:	3380      	movi      	r3, 128
     8c2:	4364      	lsli      	r3, r3, 4
     8c4:	68c8      	and      	r3, r2
     8c6:	3b40      	cmpnei      	r3, 0
     8c8:	0c1a      	bf      	0x8fc	// 8fc <csi_syscon_clockmonitor_set_switch+0xcc>
		return ERR_SYSCON(DRV_ERROR_SPECIFIC6);
     8ca:	1069      	lrw      	r3, 0x8116008b	// 8ec <csi_syscon_clockmonitor_set_switch+0xbc>
     8cc:	0419      	br      	0x8fe	// 8fe <csi_syscon_clockmonitor_set_switch+0xce>
     8ce:	0000      	bkpt
     8d0:	00000000 	.long	0x00000000
     8d4:	d22d0004 	.long	0xd22d0004
     8d8:	81160089 	.long	0x81160089
     8dc:	d22d0000 	.long	0xd22d0000
     8e0:	8116008a 	.long	0x8116008a
     8e4:	00000000 	.long	0x00000000
     8e8:	d22d0001 	.long	0xd22d0001
     8ec:	8116008b 	.long	0x8116008b
     8f0:	8116008c 	.long	0x8116008c
     8f4:	c33c0000 	.long	0xc33c0000
     8f8:	81160083 	.long	0x81160083
	}
	else {
		return 0;
     8fc:	3300      	movi      	r3, 0
	}
}
     8fe:	6c0f      	mov      	r0, r3
     900:	6fa3      	mov      	r14, r8
     902:	d90e2000 	ld.w      	r8, (r14, 0x0)
     906:	1401      	addi      	r14, r14, 4
     908:	783c      	jmp      	r15
	...

0000090c <csi_syscon_pclk_active_under_sleep>:
  \brief       Enable/disable pclk under sleep mode
  \param[in]   status   en/dis operation (enable is default)
  \return      None
*/
void csi_syscon_pclk_active_under_sleep(syscon_endis_e status)
{
     90c:	1421      	subi      	r14, r14, 4
     90e:	dd0e2000 	st.w      	r8, (r14, 0x0)
     912:	6e3b      	mov      	r8, r14
     914:	1421      	subi      	r14, r14, 4
     916:	3300      	movi      	r3, 0
     918:	2b03      	subi      	r3, 4
     91a:	60e0      	addu      	r3, r8
     91c:	b300      	st.w      	r0, (r3, 0x0)
	if (status == ENABLE) {
     91e:	3300      	movi      	r3, 0
     920:	2b03      	subi      	r3, 4
     922:	60e0      	addu      	r3, r8
     924:	9360      	ld.w      	r3, (r3, 0x0)
     926:	3b40      	cmpnei      	r3, 0
     928:	0808      	bt      	0x938	// 938 <csi_syscon_pclk_active_under_sleep+0x2c>
		H_SYSCON->GCER = (1ul<<8);
     92a:	ea83010e 	lrw      	r3, 0x0	// d60 <csi_syscon_exi_get_status+0x64>
     92e:	9340      	ld.w      	r2, (r3, 0x0)
     930:	3380      	movi      	r3, 128
     932:	4361      	lsli      	r3, r3, 1
     934:	b261      	st.w      	r3, (r2, 0x4)
	} 
	else {
		H_SYSCON->GCDR = (1ul<<8);
	}
}
     936:	0407      	br      	0x944	// 944 <csi_syscon_pclk_active_under_sleep+0x38>
		H_SYSCON->GCDR = (1ul<<8);
     938:	ea83010a 	lrw      	r3, 0x0	// d60 <csi_syscon_exi_get_status+0x64>
     93c:	9340      	ld.w      	r2, (r3, 0x0)
     93e:	3380      	movi      	r3, 128
     940:	4361      	lsli      	r3, r3, 1
     942:	b262      	st.w      	r3, (r2, 0x8)
}
     944:	6c00      	or      	r0, r0
     946:	6fa3      	mov      	r14, r8
     948:	d90e2000 	ld.w      	r8, (r14, 0x0)
     94c:	1401      	addi      	r14, r14, 4
     94e:	783c      	jmp      	r15

00000950 <csi_syscon_iwdt_set_switch>:
  \brief       Enable/disable iWDT
  \param[in]   status   en/dis operation(disable is default)
  \return      None
*/
void csi_syscon_iwdt_set_switch(syscon_endis_e status)
{
     950:	1421      	subi      	r14, r14, 4
     952:	dd0e2000 	st.w      	r8, (r14, 0x0)
     956:	6e3b      	mov      	r8, r14
     958:	1421      	subi      	r14, r14, 4
     95a:	3300      	movi      	r3, 0
     95c:	2b03      	subi      	r3, 4
     95e:	60e0      	addu      	r3, r8
     960:	b300      	st.w      	r0, (r3, 0x0)
	if (status == ENABLE) {
     962:	3300      	movi      	r3, 0
     964:	2b03      	subi      	r3, 4
     966:	60e0      	addu      	r3, r8
     968:	9360      	ld.w      	r3, (r3, 0x0)
     96a:	3b40      	cmpnei      	r3, 0
     96c:	0807      	bt      	0x97a	// 97a <csi_syscon_iwdt_set_switch+0x2a>
		H_SYSCON->IWDEDR = IWDEDR_KEY ;
     96e:	0062      	lrw      	r3, 0x0	// d60 <csi_syscon_exi_get_status+0x64>
     970:	9360      	ld.w      	r3, (r3, 0x0)
     972:	23bb      	addi      	r3, 188
     974:	0043      	lrw      	r2, 0x78870000	// d64 <csi_syscon_exi_get_status+0x68>
     976:	b340      	st.w      	r2, (r3, 0x0)
	} 
	else {
		H_SYSCON->IWDEDR = IWDEDR_KEY | 0x5555;
	}
}
     978:	0406      	br      	0x984	// 984 <csi_syscon_iwdt_set_switch+0x34>
		H_SYSCON->IWDEDR = IWDEDR_KEY | 0x5555;
     97a:	0065      	lrw      	r3, 0x0	// d60 <csi_syscon_exi_get_status+0x64>
     97c:	9360      	ld.w      	r3, (r3, 0x0)
     97e:	23bb      	addi      	r3, 188
     980:	0045      	lrw      	r2, 0x78875555	// d68 <csi_syscon_exi_get_status+0x6c>
     982:	b340      	st.w      	r2, (r3, 0x0)
}
     984:	6c00      	or      	r0, r0
     986:	6fa3      	mov      	r14, r8
     988:	d90e2000 	ld.w      	r8, (r14, 0x0)
     98c:	1401      	addi      	r14, r14, 4
     98e:	783c      	jmp      	r15

00000990 <csi_syscon_iwdt_reload>:
/**
  \brief       Reload iwdt
  \return      None
*/
void csi_syscon_iwdt_reload(void)
{
     990:	1421      	subi      	r14, r14, 4
     992:	dd0e2000 	st.w      	r8, (r14, 0x0)
     996:	6e3b      	mov      	r8, r14
     998:	1421      	subi      	r14, r14, 4
	volatile uint32_t i;
	H_SYSCON->IWDCNT = (0x5Aul<<24);
     99a:	006d      	lrw      	r3, 0x0	// d60 <csi_syscon_exi_get_status+0x64>
     99c:	9360      	ld.w      	r3, (r3, 0x0)
     99e:	23b7      	addi      	r3, 184
     9a0:	6c8f      	mov      	r2, r3
     9a2:	33b4      	movi      	r3, 180
     9a4:	4377      	lsli      	r3, r3, 23
     9a6:	b260      	st.w      	r3, (r2, 0x0)
	for (i=0;i<100;i++);
     9a8:	3300      	movi      	r3, 0
     9aa:	2b03      	subi      	r3, 4
     9ac:	60e0      	addu      	r3, r8
     9ae:	3200      	movi      	r2, 0
     9b0:	b340      	st.w      	r2, (r3, 0x0)
     9b2:	040a      	br      	0x9c6	// 9c6 <csi_syscon_iwdt_reload+0x36>
     9b4:	3300      	movi      	r3, 0
     9b6:	2b03      	subi      	r3, 4
     9b8:	60e0      	addu      	r3, r8
     9ba:	9360      	ld.w      	r3, (r3, 0x0)
     9bc:	5b42      	addi      	r2, r3, 1
     9be:	3300      	movi      	r3, 0
     9c0:	2b03      	subi      	r3, 4
     9c2:	60e0      	addu      	r3, r8
     9c4:	b340      	st.w      	r2, (r3, 0x0)
     9c6:	3300      	movi      	r3, 0
     9c8:	2b03      	subi      	r3, 4
     9ca:	60e0      	addu      	r3, r8
     9cc:	9340      	ld.w      	r2, (r3, 0x0)
     9ce:	3363      	movi      	r3, 99
     9d0:	648c      	cmphs      	r3, r2
     9d2:	0bf1      	bt      	0x9b4	// 9b4 <csi_syscon_iwdt_reload+0x24>
	while ((H_SYSCON->IWDCNT) & (1ul<<31));
     9d4:	6c00      	or      	r0, r0
     9d6:	007c      	lrw      	r3, 0x0	// d60 <csi_syscon_exi_get_status+0x64>
     9d8:	9360      	ld.w      	r3, (r3, 0x0)
     9da:	23b7      	addi      	r3, 184
     9dc:	9360      	ld.w      	r3, (r3, 0x0)
     9de:	3bdf      	btsti      	r3, 31
     9e0:	0bfb      	bt      	0x9d6	// 9d6 <csi_syscon_iwdt_reload+0x46>
}
     9e2:	6c00      	or      	r0, r0
     9e4:	6fa3      	mov      	r14, r8
     9e6:	d90e2000 	ld.w      	r8, (r14, 0x0)
     9ea:	1401      	addi      	r14, r14, 4
     9ec:	783c      	jmp      	r15
	...

000009f0 <csi_syscon_iwdt_config>:
  \param[in]   iwdt_ovt overflow time config
  \param[in]   iwdt_wnd alarm window time config
  \return      None
*/
void csi_syscon_iwdt_config(iwdt_ovt_e iwdt_ovt, iwdt_wnd_e iwdt_wnd)
{
     9f0:	1421      	subi      	r14, r14, 4
     9f2:	dd0e2000 	st.w      	r8, (r14, 0x0)
     9f6:	6e3b      	mov      	r8, r14
     9f8:	1422      	subi      	r14, r14, 8
     9fa:	3300      	movi      	r3, 0
     9fc:	2b03      	subi      	r3, 4
     9fe:	60e0      	addu      	r3, r8
     a00:	b300      	st.w      	r0, (r3, 0x0)
     a02:	3300      	movi      	r3, 0
     a04:	2b07      	subi      	r3, 8
     a06:	60e0      	addu      	r3, r8
     a08:	b320      	st.w      	r1, (r3, 0x0)
	H_SYSCON->IWDCR = (iwdt_ovt << 8) | (iwdt_wnd << 2) | IWDT_KEY;
     a0a:	0169      	lrw      	r3, 0x0	// d60 <csi_syscon_exi_get_status+0x64>
     a0c:	9320      	ld.w      	r1, (r3, 0x0)
     a0e:	3300      	movi      	r3, 0
     a10:	2b03      	subi      	r3, 4
     a12:	60e0      	addu      	r3, r8
     a14:	9360      	ld.w      	r3, (r3, 0x0)
     a16:	4348      	lsli      	r2, r3, 8
     a18:	3300      	movi      	r3, 0
     a1a:	2b07      	subi      	r3, 8
     a1c:	60e0      	addu      	r3, r8
     a1e:	9360      	ld.w      	r3, (r3, 0x0)
     a20:	4362      	lsli      	r3, r3, 2
     a22:	6c8c      	or      	r2, r3
     a24:	016d      	lrw      	r3, 0x87780000	// d6c <csi_syscon_exi_get_status+0x70>
     a26:	6c8c      	or      	r2, r3
     a28:	6cc7      	mov      	r3, r1
     a2a:	23b3      	addi      	r3, 180
     a2c:	b340      	st.w      	r2, (r3, 0x0)
}
     a2e:	6c00      	or      	r0, r0
     a30:	6fa3      	mov      	r14, r8
     a32:	d90e2000 	ld.w      	r8, (r14, 0x0)
     a36:	1401      	addi      	r14, r14, 4
     a38:	783c      	jmp      	r15
	...

00000a3c <csi_syscon_lvd_config>:
  \param[in]   lvd_intlvl interrupt level selection
  \param[in]   lvd_rstlvl reset level selection (LVD_RSTAT2P15 is default)
  \return      None
*/
void csi_syscon_lvd_config(lvd_intlvl_e lvd_intlvl, lvd_rstlvl_e lvd_rstlvl)
{
     a3c:	1421      	subi      	r14, r14, 4
     a3e:	dd0e2000 	st.w      	r8, (r14, 0x0)
     a42:	6e3b      	mov      	r8, r14
     a44:	1422      	subi      	r14, r14, 8
     a46:	3300      	movi      	r3, 0
     a48:	2b03      	subi      	r3, 4
     a4a:	60e0      	addu      	r3, r8
     a4c:	b300      	st.w      	r0, (r3, 0x0)
     a4e:	3300      	movi      	r3, 0
     a50:	2b07      	subi      	r3, 8
     a52:	60e0      	addu      	r3, r8
     a54:	b320      	st.w      	r1, (r3, 0x0)
	if (lvd_intlvl == LVD_INTDIS) {
     a56:	3300      	movi      	r3, 0
     a58:	2b03      	subi      	r3, 4
     a5a:	60e0      	addu      	r3, r8
     a5c:	9360      	ld.w      	r3, (r3, 0x0)
     a5e:	3b44      	cmpnei      	r3, 4
     a60:	0812      	bt      	0xa84	// a84 <csi_syscon_lvd_config+0x48>
		H_SYSCON->LVDCR = ((H_SYSCON->LVDCR) & 0xf) | (0<<11) | (lvd_rstlvl<<12) | LVDCR_KEY;
     a62:	017f      	lrw      	r3, 0x0	// d60 <csi_syscon_exi_get_status+0x64>
     a64:	9360      	ld.w      	r3, (r3, 0x0)
     a66:	0240      	lrw      	r2, 0x0	// d60 <csi_syscon_exi_get_status+0x64>
     a68:	9240      	ld.w      	r2, (r2, 0x0)
     a6a:	9233      	ld.w      	r1, (r2, 0x4c)
     a6c:	320f      	movi      	r2, 15
     a6e:	6848      	and      	r1, r2
     a70:	3200      	movi      	r2, 0
     a72:	2a07      	subi      	r2, 8
     a74:	60a0      	addu      	r2, r8
     a76:	9240      	ld.w      	r2, (r2, 0x0)
     a78:	424c      	lsli      	r2, r2, 12
     a7a:	6c48      	or      	r1, r2
     a7c:	0242      	lrw      	r2, 0xb44b0000	// d70 <csi_syscon_exi_get_status+0x74>
     a7e:	6c84      	or      	r2, r1
     a80:	b353      	st.w      	r2, (r3, 0x4c)
	}
	else {
		H_SYSCON->LVDCR = ((H_SYSCON->LVDCR) & 0xf) | (1ul<<11) | (lvd_intlvl<<8) | (lvd_rstlvl<<12) | LVDCR_KEY;
	}

}
     a82:	0417      	br      	0xab0	// ab0 <csi_syscon_lvd_config+0x74>
		H_SYSCON->LVDCR = ((H_SYSCON->LVDCR) & 0xf) | (1ul<<11) | (lvd_intlvl<<8) | (lvd_rstlvl<<12) | LVDCR_KEY;
     a84:	0268      	lrw      	r3, 0x0	// d60 <csi_syscon_exi_get_status+0x64>
     a86:	9360      	ld.w      	r3, (r3, 0x0)
     a88:	0249      	lrw      	r2, 0x0	// d60 <csi_syscon_exi_get_status+0x64>
     a8a:	9240      	ld.w      	r2, (r2, 0x0)
     a8c:	9233      	ld.w      	r1, (r2, 0x4c)
     a8e:	320f      	movi      	r2, 15
     a90:	6848      	and      	r1, r2
     a92:	3200      	movi      	r2, 0
     a94:	2a03      	subi      	r2, 4
     a96:	60a0      	addu      	r2, r8
     a98:	9240      	ld.w      	r2, (r2, 0x0)
     a9a:	4248      	lsli      	r2, r2, 8
     a9c:	6c48      	or      	r1, r2
     a9e:	3200      	movi      	r2, 0
     aa0:	2a07      	subi      	r2, 8
     aa2:	60a0      	addu      	r2, r8
     aa4:	9240      	ld.w      	r2, (r2, 0x0)
     aa6:	424c      	lsli      	r2, r2, 12
     aa8:	6c48      	or      	r1, r2
     aaa:	024c      	lrw      	r2, 0xb44b0800	// d74 <csi_syscon_exi_get_status+0x78>
     aac:	6c84      	or      	r2, r1
     aae:	b353      	st.w      	r2, (r3, 0x4c)
}
     ab0:	6c00      	or      	r0, r0
     ab2:	6fa3      	mov      	r14, r8
     ab4:	d90e2000 	ld.w      	r8, (r14, 0x0)
     ab8:	1401      	addi      	r14, r14, 4
     aba:	783c      	jmp      	r15

00000abc <csi_syscon_lvd_set_switch>:
  \brief       Enable/disable LVD
  \param[in]   status   en/dis operation(APT_DEF_ENABLE is default)
  \return      None
*/
void csi_syscon_lvd_set_switch(syscon_endis_e status)
{
     abc:	1421      	subi      	r14, r14, 4
     abe:	dd0e2000 	st.w      	r8, (r14, 0x0)
     ac2:	6e3b      	mov      	r8, r14
     ac4:	1421      	subi      	r14, r14, 4
     ac6:	3300      	movi      	r3, 0
     ac8:	2b03      	subi      	r3, 4
     aca:	60e0      	addu      	r3, r8
     acc:	b300      	st.w      	r0, (r3, 0x0)
	if (status == ENABLE) {
     ace:	3300      	movi      	r3, 0
     ad0:	2b03      	subi      	r3, 4
     ad2:	60e0      	addu      	r3, r8
     ad4:	9360      	ld.w      	r3, (r3, 0x0)
     ad6:	3b40      	cmpnei      	r3, 0
     ad8:	080d      	bt      	0xaf2	// af2 <csi_syscon_lvd_set_switch+0x36>
		H_SYSCON->LVDCR = LVDCR_KEY | ((H_SYSCON->LVDCR) & ~0xf) ;
     ada:	027d      	lrw      	r3, 0x0	// d60 <csi_syscon_exi_get_status+0x64>
     adc:	9340      	ld.w      	r2, (r3, 0x0)
     ade:	027e      	lrw      	r3, 0x0	// d60 <csi_syscon_exi_get_status+0x64>
     ae0:	9360      	ld.w      	r3, (r3, 0x0)
     ae2:	9333      	ld.w      	r1, (r3, 0x4c)
     ae4:	027a      	lrw      	r3, 0x4bb50000	// d78 <csi_syscon_exi_get_status+0x7c>
     ae6:	2b0f      	subi      	r3, 16
     ae8:	684c      	and      	r1, r3
     aea:	027d      	lrw      	r3, 0xb44b0000	// d70 <csi_syscon_exi_get_status+0x74>
     aec:	6cc4      	or      	r3, r1
     aee:	b273      	st.w      	r3, (r2, 0x4c)
	} 
	else {
		H_SYSCON->LVDCR = LVDCR_KEY | ((H_SYSCON->LVDCR) | 0xa);
	}
}
     af0:	0409      	br      	0xb02	// b02 <csi_syscon_lvd_set_switch+0x46>
		H_SYSCON->LVDCR = LVDCR_KEY | ((H_SYSCON->LVDCR) | 0xa);
     af2:	0363      	lrw      	r3, 0x0	// d60 <csi_syscon_exi_get_status+0x64>
     af4:	9360      	ld.w      	r3, (r3, 0x0)
     af6:	0344      	lrw      	r2, 0x0	// d60 <csi_syscon_exi_get_status+0x64>
     af8:	9240      	ld.w      	r2, (r2, 0x0)
     afa:	9233      	ld.w      	r1, (r2, 0x4c)
     afc:	025f      	lrw      	r2, 0xb44b000a	// d7c <csi_syscon_exi_get_status+0x80>
     afe:	6c84      	or      	r2, r1
     b00:	b353      	st.w      	r2, (r3, 0x4c)
}
     b02:	6c00      	or      	r0, r0
     b04:	6fa3      	mov      	r14, r8
     b06:	d90e2000 	ld.w      	r8, (r14, 0x0)
     b0a:	1401      	addi      	r14, r14, 4
     b0c:	783c      	jmp      	r15
	...

00000b10 <csi_syscon_lvd_get_status>:
/**
  \brief       Get LVD level
  \return      LVD current level
*/
bool csi_syscon_lvd_get_status(void)
{
     b10:	1421      	subi      	r14, r14, 4
     b12:	dd0e2000 	st.w      	r8, (r14, 0x0)
     b16:	6e3b      	mov      	r8, r14
     b18:	1421      	subi      	r14, r14, 4
	bool lvd_flag;
	if ((H_SYSCON->LVDCR) & (1ul<<15)) {
     b1a:	036d      	lrw      	r3, 0x0	// d60 <csi_syscon_exi_get_status+0x64>
     b1c:	9360      	ld.w      	r3, (r3, 0x0)
     b1e:	9353      	ld.w      	r2, (r3, 0x4c)
     b20:	3380      	movi      	r3, 128
     b22:	4368      	lsli      	r3, r3, 8
     b24:	68c8      	and      	r3, r2
     b26:	3b40      	cmpnei      	r3, 0
     b28:	0c07      	bf      	0xb36	// b36 <csi_syscon_lvd_get_status+0x26>
		lvd_flag = true;    // vdd < vth
     b2a:	3300      	movi      	r3, 0
     b2c:	2b00      	subi      	r3, 1
     b2e:	60e0      	addu      	r3, r8
     b30:	3201      	movi      	r2, 1
     b32:	a340      	st.b      	r2, (r3, 0x0)
     b34:	0406      	br      	0xb40	// b40 <csi_syscon_lvd_get_status+0x30>
	}
	else {
		lvd_flag = false;   // vdd > vth
     b36:	3300      	movi      	r3, 0
     b38:	2b00      	subi      	r3, 1
     b3a:	60e0      	addu      	r3, r8
     b3c:	3200      	movi      	r2, 0
     b3e:	a340      	st.b      	r2, (r3, 0x0)
	}
	
	return lvd_flag;
     b40:	3300      	movi      	r3, 0
     b42:	2b00      	subi      	r3, 1
     b44:	60e0      	addu      	r3, r8
     b46:	8360      	ld.b      	r3, (r3, 0x0)
     b48:	74cc      	zextb      	r3, r3
}
     b4a:	6c0f      	mov      	r0, r3
     b4c:	6fa3      	mov      	r14, r8
     b4e:	d90e2000 	ld.w      	r8, (r14, 0x0)
     b52:	1401      	addi      	r14, r14, 4
     b54:	783c      	jmp      	r15
	...

00000b58 <csi_syscon_exi_set_rising>:
  \param[in]   exi_sel:  exi event to be set
  \param[in]   status:   enable/disable control(APT_DEF_ENABLE is default)
  \return      current setup of falling edge config
*/
uint32_t csi_syscon_exi_set_rising(exi_event_e exi_sel, syscon_endis_e status)
{
     b58:	1421      	subi      	r14, r14, 4
     b5a:	dd0e2000 	st.w      	r8, (r14, 0x0)
     b5e:	6e3b      	mov      	r8, r14
     b60:	1422      	subi      	r14, r14, 8
     b62:	3300      	movi      	r3, 0
     b64:	2b03      	subi      	r3, 4
     b66:	60e0      	addu      	r3, r8
     b68:	b300      	st.w      	r0, (r3, 0x0)
     b6a:	3300      	movi      	r3, 0
     b6c:	2b07      	subi      	r3, 8
     b6e:	60e0      	addu      	r3, r8
     b70:	b320      	st.w      	r1, (r3, 0x0)
	if (status == ENABLE) { /* select as rising edge*/
     b72:	3300      	movi      	r3, 0
     b74:	2b07      	subi      	r3, 8
     b76:	60e0      	addu      	r3, r8
     b78:	9360      	ld.w      	r3, (r3, 0x0)
     b7a:	3b40      	cmpnei      	r3, 0
     b7c:	0813      	bt      	0xba2	// ba2 <csi_syscon_exi_set_rising+0x4a>
		H_SYSCON->EXIRT |= 1ul<<exi_sel;
     b7e:	1379      	lrw      	r3, 0x0	// d60 <csi_syscon_exi_get_status+0x64>
     b80:	9300      	ld.w      	r0, (r3, 0x0)
     b82:	1378      	lrw      	r3, 0x0	// d60 <csi_syscon_exi_get_status+0x64>
     b84:	9360      	ld.w      	r3, (r3, 0x0)
     b86:	2393      	addi      	r3, 148
     b88:	9340      	ld.w      	r2, (r3, 0x0)
     b8a:	3300      	movi      	r3, 0
     b8c:	2b03      	subi      	r3, 4
     b8e:	60e0      	addu      	r3, r8
     b90:	3101      	movi      	r1, 1
     b92:	9360      	ld.w      	r3, (r3, 0x0)
     b94:	704c      	lsl      	r1, r3
     b96:	6cc7      	mov      	r3, r1
     b98:	6c8c      	or      	r2, r3
     b9a:	6cc3      	mov      	r3, r0
     b9c:	2393      	addi      	r3, 148
     b9e:	b340      	st.w      	r2, (r3, 0x0)
     ba0:	0413      	br      	0xbc6	// bc6 <csi_syscon_exi_set_rising+0x6e>
	}
	else
	{
		H_SYSCON->EXIRT &= ~(1ul<<exi_sel);
     ba2:	1370      	lrw      	r3, 0x0	// d60 <csi_syscon_exi_get_status+0x64>
     ba4:	9300      	ld.w      	r0, (r3, 0x0)
     ba6:	136f      	lrw      	r3, 0x0	// d60 <csi_syscon_exi_get_status+0x64>
     ba8:	9360      	ld.w      	r3, (r3, 0x0)
     baa:	2393      	addi      	r3, 148
     bac:	9340      	ld.w      	r2, (r3, 0x0)
     bae:	3300      	movi      	r3, 0
     bb0:	2b03      	subi      	r3, 4
     bb2:	60e0      	addu      	r3, r8
     bb4:	3101      	movi      	r1, 1
     bb6:	9360      	ld.w      	r3, (r3, 0x0)
     bb8:	704c      	lsl      	r1, r3
     bba:	6cc7      	mov      	r3, r1
     bbc:	6cce      	nor      	r3, r3
     bbe:	688c      	and      	r2, r3
     bc0:	6cc3      	mov      	r3, r0
     bc2:	2393      	addi      	r3, 148
     bc4:	b340      	st.w      	r2, (r3, 0x0)
	}

	return H_SYSCON->EXIRT;
     bc6:	1367      	lrw      	r3, 0x0	// d60 <csi_syscon_exi_get_status+0x64>
     bc8:	9360      	ld.w      	r3, (r3, 0x0)
     bca:	2393      	addi      	r3, 148
     bcc:	9360      	ld.w      	r3, (r3, 0x0)
}
     bce:	6c0f      	mov      	r0, r3
     bd0:	6fa3      	mov      	r14, r8
     bd2:	d90e2000 	ld.w      	r8, (r14, 0x0)
     bd6:	1401      	addi      	r14, r14, 4
     bd8:	783c      	jmp      	r15
	...

00000bdc <csi_syscon_exi_set_falling>:
  \param[in]   exi_sel:  exi event to be set
  \param[in]   status:   enable/disable control(APT_DEF_ENABLE is default)
  \return      current setup of falling edge config
*/
uint32_t csi_syscon_exi_set_falling(exi_event_e exi_sel, syscon_endis_e status)
{
     bdc:	1421      	subi      	r14, r14, 4
     bde:	dd0e2000 	st.w      	r8, (r14, 0x0)
     be2:	6e3b      	mov      	r8, r14
     be4:	1422      	subi      	r14, r14, 8
     be6:	3300      	movi      	r3, 0
     be8:	2b03      	subi      	r3, 4
     bea:	60e0      	addu      	r3, r8
     bec:	b300      	st.w      	r0, (r3, 0x0)
     bee:	3300      	movi      	r3, 0
     bf0:	2b07      	subi      	r3, 8
     bf2:	60e0      	addu      	r3, r8
     bf4:	b320      	st.w      	r1, (r3, 0x0)
	if (status == ENABLE) { /* select as falling edge*/
     bf6:	3300      	movi      	r3, 0
     bf8:	2b07      	subi      	r3, 8
     bfa:	60e0      	addu      	r3, r8
     bfc:	9360      	ld.w      	r3, (r3, 0x0)
     bfe:	3b40      	cmpnei      	r3, 0
     c00:	0813      	bt      	0xc26	// c26 <csi_syscon_exi_set_falling+0x4a>
		H_SYSCON->EXIFT |= 1ul<<exi_sel;
     c02:	1278      	lrw      	r3, 0x0	// d60 <csi_syscon_exi_get_status+0x64>
     c04:	9300      	ld.w      	r0, (r3, 0x0)
     c06:	1277      	lrw      	r3, 0x0	// d60 <csi_syscon_exi_get_status+0x64>
     c08:	9360      	ld.w      	r3, (r3, 0x0)
     c0a:	2397      	addi      	r3, 152
     c0c:	9340      	ld.w      	r2, (r3, 0x0)
     c0e:	3300      	movi      	r3, 0
     c10:	2b03      	subi      	r3, 4
     c12:	60e0      	addu      	r3, r8
     c14:	3101      	movi      	r1, 1
     c16:	9360      	ld.w      	r3, (r3, 0x0)
     c18:	704c      	lsl      	r1, r3
     c1a:	6cc7      	mov      	r3, r1
     c1c:	6c8c      	or      	r2, r3
     c1e:	6cc3      	mov      	r3, r0
     c20:	2397      	addi      	r3, 152
     c22:	b340      	st.w      	r2, (r3, 0x0)
     c24:	0413      	br      	0xc4a	// c4a <csi_syscon_exi_set_falling+0x6e>
	}
	else
	{
		H_SYSCON->EXIFT &= ~(1ul<<exi_sel);
     c26:	126f      	lrw      	r3, 0x0	// d60 <csi_syscon_exi_get_status+0x64>
     c28:	9300      	ld.w      	r0, (r3, 0x0)
     c2a:	126e      	lrw      	r3, 0x0	// d60 <csi_syscon_exi_get_status+0x64>
     c2c:	9360      	ld.w      	r3, (r3, 0x0)
     c2e:	2397      	addi      	r3, 152
     c30:	9340      	ld.w      	r2, (r3, 0x0)
     c32:	3300      	movi      	r3, 0
     c34:	2b03      	subi      	r3, 4
     c36:	60e0      	addu      	r3, r8
     c38:	3101      	movi      	r1, 1
     c3a:	9360      	ld.w      	r3, (r3, 0x0)
     c3c:	704c      	lsl      	r1, r3
     c3e:	6cc7      	mov      	r3, r1
     c40:	6cce      	nor      	r3, r3
     c42:	688c      	and      	r2, r3
     c44:	6cc3      	mov      	r3, r0
     c46:	2397      	addi      	r3, 152
     c48:	b340      	st.w      	r2, (r3, 0x0)
	}

	return H_SYSCON->EXIFT;
     c4a:	1266      	lrw      	r3, 0x0	// d60 <csi_syscon_exi_get_status+0x64>
     c4c:	9360      	ld.w      	r3, (r3, 0x0)
     c4e:	2397      	addi      	r3, 152
     c50:	9360      	ld.w      	r3, (r3, 0x0)
}
     c52:	6c0f      	mov      	r0, r3
     c54:	6fa3      	mov      	r14, r8
     c56:	d90e2000 	ld.w      	r8, (r14, 0x0)
     c5a:	1401      	addi      	r14, r14, 4
     c5c:	783c      	jmp      	r15
	...

00000c60 <csi_syscon_exi_set_switch>:
  \param[in]   exi_sel:  exi event to be set
  \param[in]   status:   enable/disable control(APT_DEF_ENABLE is default)
  \return      current masking status
*/
uint32_t csi_syscon_exi_set_switch(exi_event_e exi_sel, syscon_endis_e status)
{
     c60:	1421      	subi      	r14, r14, 4
     c62:	dd0e2000 	st.w      	r8, (r14, 0x0)
     c66:	6e3b      	mov      	r8, r14
     c68:	1422      	subi      	r14, r14, 8
     c6a:	3300      	movi      	r3, 0
     c6c:	2b03      	subi      	r3, 4
     c6e:	60e0      	addu      	r3, r8
     c70:	b300      	st.w      	r0, (r3, 0x0)
     c72:	3300      	movi      	r3, 0
     c74:	2b07      	subi      	r3, 8
     c76:	60e0      	addu      	r3, r8
     c78:	b320      	st.w      	r1, (r3, 0x0)
	if (status == ENABLE) {
     c7a:	3300      	movi      	r3, 0
     c7c:	2b07      	subi      	r3, 8
     c7e:	60e0      	addu      	r3, r8
     c80:	9360      	ld.w      	r3, (r3, 0x0)
     c82:	3b40      	cmpnei      	r3, 0
     c84:	080d      	bt      	0xc9e	// c9e <csi_syscon_exi_set_switch+0x3e>
		H_SYSCON->EXIER = 1ul<<exi_sel;
     c86:	1177      	lrw      	r3, 0x0	// d60 <csi_syscon_exi_get_status+0x64>
     c88:	9320      	ld.w      	r1, (r3, 0x0)
     c8a:	3300      	movi      	r3, 0
     c8c:	2b03      	subi      	r3, 4
     c8e:	60e0      	addu      	r3, r8
     c90:	3201      	movi      	r2, 1
     c92:	9360      	ld.w      	r3, (r3, 0x0)
     c94:	708c      	lsl      	r2, r3
     c96:	6cc7      	mov      	r3, r1
     c98:	239b      	addi      	r3, 156
     c9a:	b340      	st.w      	r2, (r3, 0x0)
     c9c:	040c      	br      	0xcb4	// cb4 <csi_syscon_exi_set_switch+0x54>
	}
	else {
		H_SYSCON->EXIDR = 1ul<<exi_sel;
     c9e:	1171      	lrw      	r3, 0x0	// d60 <csi_syscon_exi_get_status+0x64>
     ca0:	9320      	ld.w      	r1, (r3, 0x0)
     ca2:	3300      	movi      	r3, 0
     ca4:	2b03      	subi      	r3, 4
     ca6:	60e0      	addu      	r3, r8
     ca8:	3201      	movi      	r2, 1
     caa:	9360      	ld.w      	r3, (r3, 0x0)
     cac:	708c      	lsl      	r2, r3
     cae:	6cc7      	mov      	r3, r1
     cb0:	239f      	addi      	r3, 160
     cb2:	b340      	st.w      	r2, (r3, 0x0)
	}

	return H_SYSCON->EXIMR;
     cb4:	116b      	lrw      	r3, 0x0	// d60 <csi_syscon_exi_get_status+0x64>
     cb6:	9360      	ld.w      	r3, (r3, 0x0)
     cb8:	23a3      	addi      	r3, 164
     cba:	9360      	ld.w      	r3, (r3, 0x0)
}
     cbc:	6c0f      	mov      	r0, r3
     cbe:	6fa3      	mov      	r14, r8
     cc0:	d90e2000 	ld.w      	r8, (r14, 0x0)
     cc4:	1401      	addi      	r14, r14, 4
     cc6:	783c      	jmp      	r15

00000cc8 <csi_syscon_clear_exi_pending>:
  \brief       Clear EXI pending 
  \param[in]   exi_sel: exi event to be clear
  \return      None
*/
void csi_syscon_clear_exi_pending(exi_event_e exi_sel)
{
     cc8:	1421      	subi      	r14, r14, 4
     cca:	dd0e2000 	st.w      	r8, (r14, 0x0)
     cce:	6e3b      	mov      	r8, r14
     cd0:	1421      	subi      	r14, r14, 4
     cd2:	3300      	movi      	r3, 0
     cd4:	2b03      	subi      	r3, 4
     cd6:	60e0      	addu      	r3, r8
     cd8:	b300      	st.w      	r0, (r3, 0x0)
	H_SYSCON->EXICR = 1ul<<exi_sel;
     cda:	1162      	lrw      	r3, 0x0	// d60 <csi_syscon_exi_get_status+0x64>
     cdc:	9320      	ld.w      	r1, (r3, 0x0)
     cde:	3300      	movi      	r3, 0
     ce0:	2b03      	subi      	r3, 4
     ce2:	60e0      	addu      	r3, r8
     ce4:	3201      	movi      	r2, 1
     ce6:	9360      	ld.w      	r3, (r3, 0x0)
     ce8:	708c      	lsl      	r2, r3
     cea:	6cc7      	mov      	r3, r1
     cec:	23ab      	addi      	r3, 172
     cee:	b340      	st.w      	r2, (r3, 0x0)
}
     cf0:	6c00      	or      	r0, r0
     cf2:	6fa3      	mov      	r14, r8
     cf4:	d90e2000 	ld.w      	r8, (r14, 0x0)
     cf8:	1401      	addi      	r14, r14, 4
     cfa:	783c      	jmp      	r15

00000cfc <csi_syscon_exi_get_status>:
  \param[in]   exi_sel:  exi pending to be read
  \param[in]   status:   raw(T)/masked(F) pending bit select(APT_DEF_DISABLE is default)
  \return      corresponding bit of pending according to int_sel
*/
uint32_t csi_syscon_exi_get_status(exi_event_e exi_sel, syscon_endis_e status)
{
     cfc:	1421      	subi      	r14, r14, 4
     cfe:	dd0e2000 	st.w      	r8, (r14, 0x0)
     d02:	6e3b      	mov      	r8, r14
     d04:	1422      	subi      	r14, r14, 8
     d06:	3300      	movi      	r3, 0
     d08:	2b03      	subi      	r3, 4
     d0a:	60e0      	addu      	r3, r8
     d0c:	b300      	st.w      	r0, (r3, 0x0)
     d0e:	3300      	movi      	r3, 0
     d10:	2b07      	subi      	r3, 8
     d12:	60e0      	addu      	r3, r8
     d14:	b320      	st.w      	r1, (r3, 0x0)
	if (status == ENABLE) {
     d16:	3300      	movi      	r3, 0
     d18:	2b07      	subi      	r3, 8
     d1a:	60e0      	addu      	r3, r8
     d1c:	9360      	ld.w      	r3, (r3, 0x0)
     d1e:	3b40      	cmpnei      	r3, 0
     d20:	080e      	bt      	0xd3c	// d3c <csi_syscon_exi_get_status+0x40>
		return ((H_SYSCON->EXIRS) & (1ul<<exi_sel));
     d22:	1070      	lrw      	r3, 0x0	// d60 <csi_syscon_exi_get_status+0x64>
     d24:	9360      	ld.w      	r3, (r3, 0x0)
     d26:	23af      	addi      	r3, 176
     d28:	9340      	ld.w      	r2, (r3, 0x0)
     d2a:	3300      	movi      	r3, 0
     d2c:	2b03      	subi      	r3, 4
     d2e:	60e0      	addu      	r3, r8
     d30:	3101      	movi      	r1, 1
     d32:	9360      	ld.w      	r3, (r3, 0x0)
     d34:	704c      	lsl      	r1, r3
     d36:	6cc7      	mov      	r3, r1
     d38:	68c8      	and      	r3, r2
     d3a:	040d      	br      	0xd54	// d54 <csi_syscon_exi_get_status+0x58>
	}
	else {
		return ((H_SYSCON->EXICR) & (1ul<<exi_sel));
     d3c:	1069      	lrw      	r3, 0x0	// d60 <csi_syscon_exi_get_status+0x64>
     d3e:	9360      	ld.w      	r3, (r3, 0x0)
     d40:	23ab      	addi      	r3, 172
     d42:	9340      	ld.w      	r2, (r3, 0x0)
     d44:	3300      	movi      	r3, 0
     d46:	2b03      	subi      	r3, 4
     d48:	60e0      	addu      	r3, r8
     d4a:	3101      	movi      	r1, 1
     d4c:	9360      	ld.w      	r3, (r3, 0x0)
     d4e:	704c      	lsl      	r1, r3
     d50:	6cc7      	mov      	r3, r1
     d52:	68c8      	and      	r3, r2
	}
}
     d54:	6c0f      	mov      	r0, r3
     d56:	6fa3      	mov      	r14, r8
     d58:	d90e2000 	ld.w      	r8, (r14, 0x0)
     d5c:	1401      	addi      	r14, r14, 4
     d5e:	783c      	jmp      	r15
     d60:	00000000 	.long	0x00000000
     d64:	78870000 	.long	0x78870000
     d68:	78875555 	.long	0x78875555
     d6c:	87780000 	.long	0x87780000
     d70:	b44b0000 	.long	0xb44b0000
     d74:	b44b0800 	.long	0xb44b0800
     d78:	4bb50000 	.long	0x4bb50000
     d7c:	b44b000a 	.long	0xb44b000a

00000d80 <csi_syscon_software_trigger_exi>:
  \brief       Software trigger EXI
  \param[in]   exi_sel  exi line to be triggered
  \return      None
*/
void csi_syscon_software_trigger_exi(exi_event_e exi_sel)
{
     d80:	1421      	subi      	r14, r14, 4
     d82:	dd0e2000 	st.w      	r8, (r14, 0x0)
     d86:	6e3b      	mov      	r8, r14
     d88:	1421      	subi      	r14, r14, 4
     d8a:	3300      	movi      	r3, 0
     d8c:	2b03      	subi      	r3, 4
     d8e:	60e0      	addu      	r3, r8
     d90:	b300      	st.w      	r0, (r3, 0x0)
	H_SYSCON->EXIAR = 1ul<<exi_sel;
     d92:	0076      	lrw      	r3, 0x0	// 1134 <csi_syscon_clo_config+0x3c>
     d94:	9320      	ld.w      	r1, (r3, 0x0)
     d96:	3300      	movi      	r3, 0
     d98:	2b03      	subi      	r3, 4
     d9a:	60e0      	addu      	r3, r8
     d9c:	3201      	movi      	r2, 1
     d9e:	9360      	ld.w      	r3, (r3, 0x0)
     da0:	708c      	lsl      	r2, r3
     da2:	6cc7      	mov      	r3, r1
     da4:	23a7      	addi      	r3, 168
     da6:	b340      	st.w      	r2, (r3, 0x0)
}
     da8:	6c00      	or      	r0, r0
     daa:	6fa3      	mov      	r14, r8
     dac:	d90e2000 	ld.w      	r8, (r14, 0x0)
     db0:	1401      	addi      	r14, r14, 4
     db2:	783c      	jmp      	r15

00000db4 <csi_syscon_reset_log_get_status>:
/**
  \brief       Reset source information
  \return      reset_src_t 
*/
reset_log_t csi_syscon_reset_log_get_status(void)
{
     db4:	1421      	subi      	r14, r14, 4
     db6:	dd0e2000 	st.w      	r8, (r14, 0x0)
     dba:	6e3b      	mov      	r8, r14
     dbc:	1421      	subi      	r14, r14, 4
	reset_log_t rstlog;
	rstlog.w = (H_SYSCON->RSR);
     dbe:	0161      	lrw      	r3, 0x0	// 1134 <csi_syscon_clo_config+0x3c>
     dc0:	9360      	ld.w      	r3, (r3, 0x0)
     dc2:	238f      	addi      	r3, 144
     dc4:	9340      	ld.w      	r2, (r3, 0x0)
     dc6:	3300      	movi      	r3, 0
     dc8:	2b03      	subi      	r3, 4
     dca:	60e0      	addu      	r3, r8
     dcc:	b340      	st.w      	r2, (r3, 0x0)
	return rstlog;
     dce:	3300      	movi      	r3, 0
     dd0:	2b03      	subi      	r3, 4
     dd2:	60e0      	addu      	r3, r8
     dd4:	9360      	ld.w      	r3, (r3, 0x0)
}
     dd6:	6c0f      	mov      	r0, r3
     dd8:	6fa3      	mov      	r14, r8
     dda:	d90e2000 	ld.w      	r8, (r14, 0x0)
     dde:	1401      	addi      	r14, r14, 4
     de0:	783c      	jmp      	r15
	...

00000de4 <csi_syscon_interrupt_set_switch>:
  \param[in]   int_sel:  interrupt to be en/dis
  \param[in]   status:   enable/disable
  \return      current masking status
*/
uint32_t csi_syscon_interrupt_set_switch(syscon_event_e int_sel, syscon_endis_e status)
{
     de4:	1421      	subi      	r14, r14, 4
     de6:	dd0e2000 	st.w      	r8, (r14, 0x0)
     dea:	6e3b      	mov      	r8, r14
     dec:	1422      	subi      	r14, r14, 8
     dee:	3300      	movi      	r3, 0
     df0:	2b03      	subi      	r3, 4
     df2:	60e0      	addu      	r3, r8
     df4:	b300      	st.w      	r0, (r3, 0x0)
     df6:	3300      	movi      	r3, 0
     df8:	2b07      	subi      	r3, 8
     dfa:	60e0      	addu      	r3, r8
     dfc:	b320      	st.w      	r1, (r3, 0x0)
	if (status == ENABLE) {
     dfe:	3300      	movi      	r3, 0
     e00:	2b07      	subi      	r3, 8
     e02:	60e0      	addu      	r3, r8
     e04:	9360      	ld.w      	r3, (r3, 0x0)
     e06:	3b40      	cmpnei      	r3, 0
     e08:	080c      	bt      	0xe20	// e20 <csi_syscon_interrupt_set_switch+0x3c>
		H_SYSCON->IECR = 1ul<<int_sel;
     e0a:	0174      	lrw      	r3, 0x0	// 1134 <csi_syscon_clo_config+0x3c>
     e0c:	9360      	ld.w      	r3, (r3, 0x0)
     e0e:	3200      	movi      	r2, 0
     e10:	2a03      	subi      	r2, 4
     e12:	60a0      	addu      	r2, r8
     e14:	3101      	movi      	r1, 1
     e16:	9240      	ld.w      	r2, (r2, 0x0)
     e18:	7048      	lsl      	r1, r2
     e1a:	6c87      	mov      	r2, r1
     e1c:	b35d      	st.w      	r2, (r3, 0x74)
     e1e:	040b      	br      	0xe34	// e34 <csi_syscon_interrupt_set_switch+0x50>
	}
	else {
		H_SYSCON->IDCR = 1ul<<int_sel;
     e20:	017a      	lrw      	r3, 0x0	// 1134 <csi_syscon_clo_config+0x3c>
     e22:	9360      	ld.w      	r3, (r3, 0x0)
     e24:	3200      	movi      	r2, 0
     e26:	2a03      	subi      	r2, 4
     e28:	60a0      	addu      	r2, r8
     e2a:	3101      	movi      	r1, 1
     e2c:	9240      	ld.w      	r2, (r2, 0x0)
     e2e:	7048      	lsl      	r1, r2
     e30:	6c87      	mov      	r2, r1
     e32:	b35e      	st.w      	r2, (r3, 0x78)
	}

	return H_SYSCON->IMSR;
     e34:	017f      	lrw      	r3, 0x0	// 1134 <csi_syscon_clo_config+0x3c>
     e36:	9360      	ld.w      	r3, (r3, 0x0)
     e38:	937f      	ld.w      	r3, (r3, 0x7c)
}
     e3a:	6c0f      	mov      	r0, r3
     e3c:	6fa3      	mov      	r14, r8
     e3e:	d90e2000 	ld.w      	r8, (r14, 0x0)
     e42:	1401      	addi      	r14, r14, 4
     e44:	783c      	jmp      	r15
	...

00000e48 <csi_syscon_interrupt_clear_pending>:
  \brief       Clear pending bit
  \param[in]   int_sel:  interrupt to be clear
  \return      None
*/
void csi_syscon_interrupt_clear_pending(syscon_event_e int_sel)
{
     e48:	1421      	subi      	r14, r14, 4
     e4a:	dd0e2000 	st.w      	r8, (r14, 0x0)
     e4e:	6e3b      	mov      	r8, r14
     e50:	1421      	subi      	r14, r14, 4
     e52:	3300      	movi      	r3, 0
     e54:	2b03      	subi      	r3, 4
     e56:	60e0      	addu      	r3, r8
     e58:	b300      	st.w      	r0, (r3, 0x0)
	H_SYSCON->ICR = 1ul<<int_sel;
     e5a:	0268      	lrw      	r3, 0x0	// 1134 <csi_syscon_clo_config+0x3c>
     e5c:	9320      	ld.w      	r1, (r3, 0x0)
     e5e:	3300      	movi      	r3, 0
     e60:	2b03      	subi      	r3, 4
     e62:	60e0      	addu      	r3, r8
     e64:	3201      	movi      	r2, 1
     e66:	9360      	ld.w      	r3, (r3, 0x0)
     e68:	708c      	lsl      	r2, r3
     e6a:	6cc7      	mov      	r3, r1
     e6c:	2383      	addi      	r3, 132
     e6e:	b340      	st.w      	r2, (r3, 0x0)
}
     e70:	6c00      	or      	r0, r0
     e72:	6fa3      	mov      	r14, r8
     e74:	d90e2000 	ld.w      	r8, (r14, 0x0)
     e78:	1401      	addi      	r14, r14, 4
     e7a:	783c      	jmp      	r15

00000e7c <csi_syscon_interrupt_get_status>:
  \param[in]   int_sel:  interrupt pending to be read
  \param[in]   status:   raw(T)/masked(F) pending bit select
  \return      corresponding bit of pending according to int_sel
*/
uint32_t csi_syscon_interrupt_get_status(syscon_event_e int_sel, syscon_endis_e status)
{
     e7c:	1421      	subi      	r14, r14, 4
     e7e:	dd0e2000 	st.w      	r8, (r14, 0x0)
     e82:	6e3b      	mov      	r8, r14
     e84:	1422      	subi      	r14, r14, 8
     e86:	3300      	movi      	r3, 0
     e88:	2b03      	subi      	r3, 4
     e8a:	60e0      	addu      	r3, r8
     e8c:	b300      	st.w      	r0, (r3, 0x0)
     e8e:	3300      	movi      	r3, 0
     e90:	2b07      	subi      	r3, 8
     e92:	60e0      	addu      	r3, r8
     e94:	b320      	st.w      	r1, (r3, 0x0)
	if (status == ENABLE) {
     e96:	3300      	movi      	r3, 0
     e98:	2b07      	subi      	r3, 8
     e9a:	60e0      	addu      	r3, r8
     e9c:	9360      	ld.w      	r3, (r3, 0x0)
     e9e:	3b40      	cmpnei      	r3, 0
     ea0:	080e      	bt      	0xebc	// ebc <csi_syscon_interrupt_get_status+0x40>
		return ((H_SYSCON->RISR) & (1ul<<int_sel));
     ea2:	027a      	lrw      	r3, 0x0	// 1134 <csi_syscon_clo_config+0x3c>
     ea4:	9360      	ld.w      	r3, (r3, 0x0)
     ea6:	2387      	addi      	r3, 136
     ea8:	9340      	ld.w      	r2, (r3, 0x0)
     eaa:	3300      	movi      	r3, 0
     eac:	2b03      	subi      	r3, 4
     eae:	60e0      	addu      	r3, r8
     eb0:	3101      	movi      	r1, 1
     eb2:	9360      	ld.w      	r3, (r3, 0x0)
     eb4:	704c      	lsl      	r1, r3
     eb6:	6cc7      	mov      	r3, r1
     eb8:	68c8      	and      	r3, r2
     eba:	040d      	br      	0xed4	// ed4 <csi_syscon_interrupt_get_status+0x58>
	}
	else {
		return ((H_SYSCON->ISR) & (1ul<<int_sel));
     ebc:	0361      	lrw      	r3, 0x0	// 1134 <csi_syscon_clo_config+0x3c>
     ebe:	9360      	ld.w      	r3, (r3, 0x0)
     ec0:	238b      	addi      	r3, 140
     ec2:	9340      	ld.w      	r2, (r3, 0x0)
     ec4:	3300      	movi      	r3, 0
     ec6:	2b03      	subi      	r3, 4
     ec8:	60e0      	addu      	r3, r8
     eca:	3101      	movi      	r1, 1
     ecc:	9360      	ld.w      	r3, (r3, 0x0)
     ece:	704c      	lsl      	r1, r3
     ed0:	6cc7      	mov      	r3, r1
     ed2:	68c8      	and      	r3, r2
	}
}
     ed4:	6c0f      	mov      	r0, r3
     ed6:	6fa3      	mov      	r14, r8
     ed8:	d90e2000 	ld.w      	r8, (r14, 0x0)
     edc:	1401      	addi      	r14, r14, 4
     ede:	783c      	jmp      	r15

00000ee0 <csi_syscon_get_prj_infor>:
  \brief       Get CINF, FINF information
  \param[in]   info_sel information to be load
  \return      result stored in flash
*/
uint32_t csi_syscon_get_prj_infor(prj_infor_e info_sel)
{
     ee0:	1421      	subi      	r14, r14, 4
     ee2:	dd0e2000 	st.w      	r8, (r14, 0x0)
     ee6:	6e3b      	mov      	r8, r14
     ee8:	1421      	subi      	r14, r14, 4
     eea:	3300      	movi      	r3, 0
     eec:	2b03      	subi      	r3, 4
     eee:	60e0      	addu      	r3, r8
     ef0:	b300      	st.w      	r0, (r3, 0x0)
	switch(info_sel)
     ef2:	3300      	movi      	r3, 0
     ef4:	2b03      	subi      	r3, 4
     ef6:	60e0      	addu      	r3, r8
     ef8:	9360      	ld.w      	r3, (r3, 0x0)
     efa:	3b41      	cmpnei      	r3, 1
     efc:	0c0d      	bf      	0xf16	// f16 <csi_syscon_get_prj_infor+0x36>
     efe:	3b00      	cmphsi      	r3, 1
     f00:	0c06      	bf      	0xf0c	// f0c <csi_syscon_get_prj_infor+0x2c>
     f02:	3b42      	cmpnei      	r3, 2
     f04:	0c0e      	bf      	0xf20	// f20 <csi_syscon_get_prj_infor+0x40>
     f06:	3b43      	cmpnei      	r3, 3
     f08:	0c11      	bf      	0xf2a	// f2a <csi_syscon_get_prj_infor+0x4a>
     f0a:	0415      	br      	0xf34	// f34 <csi_syscon_get_prj_infor+0x54>
	{
		case CINF0:
			return H_SYSCON->CINF0;
     f0c:	0375      	lrw      	r3, 0x0	// 1134 <csi_syscon_clo_config+0x3c>
     f0e:	9360      	ld.w      	r3, (r3, 0x0)
     f10:	23bf      	addi      	r3, 192
     f12:	9360      	ld.w      	r3, (r3, 0x0)
     f14:	0411      	br      	0xf36	// f36 <csi_syscon_get_prj_infor+0x56>
			break;
		case CINF1:
			return H_SYSCON->CINF1;
     f16:	0377      	lrw      	r3, 0x0	// 1134 <csi_syscon_clo_config+0x3c>
     f18:	9360      	ld.w      	r3, (r3, 0x0)
     f1a:	23c3      	addi      	r3, 196
     f1c:	9360      	ld.w      	r3, (r3, 0x0)
     f1e:	040c      	br      	0xf36	// f36 <csi_syscon_get_prj_infor+0x56>
			break;
		case FINF0:
			return H_SYSCON->FINF0;
     f20:	037a      	lrw      	r3, 0x0	// 1134 <csi_syscon_clo_config+0x3c>
     f22:	9360      	ld.w      	r3, (r3, 0x0)
     f24:	23c7      	addi      	r3, 200
     f26:	9360      	ld.w      	r3, (r3, 0x0)
     f28:	0407      	br      	0xf36	// f36 <csi_syscon_get_prj_infor+0x56>
			break;
		case FINF1:
			return H_SYSCON->FINF1;
     f2a:	037c      	lrw      	r3, 0x0	// 1134 <csi_syscon_clo_config+0x3c>
     f2c:	9360      	ld.w      	r3, (r3, 0x0)
     f2e:	23cb      	addi      	r3, 204
     f30:	9360      	ld.w      	r3, (r3, 0x0)
     f32:	0402      	br      	0xf36	// f36 <csi_syscon_get_prj_infor+0x56>
			break;
	}
	
	return 0;
     f34:	3300      	movi      	r3, 0
}
     f36:	6c0f      	mov      	r0, r3
     f38:	6fa3      	mov      	r14, r8
     f3a:	d90e2000 	ld.w      	r8, (r14, 0x0)
     f3e:	1401      	addi      	r14, r14, 4
     f40:	783c      	jmp      	r15
	...

00000f44 <csi_syscon_get_opt0_infor>:
  \brief       Get user defined/protection status
  \param[in]   info_sel information to be load
  \return      result of check
*/
prot_ret_e csi_syscon_get_opt0_infor(prot_infor_e info_sel)
{
     f44:	1421      	subi      	r14, r14, 4
     f46:	dd0e2000 	st.w      	r8, (r14, 0x0)
     f4a:	6e3b      	mov      	r8, r14
     f4c:	1422      	subi      	r14, r14, 8
     f4e:	3300      	movi      	r3, 0
     f50:	2b07      	subi      	r3, 8
     f52:	60e0      	addu      	r3, r8
     f54:	b300      	st.w      	r0, (r3, 0x0)
	prot_ret_e result;
	switch(info_sel)
     f56:	3300      	movi      	r3, 0
     f58:	2b07      	subi      	r3, 8
     f5a:	60e0      	addu      	r3, r8
     f5c:	9340      	ld.w      	r2, (r3, 0x0)
     f5e:	3a04      	cmphsi      	r2, 5
     f60:	0893      	bt      	0x1086	// 1086 <csi_syscon_get_opt0_infor+0x142>
     f62:	9360      	ld.w      	r3, (r3, 0x0)
     f64:	4362      	lsli      	r3, r3, 2
     f66:	1355      	lrw      	r2, 0x0	// 1138 <csi_syscon_clo_config+0x40>
     f68:	60c8      	addu      	r3, r2
     f6a:	9360      	ld.w      	r3, (r3, 0x0)
     f6c:	780c      	jmp      	r3
	{
		case WDT:
			if ((H_SYSCON->OPT0) & (1ul)) {
     f6e:	1372      	lrw      	r3, 0x0	// 1134 <csi_syscon_clo_config+0x3c>
     f70:	9360      	ld.w      	r3, (r3, 0x0)
     f72:	935a      	ld.w      	r2, (r3, 0x68)
     f74:	3301      	movi      	r3, 1
     f76:	68c8      	and      	r3, r2
     f78:	3b40      	cmpnei      	r3, 0
     f7a:	0c07      	bf      	0xf88	// f88 <csi_syscon_get_opt0_infor+0x44>
				result = WDT_ON;
     f7c:	3300      	movi      	r3, 0
     f7e:	2b03      	subi      	r3, 4
     f80:	60e0      	addu      	r3, r8
     f82:	3200      	movi      	r2, 0
     f84:	b340      	st.w      	r2, (r3, 0x0)
			}
			else {
				result = WDT_OFF;
			}
			break;
     f86:	0480      	br      	0x1086	// 1086 <csi_syscon_get_opt0_infor+0x142>
				result = WDT_OFF;
     f88:	3300      	movi      	r3, 0
     f8a:	2b03      	subi      	r3, 4
     f8c:	60e0      	addu      	r3, r8
     f8e:	3201      	movi      	r2, 1
     f90:	b340      	st.w      	r2, (r3, 0x0)
			break;
     f92:	047a      	br      	0x1086	// 1086 <csi_syscon_get_opt0_infor+0x142>
		case ERST:
			if ((H_SYSCON->OPT0) & (1ul<<1)) {
     f94:	1368      	lrw      	r3, 0x0	// 1134 <csi_syscon_clo_config+0x3c>
     f96:	9360      	ld.w      	r3, (r3, 0x0)
     f98:	935a      	ld.w      	r2, (r3, 0x68)
     f9a:	3302      	movi      	r3, 2
     f9c:	68c8      	and      	r3, r2
     f9e:	3b40      	cmpnei      	r3, 0
     fa0:	0c07      	bf      	0xfae	// fae <csi_syscon_get_opt0_infor+0x6a>
				result = ERST_ON;
     fa2:	3300      	movi      	r3, 0
     fa4:	2b03      	subi      	r3, 4
     fa6:	60e0      	addu      	r3, r8
     fa8:	3202      	movi      	r2, 2
     faa:	b340      	st.w      	r2, (r3, 0x0)
			}
			else {
				result = ERST_OFF;
			}
			break;
     fac:	046d      	br      	0x1086	// 1086 <csi_syscon_get_opt0_infor+0x142>
				result = ERST_OFF;
     fae:	3300      	movi      	r3, 0
     fb0:	2b03      	subi      	r3, 4
     fb2:	60e0      	addu      	r3, r8
     fb4:	3203      	movi      	r2, 3
     fb6:	b340      	st.w      	r2, (r3, 0x0)
			break;
     fb8:	0467      	br      	0x1086	// 1086 <csi_syscon_get_opt0_infor+0x142>
		case RDP:
			if ((H_SYSCON->OPT0) & (1ul<<27)) {
     fba:	127f      	lrw      	r3, 0x0	// 1134 <csi_syscon_clo_config+0x3c>
     fbc:	9360      	ld.w      	r3, (r3, 0x0)
     fbe:	935a      	ld.w      	r2, (r3, 0x68)
     fc0:	3380      	movi      	r3, 128
     fc2:	4374      	lsli      	r3, r3, 20
     fc4:	68c8      	and      	r3, r2
     fc6:	3b40      	cmpnei      	r3, 0
     fc8:	0c07      	bf      	0xfd6	// fd6 <csi_syscon_get_opt0_infor+0x92>
				result = RDP_ON;
     fca:	3300      	movi      	r3, 0
     fcc:	2b03      	subi      	r3, 4
     fce:	60e0      	addu      	r3, r8
     fd0:	3204      	movi      	r2, 4
     fd2:	b340      	st.w      	r2, (r3, 0x0)
			}
			else {
				result = RDP_OFF;
			}
			break;
     fd4:	0459      	br      	0x1086	// 1086 <csi_syscon_get_opt0_infor+0x142>
				result = RDP_OFF;
     fd6:	3300      	movi      	r3, 0
     fd8:	2b03      	subi      	r3, 4
     fda:	60e0      	addu      	r3, r8
     fdc:	3205      	movi      	r2, 5
     fde:	b340      	st.w      	r2, (r3, 0x0)
			break;
     fe0:	0453      	br      	0x1086	// 1086 <csi_syscon_get_opt0_infor+0x142>
		case DBP:
			if ((H_SYSCON->OPT0) & (1ul<<8)) {
     fe2:	1275      	lrw      	r3, 0x0	// 1134 <csi_syscon_clo_config+0x3c>
     fe4:	9360      	ld.w      	r3, (r3, 0x0)
     fe6:	935a      	ld.w      	r2, (r3, 0x68)
     fe8:	3380      	movi      	r3, 128
     fea:	4361      	lsli      	r3, r3, 1
     fec:	68c8      	and      	r3, r2
     fee:	3b40      	cmpnei      	r3, 0
     ff0:	0c07      	bf      	0xffe	// ffe <csi_syscon_get_opt0_infor+0xba>
				result = DBP_ON;
     ff2:	3300      	movi      	r3, 0
     ff4:	2b03      	subi      	r3, 4
     ff6:	60e0      	addu      	r3, r8
     ff8:	3206      	movi      	r2, 6
     ffa:	b340      	st.w      	r2, (r3, 0x0)
			}
			else {
				result = DBP_OFF;
			}
			break;
     ffc:	0445      	br      	0x1086	// 1086 <csi_syscon_get_opt0_infor+0x142>
				result = DBP_OFF;
     ffe:	3300      	movi      	r3, 0
    1000:	2b03      	subi      	r3, 4
    1002:	60e0      	addu      	r3, r8
    1004:	3207      	movi      	r2, 7
    1006:	b340      	st.w      	r2, (r3, 0x0)
			break;
    1008:	043f      	br      	0x1086	// 1086 <csi_syscon_get_opt0_infor+0x142>
		case HDP:
			if ((H_SYSCON->OPT0) & (1ul<<16)) {
    100a:	126b      	lrw      	r3, 0x0	// 1134 <csi_syscon_clo_config+0x3c>
    100c:	9360      	ld.w      	r3, (r3, 0x0)
    100e:	935a      	ld.w      	r2, (r3, 0x68)
    1010:	3380      	movi      	r3, 128
    1012:	4369      	lsli      	r3, r3, 9
    1014:	68c8      	and      	r3, r2
    1016:	3b40      	cmpnei      	r3, 0
    1018:	0c07      	bf      	0x1026	// 1026 <csi_syscon_get_opt0_infor+0xe2>
				result = HDP_ALL;
    101a:	3300      	movi      	r3, 0
    101c:	2b03      	subi      	r3, 4
    101e:	60e0      	addu      	r3, r8
    1020:	3208      	movi      	r2, 8
    1022:	b340      	st.w      	r2, (r3, 0x0)
				result = HDP_4K;
			}
			else {
				result = HDP_OFF;
			}
			break;
    1024:	0430      	br      	0x1084	// 1084 <csi_syscon_get_opt0_infor+0x140>
			else if ((H_SYSCON->OPT0) & (1ul<<17)) {
    1026:	1264      	lrw      	r3, 0x0	// 1134 <csi_syscon_clo_config+0x3c>
    1028:	9360      	ld.w      	r3, (r3, 0x0)
    102a:	935a      	ld.w      	r2, (r3, 0x68)
    102c:	3380      	movi      	r3, 128
    102e:	436a      	lsli      	r3, r3, 10
    1030:	68c8      	and      	r3, r2
    1032:	3b40      	cmpnei      	r3, 0
    1034:	0c07      	bf      	0x1042	// 1042 <csi_syscon_get_opt0_infor+0xfe>
				result = HDP_1K;
    1036:	3300      	movi      	r3, 0
    1038:	2b03      	subi      	r3, 4
    103a:	60e0      	addu      	r3, r8
    103c:	3209      	movi      	r2, 9
    103e:	b340      	st.w      	r2, (r3, 0x0)
			break;
    1040:	0422      	br      	0x1084	// 1084 <csi_syscon_get_opt0_infor+0x140>
			else if ((H_SYSCON->OPT0) & (1ul<<18)) {
    1042:	117d      	lrw      	r3, 0x0	// 1134 <csi_syscon_clo_config+0x3c>
    1044:	9360      	ld.w      	r3, (r3, 0x0)
    1046:	935a      	ld.w      	r2, (r3, 0x68)
    1048:	3380      	movi      	r3, 128
    104a:	436b      	lsli      	r3, r3, 11
    104c:	68c8      	and      	r3, r2
    104e:	3b40      	cmpnei      	r3, 0
    1050:	0c07      	bf      	0x105e	// 105e <csi_syscon_get_opt0_infor+0x11a>
				result = HDP_2K;
    1052:	3300      	movi      	r3, 0
    1054:	2b03      	subi      	r3, 4
    1056:	60e0      	addu      	r3, r8
    1058:	320a      	movi      	r2, 10
    105a:	b340      	st.w      	r2, (r3, 0x0)
			break;
    105c:	0414      	br      	0x1084	// 1084 <csi_syscon_get_opt0_infor+0x140>
			else if ((H_SYSCON->OPT0) & (1ul<<19)) {
    105e:	1176      	lrw      	r3, 0x0	// 1134 <csi_syscon_clo_config+0x3c>
    1060:	9360      	ld.w      	r3, (r3, 0x0)
    1062:	935a      	ld.w      	r2, (r3, 0x68)
    1064:	3380      	movi      	r3, 128
    1066:	436c      	lsli      	r3, r3, 12
    1068:	68c8      	and      	r3, r2
    106a:	3b40      	cmpnei      	r3, 0
    106c:	0c07      	bf      	0x107a	// 107a <csi_syscon_get_opt0_infor+0x136>
				result = HDP_4K;
    106e:	3300      	movi      	r3, 0
    1070:	2b03      	subi      	r3, 4
    1072:	60e0      	addu      	r3, r8
    1074:	320b      	movi      	r2, 11
    1076:	b340      	st.w      	r2, (r3, 0x0)
			break;
    1078:	0406      	br      	0x1084	// 1084 <csi_syscon_get_opt0_infor+0x140>
				result = HDP_OFF;
    107a:	3300      	movi      	r3, 0
    107c:	2b03      	subi      	r3, 4
    107e:	60e0      	addu      	r3, r8
    1080:	320c      	movi      	r2, 12
    1082:	b340      	st.w      	r2, (r3, 0x0)
			break;
    1084:	6c00      	or      	r0, r0
	}
	
	return result;
    1086:	3300      	movi      	r3, 0
    1088:	2b03      	subi      	r3, 4
    108a:	60e0      	addu      	r3, r8
    108c:	9360      	ld.w      	r3, (r3, 0x0)
}
    108e:	6c0f      	mov      	r0, r3
    1090:	6fa3      	mov      	r14, r8
    1092:	d90e2000 	ld.w      	r8, (r14, 0x0)
    1096:	1401      	addi      	r14, r14, 4
    1098:	783c      	jmp      	r15
	...

0000109c <csi_syscon_hfosc_set_switch>:
  \brief       Set hfosc (96MHz) enable/disable
  \param[in]   status: enable/disable status
  \return      None
*/
void csi_syscon_hfosc_set_switch(syscon_endis_e status)
{
    109c:	1421      	subi      	r14, r14, 4
    109e:	dd0e2000 	st.w      	r8, (r14, 0x0)
    10a2:	6e3b      	mov      	r8, r14
    10a4:	1421      	subi      	r14, r14, 4
    10a6:	3300      	movi      	r3, 0
    10a8:	2b03      	subi      	r3, 4
    10aa:	60e0      	addu      	r3, r8
    10ac:	b300      	st.w      	r0, (r3, 0x0)
	if (status == ENABLE) {
    10ae:	3300      	movi      	r3, 0
    10b0:	2b03      	subi      	r3, 4
    10b2:	60e0      	addu      	r3, r8
    10b4:	9360      	ld.w      	r3, (r3, 0x0)
    10b6:	3b40      	cmpnei      	r3, 0
    10b8:	0812      	bt      	0x10dc	// 10dc <csi_syscon_hfosc_set_switch+0x40>
		H_SYSCON->CLCR |= (1ul<<20);
    10ba:	107f      	lrw      	r3, 0x0	// 1134 <csi_syscon_clo_config+0x3c>
    10bc:	9360      	ld.w      	r3, (r3, 0x0)
    10be:	105e      	lrw      	r2, 0x0	// 1134 <csi_syscon_clo_config+0x3c>
    10c0:	9240      	ld.w      	r2, (r2, 0x0)
    10c2:	9254      	ld.w      	r2, (r2, 0x50)
    10c4:	3ab4      	bseti      	r2, 20
    10c6:	b354      	st.w      	r2, (r3, 0x50)
		while (!((H_SYSCON->CLCR) & (1ul<<21)));
    10c8:	6c00      	or      	r0, r0
    10ca:	107b      	lrw      	r3, 0x0	// 1134 <csi_syscon_clo_config+0x3c>
    10cc:	9360      	ld.w      	r3, (r3, 0x0)
    10ce:	9354      	ld.w      	r2, (r3, 0x50)
    10d0:	3380      	movi      	r3, 128
    10d2:	436e      	lsli      	r3, r3, 14
    10d4:	68c8      	and      	r3, r2
    10d6:	3b40      	cmpnei      	r3, 0
    10d8:	0ff9      	bf      	0x10ca	// 10ca <csi_syscon_hfosc_set_switch+0x2e>
	}
	else {
		H_SYSCON->CLCR &= ~(1ul<<20);

	}
}
    10da:	0408      	br      	0x10ea	// 10ea <csi_syscon_hfosc_set_switch+0x4e>
		H_SYSCON->CLCR &= ~(1ul<<20);
    10dc:	1076      	lrw      	r3, 0x0	// 1134 <csi_syscon_clo_config+0x3c>
    10de:	9360      	ld.w      	r3, (r3, 0x0)
    10e0:	1055      	lrw      	r2, 0x0	// 1134 <csi_syscon_clo_config+0x3c>
    10e2:	9240      	ld.w      	r2, (r2, 0x0)
    10e4:	9254      	ld.w      	r2, (r2, 0x50)
    10e6:	3a94      	bclri      	r2, 20
    10e8:	b354      	st.w      	r2, (r3, 0x50)
}
    10ea:	6c00      	or      	r0, r0
    10ec:	6fa3      	mov      	r14, r8
    10ee:	d90e2000 	ld.w      	r8, (r14, 0x0)
    10f2:	1401      	addi      	r14, r14, 4
    10f4:	783c      	jmp      	r15
	...

000010f8 <csi_syscon_clo_config>:
  \brief       Set CLO output
  \param[in]   clo_sel: clo source selection
  \return      None
*/
void csi_syscon_clo_config(clo_src_e clo_sel)
{
    10f8:	1421      	subi      	r14, r14, 4
    10fa:	dd0e2000 	st.w      	r8, (r14, 0x0)
    10fe:	6e3b      	mov      	r8, r14
    1100:	1421      	subi      	r14, r14, 4
    1102:	3300      	movi      	r3, 0
    1104:	2b03      	subi      	r3, 4
    1106:	60e0      	addu      	r3, r8
    1108:	b300      	st.w      	r0, (r3, 0x0)
	H_SYSCON->CLCR = ((H_SYSCON->CLCR) & ~(0xf<<16))|(clo_sel<<16);
    110a:	106b      	lrw      	r3, 0x0	// 1134 <csi_syscon_clo_config+0x3c>
    110c:	9340      	ld.w      	r2, (r3, 0x0)
    110e:	106a      	lrw      	r3, 0x0	// 1134 <csi_syscon_clo_config+0x3c>
    1110:	9360      	ld.w      	r3, (r3, 0x0)
    1112:	9334      	ld.w      	r1, (r3, 0x50)
    1114:	33f0      	movi      	r3, 240
    1116:	436c      	lsli      	r3, r3, 12
    1118:	684d      	andn      	r1, r3
    111a:	3300      	movi      	r3, 0
    111c:	2b03      	subi      	r3, 4
    111e:	60e0      	addu      	r3, r8
    1120:	9360      	ld.w      	r3, (r3, 0x0)
    1122:	4370      	lsli      	r3, r3, 16
    1124:	6cc4      	or      	r3, r1
    1126:	b274      	st.w      	r3, (r2, 0x50)
}
    1128:	6c00      	or      	r0, r0
    112a:	6fa3      	mov      	r14, r8
    112c:	d90e2000 	ld.w      	r8, (r14, 0x0)
    1130:	1401      	addi      	r14, r14, 4
    1132:	783c      	jmp      	r15
	...
