
Obj/drv_isr.o:     file format elf32-csky-little


Disassembly of section .text:

00000000 <ck_coret_irqhandler>:

extern void systick_handler(void);
extern void xPortSysTickHandler(void);
extern void OSTimeTick(void);

ATTRIBUTE_WEAK void ck_coret_irqhandler(void) {
   0:	1421      	subi      	sp, sp, 4
   2:	dd0e2000 	st.w      	r8, (sp, 0)
   6:	6e3b      	mov      	r8, sp
   8:	1421      	subi      	sp, sp, 4
    readl(0xE000E010);
   a:	1047      	lrw      	r2, 0xe000e010	// 24 <ck_coret_irqhandler+0x24>
   c:	3300      	movi      	r3, 0
   e:	2b03      	subi      	r3, 4
  10:	60e0      	addu      	r3, r8
  12:	9240      	ld.w      	r2, (r2, 0)
  14:	b340      	st.w      	r2, (r3, 0)
}
  16:	6c00      	or      	r0, r0
  18:	6fa3      	mov      	sp, r8
  1a:	d90e2000 	ld.w      	r8, (sp, 0)
  1e:	1401      	addi      	sp, sp, 4
  20:	783c      	rts
  22:	0000      	bkpt
  24:	e000e010 	.long	0xe000e010

00000028 <isr_syscon_irqhandler>:

ATTRIBUTE_WEAK void isr_syscon_irqhandler(void) {
  28:	1421      	subi      	sp, sp, 4
  2a:	dd0e2000 	st.w      	r8, (sp, 0)
  2e:	6e3b      	mov      	r8, sp
    H_SYSCON->ICR = 0xffffffff;
  30:	ea830159 	lrw      	r3, 0	// 594 <EXI4_IRQHandler+0x1c>
  34:	9360      	ld.w      	r3, (r3, 0)
  36:	2383      	addi      	r3, 132
  38:	6c8f      	mov      	r2, r3
  3a:	3300      	movi      	r3, 0
  3c:	2b00      	subi      	r3, 1
  3e:	b260      	st.w      	r3, (r2, 0)
}
  40:	6c00      	or      	r0, r0
  42:	6fa3      	mov      	sp, r8
  44:	d90e2000 	ld.w      	r8, (sp, 0)
  48:	1401      	addi      	sp, sp, 4
  4a:	783c      	rts

0000004c <isr_ifc_irqhandler>:

ATTRIBUTE_WEAK void isr_ifc_irqhandler(void) {
  4c:	1421      	subi      	sp, sp, 4
  4e:	dd0e2000 	st.w      	r8, (sp, 0)
  52:	6e3b      	mov      	r8, sp
    H_IFC->ICR = 0xffffffff;
  54:	ea830151 	lrw      	r3, 0	// 598 <EXI4_IRQHandler+0x20>
  58:	9340      	ld.w      	r2, (r3, 0)
  5a:	3300      	movi      	r3, 0
  5c:	2b00      	subi      	r3, 1
  5e:	b269      	st.w      	r3, (r2, 0x24)
}
  60:	6c00      	or      	r0, r0
  62:	6fa3      	mov      	sp, r8
  64:	d90e2000 	ld.w      	r8, (sp, 0)
  68:	1401      	addi      	sp, sp, 4
  6a:	783c      	rts

0000006c <isr_adc_irqhandler>:

ATTRIBUTE_WEAK void isr_adc_irqhandler(APT_ADC_Reg_t *handle) {
  6c:	1421      	subi      	sp, sp, 4
  6e:	dd0e2000 	st.w      	r8, (sp, 0)
  72:	6e3b      	mov      	r8, sp
  74:	1421      	subi      	sp, sp, 4
  76:	3300      	movi      	r3, 0
  78:	2b03      	subi      	r3, 4
  7a:	60e0      	addu      	r3, r8
  7c:	b300      	st.w      	r0, (r3, 0)
    handle->CSR = 0xffffffff;
  7e:	3300      	movi      	r3, 0
  80:	2b03      	subi      	r3, 4
  82:	60e0      	addu      	r3, r8
  84:	9340      	ld.w      	r2, (r3, 0)
  86:	3300      	movi      	r3, 0
  88:	2b00      	subi      	r3, 1
  8a:	b267      	st.w      	r3, (r2, 0x1c)
}
  8c:	6c00      	or      	r0, r0
  8e:	6fa3      	mov      	sp, r8
  90:	d90e2000 	ld.w      	r8, (sp, 0)
  94:	1401      	addi      	sp, sp, 4
  96:	783c      	rts

00000098 <isr_tc0_0_irqhandler>:

ATTRIBUTE_WEAK void isr_tc0_0_irqhandler(void) {
  98:	1421      	subi      	sp, sp, 4
  9a:	dd0e2000 	st.w      	r8, (sp, 0)
  9e:	6e3b      	mov      	r8, sp
    H_TC0->CH[0].CSR = 0xffffffff;
  a0:	ea83013f 	lrw      	r3, 0	// 59c <EXI4_IRQHandler+0x24>
  a4:	9340      	ld.w      	r2, (r3, 0)
  a6:	3300      	movi      	r3, 0
  a8:	2b00      	subi      	r3, 1
  aa:	b27b      	st.w      	r3, (r2, 0x6c)
}
  ac:	6c00      	or      	r0, r0
  ae:	6fa3      	mov      	sp, r8
  b0:	d90e2000 	ld.w      	r8, (sp, 0)
  b4:	1401      	addi      	sp, sp, 4
  b6:	783c      	rts

000000b8 <isr_tc0_1_irqhandler>:

ATTRIBUTE_WEAK void isr_tc0_1_irqhandler(void) {
  b8:	1421      	subi      	sp, sp, 4
  ba:	dd0e2000 	st.w      	r8, (sp, 0)
  be:	6e3b      	mov      	r8, sp
    H_TC0->CH[1].CSR = 0xffffffff;
  c0:	ea830137 	lrw      	r3, 0	// 59c <EXI4_IRQHandler+0x24>
  c4:	9360      	ld.w      	r3, (r3, 0)
  c6:	ea820137 	lrw      	r2, 0x16c	// 5a0 <EXI4_IRQHandler+0x28>
  ca:	608c      	addu      	r2, r3
  cc:	3300      	movi      	r3, 0
  ce:	2b00      	subi      	r3, 1
  d0:	b260      	st.w      	r3, (r2, 0)
}
  d2:	6c00      	or      	r0, r0
  d4:	6fa3      	mov      	sp, r8
  d6:	d90e2000 	ld.w      	r8, (sp, 0)
  da:	1401      	addi      	sp, sp, 4
  dc:	783c      	rts
	...

000000e0 <isr_tc0_2_irqhandler>:

ATTRIBUTE_WEAK void isr_tc0_2_irqhandler(void) {
  e0:	1421      	subi      	sp, sp, 4
  e2:	dd0e2000 	st.w      	r8, (sp, 0)
  e6:	6e3b      	mov      	r8, sp
    H_TC0->CH[2].CSR = 0xffffffff;
  e8:	ea83012d 	lrw      	r3, 0	// 59c <EXI4_IRQHandler+0x24>
  ec:	9360      	ld.w      	r3, (r3, 0)
  ee:	ea82012e 	lrw      	r2, 0x26c	// 5a4 <EXI4_IRQHandler+0x2c>
  f2:	608c      	addu      	r2, r3
  f4:	3300      	movi      	r3, 0
  f6:	2b00      	subi      	r3, 1
  f8:	b260      	st.w      	r3, (r2, 0)
}
  fa:	6c00      	or      	r0, r0
  fc:	6fa3      	mov      	sp, r8
  fe:	d90e2000 	ld.w      	r8, (sp, 0)
 102:	1401      	addi      	sp, sp, 4
 104:	783c      	rts
	...

00000108 <isr_tc1_irqhandler>:

ATTRIBUTE_WEAK void isr_tc1_irqhandler(void) {
 108:	1421      	subi      	sp, sp, 4
 10a:	dd0e2000 	st.w      	r8, (sp, 0)
 10e:	6e3b      	mov      	r8, sp
    H_TC1->ICR = 0xffffffff;
 110:	ea830126 	lrw      	r3, 0	// 5a8 <EXI4_IRQHandler+0x30>
 114:	9340      	ld.w      	r2, (r3, 0)
 116:	3300      	movi      	r3, 0
 118:	2b00      	subi      	r3, 1
 11a:	b26a      	st.w      	r3, (r2, 0x28)
}
 11c:	6c00      	or      	r0, r0
 11e:	6fa3      	mov      	sp, r8
 120:	d90e2000 	ld.w      	r8, (sp, 0)
 124:	1401      	addi      	sp, sp, 4
 126:	783c      	rts

00000128 <isr_tc2_irqhandler>:

ATTRIBUTE_WEAK void isr_tc2_irqhandler(void) {
 128:	1421      	subi      	sp, sp, 4
 12a:	dd0e2000 	st.w      	r8, (sp, 0)
 12e:	6e3b      	mov      	r8, sp
    H_TC2->ICR = 0xffffffff;
 130:	ea83011f 	lrw      	r3, 0	// 5ac <EXI4_IRQHandler+0x34>
 134:	9340      	ld.w      	r2, (r3, 0)
 136:	3300      	movi      	r3, 0
 138:	2b00      	subi      	r3, 1
 13a:	b266      	st.w      	r3, (r2, 0x18)
}
 13c:	6c00      	or      	r0, r0
 13e:	6fa3      	mov      	sp, r8
 140:	d90e2000 	ld.w      	r8, (sp, 0)
 144:	1401      	addi      	sp, sp, 4
 146:	783c      	rts

00000148 <isr_tc3_irqhandler>:

ATTRIBUTE_WEAK void isr_tc3_irqhandler(void) {
 148:	1421      	subi      	sp, sp, 4
 14a:	dd0e2000 	st.w      	r8, (sp, 0)
 14e:	6e3b      	mov      	r8, sp
    H_TC3->ICR = 0xffffffff;
 150:	ea830118 	lrw      	r3, 0	// 5b0 <EXI4_IRQHandler+0x38>
 154:	9340      	ld.w      	r2, (r3, 0)
 156:	3300      	movi      	r3, 0
 158:	2b00      	subi      	r3, 1
 15a:	b26a      	st.w      	r3, (r2, 0x28)
}
 15c:	6c00      	or      	r0, r0
 15e:	6fa3      	mov      	sp, r8
 160:	d90e2000 	ld.w      	r8, (sp, 0)
 164:	1401      	addi      	sp, sp, 4
 166:	783c      	rts

00000168 <isr_led_irqhandler>:

ATTRIBUTE_WEAK void isr_led_irqhandler(void) {
 168:	1421      	subi      	sp, sp, 4
 16a:	dd0e2000 	st.w      	r8, (sp, 0)
 16e:	6e3b      	mov      	r8, sp
    H_LED->ICR = 0xffffffff;
 170:	ea830111 	lrw      	r3, 0	// 5b4 <EXI4_IRQHandler+0x3c>
 174:	9340      	ld.w      	r2, (r3, 0)
 176:	3300      	movi      	r3, 0
 178:	2b00      	subi      	r3, 1
 17a:	b265      	st.w      	r3, (r2, 0x14)
}
 17c:	6c00      	or      	r0, r0
 17e:	6fa3      	mov      	sp, r8
 180:	d90e2000 	ld.w      	r8, (sp, 0)
 184:	1401      	addi      	sp, sp, 4
 186:	783c      	rts

00000188 <isr_epwm_irqhandler>:

ATTRIBUTE_WEAK void isr_epwm_irqhandler(void) {
 188:	1421      	subi      	sp, sp, 4
 18a:	dd0e2000 	st.w      	r8, (sp, 0)
 18e:	6e3b      	mov      	r8, sp
    H_EPWM->ICR = 0xffffffff;
 190:	ea83010a 	lrw      	r3, 0	// 5b8 <EXI4_IRQHandler+0x40>
 194:	9360      	ld.w      	r3, (r3, 0)
 196:	23bb      	addi      	r3, 188
 198:	6c8f      	mov      	r2, r3
 19a:	3300      	movi      	r3, 0
 19c:	2b00      	subi      	r3, 1
 19e:	b260      	st.w      	r3, (r2, 0)
}
 1a0:	6c00      	or      	r0, r0
 1a2:	6fa3      	mov      	sp, r8
 1a4:	d90e2000 	ld.w      	r8, (sp, 0)
 1a8:	1401      	addi      	sp, sp, 4
 1aa:	783c      	rts

000001ac <isr_exi_irqhandler>:

ATTRIBUTE_WEAK void isr_exi_irqhandler(uint32_t exi_num)
{
 1ac:	1421      	subi      	sp, sp, 4
 1ae:	dd0e2000 	st.w      	r8, (sp, 0)
 1b2:	6e3b      	mov      	r8, sp
 1b4:	1421      	subi      	sp, sp, 4
 1b6:	3300      	movi      	r3, 0
 1b8:	2b03      	subi      	r3, 4
 1ba:	60e0      	addu      	r3, r8
 1bc:	b300      	st.w      	r0, (r3, 0)
    H_SYSCON->EXICR = 0xffffffff;
 1be:	0069      	lrw      	r3, 0	// 594 <EXI4_IRQHandler+0x1c>
 1c0:	9360      	ld.w      	r3, (r3, 0)
 1c2:	23ab      	addi      	r3, 172
 1c4:	6c8f      	mov      	r2, r3
 1c6:	3300      	movi      	r3, 0
 1c8:	2b00      	subi      	r3, 1
 1ca:	b260      	st.w      	r3, (r2, 0)
}
 1cc:	6c00      	or      	r0, r0
 1ce:	6fa3      	mov      	sp, r8
 1d0:	d90e2000 	ld.w      	r8, (sp, 0)
 1d4:	1401      	addi      	sp, sp, 4
 1d6:	783c      	rts

000001d8 <isr_usart_irqhandler>:

ATTRIBUTE_WEAK void isr_usart_irqhandler(APT_USART_Reg_t *handle)
{
 1d8:	1421      	subi      	sp, sp, 4
 1da:	dd0e2000 	st.w      	r8, (sp, 0)
 1de:	6e3b      	mov      	r8, sp
 1e0:	1421      	subi      	sp, sp, 4
 1e2:	3300      	movi      	r3, 0
 1e4:	2b03      	subi      	r3, 4
 1e6:	60e0      	addu      	r3, r8
 1e8:	b300      	st.w      	r0, (r3, 0)
    handle->ICR = 0xffffffff;
 1ea:	3300      	movi      	r3, 0
 1ec:	2b03      	subi      	r3, 4
 1ee:	60e0      	addu      	r3, r8
 1f0:	9340      	ld.w      	r2, (r3, 0)
 1f2:	3300      	movi      	r3, 0
 1f4:	2b00      	subi      	r3, 1
 1f6:	b268      	st.w      	r3, (r2, 0x20)
}
 1f8:	6c00      	or      	r0, r0
 1fa:	6fa3      	mov      	sp, r8
 1fc:	d90e2000 	ld.w      	r8, (sp, 0)
 200:	1401      	addi      	sp, sp, 4
 202:	783c      	rts

00000204 <isr_uart_irqhandler>:

ATTRIBUTE_WEAK void isr_uart_irqhandler(APT_UART_Reg_t *handle)
{
 204:	1421      	subi      	sp, sp, 4
 206:	dd0e2000 	st.w      	r8, (sp, 0)
 20a:	6e3b      	mov      	r8, sp
 20c:	1421      	subi      	sp, sp, 4
 20e:	3300      	movi      	r3, 0
 210:	2b03      	subi      	r3, 4
 212:	60e0      	addu      	r3, r8
 214:	b300      	st.w      	r0, (r3, 0)
    handle->ISR = 0xffffffff;
 216:	3300      	movi      	r3, 0
 218:	2b03      	subi      	r3, 4
 21a:	60e0      	addu      	r3, r8
 21c:	9340      	ld.w      	r2, (r3, 0)
 21e:	3300      	movi      	r3, 0
 220:	2b00      	subi      	r3, 1
 222:	b263      	st.w      	r3, (r2, 0xc)
}
 224:	6c00      	or      	r0, r0
 226:	6fa3      	mov      	sp, r8
 228:	d90e2000 	ld.w      	r8, (sp, 0)
 22c:	1401      	addi      	sp, sp, 4
 22e:	783c      	rts

00000230 <isr_i2c_irqhandler>:

ATTRIBUTE_WEAK void isr_i2c_irqhandler(APT_I2C_Reg_t *handle)
{
 230:	1421      	subi      	sp, sp, 4
 232:	dd0e2000 	st.w      	r8, (sp, 0)
 236:	6e3b      	mov      	r8, sp
 238:	1421      	subi      	sp, sp, 4
 23a:	3300      	movi      	r3, 0
 23c:	2b03      	subi      	r3, 4
 23e:	60e0      	addu      	r3, r8
 240:	b300      	st.w      	r0, (r3, 0)
    handle->CR &= ~(0x1ul<<4);
 242:	3300      	movi      	r3, 0
 244:	2b03      	subi      	r3, 4
 246:	60e0      	addu      	r3, r8
 248:	9360      	ld.w      	r3, (r3, 0)
 24a:	9378      	ld.w      	r3, (r3, 0x60)
 24c:	3b84      	bclri      	r3, r3, 4
 24e:	6c8f      	mov      	r2, r3
 250:	3300      	movi      	r3, 0
 252:	2b03      	subi      	r3, 4
 254:	60e0      	addu      	r3, r8
 256:	9360      	ld.w      	r3, (r3, 0)
 258:	b358      	st.w      	r2, (r3, 0x60)
}
 25a:	6c00      	or      	r0, r0
 25c:	6fa3      	mov      	sp, r8
 25e:	d90e2000 	ld.w      	r8, (sp, 0)
 262:	1401      	addi      	sp, sp, 4
 264:	783c      	rts
	...

00000268 <isr_spi_irqhandler>:

ATTRIBUTE_WEAK void isr_spi_irqhandler(APT_SPI_Reg_t *handle)
{
 268:	1421      	subi      	sp, sp, 4
 26a:	dd0e2000 	st.w      	r8, (sp, 0)
 26e:	6e3b      	mov      	r8, sp
 270:	1421      	subi      	sp, sp, 4
 272:	3300      	movi      	r3, 0
 274:	2b03      	subi      	r3, 4
 276:	60e0      	addu      	r3, r8
 278:	b300      	st.w      	r0, (r3, 0)
    handle->ICR = 0xffffffff;
 27a:	3300      	movi      	r3, 0
 27c:	2b03      	subi      	r3, 4
 27e:	60e0      	addu      	r3, r8
 280:	9340      	ld.w      	r2, (r3, 0)
 282:	3300      	movi      	r3, 0
 284:	2b00      	subi      	r3, 1
 286:	b268      	st.w      	r3, (r2, 0x20)
}
 288:	6c00      	or      	r0, r0
 28a:	6fa3      	mov      	sp, r8
 28c:	d90e2000 	ld.w      	r8, (sp, 0)
 290:	1401      	addi      	sp, sp, 4
 292:	783c      	rts

00000294 <isr_tkey_irqhandler>:

ATTRIBUTE_WEAK void isr_tkey_irqhandler(void)
{
 294:	1421      	subi      	sp, sp, 4
 296:	dd0e2000 	st.w      	r8, (sp, 0)
 29a:	6e3b      	mov      	r8, sp
    H_TKEY->ICR = 0xffffffff;
 29c:	0177      	lrw      	r3, 0	// 5bc <EXI4_IRQHandler+0x44>
 29e:	9340      	ld.w      	r2, (r3, 0)
 2a0:	3300      	movi      	r3, 0
 2a2:	2b00      	subi      	r3, 1
 2a4:	b27a      	st.w      	r3, (r2, 0x68)
}
 2a6:	6c00      	or      	r0, r0
 2a8:	6fa3      	mov      	sp, r8
 2aa:	d90e2000 	ld.w      	r8, (sp, 0)
 2ae:	1401      	addi      	sp, sp, 4
 2b0:	783c      	rts
	...

000002b4 <isr_comp0_irqhandler>:

ATTRIBUTE_WEAK void isr_comp0_irqhandler(void)
{
 2b4:	1421      	subi      	sp, sp, 4
 2b6:	dd0e2000 	st.w      	r8, (sp, 0)
 2ba:	6e3b      	mov      	r8, sp
    H_CMP->ICR = 0xffffffff;
 2bc:	017e      	lrw      	r3, 0	// 5c0 <EXI4_IRQHandler+0x48>
 2be:	9340      	ld.w      	r2, (r3, 0)
 2c0:	3300      	movi      	r3, 0
 2c2:	2b00      	subi      	r3, 1
 2c4:	b277      	st.w      	r3, (r2, 0x5c)
}
 2c6:	6c00      	or      	r0, r0
 2c8:	6fa3      	mov      	sp, r8
 2ca:	d90e2000 	ld.w      	r8, (sp, 0)
 2ce:	1401      	addi      	sp, sp, 4
 2d0:	783c      	rts
	...

000002d4 <isr_comp1_irqhandler>:

ATTRIBUTE_WEAK void isr_comp1_irqhandler(void)
{
 2d4:	1421      	subi      	sp, sp, 4
 2d6:	dd0e2000 	st.w      	r8, (sp, 0)
 2da:	6e3b      	mov      	r8, sp
    H_CMP->ICR = 0xffffffff;
 2dc:	0266      	lrw      	r3, 0	// 5c0 <EXI4_IRQHandler+0x48>
 2de:	9340      	ld.w      	r2, (r3, 0)
 2e0:	3300      	movi      	r3, 0
 2e2:	2b00      	subi      	r3, 1
 2e4:	b277      	st.w      	r3, (r2, 0x5c)
}
 2e6:	6c00      	or      	r0, r0
 2e8:	6fa3      	mov      	sp, r8
 2ea:	d90e2000 	ld.w      	r8, (sp, 0)
 2ee:	1401      	addi      	sp, sp, 4
 2f0:	783c      	rts
	...

000002f4 <CORET_IRQHandler>:




ATTRIBUTE_ISR void CORET_IRQHandler(void)
{
 2f4:	1460      	nie
 2f6:	1462      	ipush
 2f8:	1422      	subi      	sp, sp, 8
 2fa:	dd0e2000 	st.w      	r8, (sp, 0)
 2fe:	ddee2001 	st.w      	r15, (sp, 0x4)
 302:	6e3b      	mov      	r8, sp
    
    #ifndef CONFIG_KERNEL_FREERTOS
        CSI_INTRPT_EXIT();
    #endif
#else
    ck_coret_irqhandler();
 304:	e0000000 	bsr      	0	// 0 <ck_coret_irqhandler>
#endif
}
 308:	6c00      	or      	r0, r0
 30a:	6fa3      	mov      	sp, r8
 30c:	d9ee2001 	ld.w      	r15, (sp, 0x4)
 310:	d90e2000 	ld.w      	r8, (sp, 0)
 314:	1402      	addi      	sp, sp, 8
 316:	1463      	ipop
 318:	1461      	nir
	...

0000031c <SYSCON_IRQHandler>:

ATTRIBUTE_ISR void SYSCON_IRQHandler(void)
{
 31c:	1460      	nie
 31e:	1462      	ipush
 320:	1422      	subi      	sp, sp, 8
 322:	dd0e2000 	st.w      	r8, (sp, 0)
 326:	ddee2001 	st.w      	r15, (sp, 0x4)
 32a:	6e3b      	mov      	r8, sp
    CSI_INTRPT_ENTER();
    isr_syscon_irqhandler();
 32c:	e0000000 	bsr      	0	// 28 <isr_syscon_irqhandler>
    CSI_INTRPT_EXIT();
}
 330:	6c00      	or      	r0, r0
 332:	6fa3      	mov      	sp, r8
 334:	d9ee2001 	ld.w      	r15, (sp, 0x4)
 338:	d90e2000 	ld.w      	r8, (sp, 0)
 33c:	1402      	addi      	sp, sp, 8
 33e:	1463      	ipop
 340:	1461      	nir
	...

00000344 <IFC_IRQHandler>:

ATTRIBUTE_ISR void IFC_IRQHandler(void)
{
 344:	1460      	nie
 346:	1462      	ipush
 348:	1422      	subi      	sp, sp, 8
 34a:	dd0e2000 	st.w      	r8, (sp, 0)
 34e:	ddee2001 	st.w      	r15, (sp, 0x4)
 352:	6e3b      	mov      	r8, sp
    CSI_INTRPT_ENTER();
    isr_ifc_irqhandler();
 354:	e0000000 	bsr      	0	// 4c <isr_ifc_irqhandler>
    CSI_INTRPT_EXIT();
}
 358:	6c00      	or      	r0, r0
 35a:	6fa3      	mov      	sp, r8
 35c:	d9ee2001 	ld.w      	r15, (sp, 0x4)
 360:	d90e2000 	ld.w      	r8, (sp, 0)
 364:	1402      	addi      	sp, sp, 8
 366:	1463      	ipop
 368:	1461      	nir
	...

0000036c <ADC_IRQHandler>:

ATTRIBUTE_ISR void ADC_IRQHandler(void)
{
 36c:	1460      	nie
 36e:	1462      	ipush
 370:	1422      	subi      	sp, sp, 8
 372:	dd0e2000 	st.w      	r8, (sp, 0)
 376:	ddee2001 	st.w      	r15, (sp, 0x4)
 37a:	6e3b      	mov      	r8, sp
    CSI_INTRPT_ENTER();
    isr_adc_irqhandler(H_ADC);
 37c:	036d      	lrw      	r3, 0	// 5c4 <EXI4_IRQHandler+0x4c>
 37e:	9360      	ld.w      	r3, (r3, 0)
 380:	6c0f      	mov      	r0, r3
 382:	e0000000 	bsr      	0	// 6c <isr_adc_irqhandler>
    CSI_INTRPT_EXIT();
}
 386:	6c00      	or      	r0, r0
 388:	6fa3      	mov      	sp, r8
 38a:	d9ee2001 	ld.w      	r15, (sp, 0x4)
 38e:	d90e2000 	ld.w      	r8, (sp, 0)
 392:	1402      	addi      	sp, sp, 8
 394:	1463      	ipop
 396:	1461      	nir

00000398 <TC0_0_IRQHandler>:

ATTRIBUTE_ISR void TC0_0_IRQHandler(void)
{
 398:	1460      	nie
 39a:	1462      	ipush
 39c:	1422      	subi      	sp, sp, 8
 39e:	dd0e2000 	st.w      	r8, (sp, 0)
 3a2:	ddee2001 	st.w      	r15, (sp, 0x4)
 3a6:	6e3b      	mov      	r8, sp
    CSI_INTRPT_ENTER();
    isr_tc0_0_irqhandler();
 3a8:	e0000000 	bsr      	0	// 98 <isr_tc0_0_irqhandler>
    CSI_INTRPT_EXIT();
}
 3ac:	6c00      	or      	r0, r0
 3ae:	6fa3      	mov      	sp, r8
 3b0:	d9ee2001 	ld.w      	r15, (sp, 0x4)
 3b4:	d90e2000 	ld.w      	r8, (sp, 0)
 3b8:	1402      	addi      	sp, sp, 8
 3ba:	1463      	ipop
 3bc:	1461      	nir
	...

000003c0 <TC0_1_IRQHandler>:

ATTRIBUTE_ISR void TC0_1_IRQHandler(void)
{
 3c0:	1460      	nie
 3c2:	1462      	ipush
 3c4:	1422      	subi      	sp, sp, 8
 3c6:	dd0e2000 	st.w      	r8, (sp, 0)
 3ca:	ddee2001 	st.w      	r15, (sp, 0x4)
 3ce:	6e3b      	mov      	r8, sp
    CSI_INTRPT_ENTER();
    isr_tc0_1_irqhandler();
 3d0:	e0000000 	bsr      	0	// b8 <isr_tc0_1_irqhandler>
    CSI_INTRPT_EXIT();
}
 3d4:	6c00      	or      	r0, r0
 3d6:	6fa3      	mov      	sp, r8
 3d8:	d9ee2001 	ld.w      	r15, (sp, 0x4)
 3dc:	d90e2000 	ld.w      	r8, (sp, 0)
 3e0:	1402      	addi      	sp, sp, 8
 3e2:	1463      	ipop
 3e4:	1461      	nir
	...

000003e8 <TC0_2_IRQHandler>:

ATTRIBUTE_ISR void TC0_2_IRQHandler(void)
{
 3e8:	1460      	nie
 3ea:	1462      	ipush
 3ec:	1422      	subi      	sp, sp, 8
 3ee:	dd0e2000 	st.w      	r8, (sp, 0)
 3f2:	ddee2001 	st.w      	r15, (sp, 0x4)
 3f6:	6e3b      	mov      	r8, sp
    CSI_INTRPT_ENTER();
    isr_tc0_2_irqhandler();
 3f8:	e0000000 	bsr      	0	// e0 <isr_tc0_2_irqhandler>
    CSI_INTRPT_EXIT();
}
 3fc:	6c00      	or      	r0, r0
 3fe:	6fa3      	mov      	sp, r8
 400:	d9ee2001 	ld.w      	r15, (sp, 0x4)
 404:	d90e2000 	ld.w      	r8, (sp, 0)
 408:	1402      	addi      	sp, sp, 8
 40a:	1463      	ipop
 40c:	1461      	nir
	...

00000410 <TC1_IRQHandler>:

ATTRIBUTE_ISR void TC1_IRQHandler(void)
{
 410:	1460      	nie
 412:	1462      	ipush
 414:	1422      	subi      	sp, sp, 8
 416:	dd0e2000 	st.w      	r8, (sp, 0)
 41a:	ddee2001 	st.w      	r15, (sp, 0x4)
 41e:	6e3b      	mov      	r8, sp
    CSI_INTRPT_ENTER();
    isr_tc1_irqhandler();
 420:	e0000000 	bsr      	0	// 108 <isr_tc1_irqhandler>
    CSI_INTRPT_EXIT();
}
 424:	6c00      	or      	r0, r0
 426:	6fa3      	mov      	sp, r8
 428:	d9ee2001 	ld.w      	r15, (sp, 0x4)
 42c:	d90e2000 	ld.w      	r8, (sp, 0)
 430:	1402      	addi      	sp, sp, 8
 432:	1463      	ipop
 434:	1461      	nir
	...

00000438 <TC2_IRQHandler>:

ATTRIBUTE_ISR void TC2_IRQHandler(void)
{
 438:	1460      	nie
 43a:	1462      	ipush
 43c:	1422      	subi      	sp, sp, 8
 43e:	dd0e2000 	st.w      	r8, (sp, 0)
 442:	ddee2001 	st.w      	r15, (sp, 0x4)
 446:	6e3b      	mov      	r8, sp
    CSI_INTRPT_ENTER();
    isr_tc2_irqhandler();
 448:	e0000000 	bsr      	0	// 128 <isr_tc2_irqhandler>
    CSI_INTRPT_EXIT();
}
 44c:	6c00      	or      	r0, r0
 44e:	6fa3      	mov      	sp, r8
 450:	d9ee2001 	ld.w      	r15, (sp, 0x4)
 454:	d90e2000 	ld.w      	r8, (sp, 0)
 458:	1402      	addi      	sp, sp, 8
 45a:	1463      	ipop
 45c:	1461      	nir
	...

00000460 <TC3_IRQHandler>:

ATTRIBUTE_ISR void TC3_IRQHandler(void)
{
 460:	1460      	nie
 462:	1462      	ipush
 464:	1422      	subi      	sp, sp, 8
 466:	dd0e2000 	st.w      	r8, (sp, 0)
 46a:	ddee2001 	st.w      	r15, (sp, 0x4)
 46e:	6e3b      	mov      	r8, sp
    CSI_INTRPT_ENTER();
    isr_tc3_irqhandler();
 470:	e0000000 	bsr      	0	// 148 <isr_tc3_irqhandler>
    CSI_INTRPT_EXIT();
}
 474:	6c00      	or      	r0, r0
 476:	6fa3      	mov      	sp, r8
 478:	d9ee2001 	ld.w      	r15, (sp, 0x4)
 47c:	d90e2000 	ld.w      	r8, (sp, 0)
 480:	1402      	addi      	sp, sp, 8
 482:	1463      	ipop
 484:	1461      	nir
	...

00000488 <LED_IRQHandler>:

ATTRIBUTE_ISR void LED_IRQHandler(void)
{
 488:	1460      	nie
 48a:	1462      	ipush
 48c:	1422      	subi      	sp, sp, 8
 48e:	dd0e2000 	st.w      	r8, (sp, 0)
 492:	ddee2001 	st.w      	r15, (sp, 0x4)
 496:	6e3b      	mov      	r8, sp
    CSI_INTRPT_ENTER();
    isr_led_irqhandler();
 498:	e0000000 	bsr      	0	// 168 <isr_led_irqhandler>
    CSI_INTRPT_EXIT();
}
 49c:	6c00      	or      	r0, r0
 49e:	6fa3      	mov      	sp, r8
 4a0:	d9ee2001 	ld.w      	r15, (sp, 0x4)
 4a4:	d90e2000 	ld.w      	r8, (sp, 0)
 4a8:	1402      	addi      	sp, sp, 8
 4aa:	1463      	ipop
 4ac:	1461      	nir
	...

000004b0 <EPWM_IRQHandler>:

ATTRIBUTE_ISR void EPWM_IRQHandler(void)
{
 4b0:	1460      	nie
 4b2:	1462      	ipush
 4b4:	1422      	subi      	sp, sp, 8
 4b6:	dd0e2000 	st.w      	r8, (sp, 0)
 4ba:	ddee2001 	st.w      	r15, (sp, 0x4)
 4be:	6e3b      	mov      	r8, sp
    CSI_INTRPT_ENTER();
    isr_epwm_irqhandler();
 4c0:	e0000000 	bsr      	0	// 188 <isr_epwm_irqhandler>
    CSI_INTRPT_EXIT();
}
 4c4:	6c00      	or      	r0, r0
 4c6:	6fa3      	mov      	sp, r8
 4c8:	d9ee2001 	ld.w      	r15, (sp, 0x4)
 4cc:	d90e2000 	ld.w      	r8, (sp, 0)
 4d0:	1402      	addi      	sp, sp, 8
 4d2:	1463      	ipop
 4d4:	1461      	nir
	...

000004d8 <EXI0_IRQHandler>:

ATTRIBUTE_ISR void EXI0_IRQHandler(void)
{
 4d8:	1460      	nie
 4da:	1462      	ipush
 4dc:	1422      	subi      	sp, sp, 8
 4de:	dd0e2000 	st.w      	r8, (sp, 0)
 4e2:	ddee2001 	st.w      	r15, (sp, 0x4)
 4e6:	6e3b      	mov      	r8, sp
    CSI_INTRPT_ENTER();
    isr_exi_irqhandler(0);
 4e8:	3000      	movi      	r0, 0
 4ea:	e0000000 	bsr      	0	// 1ac <isr_exi_irqhandler>
    CSI_INTRPT_EXIT();
}
 4ee:	6c00      	or      	r0, r0
 4f0:	6fa3      	mov      	sp, r8
 4f2:	d9ee2001 	ld.w      	r15, (sp, 0x4)
 4f6:	d90e2000 	ld.w      	r8, (sp, 0)
 4fa:	1402      	addi      	sp, sp, 8
 4fc:	1463      	ipop
 4fe:	1461      	nir

00000500 <EXI1_IRQHandler>:

ATTRIBUTE_ISR void EXI1_IRQHandler(void)
{
 500:	1460      	nie
 502:	1462      	ipush
 504:	1422      	subi      	sp, sp, 8
 506:	dd0e2000 	st.w      	r8, (sp, 0)
 50a:	ddee2001 	st.w      	r15, (sp, 0x4)
 50e:	6e3b      	mov      	r8, sp
    CSI_INTRPT_ENTER();
    isr_exi_irqhandler(1);
 510:	3001      	movi      	r0, 1
 512:	e0000000 	bsr      	0	// 1ac <isr_exi_irqhandler>
    CSI_INTRPT_EXIT();
}
 516:	6c00      	or      	r0, r0
 518:	6fa3      	mov      	sp, r8
 51a:	d9ee2001 	ld.w      	r15, (sp, 0x4)
 51e:	d90e2000 	ld.w      	r8, (sp, 0)
 522:	1402      	addi      	sp, sp, 8
 524:	1463      	ipop
 526:	1461      	nir

00000528 <EXI2_IRQHandler>:

ATTRIBUTE_ISR void EXI2_IRQHandler(void)
{
 528:	1460      	nie
 52a:	1462      	ipush
 52c:	1422      	subi      	sp, sp, 8
 52e:	dd0e2000 	st.w      	r8, (sp, 0)
 532:	ddee2001 	st.w      	r15, (sp, 0x4)
 536:	6e3b      	mov      	r8, sp
    CSI_INTRPT_ENTER();
    isr_exi_irqhandler(2);
 538:	3002      	movi      	r0, 2
 53a:	e0000000 	bsr      	0	// 1ac <isr_exi_irqhandler>
    CSI_INTRPT_EXIT();
}
 53e:	6c00      	or      	r0, r0
 540:	6fa3      	mov      	sp, r8
 542:	d9ee2001 	ld.w      	r15, (sp, 0x4)
 546:	d90e2000 	ld.w      	r8, (sp, 0)
 54a:	1402      	addi      	sp, sp, 8
 54c:	1463      	ipop
 54e:	1461      	nir

00000550 <EXI3_IRQHandler>:

ATTRIBUTE_ISR void EXI3_IRQHandler(void)
{
 550:	1460      	nie
 552:	1462      	ipush
 554:	1422      	subi      	sp, sp, 8
 556:	dd0e2000 	st.w      	r8, (sp, 0)
 55a:	ddee2001 	st.w      	r15, (sp, 0x4)
 55e:	6e3b      	mov      	r8, sp
    CSI_INTRPT_ENTER();
    isr_exi_irqhandler(3);
 560:	3003      	movi      	r0, 3
 562:	e0000000 	bsr      	0	// 1ac <isr_exi_irqhandler>
    CSI_INTRPT_EXIT();
}
 566:	6c00      	or      	r0, r0
 568:	6fa3      	mov      	sp, r8
 56a:	d9ee2001 	ld.w      	r15, (sp, 0x4)
 56e:	d90e2000 	ld.w      	r8, (sp, 0)
 572:	1402      	addi      	sp, sp, 8
 574:	1463      	ipop
 576:	1461      	nir

00000578 <EXI4_IRQHandler>:

ATTRIBUTE_ISR void EXI4_IRQHandler(void)
{
 578:	1460      	nie
 57a:	1462      	ipush
 57c:	1422      	subi      	sp, sp, 8
 57e:	dd0e2000 	st.w      	r8, (sp, 0)
 582:	ddee2001 	st.w      	r15, (sp, 0x4)
 586:	6e3b      	mov      	r8, sp
    CSI_INTRPT_ENTER();
    isr_exi_irqhandler(4);
 588:	3004      	movi      	r0, 4
 58a:	e0000000 	bsr      	0	// 1ac <isr_exi_irqhandler>
    CSI_INTRPT_EXIT();
}
 58e:	6c00      	or      	r0, r0
 590:	6fa3      	mov      	sp, r8
 592:	041b      	br      	0x5c8	// 5c8 <EXI4_IRQHandler+0x50>
	...
 5a0:	0000016c 	.long	0x0000016c
 5a4:	0000026c 	.long	0x0000026c
	...
 5c8:	d9ee2001 	ld.w      	r15, (sp, 0x4)
 5cc:	d90e2000 	ld.w      	r8, (sp, 0)
 5d0:	1402      	addi      	sp, sp, 8
 5d2:	1463      	ipop
 5d4:	1461      	nir
	...

000005d8 <UART0_IRQHandler>:

ATTRIBUTE_ISR void UART0_IRQHandler(void)
{
 5d8:	1460      	nie
 5da:	1462      	ipush
 5dc:	1422      	subi      	sp, sp, 8
 5de:	dd0e2000 	st.w      	r8, (sp, 0)
 5e2:	ddee2001 	st.w      	r15, (sp, 0x4)
 5e6:	6e3b      	mov      	r8, sp
    CSI_INTRPT_ENTER();
    isr_usart_irqhandler(H_UART0);
 5e8:	1266      	lrw      	r3, 0	// 700 <CMP1_IRQHandler+0x28>
 5ea:	9360      	ld.w      	r3, (r3, 0)
 5ec:	6c0f      	mov      	r0, r3
 5ee:	e0000000 	bsr      	0	// 1d8 <isr_usart_irqhandler>
    CSI_INTRPT_EXIT();
}
 5f2:	6c00      	or      	r0, r0
 5f4:	6fa3      	mov      	sp, r8
 5f6:	d9ee2001 	ld.w      	r15, (sp, 0x4)
 5fa:	d90e2000 	ld.w      	r8, (sp, 0)
 5fe:	1402      	addi      	sp, sp, 8
 600:	1463      	ipop
 602:	1461      	nir

00000604 <UART1_IRQHandler>:

ATTRIBUTE_ISR void UART1_IRQHandler(void)
{
 604:	1460      	nie
 606:	1462      	ipush
 608:	1422      	subi      	sp, sp, 8
 60a:	dd0e2000 	st.w      	r8, (sp, 0)
 60e:	ddee2001 	st.w      	r15, (sp, 0x4)
 612:	6e3b      	mov      	r8, sp
    CSI_INTRPT_ENTER();
    isr_uart_irqhandler(H_UART1);
 614:	117c      	lrw      	r3, 0	// 704 <CMP1_IRQHandler+0x2c>
 616:	9360      	ld.w      	r3, (r3, 0)
 618:	6c0f      	mov      	r0, r3
 61a:	e0000000 	bsr      	0	// 204 <isr_uart_irqhandler>
    CSI_INTRPT_EXIT();
}
 61e:	6c00      	or      	r0, r0
 620:	6fa3      	mov      	sp, r8
 622:	d9ee2001 	ld.w      	r15, (sp, 0x4)
 626:	d90e2000 	ld.w      	r8, (sp, 0)
 62a:	1402      	addi      	sp, sp, 8
 62c:	1463      	ipop
 62e:	1461      	nir

00000630 <I2C0_IRQHandler>:

ATTRIBUTE_ISR void I2C0_IRQHandler(void)
{
 630:	1460      	nie
 632:	1462      	ipush
 634:	1422      	subi      	sp, sp, 8
 636:	dd0e2000 	st.w      	r8, (sp, 0)
 63a:	ddee2001 	st.w      	r15, (sp, 0x4)
 63e:	6e3b      	mov      	r8, sp
    CSI_INTRPT_ENTER();
    isr_i2c_irqhandler(H_I2C);
 640:	1172      	lrw      	r3, 0	// 708 <CMP1_IRQHandler+0x30>
 642:	9360      	ld.w      	r3, (r3, 0)
 644:	6c0f      	mov      	r0, r3
 646:	e0000000 	bsr      	0	// 230 <isr_i2c_irqhandler>
    CSI_INTRPT_EXIT();
}
 64a:	6c00      	or      	r0, r0
 64c:	6fa3      	mov      	sp, r8
 64e:	d9ee2001 	ld.w      	r15, (sp, 0x4)
 652:	d90e2000 	ld.w      	r8, (sp, 0)
 656:	1402      	addi      	sp, sp, 8
 658:	1463      	ipop
 65a:	1461      	nir

0000065c <SPI0_IRQHandler>:

ATTRIBUTE_ISR void SPI0_IRQHandler(void)
{
 65c:	1460      	nie
 65e:	1462      	ipush
 660:	1422      	subi      	sp, sp, 8
 662:	dd0e2000 	st.w      	r8, (sp, 0)
 666:	ddee2001 	st.w      	r15, (sp, 0x4)
 66a:	6e3b      	mov      	r8, sp
    CSI_INTRPT_ENTER();
    isr_spi_irqhandler(H_SPI);
 66c:	1168      	lrw      	r3, 0	// 70c <CMP1_IRQHandler+0x34>
 66e:	9360      	ld.w      	r3, (r3, 0)
 670:	6c0f      	mov      	r0, r3
 672:	e0000000 	bsr      	0	// 268 <isr_spi_irqhandler>
    CSI_INTRPT_EXIT();
}
 676:	6c00      	or      	r0, r0
 678:	6fa3      	mov      	sp, r8
 67a:	d9ee2001 	ld.w      	r15, (sp, 0x4)
 67e:	d90e2000 	ld.w      	r8, (sp, 0)
 682:	1402      	addi      	sp, sp, 8
 684:	1463      	ipop
 686:	1461      	nir

00000688 <TKEY_IRQHandler>:

ATTRIBUTE_ISR void TKEY_IRQHandler(void)
{
 688:	1460      	nie
 68a:	1462      	ipush
 68c:	1422      	subi      	sp, sp, 8
 68e:	dd0e2000 	st.w      	r8, (sp, 0)
 692:	ddee2001 	st.w      	r15, (sp, 0x4)
 696:	6e3b      	mov      	r8, sp
    CSI_INTRPT_ENTER();
    isr_tkey_irqhandler();
 698:	e0000000 	bsr      	0	// 294 <isr_tkey_irqhandler>
    CSI_INTRPT_EXIT();
}
 69c:	6c00      	or      	r0, r0
 69e:	6fa3      	mov      	sp, r8
 6a0:	d9ee2001 	ld.w      	r15, (sp, 0x4)
 6a4:	d90e2000 	ld.w      	r8, (sp, 0)
 6a8:	1402      	addi      	sp, sp, 8
 6aa:	1463      	ipop
 6ac:	1461      	nir
	...

000006b0 <CMP0_IRQHandler>:

ATTRIBUTE_ISR void CMP0_IRQHandler(void)
{
 6b0:	1460      	nie
 6b2:	1462      	ipush
 6b4:	1422      	subi      	sp, sp, 8
 6b6:	dd0e2000 	st.w      	r8, (sp, 0)
 6ba:	ddee2001 	st.w      	r15, (sp, 0x4)
 6be:	6e3b      	mov      	r8, sp
    CSI_INTRPT_ENTER();
    isr_comp0_irqhandler();
 6c0:	e0000000 	bsr      	0	// 2b4 <isr_comp0_irqhandler>
    CSI_INTRPT_EXIT();
}
 6c4:	6c00      	or      	r0, r0
 6c6:	6fa3      	mov      	sp, r8
 6c8:	d9ee2001 	ld.w      	r15, (sp, 0x4)
 6cc:	d90e2000 	ld.w      	r8, (sp, 0)
 6d0:	1402      	addi      	sp, sp, 8
 6d2:	1463      	ipop
 6d4:	1461      	nir
	...

000006d8 <CMP1_IRQHandler>:

ATTRIBUTE_ISR void CMP1_IRQHandler(void)
{
 6d8:	1460      	nie
 6da:	1462      	ipush
 6dc:	1422      	subi      	sp, sp, 8
 6de:	dd0e2000 	st.w      	r8, (sp, 0)
 6e2:	ddee2001 	st.w      	r15, (sp, 0x4)
 6e6:	6e3b      	mov      	r8, sp
    CSI_INTRPT_ENTER();
    isr_comp1_irqhandler();
 6e8:	e0000000 	bsr      	0	// 2d4 <isr_comp1_irqhandler>
    CSI_INTRPT_EXIT();
}
 6ec:	6c00      	or      	r0, r0
 6ee:	6fa3      	mov      	sp, r8
 6f0:	d9ee2001 	ld.w      	r15, (sp, 0x4)
 6f4:	d90e2000 	ld.w      	r8, (sp, 0)
 6f8:	1402      	addi      	sp, sp, 8
 6fa:	1463      	ipop
 6fc:	1461      	nir
	...
