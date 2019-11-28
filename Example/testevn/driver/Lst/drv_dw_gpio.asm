
Obj/drv_dw_gpio.o:     file format elf32-csky-little


Disassembly of section .text:

00000000 <csi_gpio_initialize>:
   
   @param[in]   idx  GPIO port to be initialized: PORTA0, PORTA1 ... 
   @return      resource handler of specific gpio port
 */ 
gpio_port_handle_t csi_gpio_initialize (int32_t idx)
{
   0:	1422      	subi      	r14, r14, 8
   2:	b880      	st.w      	r4, (r14, 0x0)
   4:	dd0e2001 	st.w      	r8, (r14, 0x4)
   8:	6e3b      	mov      	r8, r14
   a:	1422      	subi      	r14, r14, 8
   c:	3300      	movi      	r3, 0
   e:	2b07      	subi      	r3, 8
  10:	60e0      	addu      	r3, r8
  12:	b300      	st.w      	r0, (r3, 0x0)
  if (idx<0 || idx>CONFIG_GPIO_NUM) {
  14:	3300      	movi      	r3, 0
  16:	2b07      	subi      	r3, 8
  18:	60e0      	addu      	r3, r8
  1a:	9360      	ld.w      	r3, (r3, 0x0)
  1c:	3bdf      	btsti      	r3, 31
  1e:	0807      	bt      	0x2c	// 2c <csi_gpio_initialize+0x2c>
  20:	3300      	movi      	r3, 0
  22:	2b07      	subi      	r3, 8
  24:	60e0      	addu      	r3, r8
  26:	9360      	ld.w      	r3, (r3, 0x0)
  28:	3b25      	cmplti      	r3, 6
  2a:	0803      	bt      	0x30	// 30 <csi_gpio_initialize+0x30>
    return NULL;
  2c:	3300      	movi      	r3, 0
  2e:	0485      	br      	0x138	// 138 <csi_gpio_initialize+0x138>
  }

  dw_gpio_private_t *gpio_priv = &gpio_intance[idx];
  30:	3300      	movi      	r3, 0
  32:	2b03      	subi      	r3, 4
  34:	60e0      	addu      	r3, r8
  36:	3200      	movi      	r2, 0
  38:	2a07      	subi      	r2, 8
  3a:	60a0      	addu      	r2, r8
  3c:	9240      	ld.w      	r2, (r2, 0x0)
  3e:	4244      	lsli      	r2, r2, 4
  40:	1222      	lrw      	r1, 0x0	// 148 <csi_gpio_initialize+0x148>
  42:	6084      	addu      	r2, r1
  44:	b340      	st.w      	r2, (r3, 0x0)

  // base address initial...
  switch (idx) {
  46:	3300      	movi      	r3, 0
  48:	2b07      	subi      	r3, 8
  4a:	60e0      	addu      	r3, r8
  4c:	9340      	ld.w      	r2, (r3, 0x0)
  4e:	3a04      	cmphsi      	r2, 5
  50:	0870      	bt      	0x130	// 130 <csi_gpio_initialize+0x130>
  52:	9360      	ld.w      	r3, (r3, 0x0)
  54:	4362      	lsli      	r3, r3, 2
  56:	115e      	lrw      	r2, 0x0	// 14c <csi_gpio_initialize+0x14c>
  58:	60c8      	addu      	r3, r2
  5a:	9360      	ld.w      	r3, (r3, 0x0)
  5c:	780c      	jmp      	r3
    case 0: // PORTA0
      gpio_priv->base = APT_GPIOA0_BASE;
  5e:	3300      	movi      	r3, 0
  60:	2b03      	subi      	r3, 4
  62:	60e0      	addu      	r3, r8
  64:	9360      	ld.w      	r3, (r3, 0x0)
  66:	115b      	lrw      	r2, 0x40040000	// 150 <csi_gpio_initialize+0x150>
  68:	b340      	st.w      	r2, (r3, 0x0)
      gpio_priv->gpio_config.CONR = 0ull;	// reset value of pa0
  6a:	3300      	movi      	r3, 0
  6c:	2b03      	subi      	r3, 4
  6e:	60e0      	addu      	r3, r8
  70:	9340      	ld.w      	r2, (r3, 0x0)
  72:	3300      	movi      	r3, 0
  74:	3400      	movi      	r4, 0
  76:	b261      	st.w      	r3, (r2, 0x4)
  78:	b282      	st.w      	r4, (r2, 0x8)
      gpio_priv->pullst = 0ul;
  7a:	3300      	movi      	r3, 0
  7c:	2b03      	subi      	r3, 4
  7e:	60e0      	addu      	r3, r8
  80:	9360      	ld.w      	r3, (r3, 0x0)
  82:	3200      	movi      	r2, 0
  84:	b343      	st.w      	r2, (r3, 0xc)
      break;
  86:	0455      	br      	0x130	// 130 <csi_gpio_initialize+0x130>
    case 1: // PORTA1
      gpio_priv->base = APT_GPIOA1_BASE;
  88:	3300      	movi      	r3, 0
  8a:	2b03      	subi      	r3, 4
  8c:	60e0      	addu      	r3, r8
  8e:	9360      	ld.w      	r3, (r3, 0x0)
  90:	1151      	lrw      	r2, 0x40040100	// 154 <csi_gpio_initialize+0x154>
  92:	b340      	st.w      	r2, (r3, 0x0)
      gpio_priv->gpio_config.CONR = 0ull;	// reset value of pa1
  94:	3300      	movi      	r3, 0
  96:	2b03      	subi      	r3, 4
  98:	60e0      	addu      	r3, r8
  9a:	9340      	ld.w      	r2, (r3, 0x0)
  9c:	3300      	movi      	r3, 0
  9e:	3400      	movi      	r4, 0
  a0:	b261      	st.w      	r3, (r2, 0x4)
  a2:	b282      	st.w      	r4, (r2, 0x8)
      gpio_priv->pullst = 0ul;
  a4:	3300      	movi      	r3, 0
  a6:	2b03      	subi      	r3, 4
  a8:	60e0      	addu      	r3, r8
  aa:	9360      	ld.w      	r3, (r3, 0x0)
  ac:	3200      	movi      	r2, 0
  ae:	b343      	st.w      	r2, (r3, 0xc)
      break;
  b0:	0440      	br      	0x130	// 130 <csi_gpio_initialize+0x130>
    case 2: // PORTB0
      gpio_priv->base = APT_GPIOB0_BASE;
  b2:	3300      	movi      	r3, 0
  b4:	2b03      	subi      	r3, 4
  b6:	60e0      	addu      	r3, r8
  b8:	9360      	ld.w      	r3, (r3, 0x0)
  ba:	1148      	lrw      	r2, 0x40041000	// 158 <csi_gpio_initialize+0x158>
  bc:	b340      	st.w      	r2, (r3, 0x0)
      gpio_priv->gpio_config.CONR = 0ull;	// reset value of pb0
  be:	3300      	movi      	r3, 0
  c0:	2b03      	subi      	r3, 4
  c2:	60e0      	addu      	r3, r8
  c4:	9340      	ld.w      	r2, (r3, 0x0)
  c6:	3300      	movi      	r3, 0
  c8:	3400      	movi      	r4, 0
  ca:	b261      	st.w      	r3, (r2, 0x4)
  cc:	b282      	st.w      	r4, (r2, 0x8)
      gpio_priv->pullst = 0ul;
  ce:	3300      	movi      	r3, 0
  d0:	2b03      	subi      	r3, 4
  d2:	60e0      	addu      	r3, r8
  d4:	9360      	ld.w      	r3, (r3, 0x0)
  d6:	3200      	movi      	r2, 0
  d8:	b343      	st.w      	r2, (r3, 0xc)
      break;
  da:	042b      	br      	0x130	// 130 <csi_gpio_initialize+0x130>
    case 3: // PORTC0
      gpio_priv->base = APT_GPIOC0_BASE;
  dc:	3300      	movi      	r3, 0
  de:	2b03      	subi      	r3, 4
  e0:	60e0      	addu      	r3, r8
  e2:	9360      	ld.w      	r3, (r3, 0x0)
  e4:	105e      	lrw      	r2, 0x40042000	// 15c <csi_gpio_initialize+0x15c>
  e6:	b340      	st.w      	r2, (r3, 0x0)
      gpio_priv->gpio_config.CONR = 0ull;	// reset value of pc0
  e8:	3300      	movi      	r3, 0
  ea:	2b03      	subi      	r3, 4
  ec:	60e0      	addu      	r3, r8
  ee:	9340      	ld.w      	r2, (r3, 0x0)
  f0:	3300      	movi      	r3, 0
  f2:	3400      	movi      	r4, 0
  f4:	b261      	st.w      	r3, (r2, 0x4)
  f6:	b282      	st.w      	r4, (r2, 0x8)
      gpio_priv->pullst = 0ul;
  f8:	3300      	movi      	r3, 0
  fa:	2b03      	subi      	r3, 4
  fc:	60e0      	addu      	r3, r8
  fe:	9360      	ld.w      	r3, (r3, 0x0)
 100:	3200      	movi      	r2, 0
 102:	b343      	st.w      	r2, (r3, 0xc)
      break;
 104:	0416      	br      	0x130	// 130 <csi_gpio_initialize+0x130>
    case 4: // PORTD0
      gpio_priv->base = APT_GPIOD0_BASE;
 106:	3300      	movi      	r3, 0
 108:	2b03      	subi      	r3, 4
 10a:	60e0      	addu      	r3, r8
 10c:	9360      	ld.w      	r3, (r3, 0x0)
 10e:	1055      	lrw      	r2, 0x40043000	// 160 <csi_gpio_initialize+0x160>
 110:	b340      	st.w      	r2, (r3, 0x0)
      gpio_priv->gpio_config.CONR = 0ull;	// reset value of pd0
 112:	3300      	movi      	r3, 0
 114:	2b03      	subi      	r3, 4
 116:	60e0      	addu      	r3, r8
 118:	9340      	ld.w      	r2, (r3, 0x0)
 11a:	3300      	movi      	r3, 0
 11c:	3400      	movi      	r4, 0
 11e:	b261      	st.w      	r3, (r2, 0x4)
 120:	b282      	st.w      	r4, (r2, 0x8)
      gpio_priv->pullst = 0ul;
 122:	3300      	movi      	r3, 0
 124:	2b03      	subi      	r3, 4
 126:	60e0      	addu      	r3, r8
 128:	9360      	ld.w      	r3, (r3, 0x0)
 12a:	3200      	movi      	r2, 0
 12c:	b343      	st.w      	r2, (r3, 0xc)
      break;
 12e:	6c00      	or      	r0, r0
  }

  return (gpio_port_handle_t)gpio_priv;
 130:	3300      	movi      	r3, 0
 132:	2b03      	subi      	r3, 4
 134:	60e0      	addu      	r3, r8
 136:	9360      	ld.w      	r3, (r3, 0x0)
}
 138:	6c0f      	mov      	r0, r3
 13a:	6fa3      	mov      	r14, r8
 13c:	d90e2001 	ld.w      	r8, (r14, 0x4)
 140:	9880      	ld.w      	r4, (r14, 0x0)
 142:	1402      	addi      	r14, r14, 8
 144:	783c      	jmp      	r15
	...
 152:	4004      	.short	0x4004
 154:	40040100 	.long	0x40040100
 158:	40041000 	.long	0x40041000
 15c:	40042000 	.long	0x40042000
 160:	40043000 	.long	0x40043000

00000164 <csi_gpio_exi_cb_init>:
   
   @param[in]   cb   pointer to customer ISR when EXI is called 
   @return      zero on success
 */ 
int32_t csi_gpio_exi_cb_init (gpio_event_cb_t cb)
{
 164:	1421      	subi      	r14, r14, 4
 166:	dd0e2000 	st.w      	r8, (r14, 0x0)
 16a:	6e3b      	mov      	r8, r14
 16c:	1426      	subi      	r14, r14, 24
 16e:	3300      	movi      	r3, 0
 170:	2b17      	subi      	r3, 24
 172:	60e0      	addu      	r3, r8
 174:	b300      	st.w      	r0, (r3, 0x0)
    GPIO_NULL_PARAM_CHK(cb);
 176:	3300      	movi      	r3, 0
 178:	2b17      	subi      	r3, 24
 17a:	60e0      	addu      	r3, r8
 17c:	9360      	ld.w      	r3, (r3, 0x0)
 17e:	3b40      	cmpnei      	r3, 0
 180:	0804      	bt      	0x188	// 188 <csi_gpio_exi_cb_init+0x24>
 182:	ea83013d 	lrw      	r3, 0x81010084	// 674 <csi_gpio_pin_speed_config+0xe0>
 186:	045e      	br      	0x242	// 242 <csi_gpio_exi_cb_init+0xde>
    gpio_exi_cb = cb;
 188:	ea83013c 	lrw      	r3, 0x0	// 678 <csi_gpio_pin_speed_config+0xe4>
 18c:	3200      	movi      	r2, 0
 18e:	2a17      	subi      	r2, 24
 190:	60a0      	addu      	r2, r8
 192:	9240      	ld.w      	r2, (r2, 0x0)
 194:	b340      	st.w      	r2, (r3, 0x0)
 196:	3300      	movi      	r3, 0
 198:	2b13      	subi      	r3, 20
 19a:	60e0      	addu      	r3, r8
 19c:	3207      	movi      	r2, 7
 19e:	b340      	st.w      	r2, (r3, 0x0)
  \details Enable a device-specific interrupt in the VIC interrupt controller.
  \param [in]      IRQn  External interrupt number. Value cannot be negative.
 */
__ALWAYS_INLINE void csi_vic_enable_irq(int32_t IRQn)
{
    VIC->ISER[0U] = (uint32_t)(1UL << (((uint32_t)(int32_t)IRQn) & 0x1FUL));
 1a0:	ea830137 	lrw      	r3, 0xe000e100	// 67c <csi_gpio_pin_speed_config+0xe8>
 1a4:	3200      	movi      	r2, 0
 1a6:	2a13      	subi      	r2, 20
 1a8:	60a0      	addu      	r2, r8
 1aa:	9220      	ld.w      	r1, (r2, 0x0)
 1ac:	321f      	movi      	r2, 31
 1ae:	6884      	and      	r2, r1
 1b0:	3101      	movi      	r1, 1
 1b2:	7048      	lsl      	r1, r2
 1b4:	6c87      	mov      	r2, r1
 1b6:	b340      	st.w      	r2, (r3, 0x0)
 1b8:	3300      	movi      	r3, 0
 1ba:	2b0f      	subi      	r3, 16
 1bc:	60e0      	addu      	r3, r8
 1be:	3208      	movi      	r2, 8
 1c0:	b340      	st.w      	r2, (r3, 0x0)
 1c2:	ea83012f 	lrw      	r3, 0xe000e100	// 67c <csi_gpio_pin_speed_config+0xe8>
 1c6:	3200      	movi      	r2, 0
 1c8:	2a0f      	subi      	r2, 16
 1ca:	60a0      	addu      	r2, r8
 1cc:	9220      	ld.w      	r1, (r2, 0x0)
 1ce:	321f      	movi      	r2, 31
 1d0:	6884      	and      	r2, r1
 1d2:	3101      	movi      	r1, 1
 1d4:	7048      	lsl      	r1, r2
 1d6:	6c87      	mov      	r2, r1
 1d8:	b340      	st.w      	r2, (r3, 0x0)
 1da:	3300      	movi      	r3, 0
 1dc:	2b0b      	subi      	r3, 12
 1de:	60e0      	addu      	r3, r8
 1e0:	3215      	movi      	r2, 21
 1e2:	b340      	st.w      	r2, (r3, 0x0)
 1e4:	ea830126 	lrw      	r3, 0xe000e100	// 67c <csi_gpio_pin_speed_config+0xe8>
 1e8:	3200      	movi      	r2, 0
 1ea:	2a0b      	subi      	r2, 12
 1ec:	60a0      	addu      	r2, r8
 1ee:	9220      	ld.w      	r1, (r2, 0x0)
 1f0:	321f      	movi      	r2, 31
 1f2:	6884      	and      	r2, r1
 1f4:	3101      	movi      	r1, 1
 1f6:	7048      	lsl      	r1, r2
 1f8:	6c87      	mov      	r2, r1
 1fa:	b340      	st.w      	r2, (r3, 0x0)
 1fc:	3300      	movi      	r3, 0
 1fe:	2b07      	subi      	r3, 8
 200:	60e0      	addu      	r3, r8
 202:	3216      	movi      	r2, 22
 204:	b340      	st.w      	r2, (r3, 0x0)
 206:	ea83011e 	lrw      	r3, 0xe000e100	// 67c <csi_gpio_pin_speed_config+0xe8>
 20a:	3200      	movi      	r2, 0
 20c:	2a07      	subi      	r2, 8
 20e:	60a0      	addu      	r2, r8
 210:	9220      	ld.w      	r1, (r2, 0x0)
 212:	321f      	movi      	r2, 31
 214:	6884      	and      	r2, r1
 216:	3101      	movi      	r1, 1
 218:	7048      	lsl      	r1, r2
 21a:	6c87      	mov      	r2, r1
 21c:	b340      	st.w      	r2, (r3, 0x0)
 21e:	3300      	movi      	r3, 0
 220:	2b03      	subi      	r3, 4
 222:	60e0      	addu      	r3, r8
 224:	3217      	movi      	r2, 23
 226:	b340      	st.w      	r2, (r3, 0x0)
 228:	ea830115 	lrw      	r3, 0xe000e100	// 67c <csi_gpio_pin_speed_config+0xe8>
 22c:	3200      	movi      	r2, 0
 22e:	2a03      	subi      	r2, 4
 230:	60a0      	addu      	r2, r8
 232:	9220      	ld.w      	r1, (r2, 0x0)
 234:	321f      	movi      	r2, 31
 236:	6884      	and      	r2, r1
 238:	3101      	movi      	r1, 1
 23a:	7048      	lsl      	r1, r2
 23c:	6c87      	mov      	r2, r1
 23e:	b340      	st.w      	r2, (r3, 0x0)
	csi_vic_enable_irq(EXI0_IRQn);
	csi_vic_enable_irq(EXI1_IRQn);
	csi_vic_enable_irq(EXI2_IRQn);
	csi_vic_enable_irq(EXI3_IRQn);
	csi_vic_enable_irq(EXI4_IRQn);
    return 0;
 240:	3300      	movi      	r3, 0
}
 242:	6c0f      	mov      	r0, r3
 244:	6fa3      	mov      	r14, r8
 246:	d90e2000 	ld.w      	r8, (r14, 0x0)
 24a:	1401      	addi      	r14, r14, 4
 24c:	783c      	jmp      	r15
	...

00000250 <csi_gpio_port_config>:
   @param[in]  conr_val    expected control register value to be set
   @param[in]  pullst      pull-up/pull-down config
   @return    error code
 */
int32_t csi_gpio_port_config(gpio_port_handle_t handle, uint64_t conr_val, uint32_t pullst)
{
 250:	1422      	subi      	r14, r14, 8
 252:	b880      	st.w      	r4, (r14, 0x0)
 254:	dd0e2001 	st.w      	r8, (r14, 0x4)
 258:	6e3b      	mov      	r8, r14
 25a:	1426      	subi      	r14, r14, 24
 25c:	3400      	movi      	r4, 0
 25e:	2c0b      	subi      	r4, 12
 260:	6120      	addu      	r4, r8
 262:	b400      	st.w      	r0, (r4, 0x0)
 264:	3000      	movi      	r0, 0
 266:	2813      	subi      	r0, 20
 268:	6020      	addu      	r0, r8
 26a:	b020      	st.w      	r1, (r0, 0x0)
 26c:	b041      	st.w      	r2, (r0, 0x4)
 26e:	3200      	movi      	r2, 0
 270:	2a17      	subi      	r2, 24
 272:	60a0      	addu      	r2, r8
 274:	b260      	st.w      	r3, (r2, 0x0)
    GPIO_NULL_PARAM_CHK(handle);
 276:	3300      	movi      	r3, 0
 278:	2b0b      	subi      	r3, 12
 27a:	60e0      	addu      	r3, r8
 27c:	9360      	ld.w      	r3, (r3, 0x0)
 27e:	3b40      	cmpnei      	r3, 0
 280:	0803      	bt      	0x286	// 286 <csi_gpio_port_config+0x36>
 282:	0062      	lrw      	r3, 0x81010084	// 674 <csi_gpio_pin_speed_config+0xe0>
 284:	043b      	br      	0x2fa	// 2fa <csi_gpio_port_config+0xaa>

    dw_gpio_private_t *gpio_priv = (dw_gpio_private_t *)handle;
 286:	3300      	movi      	r3, 0
 288:	2b03      	subi      	r3, 4
 28a:	60e0      	addu      	r3, r8
 28c:	3200      	movi      	r2, 0
 28e:	2a0b      	subi      	r2, 12
 290:	60a0      	addu      	r2, r8
 292:	9240      	ld.w      	r2, (r2, 0x0)
 294:	b340      	st.w      	r2, (r3, 0x0)
    gpio_reg_ptr addr = (gpio_reg_ptr)(gpio_priv->base);
 296:	3300      	movi      	r3, 0
 298:	2b03      	subi      	r3, 4
 29a:	60e0      	addu      	r3, r8
 29c:	9360      	ld.w      	r3, (r3, 0x0)
 29e:	9340      	ld.w      	r2, (r3, 0x0)
 2a0:	3300      	movi      	r3, 0
 2a2:	2b07      	subi      	r3, 8
 2a4:	60e0      	addu      	r3, r8
 2a6:	b340      	st.w      	r2, (r3, 0x0)
	
	gpio_priv->gpio_config.CONR = conr_val;
 2a8:	3300      	movi      	r3, 0
 2aa:	2b03      	subi      	r3, 4
 2ac:	60e0      	addu      	r3, r8
 2ae:	9340      	ld.w      	r2, (r3, 0x0)
 2b0:	3300      	movi      	r3, 0
 2b2:	2b13      	subi      	r3, 20
 2b4:	60e0      	addu      	r3, r8
 2b6:	9381      	ld.w      	r4, (r3, 0x4)
 2b8:	9360      	ld.w      	r3, (r3, 0x0)
 2ba:	b261      	st.w      	r3, (r2, 0x4)
 2bc:	b282      	st.w      	r4, (r2, 0x8)
	
	addr->CONHR = gpio_priv->gpio_config.w.CONHR;
 2be:	3300      	movi      	r3, 0
 2c0:	2b03      	subi      	r3, 4
 2c2:	60e0      	addu      	r3, r8
 2c4:	9360      	ld.w      	r3, (r3, 0x0)
 2c6:	9342      	ld.w      	r2, (r3, 0x8)
 2c8:	3300      	movi      	r3, 0
 2ca:	2b07      	subi      	r3, 8
 2cc:	60e0      	addu      	r3, r8
 2ce:	9360      	ld.w      	r3, (r3, 0x0)
 2d0:	b341      	st.w      	r2, (r3, 0x4)
	addr->CONLR = gpio_priv->gpio_config.w.CONLR;
 2d2:	3300      	movi      	r3, 0
 2d4:	2b03      	subi      	r3, 4
 2d6:	60e0      	addu      	r3, r8
 2d8:	9360      	ld.w      	r3, (r3, 0x0)
 2da:	9341      	ld.w      	r2, (r3, 0x4)
 2dc:	3300      	movi      	r3, 0
 2de:	2b07      	subi      	r3, 8
 2e0:	60e0      	addu      	r3, r8
 2e2:	9360      	ld.w      	r3, (r3, 0x0)
 2e4:	b340      	st.w      	r2, (r3, 0x0)
	addr->PUDR = pullst;
 2e6:	3300      	movi      	r3, 0
 2e8:	2b07      	subi      	r3, 8
 2ea:	60e0      	addu      	r3, r8
 2ec:	9360      	ld.w      	r3, (r3, 0x0)
 2ee:	3200      	movi      	r2, 0
 2f0:	2a17      	subi      	r2, 24
 2f2:	60a0      	addu      	r2, r8
 2f4:	9240      	ld.w      	r2, (r2, 0x0)
 2f6:	b348      	st.w      	r2, (r3, 0x20)
	
    return 0;
 2f8:	3300      	movi      	r3, 0
}
 2fa:	6c0f      	mov      	r0, r3
 2fc:	6fa3      	mov      	r14, r8
 2fe:	d90e2001 	ld.w      	r8, (r14, 0x4)
 302:	9880      	ld.w      	r4, (r14, 0x0)
 304:	1402      	addi      	r14, r14, 8
 306:	783c      	jmp      	r15

00000308 <csi_gpio_pin_func_config>:
  @param[in]   gpio_pin    pin name.
  @param[in]   pin_mode    pin mode.
  @return      error code
*/
int32_t csi_gpio_pin_func_config(gpio_pin_name gpio_pin, gpio_mode_e pin_mode)
{
 308:	1424      	subi      	r14, r14, 16
 30a:	b880      	st.w      	r4, (r14, 0x0)
 30c:	b8a1      	st.w      	r5, (r14, 0x4)
 30e:	b8c2      	st.w      	r6, (r14, 0x8)
 310:	dd0e2003 	st.w      	r8, (r14, 0xc)
 314:	6e3b      	mov      	r8, r14
 316:	142e      	subi      	r14, r14, 56
 318:	3300      	movi      	r3, 0
 31a:	2b1b      	subi      	r3, 28
 31c:	60e0      	addu      	r3, r8
 31e:	b300      	st.w      	r0, (r3, 0x0)
 320:	3300      	movi      	r3, 0
 322:	2b1f      	subi      	r3, 32
 324:	60e0      	addu      	r3, r8
 326:	b320      	st.w      	r1, (r3, 0x0)
    uint32_t port_idx = (gpio_pin>>4);
 328:	3300      	movi      	r3, 0
 32a:	2b03      	subi      	r3, 4
 32c:	60e0      	addu      	r3, r8
 32e:	3200      	movi      	r2, 0
 330:	2a1b      	subi      	r2, 28
 332:	60a0      	addu      	r2, r8
 334:	9240      	ld.w      	r2, (r2, 0x0)
 336:	4a44      	lsri      	r2, r2, 4
 338:	b340      	st.w      	r2, (r3, 0x0)
    uint32_t pin_idx = (gpio_pin & 0xful);
 33a:	3200      	movi      	r2, 0
 33c:	2a07      	subi      	r2, 8
 33e:	60a0      	addu      	r2, r8
 340:	3300      	movi      	r3, 0
 342:	2b1b      	subi      	r3, 28
 344:	60e0      	addu      	r3, r8
 346:	9320      	ld.w      	r1, (r3, 0x0)
 348:	330f      	movi      	r3, 15
 34a:	68c4      	and      	r3, r1
 34c:	b260      	st.w      	r3, (r2, 0x0)
    
	dw_gpio_private_t *gpio_priv = &gpio_intance[port_idx];
 34e:	3300      	movi      	r3, 0
 350:	2b0b      	subi      	r3, 12
 352:	60e0      	addu      	r3, r8
 354:	3200      	movi      	r2, 0
 356:	2a03      	subi      	r2, 4
 358:	60a0      	addu      	r2, r8
 35a:	9240      	ld.w      	r2, (r2, 0x0)
 35c:	4244      	lsli      	r2, r2, 4
 35e:	0136      	lrw      	r1, 0x0	// 680 <csi_gpio_pin_speed_config+0xec>
 360:	6084      	addu      	r2, r1
 362:	b340      	st.w      	r2, (r3, 0x0)
    gpio_reg_ptr addr = (gpio_reg_ptr)(gpio_priv->base);
 364:	3300      	movi      	r3, 0
 366:	2b0b      	subi      	r3, 12
 368:	60e0      	addu      	r3, r8
 36a:	9360      	ld.w      	r3, (r3, 0x0)
 36c:	9340      	ld.w      	r2, (r3, 0x0)
 36e:	3300      	movi      	r3, 0
 370:	2b0f      	subi      	r3, 16
 372:	60e0      	addu      	r3, r8
 374:	b340      	st.w      	r2, (r3, 0x0)
	gpio_conr_type gpio_conr_priv = gpio_priv->gpio_config;
 376:	3200      	movi      	r2, 0
 378:	2a17      	subi      	r2, 24
 37a:	60a0      	addu      	r2, r8
 37c:	3300      	movi      	r3, 0
 37e:	2b0b      	subi      	r3, 12
 380:	60e0      	addu      	r3, r8
 382:	9360      	ld.w      	r3, (r3, 0x0)
 384:	9382      	ld.w      	r4, (r3, 0x8)
 386:	9361      	ld.w      	r3, (r3, 0x4)
 388:	b260      	st.w      	r3, (r2, 0x0)
 38a:	b281      	st.w      	r4, (r2, 0x4)
	
	gpio_conr_priv.CONR &= ~(0xfull<<pin_idx*4);
 38c:	3300      	movi      	r3, 0
 38e:	2b17      	subi      	r3, 24
 390:	60e0      	addu      	r3, r8
 392:	9381      	ld.w      	r4, (r3, 0x4)
 394:	9360      	ld.w      	r3, (r3, 0x0)
 396:	3200      	movi      	r2, 0
 398:	2a37      	subi      	r2, 56
 39a:	60a0      	addu      	r2, r8
 39c:	b260      	st.w      	r3, (r2, 0x0)
 39e:	b281      	st.w      	r4, (r2, 0x4)
 3a0:	3300      	movi      	r3, 0
 3a2:	2b07      	subi      	r3, 8
 3a4:	60e0      	addu      	r3, r8
 3a6:	9360      	ld.w      	r3, (r3, 0x0)
 3a8:	4322      	lsli      	r1, r3, 2
 3aa:	3200      	movi      	r2, 0
 3ac:	2a1f      	subi      	r2, 32
 3ae:	6084      	addu      	r2, r1
 3b0:	3adf      	btsti      	r2, 31
 3b2:	0806      	bt      	0x3be	// 3be <csi_gpio_pin_func_config+0xb6>
 3b4:	330f      	movi      	r3, 15
 3b6:	70c8      	lsl      	r3, r2
 3b8:	6d8f      	mov      	r6, r3
 3ba:	3500      	movi      	r5, 0
 3bc:	040d      	br      	0x3d6	// 3d6 <csi_gpio_pin_func_config+0xce>
 3be:	330f      	movi      	r3, 15
 3c0:	4b41      	lsri      	r2, r3, 1
 3c2:	331f      	movi      	r3, 31
 3c4:	60c6      	subu      	r3, r1
 3c6:	708d      	lsr      	r2, r3
 3c8:	3300      	movi      	r3, 0
 3ca:	70c4      	lsl      	r3, r1
 3cc:	6d8f      	mov      	r6, r3
 3ce:	6d88      	or      	r6, r2
 3d0:	330f      	movi      	r3, 15
 3d2:	70c4      	lsl      	r3, r1
 3d4:	6d4f      	mov      	r5, r3
 3d6:	6cd7      	mov      	r3, r5
 3d8:	6cce      	nor      	r3, r3
 3da:	3200      	movi      	r2, 0
 3dc:	2a27      	subi      	r2, 40
 3de:	60a0      	addu      	r2, r8
 3e0:	b260      	st.w      	r3, (r2, 0x0)
 3e2:	6cdb      	mov      	r3, r6
 3e4:	6cce      	nor      	r3, r3
 3e6:	3200      	movi      	r2, 0
 3e8:	2a23      	subi      	r2, 36
 3ea:	60a0      	addu      	r2, r8
 3ec:	b260      	st.w      	r3, (r2, 0x0)
 3ee:	3300      	movi      	r3, 0
 3f0:	2b37      	subi      	r3, 56
 3f2:	60e0      	addu      	r3, r8
 3f4:	9381      	ld.w      	r4, (r3, 0x4)
 3f6:	9360      	ld.w      	r3, (r3, 0x0)
 3f8:	3200      	movi      	r2, 0
 3fa:	2a27      	subi      	r2, 40
 3fc:	60a0      	addu      	r2, r8
 3fe:	9220      	ld.w      	r1, (r2, 0x0)
 400:	9241      	ld.w      	r2, (r2, 0x4)
 402:	68c4      	and      	r3, r1
 404:	6908      	and      	r4, r2
 406:	3200      	movi      	r2, 0
 408:	2a17      	subi      	r2, 24
 40a:	60a0      	addu      	r2, r8
 40c:	b260      	st.w      	r3, (r2, 0x0)
 40e:	b281      	st.w      	r4, (r2, 0x4)
	gpio_conr_priv.CONR |= (pin_mode << pin_idx*4);
 410:	3300      	movi      	r3, 0
 412:	2b17      	subi      	r3, 24
 414:	60e0      	addu      	r3, r8
 416:	9381      	ld.w      	r4, (r3, 0x4)
 418:	9360      	ld.w      	r3, (r3, 0x0)
 41a:	3200      	movi      	r2, 0
 41c:	2a07      	subi      	r2, 8
 41e:	60a0      	addu      	r2, r8
 420:	9240      	ld.w      	r2, (r2, 0x0)
 422:	4242      	lsli      	r2, r2, 2
 424:	3100      	movi      	r1, 0
 426:	291f      	subi      	r1, 32
 428:	6060      	addu      	r1, r8
 42a:	9120      	ld.w      	r1, (r1, 0x0)
 42c:	7048      	lsl      	r1, r2
 42e:	6c87      	mov      	r2, r1
 430:	3100      	movi      	r1, 0
 432:	292f      	subi      	r1, 48
 434:	6060      	addu      	r1, r8
 436:	b140      	st.w      	r2, (r1, 0x0)
 438:	3200      	movi      	r2, 0
 43a:	3100      	movi      	r1, 0
 43c:	292b      	subi      	r1, 44
 43e:	6060      	addu      	r1, r8
 440:	b140      	st.w      	r2, (r1, 0x0)
 442:	3200      	movi      	r2, 0
 444:	2a2f      	subi      	r2, 48
 446:	60a0      	addu      	r2, r8
 448:	9220      	ld.w      	r1, (r2, 0x0)
 44a:	9241      	ld.w      	r2, (r2, 0x4)
 44c:	6c4c      	or      	r1, r3
 44e:	6c90      	or      	r2, r4
 450:	6cc7      	mov      	r3, r1
 452:	6d0b      	mov      	r4, r2
 454:	3200      	movi      	r2, 0
 456:	2a17      	subi      	r2, 24
 458:	60a0      	addu      	r2, r8
 45a:	b260      	st.w      	r3, (r2, 0x0)
 45c:	b281      	st.w      	r4, (r2, 0x4)
	
	gpio_priv->gpio_config = gpio_conr_priv;
 45e:	3300      	movi      	r3, 0
 460:	2b0b      	subi      	r3, 12
 462:	60e0      	addu      	r3, r8
 464:	9340      	ld.w      	r2, (r3, 0x0)
 466:	3300      	movi      	r3, 0
 468:	2b17      	subi      	r3, 24
 46a:	60e0      	addu      	r3, r8
 46c:	9381      	ld.w      	r4, (r3, 0x4)
 46e:	9360      	ld.w      	r3, (r3, 0x0)
 470:	b261      	st.w      	r3, (r2, 0x4)
 472:	b282      	st.w      	r4, (r2, 0x8)
	addr->CONHR = gpio_priv->gpio_config.w.CONHR;
 474:	3300      	movi      	r3, 0
 476:	2b0b      	subi      	r3, 12
 478:	60e0      	addu      	r3, r8
 47a:	9360      	ld.w      	r3, (r3, 0x0)
 47c:	9342      	ld.w      	r2, (r3, 0x8)
 47e:	3300      	movi      	r3, 0
 480:	2b0f      	subi      	r3, 16
 482:	60e0      	addu      	r3, r8
 484:	9360      	ld.w      	r3, (r3, 0x0)
 486:	b341      	st.w      	r2, (r3, 0x4)
	addr->CONLR = gpio_priv->gpio_config.w.CONLR;
 488:	3300      	movi      	r3, 0
 48a:	2b0b      	subi      	r3, 12
 48c:	60e0      	addu      	r3, r8
 48e:	9360      	ld.w      	r3, (r3, 0x0)
 490:	9341      	ld.w      	r2, (r3, 0x4)
 492:	3300      	movi      	r3, 0
 494:	2b0f      	subi      	r3, 16
 496:	60e0      	addu      	r3, r8
 498:	9360      	ld.w      	r3, (r3, 0x0)
 49a:	b340      	st.w      	r2, (r3, 0x0)
	
    return 0;
 49c:	3300      	movi      	r3, 0
} 
 49e:	6c0f      	mov      	r0, r3
 4a0:	6fa3      	mov      	r14, r8
 4a2:	d90e2003 	ld.w      	r8, (r14, 0xc)
 4a6:	98c2      	ld.w      	r6, (r14, 0x8)
 4a8:	98a1      	ld.w      	r5, (r14, 0x4)
 4aa:	9880      	ld.w      	r4, (r14, 0x0)
 4ac:	1404      	addi      	r14, r14, 16
 4ae:	783c      	jmp      	r15

000004b0 <csi_gpio_pin_pull_config>:
  @param[in]   gpio_pin    pin name.
  @param[in]   pin_mode    pull-up/down mode to be set.
  @return      error code
*/
void csi_gpio_pin_pull_config(gpio_pin_name gpio_pin, gpio_pull_e pin_mode)
{
 4b0:	1421      	subi      	r14, r14, 4
 4b2:	dd0e2000 	st.w      	r8, (r14, 0x0)
 4b6:	6e3b      	mov      	r8, r14
 4b8:	1427      	subi      	r14, r14, 28
 4ba:	3300      	movi      	r3, 0
 4bc:	2b17      	subi      	r3, 24
 4be:	60e0      	addu      	r3, r8
 4c0:	b300      	st.w      	r0, (r3, 0x0)
 4c2:	3300      	movi      	r3, 0
 4c4:	2b1b      	subi      	r3, 28
 4c6:	60e0      	addu      	r3, r8
 4c8:	b320      	st.w      	r1, (r3, 0x0)
    uint32_t port_idx = (gpio_pin>>4);
 4ca:	3300      	movi      	r3, 0
 4cc:	2b03      	subi      	r3, 4
 4ce:	60e0      	addu      	r3, r8
 4d0:	3200      	movi      	r2, 0
 4d2:	2a17      	subi      	r2, 24
 4d4:	60a0      	addu      	r2, r8
 4d6:	9240      	ld.w      	r2, (r2, 0x0)
 4d8:	4a44      	lsri      	r2, r2, 4
 4da:	b340      	st.w      	r2, (r3, 0x0)
    uint32_t pin_idx = (gpio_pin & 0xful);
 4dc:	3300      	movi      	r3, 0
 4de:	2b07      	subi      	r3, 8
 4e0:	60e0      	addu      	r3, r8
 4e2:	3200      	movi      	r2, 0
 4e4:	2a17      	subi      	r2, 24
 4e6:	60a0      	addu      	r2, r8
 4e8:	9220      	ld.w      	r1, (r2, 0x0)
 4ea:	320f      	movi      	r2, 15
 4ec:	6884      	and      	r2, r1
 4ee:	b340      	st.w      	r2, (r3, 0x0)

	dw_gpio_private_t *gpio_priv = &gpio_intance[port_idx];
 4f0:	3300      	movi      	r3, 0
 4f2:	2b0b      	subi      	r3, 12
 4f4:	60e0      	addu      	r3, r8
 4f6:	3200      	movi      	r2, 0
 4f8:	2a03      	subi      	r2, 4
 4fa:	60a0      	addu      	r2, r8
 4fc:	9240      	ld.w      	r2, (r2, 0x0)
 4fe:	4244      	lsli      	r2, r2, 4
 500:	1320      	lrw      	r1, 0x0	// 680 <csi_gpio_pin_speed_config+0xec>
 502:	6084      	addu      	r2, r1
 504:	b340      	st.w      	r2, (r3, 0x0)
    gpio_reg_ptr addr = (gpio_reg_ptr)(gpio_priv->base);
 506:	3300      	movi      	r3, 0
 508:	2b0b      	subi      	r3, 12
 50a:	60e0      	addu      	r3, r8
 50c:	9360      	ld.w      	r3, (r3, 0x0)
 50e:	9340      	ld.w      	r2, (r3, 0x0)
 510:	3300      	movi      	r3, 0
 512:	2b0f      	subi      	r3, 16
 514:	60e0      	addu      	r3, r8
 516:	b340      	st.w      	r2, (r3, 0x0)
	
	uint32_t pudr_priv = addr->PUDR;
 518:	3300      	movi      	r3, 0
 51a:	2b13      	subi      	r3, 20
 51c:	60e0      	addu      	r3, r8
 51e:	3200      	movi      	r2, 0
 520:	2a0f      	subi      	r2, 16
 522:	60a0      	addu      	r2, r8
 524:	9240      	ld.w      	r2, (r2, 0x0)
 526:	9248      	ld.w      	r2, (r2, 0x20)
 528:	b340      	st.w      	r2, (r3, 0x0)
	pudr_priv &= ~(3ul<<pin_idx);
 52a:	3300      	movi      	r3, 0
 52c:	2b07      	subi      	r3, 8
 52e:	60e0      	addu      	r3, r8
 530:	3203      	movi      	r2, 3
 532:	9360      	ld.w      	r3, (r3, 0x0)
 534:	708c      	lsl      	r2, r3
 536:	6ccb      	mov      	r3, r2
 538:	6cce      	nor      	r3, r3
 53a:	6c4f      	mov      	r1, r3
 53c:	3300      	movi      	r3, 0
 53e:	2b13      	subi      	r3, 20
 540:	60e0      	addu      	r3, r8
 542:	3200      	movi      	r2, 0
 544:	2a13      	subi      	r2, 20
 546:	60a0      	addu      	r2, r8
 548:	9240      	ld.w      	r2, (r2, 0x0)
 54a:	6884      	and      	r2, r1
 54c:	b340      	st.w      	r2, (r3, 0x0)
    pudr_priv |= (pin_mode<<pin_idx*2);
 54e:	3300      	movi      	r3, 0
 550:	2b07      	subi      	r3, 8
 552:	60e0      	addu      	r3, r8
 554:	9360      	ld.w      	r3, (r3, 0x0)
 556:	4361      	lsli      	r3, r3, 1
 558:	3200      	movi      	r2, 0
 55a:	2a1b      	subi      	r2, 28
 55c:	60a0      	addu      	r2, r8
 55e:	9240      	ld.w      	r2, (r2, 0x0)
 560:	708c      	lsl      	r2, r3
 562:	6c4b      	mov      	r1, r2
 564:	3300      	movi      	r3, 0
 566:	2b13      	subi      	r3, 20
 568:	60e0      	addu      	r3, r8
 56a:	3200      	movi      	r2, 0
 56c:	2a13      	subi      	r2, 20
 56e:	60a0      	addu      	r2, r8
 570:	9240      	ld.w      	r2, (r2, 0x0)
 572:	6c84      	or      	r2, r1
 574:	b340      	st.w      	r2, (r3, 0x0)
	
	addr->PUDR = pudr_priv;
 576:	3300      	movi      	r3, 0
 578:	2b0f      	subi      	r3, 16
 57a:	60e0      	addu      	r3, r8
 57c:	9360      	ld.w      	r3, (r3, 0x0)
 57e:	3200      	movi      	r2, 0
 580:	2a13      	subi      	r2, 20
 582:	60a0      	addu      	r2, r8
 584:	9240      	ld.w      	r2, (r2, 0x0)
 586:	b348      	st.w      	r2, (r3, 0x20)

} 
 588:	6c00      	or      	r0, r0
 58a:	6fa3      	mov      	r14, r8
 58c:	d90e2000 	ld.w      	r8, (r14, 0x0)
 590:	1401      	addi      	r14, r14, 4
 592:	783c      	jmp      	r15

00000594 <csi_gpio_pin_speed_config>:
  @param[in]   gpio_pin    pin name.
  @param[in]   pin_mode    IO character to be set.
  @return      error code
*/
void csi_gpio_pin_speed_config(gpio_pin_name gpio_pin, gpio_char_e pin_mode)
{
 594:	1421      	subi      	r14, r14, 4
 596:	dd0e2000 	st.w      	r8, (r14, 0x0)
 59a:	6e3b      	mov      	r8, r14
 59c:	1427      	subi      	r14, r14, 28
 59e:	3300      	movi      	r3, 0
 5a0:	2b17      	subi      	r3, 24
 5a2:	60e0      	addu      	r3, r8
 5a4:	b300      	st.w      	r0, (r3, 0x0)
 5a6:	3300      	movi      	r3, 0
 5a8:	2b1b      	subi      	r3, 28
 5aa:	60e0      	addu      	r3, r8
 5ac:	b320      	st.w      	r1, (r3, 0x0)
    uint32_t port_idx = (gpio_pin>>4);
 5ae:	3300      	movi      	r3, 0
 5b0:	2b03      	subi      	r3, 4
 5b2:	60e0      	addu      	r3, r8
 5b4:	3200      	movi      	r2, 0
 5b6:	2a17      	subi      	r2, 24
 5b8:	60a0      	addu      	r2, r8
 5ba:	9240      	ld.w      	r2, (r2, 0x0)
 5bc:	4a44      	lsri      	r2, r2, 4
 5be:	b340      	st.w      	r2, (r3, 0x0)
    uint32_t pin_idx = (gpio_pin & 0xful);
 5c0:	3300      	movi      	r3, 0
 5c2:	2b07      	subi      	r3, 8
 5c4:	60e0      	addu      	r3, r8
 5c6:	3200      	movi      	r2, 0
 5c8:	2a17      	subi      	r2, 24
 5ca:	60a0      	addu      	r2, r8
 5cc:	9220      	ld.w      	r1, (r2, 0x0)
 5ce:	320f      	movi      	r2, 15
 5d0:	6884      	and      	r2, r1
 5d2:	b340      	st.w      	r2, (r3, 0x0)

	dw_gpio_private_t *gpio_priv = &gpio_intance[port_idx];
 5d4:	3300      	movi      	r3, 0
 5d6:	2b0b      	subi      	r3, 12
 5d8:	60e0      	addu      	r3, r8
 5da:	3200      	movi      	r2, 0
 5dc:	2a03      	subi      	r2, 4
 5de:	60a0      	addu      	r2, r8
 5e0:	9240      	ld.w      	r2, (r2, 0x0)
 5e2:	4244      	lsli      	r2, r2, 4
 5e4:	1127      	lrw      	r1, 0x0	// 680 <csi_gpio_pin_speed_config+0xec>
 5e6:	6084      	addu      	r2, r1
 5e8:	b340      	st.w      	r2, (r3, 0x0)
    gpio_reg_ptr addr = (gpio_reg_ptr)(gpio_priv->base);
 5ea:	3300      	movi      	r3, 0
 5ec:	2b0b      	subi      	r3, 12
 5ee:	60e0      	addu      	r3, r8
 5f0:	9360      	ld.w      	r3, (r3, 0x0)
 5f2:	9340      	ld.w      	r2, (r3, 0x0)
 5f4:	3300      	movi      	r3, 0
 5f6:	2b0f      	subi      	r3, 16
 5f8:	60e0      	addu      	r3, r8
 5fa:	b340      	st.w      	r2, (r3, 0x0)
	
	uint32_t dscr_priv = addr->DSCR;
 5fc:	3300      	movi      	r3, 0
 5fe:	2b13      	subi      	r3, 20
 600:	60e0      	addu      	r3, r8
 602:	3200      	movi      	r2, 0
 604:	2a0f      	subi      	r2, 16
 606:	60a0      	addu      	r2, r8
 608:	9240      	ld.w      	r2, (r2, 0x0)
 60a:	9249      	ld.w      	r2, (r2, 0x24)
 60c:	b340      	st.w      	r2, (r3, 0x0)
	dscr_priv &= ~(3ul<<pin_idx);
 60e:	3300      	movi      	r3, 0
 610:	2b07      	subi      	r3, 8
 612:	60e0      	addu      	r3, r8
 614:	3203      	movi      	r2, 3
 616:	9360      	ld.w      	r3, (r3, 0x0)
 618:	708c      	lsl      	r2, r3
 61a:	6ccb      	mov      	r3, r2
 61c:	6cce      	nor      	r3, r3
 61e:	6c4f      	mov      	r1, r3
 620:	3300      	movi      	r3, 0
 622:	2b13      	subi      	r3, 20
 624:	60e0      	addu      	r3, r8
 626:	3200      	movi      	r2, 0
 628:	2a13      	subi      	r2, 20
 62a:	60a0      	addu      	r2, r8
 62c:	9240      	ld.w      	r2, (r2, 0x0)
 62e:	6884      	and      	r2, r1
 630:	b340      	st.w      	r2, (r3, 0x0)
    dscr_priv |= (pin_mode<<pin_idx*2);
 632:	3300      	movi      	r3, 0
 634:	2b07      	subi      	r3, 8
 636:	60e0      	addu      	r3, r8
 638:	9360      	ld.w      	r3, (r3, 0x0)
 63a:	4361      	lsli      	r3, r3, 1
 63c:	3200      	movi      	r2, 0
 63e:	2a1b      	subi      	r2, 28
 640:	60a0      	addu      	r2, r8
 642:	9240      	ld.w      	r2, (r2, 0x0)
 644:	708c      	lsl      	r2, r3
 646:	6c4b      	mov      	r1, r2
 648:	3300      	movi      	r3, 0
 64a:	2b13      	subi      	r3, 20
 64c:	60e0      	addu      	r3, r8
 64e:	3200      	movi      	r2, 0
 650:	2a13      	subi      	r2, 20
 652:	60a0      	addu      	r2, r8
 654:	9240      	ld.w      	r2, (r2, 0x0)
 656:	6c84      	or      	r2, r1
 658:	b340      	st.w      	r2, (r3, 0x0)
	
	addr->DSCR = dscr_priv;
 65a:	3300      	movi      	r3, 0
 65c:	2b0f      	subi      	r3, 16
 65e:	60e0      	addu      	r3, r8
 660:	9360      	ld.w      	r3, (r3, 0x0)
 662:	3200      	movi      	r2, 0
 664:	2a13      	subi      	r2, 20
 666:	60a0      	addu      	r2, r8
 668:	9240      	ld.w      	r2, (r2, 0x0)
 66a:	b349      	st.w      	r2, (r3, 0x24)
	
} 
 66c:	6c00      	or      	r0, r0
 66e:	6fa3      	mov      	r14, r8
 670:	040a      	br      	0x684	// 684 <csi_gpio_pin_speed_config+0xf0>
 672:	0000      	bkpt
 674:	81010084 	.long	0x81010084
 678:	00000000 	.long	0x00000000
 67c:	e000e100 	.long	0xe000e100
 680:	00000000 	.long	0x00000000
 684:	d90e2000 	ld.w      	r8, (r14, 0x0)
 688:	1401      	addi      	r14, r14, 4
 68a:	783c      	jmp      	r15

0000068c <csi_gpio_pin_outputmode_config>:
  @param[in]   gpio_pin    pin name.
  @param[in]   pin_mode    IO character to be set.
  @return      error code
*/
void csi_gpio_pin_outputmode_config(gpio_pin_name gpio_pin, gpio_output_mode_e pin_mode)
{
 68c:	1421      	subi      	r14, r14, 4
 68e:	dd0e2000 	st.w      	r8, (r14, 0x0)
 692:	6e3b      	mov      	r8, r14
 694:	1427      	subi      	r14, r14, 28
 696:	3300      	movi      	r3, 0
 698:	2b17      	subi      	r3, 24
 69a:	60e0      	addu      	r3, r8
 69c:	b300      	st.w      	r0, (r3, 0x0)
 69e:	3300      	movi      	r3, 0
 6a0:	2b1b      	subi      	r3, 28
 6a2:	60e0      	addu      	r3, r8
 6a4:	b320      	st.w      	r1, (r3, 0x0)
    uint32_t port_idx = (gpio_pin>>4);
 6a6:	3300      	movi      	r3, 0
 6a8:	2b03      	subi      	r3, 4
 6aa:	60e0      	addu      	r3, r8
 6ac:	3200      	movi      	r2, 0
 6ae:	2a17      	subi      	r2, 24
 6b0:	60a0      	addu      	r2, r8
 6b2:	9240      	ld.w      	r2, (r2, 0x0)
 6b4:	4a44      	lsri      	r2, r2, 4
 6b6:	b340      	st.w      	r2, (r3, 0x0)
    uint32_t pin_idx = (gpio_pin & 0xful);
 6b8:	3300      	movi      	r3, 0
 6ba:	2b07      	subi      	r3, 8
 6bc:	60e0      	addu      	r3, r8
 6be:	3200      	movi      	r2, 0
 6c0:	2a17      	subi      	r2, 24
 6c2:	60a0      	addu      	r2, r8
 6c4:	9220      	ld.w      	r1, (r2, 0x0)
 6c6:	320f      	movi      	r2, 15
 6c8:	6884      	and      	r2, r1
 6ca:	b340      	st.w      	r2, (r3, 0x0)

	dw_gpio_private_t *gpio_priv = &gpio_intance[port_idx];
 6cc:	3300      	movi      	r3, 0
 6ce:	2b0b      	subi      	r3, 12
 6d0:	60e0      	addu      	r3, r8
 6d2:	3200      	movi      	r2, 0
 6d4:	2a03      	subi      	r2, 4
 6d6:	60a0      	addu      	r2, r8
 6d8:	9240      	ld.w      	r2, (r2, 0x0)
 6da:	4244      	lsli      	r2, r2, 4
 6dc:	1339      	lrw      	r1, 0x0	// 8c0 <csi_gpio_pin_exi_set+0x150>
 6de:	6084      	addu      	r2, r1
 6e0:	b340      	st.w      	r2, (r3, 0x0)
    gpio_reg_ptr addr = (gpio_reg_ptr)(gpio_priv->base);
 6e2:	3300      	movi      	r3, 0
 6e4:	2b0b      	subi      	r3, 12
 6e6:	60e0      	addu      	r3, r8
 6e8:	9360      	ld.w      	r3, (r3, 0x0)
 6ea:	9340      	ld.w      	r2, (r3, 0x0)
 6ec:	3300      	movi      	r3, 0
 6ee:	2b0f      	subi      	r3, 16
 6f0:	60e0      	addu      	r3, r8
 6f2:	b340      	st.w      	r2, (r3, 0x0)
	
	uint32_t omcr_priv = addr->OMCR;
 6f4:	3300      	movi      	r3, 0
 6f6:	2b13      	subi      	r3, 20
 6f8:	60e0      	addu      	r3, r8
 6fa:	3200      	movi      	r2, 0
 6fc:	2a0f      	subi      	r2, 16
 6fe:	60a0      	addu      	r2, r8
 700:	9240      	ld.w      	r2, (r2, 0x0)
 702:	924a      	ld.w      	r2, (r2, 0x28)
 704:	b340      	st.w      	r2, (r3, 0x0)
	omcr_priv &= ~(1ul<<pin_idx);
 706:	3300      	movi      	r3, 0
 708:	2b07      	subi      	r3, 8
 70a:	60e0      	addu      	r3, r8
 70c:	3201      	movi      	r2, 1
 70e:	9360      	ld.w      	r3, (r3, 0x0)
 710:	708c      	lsl      	r2, r3
 712:	6ccb      	mov      	r3, r2
 714:	6cce      	nor      	r3, r3
 716:	6c4f      	mov      	r1, r3
 718:	3300      	movi      	r3, 0
 71a:	2b13      	subi      	r3, 20
 71c:	60e0      	addu      	r3, r8
 71e:	3200      	movi      	r2, 0
 720:	2a13      	subi      	r2, 20
 722:	60a0      	addu      	r2, r8
 724:	9240      	ld.w      	r2, (r2, 0x0)
 726:	6884      	and      	r2, r1
 728:	b340      	st.w      	r2, (r3, 0x0)
    omcr_priv |= (pin_mode<<pin_idx);
 72a:	3200      	movi      	r2, 0
 72c:	2a1b      	subi      	r2, 28
 72e:	60a0      	addu      	r2, r8
 730:	3300      	movi      	r3, 0
 732:	2b07      	subi      	r3, 8
 734:	60e0      	addu      	r3, r8
 736:	9240      	ld.w      	r2, (r2, 0x0)
 738:	9360      	ld.w      	r3, (r3, 0x0)
 73a:	708c      	lsl      	r2, r3
 73c:	6c4b      	mov      	r1, r2
 73e:	3300      	movi      	r3, 0
 740:	2b13      	subi      	r3, 20
 742:	60e0      	addu      	r3, r8
 744:	3200      	movi      	r2, 0
 746:	2a13      	subi      	r2, 20
 748:	60a0      	addu      	r2, r8
 74a:	9240      	ld.w      	r2, (r2, 0x0)
 74c:	6c84      	or      	r2, r1
 74e:	b340      	st.w      	r2, (r3, 0x0)
	
	addr->OMCR = omcr_priv;
 750:	3300      	movi      	r3, 0
 752:	2b0f      	subi      	r3, 16
 754:	60e0      	addu      	r3, r8
 756:	9360      	ld.w      	r3, (r3, 0x0)
 758:	3200      	movi      	r2, 0
 75a:	2a13      	subi      	r2, 20
 75c:	60a0      	addu      	r2, r8
 75e:	9240      	ld.w      	r2, (r2, 0x0)
 760:	b34a      	st.w      	r2, (r3, 0x28)
	
} 
 762:	6c00      	or      	r0, r0
 764:	6fa3      	mov      	r14, r8
 766:	d90e2000 	ld.w      	r8, (r14, 0x0)
 76a:	1401      	addi      	r14, r14, 4
 76c:	783c      	jmp      	r15
	...

00000770 <csi_gpio_pin_exi_set>:
  @param[in]   handle    gpio port handle to operate.
  @param[in]   pin_num   pin number in port
  @return      none
*/
void csi_gpio_pin_exi_set(gpio_pin_name gpio_pin, bool enable)
{
 770:	1421      	subi      	r14, r14, 4
 772:	dd0e2000 	st.w      	r8, (r14, 0x0)
 776:	6e3b      	mov      	r8, r14
 778:	1426      	subi      	r14, r14, 24
 77a:	3300      	movi      	r3, 0
 77c:	2b13      	subi      	r3, 20
 77e:	60e0      	addu      	r3, r8
 780:	b300      	st.w      	r0, (r3, 0x0)
 782:	6c87      	mov      	r2, r1
 784:	3300      	movi      	r3, 0
 786:	2b14      	subi      	r3, 21
 788:	60e0      	addu      	r3, r8
 78a:	a340      	st.b      	r2, (r3, 0x0)
    uint32_t port_idx = (gpio_pin>>4);
 78c:	3300      	movi      	r3, 0
 78e:	2b03      	subi      	r3, 4
 790:	60e0      	addu      	r3, r8
 792:	3200      	movi      	r2, 0
 794:	2a13      	subi      	r2, 20
 796:	60a0      	addu      	r2, r8
 798:	9240      	ld.w      	r2, (r2, 0x0)
 79a:	4a44      	lsri      	r2, r2, 4
 79c:	b340      	st.w      	r2, (r3, 0x0)
    uint32_t pin_idx  = (gpio_pin & 0xful);
 79e:	3300      	movi      	r3, 0
 7a0:	2b07      	subi      	r3, 8
 7a2:	60e0      	addu      	r3, r8
 7a4:	3200      	movi      	r2, 0
 7a6:	2a13      	subi      	r2, 20
 7a8:	60a0      	addu      	r2, r8
 7aa:	9220      	ld.w      	r1, (r2, 0x0)
 7ac:	320f      	movi      	r2, 15
 7ae:	6884      	and      	r2, r1
 7b0:	b340      	st.w      	r2, (r3, 0x0)

    if (enable == true) {
 7b2:	3300      	movi      	r3, 0
 7b4:	2b14      	subi      	r3, 21
 7b6:	60e0      	addu      	r3, r8
 7b8:	8360      	ld.b      	r3, (r3, 0x0)
 7ba:	74cc      	zextb      	r3, r3
 7bc:	3b40      	cmpnei      	r3, 0
 7be:	0c42      	bf      	0x842	// 842 <csi_gpio_pin_exi_set+0xd2>
        if (pin_idx < 8) {
 7c0:	3300      	movi      	r3, 0
 7c2:	2b07      	subi      	r3, 8
 7c4:	60e0      	addu      	r3, r8
 7c6:	9360      	ld.w      	r3, (r3, 0x0)
 7c8:	3b07      	cmphsi      	r3, 8
 7ca:	081f      	bt      	0x808	// 808 <csi_gpio_pin_exi_set+0x98>
            H_EXIGRP->IGRPL = ((H_EXIGRP->IGRPL) & ~(0xful<<(4*pin_idx))) | ((port_idx-1)<<(4*pin_idx)) ;
 7cc:	117e      	lrw      	r3, 0x0	// 8c4 <csi_gpio_pin_exi_set+0x154>
 7ce:	9360      	ld.w      	r3, (r3, 0x0)
 7d0:	115d      	lrw      	r2, 0x0	// 8c4 <csi_gpio_pin_exi_set+0x154>
 7d2:	9240      	ld.w      	r2, (r2, 0x0)
 7d4:	9220      	ld.w      	r1, (r2, 0x0)
 7d6:	3200      	movi      	r2, 0
 7d8:	2a07      	subi      	r2, 8
 7da:	60a0      	addu      	r2, r8
 7dc:	9240      	ld.w      	r2, (r2, 0x0)
 7de:	4242      	lsli      	r2, r2, 2
 7e0:	300f      	movi      	r0, 15
 7e2:	7008      	lsl      	r0, r2
 7e4:	6c83      	mov      	r2, r0
 7e6:	6c8a      	nor      	r2, r2
 7e8:	6848      	and      	r1, r2
 7ea:	3200      	movi      	r2, 0
 7ec:	2a03      	subi      	r2, 4
 7ee:	60a0      	addu      	r2, r8
 7f0:	9240      	ld.w      	r2, (r2, 0x0)
 7f2:	5a03      	subi      	r0, r2, 1
 7f4:	3200      	movi      	r2, 0
 7f6:	2a07      	subi      	r2, 8
 7f8:	60a0      	addu      	r2, r8
 7fa:	9240      	ld.w      	r2, (r2, 0x0)
 7fc:	4242      	lsli      	r2, r2, 2
 7fe:	7008      	lsl      	r0, r2
 800:	6c83      	mov      	r2, r0
 802:	6c84      	or      	r2, r1
 804:	b340      	st.w      	r2, (r3, 0x0)
 806:	041e      	br      	0x842	// 842 <csi_gpio_pin_exi_set+0xd2>
        } else {
            H_EXIGRP->IGRPH = ((H_EXIGRP->IGRPL) & ~(0xful<<(4*pin_idx))) | ((port_idx-1)<<(4*pin_idx)) ;
 808:	116f      	lrw      	r3, 0x0	// 8c4 <csi_gpio_pin_exi_set+0x154>
 80a:	9360      	ld.w      	r3, (r3, 0x0)
 80c:	114e      	lrw      	r2, 0x0	// 8c4 <csi_gpio_pin_exi_set+0x154>
 80e:	9240      	ld.w      	r2, (r2, 0x0)
 810:	9220      	ld.w      	r1, (r2, 0x0)
 812:	3200      	movi      	r2, 0
 814:	2a07      	subi      	r2, 8
 816:	60a0      	addu      	r2, r8
 818:	9240      	ld.w      	r2, (r2, 0x0)
 81a:	4242      	lsli      	r2, r2, 2
 81c:	300f      	movi      	r0, 15
 81e:	7008      	lsl      	r0, r2
 820:	6c83      	mov      	r2, r0
 822:	6c8a      	nor      	r2, r2
 824:	6848      	and      	r1, r2
 826:	3200      	movi      	r2, 0
 828:	2a03      	subi      	r2, 4
 82a:	60a0      	addu      	r2, r8
 82c:	9240      	ld.w      	r2, (r2, 0x0)
 82e:	5a03      	subi      	r0, r2, 1
 830:	3200      	movi      	r2, 0
 832:	2a07      	subi      	r2, 8
 834:	60a0      	addu      	r2, r8
 836:	9240      	ld.w      	r2, (r2, 0x0)
 838:	4242      	lsli      	r2, r2, 2
 83a:	7008      	lsl      	r0, r2
 83c:	6c83      	mov      	r2, r0
 83e:	6c84      	or      	r2, r1
 840:	b341      	st.w      	r2, (r3, 0x4)
        }
    }

	dw_gpio_private_t *gpio_priv = &gpio_intance[port_idx];
 842:	3300      	movi      	r3, 0
 844:	2b0b      	subi      	r3, 12
 846:	60e0      	addu      	r3, r8
 848:	3200      	movi      	r2, 0
 84a:	2a03      	subi      	r2, 4
 84c:	60a0      	addu      	r2, r8
 84e:	9240      	ld.w      	r2, (r2, 0x0)
 850:	4244      	lsli      	r2, r2, 4
 852:	103c      	lrw      	r1, 0x0	// 8c0 <csi_gpio_pin_exi_set+0x150>
 854:	6084      	addu      	r2, r1
 856:	b340      	st.w      	r2, (r3, 0x0)
    gpio_reg_ptr addr = (gpio_reg_ptr)(gpio_priv->base);
 858:	3300      	movi      	r3, 0
 85a:	2b0b      	subi      	r3, 12
 85c:	60e0      	addu      	r3, r8
 85e:	9360      	ld.w      	r3, (r3, 0x0)
 860:	9340      	ld.w      	r2, (r3, 0x0)
 862:	3300      	movi      	r3, 0
 864:	2b0f      	subi      	r3, 16
 866:	60e0      	addu      	r3, r8
 868:	b340      	st.w      	r2, (r3, 0x0)
	
	addr->IEER = enable<<pin_idx;
 86a:	3300      	movi      	r3, 0
 86c:	2b14      	subi      	r3, 21
 86e:	60e0      	addu      	r3, r8
 870:	8360      	ld.b      	r3, (r3, 0x0)
 872:	748c      	zextb      	r2, r3
 874:	3300      	movi      	r3, 0
 876:	2b07      	subi      	r3, 8
 878:	60e0      	addu      	r3, r8
 87a:	9360      	ld.w      	r3, (r3, 0x0)
 87c:	708c      	lsl      	r2, r3
 87e:	6ccb      	mov      	r3, r2
 880:	6c8f      	mov      	r2, r3
 882:	3300      	movi      	r3, 0
 884:	2b0f      	subi      	r3, 16
 886:	60e0      	addu      	r3, r8
 888:	9360      	ld.w      	r3, (r3, 0x0)
 88a:	b34c      	st.w      	r2, (r3, 0x30)
	addr->IEDR = (~enable)<<pin_idx;
 88c:	3300      	movi      	r3, 0
 88e:	2b14      	subi      	r3, 21
 890:	60e0      	addu      	r3, r8
 892:	8360      	ld.b      	r3, (r3, 0x0)
 894:	74cc      	zextb      	r3, r3
 896:	6cce      	nor      	r3, r3
 898:	6c8f      	mov      	r2, r3
 89a:	3300      	movi      	r3, 0
 89c:	2b07      	subi      	r3, 8
 89e:	60e0      	addu      	r3, r8
 8a0:	9360      	ld.w      	r3, (r3, 0x0)
 8a2:	708c      	lsl      	r2, r3
 8a4:	6ccb      	mov      	r3, r2
 8a6:	6c8f      	mov      	r2, r3
 8a8:	3300      	movi      	r3, 0
 8aa:	2b0f      	subi      	r3, 16
 8ac:	60e0      	addu      	r3, r8
 8ae:	9360      	ld.w      	r3, (r3, 0x0)
 8b0:	b34d      	st.w      	r2, (r3, 0x34)
	
}
 8b2:	6c00      	or      	r0, r0
 8b4:	6fa3      	mov      	r14, r8
 8b6:	d90e2000 	ld.w      	r8, (r14, 0x0)
 8ba:	1401      	addi      	r14, r14, 4
 8bc:	783c      	jmp      	r15
	...
