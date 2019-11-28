
G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Example/testevn/driver//Obj/driver.elf:     file format elf32-csky-little


Disassembly of section .text:

00000000 <__Vectors>:
       0:	28 24 00 00 d8 25 00 00 d8 25 00 00 d8 25 00 00     ($...%...%...%..
      10:	d8 25 00 00 d8 25 00 00 d8 25 00 00 d8 25 00 00     .%...%...%...%..
      20:	d8 25 00 00 d8 25 00 00 d8 25 00 00 d8 25 00 00     .%...%...%...%..
      30:	d8 25 00 00 d8 25 00 00 d8 25 00 00 d8 25 00 00     .%...%...%...%..
      40:	d8 25 00 00 d8 25 00 00 d8 25 00 00 d8 25 00 00     .%...%...%...%..
      50:	d8 25 00 00 d8 25 00 00 d8 25 00 00 d8 25 00 00     .%...%...%...%..
      60:	d8 25 00 00 d8 25 00 00 d8 25 00 00 d8 25 00 00     .%...%...%...%..
      70:	d8 25 00 00 d8 25 00 00 d8 25 00 00 d8 25 00 00     .%...%...%...%..
      80:	40 1d 00 00 68 1d 00 00 ec 1e 00 00 14 1f 00 00     @...h...........
      90:	3c 1f 00 00 64 1f 00 00 8c 1f 00 00 7c 20 00 00     <...d.......| ..
      a0:	b0 20 00 00 54 20 00 00 b4 1f 00 00 dc 1f 00 00     . ..T ..........
      b0:	04 20 00 00 4c 23 00 00 68 23 00 00 d8 25 00 00     . ..L#..h#...%..
      c0:	d8 25 00 00 84 23 00 00 d8 25 00 00 a0 23 00 00     .%...#...%...#..
      d0:	d8 25 00 00 e4 20 00 00 3c 21 00 00 40 22 00 00     .%... ..<!..@"..
      e0:	d8 25 00 00 bc 23 00 00 d8 25 00 00 2c 20 00 00     .%...#...%.., ..
      f0:	d8 23 00 00 f4 23 00 00 d8 25 00 00 d8 25 00 00     .#...#...%...%..

00000100 <main>:
 * 4 IO base address
 *
 * @return For MCU application, it's better to loop here
 */
int main()
{
     100:	1422      	subi      	r14, r14, 8
     102:	dd0e2000 	st.w      	r8, (r14, 0x0)
     106:	ddee2001 	st.w      	r15, (r14, 0x4)
     10a:	6e3b      	mov      	r8, r14
     10c:	1423      	subi      	r14, r14, 12
    // TODO
	//gpio_port_handle_t gpioa1_handle;
	
	csi_gpio_initialize(PORTA1);
     10e:	3001      	movi      	r0, 1
     110:	e0000058 	bsr      	0x1c0	// 1c0 <csi_gpio_initialize>
	
	volatile uint32_t i;
	for (i=0;i<10000;i++);
     114:	3300      	movi      	r3, 0
     116:	2b07      	subi      	r3, 8
     118:	60e0      	addu      	r3, r8
     11a:	3200      	movi      	r2, 0
     11c:	b340      	st.w      	r2, (r3, 0x0)
     11e:	040a      	br      	0x132	// 132 <main+0x32>
     120:	3300      	movi      	r3, 0
     122:	2b07      	subi      	r3, 8
     124:	60e0      	addu      	r3, r8
     126:	9360      	ld.w      	r3, (r3, 0x0)
     128:	5b42      	addi      	r2, r3, 1
     12a:	3300      	movi      	r3, 0
     12c:	2b07      	subi      	r3, 8
     12e:	60e0      	addu      	r3, r8
     130:	b340      	st.w      	r2, (r3, 0x0)
     132:	3300      	movi      	r3, 0
     134:	2b07      	subi      	r3, 8
     136:	60e0      	addu      	r3, r8
     138:	9340      	ld.w      	r2, (r3, 0x0)
     13a:	107f      	lrw      	r3, 0x270f	// 1b4 <main+0xb4>
     13c:	648c      	cmphs      	r3, r2
     13e:	0bf1      	bt      	0x120	// 120 <main+0x20>
	csi_syscon_set_solo_pclk_switch(ENABLE, PCLK_GPIOB0);
     140:	103e      	lrw      	r1, 0x0	// 1b8 <main+0xb8>
     142:	105f      	lrw      	r2, 0x2000000	// 1bc <main+0xbc>
     144:	3000      	movi      	r0, 0
     146:	e0000847 	bsr      	0x11d4	// 11d4 <csi_syscon_set_solo_pclk_switch>
	
	csi_syscon_set_all_pclk_switch(ENABLE);
     14a:	3000      	movi      	r0, 0
     14c:	e000088a 	bsr      	0x1260	// 1260 <csi_syscon_set_all_pclk_switch>
	
	csi_gpio_pin_func_config(PA1_3,GPIO_MODE_AF3);
     150:	3106      	movi      	r1, 6
     152:	3013      	movi      	r0, 19
     154:	e00001ba 	bsr      	0x4c8	// 4c8 <csi_gpio_pin_func_config>
	csi_syscon_clo_config(CLO_AHBCLK);
     158:	300b      	movi      	r0, 11
     15a:	e0000d13 	bsr      	0x1b80	// 1b80 <csi_syscon_clo_config>
	
	volatile uint32_t mem_data;
	uint32_t *ptr = 0x00000004;
     15e:	3300      	movi      	r3, 0
     160:	2b03      	subi      	r3, 4
     162:	60e0      	addu      	r3, r8
     164:	3204      	movi      	r2, 4
     166:	b340      	st.w      	r2, (r3, 0x0)
	
	mem_data = *ptr;
     168:	3300      	movi      	r3, 0
     16a:	2b03      	subi      	r3, 4
     16c:	60e0      	addu      	r3, r8
     16e:	9360      	ld.w      	r3, (r3, 0x0)
     170:	9340      	ld.w      	r2, (r3, 0x0)
     172:	3300      	movi      	r3, 0
     174:	2b0b      	subi      	r3, 12
     176:	60e0      	addu      	r3, r8
     178:	b340      	st.w      	r2, (r3, 0x0)
	
	ptr = 0x8;
     17a:	3300      	movi      	r3, 0
     17c:	2b03      	subi      	r3, 4
     17e:	60e0      	addu      	r3, r8
     180:	3208      	movi      	r2, 8
     182:	b340      	st.w      	r2, (r3, 0x0)
	mem_data = *ptr;
     184:	3300      	movi      	r3, 0
     186:	2b03      	subi      	r3, 4
     188:	60e0      	addu      	r3, r8
     18a:	9360      	ld.w      	r3, (r3, 0x0)
     18c:	9340      	ld.w      	r2, (r3, 0x0)
     18e:	3300      	movi      	r3, 0
     190:	2b0b      	subi      	r3, 12
     192:	60e0      	addu      	r3, r8
     194:	b340      	st.w      	r2, (r3, 0x0)
	
	ptr = 0xA;
     196:	3300      	movi      	r3, 0
     198:	2b03      	subi      	r3, 4
     19a:	60e0      	addu      	r3, r8
     19c:	320a      	movi      	r2, 10
     19e:	b340      	st.w      	r2, (r3, 0x0)
	mem_data = *ptr;
     1a0:	3300      	movi      	r3, 0
     1a2:	2b03      	subi      	r3, 4
     1a4:	60e0      	addu      	r3, r8
     1a6:	9360      	ld.w      	r3, (r3, 0x0)
     1a8:	9340      	ld.w      	r2, (r3, 0x0)
     1aa:	3300      	movi      	r3, 0
     1ac:	2b0b      	subi      	r3, 12
     1ae:	60e0      	addu      	r3, r8
     1b0:	b340      	st.w      	r2, (r3, 0x0)
		
	while(1);
     1b2:	0400      	br      	0x1b2	// 1b2 <main+0xb2>
     1b4:	0000270f 	.long	0x0000270f
     1b8:	00000000 	.long	0x00000000
     1bc:	02000000 	.long	0x02000000

000001c0 <csi_gpio_initialize>:
   
   @param[in]   idx  GPIO port to be initialized: PORTA0, PORTA1 ... 
   @return      resource handler of specific gpio port
 */ 
gpio_port_handle_t csi_gpio_initialize (int32_t idx)
{
     1c0:	1422      	subi      	r14, r14, 8
     1c2:	b880      	st.w      	r4, (r14, 0x0)
     1c4:	dd0e2001 	st.w      	r8, (r14, 0x4)
     1c8:	6e3b      	mov      	r8, r14
     1ca:	1422      	subi      	r14, r14, 8
     1cc:	3300      	movi      	r3, 0
     1ce:	2b07      	subi      	r3, 8
     1d0:	60e0      	addu      	r3, r8
     1d2:	b300      	st.w      	r0, (r3, 0x0)
  if (idx<0 || idx>CONFIG_GPIO_NUM) {
     1d4:	3300      	movi      	r3, 0
     1d6:	2b07      	subi      	r3, 8
     1d8:	60e0      	addu      	r3, r8
     1da:	9360      	ld.w      	r3, (r3, 0x0)
     1dc:	3bdf      	btsti      	r3, 31
     1de:	0807      	bt      	0x1ec	// 1ec <csi_gpio_initialize+0x2c>
     1e0:	3300      	movi      	r3, 0
     1e2:	2b07      	subi      	r3, 8
     1e4:	60e0      	addu      	r3, r8
     1e6:	9360      	ld.w      	r3, (r3, 0x0)
     1e8:	3b25      	cmplti      	r3, 6
     1ea:	0803      	bt      	0x1f0	// 1f0 <csi_gpio_initialize+0x30>
    return NULL;
     1ec:	3300      	movi      	r3, 0
     1ee:	0485      	br      	0x2f8	// 2f8 <csi_gpio_initialize+0x138>
  }

  dw_gpio_private_t *gpio_priv = &gpio_intance[idx];
     1f0:	3300      	movi      	r3, 0
     1f2:	2b03      	subi      	r3, 4
     1f4:	60e0      	addu      	r3, r8
     1f6:	3200      	movi      	r2, 0
     1f8:	2a07      	subi      	r2, 8
     1fa:	60a0      	addu      	r2, r8
     1fc:	9240      	ld.w      	r2, (r2, 0x0)
     1fe:	4244      	lsli      	r2, r2, 4
     200:	1222      	lrw      	r1, 0x20000030	// 308 <csi_gpio_initialize+0x148>
     202:	6084      	addu      	r2, r1
     204:	b340      	st.w      	r2, (r3, 0x0)

  // base address initial...
  switch (idx) {
     206:	3300      	movi      	r3, 0
     208:	2b07      	subi      	r3, 8
     20a:	60e0      	addu      	r3, r8
     20c:	9340      	ld.w      	r2, (r3, 0x0)
     20e:	3a04      	cmphsi      	r2, 5
     210:	0870      	bt      	0x2f0	// 2f0 <csi_gpio_initialize+0x130>
     212:	9360      	ld.w      	r3, (r3, 0x0)
     214:	4362      	lsli      	r3, r3, 2
     216:	115e      	lrw      	r2, 0x2640	// 30c <csi_gpio_initialize+0x14c>
     218:	60c8      	addu      	r3, r2
     21a:	9360      	ld.w      	r3, (r3, 0x0)
     21c:	780c      	jmp      	r3
    case 0: // PORTA0
      gpio_priv->base = APT_GPIOA0_BASE;
     21e:	3300      	movi      	r3, 0
     220:	2b03      	subi      	r3, 4
     222:	60e0      	addu      	r3, r8
     224:	9360      	ld.w      	r3, (r3, 0x0)
     226:	115b      	lrw      	r2, 0x40040000	// 310 <csi_gpio_initialize+0x150>
     228:	b340      	st.w      	r2, (r3, 0x0)
      gpio_priv->gpio_config.CONR = 0ull;	// reset value of pa0
     22a:	3300      	movi      	r3, 0
     22c:	2b03      	subi      	r3, 4
     22e:	60e0      	addu      	r3, r8
     230:	9340      	ld.w      	r2, (r3, 0x0)
     232:	3300      	movi      	r3, 0
     234:	3400      	movi      	r4, 0
     236:	b261      	st.w      	r3, (r2, 0x4)
     238:	b282      	st.w      	r4, (r2, 0x8)
      gpio_priv->pullst = 0ul;
     23a:	3300      	movi      	r3, 0
     23c:	2b03      	subi      	r3, 4
     23e:	60e0      	addu      	r3, r8
     240:	9360      	ld.w      	r3, (r3, 0x0)
     242:	3200      	movi      	r2, 0
     244:	b343      	st.w      	r2, (r3, 0xc)
      break;
     246:	0455      	br      	0x2f0	// 2f0 <csi_gpio_initialize+0x130>
    case 1: // PORTA1
      gpio_priv->base = APT_GPIOA1_BASE;
     248:	3300      	movi      	r3, 0
     24a:	2b03      	subi      	r3, 4
     24c:	60e0      	addu      	r3, r8
     24e:	9360      	ld.w      	r3, (r3, 0x0)
     250:	1151      	lrw      	r2, 0x40040100	// 314 <csi_gpio_initialize+0x154>
     252:	b340      	st.w      	r2, (r3, 0x0)
      gpio_priv->gpio_config.CONR = 0ull;	// reset value of pa1
     254:	3300      	movi      	r3, 0
     256:	2b03      	subi      	r3, 4
     258:	60e0      	addu      	r3, r8
     25a:	9340      	ld.w      	r2, (r3, 0x0)
     25c:	3300      	movi      	r3, 0
     25e:	3400      	movi      	r4, 0
     260:	b261      	st.w      	r3, (r2, 0x4)
     262:	b282      	st.w      	r4, (r2, 0x8)
      gpio_priv->pullst = 0ul;
     264:	3300      	movi      	r3, 0
     266:	2b03      	subi      	r3, 4
     268:	60e0      	addu      	r3, r8
     26a:	9360      	ld.w      	r3, (r3, 0x0)
     26c:	3200      	movi      	r2, 0
     26e:	b343      	st.w      	r2, (r3, 0xc)
      break;
     270:	0440      	br      	0x2f0	// 2f0 <csi_gpio_initialize+0x130>
    case 2: // PORTB0
      gpio_priv->base = APT_GPIOB0_BASE;
     272:	3300      	movi      	r3, 0
     274:	2b03      	subi      	r3, 4
     276:	60e0      	addu      	r3, r8
     278:	9360      	ld.w      	r3, (r3, 0x0)
     27a:	1148      	lrw      	r2, 0x40041000	// 318 <csi_gpio_initialize+0x158>
     27c:	b340      	st.w      	r2, (r3, 0x0)
      gpio_priv->gpio_config.CONR = 0ull;	// reset value of pb0
     27e:	3300      	movi      	r3, 0
     280:	2b03      	subi      	r3, 4
     282:	60e0      	addu      	r3, r8
     284:	9340      	ld.w      	r2, (r3, 0x0)
     286:	3300      	movi      	r3, 0
     288:	3400      	movi      	r4, 0
     28a:	b261      	st.w      	r3, (r2, 0x4)
     28c:	b282      	st.w      	r4, (r2, 0x8)
      gpio_priv->pullst = 0ul;
     28e:	3300      	movi      	r3, 0
     290:	2b03      	subi      	r3, 4
     292:	60e0      	addu      	r3, r8
     294:	9360      	ld.w      	r3, (r3, 0x0)
     296:	3200      	movi      	r2, 0
     298:	b343      	st.w      	r2, (r3, 0xc)
      break;
     29a:	042b      	br      	0x2f0	// 2f0 <csi_gpio_initialize+0x130>
    case 3: // PORTC0
      gpio_priv->base = APT_GPIOC0_BASE;
     29c:	3300      	movi      	r3, 0
     29e:	2b03      	subi      	r3, 4
     2a0:	60e0      	addu      	r3, r8
     2a2:	9360      	ld.w      	r3, (r3, 0x0)
     2a4:	105e      	lrw      	r2, 0x40042000	// 31c <csi_gpio_initialize+0x15c>
     2a6:	b340      	st.w      	r2, (r3, 0x0)
      gpio_priv->gpio_config.CONR = 0ull;	// reset value of pc0
     2a8:	3300      	movi      	r3, 0
     2aa:	2b03      	subi      	r3, 4
     2ac:	60e0      	addu      	r3, r8
     2ae:	9340      	ld.w      	r2, (r3, 0x0)
     2b0:	3300      	movi      	r3, 0
     2b2:	3400      	movi      	r4, 0
     2b4:	b261      	st.w      	r3, (r2, 0x4)
     2b6:	b282      	st.w      	r4, (r2, 0x8)
      gpio_priv->pullst = 0ul;
     2b8:	3300      	movi      	r3, 0
     2ba:	2b03      	subi      	r3, 4
     2bc:	60e0      	addu      	r3, r8
     2be:	9360      	ld.w      	r3, (r3, 0x0)
     2c0:	3200      	movi      	r2, 0
     2c2:	b343      	st.w      	r2, (r3, 0xc)
      break;
     2c4:	0416      	br      	0x2f0	// 2f0 <csi_gpio_initialize+0x130>
    case 4: // PORTD0
      gpio_priv->base = APT_GPIOD0_BASE;
     2c6:	3300      	movi      	r3, 0
     2c8:	2b03      	subi      	r3, 4
     2ca:	60e0      	addu      	r3, r8
     2cc:	9360      	ld.w      	r3, (r3, 0x0)
     2ce:	1055      	lrw      	r2, 0x40043000	// 320 <csi_gpio_initialize+0x160>
     2d0:	b340      	st.w      	r2, (r3, 0x0)
      gpio_priv->gpio_config.CONR = 0ull;	// reset value of pd0
     2d2:	3300      	movi      	r3, 0
     2d4:	2b03      	subi      	r3, 4
     2d6:	60e0      	addu      	r3, r8
     2d8:	9340      	ld.w      	r2, (r3, 0x0)
     2da:	3300      	movi      	r3, 0
     2dc:	3400      	movi      	r4, 0
     2de:	b261      	st.w      	r3, (r2, 0x4)
     2e0:	b282      	st.w      	r4, (r2, 0x8)
      gpio_priv->pullst = 0ul;
     2e2:	3300      	movi      	r3, 0
     2e4:	2b03      	subi      	r3, 4
     2e6:	60e0      	addu      	r3, r8
     2e8:	9360      	ld.w      	r3, (r3, 0x0)
     2ea:	3200      	movi      	r2, 0
     2ec:	b343      	st.w      	r2, (r3, 0xc)
      break;
     2ee:	6c00      	or      	r0, r0
  }

  return (gpio_port_handle_t)gpio_priv;
     2f0:	3300      	movi      	r3, 0
     2f2:	2b03      	subi      	r3, 4
     2f4:	60e0      	addu      	r3, r8
     2f6:	9360      	ld.w      	r3, (r3, 0x0)
}
     2f8:	6c0f      	mov      	r0, r3
     2fa:	6fa3      	mov      	r14, r8
     2fc:	d90e2001 	ld.w      	r8, (r14, 0x4)
     300:	9880      	ld.w      	r4, (r14, 0x0)
     302:	1402      	addi      	r14, r14, 8
     304:	783c      	jmp      	r15
     306:	0000      	bkpt
     308:	20000030 	.long	0x20000030
     30c:	00002640 	.long	0x00002640
     310:	40040000 	.long	0x40040000
     314:	40040100 	.long	0x40040100
     318:	40041000 	.long	0x40041000
     31c:	40042000 	.long	0x40042000
     320:	40043000 	.long	0x40043000

00000324 <csi_gpio_exi_cb_init>:
   
   @param[in]   cb   pointer to customer ISR when EXI is called 
   @return      zero on success
 */ 
int32_t csi_gpio_exi_cb_init (gpio_event_cb_t cb)
{
     324:	1421      	subi      	r14, r14, 4
     326:	dd0e2000 	st.w      	r8, (r14, 0x0)
     32a:	6e3b      	mov      	r8, r14
     32c:	1426      	subi      	r14, r14, 24
     32e:	3300      	movi      	r3, 0
     330:	2b17      	subi      	r3, 24
     332:	60e0      	addu      	r3, r8
     334:	b300      	st.w      	r0, (r3, 0x0)
    GPIO_NULL_PARAM_CHK(cb);
     336:	3300      	movi      	r3, 0
     338:	2b17      	subi      	r3, 24
     33a:	60e0      	addu      	r3, r8
     33c:	9360      	ld.w      	r3, (r3, 0x0)
     33e:	3b40      	cmpnei      	r3, 0
     340:	0804      	bt      	0x348	// 348 <csi_gpio_exi_cb_init+0x24>
     342:	ea83013d 	lrw      	r3, 0x81010084	// 834 <csi_gpio_pin_speed_config+0xe0>
     346:	045e      	br      	0x402	// 402 <csi_gpio_exi_cb_init+0xde>
    gpio_exi_cb = cb;
     348:	ea83013c 	lrw      	r3, 0x2000002c	// 838 <csi_gpio_pin_speed_config+0xe4>
     34c:	3200      	movi      	r2, 0
     34e:	2a17      	subi      	r2, 24
     350:	60a0      	addu      	r2, r8
     352:	9240      	ld.w      	r2, (r2, 0x0)
     354:	b340      	st.w      	r2, (r3, 0x0)
     356:	3300      	movi      	r3, 0
     358:	2b13      	subi      	r3, 20
     35a:	60e0      	addu      	r3, r8
     35c:	3207      	movi      	r2, 7
     35e:	b340      	st.w      	r2, (r3, 0x0)
  \details Enable a device-specific interrupt in the VIC interrupt controller.
  \param [in]      IRQn  External interrupt number. Value cannot be negative.
 */
__ALWAYS_INLINE void csi_vic_enable_irq(int32_t IRQn)
{
    VIC->ISER[0U] = (uint32_t)(1UL << (((uint32_t)(int32_t)IRQn) & 0x1FUL));
     360:	ea830137 	lrw      	r3, 0xe000e100	// 83c <csi_gpio_pin_speed_config+0xe8>
     364:	3200      	movi      	r2, 0
     366:	2a13      	subi      	r2, 20
     368:	60a0      	addu      	r2, r8
     36a:	9220      	ld.w      	r1, (r2, 0x0)
     36c:	321f      	movi      	r2, 31
     36e:	6884      	and      	r2, r1
     370:	3101      	movi      	r1, 1
     372:	7048      	lsl      	r1, r2
     374:	6c87      	mov      	r2, r1
     376:	b340      	st.w      	r2, (r3, 0x0)
     378:	3300      	movi      	r3, 0
     37a:	2b0f      	subi      	r3, 16
     37c:	60e0      	addu      	r3, r8
     37e:	3208      	movi      	r2, 8
     380:	b340      	st.w      	r2, (r3, 0x0)
     382:	ea83012f 	lrw      	r3, 0xe000e100	// 83c <csi_gpio_pin_speed_config+0xe8>
     386:	3200      	movi      	r2, 0
     388:	2a0f      	subi      	r2, 16
     38a:	60a0      	addu      	r2, r8
     38c:	9220      	ld.w      	r1, (r2, 0x0)
     38e:	321f      	movi      	r2, 31
     390:	6884      	and      	r2, r1
     392:	3101      	movi      	r1, 1
     394:	7048      	lsl      	r1, r2
     396:	6c87      	mov      	r2, r1
     398:	b340      	st.w      	r2, (r3, 0x0)
     39a:	3300      	movi      	r3, 0
     39c:	2b0b      	subi      	r3, 12
     39e:	60e0      	addu      	r3, r8
     3a0:	3215      	movi      	r2, 21
     3a2:	b340      	st.w      	r2, (r3, 0x0)
     3a4:	ea830126 	lrw      	r3, 0xe000e100	// 83c <csi_gpio_pin_speed_config+0xe8>
     3a8:	3200      	movi      	r2, 0
     3aa:	2a0b      	subi      	r2, 12
     3ac:	60a0      	addu      	r2, r8
     3ae:	9220      	ld.w      	r1, (r2, 0x0)
     3b0:	321f      	movi      	r2, 31
     3b2:	6884      	and      	r2, r1
     3b4:	3101      	movi      	r1, 1
     3b6:	7048      	lsl      	r1, r2
     3b8:	6c87      	mov      	r2, r1
     3ba:	b340      	st.w      	r2, (r3, 0x0)
     3bc:	3300      	movi      	r3, 0
     3be:	2b07      	subi      	r3, 8
     3c0:	60e0      	addu      	r3, r8
     3c2:	3216      	movi      	r2, 22
     3c4:	b340      	st.w      	r2, (r3, 0x0)
     3c6:	ea83011e 	lrw      	r3, 0xe000e100	// 83c <csi_gpio_pin_speed_config+0xe8>
     3ca:	3200      	movi      	r2, 0
     3cc:	2a07      	subi      	r2, 8
     3ce:	60a0      	addu      	r2, r8
     3d0:	9220      	ld.w      	r1, (r2, 0x0)
     3d2:	321f      	movi      	r2, 31
     3d4:	6884      	and      	r2, r1
     3d6:	3101      	movi      	r1, 1
     3d8:	7048      	lsl      	r1, r2
     3da:	6c87      	mov      	r2, r1
     3dc:	b340      	st.w      	r2, (r3, 0x0)
     3de:	3300      	movi      	r3, 0
     3e0:	2b03      	subi      	r3, 4
     3e2:	60e0      	addu      	r3, r8
     3e4:	3217      	movi      	r2, 23
     3e6:	b340      	st.w      	r2, (r3, 0x0)
     3e8:	ea830115 	lrw      	r3, 0xe000e100	// 83c <csi_gpio_pin_speed_config+0xe8>
     3ec:	3200      	movi      	r2, 0
     3ee:	2a03      	subi      	r2, 4
     3f0:	60a0      	addu      	r2, r8
     3f2:	9220      	ld.w      	r1, (r2, 0x0)
     3f4:	321f      	movi      	r2, 31
     3f6:	6884      	and      	r2, r1
     3f8:	3101      	movi      	r1, 1
     3fa:	7048      	lsl      	r1, r2
     3fc:	6c87      	mov      	r2, r1
     3fe:	b340      	st.w      	r2, (r3, 0x0)
	csi_vic_enable_irq(EXI0_IRQn);
	csi_vic_enable_irq(EXI1_IRQn);
	csi_vic_enable_irq(EXI2_IRQn);
	csi_vic_enable_irq(EXI3_IRQn);
	csi_vic_enable_irq(EXI4_IRQn);
    return 0;
     400:	3300      	movi      	r3, 0
}
     402:	6c0f      	mov      	r0, r3
     404:	6fa3      	mov      	r14, r8
     406:	d90e2000 	ld.w      	r8, (r14, 0x0)
     40a:	1401      	addi      	r14, r14, 4
     40c:	783c      	jmp      	r15
	...

00000410 <csi_gpio_port_config>:
   @param[in]  conr_val    expected control register value to be set
   @param[in]  pullst      pull-up/pull-down config
   @return    error code
 */
int32_t csi_gpio_port_config(gpio_port_handle_t handle, uint64_t conr_val, uint32_t pullst)
{
     410:	1422      	subi      	r14, r14, 8
     412:	b880      	st.w      	r4, (r14, 0x0)
     414:	dd0e2001 	st.w      	r8, (r14, 0x4)
     418:	6e3b      	mov      	r8, r14
     41a:	1426      	subi      	r14, r14, 24
     41c:	3400      	movi      	r4, 0
     41e:	2c0b      	subi      	r4, 12
     420:	6120      	addu      	r4, r8
     422:	b400      	st.w      	r0, (r4, 0x0)
     424:	3000      	movi      	r0, 0
     426:	2813      	subi      	r0, 20
     428:	6020      	addu      	r0, r8
     42a:	b020      	st.w      	r1, (r0, 0x0)
     42c:	b041      	st.w      	r2, (r0, 0x4)
     42e:	3200      	movi      	r2, 0
     430:	2a17      	subi      	r2, 24
     432:	60a0      	addu      	r2, r8
     434:	b260      	st.w      	r3, (r2, 0x0)
    GPIO_NULL_PARAM_CHK(handle);
     436:	3300      	movi      	r3, 0
     438:	2b0b      	subi      	r3, 12
     43a:	60e0      	addu      	r3, r8
     43c:	9360      	ld.w      	r3, (r3, 0x0)
     43e:	3b40      	cmpnei      	r3, 0
     440:	0803      	bt      	0x446	// 446 <csi_gpio_port_config+0x36>
     442:	0062      	lrw      	r3, 0x81010084	// 834 <csi_gpio_pin_speed_config+0xe0>
     444:	043b      	br      	0x4ba	// 4ba <csi_gpio_port_config+0xaa>

    dw_gpio_private_t *gpio_priv = (dw_gpio_private_t *)handle;
     446:	3300      	movi      	r3, 0
     448:	2b03      	subi      	r3, 4
     44a:	60e0      	addu      	r3, r8
     44c:	3200      	movi      	r2, 0
     44e:	2a0b      	subi      	r2, 12
     450:	60a0      	addu      	r2, r8
     452:	9240      	ld.w      	r2, (r2, 0x0)
     454:	b340      	st.w      	r2, (r3, 0x0)
    gpio_reg_ptr addr = (gpio_reg_ptr)(gpio_priv->base);
     456:	3300      	movi      	r3, 0
     458:	2b03      	subi      	r3, 4
     45a:	60e0      	addu      	r3, r8
     45c:	9360      	ld.w      	r3, (r3, 0x0)
     45e:	9340      	ld.w      	r2, (r3, 0x0)
     460:	3300      	movi      	r3, 0
     462:	2b07      	subi      	r3, 8
     464:	60e0      	addu      	r3, r8
     466:	b340      	st.w      	r2, (r3, 0x0)
	
	gpio_priv->gpio_config.CONR = conr_val;
     468:	3300      	movi      	r3, 0
     46a:	2b03      	subi      	r3, 4
     46c:	60e0      	addu      	r3, r8
     46e:	9340      	ld.w      	r2, (r3, 0x0)
     470:	3300      	movi      	r3, 0
     472:	2b13      	subi      	r3, 20
     474:	60e0      	addu      	r3, r8
     476:	9381      	ld.w      	r4, (r3, 0x4)
     478:	9360      	ld.w      	r3, (r3, 0x0)
     47a:	b261      	st.w      	r3, (r2, 0x4)
     47c:	b282      	st.w      	r4, (r2, 0x8)
	
	addr->CONHR = gpio_priv->gpio_config.w.CONHR;
     47e:	3300      	movi      	r3, 0
     480:	2b03      	subi      	r3, 4
     482:	60e0      	addu      	r3, r8
     484:	9360      	ld.w      	r3, (r3, 0x0)
     486:	9342      	ld.w      	r2, (r3, 0x8)
     488:	3300      	movi      	r3, 0
     48a:	2b07      	subi      	r3, 8
     48c:	60e0      	addu      	r3, r8
     48e:	9360      	ld.w      	r3, (r3, 0x0)
     490:	b341      	st.w      	r2, (r3, 0x4)
	addr->CONLR = gpio_priv->gpio_config.w.CONLR;
     492:	3300      	movi      	r3, 0
     494:	2b03      	subi      	r3, 4
     496:	60e0      	addu      	r3, r8
     498:	9360      	ld.w      	r3, (r3, 0x0)
     49a:	9341      	ld.w      	r2, (r3, 0x4)
     49c:	3300      	movi      	r3, 0
     49e:	2b07      	subi      	r3, 8
     4a0:	60e0      	addu      	r3, r8
     4a2:	9360      	ld.w      	r3, (r3, 0x0)
     4a4:	b340      	st.w      	r2, (r3, 0x0)
	addr->PUDR = pullst;
     4a6:	3300      	movi      	r3, 0
     4a8:	2b07      	subi      	r3, 8
     4aa:	60e0      	addu      	r3, r8
     4ac:	9360      	ld.w      	r3, (r3, 0x0)
     4ae:	3200      	movi      	r2, 0
     4b0:	2a17      	subi      	r2, 24
     4b2:	60a0      	addu      	r2, r8
     4b4:	9240      	ld.w      	r2, (r2, 0x0)
     4b6:	b348      	st.w      	r2, (r3, 0x20)
	
    return 0;
     4b8:	3300      	movi      	r3, 0
}
     4ba:	6c0f      	mov      	r0, r3
     4bc:	6fa3      	mov      	r14, r8
     4be:	d90e2001 	ld.w      	r8, (r14, 0x4)
     4c2:	9880      	ld.w      	r4, (r14, 0x0)
     4c4:	1402      	addi      	r14, r14, 8
     4c6:	783c      	jmp      	r15

000004c8 <csi_gpio_pin_func_config>:
  @param[in]   gpio_pin    pin name.
  @param[in]   pin_mode    pin mode.
  @return      error code
*/
int32_t csi_gpio_pin_func_config(gpio_pin_name gpio_pin, gpio_mode_e pin_mode)
{
     4c8:	1424      	subi      	r14, r14, 16
     4ca:	b880      	st.w      	r4, (r14, 0x0)
     4cc:	b8a1      	st.w      	r5, (r14, 0x4)
     4ce:	b8c2      	st.w      	r6, (r14, 0x8)
     4d0:	dd0e2003 	st.w      	r8, (r14, 0xc)
     4d4:	6e3b      	mov      	r8, r14
     4d6:	142e      	subi      	r14, r14, 56
     4d8:	3300      	movi      	r3, 0
     4da:	2b1b      	subi      	r3, 28
     4dc:	60e0      	addu      	r3, r8
     4de:	b300      	st.w      	r0, (r3, 0x0)
     4e0:	3300      	movi      	r3, 0
     4e2:	2b1f      	subi      	r3, 32
     4e4:	60e0      	addu      	r3, r8
     4e6:	b320      	st.w      	r1, (r3, 0x0)
    uint32_t port_idx = (gpio_pin>>4);
     4e8:	3300      	movi      	r3, 0
     4ea:	2b03      	subi      	r3, 4
     4ec:	60e0      	addu      	r3, r8
     4ee:	3200      	movi      	r2, 0
     4f0:	2a1b      	subi      	r2, 28
     4f2:	60a0      	addu      	r2, r8
     4f4:	9240      	ld.w      	r2, (r2, 0x0)
     4f6:	4a44      	lsri      	r2, r2, 4
     4f8:	b340      	st.w      	r2, (r3, 0x0)
    uint32_t pin_idx = (gpio_pin & 0xful);
     4fa:	3200      	movi      	r2, 0
     4fc:	2a07      	subi      	r2, 8
     4fe:	60a0      	addu      	r2, r8
     500:	3300      	movi      	r3, 0
     502:	2b1b      	subi      	r3, 28
     504:	60e0      	addu      	r3, r8
     506:	9320      	ld.w      	r1, (r3, 0x0)
     508:	330f      	movi      	r3, 15
     50a:	68c4      	and      	r3, r1
     50c:	b260      	st.w      	r3, (r2, 0x0)
    
	dw_gpio_private_t *gpio_priv = &gpio_intance[port_idx];
     50e:	3300      	movi      	r3, 0
     510:	2b0b      	subi      	r3, 12
     512:	60e0      	addu      	r3, r8
     514:	3200      	movi      	r2, 0
     516:	2a03      	subi      	r2, 4
     518:	60a0      	addu      	r2, r8
     51a:	9240      	ld.w      	r2, (r2, 0x0)
     51c:	4244      	lsli      	r2, r2, 4
     51e:	0136      	lrw      	r1, 0x20000030	// 840 <csi_gpio_pin_speed_config+0xec>
     520:	6084      	addu      	r2, r1
     522:	b340      	st.w      	r2, (r3, 0x0)
    gpio_reg_ptr addr = (gpio_reg_ptr)(gpio_priv->base);
     524:	3300      	movi      	r3, 0
     526:	2b0b      	subi      	r3, 12
     528:	60e0      	addu      	r3, r8
     52a:	9360      	ld.w      	r3, (r3, 0x0)
     52c:	9340      	ld.w      	r2, (r3, 0x0)
     52e:	3300      	movi      	r3, 0
     530:	2b0f      	subi      	r3, 16
     532:	60e0      	addu      	r3, r8
     534:	b340      	st.w      	r2, (r3, 0x0)
	gpio_conr_type gpio_conr_priv = gpio_priv->gpio_config;
     536:	3200      	movi      	r2, 0
     538:	2a17      	subi      	r2, 24
     53a:	60a0      	addu      	r2, r8
     53c:	3300      	movi      	r3, 0
     53e:	2b0b      	subi      	r3, 12
     540:	60e0      	addu      	r3, r8
     542:	9360      	ld.w      	r3, (r3, 0x0)
     544:	9382      	ld.w      	r4, (r3, 0x8)
     546:	9361      	ld.w      	r3, (r3, 0x4)
     548:	b260      	st.w      	r3, (r2, 0x0)
     54a:	b281      	st.w      	r4, (r2, 0x4)
	
	gpio_conr_priv.CONR &= ~(0xfull<<pin_idx*4);
     54c:	3300      	movi      	r3, 0
     54e:	2b17      	subi      	r3, 24
     550:	60e0      	addu      	r3, r8
     552:	9381      	ld.w      	r4, (r3, 0x4)
     554:	9360      	ld.w      	r3, (r3, 0x0)
     556:	3200      	movi      	r2, 0
     558:	2a37      	subi      	r2, 56
     55a:	60a0      	addu      	r2, r8
     55c:	b260      	st.w      	r3, (r2, 0x0)
     55e:	b281      	st.w      	r4, (r2, 0x4)
     560:	3300      	movi      	r3, 0
     562:	2b07      	subi      	r3, 8
     564:	60e0      	addu      	r3, r8
     566:	9360      	ld.w      	r3, (r3, 0x0)
     568:	4322      	lsli      	r1, r3, 2
     56a:	3200      	movi      	r2, 0
     56c:	2a1f      	subi      	r2, 32
     56e:	6084      	addu      	r2, r1
     570:	3adf      	btsti      	r2, 31
     572:	0806      	bt      	0x57e	// 57e <csi_gpio_pin_func_config+0xb6>
     574:	330f      	movi      	r3, 15
     576:	70c8      	lsl      	r3, r2
     578:	6d8f      	mov      	r6, r3
     57a:	3500      	movi      	r5, 0
     57c:	040d      	br      	0x596	// 596 <csi_gpio_pin_func_config+0xce>
     57e:	330f      	movi      	r3, 15
     580:	4b41      	lsri      	r2, r3, 1
     582:	331f      	movi      	r3, 31
     584:	60c6      	subu      	r3, r1
     586:	708d      	lsr      	r2, r3
     588:	3300      	movi      	r3, 0
     58a:	70c4      	lsl      	r3, r1
     58c:	6d8f      	mov      	r6, r3
     58e:	6d88      	or      	r6, r2
     590:	330f      	movi      	r3, 15
     592:	70c4      	lsl      	r3, r1
     594:	6d4f      	mov      	r5, r3
     596:	6cd7      	mov      	r3, r5
     598:	6cce      	nor      	r3, r3
     59a:	3200      	movi      	r2, 0
     59c:	2a27      	subi      	r2, 40
     59e:	60a0      	addu      	r2, r8
     5a0:	b260      	st.w      	r3, (r2, 0x0)
     5a2:	6cdb      	mov      	r3, r6
     5a4:	6cce      	nor      	r3, r3
     5a6:	3200      	movi      	r2, 0
     5a8:	2a23      	subi      	r2, 36
     5aa:	60a0      	addu      	r2, r8
     5ac:	b260      	st.w      	r3, (r2, 0x0)
     5ae:	3300      	movi      	r3, 0
     5b0:	2b37      	subi      	r3, 56
     5b2:	60e0      	addu      	r3, r8
     5b4:	9381      	ld.w      	r4, (r3, 0x4)
     5b6:	9360      	ld.w      	r3, (r3, 0x0)
     5b8:	3200      	movi      	r2, 0
     5ba:	2a27      	subi      	r2, 40
     5bc:	60a0      	addu      	r2, r8
     5be:	9220      	ld.w      	r1, (r2, 0x0)
     5c0:	9241      	ld.w      	r2, (r2, 0x4)
     5c2:	68c4      	and      	r3, r1
     5c4:	6908      	and      	r4, r2
     5c6:	3200      	movi      	r2, 0
     5c8:	2a17      	subi      	r2, 24
     5ca:	60a0      	addu      	r2, r8
     5cc:	b260      	st.w      	r3, (r2, 0x0)
     5ce:	b281      	st.w      	r4, (r2, 0x4)
	gpio_conr_priv.CONR |= (pin_mode << pin_idx*4);
     5d0:	3300      	movi      	r3, 0
     5d2:	2b17      	subi      	r3, 24
     5d4:	60e0      	addu      	r3, r8
     5d6:	9381      	ld.w      	r4, (r3, 0x4)
     5d8:	9360      	ld.w      	r3, (r3, 0x0)
     5da:	3200      	movi      	r2, 0
     5dc:	2a07      	subi      	r2, 8
     5de:	60a0      	addu      	r2, r8
     5e0:	9240      	ld.w      	r2, (r2, 0x0)
     5e2:	4242      	lsli      	r2, r2, 2
     5e4:	3100      	movi      	r1, 0
     5e6:	291f      	subi      	r1, 32
     5e8:	6060      	addu      	r1, r8
     5ea:	9120      	ld.w      	r1, (r1, 0x0)
     5ec:	7048      	lsl      	r1, r2
     5ee:	6c87      	mov      	r2, r1
     5f0:	3100      	movi      	r1, 0
     5f2:	292f      	subi      	r1, 48
     5f4:	6060      	addu      	r1, r8
     5f6:	b140      	st.w      	r2, (r1, 0x0)
     5f8:	3200      	movi      	r2, 0
     5fa:	3100      	movi      	r1, 0
     5fc:	292b      	subi      	r1, 44
     5fe:	6060      	addu      	r1, r8
     600:	b140      	st.w      	r2, (r1, 0x0)
     602:	3200      	movi      	r2, 0
     604:	2a2f      	subi      	r2, 48
     606:	60a0      	addu      	r2, r8
     608:	9220      	ld.w      	r1, (r2, 0x0)
     60a:	9241      	ld.w      	r2, (r2, 0x4)
     60c:	6c4c      	or      	r1, r3
     60e:	6c90      	or      	r2, r4
     610:	6cc7      	mov      	r3, r1
     612:	6d0b      	mov      	r4, r2
     614:	3200      	movi      	r2, 0
     616:	2a17      	subi      	r2, 24
     618:	60a0      	addu      	r2, r8
     61a:	b260      	st.w      	r3, (r2, 0x0)
     61c:	b281      	st.w      	r4, (r2, 0x4)
	
	gpio_priv->gpio_config = gpio_conr_priv;
     61e:	3300      	movi      	r3, 0
     620:	2b0b      	subi      	r3, 12
     622:	60e0      	addu      	r3, r8
     624:	9340      	ld.w      	r2, (r3, 0x0)
     626:	3300      	movi      	r3, 0
     628:	2b17      	subi      	r3, 24
     62a:	60e0      	addu      	r3, r8
     62c:	9381      	ld.w      	r4, (r3, 0x4)
     62e:	9360      	ld.w      	r3, (r3, 0x0)
     630:	b261      	st.w      	r3, (r2, 0x4)
     632:	b282      	st.w      	r4, (r2, 0x8)
	addr->CONHR = gpio_priv->gpio_config.w.CONHR;
     634:	3300      	movi      	r3, 0
     636:	2b0b      	subi      	r3, 12
     638:	60e0      	addu      	r3, r8
     63a:	9360      	ld.w      	r3, (r3, 0x0)
     63c:	9342      	ld.w      	r2, (r3, 0x8)
     63e:	3300      	movi      	r3, 0
     640:	2b0f      	subi      	r3, 16
     642:	60e0      	addu      	r3, r8
     644:	9360      	ld.w      	r3, (r3, 0x0)
     646:	b341      	st.w      	r2, (r3, 0x4)
	addr->CONLR = gpio_priv->gpio_config.w.CONLR;
     648:	3300      	movi      	r3, 0
     64a:	2b0b      	subi      	r3, 12
     64c:	60e0      	addu      	r3, r8
     64e:	9360      	ld.w      	r3, (r3, 0x0)
     650:	9341      	ld.w      	r2, (r3, 0x4)
     652:	3300      	movi      	r3, 0
     654:	2b0f      	subi      	r3, 16
     656:	60e0      	addu      	r3, r8
     658:	9360      	ld.w      	r3, (r3, 0x0)
     65a:	b340      	st.w      	r2, (r3, 0x0)
	
    return 0;
     65c:	3300      	movi      	r3, 0
} 
     65e:	6c0f      	mov      	r0, r3
     660:	6fa3      	mov      	r14, r8
     662:	d90e2003 	ld.w      	r8, (r14, 0xc)
     666:	98c2      	ld.w      	r6, (r14, 0x8)
     668:	98a1      	ld.w      	r5, (r14, 0x4)
     66a:	9880      	ld.w      	r4, (r14, 0x0)
     66c:	1404      	addi      	r14, r14, 16
     66e:	783c      	jmp      	r15

00000670 <csi_gpio_pin_pull_config>:
  @param[in]   gpio_pin    pin name.
  @param[in]   pin_mode    pull-up/down mode to be set.
  @return      error code
*/
void csi_gpio_pin_pull_config(gpio_pin_name gpio_pin, gpio_pull_e pin_mode)
{
     670:	1421      	subi      	r14, r14, 4
     672:	dd0e2000 	st.w      	r8, (r14, 0x0)
     676:	6e3b      	mov      	r8, r14
     678:	1427      	subi      	r14, r14, 28
     67a:	3300      	movi      	r3, 0
     67c:	2b17      	subi      	r3, 24
     67e:	60e0      	addu      	r3, r8
     680:	b300      	st.w      	r0, (r3, 0x0)
     682:	3300      	movi      	r3, 0
     684:	2b1b      	subi      	r3, 28
     686:	60e0      	addu      	r3, r8
     688:	b320      	st.w      	r1, (r3, 0x0)
    uint32_t port_idx = (gpio_pin>>4);
     68a:	3300      	movi      	r3, 0
     68c:	2b03      	subi      	r3, 4
     68e:	60e0      	addu      	r3, r8
     690:	3200      	movi      	r2, 0
     692:	2a17      	subi      	r2, 24
     694:	60a0      	addu      	r2, r8
     696:	9240      	ld.w      	r2, (r2, 0x0)
     698:	4a44      	lsri      	r2, r2, 4
     69a:	b340      	st.w      	r2, (r3, 0x0)
    uint32_t pin_idx = (gpio_pin & 0xful);
     69c:	3300      	movi      	r3, 0
     69e:	2b07      	subi      	r3, 8
     6a0:	60e0      	addu      	r3, r8
     6a2:	3200      	movi      	r2, 0
     6a4:	2a17      	subi      	r2, 24
     6a6:	60a0      	addu      	r2, r8
     6a8:	9220      	ld.w      	r1, (r2, 0x0)
     6aa:	320f      	movi      	r2, 15
     6ac:	6884      	and      	r2, r1
     6ae:	b340      	st.w      	r2, (r3, 0x0)

	dw_gpio_private_t *gpio_priv = &gpio_intance[port_idx];
     6b0:	3300      	movi      	r3, 0
     6b2:	2b0b      	subi      	r3, 12
     6b4:	60e0      	addu      	r3, r8
     6b6:	3200      	movi      	r2, 0
     6b8:	2a03      	subi      	r2, 4
     6ba:	60a0      	addu      	r2, r8
     6bc:	9240      	ld.w      	r2, (r2, 0x0)
     6be:	4244      	lsli      	r2, r2, 4
     6c0:	1320      	lrw      	r1, 0x20000030	// 840 <csi_gpio_pin_speed_config+0xec>
     6c2:	6084      	addu      	r2, r1
     6c4:	b340      	st.w      	r2, (r3, 0x0)
    gpio_reg_ptr addr = (gpio_reg_ptr)(gpio_priv->base);
     6c6:	3300      	movi      	r3, 0
     6c8:	2b0b      	subi      	r3, 12
     6ca:	60e0      	addu      	r3, r8
     6cc:	9360      	ld.w      	r3, (r3, 0x0)
     6ce:	9340      	ld.w      	r2, (r3, 0x0)
     6d0:	3300      	movi      	r3, 0
     6d2:	2b0f      	subi      	r3, 16
     6d4:	60e0      	addu      	r3, r8
     6d6:	b340      	st.w      	r2, (r3, 0x0)
	
	uint32_t pudr_priv = addr->PUDR;
     6d8:	3300      	movi      	r3, 0
     6da:	2b13      	subi      	r3, 20
     6dc:	60e0      	addu      	r3, r8
     6de:	3200      	movi      	r2, 0
     6e0:	2a0f      	subi      	r2, 16
     6e2:	60a0      	addu      	r2, r8
     6e4:	9240      	ld.w      	r2, (r2, 0x0)
     6e6:	9248      	ld.w      	r2, (r2, 0x20)
     6e8:	b340      	st.w      	r2, (r3, 0x0)
	pudr_priv &= ~(3ul<<pin_idx);
     6ea:	3300      	movi      	r3, 0
     6ec:	2b07      	subi      	r3, 8
     6ee:	60e0      	addu      	r3, r8
     6f0:	3203      	movi      	r2, 3
     6f2:	9360      	ld.w      	r3, (r3, 0x0)
     6f4:	708c      	lsl      	r2, r3
     6f6:	6ccb      	mov      	r3, r2
     6f8:	6cce      	nor      	r3, r3
     6fa:	6c4f      	mov      	r1, r3
     6fc:	3300      	movi      	r3, 0
     6fe:	2b13      	subi      	r3, 20
     700:	60e0      	addu      	r3, r8
     702:	3200      	movi      	r2, 0
     704:	2a13      	subi      	r2, 20
     706:	60a0      	addu      	r2, r8
     708:	9240      	ld.w      	r2, (r2, 0x0)
     70a:	6884      	and      	r2, r1
     70c:	b340      	st.w      	r2, (r3, 0x0)
    pudr_priv |= (pin_mode<<pin_idx*2);
     70e:	3300      	movi      	r3, 0
     710:	2b07      	subi      	r3, 8
     712:	60e0      	addu      	r3, r8
     714:	9360      	ld.w      	r3, (r3, 0x0)
     716:	4361      	lsli      	r3, r3, 1
     718:	3200      	movi      	r2, 0
     71a:	2a1b      	subi      	r2, 28
     71c:	60a0      	addu      	r2, r8
     71e:	9240      	ld.w      	r2, (r2, 0x0)
     720:	708c      	lsl      	r2, r3
     722:	6c4b      	mov      	r1, r2
     724:	3300      	movi      	r3, 0
     726:	2b13      	subi      	r3, 20
     728:	60e0      	addu      	r3, r8
     72a:	3200      	movi      	r2, 0
     72c:	2a13      	subi      	r2, 20
     72e:	60a0      	addu      	r2, r8
     730:	9240      	ld.w      	r2, (r2, 0x0)
     732:	6c84      	or      	r2, r1
     734:	b340      	st.w      	r2, (r3, 0x0)
	
	addr->PUDR = pudr_priv;
     736:	3300      	movi      	r3, 0
     738:	2b0f      	subi      	r3, 16
     73a:	60e0      	addu      	r3, r8
     73c:	9360      	ld.w      	r3, (r3, 0x0)
     73e:	3200      	movi      	r2, 0
     740:	2a13      	subi      	r2, 20
     742:	60a0      	addu      	r2, r8
     744:	9240      	ld.w      	r2, (r2, 0x0)
     746:	b348      	st.w      	r2, (r3, 0x20)

} 
     748:	6c00      	or      	r0, r0
     74a:	6fa3      	mov      	r14, r8
     74c:	d90e2000 	ld.w      	r8, (r14, 0x0)
     750:	1401      	addi      	r14, r14, 4
     752:	783c      	jmp      	r15

00000754 <csi_gpio_pin_speed_config>:
  @param[in]   gpio_pin    pin name.
  @param[in]   pin_mode    IO character to be set.
  @return      error code
*/
void csi_gpio_pin_speed_config(gpio_pin_name gpio_pin, gpio_char_e pin_mode)
{
     754:	1421      	subi      	r14, r14, 4
     756:	dd0e2000 	st.w      	r8, (r14, 0x0)
     75a:	6e3b      	mov      	r8, r14
     75c:	1427      	subi      	r14, r14, 28
     75e:	3300      	movi      	r3, 0
     760:	2b17      	subi      	r3, 24
     762:	60e0      	addu      	r3, r8
     764:	b300      	st.w      	r0, (r3, 0x0)
     766:	3300      	movi      	r3, 0
     768:	2b1b      	subi      	r3, 28
     76a:	60e0      	addu      	r3, r8
     76c:	b320      	st.w      	r1, (r3, 0x0)
    uint32_t port_idx = (gpio_pin>>4);
     76e:	3300      	movi      	r3, 0
     770:	2b03      	subi      	r3, 4
     772:	60e0      	addu      	r3, r8
     774:	3200      	movi      	r2, 0
     776:	2a17      	subi      	r2, 24
     778:	60a0      	addu      	r2, r8
     77a:	9240      	ld.w      	r2, (r2, 0x0)
     77c:	4a44      	lsri      	r2, r2, 4
     77e:	b340      	st.w      	r2, (r3, 0x0)
    uint32_t pin_idx = (gpio_pin & 0xful);
     780:	3300      	movi      	r3, 0
     782:	2b07      	subi      	r3, 8
     784:	60e0      	addu      	r3, r8
     786:	3200      	movi      	r2, 0
     788:	2a17      	subi      	r2, 24
     78a:	60a0      	addu      	r2, r8
     78c:	9220      	ld.w      	r1, (r2, 0x0)
     78e:	320f      	movi      	r2, 15
     790:	6884      	and      	r2, r1
     792:	b340      	st.w      	r2, (r3, 0x0)

	dw_gpio_private_t *gpio_priv = &gpio_intance[port_idx];
     794:	3300      	movi      	r3, 0
     796:	2b0b      	subi      	r3, 12
     798:	60e0      	addu      	r3, r8
     79a:	3200      	movi      	r2, 0
     79c:	2a03      	subi      	r2, 4
     79e:	60a0      	addu      	r2, r8
     7a0:	9240      	ld.w      	r2, (r2, 0x0)
     7a2:	4244      	lsli      	r2, r2, 4
     7a4:	1127      	lrw      	r1, 0x20000030	// 840 <csi_gpio_pin_speed_config+0xec>
     7a6:	6084      	addu      	r2, r1
     7a8:	b340      	st.w      	r2, (r3, 0x0)
    gpio_reg_ptr addr = (gpio_reg_ptr)(gpio_priv->base);
     7aa:	3300      	movi      	r3, 0
     7ac:	2b0b      	subi      	r3, 12
     7ae:	60e0      	addu      	r3, r8
     7b0:	9360      	ld.w      	r3, (r3, 0x0)
     7b2:	9340      	ld.w      	r2, (r3, 0x0)
     7b4:	3300      	movi      	r3, 0
     7b6:	2b0f      	subi      	r3, 16
     7b8:	60e0      	addu      	r3, r8
     7ba:	b340      	st.w      	r2, (r3, 0x0)
	
	uint32_t dscr_priv = addr->DSCR;
     7bc:	3300      	movi      	r3, 0
     7be:	2b13      	subi      	r3, 20
     7c0:	60e0      	addu      	r3, r8
     7c2:	3200      	movi      	r2, 0
     7c4:	2a0f      	subi      	r2, 16
     7c6:	60a0      	addu      	r2, r8
     7c8:	9240      	ld.w      	r2, (r2, 0x0)
     7ca:	9249      	ld.w      	r2, (r2, 0x24)
     7cc:	b340      	st.w      	r2, (r3, 0x0)
	dscr_priv &= ~(3ul<<pin_idx);
     7ce:	3300      	movi      	r3, 0
     7d0:	2b07      	subi      	r3, 8
     7d2:	60e0      	addu      	r3, r8
     7d4:	3203      	movi      	r2, 3
     7d6:	9360      	ld.w      	r3, (r3, 0x0)
     7d8:	708c      	lsl      	r2, r3
     7da:	6ccb      	mov      	r3, r2
     7dc:	6cce      	nor      	r3, r3
     7de:	6c4f      	mov      	r1, r3
     7e0:	3300      	movi      	r3, 0
     7e2:	2b13      	subi      	r3, 20
     7e4:	60e0      	addu      	r3, r8
     7e6:	3200      	movi      	r2, 0
     7e8:	2a13      	subi      	r2, 20
     7ea:	60a0      	addu      	r2, r8
     7ec:	9240      	ld.w      	r2, (r2, 0x0)
     7ee:	6884      	and      	r2, r1
     7f0:	b340      	st.w      	r2, (r3, 0x0)
    dscr_priv |= (pin_mode<<pin_idx*2);
     7f2:	3300      	movi      	r3, 0
     7f4:	2b07      	subi      	r3, 8
     7f6:	60e0      	addu      	r3, r8
     7f8:	9360      	ld.w      	r3, (r3, 0x0)
     7fa:	4361      	lsli      	r3, r3, 1
     7fc:	3200      	movi      	r2, 0
     7fe:	2a1b      	subi      	r2, 28
     800:	60a0      	addu      	r2, r8
     802:	9240      	ld.w      	r2, (r2, 0x0)
     804:	708c      	lsl      	r2, r3
     806:	6c4b      	mov      	r1, r2
     808:	3300      	movi      	r3, 0
     80a:	2b13      	subi      	r3, 20
     80c:	60e0      	addu      	r3, r8
     80e:	3200      	movi      	r2, 0
     810:	2a13      	subi      	r2, 20
     812:	60a0      	addu      	r2, r8
     814:	9240      	ld.w      	r2, (r2, 0x0)
     816:	6c84      	or      	r2, r1
     818:	b340      	st.w      	r2, (r3, 0x0)
	
	addr->DSCR = dscr_priv;
     81a:	3300      	movi      	r3, 0
     81c:	2b0f      	subi      	r3, 16
     81e:	60e0      	addu      	r3, r8
     820:	9360      	ld.w      	r3, (r3, 0x0)
     822:	3200      	movi      	r2, 0
     824:	2a13      	subi      	r2, 20
     826:	60a0      	addu      	r2, r8
     828:	9240      	ld.w      	r2, (r2, 0x0)
     82a:	b349      	st.w      	r2, (r3, 0x24)
	
} 
     82c:	6c00      	or      	r0, r0
     82e:	6fa3      	mov      	r14, r8
     830:	040a      	br      	0x844	// 844 <csi_gpio_pin_speed_config+0xf0>
     832:	0000      	bkpt
     834:	81010084 	.long	0x81010084
     838:	2000002c 	.long	0x2000002c
     83c:	e000e100 	.long	0xe000e100
     840:	20000030 	.long	0x20000030
     844:	d90e2000 	ld.w      	r8, (r14, 0x0)
     848:	1401      	addi      	r14, r14, 4
     84a:	783c      	jmp      	r15

0000084c <csi_gpio_pin_outputmode_config>:
  @param[in]   gpio_pin    pin name.
  @param[in]   pin_mode    IO character to be set.
  @return      error code
*/
void csi_gpio_pin_outputmode_config(gpio_pin_name gpio_pin, gpio_output_mode_e pin_mode)
{
     84c:	1421      	subi      	r14, r14, 4
     84e:	dd0e2000 	st.w      	r8, (r14, 0x0)
     852:	6e3b      	mov      	r8, r14
     854:	1427      	subi      	r14, r14, 28
     856:	3300      	movi      	r3, 0
     858:	2b17      	subi      	r3, 24
     85a:	60e0      	addu      	r3, r8
     85c:	b300      	st.w      	r0, (r3, 0x0)
     85e:	3300      	movi      	r3, 0
     860:	2b1b      	subi      	r3, 28
     862:	60e0      	addu      	r3, r8
     864:	b320      	st.w      	r1, (r3, 0x0)
    uint32_t port_idx = (gpio_pin>>4);
     866:	3300      	movi      	r3, 0
     868:	2b03      	subi      	r3, 4
     86a:	60e0      	addu      	r3, r8
     86c:	3200      	movi      	r2, 0
     86e:	2a17      	subi      	r2, 24
     870:	60a0      	addu      	r2, r8
     872:	9240      	ld.w      	r2, (r2, 0x0)
     874:	4a44      	lsri      	r2, r2, 4
     876:	b340      	st.w      	r2, (r3, 0x0)
    uint32_t pin_idx = (gpio_pin & 0xful);
     878:	3300      	movi      	r3, 0
     87a:	2b07      	subi      	r3, 8
     87c:	60e0      	addu      	r3, r8
     87e:	3200      	movi      	r2, 0
     880:	2a17      	subi      	r2, 24
     882:	60a0      	addu      	r2, r8
     884:	9220      	ld.w      	r1, (r2, 0x0)
     886:	320f      	movi      	r2, 15
     888:	6884      	and      	r2, r1
     88a:	b340      	st.w      	r2, (r3, 0x0)

	dw_gpio_private_t *gpio_priv = &gpio_intance[port_idx];
     88c:	3300      	movi      	r3, 0
     88e:	2b0b      	subi      	r3, 12
     890:	60e0      	addu      	r3, r8
     892:	3200      	movi      	r2, 0
     894:	2a03      	subi      	r2, 4
     896:	60a0      	addu      	r2, r8
     898:	9240      	ld.w      	r2, (r2, 0x0)
     89a:	4244      	lsli      	r2, r2, 4
     89c:	1339      	lrw      	r1, 0x20000030	// a80 <csi_gpio_pin_exi_set+0x150>
     89e:	6084      	addu      	r2, r1
     8a0:	b340      	st.w      	r2, (r3, 0x0)
    gpio_reg_ptr addr = (gpio_reg_ptr)(gpio_priv->base);
     8a2:	3300      	movi      	r3, 0
     8a4:	2b0b      	subi      	r3, 12
     8a6:	60e0      	addu      	r3, r8
     8a8:	9360      	ld.w      	r3, (r3, 0x0)
     8aa:	9340      	ld.w      	r2, (r3, 0x0)
     8ac:	3300      	movi      	r3, 0
     8ae:	2b0f      	subi      	r3, 16
     8b0:	60e0      	addu      	r3, r8
     8b2:	b340      	st.w      	r2, (r3, 0x0)
	
	uint32_t omcr_priv = addr->OMCR;
     8b4:	3300      	movi      	r3, 0
     8b6:	2b13      	subi      	r3, 20
     8b8:	60e0      	addu      	r3, r8
     8ba:	3200      	movi      	r2, 0
     8bc:	2a0f      	subi      	r2, 16
     8be:	60a0      	addu      	r2, r8
     8c0:	9240      	ld.w      	r2, (r2, 0x0)
     8c2:	924a      	ld.w      	r2, (r2, 0x28)
     8c4:	b340      	st.w      	r2, (r3, 0x0)
	omcr_priv &= ~(1ul<<pin_idx);
     8c6:	3300      	movi      	r3, 0
     8c8:	2b07      	subi      	r3, 8
     8ca:	60e0      	addu      	r3, r8
     8cc:	3201      	movi      	r2, 1
     8ce:	9360      	ld.w      	r3, (r3, 0x0)
     8d0:	708c      	lsl      	r2, r3
     8d2:	6ccb      	mov      	r3, r2
     8d4:	6cce      	nor      	r3, r3
     8d6:	6c4f      	mov      	r1, r3
     8d8:	3300      	movi      	r3, 0
     8da:	2b13      	subi      	r3, 20
     8dc:	60e0      	addu      	r3, r8
     8de:	3200      	movi      	r2, 0
     8e0:	2a13      	subi      	r2, 20
     8e2:	60a0      	addu      	r2, r8
     8e4:	9240      	ld.w      	r2, (r2, 0x0)
     8e6:	6884      	and      	r2, r1
     8e8:	b340      	st.w      	r2, (r3, 0x0)
    omcr_priv |= (pin_mode<<pin_idx);
     8ea:	3200      	movi      	r2, 0
     8ec:	2a1b      	subi      	r2, 28
     8ee:	60a0      	addu      	r2, r8
     8f0:	3300      	movi      	r3, 0
     8f2:	2b07      	subi      	r3, 8
     8f4:	60e0      	addu      	r3, r8
     8f6:	9240      	ld.w      	r2, (r2, 0x0)
     8f8:	9360      	ld.w      	r3, (r3, 0x0)
     8fa:	708c      	lsl      	r2, r3
     8fc:	6c4b      	mov      	r1, r2
     8fe:	3300      	movi      	r3, 0
     900:	2b13      	subi      	r3, 20
     902:	60e0      	addu      	r3, r8
     904:	3200      	movi      	r2, 0
     906:	2a13      	subi      	r2, 20
     908:	60a0      	addu      	r2, r8
     90a:	9240      	ld.w      	r2, (r2, 0x0)
     90c:	6c84      	or      	r2, r1
     90e:	b340      	st.w      	r2, (r3, 0x0)
	
	addr->OMCR = omcr_priv;
     910:	3300      	movi      	r3, 0
     912:	2b0f      	subi      	r3, 16
     914:	60e0      	addu      	r3, r8
     916:	9360      	ld.w      	r3, (r3, 0x0)
     918:	3200      	movi      	r2, 0
     91a:	2a13      	subi      	r2, 20
     91c:	60a0      	addu      	r2, r8
     91e:	9240      	ld.w      	r2, (r2, 0x0)
     920:	b34a      	st.w      	r2, (r3, 0x28)
	
} 
     922:	6c00      	or      	r0, r0
     924:	6fa3      	mov      	r14, r8
     926:	d90e2000 	ld.w      	r8, (r14, 0x0)
     92a:	1401      	addi      	r14, r14, 4
     92c:	783c      	jmp      	r15
	...

00000930 <csi_gpio_pin_exi_set>:
  @param[in]   handle    gpio port handle to operate.
  @param[in]   pin_num   pin number in port
  @return      none
*/
void csi_gpio_pin_exi_set(gpio_pin_name gpio_pin, bool enable)
{
     930:	1421      	subi      	r14, r14, 4
     932:	dd0e2000 	st.w      	r8, (r14, 0x0)
     936:	6e3b      	mov      	r8, r14
     938:	1426      	subi      	r14, r14, 24
     93a:	3300      	movi      	r3, 0
     93c:	2b13      	subi      	r3, 20
     93e:	60e0      	addu      	r3, r8
     940:	b300      	st.w      	r0, (r3, 0x0)
     942:	6c87      	mov      	r2, r1
     944:	3300      	movi      	r3, 0
     946:	2b14      	subi      	r3, 21
     948:	60e0      	addu      	r3, r8
     94a:	a340      	st.b      	r2, (r3, 0x0)
    uint32_t port_idx = (gpio_pin>>4);
     94c:	3300      	movi      	r3, 0
     94e:	2b03      	subi      	r3, 4
     950:	60e0      	addu      	r3, r8
     952:	3200      	movi      	r2, 0
     954:	2a13      	subi      	r2, 20
     956:	60a0      	addu      	r2, r8
     958:	9240      	ld.w      	r2, (r2, 0x0)
     95a:	4a44      	lsri      	r2, r2, 4
     95c:	b340      	st.w      	r2, (r3, 0x0)
    uint32_t pin_idx  = (gpio_pin & 0xful);
     95e:	3300      	movi      	r3, 0
     960:	2b07      	subi      	r3, 8
     962:	60e0      	addu      	r3, r8
     964:	3200      	movi      	r2, 0
     966:	2a13      	subi      	r2, 20
     968:	60a0      	addu      	r2, r8
     96a:	9220      	ld.w      	r1, (r2, 0x0)
     96c:	320f      	movi      	r2, 15
     96e:	6884      	and      	r2, r1
     970:	b340      	st.w      	r2, (r3, 0x0)

    if (enable == true) {
     972:	3300      	movi      	r3, 0
     974:	2b14      	subi      	r3, 21
     976:	60e0      	addu      	r3, r8
     978:	8360      	ld.b      	r3, (r3, 0x0)
     97a:	74cc      	zextb      	r3, r3
     97c:	3b40      	cmpnei      	r3, 0
     97e:	0c42      	bf      	0xa02	// a02 <csi_gpio_pin_exi_set+0xd2>
        if (pin_idx < 8) {
     980:	3300      	movi      	r3, 0
     982:	2b07      	subi      	r3, 8
     984:	60e0      	addu      	r3, r8
     986:	9360      	ld.w      	r3, (r3, 0x0)
     988:	3b07      	cmphsi      	r3, 8
     98a:	081f      	bt      	0x9c8	// 9c8 <csi_gpio_pin_exi_set+0x98>
            H_EXIGRP->IGRPL = ((H_EXIGRP->IGRPL) & ~(0xful<<(4*pin_idx))) | ((port_idx-1)<<(4*pin_idx)) ;
     98c:	117e      	lrw      	r3, 0x20000014	// a84 <csi_gpio_pin_exi_set+0x154>
     98e:	9360      	ld.w      	r3, (r3, 0x0)
     990:	115d      	lrw      	r2, 0x20000014	// a84 <csi_gpio_pin_exi_set+0x154>
     992:	9240      	ld.w      	r2, (r2, 0x0)
     994:	9220      	ld.w      	r1, (r2, 0x0)
     996:	3200      	movi      	r2, 0
     998:	2a07      	subi      	r2, 8
     99a:	60a0      	addu      	r2, r8
     99c:	9240      	ld.w      	r2, (r2, 0x0)
     99e:	4242      	lsli      	r2, r2, 2
     9a0:	300f      	movi      	r0, 15
     9a2:	7008      	lsl      	r0, r2
     9a4:	6c83      	mov      	r2, r0
     9a6:	6c8a      	nor      	r2, r2
     9a8:	6848      	and      	r1, r2
     9aa:	3200      	movi      	r2, 0
     9ac:	2a03      	subi      	r2, 4
     9ae:	60a0      	addu      	r2, r8
     9b0:	9240      	ld.w      	r2, (r2, 0x0)
     9b2:	5a03      	subi      	r0, r2, 1
     9b4:	3200      	movi      	r2, 0
     9b6:	2a07      	subi      	r2, 8
     9b8:	60a0      	addu      	r2, r8
     9ba:	9240      	ld.w      	r2, (r2, 0x0)
     9bc:	4242      	lsli      	r2, r2, 2
     9be:	7008      	lsl      	r0, r2
     9c0:	6c83      	mov      	r2, r0
     9c2:	6c84      	or      	r2, r1
     9c4:	b340      	st.w      	r2, (r3, 0x0)
     9c6:	041e      	br      	0xa02	// a02 <csi_gpio_pin_exi_set+0xd2>
        } else {
            H_EXIGRP->IGRPH = ((H_EXIGRP->IGRPL) & ~(0xful<<(4*pin_idx))) | ((port_idx-1)<<(4*pin_idx)) ;
     9c8:	116f      	lrw      	r3, 0x20000014	// a84 <csi_gpio_pin_exi_set+0x154>
     9ca:	9360      	ld.w      	r3, (r3, 0x0)
     9cc:	114e      	lrw      	r2, 0x20000014	// a84 <csi_gpio_pin_exi_set+0x154>
     9ce:	9240      	ld.w      	r2, (r2, 0x0)
     9d0:	9220      	ld.w      	r1, (r2, 0x0)
     9d2:	3200      	movi      	r2, 0
     9d4:	2a07      	subi      	r2, 8
     9d6:	60a0      	addu      	r2, r8
     9d8:	9240      	ld.w      	r2, (r2, 0x0)
     9da:	4242      	lsli      	r2, r2, 2
     9dc:	300f      	movi      	r0, 15
     9de:	7008      	lsl      	r0, r2
     9e0:	6c83      	mov      	r2, r0
     9e2:	6c8a      	nor      	r2, r2
     9e4:	6848      	and      	r1, r2
     9e6:	3200      	movi      	r2, 0
     9e8:	2a03      	subi      	r2, 4
     9ea:	60a0      	addu      	r2, r8
     9ec:	9240      	ld.w      	r2, (r2, 0x0)
     9ee:	5a03      	subi      	r0, r2, 1
     9f0:	3200      	movi      	r2, 0
     9f2:	2a07      	subi      	r2, 8
     9f4:	60a0      	addu      	r2, r8
     9f6:	9240      	ld.w      	r2, (r2, 0x0)
     9f8:	4242      	lsli      	r2, r2, 2
     9fa:	7008      	lsl      	r0, r2
     9fc:	6c83      	mov      	r2, r0
     9fe:	6c84      	or      	r2, r1
     a00:	b341      	st.w      	r2, (r3, 0x4)
        }
    }

	dw_gpio_private_t *gpio_priv = &gpio_intance[port_idx];
     a02:	3300      	movi      	r3, 0
     a04:	2b0b      	subi      	r3, 12
     a06:	60e0      	addu      	r3, r8
     a08:	3200      	movi      	r2, 0
     a0a:	2a03      	subi      	r2, 4
     a0c:	60a0      	addu      	r2, r8
     a0e:	9240      	ld.w      	r2, (r2, 0x0)
     a10:	4244      	lsli      	r2, r2, 4
     a12:	103c      	lrw      	r1, 0x20000030	// a80 <csi_gpio_pin_exi_set+0x150>
     a14:	6084      	addu      	r2, r1
     a16:	b340      	st.w      	r2, (r3, 0x0)
    gpio_reg_ptr addr = (gpio_reg_ptr)(gpio_priv->base);
     a18:	3300      	movi      	r3, 0
     a1a:	2b0b      	subi      	r3, 12
     a1c:	60e0      	addu      	r3, r8
     a1e:	9360      	ld.w      	r3, (r3, 0x0)
     a20:	9340      	ld.w      	r2, (r3, 0x0)
     a22:	3300      	movi      	r3, 0
     a24:	2b0f      	subi      	r3, 16
     a26:	60e0      	addu      	r3, r8
     a28:	b340      	st.w      	r2, (r3, 0x0)
	
	addr->IEER = enable<<pin_idx;
     a2a:	3300      	movi      	r3, 0
     a2c:	2b14      	subi      	r3, 21
     a2e:	60e0      	addu      	r3, r8
     a30:	8360      	ld.b      	r3, (r3, 0x0)
     a32:	748c      	zextb      	r2, r3
     a34:	3300      	movi      	r3, 0
     a36:	2b07      	subi      	r3, 8
     a38:	60e0      	addu      	r3, r8
     a3a:	9360      	ld.w      	r3, (r3, 0x0)
     a3c:	708c      	lsl      	r2, r3
     a3e:	6ccb      	mov      	r3, r2
     a40:	6c8f      	mov      	r2, r3
     a42:	3300      	movi      	r3, 0
     a44:	2b0f      	subi      	r3, 16
     a46:	60e0      	addu      	r3, r8
     a48:	9360      	ld.w      	r3, (r3, 0x0)
     a4a:	b34c      	st.w      	r2, (r3, 0x30)
	addr->IEDR = (~enable)<<pin_idx;
     a4c:	3300      	movi      	r3, 0
     a4e:	2b14      	subi      	r3, 21
     a50:	60e0      	addu      	r3, r8
     a52:	8360      	ld.b      	r3, (r3, 0x0)
     a54:	74cc      	zextb      	r3, r3
     a56:	6cce      	nor      	r3, r3
     a58:	6c8f      	mov      	r2, r3
     a5a:	3300      	movi      	r3, 0
     a5c:	2b07      	subi      	r3, 8
     a5e:	60e0      	addu      	r3, r8
     a60:	9360      	ld.w      	r3, (r3, 0x0)
     a62:	708c      	lsl      	r2, r3
     a64:	6ccb      	mov      	r3, r2
     a66:	6c8f      	mov      	r2, r3
     a68:	3300      	movi      	r3, 0
     a6a:	2b0f      	subi      	r3, 16
     a6c:	60e0      	addu      	r3, r8
     a6e:	9360      	ld.w      	r3, (r3, 0x0)
     a70:	b34d      	st.w      	r2, (r3, 0x34)
	
}
     a72:	6c00      	or      	r0, r0
     a74:	6fa3      	mov      	r14, r8
     a76:	d90e2000 	ld.w      	r8, (r14, 0x0)
     a7a:	1401      	addi      	r14, r14, 4
     a7c:	783c      	jmp      	r15
     a7e:	0000      	bkpt
     a80:	20000030 	.long	0x20000030
     a84:	20000014 	.long	0x20000014

00000a88 <csi_syscon_cb_init>:
 * @param[i]    cb:     pointer to customer ISR when EXI is called 
 * @param[i]    idx:    exi isr number to be initialized
 * @return      zero on success
*/
int32_t csi_syscon_cb_init (syscon_event_cb_t cb)
{
     a88:	1421      	subi      	r14, r14, 4
     a8a:	dd0e2000 	st.w      	r8, (r14, 0x0)
     a8e:	6e3b      	mov      	r8, r14
     a90:	1422      	subi      	r14, r14, 8
     a92:	3300      	movi      	r3, 0
     a94:	2b07      	subi      	r3, 8
     a96:	60e0      	addu      	r3, r8
     a98:	b300      	st.w      	r0, (r3, 0x0)
	SYSCON_NULL_PARAM_CHK(cb);
     a9a:	3300      	movi      	r3, 0
     a9c:	2b07      	subi      	r3, 8
     a9e:	60e0      	addu      	r3, r8
     aa0:	9360      	ld.w      	r3, (r3, 0x0)
     aa2:	3b40      	cmpnei      	r3, 0
     aa4:	0803      	bt      	0xaaa	// aaa <csi_syscon_cb_init+0x22>
     aa6:	1070      	lrw      	r3, 0x81160084	// ae4 <csi_syscon_cb_init+0x5c>
     aa8:	0418      	br      	0xad8	// ad8 <csi_syscon_cb_init+0x50>
	syscon_event_cb = cb;
     aaa:	1070      	lrw      	r3, 0x20000484	// ae8 <csi_syscon_cb_init+0x60>
     aac:	3200      	movi      	r2, 0
     aae:	2a07      	subi      	r2, 8
     ab0:	60a0      	addu      	r2, r8
     ab2:	9240      	ld.w      	r2, (r2, 0x0)
     ab4:	b340      	st.w      	r2, (r3, 0x0)
     ab6:	3300      	movi      	r3, 0
     ab8:	2b03      	subi      	r3, 4
     aba:	60e0      	addu      	r3, r8
     abc:	3201      	movi      	r2, 1
     abe:	b340      	st.w      	r2, (r3, 0x0)
     ac0:	106b      	lrw      	r3, 0xe000e100	// aec <csi_syscon_cb_init+0x64>
     ac2:	3200      	movi      	r2, 0
     ac4:	2a03      	subi      	r2, 4
     ac6:	60a0      	addu      	r2, r8
     ac8:	9220      	ld.w      	r1, (r2, 0x0)
     aca:	321f      	movi      	r2, 31
     acc:	6884      	and      	r2, r1
     ace:	3101      	movi      	r1, 1
     ad0:	7048      	lsl      	r1, r2
     ad2:	6c87      	mov      	r2, r1
     ad4:	b340      	st.w      	r2, (r3, 0x0)

    csi_vic_enable_irq(SYSCON_IRQn);
    
	return 0;
     ad6:	3300      	movi      	r3, 0
}
     ad8:	6c0f      	mov      	r0, r3
     ada:	6fa3      	mov      	r14, r8
     adc:	d90e2000 	ld.w      	r8, (r14, 0x0)
     ae0:	1401      	addi      	r14, r14, 4
     ae2:	783c      	jmp      	r15
     ae4:	81160084 	.long	0x81160084
     ae8:	20000484 	.long	0x20000484
     aec:	e000e100 	.long	0xe000e100

00000af0 <csi_syscon_emosc_config>:
  \param[in]   osc_stabletime: stable counter value (0x7 in default)
  \param[in]   osc_gain: gain control of external osc(0xf in default)
  \return      error code
*/
void csi_syscon_emosc_config(syscon_emosc_lf_e lf_sel, uint32_t osc_stabletime, uint32_t osc_gain)
{
     af0:	1421      	subi      	r14, r14, 4
     af2:	dd0e2000 	st.w      	r8, (r14, 0x0)
     af6:	6e3b      	mov      	r8, r14
     af8:	1423      	subi      	r14, r14, 12
     afa:	3300      	movi      	r3, 0
     afc:	2b03      	subi      	r3, 4
     afe:	60e0      	addu      	r3, r8
     b00:	b300      	st.w      	r0, (r3, 0x0)
     b02:	3300      	movi      	r3, 0
     b04:	2b07      	subi      	r3, 8
     b06:	60e0      	addu      	r3, r8
     b08:	b320      	st.w      	r1, (r3, 0x0)
     b0a:	3300      	movi      	r3, 0
     b0c:	2b0b      	subi      	r3, 12
     b0e:	60e0      	addu      	r3, r8
     b10:	b340      	st.w      	r2, (r3, 0x0)
	switch (lf_sel) {
     b12:	3300      	movi      	r3, 0
     b14:	2b03      	subi      	r3, 4
     b16:	60e0      	addu      	r3, r8
     b18:	9360      	ld.w      	r3, (r3, 0x0)
     b1a:	3b41      	cmpnei      	r3, 1
     b1c:	0820      	bt      	0xb5c	// b5c <csi_syscon_emosc_config+0x6c>
		case EMOSC_LF_OPTION: /* low freq emosc */
			H_SYSCON->OSTR  = osc_stabletime;
     b1e:	ea830108 	lrw      	r3, 0x20000018	// f3c <csi_syscon_systemclock_config+0x2a0>
     b22:	9360      	ld.w      	r3, (r3, 0x0)
     b24:	3200      	movi      	r2, 0
     b26:	2a07      	subi      	r2, 8
     b28:	60a0      	addu      	r2, r8
     b2a:	9240      	ld.w      	r2, (r2, 0x0)
     b2c:	b350      	st.w      	r2, (r3, 0x40)
			H_SYSCON->PWRCR = ((H_SYSCON->PWRCR) & ~(0xful<<8)) | ((osc_gain & 7ul)<<8) | PWRCR_KEY;
     b2e:	ea830104 	lrw      	r3, 0x20000018	// f3c <csi_syscon_systemclock_config+0x2a0>
     b32:	9340      	ld.w      	r2, (r3, 0x0)
     b34:	ea830102 	lrw      	r3, 0x20000018	// f3c <csi_syscon_systemclock_config+0x2a0>
     b38:	9360      	ld.w      	r3, (r3, 0x0)
     b3a:	9335      	ld.w      	r1, (r3, 0x54)
     b3c:	33f0      	movi      	r3, 240
     b3e:	4364      	lsli      	r3, r3, 4
     b40:	684d      	andn      	r1, r3
     b42:	3300      	movi      	r3, 0
     b44:	2b0b      	subi      	r3, 12
     b46:	60e0      	addu      	r3, r8
     b48:	9360      	ld.w      	r3, (r3, 0x0)
     b4a:	4308      	lsli      	r0, r3, 8
     b4c:	33e0      	movi      	r3, 224
     b4e:	4363      	lsli      	r3, r3, 3
     b50:	68c0      	and      	r3, r0
     b52:	6c4c      	or      	r1, r3
     b54:	0064      	lrw      	r3, 0xa66a0000	// f40 <csi_syscon_systemclock_config+0x2a4>
     b56:	6cc4      	or      	r3, r1
     b58:	b275      	st.w      	r3, (r2, 0x54)
			break;
     b5a:	0419      	br      	0xb8c	// b8c <csi_syscon_emosc_config+0x9c>
		default: // normal 
			H_SYSCON->OSTR  = osc_stabletime;
     b5c:	0067      	lrw      	r3, 0x20000018	// f3c <csi_syscon_systemclock_config+0x2a0>
     b5e:	9360      	ld.w      	r3, (r3, 0x0)
     b60:	3200      	movi      	r2, 0
     b62:	2a07      	subi      	r2, 8
     b64:	60a0      	addu      	r2, r8
     b66:	9240      	ld.w      	r2, (r2, 0x0)
     b68:	b350      	st.w      	r2, (r3, 0x40)
			H_SYSCON->PWRCR = ((H_SYSCON->PWRCR) & ~(0xful<<8)) | (osc_gain<<8) | PWRCR_KEY;
     b6a:	006a      	lrw      	r3, 0x20000018	// f3c <csi_syscon_systemclock_config+0x2a0>
     b6c:	9340      	ld.w      	r2, (r3, 0x0)
     b6e:	006b      	lrw      	r3, 0x20000018	// f3c <csi_syscon_systemclock_config+0x2a0>
     b70:	9360      	ld.w      	r3, (r3, 0x0)
     b72:	9335      	ld.w      	r1, (r3, 0x54)
     b74:	33f0      	movi      	r3, 240
     b76:	4364      	lsli      	r3, r3, 4
     b78:	684d      	andn      	r1, r3
     b7a:	3300      	movi      	r3, 0
     b7c:	2b0b      	subi      	r3, 12
     b7e:	60e0      	addu      	r3, r8
     b80:	9360      	ld.w      	r3, (r3, 0x0)
     b82:	4368      	lsli      	r3, r3, 8
     b84:	6c4c      	or      	r1, r3
     b86:	0070      	lrw      	r3, 0xa66a0000	// f40 <csi_syscon_systemclock_config+0x2a4>
     b88:	6cc4      	or      	r3, r1
     b8a:	b275      	st.w      	r3, (r2, 0x54)
	}

	emosc_intialized_flag = true;
     b8c:	0071      	lrw      	r3, 0x20000080	// f44 <csi_syscon_systemclock_config+0x2a8>
     b8e:	3201      	movi      	r2, 1
     b90:	a340      	st.b      	r2, (r3, 0x0)
}
     b92:	6c00      	or      	r0, r0
     b94:	6fa3      	mov      	r14, r8
     b96:	d90e2000 	ld.w      	r8, (r14, 0x0)
     b9a:	1401      	addi      	r14, r14, 4
     b9c:	783c      	jmp      	r15
	...

00000ba0 <csi_syscon_set_clocksource_switch>:
  \param[in]   clock_source: clock source to be enable or disabled
  \param[in]   status: enable or disable
  \return      error code
*/
int32_t csi_syscon_set_clocksource_switch(syscon_oscsrc_e clock_source, syscon_endis_e status)
{
     ba0:	1421      	subi      	r14, r14, 4
     ba2:	dd0e2000 	st.w      	r8, (r14, 0x0)
     ba6:	6e3b      	mov      	r8, r14
     ba8:	1424      	subi      	r14, r14, 16
     baa:	3300      	movi      	r3, 0
     bac:	2b0b      	subi      	r3, 12
     bae:	60e0      	addu      	r3, r8
     bb0:	b300      	st.w      	r0, (r3, 0x0)
     bb2:	3300      	movi      	r3, 0
     bb4:	2b0f      	subi      	r3, 16
     bb6:	60e0      	addu      	r3, r8
     bb8:	b320      	st.w      	r1, (r3, 0x0)
	volatile uint32_t i;
	uint32_t cur_clkstatus;

	if ((clock_source == EMOSC) && !emosc_intialized_flag) {
     bba:	3300      	movi      	r3, 0
     bbc:	2b0b      	subi      	r3, 12
     bbe:	60e0      	addu      	r3, r8
     bc0:	9360      	ld.w      	r3, (r3, 0x0)
     bc2:	3b44      	cmpnei      	r3, 4
     bc4:	080c      	bt      	0xbdc	// bdc <csi_syscon_set_clocksource_switch+0x3c>
     bc6:	007f      	lrw      	r3, 0x20000080	// f44 <csi_syscon_systemclock_config+0x2a8>
     bc8:	8360      	ld.b      	r3, (r3, 0x0)
     bca:	748c      	zextb      	r2, r3
     bcc:	3301      	movi      	r3, 1
     bce:	6c8d      	xor      	r2, r3
     bd0:	6ccb      	mov      	r3, r2
     bd2:	74cc      	zextb      	r3, r3
     bd4:	3b40      	cmpnei      	r3, 0
     bd6:	0c03      	bf      	0xbdc	// bdc <csi_syscon_set_clocksource_switch+0x3c>
		return ERR_SYSCON(DRV_ERROR_SPECIFIC0);
     bd8:	0163      	lrw      	r3, 0x81160085	// f48 <csi_syscon_systemclock_config+0x2ac>
     bda:	045b      	br      	0xc90	// c90 <csi_syscon_set_clocksource_switch+0xf0>
	}

	cur_clkstatus = H_SYSCON->GCSR;
     bdc:	0167      	lrw      	r3, 0x20000018	// f3c <csi_syscon_systemclock_config+0x2a0>
     bde:	9340      	ld.w      	r2, (r3, 0x0)
     be0:	3300      	movi      	r3, 0
     be2:	2b03      	subi      	r3, 4
     be4:	60e0      	addu      	r3, r8
     be6:	9243      	ld.w      	r2, (r2, 0xc)
     be8:	b340      	st.w      	r2, (r3, 0x0)
	if (status == ENABLE) {
     bea:	3300      	movi      	r3, 0
     bec:	2b0f      	subi      	r3, 16
     bee:	60e0      	addu      	r3, r8
     bf0:	9360      	ld.w      	r3, (r3, 0x0)
     bf2:	3b40      	cmpnei      	r3, 0
     bf4:	0816      	bt      	0xc20	// c20 <csi_syscon_set_clocksource_switch+0x80>
		H_SYSCON->GCER = clock_source;
     bf6:	016d      	lrw      	r3, 0x20000018	// f3c <csi_syscon_systemclock_config+0x2a0>
     bf8:	9360      	ld.w      	r3, (r3, 0x0)
     bfa:	3200      	movi      	r2, 0
     bfc:	2a0b      	subi      	r2, 12
     bfe:	60a0      	addu      	r2, r8
     c00:	9240      	ld.w      	r2, (r2, 0x0)
     c02:	b341      	st.w      	r2, (r3, 0x4)
		cur_clkstatus |= clock_source;
     c04:	3300      	movi      	r3, 0
     c06:	2b03      	subi      	r3, 4
     c08:	60e0      	addu      	r3, r8
     c0a:	3100      	movi      	r1, 0
     c0c:	2903      	subi      	r1, 4
     c0e:	6060      	addu      	r1, r8
     c10:	3200      	movi      	r2, 0
     c12:	2a0b      	subi      	r2, 12
     c14:	60a0      	addu      	r2, r8
     c16:	9120      	ld.w      	r1, (r1, 0x0)
     c18:	9240      	ld.w      	r2, (r2, 0x0)
     c1a:	6c84      	or      	r2, r1
     c1c:	b340      	st.w      	r2, (r3, 0x0)
     c1e:	0417      	br      	0xc4c	// c4c <csi_syscon_set_clocksource_switch+0xac>
	}
	else {
		H_SYSCON->GCDR = clock_source;
     c20:	0178      	lrw      	r3, 0x20000018	// f3c <csi_syscon_systemclock_config+0x2a0>
     c22:	9360      	ld.w      	r3, (r3, 0x0)
     c24:	3200      	movi      	r2, 0
     c26:	2a0b      	subi      	r2, 12
     c28:	60a0      	addu      	r2, r8
     c2a:	9240      	ld.w      	r2, (r2, 0x0)
     c2c:	b342      	st.w      	r2, (r3, 0x8)
		cur_clkstatus &= ~clock_source;
     c2e:	3300      	movi      	r3, 0
     c30:	2b0b      	subi      	r3, 12
     c32:	60e0      	addu      	r3, r8
     c34:	9360      	ld.w      	r3, (r3, 0x0)
     c36:	6cce      	nor      	r3, r3
     c38:	6c4f      	mov      	r1, r3
     c3a:	3300      	movi      	r3, 0
     c3c:	2b03      	subi      	r3, 4
     c3e:	60e0      	addu      	r3, r8
     c40:	3200      	movi      	r2, 0
     c42:	2a03      	subi      	r2, 4
     c44:	60a0      	addu      	r2, r8
     c46:	9240      	ld.w      	r2, (r2, 0x0)
     c48:	6884      	and      	r2, r1
     c4a:	b340      	st.w      	r2, (r3, 0x0)
	}

	for (i=0;i<100;i++);
     c4c:	3300      	movi      	r3, 0
     c4e:	2b07      	subi      	r3, 8
     c50:	60e0      	addu      	r3, r8
     c52:	3200      	movi      	r2, 0
     c54:	b340      	st.w      	r2, (r3, 0x0)
     c56:	040a      	br      	0xc6a	// c6a <csi_syscon_set_clocksource_switch+0xca>
     c58:	3300      	movi      	r3, 0
     c5a:	2b07      	subi      	r3, 8
     c5c:	60e0      	addu      	r3, r8
     c5e:	9360      	ld.w      	r3, (r3, 0x0)
     c60:	5b42      	addi      	r2, r3, 1
     c62:	3300      	movi      	r3, 0
     c64:	2b07      	subi      	r3, 8
     c66:	60e0      	addu      	r3, r8
     c68:	b340      	st.w      	r2, (r3, 0x0)
     c6a:	3300      	movi      	r3, 0
     c6c:	2b07      	subi      	r3, 8
     c6e:	60e0      	addu      	r3, r8
     c70:	9340      	ld.w      	r2, (r3, 0x0)
     c72:	3363      	movi      	r3, 99
     c74:	648c      	cmphs      	r3, r2
     c76:	0bf1      	bt      	0xc58	// c58 <csi_syscon_set_clocksource_switch+0xb8>

	if (H_SYSCON->GCSR != cur_clkstatus) {
     c78:	026e      	lrw      	r3, 0x20000018	// f3c <csi_syscon_systemclock_config+0x2a0>
     c7a:	9360      	ld.w      	r3, (r3, 0x0)
     c7c:	9343      	ld.w      	r2, (r3, 0xc)
     c7e:	3300      	movi      	r3, 0
     c80:	2b03      	subi      	r3, 4
     c82:	60e0      	addu      	r3, r8
     c84:	9360      	ld.w      	r3, (r3, 0x0)
     c86:	64ca      	cmpne      	r2, r3
     c88:	0c03      	bf      	0xc8e	// c8e <csi_syscon_set_clocksource_switch+0xee>
		return ERR_SYSCON(DRV_ERROR_SPECIFIC1);
     c8a:	026e      	lrw      	r3, 0x81160086	// f4c <csi_syscon_systemclock_config+0x2b0>
     c8c:	0402      	br      	0xc90	// c90 <csi_syscon_set_clocksource_switch+0xf0>
	}
	else {
		return 0;
     c8e:	3300      	movi      	r3, 0
	}
}
     c90:	6c0f      	mov      	r0, r3
     c92:	6fa3      	mov      	r14, r8
     c94:	d90e2000 	ld.w      	r8, (r14, 0x0)
     c98:	1401      	addi      	r14, r14, 4
     c9a:	783c      	jmp      	r15

00000c9c <csi_syscon_systemclock_config>:
  \param[in]   hclk_freq: value of target hclk frequence
  \param[in]   pclk_freq: value of target hclk frequence
  \return      error code
*/
int32_t csi_syscon_systemclock_config(syscon_sysclk_e sysclk_setup, uint32_t hclk_freq, uint32_t pclk_freq)
{
     c9c:	1423      	subi      	r14, r14, 12
     c9e:	b880      	st.w      	r4, (r14, 0x0)
     ca0:	dd0e2001 	st.w      	r8, (r14, 0x4)
     ca4:	ddee2002 	st.w      	r15, (r14, 0x8)
     ca8:	6e3b      	mov      	r8, r14
     caa:	1429      	subi      	r14, r14, 36
     cac:	3300      	movi      	r3, 0
     cae:	2b1b      	subi      	r3, 28
     cb0:	60e0      	addu      	r3, r8
     cb2:	b300      	st.w      	r0, (r3, 0x0)
     cb4:	3300      	movi      	r3, 0
     cb6:	2b1f      	subi      	r3, 32
     cb8:	60e0      	addu      	r3, r8
     cba:	b320      	st.w      	r1, (r3, 0x0)
     cbc:	3300      	movi      	r3, 0
     cbe:	2b23      	subi      	r3, 36
     cc0:	60e0      	addu      	r3, r8
     cc2:	b340      	st.w      	r2, (r3, 0x0)
	volatile uint32_t i;
	uint32_t target_sysclk_freq = 0;
     cc4:	3300      	movi      	r3, 0
     cc6:	2b03      	subi      	r3, 4
     cc8:	60e0      	addu      	r3, r8
     cca:	3200      	movi      	r2, 0
     ccc:	b340      	st.w      	r2, (r3, 0x0)
	uint32_t target_hclk_freq, hclk_div;
	uint32_t target_pclk_freq, pclk_div;

	// parameter check
	if (hclk_freq < pclk_freq) {
     cce:	3200      	movi      	r2, 0
     cd0:	2a1f      	subi      	r2, 32
     cd2:	60a0      	addu      	r2, r8
     cd4:	3300      	movi      	r3, 0
     cd6:	2b23      	subi      	r3, 36
     cd8:	60e0      	addu      	r3, r8
     cda:	9240      	ld.w      	r2, (r2, 0x0)
     cdc:	9360      	ld.w      	r3, (r3, 0x0)
     cde:	64c8      	cmphs      	r2, r3
     ce0:	0804      	bt      	0xce8	// ce8 <csi_syscon_systemclock_config+0x4c>
		return ERR_SYSCON(DRV_ERROR_PARAMETER);
     ce2:	0363      	lrw      	r3, 0x81160084	// f50 <csi_syscon_systemclock_config+0x2b4>
     ce4:	e800026f 	br      	0x11c2	// 11c2 <csi_syscon_systemclock_config+0x526>
	}

	switch (sysclk_setup) {
     ce8:	3300      	movi      	r3, 0
     cea:	2b1b      	subi      	r3, 28
     cec:	60e0      	addu      	r3, r8
     cee:	9360      	ld.w      	r3, (r3, 0x0)
     cf0:	3b41      	cmpnei      	r3, 1
     cf2:	0c18      	bf      	0xd22	// d22 <csi_syscon_systemclock_config+0x86>
     cf4:	3b00      	cmphsi      	r3, 1
     cf6:	0c36      	bf      	0xd62	// d62 <csi_syscon_systemclock_config+0xc6>
     cf8:	3b42      	cmpnei      	r3, 2
     cfa:	0c04      	bf      	0xd02	// d02 <csi_syscon_systemclock_config+0x66>
     cfc:	3b43      	cmpnei      	r3, 3
     cfe:	0c22      	bf      	0xd42	// d42 <csi_syscon_systemclock_config+0xa6>
     d00:	0441      	br      	0xd82	// d82 <csi_syscon_systemclock_config+0xe6>
		case IMOSC_40M:
			if ( hclk_freq <= 40000000 ) {
     d02:	3300      	movi      	r3, 0
     d04:	2b1f      	subi      	r3, 32
     d06:	60e0      	addu      	r3, r8
     d08:	9340      	ld.w      	r2, (r3, 0x0)
     d0a:	036c      	lrw      	r3, 0x2625a00	// f54 <csi_syscon_systemclock_config+0x2b8>
     d0c:	648c      	cmphs      	r3, r2
     d0e:	0c07      	bf      	0xd1c	// d1c <csi_syscon_systemclock_config+0x80>
				target_sysclk_freq = 40000000;
     d10:	3300      	movi      	r3, 0
     d12:	2b03      	subi      	r3, 4
     d14:	60e0      	addu      	r3, r8
     d16:	034f      	lrw      	r2, 0x2625a00	// f54 <csi_syscon_systemclock_config+0x2b8>
     d18:	b340      	st.w      	r2, (r3, 0x0)
			} else {
				return ERR_SYSCON(DRV_ERROR_PARAMETER);
			}
			break;
     d1a:	0434      	br      	0xd82	// d82 <csi_syscon_systemclock_config+0xe6>
				return ERR_SYSCON(DRV_ERROR_PARAMETER);
     d1c:	0372      	lrw      	r3, 0x81160084	// f50 <csi_syscon_systemclock_config+0x2b4>
     d1e:	e8000252 	br      	0x11c2	// 11c2 <csi_syscon_systemclock_config+0x526>
		case IMOSC_20M:
			if ( hclk_freq <= 20000000 ) {
     d22:	3300      	movi      	r3, 0
     d24:	2b1f      	subi      	r3, 32
     d26:	60e0      	addu      	r3, r8
     d28:	9340      	ld.w      	r2, (r3, 0x0)
     d2a:	0373      	lrw      	r3, 0x1312d00	// f58 <csi_syscon_systemclock_config+0x2bc>
     d2c:	648c      	cmphs      	r3, r2
     d2e:	0c07      	bf      	0xd3c	// d3c <csi_syscon_systemclock_config+0xa0>
				target_sysclk_freq = 20000000;
     d30:	3300      	movi      	r3, 0
     d32:	2b03      	subi      	r3, 4
     d34:	60e0      	addu      	r3, r8
     d36:	0356      	lrw      	r2, 0x1312d00	// f58 <csi_syscon_systemclock_config+0x2bc>
     d38:	b340      	st.w      	r2, (r3, 0x0)
			} else {
				return ERR_SYSCON(DRV_ERROR_PARAMETER);
			}
			break;
     d3a:	0424      	br      	0xd82	// d82 <csi_syscon_systemclock_config+0xe6>
				return ERR_SYSCON(DRV_ERROR_PARAMETER);
     d3c:	037a      	lrw      	r3, 0x81160084	// f50 <csi_syscon_systemclock_config+0x2b4>
     d3e:	e8000242 	br      	0x11c2	// 11c2 <csi_syscon_systemclock_config+0x526>
		case EMOSC_24M:
			if ( (hclk_freq <= EMOSC_FREQ) && (EMOSC_FREQ <= 24000000) ) {
     d42:	3300      	movi      	r3, 0
     d44:	2b1f      	subi      	r3, 32
     d46:	60e0      	addu      	r3, r8
     d48:	9340      	ld.w      	r2, (r3, 0x0)
     d4a:	037a      	lrw      	r3, 0x989680	// f5c <csi_syscon_systemclock_config+0x2c0>
     d4c:	648c      	cmphs      	r3, r2
     d4e:	0c07      	bf      	0xd5c	// d5c <csi_syscon_systemclock_config+0xc0>
				target_sysclk_freq = EMOSC_FREQ;
     d50:	3300      	movi      	r3, 0
     d52:	2b03      	subi      	r3, 4
     d54:	60e0      	addu      	r3, r8
     d56:	035d      	lrw      	r2, 0x989680	// f5c <csi_syscon_systemclock_config+0x2c0>
     d58:	b340      	st.w      	r2, (r3, 0x0)
			} else {
				return ERR_SYSCON(DRV_ERROR_PARAMETER);
			}
			break;
     d5a:	0414      	br      	0xd82	// d82 <csi_syscon_systemclock_config+0xe6>
				return ERR_SYSCON(DRV_ERROR_PARAMETER);
     d5c:	137d      	lrw      	r3, 0x81160084	// f50 <csi_syscon_systemclock_config+0x2b4>
     d5e:	e8000232 	br      	0x11c2	// 11c2 <csi_syscon_systemclock_config+0x526>
		case ISOSC_3M:
			if ( (hclk_freq <= 3000000) ) {
     d62:	3300      	movi      	r3, 0
     d64:	2b1f      	subi      	r3, 32
     d66:	60e0      	addu      	r3, r8
     d68:	9340      	ld.w      	r2, (r3, 0x0)
     d6a:	137e      	lrw      	r3, 0x2dc6c0	// f60 <csi_syscon_systemclock_config+0x2c4>
     d6c:	648c      	cmphs      	r3, r2
     d6e:	0c07      	bf      	0xd7c	// d7c <csi_syscon_systemclock_config+0xe0>
				target_sysclk_freq = 3000000;
     d70:	3300      	movi      	r3, 0
     d72:	2b03      	subi      	r3, 4
     d74:	60e0      	addu      	r3, r8
     d76:	135b      	lrw      	r2, 0x2dc6c0	// f60 <csi_syscon_systemclock_config+0x2c4>
     d78:	b340      	st.w      	r2, (r3, 0x0)
			} else {
				return ERR_SYSCON(DRV_ERROR_PARAMETER);
			}
			break;
     d7a:	0404      	br      	0xd82	// d82 <csi_syscon_systemclock_config+0xe6>
				return ERR_SYSCON(DRV_ERROR_PARAMETER);
     d7c:	1375      	lrw      	r3, 0x81160084	// f50 <csi_syscon_systemclock_config+0x2b4>
     d7e:	e8000222 	br      	0x11c2	// 11c2 <csi_syscon_systemclock_config+0x526>
	}
	target_hclk_freq = hclk_freq;
     d82:	3300      	movi      	r3, 0
     d84:	2b07      	subi      	r3, 8
     d86:	60e0      	addu      	r3, r8
     d88:	3200      	movi      	r2, 0
     d8a:	2a1f      	subi      	r2, 32
     d8c:	60a0      	addu      	r2, r8
     d8e:	9240      	ld.w      	r2, (r2, 0x0)
     d90:	b340      	st.w      	r2, (r3, 0x0)

	hclk_div = target_sysclk_freq/target_hclk_freq;
     d92:	3400      	movi      	r4, 0
     d94:	2c0b      	subi      	r4, 12
     d96:	6120      	addu      	r4, r8
     d98:	3300      	movi      	r3, 0
     d9a:	2b03      	subi      	r3, 4
     d9c:	60e0      	addu      	r3, r8
     d9e:	3200      	movi      	r2, 0
     da0:	2a07      	subi      	r2, 8
     da2:	60a0      	addu      	r2, r8
     da4:	9220      	ld.w      	r1, (r2, 0x0)
     da6:	9300      	ld.w      	r0, (r3, 0x0)
     da8:	e0000c1c 	bsr      	0x25e0	// 25e0 <__udiv32>
     dac:	6cc3      	mov      	r3, r0
     dae:	b460      	st.w      	r3, (r4, 0x0)
	target_hclk_freq = target_sysclk_freq/hclk_div;
     db0:	3400      	movi      	r4, 0
     db2:	2c07      	subi      	r4, 8
     db4:	6120      	addu      	r4, r8
     db6:	3300      	movi      	r3, 0
     db8:	2b03      	subi      	r3, 4
     dba:	60e0      	addu      	r3, r8
     dbc:	3200      	movi      	r2, 0
     dbe:	2a0b      	subi      	r2, 12
     dc0:	60a0      	addu      	r2, r8
     dc2:	9220      	ld.w      	r1, (r2, 0x0)
     dc4:	9300      	ld.w      	r0, (r3, 0x0)
     dc6:	e0000c0d 	bsr      	0x25e0	// 25e0 <__udiv32>
     dca:	6cc3      	mov      	r3, r0
     dcc:	b460      	st.w      	r3, (r4, 0x0)
	pclk_div = hclk_freq/pclk_freq;
     dce:	3400      	movi      	r4, 0
     dd0:	2c0f      	subi      	r4, 16
     dd2:	6120      	addu      	r4, r8
     dd4:	3300      	movi      	r3, 0
     dd6:	2b1f      	subi      	r3, 32
     dd8:	60e0      	addu      	r3, r8
     dda:	3200      	movi      	r2, 0
     ddc:	2a23      	subi      	r2, 36
     dde:	60a0      	addu      	r2, r8
     de0:	9220      	ld.w      	r1, (r2, 0x0)
     de2:	9300      	ld.w      	r0, (r3, 0x0)
     de4:	e0000bfe 	bsr      	0x25e0	// 25e0 <__udiv32>
     de8:	6cc3      	mov      	r3, r0
     dea:	b460      	st.w      	r3, (r4, 0x0)
	target_pclk_freq = target_hclk_freq/pclk_div;
     dec:	3400      	movi      	r4, 0
     dee:	2c13      	subi      	r4, 20
     df0:	6120      	addu      	r4, r8
     df2:	3300      	movi      	r3, 0
     df4:	2b07      	subi      	r3, 8
     df6:	60e0      	addu      	r3, r8
     df8:	3200      	movi      	r2, 0
     dfa:	2a0f      	subi      	r2, 16
     dfc:	60a0      	addu      	r2, r8
     dfe:	9220      	ld.w      	r1, (r2, 0x0)
     e00:	9300      	ld.w      	r0, (r3, 0x0)
     e02:	e0000bef 	bsr      	0x25e0	// 25e0 <__udiv32>
     e06:	6cc3      	mov      	r3, r0
     e08:	b460      	st.w      	r3, (r4, 0x0)

	// switch system clock as IMO40M
	if ((sysclk_cfg._cur_sysclk == IMOSC_20M) && (sysclk_setup == IMOSC_40M)) {
     e0a:	1277      	lrw      	r3, 0x2000001c	// f64 <csi_syscon_systemclock_config+0x2c8>
     e0c:	9360      	ld.w      	r3, (r3, 0x0)
     e0e:	3b41      	cmpnei      	r3, 1
     e10:	0892      	bt      	0xf34	// f34 <csi_syscon_systemclock_config+0x298>
     e12:	3300      	movi      	r3, 0
     e14:	2b1b      	subi      	r3, 28
     e16:	60e0      	addu      	r3, r8
     e18:	9360      	ld.w      	r3, (r3, 0x0)
     e1a:	3b42      	cmpnei      	r3, 2
     e1c:	088c      	bt      	0xf34	// f34 <csi_syscon_systemclock_config+0x298>
		H_SYSCON->GCER = 1; // enable ISOSC
     e1e:	1268      	lrw      	r3, 0x20000018	// f3c <csi_syscon_systemclock_config+0x2a0>
     e20:	9360      	ld.w      	r3, (r3, 0x0)
     e22:	3201      	movi      	r2, 1
     e24:	b341      	st.w      	r2, (r3, 0x4)
		for (i=0;i<100;i++);
     e26:	3300      	movi      	r3, 0
     e28:	2b17      	subi      	r3, 24
     e2a:	60e0      	addu      	r3, r8
     e2c:	3200      	movi      	r2, 0
     e2e:	b340      	st.w      	r2, (r3, 0x0)
     e30:	040a      	br      	0xe44	// e44 <csi_syscon_systemclock_config+0x1a8>
     e32:	3300      	movi      	r3, 0
     e34:	2b17      	subi      	r3, 24
     e36:	60e0      	addu      	r3, r8
     e38:	9360      	ld.w      	r3, (r3, 0x0)
     e3a:	5b42      	addi      	r2, r3, 1
     e3c:	3300      	movi      	r3, 0
     e3e:	2b17      	subi      	r3, 24
     e40:	60e0      	addu      	r3, r8
     e42:	b340      	st.w      	r2, (r3, 0x0)
     e44:	3300      	movi      	r3, 0
     e46:	2b17      	subi      	r3, 24
     e48:	60e0      	addu      	r3, r8
     e4a:	9340      	ld.w      	r2, (r3, 0x0)
     e4c:	3363      	movi      	r3, 99
     e4e:	648c      	cmphs      	r3, r2
     e50:	0bf1      	bt      	0xe32	// e32 <csi_syscon_systemclock_config+0x196>
		H_SYSCON->SCLKCR = (4 | SCLKCR_KEY); // switch to ISOSC as sysclk
     e52:	117b      	lrw      	r3, 0x20000018	// f3c <csi_syscon_systemclock_config+0x2a0>
     e54:	9360      	ld.w      	r3, (r3, 0x0)
     e56:	1245      	lrw      	r2, 0xd22d0004	// f68 <csi_syscon_systemclock_config+0x2cc>
     e58:	b347      	st.w      	r2, (r3, 0x1c)
		for (i=0;i<10;i++);
     e5a:	3300      	movi      	r3, 0
     e5c:	2b17      	subi      	r3, 24
     e5e:	60e0      	addu      	r3, r8
     e60:	3200      	movi      	r2, 0
     e62:	b340      	st.w      	r2, (r3, 0x0)
     e64:	040a      	br      	0xe78	// e78 <csi_syscon_systemclock_config+0x1dc>
     e66:	3300      	movi      	r3, 0
     e68:	2b17      	subi      	r3, 24
     e6a:	60e0      	addu      	r3, r8
     e6c:	9360      	ld.w      	r3, (r3, 0x0)
     e6e:	5b42      	addi      	r2, r3, 1
     e70:	3300      	movi      	r3, 0
     e72:	2b17      	subi      	r3, 24
     e74:	60e0      	addu      	r3, r8
     e76:	b340      	st.w      	r2, (r3, 0x0)
     e78:	3300      	movi      	r3, 0
     e7a:	2b17      	subi      	r3, 24
     e7c:	60e0      	addu      	r3, r8
     e7e:	9360      	ld.w      	r3, (r3, 0x0)
     e80:	3b09      	cmphsi      	r3, 10
     e82:	0ff2      	bf      	0xe66	// e66 <csi_syscon_systemclock_config+0x1ca>
		if ((H_SYSCON->ERRINF) & (1ul<<4)) {
     e84:	116e      	lrw      	r3, 0x20000018	// f3c <csi_syscon_systemclock_config+0x2a0>
     e86:	9360      	ld.w      	r3, (r3, 0x0)
     e88:	23eb      	addi      	r3, 236
     e8a:	9340      	ld.w      	r2, (r3, 0x0)
     e8c:	3310      	movi      	r3, 16
     e8e:	68c8      	and      	r3, r2
     e90:	3b40      	cmpnei      	r3, 0
     e92:	0c03      	bf      	0xe98	// e98 <csi_syscon_systemclock_config+0x1fc>
			return ERR_SYSCON(DRV_ERROR_SPECIFIC2);
     e94:	1176      	lrw      	r3, 0x81160087	// f6c <csi_syscon_systemclock_config+0x2d0>
     e96:	0596      	br      	0x11c2	// 11c2 <csi_syscon_systemclock_config+0x526>
		}
		H_SYSCON->GCDR = 2; // disable IMOSC
     e98:	1169      	lrw      	r3, 0x20000018	// f3c <csi_syscon_systemclock_config+0x2a0>
     e9a:	9360      	ld.w      	r3, (r3, 0x0)
     e9c:	3202      	movi      	r2, 2
     e9e:	b342      	st.w      	r2, (r3, 0x8)
		H_SYSCON->CLCR |= (1ul<<22);
     ea0:	1167      	lrw      	r3, 0x20000018	// f3c <csi_syscon_systemclock_config+0x2a0>
     ea2:	9360      	ld.w      	r3, (r3, 0x0)
     ea4:	1146      	lrw      	r2, 0x20000018	// f3c <csi_syscon_systemclock_config+0x2a0>
     ea6:	9240      	ld.w      	r2, (r2, 0x0)
     ea8:	9254      	ld.w      	r2, (r2, 0x50)
     eaa:	3ab6      	bseti      	r2, 22
     eac:	b354      	st.w      	r2, (r3, 0x50)
		H_SYSCON->GCER = 2; // enable IMOSC
     eae:	1164      	lrw      	r3, 0x20000018	// f3c <csi_syscon_systemclock_config+0x2a0>
     eb0:	9360      	ld.w      	r3, (r3, 0x0)
     eb2:	3202      	movi      	r2, 2
     eb4:	b341      	st.w      	r2, (r3, 0x4)
		for (i=0;i<100;i++);
     eb6:	3300      	movi      	r3, 0
     eb8:	2b17      	subi      	r3, 24
     eba:	60e0      	addu      	r3, r8
     ebc:	3200      	movi      	r2, 0
     ebe:	b340      	st.w      	r2, (r3, 0x0)
     ec0:	040a      	br      	0xed4	// ed4 <csi_syscon_systemclock_config+0x238>
     ec2:	3300      	movi      	r3, 0
     ec4:	2b17      	subi      	r3, 24
     ec6:	60e0      	addu      	r3, r8
     ec8:	9360      	ld.w      	r3, (r3, 0x0)
     eca:	5b42      	addi      	r2, r3, 1
     ecc:	3300      	movi      	r3, 0
     ece:	2b17      	subi      	r3, 24
     ed0:	60e0      	addu      	r3, r8
     ed2:	b340      	st.w      	r2, (r3, 0x0)
     ed4:	3300      	movi      	r3, 0
     ed6:	2b17      	subi      	r3, 24
     ed8:	60e0      	addu      	r3, r8
     eda:	9340      	ld.w      	r2, (r3, 0x0)
     edc:	3363      	movi      	r3, 99
     ede:	648c      	cmphs      	r3, r2
     ee0:	0bf1      	bt      	0xec2	// ec2 <csi_syscon_systemclock_config+0x226>
		H_SYSCON->SCLKCR = ((hclk_div<<8)|SCLKCR_KEY);
     ee2:	1077      	lrw      	r3, 0x20000018	// f3c <csi_syscon_systemclock_config+0x2a0>
     ee4:	9360      	ld.w      	r3, (r3, 0x0)
     ee6:	3200      	movi      	r2, 0
     ee8:	2a0b      	subi      	r2, 12
     eea:	60a0      	addu      	r2, r8
     eec:	9240      	ld.w      	r2, (r2, 0x0)
     eee:	4228      	lsli      	r1, r2, 8
     ef0:	1140      	lrw      	r2, 0xd22d0000	// f70 <csi_syscon_systemclock_config+0x2d4>
     ef2:	6c84      	or      	r2, r1
     ef4:	b347      	st.w      	r2, (r3, 0x1c)
		for (i=0;i<10;i++);
     ef6:	3300      	movi      	r3, 0
     ef8:	2b17      	subi      	r3, 24
     efa:	60e0      	addu      	r3, r8
     efc:	3200      	movi      	r2, 0
     efe:	b340      	st.w      	r2, (r3, 0x0)
     f00:	040a      	br      	0xf14	// f14 <csi_syscon_systemclock_config+0x278>
     f02:	3300      	movi      	r3, 0
     f04:	2b17      	subi      	r3, 24
     f06:	60e0      	addu      	r3, r8
     f08:	9360      	ld.w      	r3, (r3, 0x0)
     f0a:	5b42      	addi      	r2, r3, 1
     f0c:	3300      	movi      	r3, 0
     f0e:	2b17      	subi      	r3, 24
     f10:	60e0      	addu      	r3, r8
     f12:	b340      	st.w      	r2, (r3, 0x0)
     f14:	3300      	movi      	r3, 0
     f16:	2b17      	subi      	r3, 24
     f18:	60e0      	addu      	r3, r8
     f1a:	9360      	ld.w      	r3, (r3, 0x0)
     f1c:	3b09      	cmphsi      	r3, 10
     f1e:	0ff2      	bf      	0xf02	// f02 <csi_syscon_systemclock_config+0x266>
		if ((H_SYSCON->ERRINF) & (1ul<<4)) {
     f20:	1067      	lrw      	r3, 0x20000018	// f3c <csi_syscon_systemclock_config+0x2a0>
     f22:	9360      	ld.w      	r3, (r3, 0x0)
     f24:	23eb      	addi      	r3, 236
     f26:	9340      	ld.w      	r2, (r3, 0x0)
     f28:	3310      	movi      	r3, 16
     f2a:	68c8      	and      	r3, r2
     f2c:	3b40      	cmpnei      	r3, 0
     f2e:	0d2d      	bf      	0x1188	// 1188 <csi_syscon_systemclock_config+0x4ec>
			return ERR_SYSCON(DRV_ERROR_SPECIFIC3);
     f30:	1071      	lrw      	r3, 0x81160088	// f74 <csi_syscon_systemclock_config+0x2d8>
     f32:	0548      	br      	0x11c2	// 11c2 <csi_syscon_systemclock_config+0x526>
		}
	}
	// switch system clock as IMO20M
	else if ((sysclk_cfg._cur_sysclk == IMOSC_40M) && (sysclk_setup == IMOSC_20M)) {
     f34:	106c      	lrw      	r3, 0x2000001c	// f64 <csi_syscon_systemclock_config+0x2c8>
     f36:	9360      	ld.w      	r3, (r3, 0x0)
     f38:	3b42      	cmpnei      	r3, 2
     f3a:	041f      	br      	0xf78	// f78 <csi_syscon_systemclock_config+0x2dc>
     f3c:	20000018 	.long	0x20000018
     f40:	a66a0000 	.long	0xa66a0000
     f44:	20000080 	.long	0x20000080
     f48:	81160085 	.long	0x81160085
     f4c:	81160086 	.long	0x81160086
     f50:	81160084 	.long	0x81160084
     f54:	02625a00 	.long	0x02625a00
     f58:	01312d00 	.long	0x01312d00
     f5c:	00989680 	.long	0x00989680
     f60:	002dc6c0 	.long	0x002dc6c0
     f64:	2000001c 	.long	0x2000001c
     f68:	d22d0004 	.long	0xd22d0004
     f6c:	81160087 	.long	0x81160087
     f70:	d22d0000 	.long	0xd22d0000
     f74:	81160088 	.long	0x81160088
     f78:	0892      	bt      	0x109c	// 109c <csi_syscon_systemclock_config+0x400>
     f7a:	3300      	movi      	r3, 0
     f7c:	2b1b      	subi      	r3, 28
     f7e:	60e0      	addu      	r3, r8
     f80:	9360      	ld.w      	r3, (r3, 0x0)
     f82:	3b41      	cmpnei      	r3, 1
     f84:	088c      	bt      	0x109c	// 109c <csi_syscon_systemclock_config+0x400>
		H_SYSCON->GCER = 1; // enable ISOSC
     f86:	006a      	lrw      	r3, 0x20000018	// 1358 <csi_syscon_clockmonitor_set_switch+0xa0>
     f88:	9360      	ld.w      	r3, (r3, 0x0)
     f8a:	3201      	movi      	r2, 1
     f8c:	b341      	st.w      	r2, (r3, 0x4)
		for (i=0;i<100;i++);
     f8e:	3300      	movi      	r3, 0
     f90:	2b17      	subi      	r3, 24
     f92:	60e0      	addu      	r3, r8
     f94:	3200      	movi      	r2, 0
     f96:	b340      	st.w      	r2, (r3, 0x0)
     f98:	040a      	br      	0xfac	// fac <csi_syscon_systemclock_config+0x310>
     f9a:	3300      	movi      	r3, 0
     f9c:	2b17      	subi      	r3, 24
     f9e:	60e0      	addu      	r3, r8
     fa0:	9360      	ld.w      	r3, (r3, 0x0)
     fa2:	5b42      	addi      	r2, r3, 1
     fa4:	3300      	movi      	r3, 0
     fa6:	2b17      	subi      	r3, 24
     fa8:	60e0      	addu      	r3, r8
     faa:	b340      	st.w      	r2, (r3, 0x0)
     fac:	3300      	movi      	r3, 0
     fae:	2b17      	subi      	r3, 24
     fb0:	60e0      	addu      	r3, r8
     fb2:	9340      	ld.w      	r2, (r3, 0x0)
     fb4:	3363      	movi      	r3, 99
     fb6:	648c      	cmphs      	r3, r2
     fb8:	0bf1      	bt      	0xf9a	// f9a <csi_syscon_systemclock_config+0x2fe>
		H_SYSCON->SCLKCR = (4 | SCLKCR_KEY); // switch to ISOSC as sysclk
     fba:	0077      	lrw      	r3, 0x20000018	// 1358 <csi_syscon_clockmonitor_set_switch+0xa0>
     fbc:	9360      	ld.w      	r3, (r3, 0x0)
     fbe:	0057      	lrw      	r2, 0xd22d0004	// 135c <csi_syscon_clockmonitor_set_switch+0xa4>
     fc0:	b347      	st.w      	r2, (r3, 0x1c)
		for (i=0;i<10;i++);
     fc2:	3300      	movi      	r3, 0
     fc4:	2b17      	subi      	r3, 24
     fc6:	60e0      	addu      	r3, r8
     fc8:	3200      	movi      	r2, 0
     fca:	b340      	st.w      	r2, (r3, 0x0)
     fcc:	040a      	br      	0xfe0	// fe0 <csi_syscon_systemclock_config+0x344>
     fce:	3300      	movi      	r3, 0
     fd0:	2b17      	subi      	r3, 24
     fd2:	60e0      	addu      	r3, r8
     fd4:	9360      	ld.w      	r3, (r3, 0x0)
     fd6:	5b42      	addi      	r2, r3, 1
     fd8:	3300      	movi      	r3, 0
     fda:	2b17      	subi      	r3, 24
     fdc:	60e0      	addu      	r3, r8
     fde:	b340      	st.w      	r2, (r3, 0x0)
     fe0:	3300      	movi      	r3, 0
     fe2:	2b17      	subi      	r3, 24
     fe4:	60e0      	addu      	r3, r8
     fe6:	9360      	ld.w      	r3, (r3, 0x0)
     fe8:	3b09      	cmphsi      	r3, 10
     fea:	0ff2      	bf      	0xfce	// fce <csi_syscon_systemclock_config+0x332>
		if ((H_SYSCON->ERRINF) & (1ul<<4)) {
     fec:	0164      	lrw      	r3, 0x20000018	// 1358 <csi_syscon_clockmonitor_set_switch+0xa0>
     fee:	9360      	ld.w      	r3, (r3, 0x0)
     ff0:	23eb      	addi      	r3, 236
     ff2:	9340      	ld.w      	r2, (r3, 0x0)
     ff4:	3310      	movi      	r3, 16
     ff6:	68c8      	and      	r3, r2
     ff8:	3b40      	cmpnei      	r3, 0
     ffa:	0c03      	bf      	0x1000	// 1000 <csi_syscon_systemclock_config+0x364>
			return ERR_SYSCON(DRV_ERROR_SPECIFIC4);
     ffc:	0166      	lrw      	r3, 0x81160089	// 1360 <csi_syscon_clockmonitor_set_switch+0xa8>
     ffe:	04e2      	br      	0x11c2	// 11c2 <csi_syscon_systemclock_config+0x526>
		}
		H_SYSCON->GCDR = 2; // disable IMOSC
    1000:	0169      	lrw      	r3, 0x20000018	// 1358 <csi_syscon_clockmonitor_set_switch+0xa0>
    1002:	9360      	ld.w      	r3, (r3, 0x0)
    1004:	3202      	movi      	r2, 2
    1006:	b342      	st.w      	r2, (r3, 0x8)
		H_SYSCON->CLCR &= ~(1ul<<22);
    1008:	016b      	lrw      	r3, 0x20000018	// 1358 <csi_syscon_clockmonitor_set_switch+0xa0>
    100a:	9360      	ld.w      	r3, (r3, 0x0)
    100c:	014c      	lrw      	r2, 0x20000018	// 1358 <csi_syscon_clockmonitor_set_switch+0xa0>
    100e:	9240      	ld.w      	r2, (r2, 0x0)
    1010:	9254      	ld.w      	r2, (r2, 0x50)
    1012:	3a96      	bclri      	r2, 22
    1014:	b354      	st.w      	r2, (r3, 0x50)
		H_SYSCON->GCER = 2; // enable IMOSC
    1016:	016e      	lrw      	r3, 0x20000018	// 1358 <csi_syscon_clockmonitor_set_switch+0xa0>
    1018:	9360      	ld.w      	r3, (r3, 0x0)
    101a:	3202      	movi      	r2, 2
    101c:	b341      	st.w      	r2, (r3, 0x4)
		for (i=0;i<100;i++);
    101e:	3300      	movi      	r3, 0
    1020:	2b17      	subi      	r3, 24
    1022:	60e0      	addu      	r3, r8
    1024:	3200      	movi      	r2, 0
    1026:	b340      	st.w      	r2, (r3, 0x0)
    1028:	040a      	br      	0x103c	// 103c <csi_syscon_systemclock_config+0x3a0>
    102a:	3300      	movi      	r3, 0
    102c:	2b17      	subi      	r3, 24
    102e:	60e0      	addu      	r3, r8
    1030:	9360      	ld.w      	r3, (r3, 0x0)
    1032:	5b42      	addi      	r2, r3, 1
    1034:	3300      	movi      	r3, 0
    1036:	2b17      	subi      	r3, 24
    1038:	60e0      	addu      	r3, r8
    103a:	b340      	st.w      	r2, (r3, 0x0)
    103c:	3300      	movi      	r3, 0
    103e:	2b17      	subi      	r3, 24
    1040:	60e0      	addu      	r3, r8
    1042:	9340      	ld.w      	r2, (r3, 0x0)
    1044:	3363      	movi      	r3, 99
    1046:	648c      	cmphs      	r3, r2
    1048:	0bf1      	bt      	0x102a	// 102a <csi_syscon_systemclock_config+0x38e>
		H_SYSCON->SCLKCR = ((hclk_div<<8)|SCLKCR_KEY);
    104a:	017b      	lrw      	r3, 0x20000018	// 1358 <csi_syscon_clockmonitor_set_switch+0xa0>
    104c:	9360      	ld.w      	r3, (r3, 0x0)
    104e:	3200      	movi      	r2, 0
    1050:	2a0b      	subi      	r2, 12
    1052:	60a0      	addu      	r2, r8
    1054:	9240      	ld.w      	r2, (r2, 0x0)
    1056:	4228      	lsli      	r1, r2, 8
    1058:	015c      	lrw      	r2, 0xd22d0000	// 1364 <csi_syscon_clockmonitor_set_switch+0xac>
    105a:	6c84      	or      	r2, r1
    105c:	b347      	st.w      	r2, (r3, 0x1c)
		for (i=0;i<10;i++);
    105e:	3300      	movi      	r3, 0
    1060:	2b17      	subi      	r3, 24
    1062:	60e0      	addu      	r3, r8
    1064:	3200      	movi      	r2, 0
    1066:	b340      	st.w      	r2, (r3, 0x0)
    1068:	040a      	br      	0x107c	// 107c <csi_syscon_systemclock_config+0x3e0>
    106a:	3300      	movi      	r3, 0
    106c:	2b17      	subi      	r3, 24
    106e:	60e0      	addu      	r3, r8
    1070:	9360      	ld.w      	r3, (r3, 0x0)
    1072:	5b42      	addi      	r2, r3, 1
    1074:	3300      	movi      	r3, 0
    1076:	2b17      	subi      	r3, 24
    1078:	60e0      	addu      	r3, r8
    107a:	b340      	st.w      	r2, (r3, 0x0)
    107c:	3300      	movi      	r3, 0
    107e:	2b17      	subi      	r3, 24
    1080:	60e0      	addu      	r3, r8
    1082:	9360      	ld.w      	r3, (r3, 0x0)
    1084:	3b09      	cmphsi      	r3, 10
    1086:	0ff2      	bf      	0x106a	// 106a <csi_syscon_systemclock_config+0x3ce>
		if ((H_SYSCON->ERRINF) & (1ul<<4)) {
    1088:	026b      	lrw      	r3, 0x20000018	// 1358 <csi_syscon_clockmonitor_set_switch+0xa0>
    108a:	9360      	ld.w      	r3, (r3, 0x0)
    108c:	23eb      	addi      	r3, 236
    108e:	9340      	ld.w      	r2, (r3, 0x0)
    1090:	3310      	movi      	r3, 16
    1092:	68c8      	and      	r3, r2
    1094:	3b40      	cmpnei      	r3, 0
    1096:	0c79      	bf      	0x1188	// 1188 <csi_syscon_systemclock_config+0x4ec>
			return ERR_SYSCON(DRV_ERROR_SPECIFIC5);
    1098:	026b      	lrw      	r3, 0x8116008a	// 1368 <csi_syscon_clockmonitor_set_switch+0xb0>
    109a:	0494      	br      	0x11c2	// 11c2 <csi_syscon_systemclock_config+0x526>
		}
	// switch system clock as EMO
	} else if ((sysclk_cfg._cur_sysclk != EMOSC_24M) && (sysclk_setup == EMOSC_24M)) {
    109c:	026b      	lrw      	r3, 0x2000001c	// 136c <csi_syscon_clockmonitor_set_switch+0xb4>
    109e:	9360      	ld.w      	r3, (r3, 0x0)
    10a0:	3b43      	cmpnei      	r3, 3
    10a2:	0c30      	bf      	0x1102	// 1102 <csi_syscon_systemclock_config+0x466>
    10a4:	3300      	movi      	r3, 0
    10a6:	2b1b      	subi      	r3, 28
    10a8:	60e0      	addu      	r3, r8
    10aa:	9360      	ld.w      	r3, (r3, 0x0)
    10ac:	3b43      	cmpnei      	r3, 3
    10ae:	082a      	bt      	0x1102	// 1102 <csi_syscon_systemclock_config+0x466>
		H_SYSCON->SCLKCR = (1 | (hclk_div<<8) | SCLKCR_KEY); // switch to EMOSC as sysclk
    10b0:	0275      	lrw      	r3, 0x20000018	// 1358 <csi_syscon_clockmonitor_set_switch+0xa0>
    10b2:	9360      	ld.w      	r3, (r3, 0x0)
    10b4:	3200      	movi      	r2, 0
    10b6:	2a0b      	subi      	r2, 12
    10b8:	60a0      	addu      	r2, r8
    10ba:	9240      	ld.w      	r2, (r2, 0x0)
    10bc:	4228      	lsli      	r1, r2, 8
    10be:	0252      	lrw      	r2, 0xd22d0001	// 1370 <csi_syscon_clockmonitor_set_switch+0xb8>
    10c0:	6c84      	or      	r2, r1
    10c2:	b347      	st.w      	r2, (r3, 0x1c)
		for (i=0;i<10;i++);
    10c4:	3300      	movi      	r3, 0
    10c6:	2b17      	subi      	r3, 24
    10c8:	60e0      	addu      	r3, r8
    10ca:	3200      	movi      	r2, 0
    10cc:	b340      	st.w      	r2, (r3, 0x0)
    10ce:	040a      	br      	0x10e2	// 10e2 <csi_syscon_systemclock_config+0x446>
    10d0:	3300      	movi      	r3, 0
    10d2:	2b17      	subi      	r3, 24
    10d4:	60e0      	addu      	r3, r8
    10d6:	9360      	ld.w      	r3, (r3, 0x0)
    10d8:	5b42      	addi      	r2, r3, 1
    10da:	3300      	movi      	r3, 0
    10dc:	2b17      	subi      	r3, 24
    10de:	60e0      	addu      	r3, r8
    10e0:	b340      	st.w      	r2, (r3, 0x0)
    10e2:	3300      	movi      	r3, 0
    10e4:	2b17      	subi      	r3, 24
    10e6:	60e0      	addu      	r3, r8
    10e8:	9360      	ld.w      	r3, (r3, 0x0)
    10ea:	3b09      	cmphsi      	r3, 10
    10ec:	0ff2      	bf      	0x10d0	// 10d0 <csi_syscon_systemclock_config+0x434>
		if ((H_SYSCON->ERRINF) & (1ul<<4)) {
    10ee:	0364      	lrw      	r3, 0x20000018	// 1358 <csi_syscon_clockmonitor_set_switch+0xa0>
    10f0:	9360      	ld.w      	r3, (r3, 0x0)
    10f2:	23eb      	addi      	r3, 236
    10f4:	9340      	ld.w      	r2, (r3, 0x0)
    10f6:	3310      	movi      	r3, 16
    10f8:	68c8      	and      	r3, r2
    10fa:	3b40      	cmpnei      	r3, 0
    10fc:	0c46      	bf      	0x1188	// 1188 <csi_syscon_systemclock_config+0x4ec>
			return ERR_SYSCON(DRV_ERROR_SPECIFIC6);
    10fe:	0361      	lrw      	r3, 0x8116008b	// 1374 <csi_syscon_clockmonitor_set_switch+0xbc>
    1100:	0461      	br      	0x11c2	// 11c2 <csi_syscon_systemclock_config+0x526>
		}
	// switch system clock as ISO3M
	} else if ((sysclk_cfg._cur_sysclk != ISOSC_3M) && (sysclk_setup == ISOSC_3M)) {
    1102:	0364      	lrw      	r3, 0x2000001c	// 136c <csi_syscon_clockmonitor_set_switch+0xb4>
    1104:	9360      	ld.w      	r3, (r3, 0x0)
    1106:	3b40      	cmpnei      	r3, 0
    1108:	0c30      	bf      	0x1168	// 1168 <csi_syscon_systemclock_config+0x4cc>
    110a:	3300      	movi      	r3, 0
    110c:	2b1b      	subi      	r3, 28
    110e:	60e0      	addu      	r3, r8
    1110:	9360      	ld.w      	r3, (r3, 0x0)
    1112:	3b40      	cmpnei      	r3, 0
    1114:	082a      	bt      	0x1168	// 1168 <csi_syscon_systemclock_config+0x4cc>
		H_SYSCON->SCLKCR = (4 | (hclk_div<<8) | SCLKCR_KEY); // switch to ISOSC as sysclk
    1116:	036e      	lrw      	r3, 0x20000018	// 1358 <csi_syscon_clockmonitor_set_switch+0xa0>
    1118:	9360      	ld.w      	r3, (r3, 0x0)
    111a:	3200      	movi      	r2, 0
    111c:	2a0b      	subi      	r2, 12
    111e:	60a0      	addu      	r2, r8
    1120:	9240      	ld.w      	r2, (r2, 0x0)
    1122:	4228      	lsli      	r1, r2, 8
    1124:	0351      	lrw      	r2, 0xd22d0004	// 135c <csi_syscon_clockmonitor_set_switch+0xa4>
    1126:	6c84      	or      	r2, r1
    1128:	b347      	st.w      	r2, (r3, 0x1c)
		for (i=0;i<10;i++);
    112a:	3300      	movi      	r3, 0
    112c:	2b17      	subi      	r3, 24
    112e:	60e0      	addu      	r3, r8
    1130:	3200      	movi      	r2, 0
    1132:	b340      	st.w      	r2, (r3, 0x0)
    1134:	040a      	br      	0x1148	// 1148 <csi_syscon_systemclock_config+0x4ac>
    1136:	3300      	movi      	r3, 0
    1138:	2b17      	subi      	r3, 24
    113a:	60e0      	addu      	r3, r8
    113c:	9360      	ld.w      	r3, (r3, 0x0)
    113e:	5b42      	addi      	r2, r3, 1
    1140:	3300      	movi      	r3, 0
    1142:	2b17      	subi      	r3, 24
    1144:	60e0      	addu      	r3, r8
    1146:	b340      	st.w      	r2, (r3, 0x0)
    1148:	3300      	movi      	r3, 0
    114a:	2b17      	subi      	r3, 24
    114c:	60e0      	addu      	r3, r8
    114e:	9360      	ld.w      	r3, (r3, 0x0)
    1150:	3b09      	cmphsi      	r3, 10
    1152:	0ff2      	bf      	0x1136	// 1136 <csi_syscon_systemclock_config+0x49a>
		if ((H_SYSCON->ERRINF) & (1ul<<4)) {
    1154:	037e      	lrw      	r3, 0x20000018	// 1358 <csi_syscon_clockmonitor_set_switch+0xa0>
    1156:	9360      	ld.w      	r3, (r3, 0x0)
    1158:	23eb      	addi      	r3, 236
    115a:	9340      	ld.w      	r2, (r3, 0x0)
    115c:	3310      	movi      	r3, 16
    115e:	68c8      	and      	r3, r2
    1160:	3b40      	cmpnei      	r3, 0
    1162:	0c13      	bf      	0x1188	// 1188 <csi_syscon_systemclock_config+0x4ec>
			return ERR_SYSCON(DRV_ERROR_SPECIFIC7);
    1164:	037a      	lrw      	r3, 0x8116008c	// 1378 <csi_syscon_clockmonitor_set_switch+0xc0>
    1166:	042e      	br      	0x11c2	// 11c2 <csi_syscon_systemclock_config+0x526>
		}
	} else { // only change div option
		H_SYSCON->SCLKCR = ((H_SYSCON->SCLKCR)&0xff) |  (hclk_div<<8) | SCLKCR_KEY;
    1168:	137c      	lrw      	r3, 0x20000018	// 1358 <csi_syscon_clockmonitor_set_switch+0xa0>
    116a:	9360      	ld.w      	r3, (r3, 0x0)
    116c:	135b      	lrw      	r2, 0x20000018	// 1358 <csi_syscon_clockmonitor_set_switch+0xa0>
    116e:	9240      	ld.w      	r2, (r2, 0x0)
    1170:	9227      	ld.w      	r1, (r2, 0x1c)
    1172:	32ff      	movi      	r2, 255
    1174:	6848      	and      	r1, r2
    1176:	3200      	movi      	r2, 0
    1178:	2a0b      	subi      	r2, 12
    117a:	60a0      	addu      	r2, r8
    117c:	9240      	ld.w      	r2, (r2, 0x0)
    117e:	4248      	lsli      	r2, r2, 8
    1180:	6c48      	or      	r1, r2
    1182:	1359      	lrw      	r2, 0xd22d0000	// 1364 <csi_syscon_clockmonitor_set_switch+0xac>
    1184:	6c84      	or      	r2, r1
    1186:	b347      	st.w      	r2, (r3, 0x1c)
	}

	/* Setup PCLK divider */
	H_SYSCON->PCLKCR = ((pclk_div<<8)|PCLKCR_KEY);
    1188:	1374      	lrw      	r3, 0x20000018	// 1358 <csi_syscon_clockmonitor_set_switch+0xa0>
    118a:	9360      	ld.w      	r3, (r3, 0x0)
    118c:	3200      	movi      	r2, 0
    118e:	2a0f      	subi      	r2, 16
    1190:	60a0      	addu      	r2, r8
    1192:	9240      	ld.w      	r2, (r2, 0x0)
    1194:	4228      	lsli      	r1, r2, 8
    1196:	135a      	lrw      	r2, 0xc33c0000	// 137c <csi_syscon_clockmonitor_set_switch+0xc4>
    1198:	6c84      	or      	r2, r1
    119a:	b348      	st.w      	r2, (r3, 0x20)

	/* Store config to global variables */
	sysclk_cfg._cur_sysclk = sysclk_setup; 
    119c:	1374      	lrw      	r3, 0x2000001c	// 136c <csi_syscon_clockmonitor_set_switch+0xb4>
    119e:	3200      	movi      	r2, 0
    11a0:	2a1b      	subi      	r2, 28
    11a2:	60a0      	addu      	r2, r8
    11a4:	9240      	ld.w      	r2, (r2, 0x0)
    11a6:	b340      	st.w      	r2, (r3, 0x0)
	sysclk_cfg._cur_hclk_freq = target_hclk_freq;
    11a8:	1371      	lrw      	r3, 0x2000001c	// 136c <csi_syscon_clockmonitor_set_switch+0xb4>
    11aa:	3200      	movi      	r2, 0
    11ac:	2a07      	subi      	r2, 8
    11ae:	60a0      	addu      	r2, r8
    11b0:	9240      	ld.w      	r2, (r2, 0x0)
    11b2:	b341      	st.w      	r2, (r3, 0x4)
	sysclk_cfg._cur_pclk_freq = target_pclk_freq;
    11b4:	136e      	lrw      	r3, 0x2000001c	// 136c <csi_syscon_clockmonitor_set_switch+0xb4>
    11b6:	3200      	movi      	r2, 0
    11b8:	2a13      	subi      	r2, 20
    11ba:	60a0      	addu      	r2, r8
    11bc:	9240      	ld.w      	r2, (r2, 0x0)
    11be:	b342      	st.w      	r2, (r3, 0x8)

	return 0;
    11c0:	3300      	movi      	r3, 0
}
    11c2:	6c0f      	mov      	r0, r3
    11c4:	6fa3      	mov      	r14, r8
    11c6:	d9ee2002 	ld.w      	r15, (r14, 0x8)
    11ca:	d90e2001 	ld.w      	r8, (r14, 0x4)
    11ce:	9880      	ld.w      	r4, (r14, 0x0)
    11d0:	1403      	addi      	r14, r14, 12
    11d2:	783c      	jmp      	r15

000011d4 <csi_syscon_set_solo_pclk_switch>:
						 defined as: PCLK_ADC/PCLK_UART0 ...
  \param[in]   pclk1_sel individual pclk target on PCLK1
  \return      negtive when assignment is not in right pclk domain
*/
int32_t csi_syscon_set_solo_pclk_switch(syscon_endis_e status, uint64_t pclk_sel)
{
    11d4:	1422      	subi      	r14, r14, 8
    11d6:	b880      	st.w      	r4, (r14, 0x0)
    11d8:	dd0e2001 	st.w      	r8, (r14, 0x4)
    11dc:	6e3b      	mov      	r8, r14
    11de:	1425      	subi      	r14, r14, 20
    11e0:	3300      	movi      	r3, 0
    11e2:	2b0b      	subi      	r3, 12
    11e4:	60e0      	addu      	r3, r8
    11e6:	b300      	st.w      	r0, (r3, 0x0)
    11e8:	3300      	movi      	r3, 0
    11ea:	2b13      	subi      	r3, 20
    11ec:	60e0      	addu      	r3, r8
    11ee:	b320      	st.w      	r1, (r3, 0x0)
    11f0:	b341      	st.w      	r2, (r3, 0x4)
	pclk_conr_type pclk_setup;
	pclk_setup.PCLKCR = pclk_sel;
    11f2:	3200      	movi      	r2, 0
    11f4:	2a07      	subi      	r2, 8
    11f6:	60a0      	addu      	r2, r8
    11f8:	3300      	movi      	r3, 0
    11fa:	2b13      	subi      	r3, 20
    11fc:	60e0      	addu      	r3, r8
    11fe:	9381      	ld.w      	r4, (r3, 0x4)
    1200:	9360      	ld.w      	r3, (r3, 0x0)
    1202:	b260      	st.w      	r3, (r2, 0x0)
    1204:	b281      	st.w      	r4, (r2, 0x4)
	
	switch (status) {
    1206:	3300      	movi      	r3, 0
    1208:	2b0b      	subi      	r3, 12
    120a:	60e0      	addu      	r3, r8
    120c:	9360      	ld.w      	r3, (r3, 0x0)
    120e:	3b40      	cmpnei      	r3, 0
    1210:	0810      	bt      	0x1230	// 1230 <csi_syscon_set_solo_pclk_switch+0x5c>
		case ENABLE:  /*enable*/
			H_SYSCON->PCER0 = pclk_setup.w.PCLKCR0;
    1212:	1272      	lrw      	r3, 0x20000018	// 1358 <csi_syscon_clockmonitor_set_switch+0xa0>
    1214:	9360      	ld.w      	r3, (r3, 0x0)
    1216:	3200      	movi      	r2, 0
    1218:	2a07      	subi      	r2, 8
    121a:	60a0      	addu      	r2, r8
    121c:	9240      	ld.w      	r2, (r2, 0x0)
    121e:	b34a      	st.w      	r2, (r3, 0x28)
			H_SYSCON->PCER1 = pclk_setup.w.PCLKCR1;
    1220:	126e      	lrw      	r3, 0x20000018	// 1358 <csi_syscon_clockmonitor_set_switch+0xa0>
    1222:	9360      	ld.w      	r3, (r3, 0x0)
    1224:	3200      	movi      	r2, 0
    1226:	2a07      	subi      	r2, 8
    1228:	60a0      	addu      	r2, r8
    122a:	9241      	ld.w      	r2, (r2, 0x4)
    122c:	b34d      	st.w      	r2, (r3, 0x34)
			break;    
    122e:	0410      	br      	0x124e	// 124e <csi_syscon_set_solo_pclk_switch+0x7a>
		default: /*disable*/
			H_SYSCON->PCDR0 = pclk_setup.w.PCLKCR0;
    1230:	126a      	lrw      	r3, 0x20000018	// 1358 <csi_syscon_clockmonitor_set_switch+0xa0>
    1232:	9360      	ld.w      	r3, (r3, 0x0)
    1234:	3200      	movi      	r2, 0
    1236:	2a07      	subi      	r2, 8
    1238:	60a0      	addu      	r2, r8
    123a:	9240      	ld.w      	r2, (r2, 0x0)
    123c:	b34b      	st.w      	r2, (r3, 0x2c)
			H_SYSCON->PCDR1 = pclk_setup.w.PCLKCR1;
    123e:	1267      	lrw      	r3, 0x20000018	// 1358 <csi_syscon_clockmonitor_set_switch+0xa0>
    1240:	9360      	ld.w      	r3, (r3, 0x0)
    1242:	3200      	movi      	r2, 0
    1244:	2a07      	subi      	r2, 8
    1246:	60a0      	addu      	r2, r8
    1248:	9241      	ld.w      	r2, (r2, 0x4)
    124a:	b34e      	st.w      	r2, (r3, 0x38)
			break;
    124c:	6c00      	or      	r0, r0
	}
	return 0;
    124e:	3300      	movi      	r3, 0
}
    1250:	6c0f      	mov      	r0, r3
    1252:	6fa3      	mov      	r14, r8
    1254:	d90e2001 	ld.w      	r8, (r14, 0x4)
    1258:	9880      	ld.w      	r4, (r14, 0x0)
    125a:	1402      	addi      	r14, r14, 8
    125c:	783c      	jmp      	r15
	...

00001260 <csi_syscon_set_all_pclk_switch>:
  \brief       Enable/disable pclk of all peripherals
  \param[in]   status   en/dis operation (enable is default)
  \return      negtive when assignment is not in right pclk domain
*/
void csi_syscon_set_all_pclk_switch(syscon_endis_e status)
{
    1260:	1421      	subi      	r14, r14, 4
    1262:	dd0e2000 	st.w      	r8, (r14, 0x0)
    1266:	6e3b      	mov      	r8, r14
    1268:	1421      	subi      	r14, r14, 4
    126a:	3300      	movi      	r3, 0
    126c:	2b03      	subi      	r3, 4
    126e:	60e0      	addu      	r3, r8
    1270:	b300      	st.w      	r0, (r3, 0x0)
	switch (status) {
    1272:	3300      	movi      	r3, 0
    1274:	2b03      	subi      	r3, 4
    1276:	60e0      	addu      	r3, r8
    1278:	9360      	ld.w      	r3, (r3, 0x0)
    127a:	3b40      	cmpnei      	r3, 0
    127c:	080c      	bt      	0x1294	// 1294 <csi_syscon_set_all_pclk_switch+0x34>
		case ENABLE:  /*enable*/
			H_SYSCON->PCER0 = 0xffffffff;
    127e:	1177      	lrw      	r3, 0x20000018	// 1358 <csi_syscon_clockmonitor_set_switch+0xa0>
    1280:	9340      	ld.w      	r2, (r3, 0x0)
    1282:	3300      	movi      	r3, 0
    1284:	2b00      	subi      	r3, 1
    1286:	b26a      	st.w      	r3, (r2, 0x28)
			H_SYSCON->PCER1 = 0xffffffff;
    1288:	1174      	lrw      	r3, 0x20000018	// 1358 <csi_syscon_clockmonitor_set_switch+0xa0>
    128a:	9340      	ld.w      	r2, (r3, 0x0)
    128c:	3300      	movi      	r3, 0
    128e:	2b00      	subi      	r3, 1
    1290:	b26d      	st.w      	r3, (r2, 0x34)
			break;    
    1292:	040c      	br      	0x12aa	// 12aa <csi_syscon_set_all_pclk_switch+0x4a>
		default: /*disable*/
			H_SYSCON->PCDR0 = 0xffffffff;
    1294:	1171      	lrw      	r3, 0x20000018	// 1358 <csi_syscon_clockmonitor_set_switch+0xa0>
    1296:	9340      	ld.w      	r2, (r3, 0x0)
    1298:	3300      	movi      	r3, 0
    129a:	2b00      	subi      	r3, 1
    129c:	b26b      	st.w      	r3, (r2, 0x2c)
			H_SYSCON->PCDR1 = 0xffffffff;
    129e:	116f      	lrw      	r3, 0x20000018	// 1358 <csi_syscon_clockmonitor_set_switch+0xa0>
    12a0:	9340      	ld.w      	r2, (r3, 0x0)
    12a2:	3300      	movi      	r3, 0
    12a4:	2b00      	subi      	r3, 1
    12a6:	b26e      	st.w      	r3, (r2, 0x38)
			break;
    12a8:	6c00      	or      	r0, r0
	}
}
    12aa:	6c00      	or      	r0, r0
    12ac:	6fa3      	mov      	r14, r8
    12ae:	d90e2000 	ld.w      	r8, (r14, 0x0)
    12b2:	1401      	addi      	r14, r14, 4
    12b4:	783c      	jmp      	r15
	...

000012b8 <csi_syscon_clockmonitor_set_switch>:
  \param[in]   status   en/dis operation
  \param[in]   rst_on_fail  generate reset when fail or not  (disable is default)
  \return      None
*/
int32_t csi_syscon_clockmonitor_set_switch(syscon_endis_e status, syscon_ckmrst_e rst_on_fail)
{
    12b8:	1421      	subi      	r14, r14, 4
    12ba:	dd0e2000 	st.w      	r8, (r14, 0x0)
    12be:	6e3b      	mov      	r8, r14
    12c0:	1422      	subi      	r14, r14, 8
    12c2:	3300      	movi      	r3, 0
    12c4:	2b03      	subi      	r3, 4
    12c6:	60e0      	addu      	r3, r8
    12c8:	b300      	st.w      	r0, (r3, 0x0)
    12ca:	3300      	movi      	r3, 0
    12cc:	2b07      	subi      	r3, 8
    12ce:	60e0      	addu      	r3, r8
    12d0:	b320      	st.w      	r1, (r3, 0x0)
	if (!((H_SYSCON->GCSR) & 1ul)) {
    12d2:	1162      	lrw      	r3, 0x20000018	// 1358 <csi_syscon_clockmonitor_set_switch+0xa0>
    12d4:	9360      	ld.w      	r3, (r3, 0x0)
    12d6:	9343      	ld.w      	r2, (r3, 0xc)
    12d8:	3301      	movi      	r3, 1
    12da:	68c8      	and      	r3, r2
    12dc:	3b40      	cmpnei      	r3, 0
    12de:	0803      	bt      	0x12e4	// 12e4 <csi_syscon_clockmonitor_set_switch+0x2c>
		return ERR_SYSCON(DRV_ERROR_UNSUPPORTED);
    12e0:	1168      	lrw      	r3, 0x81160083	// 1380 <csi_syscon_clockmonitor_set_switch+0xc8>
    12e2:	0452      	br      	0x1386	// 1386 <csi_syscon_clockmonitor_set_switch+0xce>
	}

	if ((status == ENABLE) && (rst_on_fail == CKM_RST_ON)) {
    12e4:	3300      	movi      	r3, 0
    12e6:	2b03      	subi      	r3, 4
    12e8:	60e0      	addu      	r3, r8
    12ea:	9360      	ld.w      	r3, (r3, 0x0)
    12ec:	3b40      	cmpnei      	r3, 0
    12ee:	080d      	bt      	0x1308	// 1308 <csi_syscon_clockmonitor_set_switch+0x50>
    12f0:	3300      	movi      	r3, 0
    12f2:	2b07      	subi      	r3, 8
    12f4:	60e0      	addu      	r3, r8
    12f6:	9360      	ld.w      	r3, (r3, 0x0)
    12f8:	3b41      	cmpnei      	r3, 1
    12fa:	0807      	bt      	0x1308	// 1308 <csi_syscon_clockmonitor_set_switch+0x50>
		H_SYSCON->GCER = (1ul<<18) | (1ul<<19);
    12fc:	1077      	lrw      	r3, 0x20000018	// 1358 <csi_syscon_clockmonitor_set_switch+0xa0>
    12fe:	9340      	ld.w      	r2, (r3, 0x0)
    1300:	33c0      	movi      	r3, 192
    1302:	436c      	lsli      	r3, r3, 12
    1304:	b261      	st.w      	r3, (r2, 0x4)
    1306:	041d      	br      	0x1340	// 1340 <csi_syscon_clockmonitor_set_switch+0x88>
	}
	else if ((status == ENABLE) && (rst_on_fail == CKM_RST_OFF)) {
    1308:	3300      	movi      	r3, 0
    130a:	2b03      	subi      	r3, 4
    130c:	60e0      	addu      	r3, r8
    130e:	9360      	ld.w      	r3, (r3, 0x0)
    1310:	3b40      	cmpnei      	r3, 0
    1312:	0812      	bt      	0x1336	// 1336 <csi_syscon_clockmonitor_set_switch+0x7e>
    1314:	3300      	movi      	r3, 0
    1316:	2b07      	subi      	r3, 8
    1318:	60e0      	addu      	r3, r8
    131a:	9360      	ld.w      	r3, (r3, 0x0)
    131c:	3b40      	cmpnei      	r3, 0
    131e:	080c      	bt      	0x1336	// 1336 <csi_syscon_clockmonitor_set_switch+0x7e>
		H_SYSCON->GCER = (1ul<<18) ;
    1320:	106e      	lrw      	r3, 0x20000018	// 1358 <csi_syscon_clockmonitor_set_switch+0xa0>
    1322:	9340      	ld.w      	r2, (r3, 0x0)
    1324:	3380      	movi      	r3, 128
    1326:	436b      	lsli      	r3, r3, 11
    1328:	b261      	st.w      	r3, (r2, 0x4)
		H_SYSCON->GCDR = (1ul<<19) ;
    132a:	106c      	lrw      	r3, 0x20000018	// 1358 <csi_syscon_clockmonitor_set_switch+0xa0>
    132c:	9340      	ld.w      	r2, (r3, 0x0)
    132e:	3380      	movi      	r3, 128
    1330:	436c      	lsli      	r3, r3, 12
    1332:	b262      	st.w      	r3, (r2, 0x8)
    1334:	0406      	br      	0x1340	// 1340 <csi_syscon_clockmonitor_set_switch+0x88>
	}
	else {
		H_SYSCON->GCDR = (1ul<<18) | (1ul<<19) ;
    1336:	1069      	lrw      	r3, 0x20000018	// 1358 <csi_syscon_clockmonitor_set_switch+0xa0>
    1338:	9340      	ld.w      	r2, (r3, 0x0)
    133a:	33c0      	movi      	r3, 192
    133c:	436c      	lsli      	r3, r3, 12
    133e:	b262      	st.w      	r3, (r2, 0x8)
	}

	if ((H_SYSCON->ERRINF) & (1ul<<11)) {
    1340:	1066      	lrw      	r3, 0x20000018	// 1358 <csi_syscon_clockmonitor_set_switch+0xa0>
    1342:	9360      	ld.w      	r3, (r3, 0x0)
    1344:	23eb      	addi      	r3, 236
    1346:	9340      	ld.w      	r2, (r3, 0x0)
    1348:	3380      	movi      	r3, 128
    134a:	4364      	lsli      	r3, r3, 4
    134c:	68c8      	and      	r3, r2
    134e:	3b40      	cmpnei      	r3, 0
    1350:	0c1a      	bf      	0x1384	// 1384 <csi_syscon_clockmonitor_set_switch+0xcc>
		return ERR_SYSCON(DRV_ERROR_SPECIFIC6);
    1352:	1069      	lrw      	r3, 0x8116008b	// 1374 <csi_syscon_clockmonitor_set_switch+0xbc>
    1354:	0419      	br      	0x1386	// 1386 <csi_syscon_clockmonitor_set_switch+0xce>
    1356:	0000      	bkpt
    1358:	20000018 	.long	0x20000018
    135c:	d22d0004 	.long	0xd22d0004
    1360:	81160089 	.long	0x81160089
    1364:	d22d0000 	.long	0xd22d0000
    1368:	8116008a 	.long	0x8116008a
    136c:	2000001c 	.long	0x2000001c
    1370:	d22d0001 	.long	0xd22d0001
    1374:	8116008b 	.long	0x8116008b
    1378:	8116008c 	.long	0x8116008c
    137c:	c33c0000 	.long	0xc33c0000
    1380:	81160083 	.long	0x81160083
	}
	else {
		return 0;
    1384:	3300      	movi      	r3, 0
	}
}
    1386:	6c0f      	mov      	r0, r3
    1388:	6fa3      	mov      	r14, r8
    138a:	d90e2000 	ld.w      	r8, (r14, 0x0)
    138e:	1401      	addi      	r14, r14, 4
    1390:	783c      	jmp      	r15
	...

00001394 <csi_syscon_pclk_active_under_sleep>:
  \brief       Enable/disable pclk under sleep mode
  \param[in]   status   en/dis operation (enable is default)
  \return      None
*/
void csi_syscon_pclk_active_under_sleep(syscon_endis_e status)
{
    1394:	1421      	subi      	r14, r14, 4
    1396:	dd0e2000 	st.w      	r8, (r14, 0x0)
    139a:	6e3b      	mov      	r8, r14
    139c:	1421      	subi      	r14, r14, 4
    139e:	3300      	movi      	r3, 0
    13a0:	2b03      	subi      	r3, 4
    13a2:	60e0      	addu      	r3, r8
    13a4:	b300      	st.w      	r0, (r3, 0x0)
	if (status == ENABLE) {
    13a6:	3300      	movi      	r3, 0
    13a8:	2b03      	subi      	r3, 4
    13aa:	60e0      	addu      	r3, r8
    13ac:	9360      	ld.w      	r3, (r3, 0x0)
    13ae:	3b40      	cmpnei      	r3, 0
    13b0:	0808      	bt      	0x13c0	// 13c0 <csi_syscon_pclk_active_under_sleep+0x2c>
		H_SYSCON->GCER = (1ul<<8);
    13b2:	ea83010e 	lrw      	r3, 0x20000018	// 17e8 <csi_syscon_exi_get_status+0x64>
    13b6:	9340      	ld.w      	r2, (r3, 0x0)
    13b8:	3380      	movi      	r3, 128
    13ba:	4361      	lsli      	r3, r3, 1
    13bc:	b261      	st.w      	r3, (r2, 0x4)
	} 
	else {
		H_SYSCON->GCDR = (1ul<<8);
	}
}
    13be:	0407      	br      	0x13cc	// 13cc <csi_syscon_pclk_active_under_sleep+0x38>
		H_SYSCON->GCDR = (1ul<<8);
    13c0:	ea83010a 	lrw      	r3, 0x20000018	// 17e8 <csi_syscon_exi_get_status+0x64>
    13c4:	9340      	ld.w      	r2, (r3, 0x0)
    13c6:	3380      	movi      	r3, 128
    13c8:	4361      	lsli      	r3, r3, 1
    13ca:	b262      	st.w      	r3, (r2, 0x8)
}
    13cc:	6c00      	or      	r0, r0
    13ce:	6fa3      	mov      	r14, r8
    13d0:	d90e2000 	ld.w      	r8, (r14, 0x0)
    13d4:	1401      	addi      	r14, r14, 4
    13d6:	783c      	jmp      	r15

000013d8 <csi_syscon_iwdt_set_switch>:
  \brief       Enable/disable iWDT
  \param[in]   status   en/dis operation(disable is default)
  \return      None
*/
void csi_syscon_iwdt_set_switch(syscon_endis_e status)
{
    13d8:	1421      	subi      	r14, r14, 4
    13da:	dd0e2000 	st.w      	r8, (r14, 0x0)
    13de:	6e3b      	mov      	r8, r14
    13e0:	1421      	subi      	r14, r14, 4
    13e2:	3300      	movi      	r3, 0
    13e4:	2b03      	subi      	r3, 4
    13e6:	60e0      	addu      	r3, r8
    13e8:	b300      	st.w      	r0, (r3, 0x0)
	if (status == ENABLE) {
    13ea:	3300      	movi      	r3, 0
    13ec:	2b03      	subi      	r3, 4
    13ee:	60e0      	addu      	r3, r8
    13f0:	9360      	ld.w      	r3, (r3, 0x0)
    13f2:	3b40      	cmpnei      	r3, 0
    13f4:	0807      	bt      	0x1402	// 1402 <csi_syscon_iwdt_set_switch+0x2a>
		H_SYSCON->IWDEDR = IWDEDR_KEY ;
    13f6:	0062      	lrw      	r3, 0x20000018	// 17e8 <csi_syscon_exi_get_status+0x64>
    13f8:	9360      	ld.w      	r3, (r3, 0x0)
    13fa:	23bb      	addi      	r3, 188
    13fc:	0043      	lrw      	r2, 0x78870000	// 17ec <csi_syscon_exi_get_status+0x68>
    13fe:	b340      	st.w      	r2, (r3, 0x0)
	} 
	else {
		H_SYSCON->IWDEDR = IWDEDR_KEY | 0x5555;
	}
}
    1400:	0406      	br      	0x140c	// 140c <csi_syscon_iwdt_set_switch+0x34>
		H_SYSCON->IWDEDR = IWDEDR_KEY | 0x5555;
    1402:	0065      	lrw      	r3, 0x20000018	// 17e8 <csi_syscon_exi_get_status+0x64>
    1404:	9360      	ld.w      	r3, (r3, 0x0)
    1406:	23bb      	addi      	r3, 188
    1408:	0045      	lrw      	r2, 0x78875555	// 17f0 <csi_syscon_exi_get_status+0x6c>
    140a:	b340      	st.w      	r2, (r3, 0x0)
}
    140c:	6c00      	or      	r0, r0
    140e:	6fa3      	mov      	r14, r8
    1410:	d90e2000 	ld.w      	r8, (r14, 0x0)
    1414:	1401      	addi      	r14, r14, 4
    1416:	783c      	jmp      	r15

00001418 <csi_syscon_iwdt_reload>:
/**
  \brief       Reload iwdt
  \return      None
*/
void csi_syscon_iwdt_reload(void)
{
    1418:	1421      	subi      	r14, r14, 4
    141a:	dd0e2000 	st.w      	r8, (r14, 0x0)
    141e:	6e3b      	mov      	r8, r14
    1420:	1421      	subi      	r14, r14, 4
	volatile uint32_t i;
	H_SYSCON->IWDCNT = (0x5Aul<<24);
    1422:	006d      	lrw      	r3, 0x20000018	// 17e8 <csi_syscon_exi_get_status+0x64>
    1424:	9360      	ld.w      	r3, (r3, 0x0)
    1426:	23b7      	addi      	r3, 184
    1428:	6c8f      	mov      	r2, r3
    142a:	33b4      	movi      	r3, 180
    142c:	4377      	lsli      	r3, r3, 23
    142e:	b260      	st.w      	r3, (r2, 0x0)
	for (i=0;i<100;i++);
    1430:	3300      	movi      	r3, 0
    1432:	2b03      	subi      	r3, 4
    1434:	60e0      	addu      	r3, r8
    1436:	3200      	movi      	r2, 0
    1438:	b340      	st.w      	r2, (r3, 0x0)
    143a:	040a      	br      	0x144e	// 144e <csi_syscon_iwdt_reload+0x36>
    143c:	3300      	movi      	r3, 0
    143e:	2b03      	subi      	r3, 4
    1440:	60e0      	addu      	r3, r8
    1442:	9360      	ld.w      	r3, (r3, 0x0)
    1444:	5b42      	addi      	r2, r3, 1
    1446:	3300      	movi      	r3, 0
    1448:	2b03      	subi      	r3, 4
    144a:	60e0      	addu      	r3, r8
    144c:	b340      	st.w      	r2, (r3, 0x0)
    144e:	3300      	movi      	r3, 0
    1450:	2b03      	subi      	r3, 4
    1452:	60e0      	addu      	r3, r8
    1454:	9340      	ld.w      	r2, (r3, 0x0)
    1456:	3363      	movi      	r3, 99
    1458:	648c      	cmphs      	r3, r2
    145a:	0bf1      	bt      	0x143c	// 143c <csi_syscon_iwdt_reload+0x24>
	while ((H_SYSCON->IWDCNT) & (1ul<<31));
    145c:	6c00      	or      	r0, r0
    145e:	007c      	lrw      	r3, 0x20000018	// 17e8 <csi_syscon_exi_get_status+0x64>
    1460:	9360      	ld.w      	r3, (r3, 0x0)
    1462:	23b7      	addi      	r3, 184
    1464:	9360      	ld.w      	r3, (r3, 0x0)
    1466:	3bdf      	btsti      	r3, 31
    1468:	0bfb      	bt      	0x145e	// 145e <csi_syscon_iwdt_reload+0x46>
}
    146a:	6c00      	or      	r0, r0
    146c:	6fa3      	mov      	r14, r8
    146e:	d90e2000 	ld.w      	r8, (r14, 0x0)
    1472:	1401      	addi      	r14, r14, 4
    1474:	783c      	jmp      	r15
	...

00001478 <csi_syscon_iwdt_config>:
  \param[in]   iwdt_ovt overflow time config
  \param[in]   iwdt_wnd alarm window time config
  \return      None
*/
void csi_syscon_iwdt_config(iwdt_ovt_e iwdt_ovt, iwdt_wnd_e iwdt_wnd)
{
    1478:	1421      	subi      	r14, r14, 4
    147a:	dd0e2000 	st.w      	r8, (r14, 0x0)
    147e:	6e3b      	mov      	r8, r14
    1480:	1422      	subi      	r14, r14, 8
    1482:	3300      	movi      	r3, 0
    1484:	2b03      	subi      	r3, 4
    1486:	60e0      	addu      	r3, r8
    1488:	b300      	st.w      	r0, (r3, 0x0)
    148a:	3300      	movi      	r3, 0
    148c:	2b07      	subi      	r3, 8
    148e:	60e0      	addu      	r3, r8
    1490:	b320      	st.w      	r1, (r3, 0x0)
	H_SYSCON->IWDCR = (iwdt_ovt << 8) | (iwdt_wnd << 2) | IWDT_KEY;
    1492:	0169      	lrw      	r3, 0x20000018	// 17e8 <csi_syscon_exi_get_status+0x64>
    1494:	9320      	ld.w      	r1, (r3, 0x0)
    1496:	3300      	movi      	r3, 0
    1498:	2b03      	subi      	r3, 4
    149a:	60e0      	addu      	r3, r8
    149c:	9360      	ld.w      	r3, (r3, 0x0)
    149e:	4348      	lsli      	r2, r3, 8
    14a0:	3300      	movi      	r3, 0
    14a2:	2b07      	subi      	r3, 8
    14a4:	60e0      	addu      	r3, r8
    14a6:	9360      	ld.w      	r3, (r3, 0x0)
    14a8:	4362      	lsli      	r3, r3, 2
    14aa:	6c8c      	or      	r2, r3
    14ac:	016d      	lrw      	r3, 0x87780000	// 17f4 <csi_syscon_exi_get_status+0x70>
    14ae:	6c8c      	or      	r2, r3
    14b0:	6cc7      	mov      	r3, r1
    14b2:	23b3      	addi      	r3, 180
    14b4:	b340      	st.w      	r2, (r3, 0x0)
}
    14b6:	6c00      	or      	r0, r0
    14b8:	6fa3      	mov      	r14, r8
    14ba:	d90e2000 	ld.w      	r8, (r14, 0x0)
    14be:	1401      	addi      	r14, r14, 4
    14c0:	783c      	jmp      	r15
	...

000014c4 <csi_syscon_lvd_config>:
  \param[in]   lvd_intlvl interrupt level selection
  \param[in]   lvd_rstlvl reset level selection (LVD_RSTAT2P15 is default)
  \return      None
*/
void csi_syscon_lvd_config(lvd_intlvl_e lvd_intlvl, lvd_rstlvl_e lvd_rstlvl)
{
    14c4:	1421      	subi      	r14, r14, 4
    14c6:	dd0e2000 	st.w      	r8, (r14, 0x0)
    14ca:	6e3b      	mov      	r8, r14
    14cc:	1422      	subi      	r14, r14, 8
    14ce:	3300      	movi      	r3, 0
    14d0:	2b03      	subi      	r3, 4
    14d2:	60e0      	addu      	r3, r8
    14d4:	b300      	st.w      	r0, (r3, 0x0)
    14d6:	3300      	movi      	r3, 0
    14d8:	2b07      	subi      	r3, 8
    14da:	60e0      	addu      	r3, r8
    14dc:	b320      	st.w      	r1, (r3, 0x0)
	if (lvd_intlvl == LVD_INTDIS) {
    14de:	3300      	movi      	r3, 0
    14e0:	2b03      	subi      	r3, 4
    14e2:	60e0      	addu      	r3, r8
    14e4:	9360      	ld.w      	r3, (r3, 0x0)
    14e6:	3b44      	cmpnei      	r3, 4
    14e8:	0812      	bt      	0x150c	// 150c <csi_syscon_lvd_config+0x48>
		H_SYSCON->LVDCR = ((H_SYSCON->LVDCR) & 0xf) | (0<<11) | (lvd_rstlvl<<12) | LVDCR_KEY;
    14ea:	017f      	lrw      	r3, 0x20000018	// 17e8 <csi_syscon_exi_get_status+0x64>
    14ec:	9360      	ld.w      	r3, (r3, 0x0)
    14ee:	0240      	lrw      	r2, 0x20000018	// 17e8 <csi_syscon_exi_get_status+0x64>
    14f0:	9240      	ld.w      	r2, (r2, 0x0)
    14f2:	9233      	ld.w      	r1, (r2, 0x4c)
    14f4:	320f      	movi      	r2, 15
    14f6:	6848      	and      	r1, r2
    14f8:	3200      	movi      	r2, 0
    14fa:	2a07      	subi      	r2, 8
    14fc:	60a0      	addu      	r2, r8
    14fe:	9240      	ld.w      	r2, (r2, 0x0)
    1500:	424c      	lsli      	r2, r2, 12
    1502:	6c48      	or      	r1, r2
    1504:	0242      	lrw      	r2, 0xb44b0000	// 17f8 <csi_syscon_exi_get_status+0x74>
    1506:	6c84      	or      	r2, r1
    1508:	b353      	st.w      	r2, (r3, 0x4c)
	}
	else {
		H_SYSCON->LVDCR = ((H_SYSCON->LVDCR) & 0xf) | (1ul<<11) | (lvd_intlvl<<8) | (lvd_rstlvl<<12) | LVDCR_KEY;
	}

}
    150a:	0417      	br      	0x1538	// 1538 <csi_syscon_lvd_config+0x74>
		H_SYSCON->LVDCR = ((H_SYSCON->LVDCR) & 0xf) | (1ul<<11) | (lvd_intlvl<<8) | (lvd_rstlvl<<12) | LVDCR_KEY;
    150c:	0268      	lrw      	r3, 0x20000018	// 17e8 <csi_syscon_exi_get_status+0x64>
    150e:	9360      	ld.w      	r3, (r3, 0x0)
    1510:	0249      	lrw      	r2, 0x20000018	// 17e8 <csi_syscon_exi_get_status+0x64>
    1512:	9240      	ld.w      	r2, (r2, 0x0)
    1514:	9233      	ld.w      	r1, (r2, 0x4c)
    1516:	320f      	movi      	r2, 15
    1518:	6848      	and      	r1, r2
    151a:	3200      	movi      	r2, 0
    151c:	2a03      	subi      	r2, 4
    151e:	60a0      	addu      	r2, r8
    1520:	9240      	ld.w      	r2, (r2, 0x0)
    1522:	4248      	lsli      	r2, r2, 8
    1524:	6c48      	or      	r1, r2
    1526:	3200      	movi      	r2, 0
    1528:	2a07      	subi      	r2, 8
    152a:	60a0      	addu      	r2, r8
    152c:	9240      	ld.w      	r2, (r2, 0x0)
    152e:	424c      	lsli      	r2, r2, 12
    1530:	6c48      	or      	r1, r2
    1532:	024c      	lrw      	r2, 0xb44b0800	// 17fc <csi_syscon_exi_get_status+0x78>
    1534:	6c84      	or      	r2, r1
    1536:	b353      	st.w      	r2, (r3, 0x4c)
}
    1538:	6c00      	or      	r0, r0
    153a:	6fa3      	mov      	r14, r8
    153c:	d90e2000 	ld.w      	r8, (r14, 0x0)
    1540:	1401      	addi      	r14, r14, 4
    1542:	783c      	jmp      	r15

00001544 <csi_syscon_lvd_set_switch>:
  \brief       Enable/disable LVD
  \param[in]   status   en/dis operation(APT_DEF_ENABLE is default)
  \return      None
*/
void csi_syscon_lvd_set_switch(syscon_endis_e status)
{
    1544:	1421      	subi      	r14, r14, 4
    1546:	dd0e2000 	st.w      	r8, (r14, 0x0)
    154a:	6e3b      	mov      	r8, r14
    154c:	1421      	subi      	r14, r14, 4
    154e:	3300      	movi      	r3, 0
    1550:	2b03      	subi      	r3, 4
    1552:	60e0      	addu      	r3, r8
    1554:	b300      	st.w      	r0, (r3, 0x0)
	if (status == ENABLE) {
    1556:	3300      	movi      	r3, 0
    1558:	2b03      	subi      	r3, 4
    155a:	60e0      	addu      	r3, r8
    155c:	9360      	ld.w      	r3, (r3, 0x0)
    155e:	3b40      	cmpnei      	r3, 0
    1560:	080d      	bt      	0x157a	// 157a <csi_syscon_lvd_set_switch+0x36>
		H_SYSCON->LVDCR = LVDCR_KEY | ((H_SYSCON->LVDCR) & ~0xf) ;
    1562:	027d      	lrw      	r3, 0x20000018	// 17e8 <csi_syscon_exi_get_status+0x64>
    1564:	9340      	ld.w      	r2, (r3, 0x0)
    1566:	027e      	lrw      	r3, 0x20000018	// 17e8 <csi_syscon_exi_get_status+0x64>
    1568:	9360      	ld.w      	r3, (r3, 0x0)
    156a:	9333      	ld.w      	r1, (r3, 0x4c)
    156c:	027a      	lrw      	r3, 0x4bb50000	// 1800 <csi_syscon_exi_get_status+0x7c>
    156e:	2b0f      	subi      	r3, 16
    1570:	684c      	and      	r1, r3
    1572:	027d      	lrw      	r3, 0xb44b0000	// 17f8 <csi_syscon_exi_get_status+0x74>
    1574:	6cc4      	or      	r3, r1
    1576:	b273      	st.w      	r3, (r2, 0x4c)
	} 
	else {
		H_SYSCON->LVDCR = LVDCR_KEY | ((H_SYSCON->LVDCR) | 0xa);
	}
}
    1578:	0409      	br      	0x158a	// 158a <csi_syscon_lvd_set_switch+0x46>
		H_SYSCON->LVDCR = LVDCR_KEY | ((H_SYSCON->LVDCR) | 0xa);
    157a:	0363      	lrw      	r3, 0x20000018	// 17e8 <csi_syscon_exi_get_status+0x64>
    157c:	9360      	ld.w      	r3, (r3, 0x0)
    157e:	0344      	lrw      	r2, 0x20000018	// 17e8 <csi_syscon_exi_get_status+0x64>
    1580:	9240      	ld.w      	r2, (r2, 0x0)
    1582:	9233      	ld.w      	r1, (r2, 0x4c)
    1584:	025f      	lrw      	r2, 0xb44b000a	// 1804 <csi_syscon_exi_get_status+0x80>
    1586:	6c84      	or      	r2, r1
    1588:	b353      	st.w      	r2, (r3, 0x4c)
}
    158a:	6c00      	or      	r0, r0
    158c:	6fa3      	mov      	r14, r8
    158e:	d90e2000 	ld.w      	r8, (r14, 0x0)
    1592:	1401      	addi      	r14, r14, 4
    1594:	783c      	jmp      	r15
	...

00001598 <csi_syscon_lvd_get_status>:
/**
  \brief       Get LVD level
  \return      LVD current level
*/
bool csi_syscon_lvd_get_status(void)
{
    1598:	1421      	subi      	r14, r14, 4
    159a:	dd0e2000 	st.w      	r8, (r14, 0x0)
    159e:	6e3b      	mov      	r8, r14
    15a0:	1421      	subi      	r14, r14, 4
	bool lvd_flag;
	if ((H_SYSCON->LVDCR) & (1ul<<15)) {
    15a2:	036d      	lrw      	r3, 0x20000018	// 17e8 <csi_syscon_exi_get_status+0x64>
    15a4:	9360      	ld.w      	r3, (r3, 0x0)
    15a6:	9353      	ld.w      	r2, (r3, 0x4c)
    15a8:	3380      	movi      	r3, 128
    15aa:	4368      	lsli      	r3, r3, 8
    15ac:	68c8      	and      	r3, r2
    15ae:	3b40      	cmpnei      	r3, 0
    15b0:	0c07      	bf      	0x15be	// 15be <csi_syscon_lvd_get_status+0x26>
		lvd_flag = true;    // vdd < vth
    15b2:	3300      	movi      	r3, 0
    15b4:	2b00      	subi      	r3, 1
    15b6:	60e0      	addu      	r3, r8
    15b8:	3201      	movi      	r2, 1
    15ba:	a340      	st.b      	r2, (r3, 0x0)
    15bc:	0406      	br      	0x15c8	// 15c8 <csi_syscon_lvd_get_status+0x30>
	}
	else {
		lvd_flag = false;   // vdd > vth
    15be:	3300      	movi      	r3, 0
    15c0:	2b00      	subi      	r3, 1
    15c2:	60e0      	addu      	r3, r8
    15c4:	3200      	movi      	r2, 0
    15c6:	a340      	st.b      	r2, (r3, 0x0)
	}
	
	return lvd_flag;
    15c8:	3300      	movi      	r3, 0
    15ca:	2b00      	subi      	r3, 1
    15cc:	60e0      	addu      	r3, r8
    15ce:	8360      	ld.b      	r3, (r3, 0x0)
    15d0:	74cc      	zextb      	r3, r3
}
    15d2:	6c0f      	mov      	r0, r3
    15d4:	6fa3      	mov      	r14, r8
    15d6:	d90e2000 	ld.w      	r8, (r14, 0x0)
    15da:	1401      	addi      	r14, r14, 4
    15dc:	783c      	jmp      	r15
	...

000015e0 <csi_syscon_exi_set_rising>:
  \param[in]   exi_sel:  exi event to be set
  \param[in]   status:   enable/disable control(APT_DEF_ENABLE is default)
  \return      current setup of falling edge config
*/
uint32_t csi_syscon_exi_set_rising(exi_event_e exi_sel, syscon_endis_e status)
{
    15e0:	1421      	subi      	r14, r14, 4
    15e2:	dd0e2000 	st.w      	r8, (r14, 0x0)
    15e6:	6e3b      	mov      	r8, r14
    15e8:	1422      	subi      	r14, r14, 8
    15ea:	3300      	movi      	r3, 0
    15ec:	2b03      	subi      	r3, 4
    15ee:	60e0      	addu      	r3, r8
    15f0:	b300      	st.w      	r0, (r3, 0x0)
    15f2:	3300      	movi      	r3, 0
    15f4:	2b07      	subi      	r3, 8
    15f6:	60e0      	addu      	r3, r8
    15f8:	b320      	st.w      	r1, (r3, 0x0)
	if (status == ENABLE) { /* select as rising edge*/
    15fa:	3300      	movi      	r3, 0
    15fc:	2b07      	subi      	r3, 8
    15fe:	60e0      	addu      	r3, r8
    1600:	9360      	ld.w      	r3, (r3, 0x0)
    1602:	3b40      	cmpnei      	r3, 0
    1604:	0813      	bt      	0x162a	// 162a <csi_syscon_exi_set_rising+0x4a>
		H_SYSCON->EXIRT |= 1ul<<exi_sel;
    1606:	1379      	lrw      	r3, 0x20000018	// 17e8 <csi_syscon_exi_get_status+0x64>
    1608:	9300      	ld.w      	r0, (r3, 0x0)
    160a:	1378      	lrw      	r3, 0x20000018	// 17e8 <csi_syscon_exi_get_status+0x64>
    160c:	9360      	ld.w      	r3, (r3, 0x0)
    160e:	2393      	addi      	r3, 148
    1610:	9340      	ld.w      	r2, (r3, 0x0)
    1612:	3300      	movi      	r3, 0
    1614:	2b03      	subi      	r3, 4
    1616:	60e0      	addu      	r3, r8
    1618:	3101      	movi      	r1, 1
    161a:	9360      	ld.w      	r3, (r3, 0x0)
    161c:	704c      	lsl      	r1, r3
    161e:	6cc7      	mov      	r3, r1
    1620:	6c8c      	or      	r2, r3
    1622:	6cc3      	mov      	r3, r0
    1624:	2393      	addi      	r3, 148
    1626:	b340      	st.w      	r2, (r3, 0x0)
    1628:	0413      	br      	0x164e	// 164e <csi_syscon_exi_set_rising+0x6e>
	}
	else
	{
		H_SYSCON->EXIRT &= ~(1ul<<exi_sel);
    162a:	1370      	lrw      	r3, 0x20000018	// 17e8 <csi_syscon_exi_get_status+0x64>
    162c:	9300      	ld.w      	r0, (r3, 0x0)
    162e:	136f      	lrw      	r3, 0x20000018	// 17e8 <csi_syscon_exi_get_status+0x64>
    1630:	9360      	ld.w      	r3, (r3, 0x0)
    1632:	2393      	addi      	r3, 148
    1634:	9340      	ld.w      	r2, (r3, 0x0)
    1636:	3300      	movi      	r3, 0
    1638:	2b03      	subi      	r3, 4
    163a:	60e0      	addu      	r3, r8
    163c:	3101      	movi      	r1, 1
    163e:	9360      	ld.w      	r3, (r3, 0x0)
    1640:	704c      	lsl      	r1, r3
    1642:	6cc7      	mov      	r3, r1
    1644:	6cce      	nor      	r3, r3
    1646:	688c      	and      	r2, r3
    1648:	6cc3      	mov      	r3, r0
    164a:	2393      	addi      	r3, 148
    164c:	b340      	st.w      	r2, (r3, 0x0)
	}

	return H_SYSCON->EXIRT;
    164e:	1367      	lrw      	r3, 0x20000018	// 17e8 <csi_syscon_exi_get_status+0x64>
    1650:	9360      	ld.w      	r3, (r3, 0x0)
    1652:	2393      	addi      	r3, 148
    1654:	9360      	ld.w      	r3, (r3, 0x0)
}
    1656:	6c0f      	mov      	r0, r3
    1658:	6fa3      	mov      	r14, r8
    165a:	d90e2000 	ld.w      	r8, (r14, 0x0)
    165e:	1401      	addi      	r14, r14, 4
    1660:	783c      	jmp      	r15
	...

00001664 <csi_syscon_exi_set_falling>:
  \param[in]   exi_sel:  exi event to be set
  \param[in]   status:   enable/disable control(APT_DEF_ENABLE is default)
  \return      current setup of falling edge config
*/
uint32_t csi_syscon_exi_set_falling(exi_event_e exi_sel, syscon_endis_e status)
{
    1664:	1421      	subi      	r14, r14, 4
    1666:	dd0e2000 	st.w      	r8, (r14, 0x0)
    166a:	6e3b      	mov      	r8, r14
    166c:	1422      	subi      	r14, r14, 8
    166e:	3300      	movi      	r3, 0
    1670:	2b03      	subi      	r3, 4
    1672:	60e0      	addu      	r3, r8
    1674:	b300      	st.w      	r0, (r3, 0x0)
    1676:	3300      	movi      	r3, 0
    1678:	2b07      	subi      	r3, 8
    167a:	60e0      	addu      	r3, r8
    167c:	b320      	st.w      	r1, (r3, 0x0)
	if (status == ENABLE) { /* select as falling edge*/
    167e:	3300      	movi      	r3, 0
    1680:	2b07      	subi      	r3, 8
    1682:	60e0      	addu      	r3, r8
    1684:	9360      	ld.w      	r3, (r3, 0x0)
    1686:	3b40      	cmpnei      	r3, 0
    1688:	0813      	bt      	0x16ae	// 16ae <csi_syscon_exi_set_falling+0x4a>
		H_SYSCON->EXIFT |= 1ul<<exi_sel;
    168a:	1278      	lrw      	r3, 0x20000018	// 17e8 <csi_syscon_exi_get_status+0x64>
    168c:	9300      	ld.w      	r0, (r3, 0x0)
    168e:	1277      	lrw      	r3, 0x20000018	// 17e8 <csi_syscon_exi_get_status+0x64>
    1690:	9360      	ld.w      	r3, (r3, 0x0)
    1692:	2397      	addi      	r3, 152
    1694:	9340      	ld.w      	r2, (r3, 0x0)
    1696:	3300      	movi      	r3, 0
    1698:	2b03      	subi      	r3, 4
    169a:	60e0      	addu      	r3, r8
    169c:	3101      	movi      	r1, 1
    169e:	9360      	ld.w      	r3, (r3, 0x0)
    16a0:	704c      	lsl      	r1, r3
    16a2:	6cc7      	mov      	r3, r1
    16a4:	6c8c      	or      	r2, r3
    16a6:	6cc3      	mov      	r3, r0
    16a8:	2397      	addi      	r3, 152
    16aa:	b340      	st.w      	r2, (r3, 0x0)
    16ac:	0413      	br      	0x16d2	// 16d2 <csi_syscon_exi_set_falling+0x6e>
	}
	else
	{
		H_SYSCON->EXIFT &= ~(1ul<<exi_sel);
    16ae:	126f      	lrw      	r3, 0x20000018	// 17e8 <csi_syscon_exi_get_status+0x64>
    16b0:	9300      	ld.w      	r0, (r3, 0x0)
    16b2:	126e      	lrw      	r3, 0x20000018	// 17e8 <csi_syscon_exi_get_status+0x64>
    16b4:	9360      	ld.w      	r3, (r3, 0x0)
    16b6:	2397      	addi      	r3, 152
    16b8:	9340      	ld.w      	r2, (r3, 0x0)
    16ba:	3300      	movi      	r3, 0
    16bc:	2b03      	subi      	r3, 4
    16be:	60e0      	addu      	r3, r8
    16c0:	3101      	movi      	r1, 1
    16c2:	9360      	ld.w      	r3, (r3, 0x0)
    16c4:	704c      	lsl      	r1, r3
    16c6:	6cc7      	mov      	r3, r1
    16c8:	6cce      	nor      	r3, r3
    16ca:	688c      	and      	r2, r3
    16cc:	6cc3      	mov      	r3, r0
    16ce:	2397      	addi      	r3, 152
    16d0:	b340      	st.w      	r2, (r3, 0x0)
	}

	return H_SYSCON->EXIFT;
    16d2:	1266      	lrw      	r3, 0x20000018	// 17e8 <csi_syscon_exi_get_status+0x64>
    16d4:	9360      	ld.w      	r3, (r3, 0x0)
    16d6:	2397      	addi      	r3, 152
    16d8:	9360      	ld.w      	r3, (r3, 0x0)
}
    16da:	6c0f      	mov      	r0, r3
    16dc:	6fa3      	mov      	r14, r8
    16de:	d90e2000 	ld.w      	r8, (r14, 0x0)
    16e2:	1401      	addi      	r14, r14, 4
    16e4:	783c      	jmp      	r15
	...

000016e8 <csi_syscon_exi_set_switch>:
  \param[in]   exi_sel:  exi event to be set
  \param[in]   status:   enable/disable control(APT_DEF_ENABLE is default)
  \return      current masking status
*/
uint32_t csi_syscon_exi_set_switch(exi_event_e exi_sel, syscon_endis_e status)
{
    16e8:	1421      	subi      	r14, r14, 4
    16ea:	dd0e2000 	st.w      	r8, (r14, 0x0)
    16ee:	6e3b      	mov      	r8, r14
    16f0:	1422      	subi      	r14, r14, 8
    16f2:	3300      	movi      	r3, 0
    16f4:	2b03      	subi      	r3, 4
    16f6:	60e0      	addu      	r3, r8
    16f8:	b300      	st.w      	r0, (r3, 0x0)
    16fa:	3300      	movi      	r3, 0
    16fc:	2b07      	subi      	r3, 8
    16fe:	60e0      	addu      	r3, r8
    1700:	b320      	st.w      	r1, (r3, 0x0)
	if (status == ENABLE) {
    1702:	3300      	movi      	r3, 0
    1704:	2b07      	subi      	r3, 8
    1706:	60e0      	addu      	r3, r8
    1708:	9360      	ld.w      	r3, (r3, 0x0)
    170a:	3b40      	cmpnei      	r3, 0
    170c:	080d      	bt      	0x1726	// 1726 <csi_syscon_exi_set_switch+0x3e>
		H_SYSCON->EXIER = 1ul<<exi_sel;
    170e:	1177      	lrw      	r3, 0x20000018	// 17e8 <csi_syscon_exi_get_status+0x64>
    1710:	9320      	ld.w      	r1, (r3, 0x0)
    1712:	3300      	movi      	r3, 0
    1714:	2b03      	subi      	r3, 4
    1716:	60e0      	addu      	r3, r8
    1718:	3201      	movi      	r2, 1
    171a:	9360      	ld.w      	r3, (r3, 0x0)
    171c:	708c      	lsl      	r2, r3
    171e:	6cc7      	mov      	r3, r1
    1720:	239b      	addi      	r3, 156
    1722:	b340      	st.w      	r2, (r3, 0x0)
    1724:	040c      	br      	0x173c	// 173c <csi_syscon_exi_set_switch+0x54>
	}
	else {
		H_SYSCON->EXIDR = 1ul<<exi_sel;
    1726:	1171      	lrw      	r3, 0x20000018	// 17e8 <csi_syscon_exi_get_status+0x64>
    1728:	9320      	ld.w      	r1, (r3, 0x0)
    172a:	3300      	movi      	r3, 0
    172c:	2b03      	subi      	r3, 4
    172e:	60e0      	addu      	r3, r8
    1730:	3201      	movi      	r2, 1
    1732:	9360      	ld.w      	r3, (r3, 0x0)
    1734:	708c      	lsl      	r2, r3
    1736:	6cc7      	mov      	r3, r1
    1738:	239f      	addi      	r3, 160
    173a:	b340      	st.w      	r2, (r3, 0x0)
	}

	return H_SYSCON->EXIMR;
    173c:	116b      	lrw      	r3, 0x20000018	// 17e8 <csi_syscon_exi_get_status+0x64>
    173e:	9360      	ld.w      	r3, (r3, 0x0)
    1740:	23a3      	addi      	r3, 164
    1742:	9360      	ld.w      	r3, (r3, 0x0)
}
    1744:	6c0f      	mov      	r0, r3
    1746:	6fa3      	mov      	r14, r8
    1748:	d90e2000 	ld.w      	r8, (r14, 0x0)
    174c:	1401      	addi      	r14, r14, 4
    174e:	783c      	jmp      	r15

00001750 <csi_syscon_clear_exi_pending>:
  \brief       Clear EXI pending 
  \param[in]   exi_sel: exi event to be clear
  \return      None
*/
void csi_syscon_clear_exi_pending(exi_event_e exi_sel)
{
    1750:	1421      	subi      	r14, r14, 4
    1752:	dd0e2000 	st.w      	r8, (r14, 0x0)
    1756:	6e3b      	mov      	r8, r14
    1758:	1421      	subi      	r14, r14, 4
    175a:	3300      	movi      	r3, 0
    175c:	2b03      	subi      	r3, 4
    175e:	60e0      	addu      	r3, r8
    1760:	b300      	st.w      	r0, (r3, 0x0)
	H_SYSCON->EXICR = 1ul<<exi_sel;
    1762:	1162      	lrw      	r3, 0x20000018	// 17e8 <csi_syscon_exi_get_status+0x64>
    1764:	9320      	ld.w      	r1, (r3, 0x0)
    1766:	3300      	movi      	r3, 0
    1768:	2b03      	subi      	r3, 4
    176a:	60e0      	addu      	r3, r8
    176c:	3201      	movi      	r2, 1
    176e:	9360      	ld.w      	r3, (r3, 0x0)
    1770:	708c      	lsl      	r2, r3
    1772:	6cc7      	mov      	r3, r1
    1774:	23ab      	addi      	r3, 172
    1776:	b340      	st.w      	r2, (r3, 0x0)
}
    1778:	6c00      	or      	r0, r0
    177a:	6fa3      	mov      	r14, r8
    177c:	d90e2000 	ld.w      	r8, (r14, 0x0)
    1780:	1401      	addi      	r14, r14, 4
    1782:	783c      	jmp      	r15

00001784 <csi_syscon_exi_get_status>:
  \param[in]   exi_sel:  exi pending to be read
  \param[in]   status:   raw(T)/masked(F) pending bit select(APT_DEF_DISABLE is default)
  \return      corresponding bit of pending according to int_sel
*/
uint32_t csi_syscon_exi_get_status(exi_event_e exi_sel, syscon_endis_e status)
{
    1784:	1421      	subi      	r14, r14, 4
    1786:	dd0e2000 	st.w      	r8, (r14, 0x0)
    178a:	6e3b      	mov      	r8, r14
    178c:	1422      	subi      	r14, r14, 8
    178e:	3300      	movi      	r3, 0
    1790:	2b03      	subi      	r3, 4
    1792:	60e0      	addu      	r3, r8
    1794:	b300      	st.w      	r0, (r3, 0x0)
    1796:	3300      	movi      	r3, 0
    1798:	2b07      	subi      	r3, 8
    179a:	60e0      	addu      	r3, r8
    179c:	b320      	st.w      	r1, (r3, 0x0)
	if (status == ENABLE) {
    179e:	3300      	movi      	r3, 0
    17a0:	2b07      	subi      	r3, 8
    17a2:	60e0      	addu      	r3, r8
    17a4:	9360      	ld.w      	r3, (r3, 0x0)
    17a6:	3b40      	cmpnei      	r3, 0
    17a8:	080e      	bt      	0x17c4	// 17c4 <csi_syscon_exi_get_status+0x40>
		return ((H_SYSCON->EXIRS) & (1ul<<exi_sel));
    17aa:	1070      	lrw      	r3, 0x20000018	// 17e8 <csi_syscon_exi_get_status+0x64>
    17ac:	9360      	ld.w      	r3, (r3, 0x0)
    17ae:	23af      	addi      	r3, 176
    17b0:	9340      	ld.w      	r2, (r3, 0x0)
    17b2:	3300      	movi      	r3, 0
    17b4:	2b03      	subi      	r3, 4
    17b6:	60e0      	addu      	r3, r8
    17b8:	3101      	movi      	r1, 1
    17ba:	9360      	ld.w      	r3, (r3, 0x0)
    17bc:	704c      	lsl      	r1, r3
    17be:	6cc7      	mov      	r3, r1
    17c0:	68c8      	and      	r3, r2
    17c2:	040d      	br      	0x17dc	// 17dc <csi_syscon_exi_get_status+0x58>
	}
	else {
		return ((H_SYSCON->EXICR) & (1ul<<exi_sel));
    17c4:	1069      	lrw      	r3, 0x20000018	// 17e8 <csi_syscon_exi_get_status+0x64>
    17c6:	9360      	ld.w      	r3, (r3, 0x0)
    17c8:	23ab      	addi      	r3, 172
    17ca:	9340      	ld.w      	r2, (r3, 0x0)
    17cc:	3300      	movi      	r3, 0
    17ce:	2b03      	subi      	r3, 4
    17d0:	60e0      	addu      	r3, r8
    17d2:	3101      	movi      	r1, 1
    17d4:	9360      	ld.w      	r3, (r3, 0x0)
    17d6:	704c      	lsl      	r1, r3
    17d8:	6cc7      	mov      	r3, r1
    17da:	68c8      	and      	r3, r2
	}
}
    17dc:	6c0f      	mov      	r0, r3
    17de:	6fa3      	mov      	r14, r8
    17e0:	d90e2000 	ld.w      	r8, (r14, 0x0)
    17e4:	1401      	addi      	r14, r14, 4
    17e6:	783c      	jmp      	r15
    17e8:	20000018 	.long	0x20000018
    17ec:	78870000 	.long	0x78870000
    17f0:	78875555 	.long	0x78875555
    17f4:	87780000 	.long	0x87780000
    17f8:	b44b0000 	.long	0xb44b0000
    17fc:	b44b0800 	.long	0xb44b0800
    1800:	4bb50000 	.long	0x4bb50000
    1804:	b44b000a 	.long	0xb44b000a

00001808 <csi_syscon_software_trigger_exi>:
  \brief       Software trigger EXI
  \param[in]   exi_sel  exi line to be triggered
  \return      None
*/
void csi_syscon_software_trigger_exi(exi_event_e exi_sel)
{
    1808:	1421      	subi      	r14, r14, 4
    180a:	dd0e2000 	st.w      	r8, (r14, 0x0)
    180e:	6e3b      	mov      	r8, r14
    1810:	1421      	subi      	r14, r14, 4
    1812:	3300      	movi      	r3, 0
    1814:	2b03      	subi      	r3, 4
    1816:	60e0      	addu      	r3, r8
    1818:	b300      	st.w      	r0, (r3, 0x0)
	H_SYSCON->EXIAR = 1ul<<exi_sel;
    181a:	0076      	lrw      	r3, 0x20000018	// 1bbc <csi_syscon_clo_config+0x3c>
    181c:	9320      	ld.w      	r1, (r3, 0x0)
    181e:	3300      	movi      	r3, 0
    1820:	2b03      	subi      	r3, 4
    1822:	60e0      	addu      	r3, r8
    1824:	3201      	movi      	r2, 1
    1826:	9360      	ld.w      	r3, (r3, 0x0)
    1828:	708c      	lsl      	r2, r3
    182a:	6cc7      	mov      	r3, r1
    182c:	23a7      	addi      	r3, 168
    182e:	b340      	st.w      	r2, (r3, 0x0)
}
    1830:	6c00      	or      	r0, r0
    1832:	6fa3      	mov      	r14, r8
    1834:	d90e2000 	ld.w      	r8, (r14, 0x0)
    1838:	1401      	addi      	r14, r14, 4
    183a:	783c      	jmp      	r15

0000183c <csi_syscon_reset_log_get_status>:
/**
  \brief       Reset source information
  \return      reset_src_t 
*/
reset_log_t csi_syscon_reset_log_get_status(void)
{
    183c:	1421      	subi      	r14, r14, 4
    183e:	dd0e2000 	st.w      	r8, (r14, 0x0)
    1842:	6e3b      	mov      	r8, r14
    1844:	1421      	subi      	r14, r14, 4
	reset_log_t rstlog;
	rstlog.w = (H_SYSCON->RSR);
    1846:	0161      	lrw      	r3, 0x20000018	// 1bbc <csi_syscon_clo_config+0x3c>
    1848:	9360      	ld.w      	r3, (r3, 0x0)
    184a:	238f      	addi      	r3, 144
    184c:	9340      	ld.w      	r2, (r3, 0x0)
    184e:	3300      	movi      	r3, 0
    1850:	2b03      	subi      	r3, 4
    1852:	60e0      	addu      	r3, r8
    1854:	b340      	st.w      	r2, (r3, 0x0)
	return rstlog;
    1856:	3300      	movi      	r3, 0
    1858:	2b03      	subi      	r3, 4
    185a:	60e0      	addu      	r3, r8
    185c:	9360      	ld.w      	r3, (r3, 0x0)
}
    185e:	6c0f      	mov      	r0, r3
    1860:	6fa3      	mov      	r14, r8
    1862:	d90e2000 	ld.w      	r8, (r14, 0x0)
    1866:	1401      	addi      	r14, r14, 4
    1868:	783c      	jmp      	r15
	...

0000186c <csi_syscon_interrupt_set_switch>:
  \param[in]   int_sel:  interrupt to be en/dis
  \param[in]   status:   enable/disable
  \return      current masking status
*/
uint32_t csi_syscon_interrupt_set_switch(syscon_event_e int_sel, syscon_endis_e status)
{
    186c:	1421      	subi      	r14, r14, 4
    186e:	dd0e2000 	st.w      	r8, (r14, 0x0)
    1872:	6e3b      	mov      	r8, r14
    1874:	1422      	subi      	r14, r14, 8
    1876:	3300      	movi      	r3, 0
    1878:	2b03      	subi      	r3, 4
    187a:	60e0      	addu      	r3, r8
    187c:	b300      	st.w      	r0, (r3, 0x0)
    187e:	3300      	movi      	r3, 0
    1880:	2b07      	subi      	r3, 8
    1882:	60e0      	addu      	r3, r8
    1884:	b320      	st.w      	r1, (r3, 0x0)
	if (status == ENABLE) {
    1886:	3300      	movi      	r3, 0
    1888:	2b07      	subi      	r3, 8
    188a:	60e0      	addu      	r3, r8
    188c:	9360      	ld.w      	r3, (r3, 0x0)
    188e:	3b40      	cmpnei      	r3, 0
    1890:	080c      	bt      	0x18a8	// 18a8 <csi_syscon_interrupt_set_switch+0x3c>
		H_SYSCON->IECR = 1ul<<int_sel;
    1892:	0174      	lrw      	r3, 0x20000018	// 1bbc <csi_syscon_clo_config+0x3c>
    1894:	9360      	ld.w      	r3, (r3, 0x0)
    1896:	3200      	movi      	r2, 0
    1898:	2a03      	subi      	r2, 4
    189a:	60a0      	addu      	r2, r8
    189c:	3101      	movi      	r1, 1
    189e:	9240      	ld.w      	r2, (r2, 0x0)
    18a0:	7048      	lsl      	r1, r2
    18a2:	6c87      	mov      	r2, r1
    18a4:	b35d      	st.w      	r2, (r3, 0x74)
    18a6:	040b      	br      	0x18bc	// 18bc <csi_syscon_interrupt_set_switch+0x50>
	}
	else {
		H_SYSCON->IDCR = 1ul<<int_sel;
    18a8:	017a      	lrw      	r3, 0x20000018	// 1bbc <csi_syscon_clo_config+0x3c>
    18aa:	9360      	ld.w      	r3, (r3, 0x0)
    18ac:	3200      	movi      	r2, 0
    18ae:	2a03      	subi      	r2, 4
    18b0:	60a0      	addu      	r2, r8
    18b2:	3101      	movi      	r1, 1
    18b4:	9240      	ld.w      	r2, (r2, 0x0)
    18b6:	7048      	lsl      	r1, r2
    18b8:	6c87      	mov      	r2, r1
    18ba:	b35e      	st.w      	r2, (r3, 0x78)
	}

	return H_SYSCON->IMSR;
    18bc:	017f      	lrw      	r3, 0x20000018	// 1bbc <csi_syscon_clo_config+0x3c>
    18be:	9360      	ld.w      	r3, (r3, 0x0)
    18c0:	937f      	ld.w      	r3, (r3, 0x7c)
}
    18c2:	6c0f      	mov      	r0, r3
    18c4:	6fa3      	mov      	r14, r8
    18c6:	d90e2000 	ld.w      	r8, (r14, 0x0)
    18ca:	1401      	addi      	r14, r14, 4
    18cc:	783c      	jmp      	r15
	...

000018d0 <csi_syscon_interrupt_clear_pending>:
  \brief       Clear pending bit
  \param[in]   int_sel:  interrupt to be clear
  \return      None
*/
void csi_syscon_interrupt_clear_pending(syscon_event_e int_sel)
{
    18d0:	1421      	subi      	r14, r14, 4
    18d2:	dd0e2000 	st.w      	r8, (r14, 0x0)
    18d6:	6e3b      	mov      	r8, r14
    18d8:	1421      	subi      	r14, r14, 4
    18da:	3300      	movi      	r3, 0
    18dc:	2b03      	subi      	r3, 4
    18de:	60e0      	addu      	r3, r8
    18e0:	b300      	st.w      	r0, (r3, 0x0)
	H_SYSCON->ICR = 1ul<<int_sel;
    18e2:	0268      	lrw      	r3, 0x20000018	// 1bbc <csi_syscon_clo_config+0x3c>
    18e4:	9320      	ld.w      	r1, (r3, 0x0)
    18e6:	3300      	movi      	r3, 0
    18e8:	2b03      	subi      	r3, 4
    18ea:	60e0      	addu      	r3, r8
    18ec:	3201      	movi      	r2, 1
    18ee:	9360      	ld.w      	r3, (r3, 0x0)
    18f0:	708c      	lsl      	r2, r3
    18f2:	6cc7      	mov      	r3, r1
    18f4:	2383      	addi      	r3, 132
    18f6:	b340      	st.w      	r2, (r3, 0x0)
}
    18f8:	6c00      	or      	r0, r0
    18fa:	6fa3      	mov      	r14, r8
    18fc:	d90e2000 	ld.w      	r8, (r14, 0x0)
    1900:	1401      	addi      	r14, r14, 4
    1902:	783c      	jmp      	r15

00001904 <csi_syscon_interrupt_get_status>:
  \param[in]   int_sel:  interrupt pending to be read
  \param[in]   status:   raw(T)/masked(F) pending bit select
  \return      corresponding bit of pending according to int_sel
*/
uint32_t csi_syscon_interrupt_get_status(syscon_event_e int_sel, syscon_endis_e status)
{
    1904:	1421      	subi      	r14, r14, 4
    1906:	dd0e2000 	st.w      	r8, (r14, 0x0)
    190a:	6e3b      	mov      	r8, r14
    190c:	1422      	subi      	r14, r14, 8
    190e:	3300      	movi      	r3, 0
    1910:	2b03      	subi      	r3, 4
    1912:	60e0      	addu      	r3, r8
    1914:	b300      	st.w      	r0, (r3, 0x0)
    1916:	3300      	movi      	r3, 0
    1918:	2b07      	subi      	r3, 8
    191a:	60e0      	addu      	r3, r8
    191c:	b320      	st.w      	r1, (r3, 0x0)
	if (status == ENABLE) {
    191e:	3300      	movi      	r3, 0
    1920:	2b07      	subi      	r3, 8
    1922:	60e0      	addu      	r3, r8
    1924:	9360      	ld.w      	r3, (r3, 0x0)
    1926:	3b40      	cmpnei      	r3, 0
    1928:	080e      	bt      	0x1944	// 1944 <csi_syscon_interrupt_get_status+0x40>
		return ((H_SYSCON->RISR) & (1ul<<int_sel));
    192a:	027a      	lrw      	r3, 0x20000018	// 1bbc <csi_syscon_clo_config+0x3c>
    192c:	9360      	ld.w      	r3, (r3, 0x0)
    192e:	2387      	addi      	r3, 136
    1930:	9340      	ld.w      	r2, (r3, 0x0)
    1932:	3300      	movi      	r3, 0
    1934:	2b03      	subi      	r3, 4
    1936:	60e0      	addu      	r3, r8
    1938:	3101      	movi      	r1, 1
    193a:	9360      	ld.w      	r3, (r3, 0x0)
    193c:	704c      	lsl      	r1, r3
    193e:	6cc7      	mov      	r3, r1
    1940:	68c8      	and      	r3, r2
    1942:	040d      	br      	0x195c	// 195c <csi_syscon_interrupt_get_status+0x58>
	}
	else {
		return ((H_SYSCON->ISR) & (1ul<<int_sel));
    1944:	0361      	lrw      	r3, 0x20000018	// 1bbc <csi_syscon_clo_config+0x3c>
    1946:	9360      	ld.w      	r3, (r3, 0x0)
    1948:	238b      	addi      	r3, 140
    194a:	9340      	ld.w      	r2, (r3, 0x0)
    194c:	3300      	movi      	r3, 0
    194e:	2b03      	subi      	r3, 4
    1950:	60e0      	addu      	r3, r8
    1952:	3101      	movi      	r1, 1
    1954:	9360      	ld.w      	r3, (r3, 0x0)
    1956:	704c      	lsl      	r1, r3
    1958:	6cc7      	mov      	r3, r1
    195a:	68c8      	and      	r3, r2
	}
}
    195c:	6c0f      	mov      	r0, r3
    195e:	6fa3      	mov      	r14, r8
    1960:	d90e2000 	ld.w      	r8, (r14, 0x0)
    1964:	1401      	addi      	r14, r14, 4
    1966:	783c      	jmp      	r15

00001968 <csi_syscon_get_prj_infor>:
  \brief       Get CINF, FINF information
  \param[in]   info_sel information to be load
  \return      result stored in flash
*/
uint32_t csi_syscon_get_prj_infor(prj_infor_e info_sel)
{
    1968:	1421      	subi      	r14, r14, 4
    196a:	dd0e2000 	st.w      	r8, (r14, 0x0)
    196e:	6e3b      	mov      	r8, r14
    1970:	1421      	subi      	r14, r14, 4
    1972:	3300      	movi      	r3, 0
    1974:	2b03      	subi      	r3, 4
    1976:	60e0      	addu      	r3, r8
    1978:	b300      	st.w      	r0, (r3, 0x0)
	switch(info_sel)
    197a:	3300      	movi      	r3, 0
    197c:	2b03      	subi      	r3, 4
    197e:	60e0      	addu      	r3, r8
    1980:	9360      	ld.w      	r3, (r3, 0x0)
    1982:	3b41      	cmpnei      	r3, 1
    1984:	0c0d      	bf      	0x199e	// 199e <csi_syscon_get_prj_infor+0x36>
    1986:	3b00      	cmphsi      	r3, 1
    1988:	0c06      	bf      	0x1994	// 1994 <csi_syscon_get_prj_infor+0x2c>
    198a:	3b42      	cmpnei      	r3, 2
    198c:	0c0e      	bf      	0x19a8	// 19a8 <csi_syscon_get_prj_infor+0x40>
    198e:	3b43      	cmpnei      	r3, 3
    1990:	0c11      	bf      	0x19b2	// 19b2 <csi_syscon_get_prj_infor+0x4a>
    1992:	0415      	br      	0x19bc	// 19bc <csi_syscon_get_prj_infor+0x54>
	{
		case CINF0:
			return H_SYSCON->CINF0;
    1994:	0375      	lrw      	r3, 0x20000018	// 1bbc <csi_syscon_clo_config+0x3c>
    1996:	9360      	ld.w      	r3, (r3, 0x0)
    1998:	23bf      	addi      	r3, 192
    199a:	9360      	ld.w      	r3, (r3, 0x0)
    199c:	0411      	br      	0x19be	// 19be <csi_syscon_get_prj_infor+0x56>
			break;
		case CINF1:
			return H_SYSCON->CINF1;
    199e:	0377      	lrw      	r3, 0x20000018	// 1bbc <csi_syscon_clo_config+0x3c>
    19a0:	9360      	ld.w      	r3, (r3, 0x0)
    19a2:	23c3      	addi      	r3, 196
    19a4:	9360      	ld.w      	r3, (r3, 0x0)
    19a6:	040c      	br      	0x19be	// 19be <csi_syscon_get_prj_infor+0x56>
			break;
		case FINF0:
			return H_SYSCON->FINF0;
    19a8:	037a      	lrw      	r3, 0x20000018	// 1bbc <csi_syscon_clo_config+0x3c>
    19aa:	9360      	ld.w      	r3, (r3, 0x0)
    19ac:	23c7      	addi      	r3, 200
    19ae:	9360      	ld.w      	r3, (r3, 0x0)
    19b0:	0407      	br      	0x19be	// 19be <csi_syscon_get_prj_infor+0x56>
			break;
		case FINF1:
			return H_SYSCON->FINF1;
    19b2:	037c      	lrw      	r3, 0x20000018	// 1bbc <csi_syscon_clo_config+0x3c>
    19b4:	9360      	ld.w      	r3, (r3, 0x0)
    19b6:	23cb      	addi      	r3, 204
    19b8:	9360      	ld.w      	r3, (r3, 0x0)
    19ba:	0402      	br      	0x19be	// 19be <csi_syscon_get_prj_infor+0x56>
			break;
	}
	
	return 0;
    19bc:	3300      	movi      	r3, 0
}
    19be:	6c0f      	mov      	r0, r3
    19c0:	6fa3      	mov      	r14, r8
    19c2:	d90e2000 	ld.w      	r8, (r14, 0x0)
    19c6:	1401      	addi      	r14, r14, 4
    19c8:	783c      	jmp      	r15
	...

000019cc <csi_syscon_get_opt0_infor>:
  \brief       Get user defined/protection status
  \param[in]   info_sel information to be load
  \return      result of check
*/
prot_ret_e csi_syscon_get_opt0_infor(prot_infor_e info_sel)
{
    19cc:	1421      	subi      	r14, r14, 4
    19ce:	dd0e2000 	st.w      	r8, (r14, 0x0)
    19d2:	6e3b      	mov      	r8, r14
    19d4:	1422      	subi      	r14, r14, 8
    19d6:	3300      	movi      	r3, 0
    19d8:	2b07      	subi      	r3, 8
    19da:	60e0      	addu      	r3, r8
    19dc:	b300      	st.w      	r0, (r3, 0x0)
	prot_ret_e result;
	switch(info_sel)
    19de:	3300      	movi      	r3, 0
    19e0:	2b07      	subi      	r3, 8
    19e2:	60e0      	addu      	r3, r8
    19e4:	9340      	ld.w      	r2, (r3, 0x0)
    19e6:	3a04      	cmphsi      	r2, 5
    19e8:	0893      	bt      	0x1b0e	// 1b0e <csi_syscon_get_opt0_infor+0x142>
    19ea:	9360      	ld.w      	r3, (r3, 0x0)
    19ec:	4362      	lsli      	r3, r3, 2
    19ee:	1355      	lrw      	r2, 0x2654	// 1bc0 <csi_syscon_clo_config+0x40>
    19f0:	60c8      	addu      	r3, r2
    19f2:	9360      	ld.w      	r3, (r3, 0x0)
    19f4:	780c      	jmp      	r3
	{
		case WDT:
			if ((H_SYSCON->OPT0) & (1ul)) {
    19f6:	1372      	lrw      	r3, 0x20000018	// 1bbc <csi_syscon_clo_config+0x3c>
    19f8:	9360      	ld.w      	r3, (r3, 0x0)
    19fa:	935a      	ld.w      	r2, (r3, 0x68)
    19fc:	3301      	movi      	r3, 1
    19fe:	68c8      	and      	r3, r2
    1a00:	3b40      	cmpnei      	r3, 0
    1a02:	0c07      	bf      	0x1a10	// 1a10 <csi_syscon_get_opt0_infor+0x44>
				result = WDT_ON;
    1a04:	3300      	movi      	r3, 0
    1a06:	2b03      	subi      	r3, 4
    1a08:	60e0      	addu      	r3, r8
    1a0a:	3200      	movi      	r2, 0
    1a0c:	b340      	st.w      	r2, (r3, 0x0)
			}
			else {
				result = WDT_OFF;
			}
			break;
    1a0e:	0480      	br      	0x1b0e	// 1b0e <csi_syscon_get_opt0_infor+0x142>
				result = WDT_OFF;
    1a10:	3300      	movi      	r3, 0
    1a12:	2b03      	subi      	r3, 4
    1a14:	60e0      	addu      	r3, r8
    1a16:	3201      	movi      	r2, 1
    1a18:	b340      	st.w      	r2, (r3, 0x0)
			break;
    1a1a:	047a      	br      	0x1b0e	// 1b0e <csi_syscon_get_opt0_infor+0x142>
		case ERST:
			if ((H_SYSCON->OPT0) & (1ul<<1)) {
    1a1c:	1368      	lrw      	r3, 0x20000018	// 1bbc <csi_syscon_clo_config+0x3c>
    1a1e:	9360      	ld.w      	r3, (r3, 0x0)
    1a20:	935a      	ld.w      	r2, (r3, 0x68)
    1a22:	3302      	movi      	r3, 2
    1a24:	68c8      	and      	r3, r2
    1a26:	3b40      	cmpnei      	r3, 0
    1a28:	0c07      	bf      	0x1a36	// 1a36 <csi_syscon_get_opt0_infor+0x6a>
				result = ERST_ON;
    1a2a:	3300      	movi      	r3, 0
    1a2c:	2b03      	subi      	r3, 4
    1a2e:	60e0      	addu      	r3, r8
    1a30:	3202      	movi      	r2, 2
    1a32:	b340      	st.w      	r2, (r3, 0x0)
			}
			else {
				result = ERST_OFF;
			}
			break;
    1a34:	046d      	br      	0x1b0e	// 1b0e <csi_syscon_get_opt0_infor+0x142>
				result = ERST_OFF;
    1a36:	3300      	movi      	r3, 0
    1a38:	2b03      	subi      	r3, 4
    1a3a:	60e0      	addu      	r3, r8
    1a3c:	3203      	movi      	r2, 3
    1a3e:	b340      	st.w      	r2, (r3, 0x0)
			break;
    1a40:	0467      	br      	0x1b0e	// 1b0e <csi_syscon_get_opt0_infor+0x142>
		case RDP:
			if ((H_SYSCON->OPT0) & (1ul<<27)) {
    1a42:	127f      	lrw      	r3, 0x20000018	// 1bbc <csi_syscon_clo_config+0x3c>
    1a44:	9360      	ld.w      	r3, (r3, 0x0)
    1a46:	935a      	ld.w      	r2, (r3, 0x68)
    1a48:	3380      	movi      	r3, 128
    1a4a:	4374      	lsli      	r3, r3, 20
    1a4c:	68c8      	and      	r3, r2
    1a4e:	3b40      	cmpnei      	r3, 0
    1a50:	0c07      	bf      	0x1a5e	// 1a5e <csi_syscon_get_opt0_infor+0x92>
				result = RDP_ON;
    1a52:	3300      	movi      	r3, 0
    1a54:	2b03      	subi      	r3, 4
    1a56:	60e0      	addu      	r3, r8
    1a58:	3204      	movi      	r2, 4
    1a5a:	b340      	st.w      	r2, (r3, 0x0)
			}
			else {
				result = RDP_OFF;
			}
			break;
    1a5c:	0459      	br      	0x1b0e	// 1b0e <csi_syscon_get_opt0_infor+0x142>
				result = RDP_OFF;
    1a5e:	3300      	movi      	r3, 0
    1a60:	2b03      	subi      	r3, 4
    1a62:	60e0      	addu      	r3, r8
    1a64:	3205      	movi      	r2, 5
    1a66:	b340      	st.w      	r2, (r3, 0x0)
			break;
    1a68:	0453      	br      	0x1b0e	// 1b0e <csi_syscon_get_opt0_infor+0x142>
		case DBP:
			if ((H_SYSCON->OPT0) & (1ul<<8)) {
    1a6a:	1275      	lrw      	r3, 0x20000018	// 1bbc <csi_syscon_clo_config+0x3c>
    1a6c:	9360      	ld.w      	r3, (r3, 0x0)
    1a6e:	935a      	ld.w      	r2, (r3, 0x68)
    1a70:	3380      	movi      	r3, 128
    1a72:	4361      	lsli      	r3, r3, 1
    1a74:	68c8      	and      	r3, r2
    1a76:	3b40      	cmpnei      	r3, 0
    1a78:	0c07      	bf      	0x1a86	// 1a86 <csi_syscon_get_opt0_infor+0xba>
				result = DBP_ON;
    1a7a:	3300      	movi      	r3, 0
    1a7c:	2b03      	subi      	r3, 4
    1a7e:	60e0      	addu      	r3, r8
    1a80:	3206      	movi      	r2, 6
    1a82:	b340      	st.w      	r2, (r3, 0x0)
			}
			else {
				result = DBP_OFF;
			}
			break;
    1a84:	0445      	br      	0x1b0e	// 1b0e <csi_syscon_get_opt0_infor+0x142>
				result = DBP_OFF;
    1a86:	3300      	movi      	r3, 0
    1a88:	2b03      	subi      	r3, 4
    1a8a:	60e0      	addu      	r3, r8
    1a8c:	3207      	movi      	r2, 7
    1a8e:	b340      	st.w      	r2, (r3, 0x0)
			break;
    1a90:	043f      	br      	0x1b0e	// 1b0e <csi_syscon_get_opt0_infor+0x142>
		case HDP:
			if ((H_SYSCON->OPT0) & (1ul<<16)) {
    1a92:	126b      	lrw      	r3, 0x20000018	// 1bbc <csi_syscon_clo_config+0x3c>
    1a94:	9360      	ld.w      	r3, (r3, 0x0)
    1a96:	935a      	ld.w      	r2, (r3, 0x68)
    1a98:	3380      	movi      	r3, 128
    1a9a:	4369      	lsli      	r3, r3, 9
    1a9c:	68c8      	and      	r3, r2
    1a9e:	3b40      	cmpnei      	r3, 0
    1aa0:	0c07      	bf      	0x1aae	// 1aae <csi_syscon_get_opt0_infor+0xe2>
				result = HDP_ALL;
    1aa2:	3300      	movi      	r3, 0
    1aa4:	2b03      	subi      	r3, 4
    1aa6:	60e0      	addu      	r3, r8
    1aa8:	3208      	movi      	r2, 8
    1aaa:	b340      	st.w      	r2, (r3, 0x0)
				result = HDP_4K;
			}
			else {
				result = HDP_OFF;
			}
			break;
    1aac:	0430      	br      	0x1b0c	// 1b0c <csi_syscon_get_opt0_infor+0x140>
			else if ((H_SYSCON->OPT0) & (1ul<<17)) {
    1aae:	1264      	lrw      	r3, 0x20000018	// 1bbc <csi_syscon_clo_config+0x3c>
    1ab0:	9360      	ld.w      	r3, (r3, 0x0)
    1ab2:	935a      	ld.w      	r2, (r3, 0x68)
    1ab4:	3380      	movi      	r3, 128
    1ab6:	436a      	lsli      	r3, r3, 10
    1ab8:	68c8      	and      	r3, r2
    1aba:	3b40      	cmpnei      	r3, 0
    1abc:	0c07      	bf      	0x1aca	// 1aca <csi_syscon_get_opt0_infor+0xfe>
				result = HDP_1K;
    1abe:	3300      	movi      	r3, 0
    1ac0:	2b03      	subi      	r3, 4
    1ac2:	60e0      	addu      	r3, r8
    1ac4:	3209      	movi      	r2, 9
    1ac6:	b340      	st.w      	r2, (r3, 0x0)
			break;
    1ac8:	0422      	br      	0x1b0c	// 1b0c <csi_syscon_get_opt0_infor+0x140>
			else if ((H_SYSCON->OPT0) & (1ul<<18)) {
    1aca:	117d      	lrw      	r3, 0x20000018	// 1bbc <csi_syscon_clo_config+0x3c>
    1acc:	9360      	ld.w      	r3, (r3, 0x0)
    1ace:	935a      	ld.w      	r2, (r3, 0x68)
    1ad0:	3380      	movi      	r3, 128
    1ad2:	436b      	lsli      	r3, r3, 11
    1ad4:	68c8      	and      	r3, r2
    1ad6:	3b40      	cmpnei      	r3, 0
    1ad8:	0c07      	bf      	0x1ae6	// 1ae6 <csi_syscon_get_opt0_infor+0x11a>
				result = HDP_2K;
    1ada:	3300      	movi      	r3, 0
    1adc:	2b03      	subi      	r3, 4
    1ade:	60e0      	addu      	r3, r8
    1ae0:	320a      	movi      	r2, 10
    1ae2:	b340      	st.w      	r2, (r3, 0x0)
			break;
    1ae4:	0414      	br      	0x1b0c	// 1b0c <csi_syscon_get_opt0_infor+0x140>
			else if ((H_SYSCON->OPT0) & (1ul<<19)) {
    1ae6:	1176      	lrw      	r3, 0x20000018	// 1bbc <csi_syscon_clo_config+0x3c>
    1ae8:	9360      	ld.w      	r3, (r3, 0x0)
    1aea:	935a      	ld.w      	r2, (r3, 0x68)
    1aec:	3380      	movi      	r3, 128
    1aee:	436c      	lsli      	r3, r3, 12
    1af0:	68c8      	and      	r3, r2
    1af2:	3b40      	cmpnei      	r3, 0
    1af4:	0c07      	bf      	0x1b02	// 1b02 <csi_syscon_get_opt0_infor+0x136>
				result = HDP_4K;
    1af6:	3300      	movi      	r3, 0
    1af8:	2b03      	subi      	r3, 4
    1afa:	60e0      	addu      	r3, r8
    1afc:	320b      	movi      	r2, 11
    1afe:	b340      	st.w      	r2, (r3, 0x0)
			break;
    1b00:	0406      	br      	0x1b0c	// 1b0c <csi_syscon_get_opt0_infor+0x140>
				result = HDP_OFF;
    1b02:	3300      	movi      	r3, 0
    1b04:	2b03      	subi      	r3, 4
    1b06:	60e0      	addu      	r3, r8
    1b08:	320c      	movi      	r2, 12
    1b0a:	b340      	st.w      	r2, (r3, 0x0)
			break;
    1b0c:	6c00      	or      	r0, r0
	}
	
	return result;
    1b0e:	3300      	movi      	r3, 0
    1b10:	2b03      	subi      	r3, 4
    1b12:	60e0      	addu      	r3, r8
    1b14:	9360      	ld.w      	r3, (r3, 0x0)
}
    1b16:	6c0f      	mov      	r0, r3
    1b18:	6fa3      	mov      	r14, r8
    1b1a:	d90e2000 	ld.w      	r8, (r14, 0x0)
    1b1e:	1401      	addi      	r14, r14, 4
    1b20:	783c      	jmp      	r15
	...

00001b24 <csi_syscon_hfosc_set_switch>:
  \brief       Set hfosc (96MHz) enable/disable
  \param[in]   status: enable/disable status
  \return      None
*/
void csi_syscon_hfosc_set_switch(syscon_endis_e status)
{
    1b24:	1421      	subi      	r14, r14, 4
    1b26:	dd0e2000 	st.w      	r8, (r14, 0x0)
    1b2a:	6e3b      	mov      	r8, r14
    1b2c:	1421      	subi      	r14, r14, 4
    1b2e:	3300      	movi      	r3, 0
    1b30:	2b03      	subi      	r3, 4
    1b32:	60e0      	addu      	r3, r8
    1b34:	b300      	st.w      	r0, (r3, 0x0)
	if (status == ENABLE) {
    1b36:	3300      	movi      	r3, 0
    1b38:	2b03      	subi      	r3, 4
    1b3a:	60e0      	addu      	r3, r8
    1b3c:	9360      	ld.w      	r3, (r3, 0x0)
    1b3e:	3b40      	cmpnei      	r3, 0
    1b40:	0812      	bt      	0x1b64	// 1b64 <csi_syscon_hfosc_set_switch+0x40>
		H_SYSCON->CLCR |= (1ul<<20);
    1b42:	107f      	lrw      	r3, 0x20000018	// 1bbc <csi_syscon_clo_config+0x3c>
    1b44:	9360      	ld.w      	r3, (r3, 0x0)
    1b46:	105e      	lrw      	r2, 0x20000018	// 1bbc <csi_syscon_clo_config+0x3c>
    1b48:	9240      	ld.w      	r2, (r2, 0x0)
    1b4a:	9254      	ld.w      	r2, (r2, 0x50)
    1b4c:	3ab4      	bseti      	r2, 20
    1b4e:	b354      	st.w      	r2, (r3, 0x50)
		while (!((H_SYSCON->CLCR) & (1ul<<21)));
    1b50:	6c00      	or      	r0, r0
    1b52:	107b      	lrw      	r3, 0x20000018	// 1bbc <csi_syscon_clo_config+0x3c>
    1b54:	9360      	ld.w      	r3, (r3, 0x0)
    1b56:	9354      	ld.w      	r2, (r3, 0x50)
    1b58:	3380      	movi      	r3, 128
    1b5a:	436e      	lsli      	r3, r3, 14
    1b5c:	68c8      	and      	r3, r2
    1b5e:	3b40      	cmpnei      	r3, 0
    1b60:	0ff9      	bf      	0x1b52	// 1b52 <csi_syscon_hfosc_set_switch+0x2e>
	}
	else {
		H_SYSCON->CLCR &= ~(1ul<<20);

	}
}
    1b62:	0408      	br      	0x1b72	// 1b72 <csi_syscon_hfosc_set_switch+0x4e>
		H_SYSCON->CLCR &= ~(1ul<<20);
    1b64:	1076      	lrw      	r3, 0x20000018	// 1bbc <csi_syscon_clo_config+0x3c>
    1b66:	9360      	ld.w      	r3, (r3, 0x0)
    1b68:	1055      	lrw      	r2, 0x20000018	// 1bbc <csi_syscon_clo_config+0x3c>
    1b6a:	9240      	ld.w      	r2, (r2, 0x0)
    1b6c:	9254      	ld.w      	r2, (r2, 0x50)
    1b6e:	3a94      	bclri      	r2, 20
    1b70:	b354      	st.w      	r2, (r3, 0x50)
}
    1b72:	6c00      	or      	r0, r0
    1b74:	6fa3      	mov      	r14, r8
    1b76:	d90e2000 	ld.w      	r8, (r14, 0x0)
    1b7a:	1401      	addi      	r14, r14, 4
    1b7c:	783c      	jmp      	r15
	...

00001b80 <csi_syscon_clo_config>:
  \brief       Set CLO output
  \param[in]   clo_sel: clo source selection
  \return      None
*/
void csi_syscon_clo_config(clo_src_e clo_sel)
{
    1b80:	1421      	subi      	r14, r14, 4
    1b82:	dd0e2000 	st.w      	r8, (r14, 0x0)
    1b86:	6e3b      	mov      	r8, r14
    1b88:	1421      	subi      	r14, r14, 4
    1b8a:	3300      	movi      	r3, 0
    1b8c:	2b03      	subi      	r3, 4
    1b8e:	60e0      	addu      	r3, r8
    1b90:	b300      	st.w      	r0, (r3, 0x0)
	H_SYSCON->CLCR = ((H_SYSCON->CLCR) & ~(0xf<<16))|(clo_sel<<16);
    1b92:	106b      	lrw      	r3, 0x20000018	// 1bbc <csi_syscon_clo_config+0x3c>
    1b94:	9340      	ld.w      	r2, (r3, 0x0)
    1b96:	106a      	lrw      	r3, 0x20000018	// 1bbc <csi_syscon_clo_config+0x3c>
    1b98:	9360      	ld.w      	r3, (r3, 0x0)
    1b9a:	9334      	ld.w      	r1, (r3, 0x50)
    1b9c:	33f0      	movi      	r3, 240
    1b9e:	436c      	lsli      	r3, r3, 12
    1ba0:	684d      	andn      	r1, r3
    1ba2:	3300      	movi      	r3, 0
    1ba4:	2b03      	subi      	r3, 4
    1ba6:	60e0      	addu      	r3, r8
    1ba8:	9360      	ld.w      	r3, (r3, 0x0)
    1baa:	4370      	lsli      	r3, r3, 16
    1bac:	6cc4      	or      	r3, r1
    1bae:	b274      	st.w      	r3, (r2, 0x50)
}
    1bb0:	6c00      	or      	r0, r0
    1bb2:	6fa3      	mov      	r14, r8
    1bb4:	d90e2000 	ld.w      	r8, (r14, 0x0)
    1bb8:	1401      	addi      	r14, r14, 4
    1bba:	783c      	jmp      	r15
    1bbc:	20000018 	.long	0x20000018
    1bc0:	00002654 	.long	0x00002654

00001bc4 <ck_coret_irqhandler>:
extern void OSTimeTick(void);

extern gpio_event_cb_t gpio_exi_cb;
extern syscon_event_cb_t syscon_event_cb;

ATTRIBUTE_WEAK void ck_coret_irqhandler(void) {
    1bc4:	1421      	subi      	r14, r14, 4
    1bc6:	dd0e2000 	st.w      	r8, (r14, 0x0)
    1bca:	6e3b      	mov      	r8, r14
    1bcc:	1421      	subi      	r14, r14, 4
    readl(0xE000E010);
    1bce:	1047      	lrw      	r2, 0xe000e010	// 1be8 <ck_coret_irqhandler+0x24>
    1bd0:	3300      	movi      	r3, 0
    1bd2:	2b03      	subi      	r3, 4
    1bd4:	60e0      	addu      	r3, r8
    1bd6:	9240      	ld.w      	r2, (r2, 0x0)
    1bd8:	b340      	st.w      	r2, (r3, 0x0)
}
    1bda:	6c00      	or      	r0, r0
    1bdc:	6fa3      	mov      	r14, r8
    1bde:	d90e2000 	ld.w      	r8, (r14, 0x0)
    1be2:	1401      	addi      	r14, r14, 4
    1be4:	783c      	jmp      	r15
    1be6:	0000      	bkpt
    1be8:	e000e010 	.long	0xe000e010

00001bec <isr_ifc_irqhandler>:

//ATTRIBUTE_WEAK void isr_syscon_irqhandler(void) {
//    H_SYSCON->ICR = 0xffffffff;
//}

ATTRIBUTE_WEAK void isr_ifc_irqhandler(void) {
    1bec:	1421      	subi      	r14, r14, 4
    1bee:	dd0e2000 	st.w      	r8, (r14, 0x0)
    1bf2:	6e3b      	mov      	r8, r14
//    H_IFC->ICR = 0xffffffff;
}
    1bf4:	6c00      	or      	r0, r0
    1bf6:	6fa3      	mov      	r14, r8
    1bf8:	d90e2000 	ld.w      	r8, (r14, 0x0)
    1bfc:	1401      	addi      	r14, r14, 4
    1bfe:	783c      	jmp      	r15

00001c00 <isr_adc_irqhandler>:

ATTRIBUTE_WEAK void isr_adc_irqhandler(void) {
    1c00:	1421      	subi      	r14, r14, 4
    1c02:	dd0e2000 	st.w      	r8, (r14, 0x0)
    1c06:	6e3b      	mov      	r8, r14
//    handle->CSR = 0xffffffff;
}
    1c08:	6c00      	or      	r0, r0
    1c0a:	6fa3      	mov      	r14, r8
    1c0c:	d90e2000 	ld.w      	r8, (r14, 0x0)
    1c10:	1401      	addi      	r14, r14, 4
    1c12:	783c      	jmp      	r15

00001c14 <isr_tc0_0_irqhandler>:

ATTRIBUTE_WEAK void isr_tc0_0_irqhandler(void) {
    1c14:	1421      	subi      	r14, r14, 4
    1c16:	dd0e2000 	st.w      	r8, (r14, 0x0)
    1c1a:	6e3b      	mov      	r8, r14
//    H_TC0->CH[0].CSR = 0xffffffff;
}
    1c1c:	6c00      	or      	r0, r0
    1c1e:	6fa3      	mov      	r14, r8
    1c20:	d90e2000 	ld.w      	r8, (r14, 0x0)
    1c24:	1401      	addi      	r14, r14, 4
    1c26:	783c      	jmp      	r15

00001c28 <isr_tc0_1_irqhandler>:

ATTRIBUTE_WEAK void isr_tc0_1_irqhandler(void) {
    1c28:	1421      	subi      	r14, r14, 4
    1c2a:	dd0e2000 	st.w      	r8, (r14, 0x0)
    1c2e:	6e3b      	mov      	r8, r14
//    H_TC0->CH[1].CSR = 0xffffffff;
}
    1c30:	6c00      	or      	r0, r0
    1c32:	6fa3      	mov      	r14, r8
    1c34:	d90e2000 	ld.w      	r8, (r14, 0x0)
    1c38:	1401      	addi      	r14, r14, 4
    1c3a:	783c      	jmp      	r15

00001c3c <isr_tc0_2_irqhandler>:

ATTRIBUTE_WEAK void isr_tc0_2_irqhandler(void) {
    1c3c:	1421      	subi      	r14, r14, 4
    1c3e:	dd0e2000 	st.w      	r8, (r14, 0x0)
    1c42:	6e3b      	mov      	r8, r14
//    H_TC0->CH[2].CSR = 0xffffffff;
}
    1c44:	6c00      	or      	r0, r0
    1c46:	6fa3      	mov      	r14, r8
    1c48:	d90e2000 	ld.w      	r8, (r14, 0x0)
    1c4c:	1401      	addi      	r14, r14, 4
    1c4e:	783c      	jmp      	r15

00001c50 <isr_tc1_irqhandler>:

ATTRIBUTE_WEAK void isr_tc1_irqhandler(void) {
    1c50:	1421      	subi      	r14, r14, 4
    1c52:	dd0e2000 	st.w      	r8, (r14, 0x0)
    1c56:	6e3b      	mov      	r8, r14
//    H_TC1->ICR = 0xffffffff;
}
    1c58:	6c00      	or      	r0, r0
    1c5a:	6fa3      	mov      	r14, r8
    1c5c:	d90e2000 	ld.w      	r8, (r14, 0x0)
    1c60:	1401      	addi      	r14, r14, 4
    1c62:	783c      	jmp      	r15

00001c64 <isr_tc2_irqhandler>:

ATTRIBUTE_WEAK void isr_tc2_irqhandler(void) {
    1c64:	1421      	subi      	r14, r14, 4
    1c66:	dd0e2000 	st.w      	r8, (r14, 0x0)
    1c6a:	6e3b      	mov      	r8, r14
//    H_TC2->ICR = 0xffffffff;
}
    1c6c:	6c00      	or      	r0, r0
    1c6e:	6fa3      	mov      	r14, r8
    1c70:	d90e2000 	ld.w      	r8, (r14, 0x0)
    1c74:	1401      	addi      	r14, r14, 4
    1c76:	783c      	jmp      	r15

00001c78 <isr_tc3_irqhandler>:

ATTRIBUTE_WEAK void isr_tc3_irqhandler(void) {
    1c78:	1421      	subi      	r14, r14, 4
    1c7a:	dd0e2000 	st.w      	r8, (r14, 0x0)
    1c7e:	6e3b      	mov      	r8, r14
//    H_TC3->ICR = 0xffffffff;
}
    1c80:	6c00      	or      	r0, r0
    1c82:	6fa3      	mov      	r14, r8
    1c84:	d90e2000 	ld.w      	r8, (r14, 0x0)
    1c88:	1401      	addi      	r14, r14, 4
    1c8a:	783c      	jmp      	r15

00001c8c <isr_led_irqhandler>:

ATTRIBUTE_WEAK void isr_led_irqhandler(void) {
    1c8c:	1421      	subi      	r14, r14, 4
    1c8e:	dd0e2000 	st.w      	r8, (r14, 0x0)
    1c92:	6e3b      	mov      	r8, r14
//    H_LED->ICR = 0xffffffff;
}
    1c94:	6c00      	or      	r0, r0
    1c96:	6fa3      	mov      	r14, r8
    1c98:	d90e2000 	ld.w      	r8, (r14, 0x0)
    1c9c:	1401      	addi      	r14, r14, 4
    1c9e:	783c      	jmp      	r15

00001ca0 <isr_epwm_irqhandler>:

ATTRIBUTE_WEAK void isr_epwm_irqhandler(void) {
    1ca0:	1421      	subi      	r14, r14, 4
    1ca2:	dd0e2000 	st.w      	r8, (r14, 0x0)
    1ca6:	6e3b      	mov      	r8, r14
//    H_EPWM->ICR = 0xffffffff;
}
    1ca8:	6c00      	or      	r0, r0
    1caa:	6fa3      	mov      	r14, r8
    1cac:	d90e2000 	ld.w      	r8, (r14, 0x0)
    1cb0:	1401      	addi      	r14, r14, 4
    1cb2:	783c      	jmp      	r15

00001cb4 <isr_usart_irqhandler>:
//{
//    H_SYSCON->EXICR = 0xffffffff;
//}

ATTRIBUTE_WEAK void isr_usart_irqhandler(void)
{
    1cb4:	1421      	subi      	r14, r14, 4
    1cb6:	dd0e2000 	st.w      	r8, (r14, 0x0)
    1cba:	6e3b      	mov      	r8, r14
//    handle->ICR = 0xffffffff;
}
    1cbc:	6c00      	or      	r0, r0
    1cbe:	6fa3      	mov      	r14, r8
    1cc0:	d90e2000 	ld.w      	r8, (r14, 0x0)
    1cc4:	1401      	addi      	r14, r14, 4
    1cc6:	783c      	jmp      	r15

00001cc8 <isr_uart_irqhandler>:

ATTRIBUTE_WEAK void isr_uart_irqhandler(void)
{
    1cc8:	1421      	subi      	r14, r14, 4
    1cca:	dd0e2000 	st.w      	r8, (r14, 0x0)
    1cce:	6e3b      	mov      	r8, r14
//    handle->ISR = 0xffffffff;
}
    1cd0:	6c00      	or      	r0, r0
    1cd2:	6fa3      	mov      	r14, r8
    1cd4:	d90e2000 	ld.w      	r8, (r14, 0x0)
    1cd8:	1401      	addi      	r14, r14, 4
    1cda:	783c      	jmp      	r15

00001cdc <isr_i2c_irqhandler>:

ATTRIBUTE_WEAK void isr_i2c_irqhandler(void)
{
    1cdc:	1421      	subi      	r14, r14, 4
    1cde:	dd0e2000 	st.w      	r8, (r14, 0x0)
    1ce2:	6e3b      	mov      	r8, r14
//    handle->CR &= ~(0x1ul<<4);
}
    1ce4:	6c00      	or      	r0, r0
    1ce6:	6fa3      	mov      	r14, r8
    1ce8:	d90e2000 	ld.w      	r8, (r14, 0x0)
    1cec:	1401      	addi      	r14, r14, 4
    1cee:	783c      	jmp      	r15

00001cf0 <isr_spi_irqhandler>:

ATTRIBUTE_WEAK void isr_spi_irqhandler(void)
{
    1cf0:	1421      	subi      	r14, r14, 4
    1cf2:	dd0e2000 	st.w      	r8, (r14, 0x0)
    1cf6:	6e3b      	mov      	r8, r14
//    handle->ICR = 0xffffffff;
}
    1cf8:	6c00      	or      	r0, r0
    1cfa:	6fa3      	mov      	r14, r8
    1cfc:	d90e2000 	ld.w      	r8, (r14, 0x0)
    1d00:	1401      	addi      	r14, r14, 4
    1d02:	783c      	jmp      	r15

00001d04 <isr_tkey_irqhandler>:

ATTRIBUTE_WEAK void isr_tkey_irqhandler(void)
{
    1d04:	1421      	subi      	r14, r14, 4
    1d06:	dd0e2000 	st.w      	r8, (r14, 0x0)
    1d0a:	6e3b      	mov      	r8, r14
//    H_TKEY->ICR = 0xffffffff;
}
    1d0c:	6c00      	or      	r0, r0
    1d0e:	6fa3      	mov      	r14, r8
    1d10:	d90e2000 	ld.w      	r8, (r14, 0x0)
    1d14:	1401      	addi      	r14, r14, 4
    1d16:	783c      	jmp      	r15

00001d18 <isr_comp0_irqhandler>:

ATTRIBUTE_WEAK void isr_comp0_irqhandler(void)
{
    1d18:	1421      	subi      	r14, r14, 4
    1d1a:	dd0e2000 	st.w      	r8, (r14, 0x0)
    1d1e:	6e3b      	mov      	r8, r14
//    H_CMP->ICR = 0xffffffff;
}
    1d20:	6c00      	or      	r0, r0
    1d22:	6fa3      	mov      	r14, r8
    1d24:	d90e2000 	ld.w      	r8, (r14, 0x0)
    1d28:	1401      	addi      	r14, r14, 4
    1d2a:	783c      	jmp      	r15

00001d2c <isr_comp1_irqhandler>:

ATTRIBUTE_WEAK void isr_comp1_irqhandler(void)
{
    1d2c:	1421      	subi      	r14, r14, 4
    1d2e:	dd0e2000 	st.w      	r8, (r14, 0x0)
    1d32:	6e3b      	mov      	r8, r14
//    H_CMP->ICR = 0xffffffff;
}
    1d34:	6c00      	or      	r0, r0
    1d36:	6fa3      	mov      	r14, r8
    1d38:	d90e2000 	ld.w      	r8, (r14, 0x0)
    1d3c:	1401      	addi      	r14, r14, 4
    1d3e:	783c      	jmp      	r15

00001d40 <CORET_IRQHandler>:




ATTRIBUTE_ISR void CORET_IRQHandler(void)
{
    1d40:	1460      	nie
    1d42:	1462      	ipush
    1d44:	1422      	subi      	r14, r14, 8
    1d46:	dd0e2000 	st.w      	r8, (r14, 0x0)
    1d4a:	ddee2001 	st.w      	r15, (r14, 0x4)
    1d4e:	6e3b      	mov      	r8, r14
    
    #ifndef CONFIG_KERNEL_FREERTOS
        CSI_INTRPT_EXIT();
    #endif
#else
    ck_coret_irqhandler();
    1d50:	e3ffff3a 	bsr      	0x1bc4	// 1bc4 <ck_coret_irqhandler>
#endif
}
    1d54:	6c00      	or      	r0, r0
    1d56:	6fa3      	mov      	r14, r8
    1d58:	d9ee2001 	ld.w      	r15, (r14, 0x4)
    1d5c:	d90e2000 	ld.w      	r8, (r14, 0x0)
    1d60:	1402      	addi      	r14, r14, 8
    1d62:	1463      	ipop
    1d64:	1461      	nir
	...

00001d68 <SYSCON_IRQHandler>:

ATTRIBUTE_ISR void SYSCON_IRQHandler(void)
{
    1d68:	1460      	nie
    1d6a:	1462      	ipush
    1d6c:	1422      	subi      	r14, r14, 8
    1d6e:	dd0e2000 	st.w      	r8, (r14, 0x0)
    1d72:	ddee2001 	st.w      	r15, (r14, 0x4)
    1d76:	6e3b      	mov      	r8, r14
    CSI_INTRPT_ENTER();

    if (H_SYSCON->ISR & (1ul<<ISOSTBL_EVENT)) {
    1d78:	ea83011d 	lrw      	r3, 0x20000018	// 21ec <EXI3_IRQHandler+0xb0>
    1d7c:	9360      	ld.w      	r3, (r3, 0x0)
    1d7e:	238b      	addi      	r3, 140
    1d80:	9340      	ld.w      	r2, (r3, 0x0)
    1d82:	3301      	movi      	r3, 1
    1d84:	68c8      	and      	r3, r2
    1d86:	3b40      	cmpnei      	r3, 0
    1d88:	0c0d      	bf      	0x1da2	// 1da2 <SYSCON_IRQHandler+0x3a>
        syscon_event_cb (ISOSTBL_EVENT);
    1d8a:	ea83011a 	lrw      	r3, 0x20000484	// 21f0 <EXI3_IRQHandler+0xb4>
    1d8e:	9360      	ld.w      	r3, (r3, 0x0)
    1d90:	3000      	movi      	r0, 0
    1d92:	7bcd      	jsr      	r3
        H_SYSCON->ICR = (1ul<<ISOSTBL_EVENT);
    1d94:	ea830116 	lrw      	r3, 0x20000018	// 21ec <EXI3_IRQHandler+0xb0>
    1d98:	9360      	ld.w      	r3, (r3, 0x0)
    1d9a:	2383      	addi      	r3, 132
    1d9c:	3201      	movi      	r2, 1
    1d9e:	b340      	st.w      	r2, (r3, 0x0)
        syscon_event_cb (CMDERR_EVENT);
        H_SYSCON->ICR = (1ul<<CMDERR_EVENT);
    }

    CSI_INTRPT_EXIT();
}
    1da0:	049c      	br      	0x1ed8	// 1ed8 <SYSCON_IRQHandler+0x170>
    } else if (H_SYSCON->ISR & (1ul<<IMOSTBL_EVENT)) {
    1da2:	ea830113 	lrw      	r3, 0x20000018	// 21ec <EXI3_IRQHandler+0xb0>
    1da6:	9360      	ld.w      	r3, (r3, 0x0)
    1da8:	238b      	addi      	r3, 140
    1daa:	9340      	ld.w      	r2, (r3, 0x0)
    1dac:	3302      	movi      	r3, 2
    1dae:	68c8      	and      	r3, r2
    1db0:	3b40      	cmpnei      	r3, 0
    1db2:	0c0d      	bf      	0x1dcc	// 1dcc <SYSCON_IRQHandler+0x64>
        syscon_event_cb (IMOSTBL_EVENT);
    1db4:	ea83010f 	lrw      	r3, 0x20000484	// 21f0 <EXI3_IRQHandler+0xb4>
    1db8:	9360      	ld.w      	r3, (r3, 0x0)
    1dba:	3001      	movi      	r0, 1
    1dbc:	7bcd      	jsr      	r3
        H_SYSCON->ICR = (1ul<<IMOSTBL_EVENT);
    1dbe:	ea83010c 	lrw      	r3, 0x20000018	// 21ec <EXI3_IRQHandler+0xb0>
    1dc2:	9360      	ld.w      	r3, (r3, 0x0)
    1dc4:	2383      	addi      	r3, 132
    1dc6:	3202      	movi      	r2, 2
    1dc8:	b340      	st.w      	r2, (r3, 0x0)
}
    1dca:	0487      	br      	0x1ed8	// 1ed8 <SYSCON_IRQHandler+0x170>
    } else if (H_SYSCON->ISR & (1ul<<EMOSTBL_EVENT)) {
    1dcc:	ea830108 	lrw      	r3, 0x20000018	// 21ec <EXI3_IRQHandler+0xb0>
    1dd0:	9360      	ld.w      	r3, (r3, 0x0)
    1dd2:	238b      	addi      	r3, 140
    1dd4:	9340      	ld.w      	r2, (r3, 0x0)
    1dd6:	3308      	movi      	r3, 8
    1dd8:	68c8      	and      	r3, r2
    1dda:	3b40      	cmpnei      	r3, 0
    1ddc:	0c0d      	bf      	0x1df6	// 1df6 <SYSCON_IRQHandler+0x8e>
        syscon_event_cb (EMOSTBL_EVENT);
    1dde:	ea830105 	lrw      	r3, 0x20000484	// 21f0 <EXI3_IRQHandler+0xb4>
    1de2:	9360      	ld.w      	r3, (r3, 0x0)
    1de4:	3003      	movi      	r0, 3
    1de6:	7bcd      	jsr      	r3
        H_SYSCON->ICR = (1ul<<EMOSTBL_EVENT);
    1de8:	ea830101 	lrw      	r3, 0x20000018	// 21ec <EXI3_IRQHandler+0xb0>
    1dec:	9360      	ld.w      	r3, (r3, 0x0)
    1dee:	2383      	addi      	r3, 132
    1df0:	3208      	movi      	r2, 8
    1df2:	b340      	st.w      	r2, (r3, 0x0)
}
    1df4:	0472      	br      	0x1ed8	// 1ed8 <SYSCON_IRQHandler+0x170>
    } else if (H_SYSCON->ISR & (1ul<<SYSCLK_EVENT)) {
    1df6:	0061      	lrw      	r3, 0x20000018	// 21ec <EXI3_IRQHandler+0xb0>
    1df8:	9360      	ld.w      	r3, (r3, 0x0)
    1dfa:	238b      	addi      	r3, 140
    1dfc:	9340      	ld.w      	r2, (r3, 0x0)
    1dfe:	3380      	movi      	r3, 128
    1e00:	68c8      	and      	r3, r2
    1e02:	3b40      	cmpnei      	r3, 0
    1e04:	0c0b      	bf      	0x1e1a	// 1e1a <SYSCON_IRQHandler+0xb2>
        syscon_event_cb (SYSCLK_EVENT);
    1e06:	0064      	lrw      	r3, 0x20000484	// 21f0 <EXI3_IRQHandler+0xb4>
    1e08:	9360      	ld.w      	r3, (r3, 0x0)
    1e0a:	3007      	movi      	r0, 7
    1e0c:	7bcd      	jsr      	r3
        H_SYSCON->ICR = (1ul<<SYSCLK_EVENT);
    1e0e:	0067      	lrw      	r3, 0x20000018	// 21ec <EXI3_IRQHandler+0xb0>
    1e10:	9360      	ld.w      	r3, (r3, 0x0)
    1e12:	2383      	addi      	r3, 132
    1e14:	3280      	movi      	r2, 128
    1e16:	b340      	st.w      	r2, (r3, 0x0)
}
    1e18:	0460      	br      	0x1ed8	// 1ed8 <SYSCON_IRQHandler+0x170>
    } else if (H_SYSCON->ISR & (1ul<<IWDTINT_EVENT)) {
    1e1a:	006a      	lrw      	r3, 0x20000018	// 21ec <EXI3_IRQHandler+0xb0>
    1e1c:	9360      	ld.w      	r3, (r3, 0x0)
    1e1e:	238b      	addi      	r3, 140
    1e20:	9340      	ld.w      	r2, (r3, 0x0)
    1e22:	3380      	movi      	r3, 128
    1e24:	4361      	lsli      	r3, r3, 1
    1e26:	68c8      	and      	r3, r2
    1e28:	3b40      	cmpnei      	r3, 0
    1e2a:	0c0d      	bf      	0x1e44	// 1e44 <SYSCON_IRQHandler+0xdc>
        syscon_event_cb (IWDTINT_EVENT);
    1e2c:	006e      	lrw      	r3, 0x20000484	// 21f0 <EXI3_IRQHandler+0xb4>
    1e2e:	9360      	ld.w      	r3, (r3, 0x0)
    1e30:	3008      	movi      	r0, 8
    1e32:	7bcd      	jsr      	r3
        H_SYSCON->ICR = (1ul<<IWDTINT_EVENT);
    1e34:	0071      	lrw      	r3, 0x20000018	// 21ec <EXI3_IRQHandler+0xb0>
    1e36:	9360      	ld.w      	r3, (r3, 0x0)
    1e38:	2383      	addi      	r3, 132
    1e3a:	6c8f      	mov      	r2, r3
    1e3c:	3380      	movi      	r3, 128
    1e3e:	4361      	lsli      	r3, r3, 1
    1e40:	b260      	st.w      	r3, (r2, 0x0)
}
    1e42:	044b      	br      	0x1ed8	// 1ed8 <SYSCON_IRQHandler+0x170>
    } else if (H_SYSCON->ISR & (1ul<<LVDINT_EVENT)) {
    1e44:	0075      	lrw      	r3, 0x20000018	// 21ec <EXI3_IRQHandler+0xb0>
    1e46:	9360      	ld.w      	r3, (r3, 0x0)
    1e48:	238b      	addi      	r3, 140
    1e4a:	9340      	ld.w      	r2, (r3, 0x0)
    1e4c:	3380      	movi      	r3, 128
    1e4e:	4364      	lsli      	r3, r3, 4
    1e50:	68c8      	and      	r3, r2
    1e52:	3b40      	cmpnei      	r3, 0
    1e54:	0c0d      	bf      	0x1e6e	// 1e6e <SYSCON_IRQHandler+0x106>
        syscon_event_cb (LVDINT_EVENT);
    1e56:	0078      	lrw      	r3, 0x20000484	// 21f0 <EXI3_IRQHandler+0xb4>
    1e58:	9360      	ld.w      	r3, (r3, 0x0)
    1e5a:	300b      	movi      	r0, 11
    1e5c:	7bcd      	jsr      	r3
        H_SYSCON->ICR = (1ul<<LVDINT_EVENT);
    1e5e:	007b      	lrw      	r3, 0x20000018	// 21ec <EXI3_IRQHandler+0xb0>
    1e60:	9360      	ld.w      	r3, (r3, 0x0)
    1e62:	2383      	addi      	r3, 132
    1e64:	6c8f      	mov      	r2, r3
    1e66:	3380      	movi      	r3, 128
    1e68:	4364      	lsli      	r3, r3, 4
    1e6a:	b260      	st.w      	r3, (r2, 0x0)
}
    1e6c:	0436      	br      	0x1ed8	// 1ed8 <SYSCON_IRQHandler+0x170>
    } else if (H_SYSCON->ISR & (1ul<<EMFAIL_EVENT)) {
    1e6e:	007f      	lrw      	r3, 0x20000018	// 21ec <EXI3_IRQHandler+0xb0>
    1e70:	9360      	ld.w      	r3, (r3, 0x0)
    1e72:	238b      	addi      	r3, 140
    1e74:	9340      	ld.w      	r2, (r3, 0x0)
    1e76:	3380      	movi      	r3, 128
    1e78:	436b      	lsli      	r3, r3, 11
    1e7a:	68c8      	and      	r3, r2
    1e7c:	3b40      	cmpnei      	r3, 0
    1e7e:	0c0d      	bf      	0x1e98	// 1e98 <SYSCON_IRQHandler+0x130>
        syscon_event_cb (EMFAIL_EVENT);
    1e80:	0163      	lrw      	r3, 0x20000484	// 21f0 <EXI3_IRQHandler+0xb4>
    1e82:	9360      	ld.w      	r3, (r3, 0x0)
    1e84:	3012      	movi      	r0, 18
    1e86:	7bcd      	jsr      	r3
        H_SYSCON->ICR = (1ul<<EMFAIL_EVENT);
    1e88:	0166      	lrw      	r3, 0x20000018	// 21ec <EXI3_IRQHandler+0xb0>
    1e8a:	9360      	ld.w      	r3, (r3, 0x0)
    1e8c:	2383      	addi      	r3, 132
    1e8e:	6c8f      	mov      	r2, r3
    1e90:	3380      	movi      	r3, 128
    1e92:	436b      	lsli      	r3, r3, 11
    1e94:	b260      	st.w      	r3, (r2, 0x0)
}
    1e96:	0421      	br      	0x1ed8	// 1ed8 <SYSCON_IRQHandler+0x170>
    } else if (H_SYSCON->ISR & (1ul<<EMRCV_EVENT)) {
    1e98:	016a      	lrw      	r3, 0x20000018	// 21ec <EXI3_IRQHandler+0xb0>
    1e9a:	9360      	ld.w      	r3, (r3, 0x0)
    1e9c:	238b      	addi      	r3, 140
    1e9e:	9340      	ld.w      	r2, (r3, 0x0)
    1ea0:	3380      	movi      	r3, 128
    1ea2:	436c      	lsli      	r3, r3, 12
    1ea4:	68c8      	and      	r3, r2
    1ea6:	3b40      	cmpnei      	r3, 0
    1ea8:	0c0d      	bf      	0x1ec2	// 1ec2 <SYSCON_IRQHandler+0x15a>
        syscon_event_cb (EMRCV_EVENT);
    1eaa:	016d      	lrw      	r3, 0x20000484	// 21f0 <EXI3_IRQHandler+0xb4>
    1eac:	9360      	ld.w      	r3, (r3, 0x0)
    1eae:	3013      	movi      	r0, 19
    1eb0:	7bcd      	jsr      	r3
        H_SYSCON->ICR = (1ul<<EMRCV_EVENT);
    1eb2:	0170      	lrw      	r3, 0x20000018	// 21ec <EXI3_IRQHandler+0xb0>
    1eb4:	9360      	ld.w      	r3, (r3, 0x0)
    1eb6:	2383      	addi      	r3, 132
    1eb8:	6c8f      	mov      	r2, r3
    1eba:	3380      	movi      	r3, 128
    1ebc:	436c      	lsli      	r3, r3, 12
    1ebe:	b260      	st.w      	r3, (r2, 0x0)
}
    1ec0:	040c      	br      	0x1ed8	// 1ed8 <SYSCON_IRQHandler+0x170>
        syscon_event_cb (CMDERR_EVENT);
    1ec2:	0173      	lrw      	r3, 0x20000484	// 21f0 <EXI3_IRQHandler+0xb4>
    1ec4:	9360      	ld.w      	r3, (r3, 0x0)
    1ec6:	301d      	movi      	r0, 29
    1ec8:	7bcd      	jsr      	r3
        H_SYSCON->ICR = (1ul<<CMDERR_EVENT);
    1eca:	0176      	lrw      	r3, 0x20000018	// 21ec <EXI3_IRQHandler+0xb0>
    1ecc:	9360      	ld.w      	r3, (r3, 0x0)
    1ece:	2383      	addi      	r3, 132
    1ed0:	6c8f      	mov      	r2, r3
    1ed2:	3380      	movi      	r3, 128
    1ed4:	4376      	lsli      	r3, r3, 22
    1ed6:	b260      	st.w      	r3, (r2, 0x0)
}
    1ed8:	6c00      	or      	r0, r0
    1eda:	6fa3      	mov      	r14, r8
    1edc:	d9ee2001 	ld.w      	r15, (r14, 0x4)
    1ee0:	d90e2000 	ld.w      	r8, (r14, 0x0)
    1ee4:	1402      	addi      	r14, r14, 8
    1ee6:	1463      	ipop
    1ee8:	1461      	nir
	...

00001eec <IFC_IRQHandler>:

ATTRIBUTE_ISR void IFC_IRQHandler(void)
{
    1eec:	1460      	nie
    1eee:	1462      	ipush
    1ef0:	1422      	subi      	r14, r14, 8
    1ef2:	dd0e2000 	st.w      	r8, (r14, 0x0)
    1ef6:	ddee2001 	st.w      	r15, (r14, 0x4)
    1efa:	6e3b      	mov      	r8, r14
    CSI_INTRPT_ENTER();
    isr_ifc_irqhandler();
    1efc:	e3fffe78 	bsr      	0x1bec	// 1bec <isr_ifc_irqhandler>
    CSI_INTRPT_EXIT();
}
    1f00:	6c00      	or      	r0, r0
    1f02:	6fa3      	mov      	r14, r8
    1f04:	d9ee2001 	ld.w      	r15, (r14, 0x4)
    1f08:	d90e2000 	ld.w      	r8, (r14, 0x0)
    1f0c:	1402      	addi      	r14, r14, 8
    1f0e:	1463      	ipop
    1f10:	1461      	nir
	...

00001f14 <ADC_IRQHandler>:

ATTRIBUTE_ISR void ADC_IRQHandler(void)
{
    1f14:	1460      	nie
    1f16:	1462      	ipush
    1f18:	1422      	subi      	r14, r14, 8
    1f1a:	dd0e2000 	st.w      	r8, (r14, 0x0)
    1f1e:	ddee2001 	st.w      	r15, (r14, 0x4)
    1f22:	6e3b      	mov      	r8, r14
    CSI_INTRPT_ENTER();
    isr_adc_irqhandler();
    1f24:	e3fffe6e 	bsr      	0x1c00	// 1c00 <isr_adc_irqhandler>
    CSI_INTRPT_EXIT();
}
    1f28:	6c00      	or      	r0, r0
    1f2a:	6fa3      	mov      	r14, r8
    1f2c:	d9ee2001 	ld.w      	r15, (r14, 0x4)
    1f30:	d90e2000 	ld.w      	r8, (r14, 0x0)
    1f34:	1402      	addi      	r14, r14, 8
    1f36:	1463      	ipop
    1f38:	1461      	nir
	...

00001f3c <TC0_0_IRQHandler>:

ATTRIBUTE_ISR void TC0_0_IRQHandler(void)
{
    1f3c:	1460      	nie
    1f3e:	1462      	ipush
    1f40:	1422      	subi      	r14, r14, 8
    1f42:	dd0e2000 	st.w      	r8, (r14, 0x0)
    1f46:	ddee2001 	st.w      	r15, (r14, 0x4)
    1f4a:	6e3b      	mov      	r8, r14
    CSI_INTRPT_ENTER();
    isr_tc0_0_irqhandler();
    1f4c:	e3fffe64 	bsr      	0x1c14	// 1c14 <isr_tc0_0_irqhandler>
    CSI_INTRPT_EXIT();
}
    1f50:	6c00      	or      	r0, r0
    1f52:	6fa3      	mov      	r14, r8
    1f54:	d9ee2001 	ld.w      	r15, (r14, 0x4)
    1f58:	d90e2000 	ld.w      	r8, (r14, 0x0)
    1f5c:	1402      	addi      	r14, r14, 8
    1f5e:	1463      	ipop
    1f60:	1461      	nir
	...

00001f64 <TC0_1_IRQHandler>:

ATTRIBUTE_ISR void TC0_1_IRQHandler(void)
{
    1f64:	1460      	nie
    1f66:	1462      	ipush
    1f68:	1422      	subi      	r14, r14, 8
    1f6a:	dd0e2000 	st.w      	r8, (r14, 0x0)
    1f6e:	ddee2001 	st.w      	r15, (r14, 0x4)
    1f72:	6e3b      	mov      	r8, r14
    CSI_INTRPT_ENTER();
    isr_tc0_1_irqhandler();
    1f74:	e3fffe5a 	bsr      	0x1c28	// 1c28 <isr_tc0_1_irqhandler>
    CSI_INTRPT_EXIT();
}
    1f78:	6c00      	or      	r0, r0
    1f7a:	6fa3      	mov      	r14, r8
    1f7c:	d9ee2001 	ld.w      	r15, (r14, 0x4)
    1f80:	d90e2000 	ld.w      	r8, (r14, 0x0)
    1f84:	1402      	addi      	r14, r14, 8
    1f86:	1463      	ipop
    1f88:	1461      	nir
	...

00001f8c <TC0_2_IRQHandler>:

ATTRIBUTE_ISR void TC0_2_IRQHandler(void)
{
    1f8c:	1460      	nie
    1f8e:	1462      	ipush
    1f90:	1422      	subi      	r14, r14, 8
    1f92:	dd0e2000 	st.w      	r8, (r14, 0x0)
    1f96:	ddee2001 	st.w      	r15, (r14, 0x4)
    1f9a:	6e3b      	mov      	r8, r14
    CSI_INTRPT_ENTER();
    isr_tc0_2_irqhandler();
    1f9c:	e3fffe50 	bsr      	0x1c3c	// 1c3c <isr_tc0_2_irqhandler>
    CSI_INTRPT_EXIT();
}
    1fa0:	6c00      	or      	r0, r0
    1fa2:	6fa3      	mov      	r14, r8
    1fa4:	d9ee2001 	ld.w      	r15, (r14, 0x4)
    1fa8:	d90e2000 	ld.w      	r8, (r14, 0x0)
    1fac:	1402      	addi      	r14, r14, 8
    1fae:	1463      	ipop
    1fb0:	1461      	nir
	...

00001fb4 <TC1_IRQHandler>:

ATTRIBUTE_ISR void TC1_IRQHandler(void)
{
    1fb4:	1460      	nie
    1fb6:	1462      	ipush
    1fb8:	1422      	subi      	r14, r14, 8
    1fba:	dd0e2000 	st.w      	r8, (r14, 0x0)
    1fbe:	ddee2001 	st.w      	r15, (r14, 0x4)
    1fc2:	6e3b      	mov      	r8, r14
    CSI_INTRPT_ENTER();
    isr_tc1_irqhandler();
    1fc4:	e3fffe46 	bsr      	0x1c50	// 1c50 <isr_tc1_irqhandler>
    CSI_INTRPT_EXIT();
}
    1fc8:	6c00      	or      	r0, r0
    1fca:	6fa3      	mov      	r14, r8
    1fcc:	d9ee2001 	ld.w      	r15, (r14, 0x4)
    1fd0:	d90e2000 	ld.w      	r8, (r14, 0x0)
    1fd4:	1402      	addi      	r14, r14, 8
    1fd6:	1463      	ipop
    1fd8:	1461      	nir
	...

00001fdc <TC2_IRQHandler>:

ATTRIBUTE_ISR void TC2_IRQHandler(void)
{
    1fdc:	1460      	nie
    1fde:	1462      	ipush
    1fe0:	1422      	subi      	r14, r14, 8
    1fe2:	dd0e2000 	st.w      	r8, (r14, 0x0)
    1fe6:	ddee2001 	st.w      	r15, (r14, 0x4)
    1fea:	6e3b      	mov      	r8, r14
    CSI_INTRPT_ENTER();
    isr_tc2_irqhandler();
    1fec:	e3fffe3c 	bsr      	0x1c64	// 1c64 <isr_tc2_irqhandler>
    CSI_INTRPT_EXIT();
}
    1ff0:	6c00      	or      	r0, r0
    1ff2:	6fa3      	mov      	r14, r8
    1ff4:	d9ee2001 	ld.w      	r15, (r14, 0x4)
    1ff8:	d90e2000 	ld.w      	r8, (r14, 0x0)
    1ffc:	1402      	addi      	r14, r14, 8
    1ffe:	1463      	ipop
    2000:	1461      	nir
	...

00002004 <TC3_IRQHandler>:

ATTRIBUTE_ISR void TC3_IRQHandler(void)
{
    2004:	1460      	nie
    2006:	1462      	ipush
    2008:	1422      	subi      	r14, r14, 8
    200a:	dd0e2000 	st.w      	r8, (r14, 0x0)
    200e:	ddee2001 	st.w      	r15, (r14, 0x4)
    2012:	6e3b      	mov      	r8, r14
    CSI_INTRPT_ENTER();
    isr_tc3_irqhandler();
    2014:	e3fffe32 	bsr      	0x1c78	// 1c78 <isr_tc3_irqhandler>
    CSI_INTRPT_EXIT();
}
    2018:	6c00      	or      	r0, r0
    201a:	6fa3      	mov      	r14, r8
    201c:	d9ee2001 	ld.w      	r15, (r14, 0x4)
    2020:	d90e2000 	ld.w      	r8, (r14, 0x0)
    2024:	1402      	addi      	r14, r14, 8
    2026:	1463      	ipop
    2028:	1461      	nir
	...

0000202c <LED_IRQHandler>:

ATTRIBUTE_ISR void LED_IRQHandler(void)
{
    202c:	1460      	nie
    202e:	1462      	ipush
    2030:	1422      	subi      	r14, r14, 8
    2032:	dd0e2000 	st.w      	r8, (r14, 0x0)
    2036:	ddee2001 	st.w      	r15, (r14, 0x4)
    203a:	6e3b      	mov      	r8, r14
    CSI_INTRPT_ENTER();
    isr_led_irqhandler();
    203c:	e3fffe28 	bsr      	0x1c8c	// 1c8c <isr_led_irqhandler>
    CSI_INTRPT_EXIT();
}
    2040:	6c00      	or      	r0, r0
    2042:	6fa3      	mov      	r14, r8
    2044:	d9ee2001 	ld.w      	r15, (r14, 0x4)
    2048:	d90e2000 	ld.w      	r8, (r14, 0x0)
    204c:	1402      	addi      	r14, r14, 8
    204e:	1463      	ipop
    2050:	1461      	nir
	...

00002054 <EPWM_IRQHandler>:

ATTRIBUTE_ISR void EPWM_IRQHandler(void)
{
    2054:	1460      	nie
    2056:	1462      	ipush
    2058:	1422      	subi      	r14, r14, 8
    205a:	dd0e2000 	st.w      	r8, (r14, 0x0)
    205e:	ddee2001 	st.w      	r15, (r14, 0x4)
    2062:	6e3b      	mov      	r8, r14
    CSI_INTRPT_ENTER();
    isr_epwm_irqhandler();
    2064:	e3fffe1e 	bsr      	0x1ca0	// 1ca0 <isr_epwm_irqhandler>
    CSI_INTRPT_EXIT();
}
    2068:	6c00      	or      	r0, r0
    206a:	6fa3      	mov      	r14, r8
    206c:	d9ee2001 	ld.w      	r15, (r14, 0x4)
    2070:	d90e2000 	ld.w      	r8, (r14, 0x0)
    2074:	1402      	addi      	r14, r14, 8
    2076:	1463      	ipop
    2078:	1461      	nir
	...

0000207c <EXI0_IRQHandler>:

ATTRIBUTE_ISR void EXI0_IRQHandler(void)
{
    207c:	1460      	nie
    207e:	1462      	ipush
    2080:	1422      	subi      	r14, r14, 8
    2082:	dd0e2000 	st.w      	r8, (r14, 0x0)
    2086:	ddee2001 	st.w      	r15, (r14, 0x4)
    208a:	6e3b      	mov      	r8, r14
    CSI_INTRPT_ENTER();
    gpio_exi_cb(EXI_EVENT_0);
    208c:	127a      	lrw      	r3, 0x2000002c	// 21f4 <EXI3_IRQHandler+0xb8>
    208e:	9360      	ld.w      	r3, (r3, 0x0)
    2090:	3000      	movi      	r0, 0
    2092:	7bcd      	jsr      	r3
    H_SYSCON->EXICR = 1ul<<EXI_EVENT_0;
    2094:	1276      	lrw      	r3, 0x20000018	// 21ec <EXI3_IRQHandler+0xb0>
    2096:	9360      	ld.w      	r3, (r3, 0x0)
    2098:	23ab      	addi      	r3, 172
    209a:	3201      	movi      	r2, 1
    209c:	b340      	st.w      	r2, (r3, 0x0)
    CSI_INTRPT_EXIT();
}
    209e:	6c00      	or      	r0, r0
    20a0:	6fa3      	mov      	r14, r8
    20a2:	d9ee2001 	ld.w      	r15, (r14, 0x4)
    20a6:	d90e2000 	ld.w      	r8, (r14, 0x0)
    20aa:	1402      	addi      	r14, r14, 8
    20ac:	1463      	ipop
    20ae:	1461      	nir

000020b0 <EXI1_IRQHandler>:

ATTRIBUTE_ISR void EXI1_IRQHandler(void)
{
    20b0:	1460      	nie
    20b2:	1462      	ipush
    20b4:	1422      	subi      	r14, r14, 8
    20b6:	dd0e2000 	st.w      	r8, (r14, 0x0)
    20ba:	ddee2001 	st.w      	r15, (r14, 0x4)
    20be:	6e3b      	mov      	r8, r14
    CSI_INTRPT_ENTER();
    gpio_exi_cb(EXI_EVENT_1);
    20c0:	126d      	lrw      	r3, 0x2000002c	// 21f4 <EXI3_IRQHandler+0xb8>
    20c2:	9360      	ld.w      	r3, (r3, 0x0)
    20c4:	3001      	movi      	r0, 1
    20c6:	7bcd      	jsr      	r3
    H_SYSCON->EXICR = 1ul<<EXI_EVENT_1;
    20c8:	1269      	lrw      	r3, 0x20000018	// 21ec <EXI3_IRQHandler+0xb0>
    20ca:	9360      	ld.w      	r3, (r3, 0x0)
    20cc:	23ab      	addi      	r3, 172
    20ce:	3202      	movi      	r2, 2
    20d0:	b340      	st.w      	r2, (r3, 0x0)
    CSI_INTRPT_EXIT();
}
    20d2:	6c00      	or      	r0, r0
    20d4:	6fa3      	mov      	r14, r8
    20d6:	d9ee2001 	ld.w      	r15, (r14, 0x4)
    20da:	d90e2000 	ld.w      	r8, (r14, 0x0)
    20de:	1402      	addi      	r14, r14, 8
    20e0:	1463      	ipop
    20e2:	1461      	nir

000020e4 <EXI2_IRQHandler>:

ATTRIBUTE_ISR void EXI2_IRQHandler(void)
{
    20e4:	1460      	nie
    20e6:	1462      	ipush
    20e8:	1422      	subi      	r14, r14, 8
    20ea:	dd0e2000 	st.w      	r8, (r14, 0x0)
    20ee:	ddee2001 	st.w      	r15, (r14, 0x4)
    20f2:	6e3b      	mov      	r8, r14
    CSI_INTRPT_ENTER();
    if (H_SYSCON->EXICR & (1ul<<EXI_EVENT_2)) {
    20f4:	117e      	lrw      	r3, 0x20000018	// 21ec <EXI3_IRQHandler+0xb0>
    20f6:	9360      	ld.w      	r3, (r3, 0x0)
    20f8:	23ab      	addi      	r3, 172
    20fa:	9340      	ld.w      	r2, (r3, 0x0)
    20fc:	3304      	movi      	r3, 4
    20fe:	68c8      	and      	r3, r2
    2100:	3b40      	cmpnei      	r3, 0
    2102:	0c0b      	bf      	0x2118	// 2118 <EXI2_IRQHandler+0x34>
        gpio_exi_cb(EXI_EVENT_2);
    2104:	117c      	lrw      	r3, 0x2000002c	// 21f4 <EXI3_IRQHandler+0xb8>
    2106:	9360      	ld.w      	r3, (r3, 0x0)
    2108:	3002      	movi      	r0, 2
    210a:	7bcd      	jsr      	r3
        H_SYSCON->EXICR = (1ul<<EXI_EVENT_2);
    210c:	1178      	lrw      	r3, 0x20000018	// 21ec <EXI3_IRQHandler+0xb0>
    210e:	9360      	ld.w      	r3, (r3, 0x0)
    2110:	23ab      	addi      	r3, 172
    2112:	3204      	movi      	r2, 4
    2114:	b340      	st.w      	r2, (r3, 0x0)
    } else {
        gpio_exi_cb(EXI_EVENT_3);
        H_SYSCON->EXICR = (1ul<<EXI_EVENT_3);
    }
    CSI_INTRPT_EXIT();
}
    2116:	040a      	br      	0x212a	// 212a <EXI2_IRQHandler+0x46>
        gpio_exi_cb(EXI_EVENT_3);
    2118:	1177      	lrw      	r3, 0x2000002c	// 21f4 <EXI3_IRQHandler+0xb8>
    211a:	9360      	ld.w      	r3, (r3, 0x0)
    211c:	3003      	movi      	r0, 3
    211e:	7bcd      	jsr      	r3
        H_SYSCON->EXICR = (1ul<<EXI_EVENT_3);
    2120:	1173      	lrw      	r3, 0x20000018	// 21ec <EXI3_IRQHandler+0xb0>
    2122:	9360      	ld.w      	r3, (r3, 0x0)
    2124:	23ab      	addi      	r3, 172
    2126:	3208      	movi      	r2, 8
    2128:	b340      	st.w      	r2, (r3, 0x0)
}
    212a:	6c00      	or      	r0, r0
    212c:	6fa3      	mov      	r14, r8
    212e:	d9ee2001 	ld.w      	r15, (r14, 0x4)
    2132:	d90e2000 	ld.w      	r8, (r14, 0x0)
    2136:	1402      	addi      	r14, r14, 8
    2138:	1463      	ipop
    213a:	1461      	nir

0000213c <EXI3_IRQHandler>:

ATTRIBUTE_ISR void EXI3_IRQHandler(void)
{
    213c:	1460      	nie
    213e:	1462      	ipush
    2140:	1422      	subi      	r14, r14, 8
    2142:	dd0e2000 	st.w      	r8, (r14, 0x0)
    2146:	ddee2001 	st.w      	r15, (r14, 0x4)
    214a:	6e3b      	mov      	r8, r14
    CSI_INTRPT_ENTER();
    if (H_SYSCON->EXICR & (1ul<<EXI_EVENT_4)) {
    214c:	1168      	lrw      	r3, 0x20000018	// 21ec <EXI3_IRQHandler+0xb0>
    214e:	9360      	ld.w      	r3, (r3, 0x0)
    2150:	23ab      	addi      	r3, 172
    2152:	9340      	ld.w      	r2, (r3, 0x0)
    2154:	3310      	movi      	r3, 16
    2156:	68c8      	and      	r3, r2
    2158:	3b40      	cmpnei      	r3, 0
    215a:	0c0b      	bf      	0x2170	// 2170 <EXI3_IRQHandler+0x34>
        gpio_exi_cb(EXI_EVENT_4);
    215c:	1166      	lrw      	r3, 0x2000002c	// 21f4 <EXI3_IRQHandler+0xb8>
    215e:	9360      	ld.w      	r3, (r3, 0x0)
    2160:	3004      	movi      	r0, 4
    2162:	7bcd      	jsr      	r3
        H_SYSCON->EXICR = (1ul<<EXI_EVENT_4);
    2164:	1162      	lrw      	r3, 0x20000018	// 21ec <EXI3_IRQHandler+0xb0>
    2166:	9360      	ld.w      	r3, (r3, 0x0)
    2168:	23ab      	addi      	r3, 172
    216a:	3210      	movi      	r2, 16
    216c:	b340      	st.w      	r2, (r3, 0x0)
    } else {
        gpio_exi_cb(EXI_EVENT_9);
        H_SYSCON->EXICR = 1ul<<EXI_EVENT_9;
    }
    CSI_INTRPT_EXIT();
}
    216e:	045f      	br      	0x222c	// 222c <EXI3_IRQHandler+0xf0>
    } else if (H_SYSCON->EXICR & (1ul<<EXI_EVENT_5)) {
    2170:	107f      	lrw      	r3, 0x20000018	// 21ec <EXI3_IRQHandler+0xb0>
    2172:	9360      	ld.w      	r3, (r3, 0x0)
    2174:	23ab      	addi      	r3, 172
    2176:	9340      	ld.w      	r2, (r3, 0x0)
    2178:	3320      	movi      	r3, 32
    217a:	68c8      	and      	r3, r2
    217c:	3b40      	cmpnei      	r3, 0
    217e:	0c0b      	bf      	0x2194	// 2194 <EXI3_IRQHandler+0x58>
        gpio_exi_cb(EXI_EVENT_5);
    2180:	107d      	lrw      	r3, 0x2000002c	// 21f4 <EXI3_IRQHandler+0xb8>
    2182:	9360      	ld.w      	r3, (r3, 0x0)
    2184:	3005      	movi      	r0, 5
    2186:	7bcd      	jsr      	r3
        H_SYSCON->EXICR = (1ul<<EXI_EVENT_5);
    2188:	1079      	lrw      	r3, 0x20000018	// 21ec <EXI3_IRQHandler+0xb0>
    218a:	9360      	ld.w      	r3, (r3, 0x0)
    218c:	23ab      	addi      	r3, 172
    218e:	3220      	movi      	r2, 32
    2190:	b340      	st.w      	r2, (r3, 0x0)
}
    2192:	044d      	br      	0x222c	// 222c <EXI3_IRQHandler+0xf0>
    } else if (H_SYSCON->EXICR & (1ul<<EXI_EVENT_6)) {
    2194:	1076      	lrw      	r3, 0x20000018	// 21ec <EXI3_IRQHandler+0xb0>
    2196:	9360      	ld.w      	r3, (r3, 0x0)
    2198:	23ab      	addi      	r3, 172
    219a:	9340      	ld.w      	r2, (r3, 0x0)
    219c:	3340      	movi      	r3, 64
    219e:	68c8      	and      	r3, r2
    21a0:	3b40      	cmpnei      	r3, 0
    21a2:	0c0b      	bf      	0x21b8	// 21b8 <EXI3_IRQHandler+0x7c>
        gpio_exi_cb(EXI_EVENT_6);
    21a4:	1074      	lrw      	r3, 0x2000002c	// 21f4 <EXI3_IRQHandler+0xb8>
    21a6:	9360      	ld.w      	r3, (r3, 0x0)
    21a8:	3006      	movi      	r0, 6
    21aa:	7bcd      	jsr      	r3
        H_SYSCON->EXICR = 1ul<<EXI_EVENT_6;
    21ac:	1070      	lrw      	r3, 0x20000018	// 21ec <EXI3_IRQHandler+0xb0>
    21ae:	9360      	ld.w      	r3, (r3, 0x0)
    21b0:	23ab      	addi      	r3, 172
    21b2:	3240      	movi      	r2, 64
    21b4:	b340      	st.w      	r2, (r3, 0x0)
}
    21b6:	043b      	br      	0x222c	// 222c <EXI3_IRQHandler+0xf0>
    } else if (H_SYSCON->EXICR & (1ul<<EXI_EVENT_7)) {
    21b8:	106d      	lrw      	r3, 0x20000018	// 21ec <EXI3_IRQHandler+0xb0>
    21ba:	9360      	ld.w      	r3, (r3, 0x0)
    21bc:	23ab      	addi      	r3, 172
    21be:	9340      	ld.w      	r2, (r3, 0x0)
    21c0:	3380      	movi      	r3, 128
    21c2:	68c8      	and      	r3, r2
    21c4:	3b40      	cmpnei      	r3, 0
    21c6:	0c0b      	bf      	0x21dc	// 21dc <EXI3_IRQHandler+0xa0>
        gpio_exi_cb(EXI_EVENT_7);
    21c8:	106b      	lrw      	r3, 0x2000002c	// 21f4 <EXI3_IRQHandler+0xb8>
    21ca:	9360      	ld.w      	r3, (r3, 0x0)
    21cc:	3007      	movi      	r0, 7
    21ce:	7bcd      	jsr      	r3
        H_SYSCON->EXICR = 1ul<<EXI_EVENT_7;
    21d0:	1067      	lrw      	r3, 0x20000018	// 21ec <EXI3_IRQHandler+0xb0>
    21d2:	9360      	ld.w      	r3, (r3, 0x0)
    21d4:	23ab      	addi      	r3, 172
    21d6:	3280      	movi      	r2, 128
    21d8:	b340      	st.w      	r2, (r3, 0x0)
}
    21da:	0429      	br      	0x222c	// 222c <EXI3_IRQHandler+0xf0>
    } else if (H_SYSCON->EXICR & (1ul<<EXI_EVENT_8)) {
    21dc:	1064      	lrw      	r3, 0x20000018	// 21ec <EXI3_IRQHandler+0xb0>
    21de:	9360      	ld.w      	r3, (r3, 0x0)
    21e0:	23ab      	addi      	r3, 172
    21e2:	9340      	ld.w      	r2, (r3, 0x0)
    21e4:	3380      	movi      	r3, 128
    21e6:	4361      	lsli      	r3, r3, 1
    21e8:	0408      	br      	0x21f8	// 21f8 <EXI3_IRQHandler+0xbc>
    21ea:	0000      	bkpt
    21ec:	20000018 	.long	0x20000018
    21f0:	20000484 	.long	0x20000484
    21f4:	2000002c 	.long	0x2000002c
    21f8:	68c8      	and      	r3, r2
    21fa:	3b40      	cmpnei      	r3, 0
    21fc:	0c0d      	bf      	0x2216	// 2216 <EXI3_IRQHandler+0xda>
        gpio_exi_cb(EXI_EVENT_8);
    21fe:	0377      	lrw      	r3, 0x2000002c	// 241c <CMP1_IRQHandler+0x28>
    2200:	9360      	ld.w      	r3, (r3, 0x0)
    2202:	3008      	movi      	r0, 8
    2204:	7bcd      	jsr      	r3
        H_SYSCON->EXICR = 1ul<<EXI_EVENT_8;
    2206:	0378      	lrw      	r3, 0x20000018	// 2420 <CMP1_IRQHandler+0x2c>
    2208:	9360      	ld.w      	r3, (r3, 0x0)
    220a:	23ab      	addi      	r3, 172
    220c:	6c8f      	mov      	r2, r3
    220e:	3380      	movi      	r3, 128
    2210:	4361      	lsli      	r3, r3, 1
    2212:	b260      	st.w      	r3, (r2, 0x0)
}
    2214:	040c      	br      	0x222c	// 222c <EXI3_IRQHandler+0xf0>
        gpio_exi_cb(EXI_EVENT_9);
    2216:	037d      	lrw      	r3, 0x2000002c	// 241c <CMP1_IRQHandler+0x28>
    2218:	9360      	ld.w      	r3, (r3, 0x0)
    221a:	3009      	movi      	r0, 9
    221c:	7bcd      	jsr      	r3
        H_SYSCON->EXICR = 1ul<<EXI_EVENT_9;
    221e:	037e      	lrw      	r3, 0x20000018	// 2420 <CMP1_IRQHandler+0x2c>
    2220:	9360      	ld.w      	r3, (r3, 0x0)
    2222:	23ab      	addi      	r3, 172
    2224:	6c8f      	mov      	r2, r3
    2226:	3380      	movi      	r3, 128
    2228:	4362      	lsli      	r3, r3, 2
    222a:	b260      	st.w      	r3, (r2, 0x0)
}
    222c:	6c00      	or      	r0, r0
    222e:	6fa3      	mov      	r14, r8
    2230:	d9ee2001 	ld.w      	r15, (r14, 0x4)
    2234:	d90e2000 	ld.w      	r8, (r14, 0x0)
    2238:	1402      	addi      	r14, r14, 8
    223a:	1463      	ipop
    223c:	1461      	nir
	...

00002240 <EXI4_IRQHandler>:

ATTRIBUTE_ISR void EXI4_IRQHandler(void)
{
    2240:	1460      	nie
    2242:	1462      	ipush
    2244:	1422      	subi      	r14, r14, 8
    2246:	dd0e2000 	st.w      	r8, (r14, 0x0)
    224a:	ddee2001 	st.w      	r15, (r14, 0x4)
    224e:	6e3b      	mov      	r8, r14
    CSI_INTRPT_ENTER();
    if (H_SYSCON->EXICR & (1ul<<EXI_EVENT_10)) {
    2250:	1374      	lrw      	r3, 0x20000018	// 2420 <CMP1_IRQHandler+0x2c>
    2252:	9360      	ld.w      	r3, (r3, 0x0)
    2254:	23ab      	addi      	r3, 172
    2256:	9340      	ld.w      	r2, (r3, 0x0)
    2258:	3380      	movi      	r3, 128
    225a:	4363      	lsli      	r3, r3, 3
    225c:	68c8      	and      	r3, r2
    225e:	3b40      	cmpnei      	r3, 0
    2260:	0c0d      	bf      	0x227a	// 227a <EXI4_IRQHandler+0x3a>
        gpio_exi_cb(EXI_EVENT_10);
    2262:	136f      	lrw      	r3, 0x2000002c	// 241c <CMP1_IRQHandler+0x28>
    2264:	9360      	ld.w      	r3, (r3, 0x0)
    2266:	300a      	movi      	r0, 10
    2268:	7bcd      	jsr      	r3
        H_SYSCON->EXICR = 1ul<<EXI_EVENT_10;
    226a:	136e      	lrw      	r3, 0x20000018	// 2420 <CMP1_IRQHandler+0x2c>
    226c:	9360      	ld.w      	r3, (r3, 0x0)
    226e:	23ab      	addi      	r3, 172
    2270:	6c8f      	mov      	r2, r3
    2272:	3380      	movi      	r3, 128
    2274:	4363      	lsli      	r3, r3, 3
    2276:	b260      	st.w      	r3, (r2, 0x0)
    } else {
        gpio_exi_cb(EXI_EVENT_15);
        H_SYSCON->EXICR = 1ul<<EXI_EVENT_15;
    }
    CSI_INTRPT_EXIT();
}
    2278:	0460      	br      	0x2338	// 2338 <EXI4_IRQHandler+0xf8>
    } else if (H_SYSCON->EXICR & (1ul<<EXI_EVENT_11)) {
    227a:	136a      	lrw      	r3, 0x20000018	// 2420 <CMP1_IRQHandler+0x2c>
    227c:	9360      	ld.w      	r3, (r3, 0x0)
    227e:	23ab      	addi      	r3, 172
    2280:	9340      	ld.w      	r2, (r3, 0x0)
    2282:	3380      	movi      	r3, 128
    2284:	4364      	lsli      	r3, r3, 4
    2286:	68c8      	and      	r3, r2
    2288:	3b40      	cmpnei      	r3, 0
    228a:	0c0d      	bf      	0x22a4	// 22a4 <EXI4_IRQHandler+0x64>
        gpio_exi_cb(EXI_EVENT_11);
    228c:	1364      	lrw      	r3, 0x2000002c	// 241c <CMP1_IRQHandler+0x28>
    228e:	9360      	ld.w      	r3, (r3, 0x0)
    2290:	300b      	movi      	r0, 11
    2292:	7bcd      	jsr      	r3
        H_SYSCON->EXICR = 1ul<<EXI_EVENT_11;
    2294:	1363      	lrw      	r3, 0x20000018	// 2420 <CMP1_IRQHandler+0x2c>
    2296:	9360      	ld.w      	r3, (r3, 0x0)
    2298:	23ab      	addi      	r3, 172
    229a:	6c8f      	mov      	r2, r3
    229c:	3380      	movi      	r3, 128
    229e:	4364      	lsli      	r3, r3, 4
    22a0:	b260      	st.w      	r3, (r2, 0x0)
}
    22a2:	044b      	br      	0x2338	// 2338 <EXI4_IRQHandler+0xf8>
    } else if (H_SYSCON->EXICR & (1ul<<EXI_EVENT_12)) {
    22a4:	127f      	lrw      	r3, 0x20000018	// 2420 <CMP1_IRQHandler+0x2c>
    22a6:	9360      	ld.w      	r3, (r3, 0x0)
    22a8:	23ab      	addi      	r3, 172
    22aa:	9340      	ld.w      	r2, (r3, 0x0)
    22ac:	3380      	movi      	r3, 128
    22ae:	4365      	lsli      	r3, r3, 5
    22b0:	68c8      	and      	r3, r2
    22b2:	3b40      	cmpnei      	r3, 0
    22b4:	0c0d      	bf      	0x22ce	// 22ce <EXI4_IRQHandler+0x8e>
        gpio_exi_cb(EXI_EVENT_12);
    22b6:	127a      	lrw      	r3, 0x2000002c	// 241c <CMP1_IRQHandler+0x28>
    22b8:	9360      	ld.w      	r3, (r3, 0x0)
    22ba:	300c      	movi      	r0, 12
    22bc:	7bcd      	jsr      	r3
        H_SYSCON->EXICR = 1ul<<EXI_EVENT_12;
    22be:	1279      	lrw      	r3, 0x20000018	// 2420 <CMP1_IRQHandler+0x2c>
    22c0:	9360      	ld.w      	r3, (r3, 0x0)
    22c2:	23ab      	addi      	r3, 172
    22c4:	6c8f      	mov      	r2, r3
    22c6:	3380      	movi      	r3, 128
    22c8:	4365      	lsli      	r3, r3, 5
    22ca:	b260      	st.w      	r3, (r2, 0x0)
}
    22cc:	0436      	br      	0x2338	// 2338 <EXI4_IRQHandler+0xf8>
    } else if (H_SYSCON->EXICR & (1ul<<EXI_EVENT_13)) {
    22ce:	1275      	lrw      	r3, 0x20000018	// 2420 <CMP1_IRQHandler+0x2c>
    22d0:	9360      	ld.w      	r3, (r3, 0x0)
    22d2:	23ab      	addi      	r3, 172
    22d4:	9340      	ld.w      	r2, (r3, 0x0)
    22d6:	3380      	movi      	r3, 128
    22d8:	4366      	lsli      	r3, r3, 6
    22da:	68c8      	and      	r3, r2
    22dc:	3b40      	cmpnei      	r3, 0
    22de:	0c0d      	bf      	0x22f8	// 22f8 <EXI4_IRQHandler+0xb8>
        gpio_exi_cb(EXI_EVENT_13);
    22e0:	126f      	lrw      	r3, 0x2000002c	// 241c <CMP1_IRQHandler+0x28>
    22e2:	9360      	ld.w      	r3, (r3, 0x0)
    22e4:	300d      	movi      	r0, 13
    22e6:	7bcd      	jsr      	r3
        H_SYSCON->EXICR = 1ul<<EXI_EVENT_13;
    22e8:	126e      	lrw      	r3, 0x20000018	// 2420 <CMP1_IRQHandler+0x2c>
    22ea:	9360      	ld.w      	r3, (r3, 0x0)
    22ec:	23ab      	addi      	r3, 172
    22ee:	6c8f      	mov      	r2, r3
    22f0:	3380      	movi      	r3, 128
    22f2:	4366      	lsli      	r3, r3, 6
    22f4:	b260      	st.w      	r3, (r2, 0x0)
}
    22f6:	0421      	br      	0x2338	// 2338 <EXI4_IRQHandler+0xf8>
    } else if (H_SYSCON->EXICR & (1ul<<EXI_EVENT_14)) {
    22f8:	126a      	lrw      	r3, 0x20000018	// 2420 <CMP1_IRQHandler+0x2c>
    22fa:	9360      	ld.w      	r3, (r3, 0x0)
    22fc:	23ab      	addi      	r3, 172
    22fe:	9340      	ld.w      	r2, (r3, 0x0)
    2300:	3380      	movi      	r3, 128
    2302:	4367      	lsli      	r3, r3, 7
    2304:	68c8      	and      	r3, r2
    2306:	3b40      	cmpnei      	r3, 0
    2308:	0c0d      	bf      	0x2322	// 2322 <EXI4_IRQHandler+0xe2>
        gpio_exi_cb(EXI_EVENT_14);
    230a:	1265      	lrw      	r3, 0x2000002c	// 241c <CMP1_IRQHandler+0x28>
    230c:	9360      	ld.w      	r3, (r3, 0x0)
    230e:	300e      	movi      	r0, 14
    2310:	7bcd      	jsr      	r3
        H_SYSCON->EXICR = 1ul<<EXI_EVENT_14;
    2312:	1264      	lrw      	r3, 0x20000018	// 2420 <CMP1_IRQHandler+0x2c>
    2314:	9360      	ld.w      	r3, (r3, 0x0)
    2316:	23ab      	addi      	r3, 172
    2318:	6c8f      	mov      	r2, r3
    231a:	3380      	movi      	r3, 128
    231c:	4367      	lsli      	r3, r3, 7
    231e:	b260      	st.w      	r3, (r2, 0x0)
}
    2320:	040c      	br      	0x2338	// 2338 <EXI4_IRQHandler+0xf8>
        gpio_exi_cb(EXI_EVENT_15);
    2322:	117f      	lrw      	r3, 0x2000002c	// 241c <CMP1_IRQHandler+0x28>
    2324:	9360      	ld.w      	r3, (r3, 0x0)
    2326:	300f      	movi      	r0, 15
    2328:	7bcd      	jsr      	r3
        H_SYSCON->EXICR = 1ul<<EXI_EVENT_15;
    232a:	117e      	lrw      	r3, 0x20000018	// 2420 <CMP1_IRQHandler+0x2c>
    232c:	9360      	ld.w      	r3, (r3, 0x0)
    232e:	23ab      	addi      	r3, 172
    2330:	6c8f      	mov      	r2, r3
    2332:	3380      	movi      	r3, 128
    2334:	4368      	lsli      	r3, r3, 8
    2336:	b260      	st.w      	r3, (r2, 0x0)
}
    2338:	6c00      	or      	r0, r0
    233a:	6fa3      	mov      	r14, r8
    233c:	d9ee2001 	ld.w      	r15, (r14, 0x4)
    2340:	d90e2000 	ld.w      	r8, (r14, 0x0)
    2344:	1402      	addi      	r14, r14, 8
    2346:	1463      	ipop
    2348:	1461      	nir
	...

0000234c <UART0_IRQHandler>:

ATTRIBUTE_ISR void UART0_IRQHandler(void)
{
    234c:	1460      	nie
    234e:	1462      	ipush
    2350:	1421      	subi      	r14, r14, 4
    2352:	dd0e2000 	st.w      	r8, (r14, 0x0)
    2356:	6e3b      	mov      	r8, r14
    CSI_INTRPT_ENTER();
//    isr_usart_irqhandler(H_UART0);
    CSI_INTRPT_EXIT();
}
    2358:	6c00      	or      	r0, r0
    235a:	6fa3      	mov      	r14, r8
    235c:	d90e2000 	ld.w      	r8, (r14, 0x0)
    2360:	1401      	addi      	r14, r14, 4
    2362:	1463      	ipop
    2364:	1461      	nir
	...

00002368 <UART1_IRQHandler>:

ATTRIBUTE_ISR void UART1_IRQHandler(void)
{
    2368:	1460      	nie
    236a:	1462      	ipush
    236c:	1421      	subi      	r14, r14, 4
    236e:	dd0e2000 	st.w      	r8, (r14, 0x0)
    2372:	6e3b      	mov      	r8, r14
    CSI_INTRPT_ENTER();
//    isr_uart_irqhandler(H_UART1);
    CSI_INTRPT_EXIT();
}
    2374:	6c00      	or      	r0, r0
    2376:	6fa3      	mov      	r14, r8
    2378:	d90e2000 	ld.w      	r8, (r14, 0x0)
    237c:	1401      	addi      	r14, r14, 4
    237e:	1463      	ipop
    2380:	1461      	nir
	...

00002384 <I2C0_IRQHandler>:

ATTRIBUTE_ISR void I2C0_IRQHandler(void)
{
    2384:	1460      	nie
    2386:	1462      	ipush
    2388:	1421      	subi      	r14, r14, 4
    238a:	dd0e2000 	st.w      	r8, (r14, 0x0)
    238e:	6e3b      	mov      	r8, r14
    CSI_INTRPT_ENTER();
//    isr_i2c_irqhandler(H_I2C);
    CSI_INTRPT_EXIT();
}
    2390:	6c00      	or      	r0, r0
    2392:	6fa3      	mov      	r14, r8
    2394:	d90e2000 	ld.w      	r8, (r14, 0x0)
    2398:	1401      	addi      	r14, r14, 4
    239a:	1463      	ipop
    239c:	1461      	nir
	...

000023a0 <SPI0_IRQHandler>:

ATTRIBUTE_ISR void SPI0_IRQHandler(void)
{
    23a0:	1460      	nie
    23a2:	1462      	ipush
    23a4:	1421      	subi      	r14, r14, 4
    23a6:	dd0e2000 	st.w      	r8, (r14, 0x0)
    23aa:	6e3b      	mov      	r8, r14
    CSI_INTRPT_ENTER();
//    isr_spi_irqhandler(H_SPI);
    CSI_INTRPT_EXIT();
}
    23ac:	6c00      	or      	r0, r0
    23ae:	6fa3      	mov      	r14, r8
    23b0:	d90e2000 	ld.w      	r8, (r14, 0x0)
    23b4:	1401      	addi      	r14, r14, 4
    23b6:	1463      	ipop
    23b8:	1461      	nir
	...

000023bc <TKEY_IRQHandler>:

ATTRIBUTE_ISR void TKEY_IRQHandler(void)
{
    23bc:	1460      	nie
    23be:	1462      	ipush
    23c0:	1421      	subi      	r14, r14, 4
    23c2:	dd0e2000 	st.w      	r8, (r14, 0x0)
    23c6:	6e3b      	mov      	r8, r14
    CSI_INTRPT_ENTER();
//    isr_tkey_irqhandler();
    CSI_INTRPT_EXIT();
}
    23c8:	6c00      	or      	r0, r0
    23ca:	6fa3      	mov      	r14, r8
    23cc:	d90e2000 	ld.w      	r8, (r14, 0x0)
    23d0:	1401      	addi      	r14, r14, 4
    23d2:	1463      	ipop
    23d4:	1461      	nir
	...

000023d8 <CMP0_IRQHandler>:

ATTRIBUTE_ISR void CMP0_IRQHandler(void)
{
    23d8:	1460      	nie
    23da:	1462      	ipush
    23dc:	1421      	subi      	r14, r14, 4
    23de:	dd0e2000 	st.w      	r8, (r14, 0x0)
    23e2:	6e3b      	mov      	r8, r14
    CSI_INTRPT_ENTER();
//    isr_comp0_irqhandler();
    CSI_INTRPT_EXIT();
}
    23e4:	6c00      	or      	r0, r0
    23e6:	6fa3      	mov      	r14, r8
    23e8:	d90e2000 	ld.w      	r8, (r14, 0x0)
    23ec:	1401      	addi      	r14, r14, 4
    23ee:	1463      	ipop
    23f0:	1461      	nir
	...

000023f4 <CMP1_IRQHandler>:

ATTRIBUTE_ISR void CMP1_IRQHandler(void)
{
    23f4:	1460      	nie
    23f6:	1462      	ipush
    23f8:	1422      	subi      	r14, r14, 8
    23fa:	dd0e2000 	st.w      	r8, (r14, 0x0)
    23fe:	ddee2001 	st.w      	r15, (r14, 0x4)
    2402:	6e3b      	mov      	r8, r14
    CSI_INTRPT_ENTER();
    isr_comp1_irqhandler();
    2404:	e3fffc94 	bsr      	0x1d2c	// 1d2c <isr_comp1_irqhandler>
    CSI_INTRPT_EXIT();
}
    2408:	6c00      	or      	r0, r0
    240a:	6fa3      	mov      	r14, r8
    240c:	d9ee2001 	ld.w      	r15, (r14, 0x4)
    2410:	d90e2000 	ld.w      	r8, (r14, 0x0)
    2414:	1402      	addi      	r14, r14, 8
    2416:	1463      	ipop
    2418:	1461      	nir
    241a:	0000      	bkpt
    241c:	2000002c 	.long	0x2000002c
    2420:	20000018 	.long	0x20000018
    2424:	00000000 	.long	0x00000000

00002428 <Reset_Handler>:
	.type	Reset_Handler, %function
Reset_Handler:
    /* under normal circumstances,  it should not be opened */

#ifndef CONFIG_SYSTEM_SECURE
    lrw   r0, 0x80000000
    2428:	1015      	lrw      	r0, 0x80000000	// 247c <__exit+0x2>
    mtcr  r0, psr
    242a:	c0006420 	mtcr      	r0, cr<0, 0>
#endif

/* Initialize the normal stack pointer from the linker definition. */
    lrw a1, __StackTop
    242e:	1035      	lrw      	r1, 0x20001800	// 2480 <__exit+0x6>
    mov sp, a1
    2430:	6f87      	mov      	r14, r1
 *    __data_start__: VMA of start of the section to copy to
 *    __data_end__: VMA of end of the section to copy to
 *
 *  All addresses must be aligned to 4 bytes boundary.
 */
	lrw	r1, __erodata
    2432:	1035      	lrw      	r1, 0x2668	// 2484 <__exit+0xa>
	lrw	r2, __data_start__
    2434:	1055      	lrw      	r2, 0x20000000	// 2488 <__exit+0xe>
	lrw	r3, __data_end__
    2436:	1076      	lrw      	r3, 0x2000002c	// 248c <__exit+0x12>

	subu	r3, r2
    2438:	60ca      	subu      	r3, r2
	cmpnei	r3, 0
    243a:	3b40      	cmpnei      	r3, 0
	bf	.L_loop0_done
    243c:	0c08      	bf      	0x244c	// 244c <Reset_Handler+0x24>

.L_loop0:
	ldw	r0, (r1, 0)
    243e:	9100      	ld.w      	r0, (r1, 0x0)
	stw	r0, (r2, 0)
    2440:	b200      	st.w      	r0, (r2, 0x0)
	addi	r1, 4
    2442:	2103      	addi      	r1, 4
	addi	r2, 4
    2444:	2203      	addi      	r2, 4
	subi	r3, 4
    2446:	2b03      	subi      	r3, 4
	cmpnei	r3, 0
    2448:	3b40      	cmpnei      	r3, 0
	bt	.L_loop0
    244a:	0bfa      	bt      	0x243e	// 243e <Reset_Handler+0x16>
 *    __bss_start__: start of the BSS section.
 *    __bss_end__: end of the BSS section.
 *
 *  Both addresses must be aligned to 4 bytes boundary.
 */
	lrw	r1, __bss_start__
    244c:	1031      	lrw      	r1, 0x2000002c	// 2490 <__exit+0x16>
	lrw	r2, __bss_end__
    244e:	1052      	lrw      	r2, 0x20000488	// 2494 <__exit+0x1a>

	movi	r0, 0
    2450:	3000      	movi      	r0, 0

	subu	r2, r1
    2452:	6086      	subu      	r2, r1
	cmpnei	r2, 0
    2454:	3a40      	cmpnei      	r2, 0
	bf	.L_loop1_done
    2456:	0c06      	bf      	0x2462	// 2462 <Reset_Handler+0x3a>

.L_loop1:
	stw	r0, (r1, 0)
    2458:	b100      	st.w      	r0, (r1, 0x0)
	addi	r1, 4
    245a:	2103      	addi      	r1, 4
	subi	r2, 4
    245c:	2a03      	subi      	r2, 4
	cmpnei	r2, 0
    245e:	3a40      	cmpnei      	r2, 0
	bt	.L_loop1
    2460:	0bfc      	bt      	0x2458	// 2458 <Reset_Handler+0x30>
.L_loop1_done:

#ifdef CONFIG_SEPARATE_IRQ_SP
        /* init hardware separate interrupt sp*/
        lrw    r0, g_top_irqstack
    2462:	100e      	lrw      	r0, 0x20000484	// 2498 <__exit+0x1e>
        mtcr   r0, cr<15, 1>
    2464:	c020642f 	mtcr      	r0, cr<15, 1>

        mfcr   r0, cr<31, 0>
    2468:	c01f6020 	mfcr      	r0, cr<31, 0>
        bseti  r0, 14
    246c:	38ae      	bseti      	r0, 14
        mtcr   r0, cr<31, 0>
    246e:	c000643f 	mtcr      	r0, cr<31, 0>
#endif

#ifndef __NO_SYSTEM_INIT
	bsr	SystemInit
    2472:	e0000029 	bsr      	0x24c4	// 24c4 <SystemInit>
	lrw    r0, VIC_TSPR
	movi   r1, 0xb00
	stw    r1, (r0)
#endif

	bsr	main    // call main
    2476:	e3ffee45 	bsr      	0x100	// 100 <main>

0000247a <__exit>:
	.size	Reset_Handler, . - Reset_Handler

__exit:
    br __exit
    247a:	0400      	br      	0x247a	// 247a <__exit>
    247c:	80000000 	.long	0x80000000
    2480:	20001800 	.long	0x20001800
    2484:	00002668 	.long	0x00002668
    2488:	20000000 	.long	0x20000000
    248c:	2000002c 	.long	0x2000002c
    2490:	2000002c 	.long	0x2000002c
    2494:	20000488 	.long	0x20000488
    2498:	20000484 	.long	0x20000484

0000249c <SystemCoreClockUpdate>:
//int SystemCoreClock = SYSTEM_CLOCK;  /* System Core Clock Frequency      */
int SystemCoreClock = SYSTEM_CLOCK_FREQ;  /* System Core Clock Frequency      */


void SystemCoreClockUpdate(void)
{
    249c:	1421      	subi      	r14, r14, 4
    249e:	dd0e2000 	st.w      	r8, (r14, 0x0)
    24a2:	6e3b      	mov      	r8, r14
    SystemCoreClock = sysclk_cfg._cur_hclk_freq;
    24a4:	1066      	lrw      	r3, 0x2000001c	// 24bc <SystemCoreClockUpdate+0x20>
    24a6:	9361      	ld.w      	r3, (r3, 0x4)
    24a8:	6c8f      	mov      	r2, r3
    24aa:	1066      	lrw      	r3, 0x20000028	// 24c0 <SystemCoreClockUpdate+0x24>
    24ac:	b340      	st.w      	r2, (r3, 0x0)
}
    24ae:	6c00      	or      	r0, r0
    24b0:	6fa3      	mov      	r14, r8
    24b2:	d90e2000 	ld.w      	r8, (r14, 0x0)
    24b6:	1401      	addi      	r14, r14, 4
    24b8:	783c      	jmp      	r15
    24ba:	0000      	bkpt
    24bc:	2000001c 	.long	0x2000001c
    24c0:	20000028 	.long	0x20000028

000024c4 <SystemInit>:
  *         Initialize the psr and vbr.
  * @param  None
  * @return None
  */
void SystemInit(void)
{
    24c4:	1422      	subi      	r14, r14, 8
    24c6:	dd0e2000 	st.w      	r8, (r14, 0x0)
    24ca:	ddee2001 	st.w      	r15, (r14, 0x4)
    24ce:	6e3b      	mov      	r8, r14
    24d0:	1423      	subi      	r14, r14, 12
    //__set_VBR((uint32_t) & (__Vectors));
    /* Here we may setting exception vector, MGU, cache, and so on. */
#ifdef CONFIG_IWDT_NONE
	csi_syscon_iwdt_set_switch(DISABLE);
    24d2:	3001      	movi      	r0, 1
    24d4:	e3fff782 	bsr      	0x13d8	// 13d8 <csi_syscon_iwdt_set_switch>
    24d8:	3300      	movi      	r3, 0
    24da:	2b0b      	subi      	r3, 12
    24dc:	60e0      	addu      	r3, r8
    24de:	1143      	lrw      	r2, 0x80000140	// 2568 <SystemInit+0xa4>
    24e0:	b340      	st.w      	r2, (r3, 0x0)
  \details Writes the given value to the PSR Register.
  \param [in]    psr  PSR Register value to set
 */
__ALWAYS_INLINE void __set_PSR(uint32_t psr)
{
    __ASM volatile("mtcr %0, psr" : : "r"(psr));
    24e2:	3300      	movi      	r3, 0
    24e4:	2b0b      	subi      	r3, 12
    24e6:	60e0      	addu      	r3, r8
    24e8:	9360      	ld.w      	r3, (r3, 0x0)
    24ea:	c0036420 	mtcr      	r3, cr<0, 0>

#ifndef CONFIG_KERNEL_NONE
    csi_coret_config(sysclk_cfg._cur_hclk_freq / CONFIG_SYSTICK_HZ, CORET_IRQn);    //10ms
    csi_vic_enable_irq(CORET_IRQn);
#else
    csi_coret_config(sysclk_cfg._cur_hclk_freq / CONFIG_SYSTICK_HZ, CORET_IRQn);    //for mdelay()
    24ee:	1160      	lrw      	r3, 0x2000001c	// 256c <SystemInit+0xa8>
    24f0:	9361      	ld.w      	r3, (r3, 0x4)
    24f2:	3164      	movi      	r1, 100
    24f4:	6c0f      	mov      	r0, r3
    24f6:	e0000075 	bsr      	0x25e0	// 25e0 <__udiv32>
    24fa:	6cc3      	mov      	r3, r0
    24fc:	6c8f      	mov      	r2, r3
    24fe:	3300      	movi      	r3, 0
    2500:	2b03      	subi      	r3, 4
    2502:	60e0      	addu      	r3, r8
    2504:	b340      	st.w      	r2, (r3, 0x0)
    2506:	3300      	movi      	r3, 0
    2508:	2b07      	subi      	r3, 8
    250a:	60e0      	addu      	r3, r8
    250c:	3200      	movi      	r2, 0
    250e:	b340      	st.w      	r2, (r3, 0x0)
           function <b>SysTick_Config</b> is not included. In this case, the file <b><i>device</i>.h</b>
           must contain a vendor-specific implementation of this function.
 */
__ALWAYS_INLINE uint32_t csi_coret_config(uint32_t ticks, int32_t IRQn)
{
    if ((ticks - 1UL) > CORET_LOAD_RELOAD_Msk) {
    2510:	3300      	movi      	r3, 0
    2512:	2b03      	subi      	r3, 4
    2514:	60e0      	addu      	r3, r8
    2516:	9360      	ld.w      	r3, (r3, 0x0)
    2518:	5b43      	subi      	r2, r3, 1
    251a:	1076      	lrw      	r3, 0xffffff	// 2570 <SystemInit+0xac>
    251c:	648c      	cmphs      	r3, r2
    251e:	0c0e      	bf      	0x253a	// 253a <SystemInit+0x76>
        return (1UL);                                                   /* Reload value impossible */
    }

    CORET->LOAD  = (uint32_t)(ticks - 1UL);                           /* set reload register */
    2520:	1075      	lrw      	r3, 0xe000e010	// 2574 <SystemInit+0xb0>
    2522:	3200      	movi      	r2, 0
    2524:	2a03      	subi      	r2, 4
    2526:	60a0      	addu      	r2, r8
    2528:	9240      	ld.w      	r2, (r2, 0x0)
    252a:	2a00      	subi      	r2, 1
    252c:	b341      	st.w      	r2, (r3, 0x4)
    CORET->VAL   = 0UL;                                               /* Load the CORET Counter Value */
    252e:	1072      	lrw      	r3, 0xe000e010	// 2574 <SystemInit+0xb0>
    2530:	3200      	movi      	r2, 0
    2532:	b342      	st.w      	r2, (r3, 0x8)
    CORET->CTRL  = CORET_CTRL_CLKSOURCE_Msk |
    2534:	1070      	lrw      	r3, 0xe000e010	// 2574 <SystemInit+0xb0>
    2536:	3207      	movi      	r2, 7
    2538:	b340      	st.w      	r2, (r3, 0x0)
#endif


	csi_syscon_systemclock_config(sysclk_cfg._cur_sysclk, sysclk_cfg._cur_hclk_freq, sysclk_cfg._cur_pclk_freq);
    253a:	106d      	lrw      	r3, 0x2000001c	// 256c <SystemInit+0xa8>
    253c:	9300      	ld.w      	r0, (r3, 0x0)
    253e:	106c      	lrw      	r3, 0x2000001c	// 256c <SystemInit+0xa8>
    2540:	9321      	ld.w      	r1, (r3, 0x4)
    2542:	106b      	lrw      	r3, 0x2000001c	// 256c <SystemInit+0xa8>
    2544:	9362      	ld.w      	r3, (r3, 0x8)
    2546:	6c8f      	mov      	r2, r3
    2548:	e3fff3aa 	bsr      	0xc9c	// c9c <csi_syscon_systemclock_config>
    SystemCoreClock = sysclk_cfg._cur_hclk_freq;
    254c:	1068      	lrw      	r3, 0x2000001c	// 256c <SystemInit+0xa8>
    254e:	9361      	ld.w      	r3, (r3, 0x4)
    2550:	6c8f      	mov      	r2, r3
    2552:	106a      	lrw      	r3, 0x20000028	// 2578 <SystemInit+0xb4>
    2554:	b340      	st.w      	r2, (r3, 0x0)

    //extern void mm_heap_initialize(void);
    //mm_heap_initialize();
}
    2556:	6c00      	or      	r0, r0
    2558:	6fa3      	mov      	r14, r8
    255a:	d9ee2001 	ld.w      	r15, (r14, 0x4)
    255e:	d90e2000 	ld.w      	r8, (r14, 0x0)
    2562:	1402      	addi      	r14, r14, 8
    2564:	783c      	jmp      	r15
    2566:	0000      	bkpt
    2568:	80000140 	.long	0x80000140
    256c:	2000001c 	.long	0x2000001c
    2570:	00ffffff 	.long	0x00ffffff
    2574:	e000e010 	.long	0xe000e010
    2578:	20000028 	.long	0x20000028

0000257c <trap_c>:
#include <stdio.h>
#include <stdlib.h>
#include <csi_config.h>

void trap_c(uint32_t *regs)
{
    257c:	1421      	subi      	r14, r14, 4
    257e:	dd0e2000 	st.w      	r8, (r14, 0x0)
    2582:	6e3b      	mov      	r8, r14
    2584:	1421      	subi      	r14, r14, 4
    2586:	3300      	movi      	r3, 0
    2588:	2b03      	subi      	r3, 4
    258a:	60e0      	addu      	r3, r8
    258c:	b300      	st.w      	r0, (r3, 0x0)
//
//    printf("\n");
//    printf("epsr: %8x\n", regs[16]);
//    printf("epc : %8x\n", regs[17]);

    while (1);
    258e:	0400      	br      	0x258e	// 258e <trap_c+0x12>

00002590 <trap>:
 * default exception handler
 ******************************************************************************/
    .global trap
    .type   trap, %function
trap:
    psrset  ee
    2590:	c1007420 	psrset      	ee

    mov     r0, r0
    2594:	6c03      	mov      	r0, r0
    subi    sp, 72
    2596:	1432      	subi      	r14, r14, 72
#if defined(__CK802__)   
	stm     r0-r13, (sp)
#elif defined(__CK801__)
	stw		r0, (sp)
    2598:	b800      	st.w      	r0, (r14, 0x0)
	stw		r1, (sp,0x4)
    259a:	b821      	st.w      	r1, (r14, 0x4)
	stw		r2, (sp,0x8)
    259c:	b842      	st.w      	r2, (r14, 0x8)
	stw		r3, (sp,0xc)
    259e:	b863      	st.w      	r3, (r14, 0xc)
	stw		r4, (sp,0x10)
    25a0:	b884      	st.w      	r4, (r14, 0x10)
	stw		r5, (sp,0x14)
    25a2:	b8a5      	st.w      	r5, (r14, 0x14)
	stw		r6, (sp,0x18)
    25a4:	b8c6      	st.w      	r6, (r14, 0x18)
	stw		r7, (sp,0x1c)
    25a6:	b8e7      	st.w      	r7, (r14, 0x1c)
	stw		r8, (sp,0x20)
    25a8:	dd0e2008 	st.w      	r8, (r14, 0x20)
	stw		r13, (sp,0x24)
    25ac:	ddae2009 	st.w      	r13, (r14, 0x24)
#endif
	mov     r0, sp
    25b0:	6c3b      	mov      	r0, r14
    addi    r0, 72
    25b2:	2047      	addi      	r0, 72
    stw     r0, (sp, 56)
    25b4:	b80e      	st.w      	r0, (r14, 0x38)
    stw     r15, (sp, 60)
    25b6:	ddee200f 	st.w      	r15, (r14, 0x3c)
    mfcr    r0, epsr
    25ba:	c0026020 	mfcr      	r0, cr<2, 0>
    stw     r0, (sp, 64)
    25be:	b810      	st.w      	r0, (r14, 0x40)
    mfcr    r0, epc
    25c0:	c0046020 	mfcr      	r0, cr<4, 0>
    stw     r0, (sp, 68)
    25c4:	b811      	st.w      	r0, (r14, 0x44)
    mov     r0, sp
    25c6:	6c3b      	mov      	r0, r14

    /* for backtrace */
    subi    sp, 8
    25c8:	1422      	subi      	r14, r14, 8
    stw     r8, (sp, 0)
    25ca:	dd0e2000 	st.w      	r8, (r14, 0x0)
    stw     r15, (sp, 4)
    25ce:	ddee2001 	st.w      	r15, (r14, 0x4)
    mov     r8, sp
    25d2:	6e3b      	mov      	r8, r14

    lrw     r1, trap_c
    25d4:	1022      	lrw      	r1, 0x257c	// 25dc <Default_Handler+0x4>
    jmp     r1
    25d6:	7804      	jmp      	r1

000025d8 <Default_Handler>:

    .align  1
    .weak   Default_Handler
    .type   Default_Handler, %function
Default_Handler:
    br      trap
    25d8:	07dc      	br      	0x2590	// 2590 <trap>
    25da:	0000      	.short	0x0000
    25dc:	0000257c 	.long	0x0000257c

000025e0 <__udiv32>:
    25e0:	3940      	cmpnei      	r1, 0
    25e2:	0803      	bt      	0x25e8	// 25e8 <__udiv32+0x8>
    25e4:	c0002c20 	trap      	3
    25e8:	3840      	cmpnei      	r0, 0
    25ea:	0802      	bt      	0x25ee	// 25ee <__udiv32+0xe>
    25ec:	783c      	jmp      	r15
    25ee:	14c1      	push      	r4
    25f0:	3201      	movi      	r2, 1
    25f2:	6cc3      	mov      	r3, r0
    25f4:	3420      	movi      	r4, 32
    25f6:	3b00      	cmphsi      	r3, 1
    25f8:	0c04      	bf      	0x2600	// 2600 <__udiv32+0x20>
    25fa:	2c00      	subi      	r4, 1
    25fc:	4b61      	lsri      	r3, r3, 1
    25fe:	07fc      	br      	0x25f6	// 25f6 <__udiv32+0x16>
    2600:	7090      	lsl      	r2, r4
    2602:	7010      	lsl      	r0, r4
    2604:	6cc7      	mov      	r3, r1
    2606:	3420      	movi      	r4, 32
    2608:	3b00      	cmphsi      	r3, 1
    260a:	0c04      	bf      	0x2612	// 2612 <__udiv32+0x32>
    260c:	2c00      	subi      	r4, 1
    260e:	4b61      	lsri      	r3, r3, 1
    2610:	07fc      	br      	0x2608	// 2608 <__udiv32+0x28>
    2612:	2400      	addi      	r4, 1
    2614:	6cc3      	mov      	r3, r0
    2616:	70d1      	lsr      	r3, r4
    2618:	6d12      	nor      	r4, r4
    261a:	2420      	addi      	r4, 33
    261c:	7090      	lsl      	r2, r4
    261e:	7010      	lsl      	r0, r4
    2620:	3a40      	cmpnei      	r2, 0
    2622:	0c09      	bf      	0x2634	// 2634 <__udiv32+0x54>
    2624:	6402      	cmpne      	r0, r0
    2626:	6001      	addc      	r0, r0
    2628:	60cd      	addc      	r3, r3
    262a:	644c      	cmphs      	r3, r1
    262c:	0c02      	bf      	0x2630	// 2630 <__udiv32+0x50>
    262e:	60c6      	subu      	r3, r1
    2630:	6089      	addc      	r2, r2
    2632:	0ff9      	bf      	0x2624	// 2624 <__udiv32+0x44>
    2634:	6c0b      	mov      	r0, r2
    2636:	6c4f      	mov      	r1, r3
    2638:	1481      	pop      	r4
    263a:	0000      	bkpt
    263c:	0000      	bkpt
	...
