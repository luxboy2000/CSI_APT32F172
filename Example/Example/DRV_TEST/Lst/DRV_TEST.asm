
G:/SW_HOME/CSKY/CSI/APT32F172A/drv/Example/Example/DRV_TEST//Obj/DRV_TEST.elf:     file format elf32-csky-little


Disassembly of section .text:

00000000 <__Vectors>:
   0:	20 08 00 00 c0 09 00 00 c0 09 00 00 c0 09 00 00      ...............
  10:	c0 09 00 00 c0 09 00 00 c0 09 00 00 c0 09 00 00     ................
  20:	c0 09 00 00 c0 09 00 00 c0 09 00 00 c0 09 00 00     ................
  30:	c0 09 00 00 c0 09 00 00 c0 09 00 00 c0 09 00 00     ................
  40:	c0 09 00 00 c0 09 00 00 c0 09 00 00 c0 09 00 00     ................
  50:	c0 09 00 00 c0 09 00 00 c0 09 00 00 c0 09 00 00     ................
  60:	c0 09 00 00 c0 09 00 00 c0 09 00 00 c0 09 00 00     ................
  70:	c0 09 00 00 c0 09 00 00 c0 09 00 00 c0 09 00 00     ................
  80:	00 04 00 00 28 04 00 00 50 04 00 00 78 04 00 00     ....(...P...x...
  90:	a4 04 00 00 cc 04 00 00 f4 04 00 00 e4 05 00 00     ................
  a0:	0c 06 00 00 bc 05 00 00 1c 05 00 00 44 05 00 00     ............D...
  b0:	6c 05 00 00 e4 06 00 00 10 07 00 00 c0 09 00 00     l...............
  c0:	c0 09 00 00 3c 07 00 00 c0 09 00 00 68 07 00 00     ....<.......h...
  d0:	c0 09 00 00 34 06 00 00 5c 06 00 00 84 06 00 00     ....4...\.......
  e0:	c0 09 00 00 94 07 00 00 c0 09 00 00 94 05 00 00     ................
  f0:	bc 07 00 00 e4 07 00 00 c0 09 00 00 c0 09 00 00     ................

00000100 <main>:
 * 4 IO base address
 *
 * @return For MCU application, it's better to loop here
 */
int main()
{
 100:	1421      	subi      	sp, sp, 4
 102:	dd0e2000 	st.w      	r8, (sp, 0)
 106:	6e3b      	mov      	r8, sp
    // TODO
	while(1);
 108:	0400      	br      	0x108	// 108 <main+0x8>
	...

0000010c <ck_coret_irqhandler>:

extern void systick_handler(void);
extern void xPortSysTickHandler(void);
extern void OSTimeTick(void);

ATTRIBUTE_WEAK void ck_coret_irqhandler(void) {
 10c:	1421      	subi      	sp, sp, 4
 10e:	dd0e2000 	st.w      	r8, (sp, 0)
 112:	6e3b      	mov      	r8, sp
 114:	1421      	subi      	sp, sp, 4
    readl(0xE000E010);
 116:	1047      	lrw      	r2, 0xe000e010	// 130 <ck_coret_irqhandler+0x24>
 118:	3300      	movi      	r3, 0
 11a:	2b03      	subi      	r3, 4
 11c:	60e0      	addu      	r3, r8
 11e:	9240      	ld.w      	r2, (r2, 0)
 120:	b340      	st.w      	r2, (r3, 0)
}
 122:	6c00      	or      	r0, r0
 124:	6fa3      	mov      	sp, r8
 126:	d90e2000 	ld.w      	r8, (sp, 0)
 12a:	1401      	addi      	sp, sp, 4
 12c:	783c      	rts
 12e:	0000      	bkpt
 130:	e000e010 	.long	0xe000e010

00000134 <isr_syscon_irqhandler>:

ATTRIBUTE_WEAK void isr_syscon_irqhandler(void) {
 134:	1421      	subi      	sp, sp, 4
 136:	dd0e2000 	st.w      	r8, (sp, 0)
 13a:	6e3b      	mov      	r8, sp
    H_SYSCON->ICR = 0xffffffff;
 13c:	ea830159 	lrw      	r3, 0x20000000	// 6a0 <EXI4_IRQHandler+0x1c>
 140:	9360      	ld.w      	r3, (r3, 0)
 142:	2383      	addi      	r3, 132
 144:	6c8f      	mov      	r2, r3
 146:	3300      	movi      	r3, 0
 148:	2b00      	subi      	r3, 1
 14a:	b260      	st.w      	r3, (r2, 0)
}
 14c:	6c00      	or      	r0, r0
 14e:	6fa3      	mov      	sp, r8
 150:	d90e2000 	ld.w      	r8, (sp, 0)
 154:	1401      	addi      	sp, sp, 4
 156:	783c      	rts

00000158 <isr_ifc_irqhandler>:

ATTRIBUTE_WEAK void isr_ifc_irqhandler(void) {
 158:	1421      	subi      	sp, sp, 4
 15a:	dd0e2000 	st.w      	r8, (sp, 0)
 15e:	6e3b      	mov      	r8, sp
    H_IFC->ICR = 0xffffffff;
 160:	ea830151 	lrw      	r3, 0x20000004	// 6a4 <EXI4_IRQHandler+0x20>
 164:	9340      	ld.w      	r2, (r3, 0)
 166:	3300      	movi      	r3, 0
 168:	2b00      	subi      	r3, 1
 16a:	b269      	st.w      	r3, (r2, 0x24)
}
 16c:	6c00      	or      	r0, r0
 16e:	6fa3      	mov      	sp, r8
 170:	d90e2000 	ld.w      	r8, (sp, 0)
 174:	1401      	addi      	sp, sp, 4
 176:	783c      	rts

00000178 <isr_adc_irqhandler>:

ATTRIBUTE_WEAK void isr_adc_irqhandler(APT_ADC_Reg_t *handle) {
 178:	1421      	subi      	sp, sp, 4
 17a:	dd0e2000 	st.w      	r8, (sp, 0)
 17e:	6e3b      	mov      	r8, sp
 180:	1421      	subi      	sp, sp, 4
 182:	3300      	movi      	r3, 0
 184:	2b03      	subi      	r3, 4
 186:	60e0      	addu      	r3, r8
 188:	b300      	st.w      	r0, (r3, 0)
    handle->CSR = 0xffffffff;
 18a:	3300      	movi      	r3, 0
 18c:	2b03      	subi      	r3, 4
 18e:	60e0      	addu      	r3, r8
 190:	9340      	ld.w      	r2, (r3, 0)
 192:	3300      	movi      	r3, 0
 194:	2b00      	subi      	r3, 1
 196:	b267      	st.w      	r3, (r2, 0x1c)
}
 198:	6c00      	or      	r0, r0
 19a:	6fa3      	mov      	sp, r8
 19c:	d90e2000 	ld.w      	r8, (sp, 0)
 1a0:	1401      	addi      	sp, sp, 4
 1a2:	783c      	rts

000001a4 <isr_tc0_0_irqhandler>:

ATTRIBUTE_WEAK void isr_tc0_0_irqhandler(void) {
 1a4:	1421      	subi      	sp, sp, 4
 1a6:	dd0e2000 	st.w      	r8, (sp, 0)
 1aa:	6e3b      	mov      	r8, sp
    H_TC0->CH[0].CSR = 0xffffffff;
 1ac:	ea83013f 	lrw      	r3, 0x20000010	// 6a8 <EXI4_IRQHandler+0x24>
 1b0:	9340      	ld.w      	r2, (r3, 0)
 1b2:	3300      	movi      	r3, 0
 1b4:	2b00      	subi      	r3, 1
 1b6:	b27b      	st.w      	r3, (r2, 0x6c)
}
 1b8:	6c00      	or      	r0, r0
 1ba:	6fa3      	mov      	sp, r8
 1bc:	d90e2000 	ld.w      	r8, (sp, 0)
 1c0:	1401      	addi      	sp, sp, 4
 1c2:	783c      	rts

000001c4 <isr_tc0_1_irqhandler>:

ATTRIBUTE_WEAK void isr_tc0_1_irqhandler(void) {
 1c4:	1421      	subi      	sp, sp, 4
 1c6:	dd0e2000 	st.w      	r8, (sp, 0)
 1ca:	6e3b      	mov      	r8, sp
    H_TC0->CH[1].CSR = 0xffffffff;
 1cc:	ea830137 	lrw      	r3, 0x20000010	// 6a8 <EXI4_IRQHandler+0x24>
 1d0:	9360      	ld.w      	r3, (r3, 0)
 1d2:	ea820137 	lrw      	r2, 0x16c	// 6ac <EXI4_IRQHandler+0x28>
 1d6:	608c      	addu      	r2, r3
 1d8:	3300      	movi      	r3, 0
 1da:	2b00      	subi      	r3, 1
 1dc:	b260      	st.w      	r3, (r2, 0)
}
 1de:	6c00      	or      	r0, r0
 1e0:	6fa3      	mov      	sp, r8
 1e2:	d90e2000 	ld.w      	r8, (sp, 0)
 1e6:	1401      	addi      	sp, sp, 4
 1e8:	783c      	rts
	...

000001ec <isr_tc0_2_irqhandler>:

ATTRIBUTE_WEAK void isr_tc0_2_irqhandler(void) {
 1ec:	1421      	subi      	sp, sp, 4
 1ee:	dd0e2000 	st.w      	r8, (sp, 0)
 1f2:	6e3b      	mov      	r8, sp
    H_TC0->CH[2].CSR = 0xffffffff;
 1f4:	ea83012d 	lrw      	r3, 0x20000010	// 6a8 <EXI4_IRQHandler+0x24>
 1f8:	9360      	ld.w      	r3, (r3, 0)
 1fa:	ea82012e 	lrw      	r2, 0x26c	// 6b0 <EXI4_IRQHandler+0x2c>
 1fe:	608c      	addu      	r2, r3
 200:	3300      	movi      	r3, 0
 202:	2b00      	subi      	r3, 1
 204:	b260      	st.w      	r3, (r2, 0)
}
 206:	6c00      	or      	r0, r0
 208:	6fa3      	mov      	sp, r8
 20a:	d90e2000 	ld.w      	r8, (sp, 0)
 20e:	1401      	addi      	sp, sp, 4
 210:	783c      	rts
	...

00000214 <isr_tc1_irqhandler>:

ATTRIBUTE_WEAK void isr_tc1_irqhandler(void) {
 214:	1421      	subi      	sp, sp, 4
 216:	dd0e2000 	st.w      	r8, (sp, 0)
 21a:	6e3b      	mov      	r8, sp
    H_TC1->ICR = 0xffffffff;
 21c:	ea830126 	lrw      	r3, 0x20000014	// 6b4 <EXI4_IRQHandler+0x30>
 220:	9340      	ld.w      	r2, (r3, 0)
 222:	3300      	movi      	r3, 0
 224:	2b00      	subi      	r3, 1
 226:	b26a      	st.w      	r3, (r2, 0x28)
}
 228:	6c00      	or      	r0, r0
 22a:	6fa3      	mov      	sp, r8
 22c:	d90e2000 	ld.w      	r8, (sp, 0)
 230:	1401      	addi      	sp, sp, 4
 232:	783c      	rts

00000234 <isr_tc2_irqhandler>:

ATTRIBUTE_WEAK void isr_tc2_irqhandler(void) {
 234:	1421      	subi      	sp, sp, 4
 236:	dd0e2000 	st.w      	r8, (sp, 0)
 23a:	6e3b      	mov      	r8, sp
    H_TC2->ICR = 0xffffffff;
 23c:	ea83011f 	lrw      	r3, 0x20000018	// 6b8 <EXI4_IRQHandler+0x34>
 240:	9340      	ld.w      	r2, (r3, 0)
 242:	3300      	movi      	r3, 0
 244:	2b00      	subi      	r3, 1
 246:	b266      	st.w      	r3, (r2, 0x18)
}
 248:	6c00      	or      	r0, r0
 24a:	6fa3      	mov      	sp, r8
 24c:	d90e2000 	ld.w      	r8, (sp, 0)
 250:	1401      	addi      	sp, sp, 4
 252:	783c      	rts

00000254 <isr_tc3_irqhandler>:

ATTRIBUTE_WEAK void isr_tc3_irqhandler(void) {
 254:	1421      	subi      	sp, sp, 4
 256:	dd0e2000 	st.w      	r8, (sp, 0)
 25a:	6e3b      	mov      	r8, sp
    H_TC3->ICR = 0xffffffff;
 25c:	ea830118 	lrw      	r3, 0x2000001c	// 6bc <EXI4_IRQHandler+0x38>
 260:	9340      	ld.w      	r2, (r3, 0)
 262:	3300      	movi      	r3, 0
 264:	2b00      	subi      	r3, 1
 266:	b26a      	st.w      	r3, (r2, 0x28)
}
 268:	6c00      	or      	r0, r0
 26a:	6fa3      	mov      	sp, r8
 26c:	d90e2000 	ld.w      	r8, (sp, 0)
 270:	1401      	addi      	sp, sp, 4
 272:	783c      	rts

00000274 <isr_led_irqhandler>:

ATTRIBUTE_WEAK void isr_led_irqhandler(void) {
 274:	1421      	subi      	sp, sp, 4
 276:	dd0e2000 	st.w      	r8, (sp, 0)
 27a:	6e3b      	mov      	r8, sp
    H_LED->ICR = 0xffffffff;
 27c:	ea830111 	lrw      	r3, 0x20000034	// 6c0 <EXI4_IRQHandler+0x3c>
 280:	9340      	ld.w      	r2, (r3, 0)
 282:	3300      	movi      	r3, 0
 284:	2b00      	subi      	r3, 1
 286:	b265      	st.w      	r3, (r2, 0x14)
}
 288:	6c00      	or      	r0, r0
 28a:	6fa3      	mov      	sp, r8
 28c:	d90e2000 	ld.w      	r8, (sp, 0)
 290:	1401      	addi      	sp, sp, 4
 292:	783c      	rts

00000294 <isr_epwm_irqhandler>:

ATTRIBUTE_WEAK void isr_epwm_irqhandler(void) {
 294:	1421      	subi      	sp, sp, 4
 296:	dd0e2000 	st.w      	r8, (sp, 0)
 29a:	6e3b      	mov      	r8, sp
    H_EPWM->ICR = 0xffffffff;
 29c:	ea83010a 	lrw      	r3, 0x20000020	// 6c4 <EXI4_IRQHandler+0x40>
 2a0:	9360      	ld.w      	r3, (r3, 0)
 2a2:	23bb      	addi      	r3, 188
 2a4:	6c8f      	mov      	r2, r3
 2a6:	3300      	movi      	r3, 0
 2a8:	2b00      	subi      	r3, 1
 2aa:	b260      	st.w      	r3, (r2, 0)
}
 2ac:	6c00      	or      	r0, r0
 2ae:	6fa3      	mov      	sp, r8
 2b0:	d90e2000 	ld.w      	r8, (sp, 0)
 2b4:	1401      	addi      	sp, sp, 4
 2b6:	783c      	rts

000002b8 <isr_exi_irqhandler>:

ATTRIBUTE_WEAK void isr_exi_irqhandler(uint32_t exi_num)
{
 2b8:	1421      	subi      	sp, sp, 4
 2ba:	dd0e2000 	st.w      	r8, (sp, 0)
 2be:	6e3b      	mov      	r8, sp
 2c0:	1421      	subi      	sp, sp, 4
 2c2:	3300      	movi      	r3, 0
 2c4:	2b03      	subi      	r3, 4
 2c6:	60e0      	addu      	r3, r8
 2c8:	b300      	st.w      	r0, (r3, 0)
    H_SYSCON->EXICR = 0xffffffff;
 2ca:	0069      	lrw      	r3, 0x20000000	// 6a0 <EXI4_IRQHandler+0x1c>
 2cc:	9360      	ld.w      	r3, (r3, 0)
 2ce:	23ab      	addi      	r3, 172
 2d0:	6c8f      	mov      	r2, r3
 2d2:	3300      	movi      	r3, 0
 2d4:	2b00      	subi      	r3, 1
 2d6:	b260      	st.w      	r3, (r2, 0)
}
 2d8:	6c00      	or      	r0, r0
 2da:	6fa3      	mov      	sp, r8
 2dc:	d90e2000 	ld.w      	r8, (sp, 0)
 2e0:	1401      	addi      	sp, sp, 4
 2e2:	783c      	rts

000002e4 <isr_usart_irqhandler>:

ATTRIBUTE_WEAK void isr_usart_irqhandler(APT_USART_Reg_t *handle)
{
 2e4:	1421      	subi      	sp, sp, 4
 2e6:	dd0e2000 	st.w      	r8, (sp, 0)
 2ea:	6e3b      	mov      	r8, sp
 2ec:	1421      	subi      	sp, sp, 4
 2ee:	3300      	movi      	r3, 0
 2f0:	2b03      	subi      	r3, 4
 2f2:	60e0      	addu      	r3, r8
 2f4:	b300      	st.w      	r0, (r3, 0)
    handle->ICR = 0xffffffff;
 2f6:	3300      	movi      	r3, 0
 2f8:	2b03      	subi      	r3, 4
 2fa:	60e0      	addu      	r3, r8
 2fc:	9340      	ld.w      	r2, (r3, 0)
 2fe:	3300      	movi      	r3, 0
 300:	2b00      	subi      	r3, 1
 302:	b268      	st.w      	r3, (r2, 0x20)
}
 304:	6c00      	or      	r0, r0
 306:	6fa3      	mov      	sp, r8
 308:	d90e2000 	ld.w      	r8, (sp, 0)
 30c:	1401      	addi      	sp, sp, 4
 30e:	783c      	rts

00000310 <isr_uart_irqhandler>:

ATTRIBUTE_WEAK void isr_uart_irqhandler(APT_UART_Reg_t *handle)
{
 310:	1421      	subi      	sp, sp, 4
 312:	dd0e2000 	st.w      	r8, (sp, 0)
 316:	6e3b      	mov      	r8, sp
 318:	1421      	subi      	sp, sp, 4
 31a:	3300      	movi      	r3, 0
 31c:	2b03      	subi      	r3, 4
 31e:	60e0      	addu      	r3, r8
 320:	b300      	st.w      	r0, (r3, 0)
    handle->ISR = 0xffffffff;
 322:	3300      	movi      	r3, 0
 324:	2b03      	subi      	r3, 4
 326:	60e0      	addu      	r3, r8
 328:	9340      	ld.w      	r2, (r3, 0)
 32a:	3300      	movi      	r3, 0
 32c:	2b00      	subi      	r3, 1
 32e:	b263      	st.w      	r3, (r2, 0xc)
}
 330:	6c00      	or      	r0, r0
 332:	6fa3      	mov      	sp, r8
 334:	d90e2000 	ld.w      	r8, (sp, 0)
 338:	1401      	addi      	sp, sp, 4
 33a:	783c      	rts

0000033c <isr_i2c_irqhandler>:

ATTRIBUTE_WEAK void isr_i2c_irqhandler(APT_I2C_Reg_t *handle)
{
 33c:	1421      	subi      	sp, sp, 4
 33e:	dd0e2000 	st.w      	r8, (sp, 0)
 342:	6e3b      	mov      	r8, sp
 344:	1421      	subi      	sp, sp, 4
 346:	3300      	movi      	r3, 0
 348:	2b03      	subi      	r3, 4
 34a:	60e0      	addu      	r3, r8
 34c:	b300      	st.w      	r0, (r3, 0)
    handle->CR &= ~(0x1ul<<4);
 34e:	3300      	movi      	r3, 0
 350:	2b03      	subi      	r3, 4
 352:	60e0      	addu      	r3, r8
 354:	9360      	ld.w      	r3, (r3, 0)
 356:	9378      	ld.w      	r3, (r3, 0x60)
 358:	3b84      	bclri      	r3, r3, 4
 35a:	6c8f      	mov      	r2, r3
 35c:	3300      	movi      	r3, 0
 35e:	2b03      	subi      	r3, 4
 360:	60e0      	addu      	r3, r8
 362:	9360      	ld.w      	r3, (r3, 0)
 364:	b358      	st.w      	r2, (r3, 0x60)
}
 366:	6c00      	or      	r0, r0
 368:	6fa3      	mov      	sp, r8
 36a:	d90e2000 	ld.w      	r8, (sp, 0)
 36e:	1401      	addi      	sp, sp, 4
 370:	783c      	rts
	...

00000374 <isr_spi_irqhandler>:

ATTRIBUTE_WEAK void isr_spi_irqhandler(APT_SPI_Reg_t *handle)
{
 374:	1421      	subi      	sp, sp, 4
 376:	dd0e2000 	st.w      	r8, (sp, 0)
 37a:	6e3b      	mov      	r8, sp
 37c:	1421      	subi      	sp, sp, 4
 37e:	3300      	movi      	r3, 0
 380:	2b03      	subi      	r3, 4
 382:	60e0      	addu      	r3, r8
 384:	b300      	st.w      	r0, (r3, 0)
    handle->ICR = 0xffffffff;
 386:	3300      	movi      	r3, 0
 388:	2b03      	subi      	r3, 4
 38a:	60e0      	addu      	r3, r8
 38c:	9340      	ld.w      	r2, (r3, 0)
 38e:	3300      	movi      	r3, 0
 390:	2b00      	subi      	r3, 1
 392:	b268      	st.w      	r3, (r2, 0x20)
}
 394:	6c00      	or      	r0, r0
 396:	6fa3      	mov      	sp, r8
 398:	d90e2000 	ld.w      	r8, (sp, 0)
 39c:	1401      	addi      	sp, sp, 4
 39e:	783c      	rts

000003a0 <isr_tkey_irqhandler>:

ATTRIBUTE_WEAK void isr_tkey_irqhandler(void)
{
 3a0:	1421      	subi      	sp, sp, 4
 3a2:	dd0e2000 	st.w      	r8, (sp, 0)
 3a6:	6e3b      	mov      	r8, sp
    H_TKEY->ICR = 0xffffffff;
 3a8:	0177      	lrw      	r3, 0x20000008	// 6c8 <EXI4_IRQHandler+0x44>
 3aa:	9340      	ld.w      	r2, (r3, 0)
 3ac:	3300      	movi      	r3, 0
 3ae:	2b00      	subi      	r3, 1
 3b0:	b27a      	st.w      	r3, (r2, 0x68)
}
 3b2:	6c00      	or      	r0, r0
 3b4:	6fa3      	mov      	sp, r8
 3b6:	d90e2000 	ld.w      	r8, (sp, 0)
 3ba:	1401      	addi      	sp, sp, 4
 3bc:	783c      	rts
	...

000003c0 <isr_comp0_irqhandler>:

ATTRIBUTE_WEAK void isr_comp0_irqhandler(void)
{
 3c0:	1421      	subi      	sp, sp, 4
 3c2:	dd0e2000 	st.w      	r8, (sp, 0)
 3c6:	6e3b      	mov      	r8, sp
    H_CMP->ICR = 0xffffffff;
 3c8:	017e      	lrw      	r3, 0x20000038	// 6cc <EXI4_IRQHandler+0x48>
 3ca:	9340      	ld.w      	r2, (r3, 0)
 3cc:	3300      	movi      	r3, 0
 3ce:	2b00      	subi      	r3, 1
 3d0:	b277      	st.w      	r3, (r2, 0x5c)
}
 3d2:	6c00      	or      	r0, r0
 3d4:	6fa3      	mov      	sp, r8
 3d6:	d90e2000 	ld.w      	r8, (sp, 0)
 3da:	1401      	addi      	sp, sp, 4
 3dc:	783c      	rts
	...

000003e0 <isr_comp1_irqhandler>:

ATTRIBUTE_WEAK void isr_comp1_irqhandler(void)
{
 3e0:	1421      	subi      	sp, sp, 4
 3e2:	dd0e2000 	st.w      	r8, (sp, 0)
 3e6:	6e3b      	mov      	r8, sp
    H_CMP->ICR = 0xffffffff;
 3e8:	0266      	lrw      	r3, 0x20000038	// 6cc <EXI4_IRQHandler+0x48>
 3ea:	9340      	ld.w      	r2, (r3, 0)
 3ec:	3300      	movi      	r3, 0
 3ee:	2b00      	subi      	r3, 1
 3f0:	b277      	st.w      	r3, (r2, 0x5c)
}
 3f2:	6c00      	or      	r0, r0
 3f4:	6fa3      	mov      	sp, r8
 3f6:	d90e2000 	ld.w      	r8, (sp, 0)
 3fa:	1401      	addi      	sp, sp, 4
 3fc:	783c      	rts
	...

00000400 <CORET_IRQHandler>:




ATTRIBUTE_ISR void CORET_IRQHandler(void)
{
 400:	1460      	nie
 402:	1462      	ipush
 404:	1422      	subi      	sp, sp, 8
 406:	dd0e2000 	st.w      	r8, (sp, 0)
 40a:	ddee2001 	st.w      	r15, (sp, 0x4)
 40e:	6e3b      	mov      	r8, sp
    
    #ifndef CONFIG_KERNEL_FREERTOS
        CSI_INTRPT_EXIT();
    #endif
#else
    ck_coret_irqhandler();
 410:	e3fffe7e 	bsr      	0x10c	// 10c <ck_coret_irqhandler>
#endif
}
 414:	6c00      	or      	r0, r0
 416:	6fa3      	mov      	sp, r8
 418:	d9ee2001 	ld.w      	r15, (sp, 0x4)
 41c:	d90e2000 	ld.w      	r8, (sp, 0)
 420:	1402      	addi      	sp, sp, 8
 422:	1463      	ipop
 424:	1461      	nir
	...

00000428 <SYSCON_IRQHandler>:

ATTRIBUTE_ISR void SYSCON_IRQHandler(void)
{
 428:	1460      	nie
 42a:	1462      	ipush
 42c:	1422      	subi      	sp, sp, 8
 42e:	dd0e2000 	st.w      	r8, (sp, 0)
 432:	ddee2001 	st.w      	r15, (sp, 0x4)
 436:	6e3b      	mov      	r8, sp
    CSI_INTRPT_ENTER();
    isr_syscon_irqhandler();
 438:	e3fffe7e 	bsr      	0x134	// 134 <isr_syscon_irqhandler>
    CSI_INTRPT_EXIT();
}
 43c:	6c00      	or      	r0, r0
 43e:	6fa3      	mov      	sp, r8
 440:	d9ee2001 	ld.w      	r15, (sp, 0x4)
 444:	d90e2000 	ld.w      	r8, (sp, 0)
 448:	1402      	addi      	sp, sp, 8
 44a:	1463      	ipop
 44c:	1461      	nir
	...

00000450 <IFC_IRQHandler>:

ATTRIBUTE_ISR void IFC_IRQHandler(void)
{
 450:	1460      	nie
 452:	1462      	ipush
 454:	1422      	subi      	sp, sp, 8
 456:	dd0e2000 	st.w      	r8, (sp, 0)
 45a:	ddee2001 	st.w      	r15, (sp, 0x4)
 45e:	6e3b      	mov      	r8, sp
    CSI_INTRPT_ENTER();
    isr_ifc_irqhandler();
 460:	e3fffe7c 	bsr      	0x158	// 158 <isr_ifc_irqhandler>
    CSI_INTRPT_EXIT();
}
 464:	6c00      	or      	r0, r0
 466:	6fa3      	mov      	sp, r8
 468:	d9ee2001 	ld.w      	r15, (sp, 0x4)
 46c:	d90e2000 	ld.w      	r8, (sp, 0)
 470:	1402      	addi      	sp, sp, 8
 472:	1463      	ipop
 474:	1461      	nir
	...

00000478 <ADC_IRQHandler>:

ATTRIBUTE_ISR void ADC_IRQHandler(void)
{
 478:	1460      	nie
 47a:	1462      	ipush
 47c:	1422      	subi      	sp, sp, 8
 47e:	dd0e2000 	st.w      	r8, (sp, 0)
 482:	ddee2001 	st.w      	r15, (sp, 0x4)
 486:	6e3b      	mov      	r8, sp
    CSI_INTRPT_ENTER();
    isr_adc_irqhandler(H_ADC);
 488:	036d      	lrw      	r3, 0x2000000c	// 6d0 <EXI4_IRQHandler+0x4c>
 48a:	9360      	ld.w      	r3, (r3, 0)
 48c:	6c0f      	mov      	r0, r3
 48e:	e3fffe75 	bsr      	0x178	// 178 <isr_adc_irqhandler>
    CSI_INTRPT_EXIT();
}
 492:	6c00      	or      	r0, r0
 494:	6fa3      	mov      	sp, r8
 496:	d9ee2001 	ld.w      	r15, (sp, 0x4)
 49a:	d90e2000 	ld.w      	r8, (sp, 0)
 49e:	1402      	addi      	sp, sp, 8
 4a0:	1463      	ipop
 4a2:	1461      	nir

000004a4 <TC0_0_IRQHandler>:

ATTRIBUTE_ISR void TC0_0_IRQHandler(void)
{
 4a4:	1460      	nie
 4a6:	1462      	ipush
 4a8:	1422      	subi      	sp, sp, 8
 4aa:	dd0e2000 	st.w      	r8, (sp, 0)
 4ae:	ddee2001 	st.w      	r15, (sp, 0x4)
 4b2:	6e3b      	mov      	r8, sp
    CSI_INTRPT_ENTER();
    isr_tc0_0_irqhandler();
 4b4:	e3fffe78 	bsr      	0x1a4	// 1a4 <isr_tc0_0_irqhandler>
    CSI_INTRPT_EXIT();
}
 4b8:	6c00      	or      	r0, r0
 4ba:	6fa3      	mov      	sp, r8
 4bc:	d9ee2001 	ld.w      	r15, (sp, 0x4)
 4c0:	d90e2000 	ld.w      	r8, (sp, 0)
 4c4:	1402      	addi      	sp, sp, 8
 4c6:	1463      	ipop
 4c8:	1461      	nir
	...

000004cc <TC0_1_IRQHandler>:

ATTRIBUTE_ISR void TC0_1_IRQHandler(void)
{
 4cc:	1460      	nie
 4ce:	1462      	ipush
 4d0:	1422      	subi      	sp, sp, 8
 4d2:	dd0e2000 	st.w      	r8, (sp, 0)
 4d6:	ddee2001 	st.w      	r15, (sp, 0x4)
 4da:	6e3b      	mov      	r8, sp
    CSI_INTRPT_ENTER();
    isr_tc0_1_irqhandler();
 4dc:	e3fffe74 	bsr      	0x1c4	// 1c4 <isr_tc0_1_irqhandler>
    CSI_INTRPT_EXIT();
}
 4e0:	6c00      	or      	r0, r0
 4e2:	6fa3      	mov      	sp, r8
 4e4:	d9ee2001 	ld.w      	r15, (sp, 0x4)
 4e8:	d90e2000 	ld.w      	r8, (sp, 0)
 4ec:	1402      	addi      	sp, sp, 8
 4ee:	1463      	ipop
 4f0:	1461      	nir
	...

000004f4 <TC0_2_IRQHandler>:

ATTRIBUTE_ISR void TC0_2_IRQHandler(void)
{
 4f4:	1460      	nie
 4f6:	1462      	ipush
 4f8:	1422      	subi      	sp, sp, 8
 4fa:	dd0e2000 	st.w      	r8, (sp, 0)
 4fe:	ddee2001 	st.w      	r15, (sp, 0x4)
 502:	6e3b      	mov      	r8, sp
    CSI_INTRPT_ENTER();
    isr_tc0_2_irqhandler();
 504:	e3fffe74 	bsr      	0x1ec	// 1ec <isr_tc0_2_irqhandler>
    CSI_INTRPT_EXIT();
}
 508:	6c00      	or      	r0, r0
 50a:	6fa3      	mov      	sp, r8
 50c:	d9ee2001 	ld.w      	r15, (sp, 0x4)
 510:	d90e2000 	ld.w      	r8, (sp, 0)
 514:	1402      	addi      	sp, sp, 8
 516:	1463      	ipop
 518:	1461      	nir
	...

0000051c <TC1_IRQHandler>:

ATTRIBUTE_ISR void TC1_IRQHandler(void)
{
 51c:	1460      	nie
 51e:	1462      	ipush
 520:	1422      	subi      	sp, sp, 8
 522:	dd0e2000 	st.w      	r8, (sp, 0)
 526:	ddee2001 	st.w      	r15, (sp, 0x4)
 52a:	6e3b      	mov      	r8, sp
    CSI_INTRPT_ENTER();
    isr_tc1_irqhandler();
 52c:	e3fffe74 	bsr      	0x214	// 214 <isr_tc1_irqhandler>
    CSI_INTRPT_EXIT();
}
 530:	6c00      	or      	r0, r0
 532:	6fa3      	mov      	sp, r8
 534:	d9ee2001 	ld.w      	r15, (sp, 0x4)
 538:	d90e2000 	ld.w      	r8, (sp, 0)
 53c:	1402      	addi      	sp, sp, 8
 53e:	1463      	ipop
 540:	1461      	nir
	...

00000544 <TC2_IRQHandler>:

ATTRIBUTE_ISR void TC2_IRQHandler(void)
{
 544:	1460      	nie
 546:	1462      	ipush
 548:	1422      	subi      	sp, sp, 8
 54a:	dd0e2000 	st.w      	r8, (sp, 0)
 54e:	ddee2001 	st.w      	r15, (sp, 0x4)
 552:	6e3b      	mov      	r8, sp
    CSI_INTRPT_ENTER();
    isr_tc2_irqhandler();
 554:	e3fffe70 	bsr      	0x234	// 234 <isr_tc2_irqhandler>
    CSI_INTRPT_EXIT();
}
 558:	6c00      	or      	r0, r0
 55a:	6fa3      	mov      	sp, r8
 55c:	d9ee2001 	ld.w      	r15, (sp, 0x4)
 560:	d90e2000 	ld.w      	r8, (sp, 0)
 564:	1402      	addi      	sp, sp, 8
 566:	1463      	ipop
 568:	1461      	nir
	...

0000056c <TC3_IRQHandler>:

ATTRIBUTE_ISR void TC3_IRQHandler(void)
{
 56c:	1460      	nie
 56e:	1462      	ipush
 570:	1422      	subi      	sp, sp, 8
 572:	dd0e2000 	st.w      	r8, (sp, 0)
 576:	ddee2001 	st.w      	r15, (sp, 0x4)
 57a:	6e3b      	mov      	r8, sp
    CSI_INTRPT_ENTER();
    isr_tc3_irqhandler();
 57c:	e3fffe6c 	bsr      	0x254	// 254 <isr_tc3_irqhandler>
    CSI_INTRPT_EXIT();
}
 580:	6c00      	or      	r0, r0
 582:	6fa3      	mov      	sp, r8
 584:	d9ee2001 	ld.w      	r15, (sp, 0x4)
 588:	d90e2000 	ld.w      	r8, (sp, 0)
 58c:	1402      	addi      	sp, sp, 8
 58e:	1463      	ipop
 590:	1461      	nir
	...

00000594 <LED_IRQHandler>:

ATTRIBUTE_ISR void LED_IRQHandler(void)
{
 594:	1460      	nie
 596:	1462      	ipush
 598:	1422      	subi      	sp, sp, 8
 59a:	dd0e2000 	st.w      	r8, (sp, 0)
 59e:	ddee2001 	st.w      	r15, (sp, 0x4)
 5a2:	6e3b      	mov      	r8, sp
    CSI_INTRPT_ENTER();
    isr_led_irqhandler();
 5a4:	e3fffe68 	bsr      	0x274	// 274 <isr_led_irqhandler>
    CSI_INTRPT_EXIT();
}
 5a8:	6c00      	or      	r0, r0
 5aa:	6fa3      	mov      	sp, r8
 5ac:	d9ee2001 	ld.w      	r15, (sp, 0x4)
 5b0:	d90e2000 	ld.w      	r8, (sp, 0)
 5b4:	1402      	addi      	sp, sp, 8
 5b6:	1463      	ipop
 5b8:	1461      	nir
	...

000005bc <EPWM_IRQHandler>:

ATTRIBUTE_ISR void EPWM_IRQHandler(void)
{
 5bc:	1460      	nie
 5be:	1462      	ipush
 5c0:	1422      	subi      	sp, sp, 8
 5c2:	dd0e2000 	st.w      	r8, (sp, 0)
 5c6:	ddee2001 	st.w      	r15, (sp, 0x4)
 5ca:	6e3b      	mov      	r8, sp
    CSI_INTRPT_ENTER();
    isr_epwm_irqhandler();
 5cc:	e3fffe64 	bsr      	0x294	// 294 <isr_epwm_irqhandler>
    CSI_INTRPT_EXIT();
}
 5d0:	6c00      	or      	r0, r0
 5d2:	6fa3      	mov      	sp, r8
 5d4:	d9ee2001 	ld.w      	r15, (sp, 0x4)
 5d8:	d90e2000 	ld.w      	r8, (sp, 0)
 5dc:	1402      	addi      	sp, sp, 8
 5de:	1463      	ipop
 5e0:	1461      	nir
	...

000005e4 <EXI0_IRQHandler>:

ATTRIBUTE_ISR void EXI0_IRQHandler(void)
{
 5e4:	1460      	nie
 5e6:	1462      	ipush
 5e8:	1422      	subi      	sp, sp, 8
 5ea:	dd0e2000 	st.w      	r8, (sp, 0)
 5ee:	ddee2001 	st.w      	r15, (sp, 0x4)
 5f2:	6e3b      	mov      	r8, sp
    CSI_INTRPT_ENTER();
    isr_exi_irqhandler(0);
 5f4:	3000      	movi      	r0, 0
 5f6:	e3fffe61 	bsr      	0x2b8	// 2b8 <isr_exi_irqhandler>
    CSI_INTRPT_EXIT();
}
 5fa:	6c00      	or      	r0, r0
 5fc:	6fa3      	mov      	sp, r8
 5fe:	d9ee2001 	ld.w      	r15, (sp, 0x4)
 602:	d90e2000 	ld.w      	r8, (sp, 0)
 606:	1402      	addi      	sp, sp, 8
 608:	1463      	ipop
 60a:	1461      	nir

0000060c <EXI1_IRQHandler>:

ATTRIBUTE_ISR void EXI1_IRQHandler(void)
{
 60c:	1460      	nie
 60e:	1462      	ipush
 610:	1422      	subi      	sp, sp, 8
 612:	dd0e2000 	st.w      	r8, (sp, 0)
 616:	ddee2001 	st.w      	r15, (sp, 0x4)
 61a:	6e3b      	mov      	r8, sp
    CSI_INTRPT_ENTER();
    isr_exi_irqhandler(1);
 61c:	3001      	movi      	r0, 1
 61e:	e3fffe4d 	bsr      	0x2b8	// 2b8 <isr_exi_irqhandler>
    CSI_INTRPT_EXIT();
}
 622:	6c00      	or      	r0, r0
 624:	6fa3      	mov      	sp, r8
 626:	d9ee2001 	ld.w      	r15, (sp, 0x4)
 62a:	d90e2000 	ld.w      	r8, (sp, 0)
 62e:	1402      	addi      	sp, sp, 8
 630:	1463      	ipop
 632:	1461      	nir

00000634 <EXI2_IRQHandler>:

ATTRIBUTE_ISR void EXI2_IRQHandler(void)
{
 634:	1460      	nie
 636:	1462      	ipush
 638:	1422      	subi      	sp, sp, 8
 63a:	dd0e2000 	st.w      	r8, (sp, 0)
 63e:	ddee2001 	st.w      	r15, (sp, 0x4)
 642:	6e3b      	mov      	r8, sp
    CSI_INTRPT_ENTER();
    isr_exi_irqhandler(2);
 644:	3002      	movi      	r0, 2
 646:	e3fffe39 	bsr      	0x2b8	// 2b8 <isr_exi_irqhandler>
    CSI_INTRPT_EXIT();
}
 64a:	6c00      	or      	r0, r0
 64c:	6fa3      	mov      	sp, r8
 64e:	d9ee2001 	ld.w      	r15, (sp, 0x4)
 652:	d90e2000 	ld.w      	r8, (sp, 0)
 656:	1402      	addi      	sp, sp, 8
 658:	1463      	ipop
 65a:	1461      	nir

0000065c <EXI3_IRQHandler>:

ATTRIBUTE_ISR void EXI3_IRQHandler(void)
{
 65c:	1460      	nie
 65e:	1462      	ipush
 660:	1422      	subi      	sp, sp, 8
 662:	dd0e2000 	st.w      	r8, (sp, 0)
 666:	ddee2001 	st.w      	r15, (sp, 0x4)
 66a:	6e3b      	mov      	r8, sp
    CSI_INTRPT_ENTER();
    isr_exi_irqhandler(3);
 66c:	3003      	movi      	r0, 3
 66e:	e3fffe25 	bsr      	0x2b8	// 2b8 <isr_exi_irqhandler>
    CSI_INTRPT_EXIT();
}
 672:	6c00      	or      	r0, r0
 674:	6fa3      	mov      	sp, r8
 676:	d9ee2001 	ld.w      	r15, (sp, 0x4)
 67a:	d90e2000 	ld.w      	r8, (sp, 0)
 67e:	1402      	addi      	sp, sp, 8
 680:	1463      	ipop
 682:	1461      	nir

00000684 <EXI4_IRQHandler>:

ATTRIBUTE_ISR void EXI4_IRQHandler(void)
{
 684:	1460      	nie
 686:	1462      	ipush
 688:	1422      	subi      	sp, sp, 8
 68a:	dd0e2000 	st.w      	r8, (sp, 0)
 68e:	ddee2001 	st.w      	r15, (sp, 0x4)
 692:	6e3b      	mov      	r8, sp
    CSI_INTRPT_ENTER();
    isr_exi_irqhandler(4);
 694:	3004      	movi      	r0, 4
 696:	e3fffe11 	bsr      	0x2b8	// 2b8 <isr_exi_irqhandler>
    CSI_INTRPT_EXIT();
}
 69a:	6c00      	or      	r0, r0
 69c:	6fa3      	mov      	sp, r8
 69e:	041b      	br      	0x6d4	// 6d4 <EXI4_IRQHandler+0x50>
 6a0:	20000000 	.long	0x20000000
 6a4:	20000004 	.long	0x20000004
 6a8:	20000010 	.long	0x20000010
 6ac:	0000016c 	.long	0x0000016c
 6b0:	0000026c 	.long	0x0000026c
 6b4:	20000014 	.long	0x20000014
 6b8:	20000018 	.long	0x20000018
 6bc:	2000001c 	.long	0x2000001c
 6c0:	20000034 	.long	0x20000034
 6c4:	20000020 	.long	0x20000020
 6c8:	20000008 	.long	0x20000008
 6cc:	20000038 	.long	0x20000038
 6d0:	2000000c 	.long	0x2000000c
 6d4:	d9ee2001 	ld.w      	r15, (sp, 0x4)
 6d8:	d90e2000 	ld.w      	r8, (sp, 0)
 6dc:	1402      	addi      	sp, sp, 8
 6de:	1463      	ipop
 6e0:	1461      	nir
	...

000006e4 <UART0_IRQHandler>:

ATTRIBUTE_ISR void UART0_IRQHandler(void)
{
 6e4:	1460      	nie
 6e6:	1462      	ipush
 6e8:	1422      	subi      	sp, sp, 8
 6ea:	dd0e2000 	st.w      	r8, (sp, 0)
 6ee:	ddee2001 	st.w      	r15, (sp, 0x4)
 6f2:	6e3b      	mov      	r8, sp
    CSI_INTRPT_ENTER();
    isr_usart_irqhandler(H_UART0);
 6f4:	1266      	lrw      	r3, 0x2000002c	// 80c <CMP1_IRQHandler+0x28>
 6f6:	9360      	ld.w      	r3, (r3, 0)
 6f8:	6c0f      	mov      	r0, r3
 6fa:	e3fffdf5 	bsr      	0x2e4	// 2e4 <isr_usart_irqhandler>
    CSI_INTRPT_EXIT();
}
 6fe:	6c00      	or      	r0, r0
 700:	6fa3      	mov      	sp, r8
 702:	d9ee2001 	ld.w      	r15, (sp, 0x4)
 706:	d90e2000 	ld.w      	r8, (sp, 0)
 70a:	1402      	addi      	sp, sp, 8
 70c:	1463      	ipop
 70e:	1461      	nir

00000710 <UART1_IRQHandler>:

ATTRIBUTE_ISR void UART1_IRQHandler(void)
{
 710:	1460      	nie
 712:	1462      	ipush
 714:	1422      	subi      	sp, sp, 8
 716:	dd0e2000 	st.w      	r8, (sp, 0)
 71a:	ddee2001 	st.w      	r15, (sp, 0x4)
 71e:	6e3b      	mov      	r8, sp
    CSI_INTRPT_ENTER();
    isr_uart_irqhandler(H_UART1);
 720:	117c      	lrw      	r3, 0x20000030	// 810 <CMP1_IRQHandler+0x2c>
 722:	9360      	ld.w      	r3, (r3, 0)
 724:	6c0f      	mov      	r0, r3
 726:	e3fffdf5 	bsr      	0x310	// 310 <isr_uart_irqhandler>
    CSI_INTRPT_EXIT();
}
 72a:	6c00      	or      	r0, r0
 72c:	6fa3      	mov      	sp, r8
 72e:	d9ee2001 	ld.w      	r15, (sp, 0x4)
 732:	d90e2000 	ld.w      	r8, (sp, 0)
 736:	1402      	addi      	sp, sp, 8
 738:	1463      	ipop
 73a:	1461      	nir

0000073c <I2C0_IRQHandler>:

ATTRIBUTE_ISR void I2C0_IRQHandler(void)
{
 73c:	1460      	nie
 73e:	1462      	ipush
 740:	1422      	subi      	sp, sp, 8
 742:	dd0e2000 	st.w      	r8, (sp, 0)
 746:	ddee2001 	st.w      	r15, (sp, 0x4)
 74a:	6e3b      	mov      	r8, sp
    CSI_INTRPT_ENTER();
    isr_i2c_irqhandler(H_I2C);
 74c:	1172      	lrw      	r3, 0x20000024	// 814 <CMP1_IRQHandler+0x30>
 74e:	9360      	ld.w      	r3, (r3, 0)
 750:	6c0f      	mov      	r0, r3
 752:	e3fffdf5 	bsr      	0x33c	// 33c <isr_i2c_irqhandler>
    CSI_INTRPT_EXIT();
}
 756:	6c00      	or      	r0, r0
 758:	6fa3      	mov      	sp, r8
 75a:	d9ee2001 	ld.w      	r15, (sp, 0x4)
 75e:	d90e2000 	ld.w      	r8, (sp, 0)
 762:	1402      	addi      	sp, sp, 8
 764:	1463      	ipop
 766:	1461      	nir

00000768 <SPI0_IRQHandler>:

ATTRIBUTE_ISR void SPI0_IRQHandler(void)
{
 768:	1460      	nie
 76a:	1462      	ipush
 76c:	1422      	subi      	sp, sp, 8
 76e:	dd0e2000 	st.w      	r8, (sp, 0)
 772:	ddee2001 	st.w      	r15, (sp, 0x4)
 776:	6e3b      	mov      	r8, sp
    CSI_INTRPT_ENTER();
    isr_spi_irqhandler(H_SPI);
 778:	1168      	lrw      	r3, 0x20000028	// 818 <CMP1_IRQHandler+0x34>
 77a:	9360      	ld.w      	r3, (r3, 0)
 77c:	6c0f      	mov      	r0, r3
 77e:	e3fffdfb 	bsr      	0x374	// 374 <isr_spi_irqhandler>
    CSI_INTRPT_EXIT();
}
 782:	6c00      	or      	r0, r0
 784:	6fa3      	mov      	sp, r8
 786:	d9ee2001 	ld.w      	r15, (sp, 0x4)
 78a:	d90e2000 	ld.w      	r8, (sp, 0)
 78e:	1402      	addi      	sp, sp, 8
 790:	1463      	ipop
 792:	1461      	nir

00000794 <TKEY_IRQHandler>:

ATTRIBUTE_ISR void TKEY_IRQHandler(void)
{
 794:	1460      	nie
 796:	1462      	ipush
 798:	1422      	subi      	sp, sp, 8
 79a:	dd0e2000 	st.w      	r8, (sp, 0)
 79e:	ddee2001 	st.w      	r15, (sp, 0x4)
 7a2:	6e3b      	mov      	r8, sp
    CSI_INTRPT_ENTER();
    isr_tkey_irqhandler();
 7a4:	e3fffdfe 	bsr      	0x3a0	// 3a0 <isr_tkey_irqhandler>
    CSI_INTRPT_EXIT();
}
 7a8:	6c00      	or      	r0, r0
 7aa:	6fa3      	mov      	sp, r8
 7ac:	d9ee2001 	ld.w      	r15, (sp, 0x4)
 7b0:	d90e2000 	ld.w      	r8, (sp, 0)
 7b4:	1402      	addi      	sp, sp, 8
 7b6:	1463      	ipop
 7b8:	1461      	nir
	...

000007bc <CMP0_IRQHandler>:

ATTRIBUTE_ISR void CMP0_IRQHandler(void)
{
 7bc:	1460      	nie
 7be:	1462      	ipush
 7c0:	1422      	subi      	sp, sp, 8
 7c2:	dd0e2000 	st.w      	r8, (sp, 0)
 7c6:	ddee2001 	st.w      	r15, (sp, 0x4)
 7ca:	6e3b      	mov      	r8, sp
    CSI_INTRPT_ENTER();
    isr_comp0_irqhandler();
 7cc:	e3fffdfa 	bsr      	0x3c0	// 3c0 <isr_comp0_irqhandler>
    CSI_INTRPT_EXIT();
}
 7d0:	6c00      	or      	r0, r0
 7d2:	6fa3      	mov      	sp, r8
 7d4:	d9ee2001 	ld.w      	r15, (sp, 0x4)
 7d8:	d90e2000 	ld.w      	r8, (sp, 0)
 7dc:	1402      	addi      	sp, sp, 8
 7de:	1463      	ipop
 7e0:	1461      	nir
	...

000007e4 <CMP1_IRQHandler>:

ATTRIBUTE_ISR void CMP1_IRQHandler(void)
{
 7e4:	1460      	nie
 7e6:	1462      	ipush
 7e8:	1422      	subi      	sp, sp, 8
 7ea:	dd0e2000 	st.w      	r8, (sp, 0)
 7ee:	ddee2001 	st.w      	r15, (sp, 0x4)
 7f2:	6e3b      	mov      	r8, sp
    CSI_INTRPT_ENTER();
    isr_comp1_irqhandler();
 7f4:	e3fffdf6 	bsr      	0x3e0	// 3e0 <isr_comp1_irqhandler>
    CSI_INTRPT_EXIT();
}
 7f8:	6c00      	or      	r0, r0
 7fa:	6fa3      	mov      	sp, r8
 7fc:	d9ee2001 	ld.w      	r15, (sp, 0x4)
 800:	d90e2000 	ld.w      	r8, (sp, 0)
 804:	1402      	addi      	sp, sp, 8
 806:	1463      	ipop
 808:	1461      	nir
 80a:	0000      	bkpt
 80c:	2000002c 	.long	0x2000002c
 810:	20000030 	.long	0x20000030
 814:	20000024 	.long	0x20000024
 818:	20000028 	.long	0x20000028
 81c:	00000000 	.long	0x00000000

00000820 <Reset_Handler>:
	.type	Reset_Handler, %function
Reset_Handler:
    /* under normal circumstances,  it should not be opened */

#ifndef CONFIG_SYSTEM_SECURE
    lrw   r0, 0x80000000
 820:	1015      	lrw      	r0, 0x80000000	// 874 <__exit+0x2>
    mtcr  r0, psr
 822:	c0006420 	mtcr      	r0, cr<0, 0>
#endif

/* Initialize the normal stack pointer from the linker definition. */
    lrw a1, __StackTop
 826:	1035      	lrw      	r1, 0x20001800	// 878 <__exit+0x6>
    mov sp, a1
 828:	6f87      	mov      	sp, r1
 *    __data_start__: VMA of start of the section to copy to
 *    __data_end__: VMA of end of the section to copy to
 *
 *  All addresses must be aligned to 4 bytes boundary.
 */
	lrw	r1, __erodata
 82a:	1035      	lrw      	r1, 0x9d0	// 87c <__exit+0xa>
	lrw	r2, __data_start__
 82c:	1055      	lrw      	r2, 0x20000000	// 880 <__exit+0xe>
	lrw	r3, __data_end__
 82e:	1076      	lrw      	r3, 0x20000044	// 884 <__exit+0x12>

	subu	r3, r2
 830:	60ca      	subu      	r3, r2
	cmpnei	r3, 0
 832:	3b40      	cmpnei      	r3, 0
	bf	.L_loop0_done
 834:	0c08      	bf      	0x844	// 844 <Reset_Handler+0x24>

.L_loop0:
	ldw	r0, (r1, 0)
 836:	9100      	ld.w      	r0, (r1, 0)
	stw	r0, (r2, 0)
 838:	b200      	st.w      	r0, (r2, 0)
	addi	r1, 4
 83a:	2103      	addi      	r1, 4
	addi	r2, 4
 83c:	2203      	addi      	r2, 4
	subi	r3, 4
 83e:	2b03      	subi      	r3, 4
	cmpnei	r3, 0
 840:	3b40      	cmpnei      	r3, 0
	bt	.L_loop0
 842:	0bfa      	bt      	0x836	// 836 <Reset_Handler+0x16>
 *    __bss_start__: start of the BSS section.
 *    __bss_end__: end of the BSS section.
 *
 *  Both addresses must be aligned to 4 bytes boundary.
 */
	lrw	r1, __bss_start__
 844:	1031      	lrw      	r1, 0x20000044	// 888 <__exit+0x16>
	lrw	r2, __bss_end__
 846:	1052      	lrw      	r2, 0x20000444	// 88c <__exit+0x1a>

	movi	r0, 0
 848:	3000      	movi      	r0, 0

	subu	r2, r1
 84a:	6086      	subu      	r2, r1
	cmpnei	r2, 0
 84c:	3a40      	cmpnei      	r2, 0
	bf	.L_loop1_done
 84e:	0c06      	bf      	0x85a	// 85a <Reset_Handler+0x3a>

.L_loop1:
	stw	r0, (r1, 0)
 850:	b100      	st.w      	r0, (r1, 0)
	addi	r1, 4
 852:	2103      	addi      	r1, 4
	subi	r2, 4
 854:	2a03      	subi      	r2, 4
	cmpnei	r2, 0
 856:	3a40      	cmpnei      	r2, 0
	bt	.L_loop1
 858:	0bfc      	bt      	0x850	// 850 <Reset_Handler+0x30>
.L_loop1_done:

#ifdef CONFIG_SEPARATE_IRQ_SP
        /* init hardware separate interrupt sp*/
        lrw    r0, g_top_irqstack
 85a:	100e      	lrw      	r0, 0x20000444	// 890 <__exit+0x1e>
        mtcr   r0, cr<15, 1>
 85c:	c020642f 	mtcr      	r0, cr<15, 1>

        mfcr   r0, cr<31, 0>
 860:	c01f6020 	mfcr      	r0, cr<31, 0>
        bseti  r0, 14
 864:	38ae      	bseti      	r0, r0, 14
        mtcr   r0, cr<31, 0>
 866:	c000643f 	mtcr      	r0, cr<31, 0>
#endif

#ifndef __NO_SYSTEM_INIT
	bsr	SystemInit
 86a:	e0000053 	bsr      	0x910	// 910 <SystemInit>
	lrw    r0, VIC_TSPR
	movi   r1, 0xb00
	stw    r1, (r0)
#endif

	bsr	main    // call main
 86e:	e3fffc49 	bsr      	0x100	// 100 <main>

00000872 <__exit>:
	.size	Reset_Handler, . - Reset_Handler

__exit:
    br __exit
 872:	0400      	br      	0x872	// 872 <__exit>
 874:	80000000 	.long	0x80000000
 878:	20001800 	.long	0x20001800
 87c:	000009d0 	.long	0x000009d0
 880:	20000000 	.long	0x20000000
 884:	20000044 	.long	0x20000044
 888:	20000044 	.long	0x20000044
 88c:	20000444 	.long	0x20000444
 890:	20000444 	.long	0x20000444

00000894 <csi_coret_config>:
  \note    When the variable <b>__Vendor_SysTickConfig</b> is set to 1, then the
           function <b>SysTick_Config</b> is not included. In this case, the file <b><i>device</i>.h</b>
           must contain a vendor-specific implementation of this function.
 */
__STATIC_INLINE uint32_t csi_coret_config(uint32_t ticks, int32_t IRQn)
{
 894:	1421      	subi      	sp, sp, 4
 896:	dd0e2000 	st.w      	r8, (sp, 0)
 89a:	6e3b      	mov      	r8, sp
 89c:	1422      	subi      	sp, sp, 8
 89e:	3300      	movi      	r3, 0
 8a0:	2b03      	subi      	r3, 4
 8a2:	60e0      	addu      	r3, r8
 8a4:	b300      	st.w      	r0, (r3, 0)
 8a6:	3300      	movi      	r3, 0
 8a8:	2b07      	subi      	r3, 8
 8aa:	60e0      	addu      	r3, r8
 8ac:	b320      	st.w      	r1, (r3, 0)
    (void)IRQn;

    if ((ticks - 1UL) > CORET_LOAD_RELOAD_Msk) {
 8ae:	3300      	movi      	r3, 0
 8b0:	2b03      	subi      	r3, 4
 8b2:	60e0      	addu      	r3, r8
 8b4:	9360      	ld.w      	r3, (r3, 0)
 8b6:	5b43      	subi      	r2, r3, 1
 8b8:	106d      	lrw      	r3, 0xffffff	// 8ec <csi_coret_config+0x58>
 8ba:	648c      	cmphs      	r3, r2
 8bc:	0803      	bt      	0x8c2	// 8c2 <csi_coret_config+0x2e>
        return (1UL);                                                   /* Reload value impossible */
 8be:	3301      	movi      	r3, 1
 8c0:	040f      	br      	0x8de	// 8de <csi_coret_config+0x4a>
    }

    CORET->LOAD  = (uint32_t)(ticks - 1UL);                           /* set reload register */
 8c2:	106c      	lrw      	r3, 0xe000e010	// 8f0 <csi_coret_config+0x5c>
 8c4:	3200      	movi      	r2, 0
 8c6:	2a03      	subi      	r2, 4
 8c8:	60a0      	addu      	r2, r8
 8ca:	9240      	ld.w      	r2, (r2, 0)
 8cc:	2a00      	subi      	r2, 1
 8ce:	b341      	st.w      	r2, (r3, 0x4)
    CORET->VAL   = 0UL;                                               /* Load the CORET Counter Value */
 8d0:	1068      	lrw      	r3, 0xe000e010	// 8f0 <csi_coret_config+0x5c>
 8d2:	3200      	movi      	r2, 0
 8d4:	b342      	st.w      	r2, (r3, 0x8)
    CORET->CTRL  = CORET_CTRL_CLKSOURCE_Msk |
 8d6:	1067      	lrw      	r3, 0xe000e010	// 8f0 <csi_coret_config+0x5c>
 8d8:	3207      	movi      	r2, 7
 8da:	b340      	st.w      	r2, (r3, 0)
                   CORET_CTRL_TICKINT_Msk |
                   CORET_CTRL_ENABLE_Msk;                           /* Enable CORET IRQ and CORET Timer */
    return (0UL);                                                     /* Function successful */
 8dc:	3300      	movi      	r3, 0
}
 8de:	6c0f      	mov      	r0, r3
 8e0:	6fa3      	mov      	sp, r8
 8e2:	d90e2000 	ld.w      	r8, (sp, 0)
 8e6:	1401      	addi      	sp, sp, 4
 8e8:	783c      	rts
 8ea:	0000      	bkpt
 8ec:	00ffffff 	.long	0x00ffffff
 8f0:	e000e010 	.long	0xe000e010

000008f4 <SystemCoreClockUpdate>:
  System Core Clock Variable
 *----------------------------------------------------------------------------*/
int SystemCoreClock = SYSTEM_CLOCK;  /* System Core Clock Frequency      */

void SystemCoreClockUpdate(void)
{
 8f4:	1421      	subi      	sp, sp, 4
 8f6:	dd0e2000 	st.w      	r8, (sp, 0)
 8fa:	6e3b      	mov      	r8, sp
    SystemCoreClock = SYSTEM_CLOCK;
 8fc:	1076      	lrw      	r3, 0x20000040	// 954 <SystemInit+0x44>
 8fe:	1057      	lrw      	r2, 0x1312d00	// 958 <SystemInit+0x48>
 900:	b340      	st.w      	r2, (r3, 0)
}
 902:	6c00      	or      	r0, r0
 904:	6fa3      	mov      	sp, r8
 906:	d90e2000 	ld.w      	r8, (sp, 0)
 90a:	1401      	addi      	sp, sp, 4
 90c:	783c      	rts
	...

00000910 <SystemInit>:
  *         Initialize the psr and vbr.
  * @param  None
  * @return None
  */
void SystemInit(void)
{
 910:	1422      	subi      	sp, sp, 8
 912:	dd0e2000 	st.w      	r8, (sp, 0)
 916:	ddee2001 	st.w      	r15, (sp, 0x4)
 91a:	6e3b      	mov      	r8, sp
 91c:	1421      	subi      	sp, sp, 4
 91e:	3300      	movi      	r3, 0
 920:	2b03      	subi      	r3, 4
 922:	60e0      	addu      	r3, r8
 924:	104e      	lrw      	r2, 0x80000140	// 95c <SystemInit+0x4c>
 926:	b340      	st.w      	r2, (r3, 0)
  \details Writes the given value to the PSR Register.
  \param [in]    psr  PSR Register value to set
 */
__ALWAYS_STATIC_INLINE void __set_PSR(uint32_t psr)
{
    __ASM volatile("mtcr %0, psr" : : "r"(psr));
 928:	3300      	movi      	r3, 0
 92a:	2b03      	subi      	r3, 4
 92c:	60e0      	addu      	r3, r8
 92e:	9360      	ld.w      	r3, (r3, 0)
 930:	c0036420 	mtcr      	r3, cr<0, 0>

#ifndef CONFIG_KERNEL_NONE
    csi_coret_config(SYSTEM_CLOCK / CONFIG_SYSTICK_HZ, CORET_IRQn);    //10ms
    csi_vic_enable_irq(CORET_IRQn);
#else
    csi_coret_config(SYSTEM_CLOCK / CONFIG_SYSTICK_HZ, CORET_IRQn);    //for mdelay()
 934:	3100      	movi      	r1, 0
 936:	100b      	lrw      	r0, 0x30d40	// 960 <SystemInit+0x50>
 938:	e3ffffae 	bsr      	0x894	// 894 <csi_coret_config>
#endif

    SystemCoreClock = SYSTEM_CLOCK;
 93c:	1066      	lrw      	r3, 0x20000040	// 954 <SystemInit+0x44>
 93e:	1047      	lrw      	r2, 0x1312d00	// 958 <SystemInit+0x48>
 940:	b340      	st.w      	r2, (r3, 0)

    //extern void mm_heap_initialize(void);
    //mm_heap_initialize();
}
 942:	6c00      	or      	r0, r0
 944:	6fa3      	mov      	sp, r8
 946:	d9ee2001 	ld.w      	r15, (sp, 0x4)
 94a:	d90e2000 	ld.w      	r8, (sp, 0)
 94e:	1402      	addi      	sp, sp, 8
 950:	783c      	rts
 952:	0000      	bkpt
 954:	20000040 	.long	0x20000040
 958:	01312d00 	.long	0x01312d00
 95c:	80000140 	.long	0x80000140
 960:	00030d40 	.long	0x00030d40

00000964 <trap_c>:
#include <stdio.h>
#include <stdlib.h>
#include <csi_config.h>

void trap_c(uint32_t *regs)
{
 964:	1421      	subi      	sp, sp, 4
 966:	dd0e2000 	st.w      	r8, (sp, 0)
 96a:	6e3b      	mov      	r8, sp
 96c:	1421      	subi      	sp, sp, 4
 96e:	3300      	movi      	r3, 0
 970:	2b03      	subi      	r3, 4
 972:	60e0      	addu      	r3, r8
 974:	b300      	st.w      	r0, (r3, 0)
//
//    printf("\n");
//    printf("epsr: %8x\n", regs[16]);
//    printf("epc : %8x\n", regs[17]);

    while (1);
 976:	0400      	br      	0x976	// 976 <trap_c+0x12>

00000978 <trap>:
 * default exception handler
 ******************************************************************************/
    .global trap
    .type   trap, %function
trap:
    psrset  ee
 978:	c1007420 	psrset      	ee

    mov     r0, r0
 97c:	6c03      	mov      	r0, r0
    subi    sp, 72
 97e:	1432      	subi      	sp, sp, 72
#if defined(__CK802__)   
	stm     r0-r13, (sp)
#elif defined(__CK801__)
	stw		r0, (sp)
 980:	b800      	st.w      	r0, (sp, 0)
	stw		r1, (sp,0x4)
 982:	b821      	st.w      	r1, (sp, 0x4)
	stw		r2, (sp,0x8)
 984:	b842      	st.w      	r2, (sp, 0x8)
	stw		r3, (sp,0xc)
 986:	b863      	st.w      	r3, (sp, 0xc)
	stw		r4, (sp,0x10)
 988:	b884      	st.w      	r4, (sp, 0x10)
	stw		r5, (sp,0x14)
 98a:	b8a5      	st.w      	r5, (sp, 0x14)
	stw		r6, (sp,0x18)
 98c:	b8c6      	st.w      	r6, (sp, 0x18)
	stw		r7, (sp,0x1c)
 98e:	b8e7      	st.w      	r7, (sp, 0x1c)
	stw		r8, (sp,0x20)
 990:	dd0e2008 	st.w      	r8, (sp, 0x20)
	stw		r13, (sp,0x24)
 994:	ddae2009 	st.w      	r13, (sp, 0x24)
#endif
	mov     r0, sp
 998:	6c3b      	mov      	r0, sp
    addi    r0, 72
 99a:	2047      	addi      	r0, 72
    stw     r0, (sp, 56)
 99c:	b80e      	st.w      	r0, (sp, 0x38)
    stw     r15, (sp, 60)
 99e:	ddee200f 	st.w      	r15, (sp, 0x3c)
    mfcr    r0, epsr
 9a2:	c0026020 	mfcr      	r0, cr<2, 0>
    stw     r0, (sp, 64)
 9a6:	b810      	st.w      	r0, (sp, 0x40)
    mfcr    r0, epc
 9a8:	c0046020 	mfcr      	r0, cr<4, 0>
    stw     r0, (sp, 68)
 9ac:	b811      	st.w      	r0, (sp, 0x44)
    mov     r0, sp
 9ae:	6c3b      	mov      	r0, sp

    /* for backtrace */
    subi    sp, 8
 9b0:	1422      	subi      	sp, sp, 8
    stw     r8, (sp, 0)
 9b2:	dd0e2000 	st.w      	r8, (sp, 0)
    stw     r15, (sp, 4)
 9b6:	ddee2001 	st.w      	r15, (sp, 0x4)
    mov     r8, sp
 9ba:	6e3b      	mov      	r8, sp

    lrw     r1, trap_c
 9bc:	1022      	lrw      	r1, 0x964	// 9c4 <Default_Handler+0x4>
    jmp     r1
 9be:	7804      	jmp      	r1

000009c0 <Default_Handler>:

    .align  1
    .weak   Default_Handler
    .type   Default_Handler, %function
Default_Handler:
    br      trap
 9c0:	07dc      	br      	0x978	// 978 <trap>
 9c2:	0000      	.short	0x0000
 9c4:	00000964 	.long	0x00000964
	...
