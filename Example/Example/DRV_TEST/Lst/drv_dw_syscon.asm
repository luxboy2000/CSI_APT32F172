
Obj/drv_dw_syscon.o:     file format elf32-csky-little


Disassembly of section .text:

00000000 <dw_syscon_emosc_config>:
  \param[in]   osc_stabletime: stable counter value (0x7 in default)
  \param[in]   osc_gain: gain control of external osc(0xf in default)
  \return      error code
*/
void dw_syscon_emosc_config(syscon_handle_t handle, bool lf_sel, uint32_t osc_stabletime, uint32_t osc_gain)
{
       0:	1422      	subi      	sp, sp, 8
       2:	b880      	st.w      	r4, (sp, 0)
       4:	dd0e2001 	st.w      	r8, (sp, 0x4)
       8:	6e3b      	mov      	r8, sp
       a:	1424      	subi      	sp, sp, 16
       c:	3400      	movi      	r4, 0
       e:	2c03      	subi      	r4, 4
      10:	6120      	addu      	r4, r8
      12:	b400      	st.w      	r0, (r4, 0)
      14:	6c07      	mov      	r0, r1
      16:	3100      	movi      	r1, 0
      18:	290b      	subi      	r1, 12
      1a:	6060      	addu      	r1, r8
      1c:	b140      	st.w      	r2, (r1, 0)
      1e:	3200      	movi      	r2, 0
      20:	2a0f      	subi      	r2, 16
      22:	60a0      	addu      	r2, r8
      24:	b260      	st.w      	r3, (r2, 0)
      26:	3300      	movi      	r3, 0
      28:	2b04      	subi      	r3, 5
      2a:	60e0      	addu      	r3, r8
      2c:	6c83      	mov      	r2, r0
      2e:	a340      	st.b      	r2, (r3, 0)
    switch (lf_sel) {
      30:	3300      	movi      	r3, 0
      32:	2b04      	subi      	r3, 5
      34:	60e0      	addu      	r3, r8
      36:	8360      	ld.b      	r3, (r3, 0)
      38:	74cc      	zextb      	r3, r3
      3a:	3b41      	cmpnei      	r3, 1
      3c:	0c20      	bf      	0x7c	// 7c <dw_syscon_emosc_config+0x7c>
        case false: /* high freq emosc */
            handle->OSTR  = osc_stabletime;
      3e:	3300      	movi      	r3, 0
      40:	2b03      	subi      	r3, 4
      42:	60e0      	addu      	r3, r8
      44:	9360      	ld.w      	r3, (r3, 0)
      46:	3200      	movi      	r2, 0
      48:	2a0b      	subi      	r2, 12
      4a:	60a0      	addu      	r2, r8
      4c:	9240      	ld.w      	r2, (r2, 0)
      4e:	b350      	st.w      	r2, (r3, 0x40)
            handle->PWRCR = ((handle->PWRCR) & ~(0xful<<8)) | (osc_gain<<8) | PWRCR_KEY;
      50:	3300      	movi      	r3, 0
      52:	2b03      	subi      	r3, 4
      54:	60e0      	addu      	r3, r8
      56:	9360      	ld.w      	r3, (r3, 0)
      58:	9355      	ld.w      	r2, (r3, 0x54)
      5a:	33f0      	movi      	r3, 240
      5c:	4364      	lsli      	r3, r3, 4
      5e:	688d      	andn      	r2, r3
      60:	3300      	movi      	r3, 0
      62:	2b0f      	subi      	r3, 16
      64:	60e0      	addu      	r3, r8
      66:	9360      	ld.w      	r3, (r3, 0)
      68:	4368      	lsli      	r3, r3, 8
      6a:	6c8c      	or      	r2, r3
      6c:	107a      	lrw      	r3, 0xa66a0000	// d4 <dw_syscon_emosc_config+0xd4>
      6e:	6c8c      	or      	r2, r3
      70:	3300      	movi      	r3, 0
      72:	2b03      	subi      	r3, 4
      74:	60e0      	addu      	r3, r8
      76:	9360      	ld.w      	r3, (r3, 0)
      78:	b355      	st.w      	r2, (r3, 0x54)
            break;
      7a:	0423      	br      	0xc0	// c0 <dw_syscon_emosc_config+0xc0>
        case true: /* low freq emosc */
            handle->OSTR  = osc_stabletime;
      7c:	3300      	movi      	r3, 0
      7e:	2b03      	subi      	r3, 4
      80:	60e0      	addu      	r3, r8
      82:	9360      	ld.w      	r3, (r3, 0)
      84:	3200      	movi      	r2, 0
      86:	2a0b      	subi      	r2, 12
      88:	60a0      	addu      	r2, r8
      8a:	9240      	ld.w      	r2, (r2, 0)
      8c:	b350      	st.w      	r2, (r3, 0x40)
            handle->PWRCR = ((handle->PWRCR) & ~(0xful<<8)) | ((osc_gain & 7ul)<<8) | PWRCR_KEY;
      8e:	3300      	movi      	r3, 0
      90:	2b03      	subi      	r3, 4
      92:	60e0      	addu      	r3, r8
      94:	9360      	ld.w      	r3, (r3, 0)
      96:	9355      	ld.w      	r2, (r3, 0x54)
      98:	33f0      	movi      	r3, 240
      9a:	4364      	lsli      	r3, r3, 4
      9c:	688d      	andn      	r2, r3
      9e:	3300      	movi      	r3, 0
      a0:	2b0f      	subi      	r3, 16
      a2:	60e0      	addu      	r3, r8
      a4:	9360      	ld.w      	r3, (r3, 0)
      a6:	4328      	lsli      	r1, r3, 8
      a8:	33e0      	movi      	r3, 224
      aa:	4363      	lsli      	r3, r3, 3
      ac:	68c4      	and      	r3, r1
      ae:	6c8c      	or      	r2, r3
      b0:	1069      	lrw      	r3, 0xa66a0000	// d4 <dw_syscon_emosc_config+0xd4>
      b2:	6c8c      	or      	r2, r3
      b4:	3300      	movi      	r3, 0
      b6:	2b03      	subi      	r3, 4
      b8:	60e0      	addu      	r3, r8
      ba:	9360      	ld.w      	r3, (r3, 0)
      bc:	b355      	st.w      	r2, (r3, 0x54)
            break;
      be:	6c00      	or      	r0, r0
    }

    emosc_intialized_flag = true;
      c0:	1066      	lrw      	r3, 0	// d8 <dw_syscon_emosc_config+0xd8>
      c2:	3201      	movi      	r2, 1
      c4:	a340      	st.b      	r2, (r3, 0)
}
      c6:	6c00      	or      	r0, r0
      c8:	6fa3      	mov      	sp, r8
      ca:	d90e2001 	ld.w      	r8, (sp, 0x4)
      ce:	9880      	ld.w      	r4, (sp, 0)
      d0:	1402      	addi      	sp, sp, 8
      d2:	783c      	rts
      d4:	a66a0000 	.long	0xa66a0000
      d8:	00000000 	.long	0x00000000

000000dc <dw_syscon_set_clocksource_switch>:
  \param[in]   handle  usart handle to operate.
  \param[in]   parity    \ref usart_parity_e
  \return      error code
*/
int32_t dw_syscon_set_clocksource_switch(syscon_handle_t handle, uint32_t target_clock, bool status)
{
      dc:	1422      	subi      	sp, sp, 8
      de:	dd0e2000 	st.w      	r8, (sp, 0)
      e2:	ddee2001 	st.w      	r15, (sp, 0x4)
      e6:	6e3b      	mov      	r8, sp
      e8:	1424      	subi      	sp, sp, 16
      ea:	3300      	movi      	r3, 0
      ec:	2b07      	subi      	r3, 8
      ee:	60e0      	addu      	r3, r8
      f0:	b300      	st.w      	r0, (r3, 0)
      f2:	3300      	movi      	r3, 0
      f4:	2b0b      	subi      	r3, 12
      f6:	60e0      	addu      	r3, r8
      f8:	b320      	st.w      	r1, (r3, 0)
      fa:	3300      	movi      	r3, 0
      fc:	2b0c      	subi      	r3, 13
      fe:	60e0      	addu      	r3, r8
     100:	a340      	st.b      	r2, (r3, 0)
    uint32_t cur_clkstatus;

    if ((target_clock == ENDIS_EMOSC) && !emosc_intialized_flag) {
     102:	3300      	movi      	r3, 0
     104:	2b0b      	subi      	r3, 12
     106:	60e0      	addu      	r3, r8
     108:	9360      	ld.w      	r3, (r3, 0)
     10a:	3b48      	cmpnei      	r3, 8
     10c:	080e      	bt      	0x128	// 128 <dw_syscon_set_clocksource_switch+0x4c>
     10e:	ea830121 	lrw      	r3, 0	// 590 <dw_syscon_systemclock_config+0x3b4>
     112:	8360      	ld.b      	r3, (r3, 0)
     114:	748c      	zextb      	r2, r3
     116:	3301      	movi      	r3, 1
     118:	6c8d      	xor      	r2, r3
     11a:	6ccb      	mov      	r3, r2
     11c:	74cc      	zextb      	r3, r3
     11e:	3b40      	cmpnei      	r3, 0
     120:	0c04      	bf      	0x128	// 128 <dw_syscon_set_clocksource_switch+0x4c>
        return -1;
     122:	3300      	movi      	r3, 0
     124:	2b00      	subi      	r3, 1
     126:	0452      	br      	0x1ca	// 1ca <dw_syscon_set_clocksource_switch+0xee>
    }

    cur_clkstatus = handle->GCSR;
     128:	3300      	movi      	r3, 0
     12a:	2b03      	subi      	r3, 4
     12c:	60e0      	addu      	r3, r8
     12e:	3200      	movi      	r2, 0
     130:	2a07      	subi      	r2, 8
     132:	60a0      	addu      	r2, r8
     134:	9240      	ld.w      	r2, (r2, 0)
     136:	9243      	ld.w      	r2, (r2, 0xc)
     138:	b340      	st.w      	r2, (r3, 0)
    if (status == APT_DEF_ENABLE) {
     13a:	3300      	movi      	r3, 0
     13c:	2b0c      	subi      	r3, 13
     13e:	60e0      	addu      	r3, r8
     140:	8360      	ld.b      	r3, (r3, 0)
     142:	74cc      	zextb      	r3, r3
     144:	3b40      	cmpnei      	r3, 0
     146:	0c18      	bf      	0x176	// 176 <dw_syscon_set_clocksource_switch+0x9a>
        handle->GCER = target_clock;
     148:	3300      	movi      	r3, 0
     14a:	2b07      	subi      	r3, 8
     14c:	60e0      	addu      	r3, r8
     14e:	9360      	ld.w      	r3, (r3, 0)
     150:	3200      	movi      	r2, 0
     152:	2a0b      	subi      	r2, 12
     154:	60a0      	addu      	r2, r8
     156:	9240      	ld.w      	r2, (r2, 0)
     158:	b341      	st.w      	r2, (r3, 0x4)
        cur_clkstatus |= target_clock;
     15a:	3300      	movi      	r3, 0
     15c:	2b03      	subi      	r3, 4
     15e:	60e0      	addu      	r3, r8
     160:	3100      	movi      	r1, 0
     162:	2903      	subi      	r1, 4
     164:	6060      	addu      	r1, r8
     166:	3200      	movi      	r2, 0
     168:	2a0b      	subi      	r2, 12
     16a:	60a0      	addu      	r2, r8
     16c:	9120      	ld.w      	r1, (r1, 0)
     16e:	9240      	ld.w      	r2, (r2, 0)
     170:	6c84      	or      	r2, r1
     172:	b340      	st.w      	r2, (r3, 0)
     174:	0419      	br      	0x1a6	// 1a6 <dw_syscon_set_clocksource_switch+0xca>
    }
    else {
        handle->GCDR = target_clock;
     176:	3300      	movi      	r3, 0
     178:	2b07      	subi      	r3, 8
     17a:	60e0      	addu      	r3, r8
     17c:	9360      	ld.w      	r3, (r3, 0)
     17e:	3200      	movi      	r2, 0
     180:	2a0b      	subi      	r2, 12
     182:	60a0      	addu      	r2, r8
     184:	9240      	ld.w      	r2, (r2, 0)
     186:	b342      	st.w      	r2, (r3, 0x8)
        cur_clkstatus &= ~target_clock;
     188:	3300      	movi      	r3, 0
     18a:	2b0b      	subi      	r3, 12
     18c:	60e0      	addu      	r3, r8
     18e:	9360      	ld.w      	r3, (r3, 0)
     190:	6cce      	nor      	r3, r3
     192:	6c4f      	mov      	r1, r3
     194:	3300      	movi      	r3, 0
     196:	2b03      	subi      	r3, 4
     198:	60e0      	addu      	r3, r8
     19a:	3200      	movi      	r2, 0
     19c:	2a03      	subi      	r2, 4
     19e:	60a0      	addu      	r2, r8
     1a0:	9240      	ld.w      	r2, (r2, 0)
     1a2:	6884      	and      	r2, r1
     1a4:	b340      	st.w      	r2, (r3, 0)
    }

    mdelay (100);
     1a6:	3064      	movi      	r0, 100
     1a8:	e0000000 	bsr      	0	// 0 <mdelay>

    if (handle->GCSR != cur_clkstatus) {
     1ac:	3300      	movi      	r3, 0
     1ae:	2b07      	subi      	r3, 8
     1b0:	60e0      	addu      	r3, r8
     1b2:	9360      	ld.w      	r3, (r3, 0)
     1b4:	9343      	ld.w      	r2, (r3, 0xc)
     1b6:	3300      	movi      	r3, 0
     1b8:	2b03      	subi      	r3, 4
     1ba:	60e0      	addu      	r3, r8
     1bc:	9360      	ld.w      	r3, (r3, 0)
     1be:	64ca      	cmpne      	r2, r3
     1c0:	0c04      	bf      	0x1c8	// 1c8 <dw_syscon_set_clocksource_switch+0xec>
        return -1;
     1c2:	3300      	movi      	r3, 0
     1c4:	2b00      	subi      	r3, 1
     1c6:	0402      	br      	0x1ca	// 1ca <dw_syscon_set_clocksource_switch+0xee>
    }
    else {
        return 0;
     1c8:	3300      	movi      	r3, 0
    }
}
     1ca:	6c0f      	mov      	r0, r3
     1cc:	6fa3      	mov      	sp, r8
     1ce:	d9ee2001 	ld.w      	r15, (sp, 0x4)
     1d2:	d90e2000 	ld.w      	r8, (sp, 0)
     1d6:	1402      	addi      	sp, sp, 8
     1d8:	783c      	rts
	...

000001dc <dw_syscon_systemclock_config>:
  \param[in]   handle  usart handle to operate.
  \param[in]   parity    \ref usart_parity_e
  \return      error code
*/
int32_t dw_syscon_systemclock_config(syscon_handle_t handle, sysclk_src_t target_sysclk, uint32_t hclk_freq, uint32_t pclk_freq)
{
     1dc:	1423      	subi      	sp, sp, 12
     1de:	b880      	st.w      	r4, (sp, 0)
     1e0:	dd0e2001 	st.w      	r8, (sp, 0x4)
     1e4:	ddee2002 	st.w      	r15, (sp, 0x8)
     1e8:	6e3b      	mov      	r8, sp
     1ea:	142a      	subi      	sp, sp, 40
     1ec:	3400      	movi      	r4, 0
     1ee:	2c1b      	subi      	r4, 28
     1f0:	6120      	addu      	r4, r8
     1f2:	b400      	st.w      	r0, (r4, 0)
     1f4:	3000      	movi      	r0, 0
     1f6:	281f      	subi      	r0, 32
     1f8:	6020      	addu      	r0, r8
     1fa:	b020      	st.w      	r1, (r0, 0)
     1fc:	3100      	movi      	r1, 0
     1fe:	2923      	subi      	r1, 36
     200:	6060      	addu      	r1, r8
     202:	b140      	st.w      	r2, (r1, 0)
     204:	3200      	movi      	r2, 0
     206:	2a27      	subi      	r2, 40
     208:	60a0      	addu      	r2, r8
     20a:	b260      	st.w      	r3, (r2, 0)
    volatile uint32_t i;
    uint32_t target_sysclk_freq = 0;
     20c:	3300      	movi      	r3, 0
     20e:	2b03      	subi      	r3, 4
     210:	60e0      	addu      	r3, r8
     212:	3200      	movi      	r2, 0
     214:	b340      	st.w      	r2, (r3, 0)
    uint32_t target_hclk_freq, hclk_div;
    uint32_t target_pclk_freq, pclk_div;

    if (hclk_freq < pclk_freq) {
     216:	3200      	movi      	r2, 0
     218:	2a23      	subi      	r2, 36
     21a:	60a0      	addu      	r2, r8
     21c:	3300      	movi      	r3, 0
     21e:	2b27      	subi      	r3, 40
     220:	60e0      	addu      	r3, r8
     222:	9240      	ld.w      	r2, (r2, 0)
     224:	9360      	ld.w      	r3, (r3, 0)
     226:	64c8      	cmphs      	r2, r3
     228:	0805      	bt      	0x232	// 232 <dw_syscon_systemclock_config+0x56>
        return -1;  // Error config
     22a:	3300      	movi      	r3, 0
     22c:	2b00      	subi      	r3, 1
     22e:	e8000276 	br      	0x71a	// 71a <dw_syscon_systemclock_config+0x53e>
    }

    switch (target_sysclk) {
     232:	3300      	movi      	r3, 0
     234:	2b1f      	subi      	r3, 32
     236:	60e0      	addu      	r3, r8
     238:	9360      	ld.w      	r3, (r3, 0)
     23a:	3b41      	cmpnei      	r3, 1
     23c:	0c0e      	bf      	0x258	// 258 <dw_syscon_systemclock_config+0x7c>
     23e:	3b00      	cmphsi      	r3, 1
     240:	0c06      	bf      	0x24c	// 24c <dw_syscon_systemclock_config+0x70>
     242:	3b42      	cmpnei      	r3, 2
     244:	0c10      	bf      	0x264	// 264 <dw_syscon_systemclock_config+0x88>
     246:	3b43      	cmpnei      	r3, 3
     248:	0c14      	bf      	0x270	// 270 <dw_syscon_systemclock_config+0x94>
     24a:	0419      	br      	0x27c	// 27c <dw_syscon_systemclock_config+0xa0>
        case SYSCLK_IMOSC_40M:
            target_sysclk_freq = 40000000;
     24c:	3300      	movi      	r3, 0
     24e:	2b03      	subi      	r3, 4
     250:	60e0      	addu      	r3, r8
     252:	014e      	lrw      	r2, 0x2625a00	// 594 <dw_syscon_systemclock_config+0x3b8>
     254:	b340      	st.w      	r2, (r3, 0)
			break;
     256:	0413      	br      	0x27c	// 27c <dw_syscon_systemclock_config+0xa0>
        case SYSCLK_IMOSC_20M:
            target_sysclk_freq = 20000000;
     258:	3300      	movi      	r3, 0
     25a:	2b03      	subi      	r3, 4
     25c:	60e0      	addu      	r3, r8
     25e:	0150      	lrw      	r2, 0x1312d00	// 598 <dw_syscon_systemclock_config+0x3bc>
     260:	b340      	st.w      	r2, (r3, 0)
            break;
     262:	040d      	br      	0x27c	// 27c <dw_syscon_systemclock_config+0xa0>
        case SYSCLK_EMOSC:
            target_sysclk_freq = EMOSC_FREQ;
     264:	3300      	movi      	r3, 0
     266:	2b03      	subi      	r3, 4
     268:	60e0      	addu      	r3, r8
     26a:	0152      	lrw      	r2, 0x7a1200	// 59c <dw_syscon_systemclock_config+0x3c0>
     26c:	b340      	st.w      	r2, (r3, 0)
            break;
     26e:	0407      	br      	0x27c	// 27c <dw_syscon_systemclock_config+0xa0>
        case SYSCLK_ISOSC:
            target_sysclk_freq = 3000000;
     270:	3300      	movi      	r3, 0
     272:	2b03      	subi      	r3, 4
     274:	60e0      	addu      	r3, r8
     276:	0154      	lrw      	r2, 0x2dc6c0	// 5a0 <dw_syscon_systemclock_config+0x3c4>
     278:	b340      	st.w      	r2, (r3, 0)
            break;
     27a:	6c00      	or      	r0, r0
    }
	target_hclk_freq = hclk_freq;
     27c:	3300      	movi      	r3, 0
     27e:	2b07      	subi      	r3, 8
     280:	60e0      	addu      	r3, r8
     282:	3200      	movi      	r2, 0
     284:	2a23      	subi      	r2, 36
     286:	60a0      	addu      	r2, r8
     288:	9240      	ld.w      	r2, (r2, 0)
     28a:	b340      	st.w      	r2, (r3, 0)

    hclk_div = target_sysclk_freq/target_hclk_freq;
     28c:	3400      	movi      	r4, 0
     28e:	2c0b      	subi      	r4, 12
     290:	6120      	addu      	r4, r8
     292:	3300      	movi      	r3, 0
     294:	2b03      	subi      	r3, 4
     296:	60e0      	addu      	r3, r8
     298:	3200      	movi      	r2, 0
     29a:	2a07      	subi      	r2, 8
     29c:	60a0      	addu      	r2, r8
     29e:	9220      	ld.w      	r1, (r2, 0)
     2a0:	9300      	ld.w      	r0, (r3, 0)
     2a2:	e0000000 	bsr      	0	// 0 <__udivsi3>
     2a6:	6cc3      	mov      	r3, r0
     2a8:	b460      	st.w      	r3, (r4, 0)
    target_hclk_freq = target_sysclk_freq/hclk_div;
     2aa:	3400      	movi      	r4, 0
     2ac:	2c07      	subi      	r4, 8
     2ae:	6120      	addu      	r4, r8
     2b0:	3300      	movi      	r3, 0
     2b2:	2b03      	subi      	r3, 4
     2b4:	60e0      	addu      	r3, r8
     2b6:	3200      	movi      	r2, 0
     2b8:	2a0b      	subi      	r2, 12
     2ba:	60a0      	addu      	r2, r8
     2bc:	9220      	ld.w      	r1, (r2, 0)
     2be:	9300      	ld.w      	r0, (r3, 0)
     2c0:	e0000000 	bsr      	0	// 0 <__udivsi3>
     2c4:	6cc3      	mov      	r3, r0
     2c6:	b460      	st.w      	r3, (r4, 0)
    pclk_div = hclk_freq/pclk_freq;
     2c8:	3400      	movi      	r4, 0
     2ca:	2c0f      	subi      	r4, 16
     2cc:	6120      	addu      	r4, r8
     2ce:	3300      	movi      	r3, 0
     2d0:	2b23      	subi      	r3, 36
     2d2:	60e0      	addu      	r3, r8
     2d4:	3200      	movi      	r2, 0
     2d6:	2a27      	subi      	r2, 40
     2d8:	60a0      	addu      	r2, r8
     2da:	9220      	ld.w      	r1, (r2, 0)
     2dc:	9300      	ld.w      	r0, (r3, 0)
     2de:	e0000000 	bsr      	0	// 0 <__udivsi3>
     2e2:	6cc3      	mov      	r3, r0
     2e4:	b460      	st.w      	r3, (r4, 0)
    target_pclk_freq = target_hclk_freq/pclk_div;
     2e6:	3400      	movi      	r4, 0
     2e8:	2c13      	subi      	r4, 20
     2ea:	6120      	addu      	r4, r8
     2ec:	3300      	movi      	r3, 0
     2ee:	2b07      	subi      	r3, 8
     2f0:	60e0      	addu      	r3, r8
     2f2:	3200      	movi      	r2, 0
     2f4:	2a0f      	subi      	r2, 16
     2f6:	60a0      	addu      	r2, r8
     2f8:	9220      	ld.w      	r1, (r2, 0)
     2fa:	9300      	ld.w      	r0, (r3, 0)
     2fc:	e0000000 	bsr      	0	// 0 <__udivsi3>
     300:	6cc3      	mov      	r3, r0
     302:	b460      	st.w      	r3, (r4, 0)

    if ((_cur_sysclk == SYSCLK_IMOSC_20M) && (target_sysclk == SYSCLK_IMOSC_40M)) {
     304:	0277      	lrw      	r3, 0	// 5a4 <dw_syscon_systemclock_config+0x3c8>
     306:	9360      	ld.w      	r3, (r3, 0)
     308:	3b41      	cmpnei      	r3, 1
     30a:	08ae      	bt      	0x466	// 466 <dw_syscon_systemclock_config+0x28a>
     30c:	3300      	movi      	r3, 0
     30e:	2b1f      	subi      	r3, 32
     310:	60e0      	addu      	r3, r8
     312:	9360      	ld.w      	r3, (r3, 0)
     314:	3b40      	cmpnei      	r3, 0
     316:	08a8      	bt      	0x466	// 466 <dw_syscon_systemclock_config+0x28a>
        handle->GCER = 1; // enable ISOSC
     318:	3300      	movi      	r3, 0
     31a:	2b1b      	subi      	r3, 28
     31c:	60e0      	addu      	r3, r8
     31e:	9360      	ld.w      	r3, (r3, 0)
     320:	3201      	movi      	r2, 1
     322:	b341      	st.w      	r2, (r3, 0x4)
        handle->ERRINF = 0;
     324:	3300      	movi      	r3, 0
     326:	2b1b      	subi      	r3, 28
     328:	60e0      	addu      	r3, r8
     32a:	9360      	ld.w      	r3, (r3, 0)
     32c:	23eb      	addi      	r3, 236
     32e:	3200      	movi      	r2, 0
     330:	b340      	st.w      	r2, (r3, 0)
        for (i=0;i<100;i++);
     332:	3300      	movi      	r3, 0
     334:	2b17      	subi      	r3, 24
     336:	60e0      	addu      	r3, r8
     338:	3200      	movi      	r2, 0
     33a:	b340      	st.w      	r2, (r3, 0)
     33c:	040a      	br      	0x350	// 350 <dw_syscon_systemclock_config+0x174>
     33e:	3300      	movi      	r3, 0
     340:	2b17      	subi      	r3, 24
     342:	60e0      	addu      	r3, r8
     344:	9360      	ld.w      	r3, (r3, 0)
     346:	5b42      	addi      	r2, r3, 1
     348:	3300      	movi      	r3, 0
     34a:	2b17      	subi      	r3, 24
     34c:	60e0      	addu      	r3, r8
     34e:	b340      	st.w      	r2, (r3, 0)
     350:	3300      	movi      	r3, 0
     352:	2b17      	subi      	r3, 24
     354:	60e0      	addu      	r3, r8
     356:	9340      	ld.w      	r2, (r3, 0)
     358:	3363      	movi      	r3, 99
     35a:	648c      	cmphs      	r3, r2
     35c:	0bf1      	bt      	0x33e	// 33e <dw_syscon_systemclock_config+0x162>
        handle->SCLKCR = (4 | SCLKCR_KEY); // switch to ISOSC as sysclk
     35e:	3300      	movi      	r3, 0
     360:	2b1b      	subi      	r3, 28
     362:	60e0      	addu      	r3, r8
     364:	9360      	ld.w      	r3, (r3, 0)
     366:	034e      	lrw      	r2, 0xd22d0004	// 5a8 <dw_syscon_systemclock_config+0x3cc>
     368:	b347      	st.w      	r2, (r3, 0x1c)
        for (i=0;i<10;i++);
     36a:	3300      	movi      	r3, 0
     36c:	2b17      	subi      	r3, 24
     36e:	60e0      	addu      	r3, r8
     370:	3200      	movi      	r2, 0
     372:	b340      	st.w      	r2, (r3, 0)
     374:	040a      	br      	0x388	// 388 <dw_syscon_systemclock_config+0x1ac>
     376:	3300      	movi      	r3, 0
     378:	2b17      	subi      	r3, 24
     37a:	60e0      	addu      	r3, r8
     37c:	9360      	ld.w      	r3, (r3, 0)
     37e:	5b42      	addi      	r2, r3, 1
     380:	3300      	movi      	r3, 0
     382:	2b17      	subi      	r3, 24
     384:	60e0      	addu      	r3, r8
     386:	b340      	st.w      	r2, (r3, 0)
     388:	3300      	movi      	r3, 0
     38a:	2b17      	subi      	r3, 24
     38c:	60e0      	addu      	r3, r8
     38e:	9360      	ld.w      	r3, (r3, 0)
     390:	3b09      	cmphsi      	r3, 10
     392:	0ff2      	bf      	0x376	// 376 <dw_syscon_systemclock_config+0x19a>
        if ((handle->ERRINF) & (1ul<<4)) {
     394:	3300      	movi      	r3, 0
     396:	2b1b      	subi      	r3, 28
     398:	60e0      	addu      	r3, r8
     39a:	9360      	ld.w      	r3, (r3, 0)
     39c:	23eb      	addi      	r3, 236
     39e:	9340      	ld.w      	r2, (r3, 0)
     3a0:	3310      	movi      	r3, 16
     3a2:	68c8      	and      	r3, r2
     3a4:	3b40      	cmpnei      	r3, 0
     3a6:	0c04      	bf      	0x3ae	// 3ae <dw_syscon_systemclock_config+0x1d2>
            return -2;
     3a8:	3300      	movi      	r3, 0
     3aa:	2b01      	subi      	r3, 2
     3ac:	05b7      	br      	0x71a	// 71a <dw_syscon_systemclock_config+0x53e>
        }
        handle->GCDR = 2; // disable IMOSC
     3ae:	3300      	movi      	r3, 0
     3b0:	2b1b      	subi      	r3, 28
     3b2:	60e0      	addu      	r3, r8
     3b4:	9360      	ld.w      	r3, (r3, 0)
     3b6:	3202      	movi      	r2, 2
     3b8:	b342      	st.w      	r2, (r3, 0x8)
        handle->CLCR |= (1ul<<22);
     3ba:	3300      	movi      	r3, 0
     3bc:	2b1b      	subi      	r3, 28
     3be:	60e0      	addu      	r3, r8
     3c0:	9360      	ld.w      	r3, (r3, 0)
     3c2:	9374      	ld.w      	r3, (r3, 0x50)
     3c4:	3bb6      	bseti      	r3, r3, 22
     3c6:	6c8f      	mov      	r2, r3
     3c8:	3300      	movi      	r3, 0
     3ca:	2b1b      	subi      	r3, 28
     3cc:	60e0      	addu      	r3, r8
     3ce:	9360      	ld.w      	r3, (r3, 0)
     3d0:	b354      	st.w      	r2, (r3, 0x50)
        handle->GCER = 2; // enable IMOSC
     3d2:	3300      	movi      	r3, 0
     3d4:	2b1b      	subi      	r3, 28
     3d6:	60e0      	addu      	r3, r8
     3d8:	9360      	ld.w      	r3, (r3, 0)
     3da:	3202      	movi      	r2, 2
     3dc:	b341      	st.w      	r2, (r3, 0x4)
        for (i=0;i<100;i++);
     3de:	3300      	movi      	r3, 0
     3e0:	2b17      	subi      	r3, 24
     3e2:	60e0      	addu      	r3, r8
     3e4:	3200      	movi      	r2, 0
     3e6:	b340      	st.w      	r2, (r3, 0)
     3e8:	040a      	br      	0x3fc	// 3fc <dw_syscon_systemclock_config+0x220>
     3ea:	3300      	movi      	r3, 0
     3ec:	2b17      	subi      	r3, 24
     3ee:	60e0      	addu      	r3, r8
     3f0:	9360      	ld.w      	r3, (r3, 0)
     3f2:	5b42      	addi      	r2, r3, 1
     3f4:	3300      	movi      	r3, 0
     3f6:	2b17      	subi      	r3, 24
     3f8:	60e0      	addu      	r3, r8
     3fa:	b340      	st.w      	r2, (r3, 0)
     3fc:	3300      	movi      	r3, 0
     3fe:	2b17      	subi      	r3, 24
     400:	60e0      	addu      	r3, r8
     402:	9340      	ld.w      	r2, (r3, 0)
     404:	3363      	movi      	r3, 99
     406:	648c      	cmphs      	r3, r2
     408:	0bf1      	bt      	0x3ea	// 3ea <dw_syscon_systemclock_config+0x20e>
        handle->SCLKCR = ((hclk_div<<8)|SCLKCR_KEY);
     40a:	3300      	movi      	r3, 0
     40c:	2b0b      	subi      	r3, 12
     40e:	60e0      	addu      	r3, r8
     410:	9360      	ld.w      	r3, (r3, 0)
     412:	4348      	lsli      	r2, r3, 8
     414:	1366      	lrw      	r3, 0xd22d0000	// 5ac <dw_syscon_systemclock_config+0x3d0>
     416:	6c8c      	or      	r2, r3
     418:	3300      	movi      	r3, 0
     41a:	2b1b      	subi      	r3, 28
     41c:	60e0      	addu      	r3, r8
     41e:	9360      	ld.w      	r3, (r3, 0)
     420:	b347      	st.w      	r2, (r3, 0x1c)
        for (i=0;i<10;i++);
     422:	3300      	movi      	r3, 0
     424:	2b17      	subi      	r3, 24
     426:	60e0      	addu      	r3, r8
     428:	3200      	movi      	r2, 0
     42a:	b340      	st.w      	r2, (r3, 0)
     42c:	040a      	br      	0x440	// 440 <dw_syscon_systemclock_config+0x264>
     42e:	3300      	movi      	r3, 0
     430:	2b17      	subi      	r3, 24
     432:	60e0      	addu      	r3, r8
     434:	9360      	ld.w      	r3, (r3, 0)
     436:	5b42      	addi      	r2, r3, 1
     438:	3300      	movi      	r3, 0
     43a:	2b17      	subi      	r3, 24
     43c:	60e0      	addu      	r3, r8
     43e:	b340      	st.w      	r2, (r3, 0)
     440:	3300      	movi      	r3, 0
     442:	2b17      	subi      	r3, 24
     444:	60e0      	addu      	r3, r8
     446:	9360      	ld.w      	r3, (r3, 0)
     448:	3b09      	cmphsi      	r3, 10
     44a:	0ff2      	bf      	0x42e	// 42e <dw_syscon_systemclock_config+0x252>
        if ((handle->ERRINF) & (1ul<<4)) {
     44c:	3300      	movi      	r3, 0
     44e:	2b1b      	subi      	r3, 28
     450:	60e0      	addu      	r3, r8
     452:	9360      	ld.w      	r3, (r3, 0)
     454:	23eb      	addi      	r3, 236
     456:	9340      	ld.w      	r2, (r3, 0)
     458:	3310      	movi      	r3, 16
     45a:	68c8      	and      	r3, r2
     45c:	3b40      	cmpnei      	r3, 0
     45e:	0d3f      	bf      	0x6dc	// 6dc <dw_syscon_systemclock_config+0x500>
            return -2;
     460:	3300      	movi      	r3, 0
     462:	2b01      	subi      	r3, 2
     464:	055b      	br      	0x71a	// 71a <dw_syscon_systemclock_config+0x53e>
        }
    }
    else if ((_cur_sysclk == SYSCLK_IMOSC_40M) && (target_sysclk == SYSCLK_IMOSC_20M)) {
     466:	1270      	lrw      	r3, 0	// 5a4 <dw_syscon_systemclock_config+0x3c8>
     468:	9360      	ld.w      	r3, (r3, 0)
     46a:	3b40      	cmpnei      	r3, 0
     46c:	08c0      	bt      	0x5ec	// 5ec <dw_syscon_systemclock_config+0x410>
     46e:	3300      	movi      	r3, 0
     470:	2b1f      	subi      	r3, 32
     472:	60e0      	addu      	r3, r8
     474:	9360      	ld.w      	r3, (r3, 0)
     476:	3b41      	cmpnei      	r3, 1
     478:	08ba      	bt      	0x5ec	// 5ec <dw_syscon_systemclock_config+0x410>
        handle->GCER = 1; // enable ISOSC
     47a:	3300      	movi      	r3, 0
     47c:	2b1b      	subi      	r3, 28
     47e:	60e0      	addu      	r3, r8
     480:	9360      	ld.w      	r3, (r3, 0)
     482:	3201      	movi      	r2, 1
     484:	b341      	st.w      	r2, (r3, 0x4)
        handle->ERRINF = 0;
     486:	3300      	movi      	r3, 0
     488:	2b1b      	subi      	r3, 28
     48a:	60e0      	addu      	r3, r8
     48c:	9360      	ld.w      	r3, (r3, 0)
     48e:	23eb      	addi      	r3, 236
     490:	3200      	movi      	r2, 0
     492:	b340      	st.w      	r2, (r3, 0)
        for (i=0;i<100;i++);
     494:	3300      	movi      	r3, 0
     496:	2b17      	subi      	r3, 24
     498:	60e0      	addu      	r3, r8
     49a:	3200      	movi      	r2, 0
     49c:	b340      	st.w      	r2, (r3, 0)
     49e:	040a      	br      	0x4b2	// 4b2 <dw_syscon_systemclock_config+0x2d6>
     4a0:	3300      	movi      	r3, 0
     4a2:	2b17      	subi      	r3, 24
     4a4:	60e0      	addu      	r3, r8
     4a6:	9360      	ld.w      	r3, (r3, 0)
     4a8:	5b42      	addi      	r2, r3, 1
     4aa:	3300      	movi      	r3, 0
     4ac:	2b17      	subi      	r3, 24
     4ae:	60e0      	addu      	r3, r8
     4b0:	b340      	st.w      	r2, (r3, 0)
     4b2:	3300      	movi      	r3, 0
     4b4:	2b17      	subi      	r3, 24
     4b6:	60e0      	addu      	r3, r8
     4b8:	9340      	ld.w      	r2, (r3, 0)
     4ba:	3363      	movi      	r3, 99
     4bc:	648c      	cmphs      	r3, r2
     4be:	0bf1      	bt      	0x4a0	// 4a0 <dw_syscon_systemclock_config+0x2c4>
        handle->SCLKCR = (4 | SCLKCR_KEY); // switch to ISOSC as sysclk
     4c0:	3300      	movi      	r3, 0
     4c2:	2b1b      	subi      	r3, 28
     4c4:	60e0      	addu      	r3, r8
     4c6:	9360      	ld.w      	r3, (r3, 0)
     4c8:	1158      	lrw      	r2, 0xd22d0004	// 5a8 <dw_syscon_systemclock_config+0x3cc>
     4ca:	b347      	st.w      	r2, (r3, 0x1c)
        for (i=0;i<10;i++);
     4cc:	3300      	movi      	r3, 0
     4ce:	2b17      	subi      	r3, 24
     4d0:	60e0      	addu      	r3, r8
     4d2:	3200      	movi      	r2, 0
     4d4:	b340      	st.w      	r2, (r3, 0)
     4d6:	040a      	br      	0x4ea	// 4ea <dw_syscon_systemclock_config+0x30e>
     4d8:	3300      	movi      	r3, 0
     4da:	2b17      	subi      	r3, 24
     4dc:	60e0      	addu      	r3, r8
     4de:	9360      	ld.w      	r3, (r3, 0)
     4e0:	5b42      	addi      	r2, r3, 1
     4e2:	3300      	movi      	r3, 0
     4e4:	2b17      	subi      	r3, 24
     4e6:	60e0      	addu      	r3, r8
     4e8:	b340      	st.w      	r2, (r3, 0)
     4ea:	3300      	movi      	r3, 0
     4ec:	2b17      	subi      	r3, 24
     4ee:	60e0      	addu      	r3, r8
     4f0:	9360      	ld.w      	r3, (r3, 0)
     4f2:	3b09      	cmphsi      	r3, 10
     4f4:	0ff2      	bf      	0x4d8	// 4d8 <dw_syscon_systemclock_config+0x2fc>
        if ((handle->ERRINF) & (1ul<<4)) {
     4f6:	3300      	movi      	r3, 0
     4f8:	2b1b      	subi      	r3, 28
     4fa:	60e0      	addu      	r3, r8
     4fc:	9360      	ld.w      	r3, (r3, 0)
     4fe:	23eb      	addi      	r3, 236
     500:	9340      	ld.w      	r2, (r3, 0)
     502:	3310      	movi      	r3, 16
     504:	68c8      	and      	r3, r2
     506:	3b40      	cmpnei      	r3, 0
     508:	0c04      	bf      	0x510	// 510 <dw_syscon_systemclock_config+0x334>
            return -2;
     50a:	3300      	movi      	r3, 0
     50c:	2b01      	subi      	r3, 2
     50e:	0506      	br      	0x71a	// 71a <dw_syscon_systemclock_config+0x53e>
        }
        handle->GCDR = 2; // disable IMOSC
     510:	3300      	movi      	r3, 0
     512:	2b1b      	subi      	r3, 28
     514:	60e0      	addu      	r3, r8
     516:	9360      	ld.w      	r3, (r3, 0)
     518:	3202      	movi      	r2, 2
     51a:	b342      	st.w      	r2, (r3, 0x8)
        handle->CLCR &= ~(1ul<<22);
     51c:	3300      	movi      	r3, 0
     51e:	2b1b      	subi      	r3, 28
     520:	60e0      	addu      	r3, r8
     522:	9360      	ld.w      	r3, (r3, 0)
     524:	9374      	ld.w      	r3, (r3, 0x50)
     526:	3b96      	bclri      	r3, r3, 22
     528:	6c8f      	mov      	r2, r3
     52a:	3300      	movi      	r3, 0
     52c:	2b1b      	subi      	r3, 28
     52e:	60e0      	addu      	r3, r8
     530:	9360      	ld.w      	r3, (r3, 0)
     532:	b354      	st.w      	r2, (r3, 0x50)
        handle->GCER = 2; // enable IMOSC
     534:	3300      	movi      	r3, 0
     536:	2b1b      	subi      	r3, 28
     538:	60e0      	addu      	r3, r8
     53a:	9360      	ld.w      	r3, (r3, 0)
     53c:	3202      	movi      	r2, 2
     53e:	b341      	st.w      	r2, (r3, 0x4)
        for (i=0;i<100;i++);
     540:	3300      	movi      	r3, 0
     542:	2b17      	subi      	r3, 24
     544:	60e0      	addu      	r3, r8
     546:	3200      	movi      	r2, 0
     548:	b340      	st.w      	r2, (r3, 0)
     54a:	040a      	br      	0x55e	// 55e <dw_syscon_systemclock_config+0x382>
     54c:	3300      	movi      	r3, 0
     54e:	2b17      	subi      	r3, 24
     550:	60e0      	addu      	r3, r8
     552:	9360      	ld.w      	r3, (r3, 0)
     554:	5b42      	addi      	r2, r3, 1
     556:	3300      	movi      	r3, 0
     558:	2b17      	subi      	r3, 24
     55a:	60e0      	addu      	r3, r8
     55c:	b340      	st.w      	r2, (r3, 0)
     55e:	3300      	movi      	r3, 0
     560:	2b17      	subi      	r3, 24
     562:	60e0      	addu      	r3, r8
     564:	9340      	ld.w      	r2, (r3, 0)
     566:	3363      	movi      	r3, 99
     568:	648c      	cmphs      	r3, r2
     56a:	0bf1      	bt      	0x54c	// 54c <dw_syscon_systemclock_config+0x370>
        handle->SCLKCR = ((hclk_div<<8)|SCLKCR_KEY);
     56c:	3300      	movi      	r3, 0
     56e:	2b0b      	subi      	r3, 12
     570:	60e0      	addu      	r3, r8
     572:	9360      	ld.w      	r3, (r3, 0)
     574:	4348      	lsli      	r2, r3, 8
     576:	106e      	lrw      	r3, 0xd22d0000	// 5ac <dw_syscon_systemclock_config+0x3d0>
     578:	6c8c      	or      	r2, r3
     57a:	3300      	movi      	r3, 0
     57c:	2b1b      	subi      	r3, 28
     57e:	60e0      	addu      	r3, r8
     580:	9360      	ld.w      	r3, (r3, 0)
     582:	b347      	st.w      	r2, (r3, 0x1c)
        for (i=0;i<10;i++);
     584:	3300      	movi      	r3, 0
     586:	2b17      	subi      	r3, 24
     588:	60e0      	addu      	r3, r8
     58a:	3200      	movi      	r2, 0
     58c:	0412      	br      	0x5b0	// 5b0 <dw_syscon_systemclock_config+0x3d4>
     58e:	0000      	bkpt
     590:	00000000 	.long	0x00000000
     594:	02625a00 	.long	0x02625a00
     598:	01312d00 	.long	0x01312d00
     59c:	007a1200 	.long	0x007a1200
     5a0:	002dc6c0 	.long	0x002dc6c0
     5a4:	00000000 	.long	0x00000000
     5a8:	d22d0004 	.long	0xd22d0004
     5ac:	d22d0000 	.long	0xd22d0000
     5b0:	b340      	st.w      	r2, (r3, 0)
     5b2:	040a      	br      	0x5c6	// 5c6 <dw_syscon_systemclock_config+0x3ea>
     5b4:	3300      	movi      	r3, 0
     5b6:	2b17      	subi      	r3, 24
     5b8:	60e0      	addu      	r3, r8
     5ba:	9360      	ld.w      	r3, (r3, 0)
     5bc:	5b42      	addi      	r2, r3, 1
     5be:	3300      	movi      	r3, 0
     5c0:	2b17      	subi      	r3, 24
     5c2:	60e0      	addu      	r3, r8
     5c4:	b340      	st.w      	r2, (r3, 0)
     5c6:	3300      	movi      	r3, 0
     5c8:	2b17      	subi      	r3, 24
     5ca:	60e0      	addu      	r3, r8
     5cc:	9360      	ld.w      	r3, (r3, 0)
     5ce:	3b09      	cmphsi      	r3, 10
     5d0:	0ff2      	bf      	0x5b4	// 5b4 <dw_syscon_systemclock_config+0x3d8>
        if ((handle->ERRINF) & (1ul<<4)) {
     5d2:	3300      	movi      	r3, 0
     5d4:	2b1b      	subi      	r3, 28
     5d6:	60e0      	addu      	r3, r8
     5d8:	9360      	ld.w      	r3, (r3, 0)
     5da:	23eb      	addi      	r3, 236
     5dc:	9340      	ld.w      	r2, (r3, 0)
     5de:	3310      	movi      	r3, 16
     5e0:	68c8      	and      	r3, r2
     5e2:	3b40      	cmpnei      	r3, 0
     5e4:	0c7c      	bf      	0x6dc	// 6dc <dw_syscon_systemclock_config+0x500>
            return -2;
     5e6:	3300      	movi      	r3, 0
     5e8:	2b01      	subi      	r3, 2
     5ea:	0498      	br      	0x71a	// 71a <dw_syscon_systemclock_config+0x53e>
        }
    } else if (target_sysclk == SYSCLK_EMOSC) {
     5ec:	3300      	movi      	r3, 0
     5ee:	2b1f      	subi      	r3, 32
     5f0:	60e0      	addu      	r3, r8
     5f2:	9360      	ld.w      	r3, (r3, 0)
     5f4:	3b42      	cmpnei      	r3, 2
     5f6:	0837      	bt      	0x664	// 664 <dw_syscon_systemclock_config+0x488>
        handle->ERRINF = 0;
     5f8:	3300      	movi      	r3, 0
     5fa:	2b1b      	subi      	r3, 28
     5fc:	60e0      	addu      	r3, r8
     5fe:	9360      	ld.w      	r3, (r3, 0)
     600:	23eb      	addi      	r3, 236
     602:	3200      	movi      	r2, 0
     604:	b340      	st.w      	r2, (r3, 0)
        handle->SCLKCR = (1 | (hclk_div<<8) | SCLKCR_KEY); // switch to EMOSC as sysclk
     606:	3300      	movi      	r3, 0
     608:	2b0b      	subi      	r3, 12
     60a:	60e0      	addu      	r3, r8
     60c:	9360      	ld.w      	r3, (r3, 0)
     60e:	4348      	lsli      	r2, r3, 8
     610:	ea830123 	lrw      	r3, 0xd22d0001	// a9c <dw_syscon_iwdt_config+0x38>
     614:	6c8c      	or      	r2, r3
     616:	3300      	movi      	r3, 0
     618:	2b1b      	subi      	r3, 28
     61a:	60e0      	addu      	r3, r8
     61c:	9360      	ld.w      	r3, (r3, 0)
     61e:	b347      	st.w      	r2, (r3, 0x1c)
        for (i=0;i<10;i++);
     620:	3300      	movi      	r3, 0
     622:	2b17      	subi      	r3, 24
     624:	60e0      	addu      	r3, r8
     626:	3200      	movi      	r2, 0
     628:	b340      	st.w      	r2, (r3, 0)
     62a:	040a      	br      	0x63e	// 63e <dw_syscon_systemclock_config+0x462>
     62c:	3300      	movi      	r3, 0
     62e:	2b17      	subi      	r3, 24
     630:	60e0      	addu      	r3, r8
     632:	9360      	ld.w      	r3, (r3, 0)
     634:	5b42      	addi      	r2, r3, 1
     636:	3300      	movi      	r3, 0
     638:	2b17      	subi      	r3, 24
     63a:	60e0      	addu      	r3, r8
     63c:	b340      	st.w      	r2, (r3, 0)
     63e:	3300      	movi      	r3, 0
     640:	2b17      	subi      	r3, 24
     642:	60e0      	addu      	r3, r8
     644:	9360      	ld.w      	r3, (r3, 0)
     646:	3b09      	cmphsi      	r3, 10
     648:	0ff2      	bf      	0x62c	// 62c <dw_syscon_systemclock_config+0x450>
        if ((handle->ERRINF) & (1ul<<4)) {
     64a:	3300      	movi      	r3, 0
     64c:	2b1b      	subi      	r3, 28
     64e:	60e0      	addu      	r3, r8
     650:	9360      	ld.w      	r3, (r3, 0)
     652:	23eb      	addi      	r3, 236
     654:	9340      	ld.w      	r2, (r3, 0)
     656:	3310      	movi      	r3, 16
     658:	68c8      	and      	r3, r2
     65a:	3b40      	cmpnei      	r3, 0
     65c:	0c40      	bf      	0x6dc	// 6dc <dw_syscon_systemclock_config+0x500>
            return -2;
     65e:	3300      	movi      	r3, 0
     660:	2b01      	subi      	r3, 2
     662:	045c      	br      	0x71a	// 71a <dw_syscon_systemclock_config+0x53e>
        }
    } else if (target_sysclk == SYSCLK_ISOSC) {
     664:	3300      	movi      	r3, 0
     666:	2b1f      	subi      	r3, 32
     668:	60e0      	addu      	r3, r8
     66a:	9360      	ld.w      	r3, (r3, 0)
     66c:	3b43      	cmpnei      	r3, 3
     66e:	0837      	bt      	0x6dc	// 6dc <dw_syscon_systemclock_config+0x500>
        handle->ERRINF = 0;
     670:	3300      	movi      	r3, 0
     672:	2b1b      	subi      	r3, 28
     674:	60e0      	addu      	r3, r8
     676:	9360      	ld.w      	r3, (r3, 0)
     678:	23eb      	addi      	r3, 236
     67a:	3200      	movi      	r2, 0
     67c:	b340      	st.w      	r2, (r3, 0)
        handle->SCLKCR = (4 | (hclk_div<<8) | SCLKCR_KEY); // switch to ISOSC as sysclk
     67e:	3300      	movi      	r3, 0
     680:	2b0b      	subi      	r3, 12
     682:	60e0      	addu      	r3, r8
     684:	9360      	ld.w      	r3, (r3, 0)
     686:	4348      	lsli      	r2, r3, 8
     688:	ea830106 	lrw      	r3, 0xd22d0004	// aa0 <dw_syscon_iwdt_config+0x3c>
     68c:	6c8c      	or      	r2, r3
     68e:	3300      	movi      	r3, 0
     690:	2b1b      	subi      	r3, 28
     692:	60e0      	addu      	r3, r8
     694:	9360      	ld.w      	r3, (r3, 0)
     696:	b347      	st.w      	r2, (r3, 0x1c)
        for (i=0;i<10;i++);
     698:	3300      	movi      	r3, 0
     69a:	2b17      	subi      	r3, 24
     69c:	60e0      	addu      	r3, r8
     69e:	3200      	movi      	r2, 0
     6a0:	b340      	st.w      	r2, (r3, 0)
     6a2:	040a      	br      	0x6b6	// 6b6 <dw_syscon_systemclock_config+0x4da>
     6a4:	3300      	movi      	r3, 0
     6a6:	2b17      	subi      	r3, 24
     6a8:	60e0      	addu      	r3, r8
     6aa:	9360      	ld.w      	r3, (r3, 0)
     6ac:	5b42      	addi      	r2, r3, 1
     6ae:	3300      	movi      	r3, 0
     6b0:	2b17      	subi      	r3, 24
     6b2:	60e0      	addu      	r3, r8
     6b4:	b340      	st.w      	r2, (r3, 0)
     6b6:	3300      	movi      	r3, 0
     6b8:	2b17      	subi      	r3, 24
     6ba:	60e0      	addu      	r3, r8
     6bc:	9360      	ld.w      	r3, (r3, 0)
     6be:	3b09      	cmphsi      	r3, 10
     6c0:	0ff2      	bf      	0x6a4	// 6a4 <dw_syscon_systemclock_config+0x4c8>
        if ((handle->ERRINF) & (1ul<<4)) {
     6c2:	3300      	movi      	r3, 0
     6c4:	2b1b      	subi      	r3, 28
     6c6:	60e0      	addu      	r3, r8
     6c8:	9360      	ld.w      	r3, (r3, 0)
     6ca:	23eb      	addi      	r3, 236
     6cc:	9340      	ld.w      	r2, (r3, 0)
     6ce:	3310      	movi      	r3, 16
     6d0:	68c8      	and      	r3, r2
     6d2:	3b40      	cmpnei      	r3, 0
     6d4:	0c04      	bf      	0x6dc	// 6dc <dw_syscon_systemclock_config+0x500>
            return -2;
     6d6:	3300      	movi      	r3, 0
     6d8:	2b01      	subi      	r3, 2
     6da:	0420      	br      	0x71a	// 71a <dw_syscon_systemclock_config+0x53e>
        }
    }

    /* Setup PCLK divider */
    handle->PCLKCR = ((pclk_div<<8)|PCLKCR_KEY);
     6dc:	3300      	movi      	r3, 0
     6de:	2b0f      	subi      	r3, 16
     6e0:	60e0      	addu      	r3, r8
     6e2:	9360      	ld.w      	r3, (r3, 0)
     6e4:	4348      	lsli      	r2, r3, 8
     6e6:	006f      	lrw      	r3, 0xc33c0000	// aa4 <dw_syscon_iwdt_config+0x40>
     6e8:	6c8c      	or      	r2, r3
     6ea:	3300      	movi      	r3, 0
     6ec:	2b1b      	subi      	r3, 28
     6ee:	60e0      	addu      	r3, r8
     6f0:	9360      	ld.w      	r3, (r3, 0)
     6f2:	b348      	st.w      	r2, (r3, 0x20)

    /* Store config to global variables */
    _cur_sysclk = target_sysclk; 
     6f4:	0072      	lrw      	r3, 0	// aa8 <dw_syscon_iwdt_config+0x44>
     6f6:	3200      	movi      	r2, 0
     6f8:	2a1f      	subi      	r2, 32
     6fa:	60a0      	addu      	r2, r8
     6fc:	9240      	ld.w      	r2, (r2, 0)
     6fe:	b340      	st.w      	r2, (r3, 0)
    _cur_hclk_freq = target_hclk_freq;
     700:	0074      	lrw      	r3, 0	// aac <dw_syscon_iwdt_config+0x48>
     702:	3200      	movi      	r2, 0
     704:	2a07      	subi      	r2, 8
     706:	60a0      	addu      	r2, r8
     708:	9240      	ld.w      	r2, (r2, 0)
     70a:	b340      	st.w      	r2, (r3, 0)
    _cur_pclk_freq = target_pclk_freq;
     70c:	0076      	lrw      	r3, 0	// ab0 <dw_syscon_iwdt_config+0x4c>
     70e:	3200      	movi      	r2, 0
     710:	2a13      	subi      	r2, 20
     712:	60a0      	addu      	r2, r8
     714:	9240      	ld.w      	r2, (r2, 0)
     716:	b340      	st.w      	r2, (r3, 0)

    return 0;
     718:	3300      	movi      	r3, 0
}
     71a:	6c0f      	mov      	r0, r3
     71c:	6fa3      	mov      	sp, r8
     71e:	d9ee2002 	ld.w      	r15, (sp, 0x8)
     722:	d90e2001 	ld.w      	r8, (sp, 0x4)
     726:	9880      	ld.w      	r4, (sp, 0)
     728:	1403      	addi      	sp, sp, 12
     72a:	783c      	rts

0000072c <dw_syscon_set_individual_pclk_switch>:
                         defined as: PCLK_ENDIS_ADC/PCLK_ENDIS_UART0 ...
  \param[in]   pclk1_sel individual pclk target on PCLK1
  \return      negtive when assignment is not in right pclk domain
*/
int32_t dw_syscon_set_individual_pclk_switch(syscon_handle_t handle, bool status, uint32_t pclk0_sel, uint32_t pclk1_sel)
{
     72c:	1422      	subi      	sp, sp, 8
     72e:	b880      	st.w      	r4, (sp, 0)
     730:	dd0e2001 	st.w      	r8, (sp, 0x4)
     734:	6e3b      	mov      	r8, sp
     736:	1424      	subi      	sp, sp, 16
     738:	3400      	movi      	r4, 0
     73a:	2c03      	subi      	r4, 4
     73c:	6120      	addu      	r4, r8
     73e:	b400      	st.w      	r0, (r4, 0)
     740:	6c07      	mov      	r0, r1
     742:	3100      	movi      	r1, 0
     744:	290b      	subi      	r1, 12
     746:	6060      	addu      	r1, r8
     748:	b140      	st.w      	r2, (r1, 0)
     74a:	3200      	movi      	r2, 0
     74c:	2a0f      	subi      	r2, 16
     74e:	60a0      	addu      	r2, r8
     750:	b260      	st.w      	r3, (r2, 0)
     752:	3300      	movi      	r3, 0
     754:	2b04      	subi      	r3, 5
     756:	60e0      	addu      	r3, r8
     758:	6c83      	mov      	r2, r0
     75a:	a340      	st.b      	r2, (r3, 0)
    if ((pclk0_sel & (1ul<<31))||!(pclk1_sel & (1ul<<31))) {    // wrong setup of pclk domain assignment
     75c:	3300      	movi      	r3, 0
     75e:	2b0b      	subi      	r3, 12
     760:	60e0      	addu      	r3, r8
     762:	9360      	ld.w      	r3, (r3, 0)
     764:	3bdf      	btsti      	r3, 31
     766:	0807      	bt      	0x774	// 774 <dw_syscon_set_individual_pclk_switch+0x48>
     768:	3300      	movi      	r3, 0
     76a:	2b0f      	subi      	r3, 16
     76c:	60e0      	addu      	r3, r8
     76e:	9360      	ld.w      	r3, (r3, 0)
     770:	3bdf      	btsti      	r3, 31
     772:	0804      	bt      	0x77a	// 77a <dw_syscon_set_individual_pclk_switch+0x4e>
        return -1;
     774:	3300      	movi      	r3, 0
     776:	2b00      	subi      	r3, 1
     778:	042f      	br      	0x7d6	// 7d6 <dw_syscon_set_individual_pclk_switch+0xaa>
    }
    else {
        switch (status) {
     77a:	3300      	movi      	r3, 0
     77c:	2b04      	subi      	r3, 5
     77e:	60e0      	addu      	r3, r8
     780:	8360      	ld.b      	r3, (r3, 0)
     782:	74cc      	zextb      	r3, r3
     784:	3b41      	cmpnei      	r3, 1
     786:	0814      	bt      	0x7ae	// 7ae <dw_syscon_set_individual_pclk_switch+0x82>
            case true:  /*enable*/
                handle->PCER0 = pclk0_sel;
     788:	3300      	movi      	r3, 0
     78a:	2b03      	subi      	r3, 4
     78c:	60e0      	addu      	r3, r8
     78e:	9360      	ld.w      	r3, (r3, 0)
     790:	3200      	movi      	r2, 0
     792:	2a0b      	subi      	r2, 12
     794:	60a0      	addu      	r2, r8
     796:	9240      	ld.w      	r2, (r2, 0)
     798:	b34a      	st.w      	r2, (r3, 0x28)
                handle->PCER1 = pclk1_sel;
     79a:	3300      	movi      	r3, 0
     79c:	2b03      	subi      	r3, 4
     79e:	60e0      	addu      	r3, r8
     7a0:	9360      	ld.w      	r3, (r3, 0)
     7a2:	3200      	movi      	r2, 0
     7a4:	2a0f      	subi      	r2, 16
     7a6:	60a0      	addu      	r2, r8
     7a8:	9240      	ld.w      	r2, (r2, 0)
     7aa:	b34d      	st.w      	r2, (r3, 0x34)
                break;    
     7ac:	0414      	br      	0x7d4	// 7d4 <dw_syscon_set_individual_pclk_switch+0xa8>
            case false: /*disable*/
                handle->PCDR0 = pclk0_sel;
     7ae:	3300      	movi      	r3, 0
     7b0:	2b03      	subi      	r3, 4
     7b2:	60e0      	addu      	r3, r8
     7b4:	9360      	ld.w      	r3, (r3, 0)
     7b6:	3200      	movi      	r2, 0
     7b8:	2a0b      	subi      	r2, 12
     7ba:	60a0      	addu      	r2, r8
     7bc:	9240      	ld.w      	r2, (r2, 0)
     7be:	b34b      	st.w      	r2, (r3, 0x2c)
                handle->PCDR1 = pclk1_sel;
     7c0:	3300      	movi      	r3, 0
     7c2:	2b03      	subi      	r3, 4
     7c4:	60e0      	addu      	r3, r8
     7c6:	9360      	ld.w      	r3, (r3, 0)
     7c8:	3200      	movi      	r2, 0
     7ca:	2a0f      	subi      	r2, 16
     7cc:	60a0      	addu      	r2, r8
     7ce:	9240      	ld.w      	r2, (r2, 0)
     7d0:	b34e      	st.w      	r2, (r3, 0x38)
                break;
     7d2:	6c00      	or      	r0, r0
        }
    }

    return 0;
     7d4:	3300      	movi      	r3, 0
}
     7d6:	6c0f      	mov      	r0, r3
     7d8:	6fa3      	mov      	sp, r8
     7da:	d90e2001 	ld.w      	r8, (sp, 0x4)
     7de:	9880      	ld.w      	r4, (sp, 0)
     7e0:	1402      	addi      	sp, sp, 8
     7e2:	783c      	rts

000007e4 <dw_syscon_set_all_pclk_switch>:
  \param[in]   handle   syscon to be operate
  \param[in]   status   en/dis operation (enable is default)
  \return      negtive when assignment is not in right pclk domain
*/
void dw_syscon_set_all_pclk_switch(syscon_handle_t handle, bool status)
{
     7e4:	1421      	subi      	sp, sp, 4
     7e6:	dd0e2000 	st.w      	r8, (sp, 0)
     7ea:	6e3b      	mov      	r8, sp
     7ec:	1422      	subi      	sp, sp, 8
     7ee:	3300      	movi      	r3, 0
     7f0:	2b03      	subi      	r3, 4
     7f2:	60e0      	addu      	r3, r8
     7f4:	b300      	st.w      	r0, (r3, 0)
     7f6:	6c87      	mov      	r2, r1
     7f8:	3300      	movi      	r3, 0
     7fa:	2b04      	subi      	r3, 5
     7fc:	60e0      	addu      	r3, r8
     7fe:	a340      	st.b      	r2, (r3, 0)
    switch (status) {
     800:	3300      	movi      	r3, 0
     802:	2b04      	subi      	r3, 5
     804:	60e0      	addu      	r3, r8
     806:	8360      	ld.b      	r3, (r3, 0)
     808:	74cc      	zextb      	r3, r3
     80a:	3b41      	cmpnei      	r3, 1
     80c:	0810      	bt      	0x82c	// 82c <dw_syscon_set_all_pclk_switch+0x48>
        case true:  /*enable*/
            handle->PCER0 = 0xffffffff;
     80e:	3300      	movi      	r3, 0
     810:	2b03      	subi      	r3, 4
     812:	60e0      	addu      	r3, r8
     814:	9340      	ld.w      	r2, (r3, 0)
     816:	3300      	movi      	r3, 0
     818:	2b00      	subi      	r3, 1
     81a:	b26a      	st.w      	r3, (r2, 0x28)
            handle->PCER1 = 0xffffffff;
     81c:	3300      	movi      	r3, 0
     81e:	2b03      	subi      	r3, 4
     820:	60e0      	addu      	r3, r8
     822:	9340      	ld.w      	r2, (r3, 0)
     824:	3300      	movi      	r3, 0
     826:	2b00      	subi      	r3, 1
     828:	b26d      	st.w      	r3, (r2, 0x34)
            break;    
     82a:	0410      	br      	0x84a	// 84a <dw_syscon_set_all_pclk_switch+0x66>
        case false: /*disable*/
            handle->PCDR0 = 0xffffffff;
     82c:	3300      	movi      	r3, 0
     82e:	2b03      	subi      	r3, 4
     830:	60e0      	addu      	r3, r8
     832:	9340      	ld.w      	r2, (r3, 0)
     834:	3300      	movi      	r3, 0
     836:	2b00      	subi      	r3, 1
     838:	b26b      	st.w      	r3, (r2, 0x2c)
            handle->PCDR1 = 0xffffffff;
     83a:	3300      	movi      	r3, 0
     83c:	2b03      	subi      	r3, 4
     83e:	60e0      	addu      	r3, r8
     840:	9340      	ld.w      	r2, (r3, 0)
     842:	3300      	movi      	r3, 0
     844:	2b00      	subi      	r3, 1
     846:	b26e      	st.w      	r3, (r2, 0x38)
            break;
     848:	6c00      	or      	r0, r0
    }
}
     84a:	6c00      	or      	r0, r0
     84c:	6fa3      	mov      	sp, r8
     84e:	d90e2000 	ld.w      	r8, (sp, 0)
     852:	1401      	addi      	sp, sp, 4
     854:	783c      	rts
	...

00000858 <dw_syscon_set_clockmonitor_switch>:
  \param[in]   status   en/dis operation
  \param[in]   rst_on_fail  generate reset when fail or not  (disable is default)
  \return      None
*/
int32_t dw_syscon_set_clockmonitor_switch(syscon_handle_t handle, bool status, bool rst_on_fail)
{
     858:	1421      	subi      	sp, sp, 4
     85a:	dd0e2000 	st.w      	r8, (sp, 0)
     85e:	6e3b      	mov      	r8, sp
     860:	1422      	subi      	sp, sp, 8
     862:	3300      	movi      	r3, 0
     864:	2b03      	subi      	r3, 4
     866:	60e0      	addu      	r3, r8
     868:	b300      	st.w      	r0, (r3, 0)
     86a:	6c07      	mov      	r0, r1
     86c:	6c4b      	mov      	r1, r2
     86e:	3300      	movi      	r3, 0
     870:	2b04      	subi      	r3, 5
     872:	60e0      	addu      	r3, r8
     874:	6c83      	mov      	r2, r0
     876:	a340      	st.b      	r2, (r3, 0)
     878:	3300      	movi      	r3, 0
     87a:	2b05      	subi      	r3, 6
     87c:	60e0      	addu      	r3, r8
     87e:	6c87      	mov      	r2, r1
     880:	a340      	st.b      	r2, (r3, 0)
    if (!((handle->GCSR) & 1ul)) {
     882:	3300      	movi      	r3, 0
     884:	2b03      	subi      	r3, 4
     886:	60e0      	addu      	r3, r8
     888:	9360      	ld.w      	r3, (r3, 0)
     88a:	9343      	ld.w      	r2, (r3, 0xc)
     88c:	3301      	movi      	r3, 1
     88e:	68c8      	and      	r3, r2
     890:	3b40      	cmpnei      	r3, 0
     892:	0804      	bt      	0x89a	// 89a <dw_syscon_set_clockmonitor_switch+0x42>
        return -1;  // fail to setup clock monitor, due to isosc absence
     894:	3300      	movi      	r3, 0
     896:	2b00      	subi      	r3, 1
     898:	0454      	br      	0x940	// 940 <dw_syscon_set_clockmonitor_switch+0xe8>
    }

    handle->ERRINF = 0;
     89a:	3300      	movi      	r3, 0
     89c:	2b03      	subi      	r3, 4
     89e:	60e0      	addu      	r3, r8
     8a0:	9360      	ld.w      	r3, (r3, 0)
     8a2:	23eb      	addi      	r3, 236
     8a4:	3200      	movi      	r2, 0
     8a6:	b340      	st.w      	r2, (r3, 0)

    if ((status == APT_DEF_ENABLE) && (rst_on_fail == APT_DEF_ENABLE)) {
     8a8:	3300      	movi      	r3, 0
     8aa:	2b04      	subi      	r3, 5
     8ac:	60e0      	addu      	r3, r8
     8ae:	8360      	ld.b      	r3, (r3, 0)
     8b0:	74cc      	zextb      	r3, r3
     8b2:	3b40      	cmpnei      	r3, 0
     8b4:	0c10      	bf      	0x8d4	// 8d4 <dw_syscon_set_clockmonitor_switch+0x7c>
     8b6:	3300      	movi      	r3, 0
     8b8:	2b05      	subi      	r3, 6
     8ba:	60e0      	addu      	r3, r8
     8bc:	8360      	ld.b      	r3, (r3, 0)
     8be:	74cc      	zextb      	r3, r3
     8c0:	3b40      	cmpnei      	r3, 0
     8c2:	0c09      	bf      	0x8d4	// 8d4 <dw_syscon_set_clockmonitor_switch+0x7c>
        handle->GCER = (1ul<<18) | (1ul<<19);
     8c4:	3300      	movi      	r3, 0
     8c6:	2b03      	subi      	r3, 4
     8c8:	60e0      	addu      	r3, r8
     8ca:	9340      	ld.w      	r2, (r3, 0)
     8cc:	33c0      	movi      	r3, 192
     8ce:	436c      	lsli      	r3, r3, 12
     8d0:	b261      	st.w      	r3, (r2, 0x4)
     8d2:	0428      	br      	0x922	// 922 <dw_syscon_set_clockmonitor_switch+0xca>
    }
    else if ((status == APT_DEF_ENABLE) && (rst_on_fail == APT_DEF_DISABLE)) {
     8d4:	3300      	movi      	r3, 0
     8d6:	2b04      	subi      	r3, 5
     8d8:	60e0      	addu      	r3, r8
     8da:	8360      	ld.b      	r3, (r3, 0)
     8dc:	74cc      	zextb      	r3, r3
     8de:	3b40      	cmpnei      	r3, 0
     8e0:	0c1a      	bf      	0x914	// 914 <dw_syscon_set_clockmonitor_switch+0xbc>
     8e2:	3300      	movi      	r3, 0
     8e4:	2b05      	subi      	r3, 6
     8e6:	60e0      	addu      	r3, r8
     8e8:	8340      	ld.b      	r2, (r3, 0)
     8ea:	3301      	movi      	r3, 1
     8ec:	6c8d      	xor      	r2, r3
     8ee:	6ccb      	mov      	r3, r2
     8f0:	74cc      	zextb      	r3, r3
     8f2:	3b40      	cmpnei      	r3, 0
     8f4:	0c10      	bf      	0x914	// 914 <dw_syscon_set_clockmonitor_switch+0xbc>
        handle->GCER = (1ul<<18) ;
     8f6:	3300      	movi      	r3, 0
     8f8:	2b03      	subi      	r3, 4
     8fa:	60e0      	addu      	r3, r8
     8fc:	9340      	ld.w      	r2, (r3, 0)
     8fe:	3380      	movi      	r3, 128
     900:	436b      	lsli      	r3, r3, 11
     902:	b261      	st.w      	r3, (r2, 0x4)
        handle->GCDR = (1ul<<19) ;
     904:	3300      	movi      	r3, 0
     906:	2b03      	subi      	r3, 4
     908:	60e0      	addu      	r3, r8
     90a:	9340      	ld.w      	r2, (r3, 0)
     90c:	3380      	movi      	r3, 128
     90e:	436c      	lsli      	r3, r3, 12
     910:	b262      	st.w      	r3, (r2, 0x8)
     912:	0408      	br      	0x922	// 922 <dw_syscon_set_clockmonitor_switch+0xca>
    }
    else {
        handle->GCDR = (1ul<<18) | (1ul<<19) ;
     914:	3300      	movi      	r3, 0
     916:	2b03      	subi      	r3, 4
     918:	60e0      	addu      	r3, r8
     91a:	9340      	ld.w      	r2, (r3, 0)
     91c:	33c0      	movi      	r3, 192
     91e:	436c      	lsli      	r3, r3, 12
     920:	b262      	st.w      	r3, (r2, 0x8)
    }

    if ((handle->ERRINF) & (1ul<<11)) {
     922:	3300      	movi      	r3, 0
     924:	2b03      	subi      	r3, 4
     926:	60e0      	addu      	r3, r8
     928:	9360      	ld.w      	r3, (r3, 0)
     92a:	23eb      	addi      	r3, 236
     92c:	9340      	ld.w      	r2, (r3, 0)
     92e:	3380      	movi      	r3, 128
     930:	4364      	lsli      	r3, r3, 4
     932:	68c8      	and      	r3, r2
     934:	3b40      	cmpnei      	r3, 0
     936:	0c04      	bf      	0x93e	// 93e <dw_syscon_set_clockmonitor_switch+0xe6>
        return -2;
     938:	3300      	movi      	r3, 0
     93a:	2b01      	subi      	r3, 2
     93c:	0402      	br      	0x940	// 940 <dw_syscon_set_clockmonitor_switch+0xe8>
    }
    else {
        return 0;
     93e:	3300      	movi      	r3, 0
    }
}
     940:	6c0f      	mov      	r0, r3
     942:	6fa3      	mov      	sp, r8
     944:	d90e2000 	ld.w      	r8, (sp, 0)
     948:	1401      	addi      	sp, sp, 4
     94a:	783c      	rts

0000094c <dw_syscon_pclk_active_under_sleep>:
  \param[in]   handle   syscon to be operate
  \param[in]   status   en/dis operation (enable is default)
  \return      None
*/
void dw_syscon_pclk_active_under_sleep(syscon_handle_t handle, bool status)
{
     94c:	1421      	subi      	sp, sp, 4
     94e:	dd0e2000 	st.w      	r8, (sp, 0)
     952:	6e3b      	mov      	r8, sp
     954:	1422      	subi      	sp, sp, 8
     956:	3300      	movi      	r3, 0
     958:	2b03      	subi      	r3, 4
     95a:	60e0      	addu      	r3, r8
     95c:	b300      	st.w      	r0, (r3, 0)
     95e:	6c87      	mov      	r2, r1
     960:	3300      	movi      	r3, 0
     962:	2b04      	subi      	r3, 5
     964:	60e0      	addu      	r3, r8
     966:	a340      	st.b      	r2, (r3, 0)
    if (status == APT_DEF_ENABLE) {
     968:	3300      	movi      	r3, 0
     96a:	2b04      	subi      	r3, 5
     96c:	60e0      	addu      	r3, r8
     96e:	8360      	ld.b      	r3, (r3, 0)
     970:	74cc      	zextb      	r3, r3
     972:	3b40      	cmpnei      	r3, 0
     974:	0c09      	bf      	0x986	// 986 <dw_syscon_pclk_active_under_sleep+0x3a>
        handle->GCER = (1ul<<8);
     976:	3300      	movi      	r3, 0
     978:	2b03      	subi      	r3, 4
     97a:	60e0      	addu      	r3, r8
     97c:	9340      	ld.w      	r2, (r3, 0)
     97e:	3380      	movi      	r3, 128
     980:	4361      	lsli      	r3, r3, 1
     982:	b261      	st.w      	r3, (r2, 0x4)
    } 
    else {
        handle->GCDR = (1ul<<8);
    }
}
     984:	0408      	br      	0x994	// 994 <dw_syscon_pclk_active_under_sleep+0x48>
        handle->GCDR = (1ul<<8);
     986:	3300      	movi      	r3, 0
     988:	2b03      	subi      	r3, 4
     98a:	60e0      	addu      	r3, r8
     98c:	9340      	ld.w      	r2, (r3, 0)
     98e:	3380      	movi      	r3, 128
     990:	4361      	lsli      	r3, r3, 1
     992:	b262      	st.w      	r3, (r2, 0x8)
}
     994:	6c00      	or      	r0, r0
     996:	6fa3      	mov      	sp, r8
     998:	d90e2000 	ld.w      	r8, (sp, 0)
     99c:	1401      	addi      	sp, sp, 4
     99e:	783c      	rts

000009a0 <dw_syscon_set_iwdt_switch>:
  \param[in]   handle   syscon to be operate
  \param[in]   status   en/dis operation(disable is default)
  \return      None
*/
void dw_syscon_set_iwdt_switch(syscon_handle_t handle, bool status)
{
     9a0:	1421      	subi      	sp, sp, 4
     9a2:	dd0e2000 	st.w      	r8, (sp, 0)
     9a6:	6e3b      	mov      	r8, sp
     9a8:	1422      	subi      	sp, sp, 8
     9aa:	3300      	movi      	r3, 0
     9ac:	2b03      	subi      	r3, 4
     9ae:	60e0      	addu      	r3, r8
     9b0:	b300      	st.w      	r0, (r3, 0)
     9b2:	6c87      	mov      	r2, r1
     9b4:	3300      	movi      	r3, 0
     9b6:	2b04      	subi      	r3, 5
     9b8:	60e0      	addu      	r3, r8
     9ba:	a340      	st.b      	r2, (r3, 0)
    if (status == APT_DEF_ENABLE) {
     9bc:	3300      	movi      	r3, 0
     9be:	2b04      	subi      	r3, 5
     9c0:	60e0      	addu      	r3, r8
     9c2:	8360      	ld.b      	r3, (r3, 0)
     9c4:	74cc      	zextb      	r3, r3
     9c6:	3b40      	cmpnei      	r3, 0
     9c8:	0c09      	bf      	0x9da	// 9da <dw_syscon_set_iwdt_switch+0x3a>
        handle->IWDEDR = IWDEDR_KEY ;
     9ca:	3300      	movi      	r3, 0
     9cc:	2b03      	subi      	r3, 4
     9ce:	60e0      	addu      	r3, r8
     9d0:	9360      	ld.w      	r3, (r3, 0)
     9d2:	23bb      	addi      	r3, 188
     9d4:	1158      	lrw      	r2, 0x78870000	// ab4 <dw_syscon_iwdt_config+0x50>
     9d6:	b340      	st.w      	r2, (r3, 0)
    } 
    else {
        handle->IWDEDR = IWDEDR_KEY | 0x5555;
    }
}
     9d8:	0408      	br      	0x9e8	// 9e8 <dw_syscon_set_iwdt_switch+0x48>
        handle->IWDEDR = IWDEDR_KEY | 0x5555;
     9da:	3300      	movi      	r3, 0
     9dc:	2b03      	subi      	r3, 4
     9de:	60e0      	addu      	r3, r8
     9e0:	9360      	ld.w      	r3, (r3, 0)
     9e2:	23bb      	addi      	r3, 188
     9e4:	1155      	lrw      	r2, 0x78875555	// ab8 <dw_syscon_iwdt_config+0x54>
     9e6:	b340      	st.w      	r2, (r3, 0)
}
     9e8:	6c00      	or      	r0, r0
     9ea:	6fa3      	mov      	sp, r8
     9ec:	d90e2000 	ld.w      	r8, (sp, 0)
     9f0:	1401      	addi      	sp, sp, 4
     9f2:	783c      	rts

000009f4 <dw_syscon_iwdt_reload>:
  \brief       Reload iwdt
  \param[in]   handle   syscon to be operate
  \return      None
*/
void dw_syscon_iwdt_reload(syscon_handle_t handle)
{
     9f4:	1421      	subi      	sp, sp, 4
     9f6:	dd0e2000 	st.w      	r8, (sp, 0)
     9fa:	6e3b      	mov      	r8, sp
     9fc:	1422      	subi      	sp, sp, 8
     9fe:	3300      	movi      	r3, 0
     a00:	2b07      	subi      	r3, 8
     a02:	60e0      	addu      	r3, r8
     a04:	b300      	st.w      	r0, (r3, 0)
    volatile uint32_t i;
    handle->IWDCNT = (0x5Aul<<24);
     a06:	3300      	movi      	r3, 0
     a08:	2b07      	subi      	r3, 8
     a0a:	60e0      	addu      	r3, r8
     a0c:	9360      	ld.w      	r3, (r3, 0)
     a0e:	23b7      	addi      	r3, 184
     a10:	6c8f      	mov      	r2, r3
     a12:	33b4      	movi      	r3, 180
     a14:	4377      	lsli      	r3, r3, 23
     a16:	b260      	st.w      	r3, (r2, 0)
    for (i=0;i<100;i++);
     a18:	3300      	movi      	r3, 0
     a1a:	2b03      	subi      	r3, 4
     a1c:	60e0      	addu      	r3, r8
     a1e:	3200      	movi      	r2, 0
     a20:	b340      	st.w      	r2, (r3, 0)
     a22:	040a      	br      	0xa36	// a36 <dw_syscon_iwdt_reload+0x42>
     a24:	3300      	movi      	r3, 0
     a26:	2b03      	subi      	r3, 4
     a28:	60e0      	addu      	r3, r8
     a2a:	9360      	ld.w      	r3, (r3, 0)
     a2c:	5b42      	addi      	r2, r3, 1
     a2e:	3300      	movi      	r3, 0
     a30:	2b03      	subi      	r3, 4
     a32:	60e0      	addu      	r3, r8
     a34:	b340      	st.w      	r2, (r3, 0)
     a36:	3300      	movi      	r3, 0
     a38:	2b03      	subi      	r3, 4
     a3a:	60e0      	addu      	r3, r8
     a3c:	9340      	ld.w      	r2, (r3, 0)
     a3e:	3363      	movi      	r3, 99
     a40:	648c      	cmphs      	r3, r2
     a42:	0bf1      	bt      	0xa24	// a24 <dw_syscon_iwdt_reload+0x30>
    while ((handle->IWDCNT) & (1ul<<31));
     a44:	6c00      	or      	r0, r0
     a46:	3300      	movi      	r3, 0
     a48:	2b07      	subi      	r3, 8
     a4a:	60e0      	addu      	r3, r8
     a4c:	9360      	ld.w      	r3, (r3, 0)
     a4e:	23b7      	addi      	r3, 184
     a50:	9360      	ld.w      	r3, (r3, 0)
     a52:	3bdf      	btsti      	r3, 31
     a54:	0bf9      	bt      	0xa46	// a46 <dw_syscon_iwdt_reload+0x52>
}
     a56:	6c00      	or      	r0, r0
     a58:	6fa3      	mov      	sp, r8
     a5a:	d90e2000 	ld.w      	r8, (sp, 0)
     a5e:	1401      	addi      	sp, sp, 4
     a60:	783c      	rts
	...

00000a64 <dw_syscon_iwdt_config>:
  \param[in]   iwdt_ovt overflow time config
  \param[in]   iwdt_wnd alarm window time config
  \return      None
*/
void dw_syscon_iwdt_config(syscon_handle_t handle, iwdt_ovt_t iwdt_ovt, iwdt_wnd_t iwdt_wnd)
{
     a64:	1421      	subi      	sp, sp, 4
     a66:	dd0e2000 	st.w      	r8, (sp, 0)
     a6a:	6e3b      	mov      	r8, sp
     a6c:	1423      	subi      	sp, sp, 12
     a6e:	3300      	movi      	r3, 0
     a70:	2b03      	subi      	r3, 4
     a72:	60e0      	addu      	r3, r8
     a74:	b300      	st.w      	r0, (r3, 0)
     a76:	3300      	movi      	r3, 0
     a78:	2b07      	subi      	r3, 8
     a7a:	60e0      	addu      	r3, r8
     a7c:	b320      	st.w      	r1, (r3, 0)
     a7e:	3300      	movi      	r3, 0
     a80:	2b0b      	subi      	r3, 12
     a82:	60e0      	addu      	r3, r8
     a84:	b340      	st.w      	r2, (r3, 0)
    handle->IWDCR = (iwdt_ovt << 8) | (iwdt_wnd << 2) | (0x8778ul << 16);
     a86:	3300      	movi      	r3, 0
     a88:	2b07      	subi      	r3, 8
     a8a:	60e0      	addu      	r3, r8
     a8c:	9360      	ld.w      	r3, (r3, 0)
     a8e:	4348      	lsli      	r2, r3, 8
     a90:	3300      	movi      	r3, 0
     a92:	2b0b      	subi      	r3, 12
     a94:	60e0      	addu      	r3, r8
     a96:	9360      	ld.w      	r3, (r3, 0)
     a98:	0412      	br      	0xabc	// abc <dw_syscon_iwdt_config+0x58>
     a9a:	0000      	bkpt
     a9c:	d22d0001 	.long	0xd22d0001
     aa0:	d22d0004 	.long	0xd22d0004
     aa4:	c33c0000 	.long	0xc33c0000
	...
     ab4:	78870000 	.long	0x78870000
     ab8:	78875555 	.long	0x78875555
     abc:	4362      	lsli      	r3, r3, 2
     abe:	6c8c      	or      	r2, r3
     ac0:	ea830133 	lrw      	r3, 0x87780000	// f8c <dw_syscon_clear_interrupt_pending+0x3c>
     ac4:	6c8c      	or      	r2, r3
     ac6:	3300      	movi      	r3, 0
     ac8:	2b03      	subi      	r3, 4
     aca:	60e0      	addu      	r3, r8
     acc:	9360      	ld.w      	r3, (r3, 0)
     ace:	23b3      	addi      	r3, 180
     ad0:	b340      	st.w      	r2, (r3, 0)
}
     ad2:	6c00      	or      	r0, r0
     ad4:	6fa3      	mov      	sp, r8
     ad6:	d90e2000 	ld.w      	r8, (sp, 0)
     ada:	1401      	addi      	sp, sp, 4
     adc:	783c      	rts
	...

00000ae0 <dw_syscon_lvd_config>:
  \param[in]   lvd_intlvl interrupt level selection
  \param[in]   lvd_rstlvl reset level selection (LVD_RSTAT2P15 is default)
  \return      None
*/
void dw_syscon_lvd_config(syscon_handle_t handle, lvd_intlvl_t lvd_intlvl, lvd_rstlvl_t lvd_rstlvl)
{
     ae0:	1421      	subi      	sp, sp, 4
     ae2:	dd0e2000 	st.w      	r8, (sp, 0)
     ae6:	6e3b      	mov      	r8, sp
     ae8:	1423      	subi      	sp, sp, 12
     aea:	3300      	movi      	r3, 0
     aec:	2b03      	subi      	r3, 4
     aee:	60e0      	addu      	r3, r8
     af0:	b300      	st.w      	r0, (r3, 0)
     af2:	3300      	movi      	r3, 0
     af4:	2b07      	subi      	r3, 8
     af6:	60e0      	addu      	r3, r8
     af8:	b320      	st.w      	r1, (r3, 0)
     afa:	3300      	movi      	r3, 0
     afc:	2b0b      	subi      	r3, 12
     afe:	60e0      	addu      	r3, r8
     b00:	b340      	st.w      	r2, (r3, 0)
    if (lvd_intlvl == LVD_INTDIS) {
     b02:	3300      	movi      	r3, 0
     b04:	2b07      	subi      	r3, 8
     b06:	60e0      	addu      	r3, r8
     b08:	9360      	ld.w      	r3, (r3, 0)
     b0a:	3b44      	cmpnei      	r3, 4
     b0c:	0817      	bt      	0xb3a	// b3a <dw_syscon_lvd_config+0x5a>
        handle->LVDCR = ((handle->LVDCR) & 0xf) | (0<<11) | (lvd_rstlvl<<12) | LVDCR_KEY;
     b0e:	3300      	movi      	r3, 0
     b10:	2b03      	subi      	r3, 4
     b12:	60e0      	addu      	r3, r8
     b14:	9360      	ld.w      	r3, (r3, 0)
     b16:	9353      	ld.w      	r2, (r3, 0x4c)
     b18:	330f      	movi      	r3, 15
     b1a:	688c      	and      	r2, r3
     b1c:	3300      	movi      	r3, 0
     b1e:	2b0b      	subi      	r3, 12
     b20:	60e0      	addu      	r3, r8
     b22:	9360      	ld.w      	r3, (r3, 0)
     b24:	436c      	lsli      	r3, r3, 12
     b26:	6c8c      	or      	r2, r3
     b28:	ea83011a 	lrw      	r3, 0xb44b0000	// f90 <dw_syscon_clear_interrupt_pending+0x40>
     b2c:	6c8c      	or      	r2, r3
     b2e:	3300      	movi      	r3, 0
     b30:	2b03      	subi      	r3, 4
     b32:	60e0      	addu      	r3, r8
     b34:	9360      	ld.w      	r3, (r3, 0)
     b36:	b353      	st.w      	r2, (r3, 0x4c)
    }
    else {
        handle->LVDCR = ((handle->LVDCR) & 0xf) | (1ul<<11) | (lvd_intlvl<<8) | (lvd_rstlvl<<12) | LVDCR_KEY;
    }

}
     b38:	041c      	br      	0xb70	// b70 <dw_syscon_lvd_config+0x90>
        handle->LVDCR = ((handle->LVDCR) & 0xf) | (1ul<<11) | (lvd_intlvl<<8) | (lvd_rstlvl<<12) | LVDCR_KEY;
     b3a:	3300      	movi      	r3, 0
     b3c:	2b03      	subi      	r3, 4
     b3e:	60e0      	addu      	r3, r8
     b40:	9360      	ld.w      	r3, (r3, 0)
     b42:	9353      	ld.w      	r2, (r3, 0x4c)
     b44:	330f      	movi      	r3, 15
     b46:	688c      	and      	r2, r3
     b48:	3300      	movi      	r3, 0
     b4a:	2b07      	subi      	r3, 8
     b4c:	60e0      	addu      	r3, r8
     b4e:	9360      	ld.w      	r3, (r3, 0)
     b50:	4368      	lsli      	r3, r3, 8
     b52:	6c8c      	or      	r2, r3
     b54:	3300      	movi      	r3, 0
     b56:	2b0b      	subi      	r3, 12
     b58:	60e0      	addu      	r3, r8
     b5a:	9360      	ld.w      	r3, (r3, 0)
     b5c:	436c      	lsli      	r3, r3, 12
     b5e:	6c8c      	or      	r2, r3
     b60:	ea83010d 	lrw      	r3, 0xb44b0800	// f94 <dw_syscon_clear_interrupt_pending+0x44>
     b64:	6c8c      	or      	r2, r3
     b66:	3300      	movi      	r3, 0
     b68:	2b03      	subi      	r3, 4
     b6a:	60e0      	addu      	r3, r8
     b6c:	9360      	ld.w      	r3, (r3, 0)
     b6e:	b353      	st.w      	r2, (r3, 0x4c)
}
     b70:	6c00      	or      	r0, r0
     b72:	6fa3      	mov      	sp, r8
     b74:	d90e2000 	ld.w      	r8, (sp, 0)
     b78:	1401      	addi      	sp, sp, 4
     b7a:	783c      	rts

00000b7c <dw_syscon_set_lvd_switch>:
  \param[in]   handle   syscon to be operate
  \param[in]   status   en/dis operation(APT_DEF_ENABLE is default)
  \return      None
*/
void dw_syscon_set_lvd_switch(syscon_handle_t handle, bool status)
{
     b7c:	1421      	subi      	sp, sp, 4
     b7e:	dd0e2000 	st.w      	r8, (sp, 0)
     b82:	6e3b      	mov      	r8, sp
     b84:	1422      	subi      	sp, sp, 8
     b86:	3300      	movi      	r3, 0
     b88:	2b03      	subi      	r3, 4
     b8a:	60e0      	addu      	r3, r8
     b8c:	b300      	st.w      	r0, (r3, 0)
     b8e:	6c87      	mov      	r2, r1
     b90:	3300      	movi      	r3, 0
     b92:	2b04      	subi      	r3, 5
     b94:	60e0      	addu      	r3, r8
     b96:	a340      	st.b      	r2, (r3, 0)
    if (status == APT_DEF_ENABLE) {
     b98:	3300      	movi      	r3, 0
     b9a:	2b04      	subi      	r3, 5
     b9c:	60e0      	addu      	r3, r8
     b9e:	8360      	ld.b      	r3, (r3, 0)
     ba0:	74cc      	zextb      	r3, r3
     ba2:	3b40      	cmpnei      	r3, 0
     ba4:	0c11      	bf      	0xbc6	// bc6 <dw_syscon_set_lvd_switch+0x4a>
        handle->LVDCR = LVDCR_KEY | ((handle->LVDCR) & ~0xf) ;
     ba6:	3300      	movi      	r3, 0
     ba8:	2b03      	subi      	r3, 4
     baa:	60e0      	addu      	r3, r8
     bac:	9360      	ld.w      	r3, (r3, 0)
     bae:	9353      	ld.w      	r2, (r3, 0x4c)
     bb0:	0065      	lrw      	r3, 0x4bb50000	// f98 <dw_syscon_clear_interrupt_pending+0x48>
     bb2:	2b0f      	subi      	r3, 16
     bb4:	688c      	and      	r2, r3
     bb6:	0068      	lrw      	r3, 0xb44b0000	// f90 <dw_syscon_clear_interrupt_pending+0x40>
     bb8:	6c8c      	or      	r2, r3
     bba:	3300      	movi      	r3, 0
     bbc:	2b03      	subi      	r3, 4
     bbe:	60e0      	addu      	r3, r8
     bc0:	9360      	ld.w      	r3, (r3, 0)
     bc2:	b353      	st.w      	r2, (r3, 0x4c)
    } 
    else {
        handle->LVDCR = LVDCR_KEY | ((handle->LVDCR) | 0xa);
    }
}
     bc4:	040d      	br      	0xbde	// bde <dw_syscon_set_lvd_switch+0x62>
        handle->LVDCR = LVDCR_KEY | ((handle->LVDCR) | 0xa);
     bc6:	3300      	movi      	r3, 0
     bc8:	2b03      	subi      	r3, 4
     bca:	60e0      	addu      	r3, r8
     bcc:	9360      	ld.w      	r3, (r3, 0)
     bce:	9353      	ld.w      	r2, (r3, 0x4c)
     bd0:	006c      	lrw      	r3, 0xb44b000a	// f9c <dw_syscon_clear_interrupt_pending+0x4c>
     bd2:	6c8c      	or      	r2, r3
     bd4:	3300      	movi      	r3, 0
     bd6:	2b03      	subi      	r3, 4
     bd8:	60e0      	addu      	r3, r8
     bda:	9360      	ld.w      	r3, (r3, 0)
     bdc:	b353      	st.w      	r2, (r3, 0x4c)
}
     bde:	6c00      	or      	r0, r0
     be0:	6fa3      	mov      	sp, r8
     be2:	d90e2000 	ld.w      	r8, (sp, 0)
     be6:	1401      	addi      	sp, sp, 4
     be8:	783c      	rts
	...

00000bec <dw_syscon_get_lvd_status>:
  \param[in]   iwdt_ovt overflow time config
  \param[in]   iwdt_wnd alarm window time config
  \return      None
*/
bool dw_syscon_get_lvd_status(syscon_handle_t handle)
{
     bec:	1421      	subi      	sp, sp, 4
     bee:	dd0e2000 	st.w      	r8, (sp, 0)
     bf2:	6e3b      	mov      	r8, sp
     bf4:	1422      	subi      	sp, sp, 8
     bf6:	3300      	movi      	r3, 0
     bf8:	2b07      	subi      	r3, 8
     bfa:	60e0      	addu      	r3, r8
     bfc:	b300      	st.w      	r0, (r3, 0)
    bool lvd_flag;
    if ((handle->LVDCR) & (1ul<<15)) {
     bfe:	3300      	movi      	r3, 0
     c00:	2b07      	subi      	r3, 8
     c02:	60e0      	addu      	r3, r8
     c04:	9360      	ld.w      	r3, (r3, 0)
     c06:	9353      	ld.w      	r2, (r3, 0x4c)
     c08:	3380      	movi      	r3, 128
     c0a:	4368      	lsli      	r3, r3, 8
     c0c:	68c8      	and      	r3, r2
     c0e:	3b40      	cmpnei      	r3, 0
     c10:	0c07      	bf      	0xc1e	// c1e <dw_syscon_get_lvd_status+0x32>
        lvd_flag = true;
     c12:	3300      	movi      	r3, 0
     c14:	2b00      	subi      	r3, 1
     c16:	60e0      	addu      	r3, r8
     c18:	3201      	movi      	r2, 1
     c1a:	a340      	st.b      	r2, (r3, 0)
     c1c:	0406      	br      	0xc28	// c28 <dw_syscon_get_lvd_status+0x3c>
    }
    else {
        lvd_flag = false;
     c1e:	3300      	movi      	r3, 0
     c20:	2b00      	subi      	r3, 1
     c22:	60e0      	addu      	r3, r8
     c24:	3200      	movi      	r2, 0
     c26:	a340      	st.b      	r2, (r3, 0)
    }
    
    return lvd_flag;
     c28:	3300      	movi      	r3, 0
     c2a:	2b00      	subi      	r3, 1
     c2c:	60e0      	addu      	r3, r8
     c2e:	8360      	ld.b      	r3, (r3, 0)
     c30:	74cc      	zextb      	r3, r3
}
     c32:	6c0f      	mov      	r0, r3
     c34:	6fa3      	mov      	sp, r8
     c36:	d90e2000 	ld.w      	r8, (sp, 0)
     c3a:	1401      	addi      	sp, sp, 4
     c3c:	783c      	rts
	...

00000c40 <dw_syscon_exi_set_rising>:
  \param[in]   exi_sel:  exi line to be set
  \param[in]   status:   enable/disable control(APT_DEF_ENABLE is default)
  \return      current setup of falling edge config
*/
uint32_t dw_syscon_exi_set_rising(syscon_handle_t handle, uint32_t exi_sel, bool status)
{
     c40:	1421      	subi      	sp, sp, 4
     c42:	dd0e2000 	st.w      	r8, (sp, 0)
     c46:	6e3b      	mov      	r8, sp
     c48:	1423      	subi      	sp, sp, 12
     c4a:	3300      	movi      	r3, 0
     c4c:	2b03      	subi      	r3, 4
     c4e:	60e0      	addu      	r3, r8
     c50:	b300      	st.w      	r0, (r3, 0)
     c52:	3300      	movi      	r3, 0
     c54:	2b07      	subi      	r3, 8
     c56:	60e0      	addu      	r3, r8
     c58:	b320      	st.w      	r1, (r3, 0)
     c5a:	3300      	movi      	r3, 0
     c5c:	2b08      	subi      	r3, 9
     c5e:	60e0      	addu      	r3, r8
     c60:	a340      	st.b      	r2, (r3, 0)
    if (status == APT_DEF_ENABLE) { /* select as rising edge*/
     c62:	3300      	movi      	r3, 0
     c64:	2b08      	subi      	r3, 9
     c66:	60e0      	addu      	r3, r8
     c68:	8360      	ld.b      	r3, (r3, 0)
     c6a:	74cc      	zextb      	r3, r3
     c6c:	3b40      	cmpnei      	r3, 0
     c6e:	0c13      	bf      	0xc94	// c94 <dw_syscon_exi_set_rising+0x54>
        handle->EXIRT |= exi_sel;
     c70:	3300      	movi      	r3, 0
     c72:	2b03      	subi      	r3, 4
     c74:	60e0      	addu      	r3, r8
     c76:	9360      	ld.w      	r3, (r3, 0)
     c78:	2393      	addi      	r3, 148
     c7a:	9340      	ld.w      	r2, (r3, 0)
     c7c:	3300      	movi      	r3, 0
     c7e:	2b07      	subi      	r3, 8
     c80:	60e0      	addu      	r3, r8
     c82:	9360      	ld.w      	r3, (r3, 0)
     c84:	6c8c      	or      	r2, r3
     c86:	3300      	movi      	r3, 0
     c88:	2b03      	subi      	r3, 4
     c8a:	60e0      	addu      	r3, r8
     c8c:	9360      	ld.w      	r3, (r3, 0)
     c8e:	2393      	addi      	r3, 148
     c90:	b340      	st.w      	r2, (r3, 0)
     c92:	0413      	br      	0xcb8	// cb8 <dw_syscon_exi_set_rising+0x78>
    }
    else
    {
        handle->EXIRT &= ~exi_sel;
     c94:	3300      	movi      	r3, 0
     c96:	2b03      	subi      	r3, 4
     c98:	60e0      	addu      	r3, r8
     c9a:	9360      	ld.w      	r3, (r3, 0)
     c9c:	2393      	addi      	r3, 148
     c9e:	9340      	ld.w      	r2, (r3, 0)
     ca0:	3300      	movi      	r3, 0
     ca2:	2b07      	subi      	r3, 8
     ca4:	60e0      	addu      	r3, r8
     ca6:	9360      	ld.w      	r3, (r3, 0)
     ca8:	6cce      	nor      	r3, r3
     caa:	688c      	and      	r2, r3
     cac:	3300      	movi      	r3, 0
     cae:	2b03      	subi      	r3, 4
     cb0:	60e0      	addu      	r3, r8
     cb2:	9360      	ld.w      	r3, (r3, 0)
     cb4:	2393      	addi      	r3, 148
     cb6:	b340      	st.w      	r2, (r3, 0)
    }

    return handle->EXIRT;
     cb8:	3300      	movi      	r3, 0
     cba:	2b03      	subi      	r3, 4
     cbc:	60e0      	addu      	r3, r8
     cbe:	9360      	ld.w      	r3, (r3, 0)
     cc0:	2393      	addi      	r3, 148
     cc2:	9360      	ld.w      	r3, (r3, 0)
}
     cc4:	6c0f      	mov      	r0, r3
     cc6:	6fa3      	mov      	sp, r8
     cc8:	d90e2000 	ld.w      	r8, (sp, 0)
     ccc:	1401      	addi      	sp, sp, 4
     cce:	783c      	rts

00000cd0 <dw_syscon_exi_set_falling>:
  \param[in]   exi_sel:  exi line to be set
  \param[in]   status:   enable/disable control(APT_DEF_ENABLE is default)
  \return      current setup of falling edge config
*/
uint32_t dw_syscon_exi_set_falling(syscon_handle_t handle, uint32_t exi_sel, bool status)
{
     cd0:	1421      	subi      	sp, sp, 4
     cd2:	dd0e2000 	st.w      	r8, (sp, 0)
     cd6:	6e3b      	mov      	r8, sp
     cd8:	1423      	subi      	sp, sp, 12
     cda:	3300      	movi      	r3, 0
     cdc:	2b03      	subi      	r3, 4
     cde:	60e0      	addu      	r3, r8
     ce0:	b300      	st.w      	r0, (r3, 0)
     ce2:	3300      	movi      	r3, 0
     ce4:	2b07      	subi      	r3, 8
     ce6:	60e0      	addu      	r3, r8
     ce8:	b320      	st.w      	r1, (r3, 0)
     cea:	3300      	movi      	r3, 0
     cec:	2b08      	subi      	r3, 9
     cee:	60e0      	addu      	r3, r8
     cf0:	a340      	st.b      	r2, (r3, 0)
    if (status == APT_DEF_ENABLE) { /* select as falling edge*/
     cf2:	3300      	movi      	r3, 0
     cf4:	2b08      	subi      	r3, 9
     cf6:	60e0      	addu      	r3, r8
     cf8:	8360      	ld.b      	r3, (r3, 0)
     cfa:	74cc      	zextb      	r3, r3
     cfc:	3b40      	cmpnei      	r3, 0
     cfe:	0c13      	bf      	0xd24	// d24 <dw_syscon_exi_set_falling+0x54>
        handle->EXIFT |= exi_sel;
     d00:	3300      	movi      	r3, 0
     d02:	2b03      	subi      	r3, 4
     d04:	60e0      	addu      	r3, r8
     d06:	9360      	ld.w      	r3, (r3, 0)
     d08:	2397      	addi      	r3, 152
     d0a:	9340      	ld.w      	r2, (r3, 0)
     d0c:	3300      	movi      	r3, 0
     d0e:	2b07      	subi      	r3, 8
     d10:	60e0      	addu      	r3, r8
     d12:	9360      	ld.w      	r3, (r3, 0)
     d14:	6c8c      	or      	r2, r3
     d16:	3300      	movi      	r3, 0
     d18:	2b03      	subi      	r3, 4
     d1a:	60e0      	addu      	r3, r8
     d1c:	9360      	ld.w      	r3, (r3, 0)
     d1e:	2397      	addi      	r3, 152
     d20:	b340      	st.w      	r2, (r3, 0)
     d22:	0413      	br      	0xd48	// d48 <dw_syscon_exi_set_falling+0x78>
    }
    else
    {
        handle->EXIFT &= ~exi_sel;
     d24:	3300      	movi      	r3, 0
     d26:	2b03      	subi      	r3, 4
     d28:	60e0      	addu      	r3, r8
     d2a:	9360      	ld.w      	r3, (r3, 0)
     d2c:	2397      	addi      	r3, 152
     d2e:	9340      	ld.w      	r2, (r3, 0)
     d30:	3300      	movi      	r3, 0
     d32:	2b07      	subi      	r3, 8
     d34:	60e0      	addu      	r3, r8
     d36:	9360      	ld.w      	r3, (r3, 0)
     d38:	6cce      	nor      	r3, r3
     d3a:	688c      	and      	r2, r3
     d3c:	3300      	movi      	r3, 0
     d3e:	2b03      	subi      	r3, 4
     d40:	60e0      	addu      	r3, r8
     d42:	9360      	ld.w      	r3, (r3, 0)
     d44:	2397      	addi      	r3, 152
     d46:	b340      	st.w      	r2, (r3, 0)
    }

    return handle->EXIFT;
     d48:	3300      	movi      	r3, 0
     d4a:	2b03      	subi      	r3, 4
     d4c:	60e0      	addu      	r3, r8
     d4e:	9360      	ld.w      	r3, (r3, 0)
     d50:	2397      	addi      	r3, 152
     d52:	9360      	ld.w      	r3, (r3, 0)
}
     d54:	6c0f      	mov      	r0, r3
     d56:	6fa3      	mov      	sp, r8
     d58:	d90e2000 	ld.w      	r8, (sp, 0)
     d5c:	1401      	addi      	sp, sp, 4
     d5e:	783c      	rts

00000d60 <dw_syscon_set_exi_switch>:
  \param[in]   exi_sel:  exi line to be set
  \param[in]   status:   enable/disable control(APT_DEF_ENABLE is default)
  \return      current masking status
*/
uint32_t dw_syscon_set_exi_switch(syscon_handle_t handle, uint32_t exi_sel, bool status)
{
     d60:	1421      	subi      	sp, sp, 4
     d62:	dd0e2000 	st.w      	r8, (sp, 0)
     d66:	6e3b      	mov      	r8, sp
     d68:	1423      	subi      	sp, sp, 12
     d6a:	3300      	movi      	r3, 0
     d6c:	2b03      	subi      	r3, 4
     d6e:	60e0      	addu      	r3, r8
     d70:	b300      	st.w      	r0, (r3, 0)
     d72:	3300      	movi      	r3, 0
     d74:	2b07      	subi      	r3, 8
     d76:	60e0      	addu      	r3, r8
     d78:	b320      	st.w      	r1, (r3, 0)
     d7a:	3300      	movi      	r3, 0
     d7c:	2b08      	subi      	r3, 9
     d7e:	60e0      	addu      	r3, r8
     d80:	a340      	st.b      	r2, (r3, 0)
    if (status == APT_DEF_ENABLE) {
     d82:	3300      	movi      	r3, 0
     d84:	2b08      	subi      	r3, 9
     d86:	60e0      	addu      	r3, r8
     d88:	8360      	ld.b      	r3, (r3, 0)
     d8a:	74cc      	zextb      	r3, r3
     d8c:	3b40      	cmpnei      	r3, 0
     d8e:	0c0c      	bf      	0xda6	// da6 <dw_syscon_set_exi_switch+0x46>
        handle->EXIER = exi_sel;
     d90:	3300      	movi      	r3, 0
     d92:	2b03      	subi      	r3, 4
     d94:	60e0      	addu      	r3, r8
     d96:	9360      	ld.w      	r3, (r3, 0)
     d98:	239b      	addi      	r3, 156
     d9a:	3200      	movi      	r2, 0
     d9c:	2a07      	subi      	r2, 8
     d9e:	60a0      	addu      	r2, r8
     da0:	9240      	ld.w      	r2, (r2, 0)
     da2:	b340      	st.w      	r2, (r3, 0)
     da4:	040b      	br      	0xdba	// dba <dw_syscon_set_exi_switch+0x5a>
    }
    else {
        handle->EXIDR = exi_sel;
     da6:	3300      	movi      	r3, 0
     da8:	2b03      	subi      	r3, 4
     daa:	60e0      	addu      	r3, r8
     dac:	9360      	ld.w      	r3, (r3, 0)
     dae:	239f      	addi      	r3, 160
     db0:	3200      	movi      	r2, 0
     db2:	2a07      	subi      	r2, 8
     db4:	60a0      	addu      	r2, r8
     db6:	9240      	ld.w      	r2, (r2, 0)
     db8:	b340      	st.w      	r2, (r3, 0)
    }

    return handle->EXIMR;
     dba:	3300      	movi      	r3, 0
     dbc:	2b03      	subi      	r3, 4
     dbe:	60e0      	addu      	r3, r8
     dc0:	9360      	ld.w      	r3, (r3, 0)
     dc2:	23a3      	addi      	r3, 164
     dc4:	9360      	ld.w      	r3, (r3, 0)
}
     dc6:	6c0f      	mov      	r0, r3
     dc8:	6fa3      	mov      	sp, r8
     dca:	d90e2000 	ld.w      	r8, (sp, 0)
     dce:	1401      	addi      	sp, sp, 4
     dd0:	783c      	rts
	...

00000dd4 <dw_syscon_clear_exi_pending>:
  \param[in]   iwdt_ovt overflow time config
  \param[in]   iwdt_wnd alarm window time config
  \return      None
*/
void dw_syscon_clear_exi_pending(syscon_handle_t handle, uint32_t exi_sel)
{
     dd4:	1421      	subi      	sp, sp, 4
     dd6:	dd0e2000 	st.w      	r8, (sp, 0)
     dda:	6e3b      	mov      	r8, sp
     ddc:	1422      	subi      	sp, sp, 8
     dde:	3300      	movi      	r3, 0
     de0:	2b03      	subi      	r3, 4
     de2:	60e0      	addu      	r3, r8
     de4:	b300      	st.w      	r0, (r3, 0)
     de6:	3300      	movi      	r3, 0
     de8:	2b07      	subi      	r3, 8
     dea:	60e0      	addu      	r3, r8
     dec:	b320      	st.w      	r1, (r3, 0)
    handle->EXICR = exi_sel;
     dee:	3300      	movi      	r3, 0
     df0:	2b03      	subi      	r3, 4
     df2:	60e0      	addu      	r3, r8
     df4:	9360      	ld.w      	r3, (r3, 0)
     df6:	23ab      	addi      	r3, 172
     df8:	3200      	movi      	r2, 0
     dfa:	2a07      	subi      	r2, 8
     dfc:	60a0      	addu      	r2, r8
     dfe:	9240      	ld.w      	r2, (r2, 0)
     e00:	b340      	st.w      	r2, (r3, 0)
}
     e02:	6c00      	or      	r0, r0
     e04:	6fa3      	mov      	sp, r8
     e06:	d90e2000 	ld.w      	r8, (sp, 0)
     e0a:	1401      	addi      	sp, sp, 4
     e0c:	783c      	rts
	...

00000e10 <dw_syscon_get_exi_status>:
  \param[in]   exi_sel:  exi pending to be read
  \param[in]   status:   raw(T)/masked(F) pending bit select(APT_DEF_DISABLE is default)
  \return      corresponding bit of pending according to int_sel
*/
uint32_t dw_syscon_get_exi_status(syscon_handle_t handle, uint32_t exi_sel, bool status)
{
     e10:	1421      	subi      	sp, sp, 4
     e12:	dd0e2000 	st.w      	r8, (sp, 0)
     e16:	6e3b      	mov      	r8, sp
     e18:	1423      	subi      	sp, sp, 12
     e1a:	3300      	movi      	r3, 0
     e1c:	2b03      	subi      	r3, 4
     e1e:	60e0      	addu      	r3, r8
     e20:	b300      	st.w      	r0, (r3, 0)
     e22:	3300      	movi      	r3, 0
     e24:	2b07      	subi      	r3, 8
     e26:	60e0      	addu      	r3, r8
     e28:	b320      	st.w      	r1, (r3, 0)
     e2a:	3300      	movi      	r3, 0
     e2c:	2b08      	subi      	r3, 9
     e2e:	60e0      	addu      	r3, r8
     e30:	a340      	st.b      	r2, (r3, 0)
    if (status == APT_DEF_ENABLE) {
     e32:	3300      	movi      	r3, 0
     e34:	2b08      	subi      	r3, 9
     e36:	60e0      	addu      	r3, r8
     e38:	8360      	ld.b      	r3, (r3, 0)
     e3a:	74cc      	zextb      	r3, r3
     e3c:	3b40      	cmpnei      	r3, 0
     e3e:	0c0d      	bf      	0xe58	// e58 <dw_syscon_get_exi_status+0x48>
        return ((handle->EXIRS) & exi_sel);
     e40:	3300      	movi      	r3, 0
     e42:	2b03      	subi      	r3, 4
     e44:	60e0      	addu      	r3, r8
     e46:	9360      	ld.w      	r3, (r3, 0)
     e48:	23af      	addi      	r3, 176
     e4a:	9340      	ld.w      	r2, (r3, 0)
     e4c:	3300      	movi      	r3, 0
     e4e:	2b07      	subi      	r3, 8
     e50:	60e0      	addu      	r3, r8
     e52:	9360      	ld.w      	r3, (r3, 0)
     e54:	68c8      	and      	r3, r2
     e56:	040c      	br      	0xe6e	// e6e <dw_syscon_get_exi_status+0x5e>
    }
    else {
        return ((handle->EXICR) & exi_sel);
     e58:	3300      	movi      	r3, 0
     e5a:	2b03      	subi      	r3, 4
     e5c:	60e0      	addu      	r3, r8
     e5e:	9360      	ld.w      	r3, (r3, 0)
     e60:	23ab      	addi      	r3, 172
     e62:	9340      	ld.w      	r2, (r3, 0)
     e64:	3300      	movi      	r3, 0
     e66:	2b07      	subi      	r3, 8
     e68:	60e0      	addu      	r3, r8
     e6a:	9360      	ld.w      	r3, (r3, 0)
     e6c:	68c8      	and      	r3, r2
    }
}
     e6e:	6c0f      	mov      	r0, r3
     e70:	6fa3      	mov      	sp, r8
     e72:	d90e2000 	ld.w      	r8, (sp, 0)
     e76:	1401      	addi      	sp, sp, 4
     e78:	783c      	rts
	...

00000e7c <dw_syscon_software_trigger_exi>:
  \param[in]   handle   syscon to be operate
  \param[in]   exi_sel  exi line to be triggered
  \return      None
*/
void dw_syscon_software_trigger_exi(syscon_handle_t handle, uint32_t exi_sel)
{
     e7c:	1421      	subi      	sp, sp, 4
     e7e:	dd0e2000 	st.w      	r8, (sp, 0)
     e82:	6e3b      	mov      	r8, sp
     e84:	1422      	subi      	sp, sp, 8
     e86:	3300      	movi      	r3, 0
     e88:	2b03      	subi      	r3, 4
     e8a:	60e0      	addu      	r3, r8
     e8c:	b300      	st.w      	r0, (r3, 0)
     e8e:	3300      	movi      	r3, 0
     e90:	2b07      	subi      	r3, 8
     e92:	60e0      	addu      	r3, r8
     e94:	b320      	st.w      	r1, (r3, 0)
    handle->EXIAR = exi_sel;
     e96:	3300      	movi      	r3, 0
     e98:	2b03      	subi      	r3, 4
     e9a:	60e0      	addu      	r3, r8
     e9c:	9360      	ld.w      	r3, (r3, 0)
     e9e:	23a7      	addi      	r3, 168
     ea0:	3200      	movi      	r2, 0
     ea2:	2a07      	subi      	r2, 8
     ea4:	60a0      	addu      	r2, r8
     ea6:	9240      	ld.w      	r2, (r2, 0)
     ea8:	b340      	st.w      	r2, (r3, 0)
}
     eaa:	6c00      	or      	r0, r0
     eac:	6fa3      	mov      	sp, r8
     eae:	d90e2000 	ld.w      	r8, (sp, 0)
     eb2:	1401      	addi      	sp, sp, 4
     eb4:	783c      	rts
	...

00000eb8 <dw_syscon_get_reset_source_status>:
  \brief       Reset source information
  \param[in]   handle   syscon to be operate
  \return      reset_src_t 
*/
reset_src_t dw_syscon_get_reset_source_status(syscon_handle_t handle)
{
     eb8:	1421      	subi      	sp, sp, 4
     eba:	dd0e2000 	st.w      	r8, (sp, 0)
     ebe:	6e3b      	mov      	r8, sp
     ec0:	1421      	subi      	sp, sp, 4
     ec2:	3300      	movi      	r3, 0
     ec4:	2b03      	subi      	r3, 4
     ec6:	60e0      	addu      	r3, r8
     ec8:	b300      	st.w      	r0, (r3, 0)
    return (reset_src_t)(handle->RSR);
     eca:	3300      	movi      	r3, 0
     ecc:	2b03      	subi      	r3, 4
     ece:	60e0      	addu      	r3, r8
     ed0:	9360      	ld.w      	r3, (r3, 0)
     ed2:	238f      	addi      	r3, 144
     ed4:	9360      	ld.w      	r3, (r3, 0)
}
     ed6:	6c0f      	mov      	r0, r3
     ed8:	6fa3      	mov      	sp, r8
     eda:	d90e2000 	ld.w      	r8, (sp, 0)
     ede:	1401      	addi      	sp, sp, 4
     ee0:	783c      	rts
	...

00000ee4 <dw_syscon_set_interrupt_switch>:
  \param[in]   int_sel:  interrupt to be en/dis
  \param[in]   status:   enable/disable
  \return      current masking status
*/
uint32_t dw_syscon_set_interrupt_switch(syscon_handle_t handle, uint32_t int_sel, bool status)
{
     ee4:	1421      	subi      	sp, sp, 4
     ee6:	dd0e2000 	st.w      	r8, (sp, 0)
     eea:	6e3b      	mov      	r8, sp
     eec:	1423      	subi      	sp, sp, 12
     eee:	3300      	movi      	r3, 0
     ef0:	2b03      	subi      	r3, 4
     ef2:	60e0      	addu      	r3, r8
     ef4:	b300      	st.w      	r0, (r3, 0)
     ef6:	3300      	movi      	r3, 0
     ef8:	2b07      	subi      	r3, 8
     efa:	60e0      	addu      	r3, r8
     efc:	b320      	st.w      	r1, (r3, 0)
     efe:	3300      	movi      	r3, 0
     f00:	2b08      	subi      	r3, 9
     f02:	60e0      	addu      	r3, r8
     f04:	a340      	st.b      	r2, (r3, 0)
    if (status == APT_DEF_ENABLE) {
     f06:	3300      	movi      	r3, 0
     f08:	2b08      	subi      	r3, 9
     f0a:	60e0      	addu      	r3, r8
     f0c:	8360      	ld.b      	r3, (r3, 0)
     f0e:	74cc      	zextb      	r3, r3
     f10:	3b40      	cmpnei      	r3, 0
     f12:	0c0b      	bf      	0xf28	// f28 <dw_syscon_set_interrupt_switch+0x44>
        handle->IECR = int_sel;
     f14:	3300      	movi      	r3, 0
     f16:	2b03      	subi      	r3, 4
     f18:	60e0      	addu      	r3, r8
     f1a:	9360      	ld.w      	r3, (r3, 0)
     f1c:	3200      	movi      	r2, 0
     f1e:	2a07      	subi      	r2, 8
     f20:	60a0      	addu      	r2, r8
     f22:	9240      	ld.w      	r2, (r2, 0)
     f24:	b35d      	st.w      	r2, (r3, 0x74)
     f26:	040a      	br      	0xf3a	// f3a <dw_syscon_set_interrupt_switch+0x56>
    }
    else {
        handle->IDCR = int_sel;
     f28:	3300      	movi      	r3, 0
     f2a:	2b03      	subi      	r3, 4
     f2c:	60e0      	addu      	r3, r8
     f2e:	9360      	ld.w      	r3, (r3, 0)
     f30:	3200      	movi      	r2, 0
     f32:	2a07      	subi      	r2, 8
     f34:	60a0      	addu      	r2, r8
     f36:	9240      	ld.w      	r2, (r2, 0)
     f38:	b35e      	st.w      	r2, (r3, 0x78)
    }

    return handle->IMSR;
     f3a:	3300      	movi      	r3, 0
     f3c:	2b03      	subi      	r3, 4
     f3e:	60e0      	addu      	r3, r8
     f40:	9360      	ld.w      	r3, (r3, 0)
     f42:	937f      	ld.w      	r3, (r3, 0x7c)
}
     f44:	6c0f      	mov      	r0, r3
     f46:	6fa3      	mov      	sp, r8
     f48:	d90e2000 	ld.w      	r8, (sp, 0)
     f4c:	1401      	addi      	sp, sp, 4
     f4e:	783c      	rts

00000f50 <dw_syscon_clear_interrupt_pending>:
  \param[in]   handle:   syscon to be operate
  \param[in]   int_sel:  interrupt to be clear
  \return      None
*/
void dw_syscon_clear_interrupt_pending(syscon_handle_t handle, uint32_t int_sel)
{
     f50:	1421      	subi      	sp, sp, 4
     f52:	dd0e2000 	st.w      	r8, (sp, 0)
     f56:	6e3b      	mov      	r8, sp
     f58:	1422      	subi      	sp, sp, 8
     f5a:	3300      	movi      	r3, 0
     f5c:	2b03      	subi      	r3, 4
     f5e:	60e0      	addu      	r3, r8
     f60:	b300      	st.w      	r0, (r3, 0)
     f62:	3300      	movi      	r3, 0
     f64:	2b07      	subi      	r3, 8
     f66:	60e0      	addu      	r3, r8
     f68:	b320      	st.w      	r1, (r3, 0)
    handle->ICR = int_sel;
     f6a:	3300      	movi      	r3, 0
     f6c:	2b03      	subi      	r3, 4
     f6e:	60e0      	addu      	r3, r8
     f70:	9360      	ld.w      	r3, (r3, 0)
     f72:	2383      	addi      	r3, 132
     f74:	3200      	movi      	r2, 0
     f76:	2a07      	subi      	r2, 8
     f78:	60a0      	addu      	r2, r8
     f7a:	9240      	ld.w      	r2, (r2, 0)
     f7c:	b340      	st.w      	r2, (r3, 0)
}
     f7e:	6c00      	or      	r0, r0
     f80:	6fa3      	mov      	sp, r8
     f82:	d90e2000 	ld.w      	r8, (sp, 0)
     f86:	1401      	addi      	sp, sp, 4
     f88:	040c      	br      	0xfa0	// fa0 <dw_syscon_clear_interrupt_pending+0x50>
     f8a:	0000      	bkpt
     f8c:	87780000 	.long	0x87780000
     f90:	b44b0000 	.long	0xb44b0000
     f94:	b44b0800 	.long	0xb44b0800
     f98:	4bb50000 	.long	0x4bb50000
     f9c:	b44b000a 	.long	0xb44b000a
     fa0:	783c      	rts
	...

00000fa4 <dw_syscon_get_interrupt_status>:
  \param[in]   int_sel:  interrupt pending to be read
  \param[in]   status:   raw(T)/masked(F) pending bit select
  \return      corresponding bit of pending according to int_sel
*/
uint32_t dw_syscon_get_interrupt_status(syscon_handle_t handle, uint32_t int_sel, bool status)
{
     fa4:	1421      	subi      	sp, sp, 4
     fa6:	dd0e2000 	st.w      	r8, (sp, 0)
     faa:	6e3b      	mov      	r8, sp
     fac:	1423      	subi      	sp, sp, 12
     fae:	3300      	movi      	r3, 0
     fb0:	2b03      	subi      	r3, 4
     fb2:	60e0      	addu      	r3, r8
     fb4:	b300      	st.w      	r0, (r3, 0)
     fb6:	3300      	movi      	r3, 0
     fb8:	2b07      	subi      	r3, 8
     fba:	60e0      	addu      	r3, r8
     fbc:	b320      	st.w      	r1, (r3, 0)
     fbe:	3300      	movi      	r3, 0
     fc0:	2b08      	subi      	r3, 9
     fc2:	60e0      	addu      	r3, r8
     fc4:	a340      	st.b      	r2, (r3, 0)
    if (status == APT_DEF_ENABLE) {
     fc6:	3300      	movi      	r3, 0
     fc8:	2b08      	subi      	r3, 9
     fca:	60e0      	addu      	r3, r8
     fcc:	8360      	ld.b      	r3, (r3, 0)
     fce:	74cc      	zextb      	r3, r3
     fd0:	3b40      	cmpnei      	r3, 0
     fd2:	0c0d      	bf      	0xfec	// fec <dw_syscon_get_interrupt_status+0x48>
        return ((handle->RISR) & int_sel);
     fd4:	3300      	movi      	r3, 0
     fd6:	2b03      	subi      	r3, 4
     fd8:	60e0      	addu      	r3, r8
     fda:	9360      	ld.w      	r3, (r3, 0)
     fdc:	2387      	addi      	r3, 136
     fde:	9340      	ld.w      	r2, (r3, 0)
     fe0:	3300      	movi      	r3, 0
     fe2:	2b07      	subi      	r3, 8
     fe4:	60e0      	addu      	r3, r8
     fe6:	9360      	ld.w      	r3, (r3, 0)
     fe8:	68c8      	and      	r3, r2
     fea:	040c      	br      	0x1002	// 1002 <dw_syscon_get_interrupt_status+0x5e>
    }
    else {
        return ((handle->ISR) & int_sel);
     fec:	3300      	movi      	r3, 0
     fee:	2b03      	subi      	r3, 4
     ff0:	60e0      	addu      	r3, r8
     ff2:	9360      	ld.w      	r3, (r3, 0)
     ff4:	238b      	addi      	r3, 140
     ff6:	9340      	ld.w      	r2, (r3, 0)
     ff8:	3300      	movi      	r3, 0
     ffa:	2b07      	subi      	r3, 8
     ffc:	60e0      	addu      	r3, r8
     ffe:	9360      	ld.w      	r3, (r3, 0)
    1000:	68c8      	and      	r3, r2
    }
}
    1002:	6c0f      	mov      	r0, r3
    1004:	6fa3      	mov      	sp, r8
    1006:	d90e2000 	ld.w      	r8, (sp, 0)
    100a:	1401      	addi      	sp, sp, 4
    100c:	783c      	rts
	...

00001010 <dw_syscon_get_project_information>:
  \param[in]   handle   syscon to be operate
  \param[in]   info_sel information to be load
  \return      result stored in flash
*/
uint32_t dw_syscon_get_project_information(syscon_handle_t handle, prj_infor_t info_sel)
{
    1010:	1421      	subi      	sp, sp, 4
    1012:	dd0e2000 	st.w      	r8, (sp, 0)
    1016:	6e3b      	mov      	r8, sp
    1018:	1422      	subi      	sp, sp, 8
    101a:	3300      	movi      	r3, 0
    101c:	2b03      	subi      	r3, 4
    101e:	60e0      	addu      	r3, r8
    1020:	b300      	st.w      	r0, (r3, 0)
    1022:	3300      	movi      	r3, 0
    1024:	2b07      	subi      	r3, 8
    1026:	60e0      	addu      	r3, r8
    1028:	b320      	st.w      	r1, (r3, 0)
    switch(info_sel)
    102a:	3300      	movi      	r3, 0
    102c:	2b07      	subi      	r3, 8
    102e:	60e0      	addu      	r3, r8
    1030:	9360      	ld.w      	r3, (r3, 0)
    1032:	3b41      	cmpnei      	r3, 1
    1034:	0c0f      	bf      	0x1052	// 1052 <dw_syscon_get_project_information+0x42>
    1036:	3b00      	cmphsi      	r3, 1
    1038:	0c06      	bf      	0x1044	// 1044 <dw_syscon_get_project_information+0x34>
    103a:	3b42      	cmpnei      	r3, 2
    103c:	0c12      	bf      	0x1060	// 1060 <dw_syscon_get_project_information+0x50>
    103e:	3b43      	cmpnei      	r3, 3
    1040:	0c17      	bf      	0x106e	// 106e <dw_syscon_get_project_information+0x5e>
    1042:	041d      	br      	0x107c	// 107c <dw_syscon_get_project_information+0x6c>
    {
        case CINF0:
            return handle->CINF0;
    1044:	3300      	movi      	r3, 0
    1046:	2b03      	subi      	r3, 4
    1048:	60e0      	addu      	r3, r8
    104a:	9360      	ld.w      	r3, (r3, 0)
    104c:	23bf      	addi      	r3, 192
    104e:	9360      	ld.w      	r3, (r3, 0)
    1050:	0417      	br      	0x107e	// 107e <dw_syscon_get_project_information+0x6e>
            break;
        case CINF1:
            return handle->CINF1;
    1052:	3300      	movi      	r3, 0
    1054:	2b03      	subi      	r3, 4
    1056:	60e0      	addu      	r3, r8
    1058:	9360      	ld.w      	r3, (r3, 0)
    105a:	23c3      	addi      	r3, 196
    105c:	9360      	ld.w      	r3, (r3, 0)
    105e:	0410      	br      	0x107e	// 107e <dw_syscon_get_project_information+0x6e>
            break;
        case FINF0:
            return handle->FINF0;
    1060:	3300      	movi      	r3, 0
    1062:	2b03      	subi      	r3, 4
    1064:	60e0      	addu      	r3, r8
    1066:	9360      	ld.w      	r3, (r3, 0)
    1068:	23c7      	addi      	r3, 200
    106a:	9360      	ld.w      	r3, (r3, 0)
    106c:	0409      	br      	0x107e	// 107e <dw_syscon_get_project_information+0x6e>
            break;
        case FINF1:
            return handle->FINF1;
    106e:	3300      	movi      	r3, 0
    1070:	2b03      	subi      	r3, 4
    1072:	60e0      	addu      	r3, r8
    1074:	9360      	ld.w      	r3, (r3, 0)
    1076:	23cb      	addi      	r3, 204
    1078:	9360      	ld.w      	r3, (r3, 0)
    107a:	0402      	br      	0x107e	// 107e <dw_syscon_get_project_information+0x6e>
            break;
    }
	
	return 0;
    107c:	3300      	movi      	r3, 0
}
    107e:	6c0f      	mov      	r0, r3
    1080:	6fa3      	mov      	sp, r8
    1082:	d90e2000 	ld.w      	r8, (sp, 0)
    1086:	1401      	addi      	sp, sp, 4
    1088:	783c      	rts
	...

0000108c <dw_syscon_get_protection_information>:
  \param[in]   handle   syscon to be operate
  \param[in]   info_sel information to be load
  \return      result of check
*/
uint32_t dw_syscon_get_protection_information(syscon_handle_t handle, prot_infor_t info_sel)
{
    108c:	1421      	subi      	sp, sp, 4
    108e:	dd0e2000 	st.w      	r8, (sp, 0)
    1092:	6e3b      	mov      	r8, sp
    1094:	1422      	subi      	sp, sp, 8
    1096:	3300      	movi      	r3, 0
    1098:	2b03      	subi      	r3, 4
    109a:	60e0      	addu      	r3, r8
    109c:	b300      	st.w      	r0, (r3, 0)
    109e:	3300      	movi      	r3, 0
    10a0:	2b07      	subi      	r3, 8
    10a2:	60e0      	addu      	r3, r8
    10a4:	b320      	st.w      	r1, (r3, 0)
    switch(info_sel)
    10a6:	3300      	movi      	r3, 0
    10a8:	2b07      	subi      	r3, 8
    10aa:	60e0      	addu      	r3, r8
    10ac:	9360      	ld.w      	r3, (r3, 0)
    10ae:	3b41      	cmpnei      	r3, 1
    10b0:	0c14      	bf      	0x10d8	// 10d8 <dw_syscon_get_protection_information+0x4c>
    10b2:	3b00      	cmphsi      	r3, 1
    10b4:	0c04      	bf      	0x10bc	// 10bc <dw_syscon_get_protection_information+0x30>
    10b6:	3b42      	cmpnei      	r3, 2
    10b8:	0c1e      	bf      	0x10f4	// 10f4 <dw_syscon_get_protection_information+0x68>
    10ba:	044f      	br      	0x1158	// 1158 <dw_syscon_get_protection_information+0xcc>
    {
        case RDP:
            if ((handle->OPT0) & (1ul<<27)) {
    10bc:	3300      	movi      	r3, 0
    10be:	2b03      	subi      	r3, 4
    10c0:	60e0      	addu      	r3, r8
    10c2:	9360      	ld.w      	r3, (r3, 0)
    10c4:	935a      	ld.w      	r2, (r3, 0x68)
    10c6:	3380      	movi      	r3, 128
    10c8:	4374      	lsli      	r3, r3, 20
    10ca:	68c8      	and      	r3, r2
    10cc:	3b40      	cmpnei      	r3, 0
    10ce:	0c03      	bf      	0x10d4	// 10d4 <dw_syscon_get_protection_information+0x48>
                return APT_DEF_ENABLE;
    10d0:	3301      	movi      	r3, 1
    10d2:	0444      	br      	0x115a	// 115a <dw_syscon_get_protection_information+0xce>
            }
            else {
                return APT_DEF_DISABLE;
    10d4:	3300      	movi      	r3, 0
    10d6:	0442      	br      	0x115a	// 115a <dw_syscon_get_protection_information+0xce>
            }
            break;
        case DBP:
            if ((handle->OPT0) & (1ul<<8)) {
    10d8:	3300      	movi      	r3, 0
    10da:	2b03      	subi      	r3, 4
    10dc:	60e0      	addu      	r3, r8
    10de:	9360      	ld.w      	r3, (r3, 0)
    10e0:	935a      	ld.w      	r2, (r3, 0x68)
    10e2:	3380      	movi      	r3, 128
    10e4:	4361      	lsli      	r3, r3, 1
    10e6:	68c8      	and      	r3, r2
    10e8:	3b40      	cmpnei      	r3, 0
    10ea:	0c03      	bf      	0x10f0	// 10f0 <dw_syscon_get_protection_information+0x64>
                return APT_DEF_ENABLE;
    10ec:	3301      	movi      	r3, 1
    10ee:	0436      	br      	0x115a	// 115a <dw_syscon_get_protection_information+0xce>
            }
            else {
                return APT_DEF_DISABLE;
    10f0:	3300      	movi      	r3, 0
    10f2:	0434      	br      	0x115a	// 115a <dw_syscon_get_protection_information+0xce>
            }
            break;
        case HDP:
            if ((handle->OPT0) & (1ul<<16)) {
    10f4:	3300      	movi      	r3, 0
    10f6:	2b03      	subi      	r3, 4
    10f8:	60e0      	addu      	r3, r8
    10fa:	9360      	ld.w      	r3, (r3, 0)
    10fc:	935a      	ld.w      	r2, (r3, 0x68)
    10fe:	3380      	movi      	r3, 128
    1100:	4369      	lsli      	r3, r3, 9
    1102:	68c8      	and      	r3, r2
    1104:	3b40      	cmpnei      	r3, 0
    1106:	0c03      	bf      	0x110c	// 110c <dw_syscon_get_protection_information+0x80>
                return 1;
    1108:	3301      	movi      	r3, 1
    110a:	0428      	br      	0x115a	// 115a <dw_syscon_get_protection_information+0xce>
            }
            else if ((handle->OPT0) & (1ul<<17)) {
    110c:	3300      	movi      	r3, 0
    110e:	2b03      	subi      	r3, 4
    1110:	60e0      	addu      	r3, r8
    1112:	9360      	ld.w      	r3, (r3, 0)
    1114:	935a      	ld.w      	r2, (r3, 0x68)
    1116:	3380      	movi      	r3, 128
    1118:	436a      	lsli      	r3, r3, 10
    111a:	68c8      	and      	r3, r2
    111c:	3b40      	cmpnei      	r3, 0
    111e:	0c03      	bf      	0x1124	// 1124 <dw_syscon_get_protection_information+0x98>
                return 2;
    1120:	3302      	movi      	r3, 2
    1122:	041c      	br      	0x115a	// 115a <dw_syscon_get_protection_information+0xce>
            }
            else if ((handle->OPT0) & (1ul<<18)) {
    1124:	3300      	movi      	r3, 0
    1126:	2b03      	subi      	r3, 4
    1128:	60e0      	addu      	r3, r8
    112a:	9360      	ld.w      	r3, (r3, 0)
    112c:	935a      	ld.w      	r2, (r3, 0x68)
    112e:	3380      	movi      	r3, 128
    1130:	436b      	lsli      	r3, r3, 11
    1132:	68c8      	and      	r3, r2
    1134:	3b40      	cmpnei      	r3, 0
    1136:	0c03      	bf      	0x113c	// 113c <dw_syscon_get_protection_information+0xb0>
                return 3;
    1138:	3303      	movi      	r3, 3
    113a:	0410      	br      	0x115a	// 115a <dw_syscon_get_protection_information+0xce>
            }
            else if ((handle->OPT0) & (1ul<<19)) {
    113c:	3300      	movi      	r3, 0
    113e:	2b03      	subi      	r3, 4
    1140:	60e0      	addu      	r3, r8
    1142:	9360      	ld.w      	r3, (r3, 0)
    1144:	935a      	ld.w      	r2, (r3, 0x68)
    1146:	3380      	movi      	r3, 128
    1148:	436c      	lsli      	r3, r3, 12
    114a:	68c8      	and      	r3, r2
    114c:	3b40      	cmpnei      	r3, 0
    114e:	0c03      	bf      	0x1154	// 1154 <dw_syscon_get_protection_information+0xc8>
                return 4;
    1150:	3304      	movi      	r3, 4
    1152:	0404      	br      	0x115a	// 115a <dw_syscon_get_protection_information+0xce>
            }
            else {
                return APT_DEF_DISABLE;
    1154:	3300      	movi      	r3, 0
    1156:	0402      	br      	0x115a	// 115a <dw_syscon_get_protection_information+0xce>
            }
            break;
    }
	
	return 0;
    1158:	3300      	movi      	r3, 0
}
    115a:	6c0f      	mov      	r0, r3
    115c:	6fa3      	mov      	sp, r8
    115e:	d90e2000 	ld.w      	r8, (sp, 0)
    1162:	1401      	addi      	sp, sp, 4
    1164:	783c      	rts
	...

00001168 <dw_syscon_set_hfosc_switch>:
  \param[in]   handle: syscon to be operate
  \param[in]   status: enable/disable status
  \return      None
*/
void dw_syscon_set_hfosc_switch(syscon_handle_t handle, bool status)
{
    1168:	1421      	subi      	sp, sp, 4
    116a:	dd0e2000 	st.w      	r8, (sp, 0)
    116e:	6e3b      	mov      	r8, sp
    1170:	1422      	subi      	sp, sp, 8
    1172:	3300      	movi      	r3, 0
    1174:	2b03      	subi      	r3, 4
    1176:	60e0      	addu      	r3, r8
    1178:	b300      	st.w      	r0, (r3, 0)
    117a:	6c87      	mov      	r2, r1
    117c:	3300      	movi      	r3, 0
    117e:	2b04      	subi      	r3, 5
    1180:	60e0      	addu      	r3, r8
    1182:	a340      	st.b      	r2, (r3, 0)
    if (status == APT_DEF_ENABLE) {
    1184:	3300      	movi      	r3, 0
    1186:	2b04      	subi      	r3, 5
    1188:	60e0      	addu      	r3, r8
    118a:	8360      	ld.b      	r3, (r3, 0)
    118c:	74cc      	zextb      	r3, r3
    118e:	3b40      	cmpnei      	r3, 0
    1190:	0c19      	bf      	0x11c2	// 11c2 <dw_syscon_set_hfosc_switch+0x5a>
        handle->CLCR |= (1ul<<20);
    1192:	3300      	movi      	r3, 0
    1194:	2b03      	subi      	r3, 4
    1196:	60e0      	addu      	r3, r8
    1198:	9360      	ld.w      	r3, (r3, 0)
    119a:	9374      	ld.w      	r3, (r3, 0x50)
    119c:	3bb4      	bseti      	r3, r3, 20
    119e:	6c8f      	mov      	r2, r3
    11a0:	3300      	movi      	r3, 0
    11a2:	2b03      	subi      	r3, 4
    11a4:	60e0      	addu      	r3, r8
    11a6:	9360      	ld.w      	r3, (r3, 0)
    11a8:	b354      	st.w      	r2, (r3, 0x50)
        while (!((handle->CLCR) & (1ul<<21)));
    11aa:	6c00      	or      	r0, r0
    11ac:	3300      	movi      	r3, 0
    11ae:	2b03      	subi      	r3, 4
    11b0:	60e0      	addu      	r3, r8
    11b2:	9360      	ld.w      	r3, (r3, 0)
    11b4:	9354      	ld.w      	r2, (r3, 0x50)
    11b6:	3380      	movi      	r3, 128
    11b8:	436e      	lsli      	r3, r3, 14
    11ba:	68c8      	and      	r3, r2
    11bc:	3b40      	cmpnei      	r3, 0
    11be:	0ff7      	bf      	0x11ac	// 11ac <dw_syscon_set_hfosc_switch+0x44>
    }
    else {
        handle->CLCR &= ~(1ul<<20);

    }
}
    11c0:	040d      	br      	0x11da	// 11da <dw_syscon_set_hfosc_switch+0x72>
        handle->CLCR &= ~(1ul<<20);
    11c2:	3300      	movi      	r3, 0
    11c4:	2b03      	subi      	r3, 4
    11c6:	60e0      	addu      	r3, r8
    11c8:	9360      	ld.w      	r3, (r3, 0)
    11ca:	9374      	ld.w      	r3, (r3, 0x50)
    11cc:	3b94      	bclri      	r3, r3, 20
    11ce:	6c8f      	mov      	r2, r3
    11d0:	3300      	movi      	r3, 0
    11d2:	2b03      	subi      	r3, 4
    11d4:	60e0      	addu      	r3, r8
    11d6:	9360      	ld.w      	r3, (r3, 0)
    11d8:	b354      	st.w      	r2, (r3, 0x50)
}
    11da:	6c00      	or      	r0, r0
    11dc:	6fa3      	mov      	sp, r8
    11de:	d90e2000 	ld.w      	r8, (sp, 0)
    11e2:	1401      	addi      	sp, sp, 4
    11e4:	783c      	rts
	...

000011e8 <dw_syscon_clo_config>:
  \param[in]   handle: syscon to be operate
  \param[in]   clo_sel: clo source selection
  \return      None
*/
void dw_syscon_clo_config(syscon_handle_t handle, clo_src_t clo_sel)
{
    11e8:	1421      	subi      	sp, sp, 4
    11ea:	dd0e2000 	st.w      	r8, (sp, 0)
    11ee:	6e3b      	mov      	r8, sp
    11f0:	1422      	subi      	sp, sp, 8
    11f2:	3300      	movi      	r3, 0
    11f4:	2b03      	subi      	r3, 4
    11f6:	60e0      	addu      	r3, r8
    11f8:	b300      	st.w      	r0, (r3, 0)
    11fa:	3300      	movi      	r3, 0
    11fc:	2b07      	subi      	r3, 8
    11fe:	60e0      	addu      	r3, r8
    1200:	b320      	st.w      	r1, (r3, 0)
    handle->CLCR = ((handle->CLCR) & ~(0xf<<16))|(clo_sel<<16);
    1202:	3300      	movi      	r3, 0
    1204:	2b03      	subi      	r3, 4
    1206:	60e0      	addu      	r3, r8
    1208:	9360      	ld.w      	r3, (r3, 0)
    120a:	9354      	ld.w      	r2, (r3, 0x50)
    120c:	33f0      	movi      	r3, 240
    120e:	436c      	lsli      	r3, r3, 12
    1210:	688d      	andn      	r2, r3
    1212:	3300      	movi      	r3, 0
    1214:	2b07      	subi      	r3, 8
    1216:	60e0      	addu      	r3, r8
    1218:	9360      	ld.w      	r3, (r3, 0)
    121a:	4370      	lsli      	r3, r3, 16
    121c:	6c8c      	or      	r2, r3
    121e:	3300      	movi      	r3, 0
    1220:	2b03      	subi      	r3, 4
    1222:	60e0      	addu      	r3, r8
    1224:	9360      	ld.w      	r3, (r3, 0)
    1226:	b354      	st.w      	r2, (r3, 0x50)
}
    1228:	6c00      	or      	r0, r0
    122a:	6fa3      	mov      	sp, r8
    122c:	d90e2000 	ld.w      	r8, (sp, 0)
    1230:	1401      	addi      	sp, sp, 4
    1232:	783c      	rts
