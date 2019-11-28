
Obj/drv_isr.o:     file format elf32-csky-little


Disassembly of section .text:

00000000 <ck_coret_irqhandler>:
extern void OSTimeTick(void);

extern gpio_event_cb_t gpio_exi_cb;
extern syscon_event_cb_t syscon_event_cb;

ATTRIBUTE_WEAK void ck_coret_irqhandler(void) {
   0:	1421      	subi      	r14, r14, 4
   2:	dd0e2000 	st.w      	r8, (r14, 0x0)
   6:	6e3b      	mov      	r8, r14
   8:	1421      	subi      	r14, r14, 4
    readl(0xE000E010);
   a:	1047      	lrw      	r2, 0xe000e010	// 24 <ck_coret_irqhandler+0x24>
   c:	3300      	movi      	r3, 0
   e:	2b03      	subi      	r3, 4
  10:	60e0      	addu      	r3, r8
  12:	9240      	ld.w      	r2, (r2, 0x0)
  14:	b340      	st.w      	r2, (r3, 0x0)
}
  16:	6c00      	or      	r0, r0
  18:	6fa3      	mov      	r14, r8
  1a:	d90e2000 	ld.w      	r8, (r14, 0x0)
  1e:	1401      	addi      	r14, r14, 4
  20:	783c      	jmp      	r15
  22:	0000      	bkpt
  24:	e000e010 	.long	0xe000e010

00000028 <isr_ifc_irqhandler>:

//ATTRIBUTE_WEAK void isr_syscon_irqhandler(void) {
//    H_SYSCON->ICR = 0xffffffff;
//}

ATTRIBUTE_WEAK void isr_ifc_irqhandler(void) {
  28:	1421      	subi      	r14, r14, 4
  2a:	dd0e2000 	st.w      	r8, (r14, 0x0)
  2e:	6e3b      	mov      	r8, r14
//    H_IFC->ICR = 0xffffffff;
}
  30:	6c00      	or      	r0, r0
  32:	6fa3      	mov      	r14, r8
  34:	d90e2000 	ld.w      	r8, (r14, 0x0)
  38:	1401      	addi      	r14, r14, 4
  3a:	783c      	jmp      	r15

0000003c <isr_adc_irqhandler>:

ATTRIBUTE_WEAK void isr_adc_irqhandler(void) {
  3c:	1421      	subi      	r14, r14, 4
  3e:	dd0e2000 	st.w      	r8, (r14, 0x0)
  42:	6e3b      	mov      	r8, r14
//    handle->CSR = 0xffffffff;
}
  44:	6c00      	or      	r0, r0
  46:	6fa3      	mov      	r14, r8
  48:	d90e2000 	ld.w      	r8, (r14, 0x0)
  4c:	1401      	addi      	r14, r14, 4
  4e:	783c      	jmp      	r15

00000050 <isr_tc0_0_irqhandler>:

ATTRIBUTE_WEAK void isr_tc0_0_irqhandler(void) {
  50:	1421      	subi      	r14, r14, 4
  52:	dd0e2000 	st.w      	r8, (r14, 0x0)
  56:	6e3b      	mov      	r8, r14
//    H_TC0->CH[0].CSR = 0xffffffff;
}
  58:	6c00      	or      	r0, r0
  5a:	6fa3      	mov      	r14, r8
  5c:	d90e2000 	ld.w      	r8, (r14, 0x0)
  60:	1401      	addi      	r14, r14, 4
  62:	783c      	jmp      	r15

00000064 <isr_tc0_1_irqhandler>:

ATTRIBUTE_WEAK void isr_tc0_1_irqhandler(void) {
  64:	1421      	subi      	r14, r14, 4
  66:	dd0e2000 	st.w      	r8, (r14, 0x0)
  6a:	6e3b      	mov      	r8, r14
//    H_TC0->CH[1].CSR = 0xffffffff;
}
  6c:	6c00      	or      	r0, r0
  6e:	6fa3      	mov      	r14, r8
  70:	d90e2000 	ld.w      	r8, (r14, 0x0)
  74:	1401      	addi      	r14, r14, 4
  76:	783c      	jmp      	r15

00000078 <isr_tc0_2_irqhandler>:

ATTRIBUTE_WEAK void isr_tc0_2_irqhandler(void) {
  78:	1421      	subi      	r14, r14, 4
  7a:	dd0e2000 	st.w      	r8, (r14, 0x0)
  7e:	6e3b      	mov      	r8, r14
//    H_TC0->CH[2].CSR = 0xffffffff;
}
  80:	6c00      	or      	r0, r0
  82:	6fa3      	mov      	r14, r8
  84:	d90e2000 	ld.w      	r8, (r14, 0x0)
  88:	1401      	addi      	r14, r14, 4
  8a:	783c      	jmp      	r15

0000008c <isr_tc1_irqhandler>:

ATTRIBUTE_WEAK void isr_tc1_irqhandler(void) {
  8c:	1421      	subi      	r14, r14, 4
  8e:	dd0e2000 	st.w      	r8, (r14, 0x0)
  92:	6e3b      	mov      	r8, r14
//    H_TC1->ICR = 0xffffffff;
}
  94:	6c00      	or      	r0, r0
  96:	6fa3      	mov      	r14, r8
  98:	d90e2000 	ld.w      	r8, (r14, 0x0)
  9c:	1401      	addi      	r14, r14, 4
  9e:	783c      	jmp      	r15

000000a0 <isr_tc2_irqhandler>:

ATTRIBUTE_WEAK void isr_tc2_irqhandler(void) {
  a0:	1421      	subi      	r14, r14, 4
  a2:	dd0e2000 	st.w      	r8, (r14, 0x0)
  a6:	6e3b      	mov      	r8, r14
//    H_TC2->ICR = 0xffffffff;
}
  a8:	6c00      	or      	r0, r0
  aa:	6fa3      	mov      	r14, r8
  ac:	d90e2000 	ld.w      	r8, (r14, 0x0)
  b0:	1401      	addi      	r14, r14, 4
  b2:	783c      	jmp      	r15

000000b4 <isr_tc3_irqhandler>:

ATTRIBUTE_WEAK void isr_tc3_irqhandler(void) {
  b4:	1421      	subi      	r14, r14, 4
  b6:	dd0e2000 	st.w      	r8, (r14, 0x0)
  ba:	6e3b      	mov      	r8, r14
//    H_TC3->ICR = 0xffffffff;
}
  bc:	6c00      	or      	r0, r0
  be:	6fa3      	mov      	r14, r8
  c0:	d90e2000 	ld.w      	r8, (r14, 0x0)
  c4:	1401      	addi      	r14, r14, 4
  c6:	783c      	jmp      	r15

000000c8 <isr_led_irqhandler>:

ATTRIBUTE_WEAK void isr_led_irqhandler(void) {
  c8:	1421      	subi      	r14, r14, 4
  ca:	dd0e2000 	st.w      	r8, (r14, 0x0)
  ce:	6e3b      	mov      	r8, r14
//    H_LED->ICR = 0xffffffff;
}
  d0:	6c00      	or      	r0, r0
  d2:	6fa3      	mov      	r14, r8
  d4:	d90e2000 	ld.w      	r8, (r14, 0x0)
  d8:	1401      	addi      	r14, r14, 4
  da:	783c      	jmp      	r15

000000dc <isr_epwm_irqhandler>:

ATTRIBUTE_WEAK void isr_epwm_irqhandler(void) {
  dc:	1421      	subi      	r14, r14, 4
  de:	dd0e2000 	st.w      	r8, (r14, 0x0)
  e2:	6e3b      	mov      	r8, r14
//    H_EPWM->ICR = 0xffffffff;
}
  e4:	6c00      	or      	r0, r0
  e6:	6fa3      	mov      	r14, r8
  e8:	d90e2000 	ld.w      	r8, (r14, 0x0)
  ec:	1401      	addi      	r14, r14, 4
  ee:	783c      	jmp      	r15

000000f0 <isr_usart_irqhandler>:
//{
//    H_SYSCON->EXICR = 0xffffffff;
//}

ATTRIBUTE_WEAK void isr_usart_irqhandler(void)
{
  f0:	1421      	subi      	r14, r14, 4
  f2:	dd0e2000 	st.w      	r8, (r14, 0x0)
  f6:	6e3b      	mov      	r8, r14
//    handle->ICR = 0xffffffff;
}
  f8:	6c00      	or      	r0, r0
  fa:	6fa3      	mov      	r14, r8
  fc:	d90e2000 	ld.w      	r8, (r14, 0x0)
 100:	1401      	addi      	r14, r14, 4
 102:	783c      	jmp      	r15

00000104 <isr_uart_irqhandler>:

ATTRIBUTE_WEAK void isr_uart_irqhandler(void)
{
 104:	1421      	subi      	r14, r14, 4
 106:	dd0e2000 	st.w      	r8, (r14, 0x0)
 10a:	6e3b      	mov      	r8, r14
//    handle->ISR = 0xffffffff;
}
 10c:	6c00      	or      	r0, r0
 10e:	6fa3      	mov      	r14, r8
 110:	d90e2000 	ld.w      	r8, (r14, 0x0)
 114:	1401      	addi      	r14, r14, 4
 116:	783c      	jmp      	r15

00000118 <isr_i2c_irqhandler>:

ATTRIBUTE_WEAK void isr_i2c_irqhandler(void)
{
 118:	1421      	subi      	r14, r14, 4
 11a:	dd0e2000 	st.w      	r8, (r14, 0x0)
 11e:	6e3b      	mov      	r8, r14
//    handle->CR &= ~(0x1ul<<4);
}
 120:	6c00      	or      	r0, r0
 122:	6fa3      	mov      	r14, r8
 124:	d90e2000 	ld.w      	r8, (r14, 0x0)
 128:	1401      	addi      	r14, r14, 4
 12a:	783c      	jmp      	r15

0000012c <isr_spi_irqhandler>:

ATTRIBUTE_WEAK void isr_spi_irqhandler(void)
{
 12c:	1421      	subi      	r14, r14, 4
 12e:	dd0e2000 	st.w      	r8, (r14, 0x0)
 132:	6e3b      	mov      	r8, r14
//    handle->ICR = 0xffffffff;
}
 134:	6c00      	or      	r0, r0
 136:	6fa3      	mov      	r14, r8
 138:	d90e2000 	ld.w      	r8, (r14, 0x0)
 13c:	1401      	addi      	r14, r14, 4
 13e:	783c      	jmp      	r15

00000140 <isr_tkey_irqhandler>:

ATTRIBUTE_WEAK void isr_tkey_irqhandler(void)
{
 140:	1421      	subi      	r14, r14, 4
 142:	dd0e2000 	st.w      	r8, (r14, 0x0)
 146:	6e3b      	mov      	r8, r14
//    H_TKEY->ICR = 0xffffffff;
}
 148:	6c00      	or      	r0, r0
 14a:	6fa3      	mov      	r14, r8
 14c:	d90e2000 	ld.w      	r8, (r14, 0x0)
 150:	1401      	addi      	r14, r14, 4
 152:	783c      	jmp      	r15

00000154 <isr_comp0_irqhandler>:

ATTRIBUTE_WEAK void isr_comp0_irqhandler(void)
{
 154:	1421      	subi      	r14, r14, 4
 156:	dd0e2000 	st.w      	r8, (r14, 0x0)
 15a:	6e3b      	mov      	r8, r14
//    H_CMP->ICR = 0xffffffff;
}
 15c:	6c00      	or      	r0, r0
 15e:	6fa3      	mov      	r14, r8
 160:	d90e2000 	ld.w      	r8, (r14, 0x0)
 164:	1401      	addi      	r14, r14, 4
 166:	783c      	jmp      	r15

00000168 <isr_comp1_irqhandler>:

ATTRIBUTE_WEAK void isr_comp1_irqhandler(void)
{
 168:	1421      	subi      	r14, r14, 4
 16a:	dd0e2000 	st.w      	r8, (r14, 0x0)
 16e:	6e3b      	mov      	r8, r14
//    H_CMP->ICR = 0xffffffff;
}
 170:	6c00      	or      	r0, r0
 172:	6fa3      	mov      	r14, r8
 174:	d90e2000 	ld.w      	r8, (r14, 0x0)
 178:	1401      	addi      	r14, r14, 4
 17a:	783c      	jmp      	r15

0000017c <CORET_IRQHandler>:




ATTRIBUTE_ISR void CORET_IRQHandler(void)
{
 17c:	1460      	nie
 17e:	1462      	ipush
 180:	1422      	subi      	r14, r14, 8
 182:	dd0e2000 	st.w      	r8, (r14, 0x0)
 186:	ddee2001 	st.w      	r15, (r14, 0x4)
 18a:	6e3b      	mov      	r8, r14
    
    #ifndef CONFIG_KERNEL_FREERTOS
        CSI_INTRPT_EXIT();
    #endif
#else
    ck_coret_irqhandler();
 18c:	e0000000 	bsr      	0x0	// 0 <ck_coret_irqhandler>
#endif
}
 190:	6c00      	or      	r0, r0
 192:	6fa3      	mov      	r14, r8
 194:	d9ee2001 	ld.w      	r15, (r14, 0x4)
 198:	d90e2000 	ld.w      	r8, (r14, 0x0)
 19c:	1402      	addi      	r14, r14, 8
 19e:	1463      	ipop
 1a0:	1461      	nir
	...

000001a4 <SYSCON_IRQHandler>:

ATTRIBUTE_ISR void SYSCON_IRQHandler(void)
{
 1a4:	1460      	nie
 1a6:	1462      	ipush
 1a8:	1422      	subi      	r14, r14, 8
 1aa:	dd0e2000 	st.w      	r8, (r14, 0x0)
 1ae:	ddee2001 	st.w      	r15, (r14, 0x4)
 1b2:	6e3b      	mov      	r8, r14
    CSI_INTRPT_ENTER();

    if (H_SYSCON->ISR & (1ul<<ISOSTBL_EVENT)) {
 1b4:	ea83011d 	lrw      	r3, 0x0	// 628 <EXI3_IRQHandler+0xb0>
 1b8:	9360      	ld.w      	r3, (r3, 0x0)
 1ba:	238b      	addi      	r3, 140
 1bc:	9340      	ld.w      	r2, (r3, 0x0)
 1be:	3301      	movi      	r3, 1
 1c0:	68c8      	and      	r3, r2
 1c2:	3b40      	cmpnei      	r3, 0
 1c4:	0c0d      	bf      	0x1de	// 1de <SYSCON_IRQHandler+0x3a>
        syscon_event_cb (ISOSTBL_EVENT);
 1c6:	ea83011a 	lrw      	r3, 0x0	// 62c <EXI3_IRQHandler+0xb4>
 1ca:	9360      	ld.w      	r3, (r3, 0x0)
 1cc:	3000      	movi      	r0, 0
 1ce:	7bcd      	jsr      	r3
        H_SYSCON->ICR = (1ul<<ISOSTBL_EVENT);
 1d0:	ea830116 	lrw      	r3, 0x0	// 628 <EXI3_IRQHandler+0xb0>
 1d4:	9360      	ld.w      	r3, (r3, 0x0)
 1d6:	2383      	addi      	r3, 132
 1d8:	3201      	movi      	r2, 1
 1da:	b340      	st.w      	r2, (r3, 0x0)
        syscon_event_cb (CMDERR_EVENT);
        H_SYSCON->ICR = (1ul<<CMDERR_EVENT);
    }

    CSI_INTRPT_EXIT();
}
 1dc:	049c      	br      	0x314	// 314 <SYSCON_IRQHandler+0x170>
    } else if (H_SYSCON->ISR & (1ul<<IMOSTBL_EVENT)) {
 1de:	ea830113 	lrw      	r3, 0x0	// 628 <EXI3_IRQHandler+0xb0>
 1e2:	9360      	ld.w      	r3, (r3, 0x0)
 1e4:	238b      	addi      	r3, 140
 1e6:	9340      	ld.w      	r2, (r3, 0x0)
 1e8:	3302      	movi      	r3, 2
 1ea:	68c8      	and      	r3, r2
 1ec:	3b40      	cmpnei      	r3, 0
 1ee:	0c0d      	bf      	0x208	// 208 <SYSCON_IRQHandler+0x64>
        syscon_event_cb (IMOSTBL_EVENT);
 1f0:	ea83010f 	lrw      	r3, 0x0	// 62c <EXI3_IRQHandler+0xb4>
 1f4:	9360      	ld.w      	r3, (r3, 0x0)
 1f6:	3001      	movi      	r0, 1
 1f8:	7bcd      	jsr      	r3
        H_SYSCON->ICR = (1ul<<IMOSTBL_EVENT);
 1fa:	ea83010c 	lrw      	r3, 0x0	// 628 <EXI3_IRQHandler+0xb0>
 1fe:	9360      	ld.w      	r3, (r3, 0x0)
 200:	2383      	addi      	r3, 132
 202:	3202      	movi      	r2, 2
 204:	b340      	st.w      	r2, (r3, 0x0)
}
 206:	0487      	br      	0x314	// 314 <SYSCON_IRQHandler+0x170>
    } else if (H_SYSCON->ISR & (1ul<<EMOSTBL_EVENT)) {
 208:	ea830108 	lrw      	r3, 0x0	// 628 <EXI3_IRQHandler+0xb0>
 20c:	9360      	ld.w      	r3, (r3, 0x0)
 20e:	238b      	addi      	r3, 140
 210:	9340      	ld.w      	r2, (r3, 0x0)
 212:	3308      	movi      	r3, 8
 214:	68c8      	and      	r3, r2
 216:	3b40      	cmpnei      	r3, 0
 218:	0c0d      	bf      	0x232	// 232 <SYSCON_IRQHandler+0x8e>
        syscon_event_cb (EMOSTBL_EVENT);
 21a:	ea830105 	lrw      	r3, 0x0	// 62c <EXI3_IRQHandler+0xb4>
 21e:	9360      	ld.w      	r3, (r3, 0x0)
 220:	3003      	movi      	r0, 3
 222:	7bcd      	jsr      	r3
        H_SYSCON->ICR = (1ul<<EMOSTBL_EVENT);
 224:	ea830101 	lrw      	r3, 0x0	// 628 <EXI3_IRQHandler+0xb0>
 228:	9360      	ld.w      	r3, (r3, 0x0)
 22a:	2383      	addi      	r3, 132
 22c:	3208      	movi      	r2, 8
 22e:	b340      	st.w      	r2, (r3, 0x0)
}
 230:	0472      	br      	0x314	// 314 <SYSCON_IRQHandler+0x170>
    } else if (H_SYSCON->ISR & (1ul<<SYSCLK_EVENT)) {
 232:	0061      	lrw      	r3, 0x0	// 628 <EXI3_IRQHandler+0xb0>
 234:	9360      	ld.w      	r3, (r3, 0x0)
 236:	238b      	addi      	r3, 140
 238:	9340      	ld.w      	r2, (r3, 0x0)
 23a:	3380      	movi      	r3, 128
 23c:	68c8      	and      	r3, r2
 23e:	3b40      	cmpnei      	r3, 0
 240:	0c0b      	bf      	0x256	// 256 <SYSCON_IRQHandler+0xb2>
        syscon_event_cb (SYSCLK_EVENT);
 242:	0064      	lrw      	r3, 0x0	// 62c <EXI3_IRQHandler+0xb4>
 244:	9360      	ld.w      	r3, (r3, 0x0)
 246:	3007      	movi      	r0, 7
 248:	7bcd      	jsr      	r3
        H_SYSCON->ICR = (1ul<<SYSCLK_EVENT);
 24a:	0067      	lrw      	r3, 0x0	// 628 <EXI3_IRQHandler+0xb0>
 24c:	9360      	ld.w      	r3, (r3, 0x0)
 24e:	2383      	addi      	r3, 132
 250:	3280      	movi      	r2, 128
 252:	b340      	st.w      	r2, (r3, 0x0)
}
 254:	0460      	br      	0x314	// 314 <SYSCON_IRQHandler+0x170>
    } else if (H_SYSCON->ISR & (1ul<<IWDTINT_EVENT)) {
 256:	006a      	lrw      	r3, 0x0	// 628 <EXI3_IRQHandler+0xb0>
 258:	9360      	ld.w      	r3, (r3, 0x0)
 25a:	238b      	addi      	r3, 140
 25c:	9340      	ld.w      	r2, (r3, 0x0)
 25e:	3380      	movi      	r3, 128
 260:	4361      	lsli      	r3, r3, 1
 262:	68c8      	and      	r3, r2
 264:	3b40      	cmpnei      	r3, 0
 266:	0c0d      	bf      	0x280	// 280 <SYSCON_IRQHandler+0xdc>
        syscon_event_cb (IWDTINT_EVENT);
 268:	006e      	lrw      	r3, 0x0	// 62c <EXI3_IRQHandler+0xb4>
 26a:	9360      	ld.w      	r3, (r3, 0x0)
 26c:	3008      	movi      	r0, 8
 26e:	7bcd      	jsr      	r3
        H_SYSCON->ICR = (1ul<<IWDTINT_EVENT);
 270:	0071      	lrw      	r3, 0x0	// 628 <EXI3_IRQHandler+0xb0>
 272:	9360      	ld.w      	r3, (r3, 0x0)
 274:	2383      	addi      	r3, 132
 276:	6c8f      	mov      	r2, r3
 278:	3380      	movi      	r3, 128
 27a:	4361      	lsli      	r3, r3, 1
 27c:	b260      	st.w      	r3, (r2, 0x0)
}
 27e:	044b      	br      	0x314	// 314 <SYSCON_IRQHandler+0x170>
    } else if (H_SYSCON->ISR & (1ul<<LVDINT_EVENT)) {
 280:	0075      	lrw      	r3, 0x0	// 628 <EXI3_IRQHandler+0xb0>
 282:	9360      	ld.w      	r3, (r3, 0x0)
 284:	238b      	addi      	r3, 140
 286:	9340      	ld.w      	r2, (r3, 0x0)
 288:	3380      	movi      	r3, 128
 28a:	4364      	lsli      	r3, r3, 4
 28c:	68c8      	and      	r3, r2
 28e:	3b40      	cmpnei      	r3, 0
 290:	0c0d      	bf      	0x2aa	// 2aa <SYSCON_IRQHandler+0x106>
        syscon_event_cb (LVDINT_EVENT);
 292:	0078      	lrw      	r3, 0x0	// 62c <EXI3_IRQHandler+0xb4>
 294:	9360      	ld.w      	r3, (r3, 0x0)
 296:	300b      	movi      	r0, 11
 298:	7bcd      	jsr      	r3
        H_SYSCON->ICR = (1ul<<LVDINT_EVENT);
 29a:	007b      	lrw      	r3, 0x0	// 628 <EXI3_IRQHandler+0xb0>
 29c:	9360      	ld.w      	r3, (r3, 0x0)
 29e:	2383      	addi      	r3, 132
 2a0:	6c8f      	mov      	r2, r3
 2a2:	3380      	movi      	r3, 128
 2a4:	4364      	lsli      	r3, r3, 4
 2a6:	b260      	st.w      	r3, (r2, 0x0)
}
 2a8:	0436      	br      	0x314	// 314 <SYSCON_IRQHandler+0x170>
    } else if (H_SYSCON->ISR & (1ul<<EMFAIL_EVENT)) {
 2aa:	007f      	lrw      	r3, 0x0	// 628 <EXI3_IRQHandler+0xb0>
 2ac:	9360      	ld.w      	r3, (r3, 0x0)
 2ae:	238b      	addi      	r3, 140
 2b0:	9340      	ld.w      	r2, (r3, 0x0)
 2b2:	3380      	movi      	r3, 128
 2b4:	436b      	lsli      	r3, r3, 11
 2b6:	68c8      	and      	r3, r2
 2b8:	3b40      	cmpnei      	r3, 0
 2ba:	0c0d      	bf      	0x2d4	// 2d4 <SYSCON_IRQHandler+0x130>
        syscon_event_cb (EMFAIL_EVENT);
 2bc:	0163      	lrw      	r3, 0x0	// 62c <EXI3_IRQHandler+0xb4>
 2be:	9360      	ld.w      	r3, (r3, 0x0)
 2c0:	3012      	movi      	r0, 18
 2c2:	7bcd      	jsr      	r3
        H_SYSCON->ICR = (1ul<<EMFAIL_EVENT);
 2c4:	0166      	lrw      	r3, 0x0	// 628 <EXI3_IRQHandler+0xb0>
 2c6:	9360      	ld.w      	r3, (r3, 0x0)
 2c8:	2383      	addi      	r3, 132
 2ca:	6c8f      	mov      	r2, r3
 2cc:	3380      	movi      	r3, 128
 2ce:	436b      	lsli      	r3, r3, 11
 2d0:	b260      	st.w      	r3, (r2, 0x0)
}
 2d2:	0421      	br      	0x314	// 314 <SYSCON_IRQHandler+0x170>
    } else if (H_SYSCON->ISR & (1ul<<EMRCV_EVENT)) {
 2d4:	016a      	lrw      	r3, 0x0	// 628 <EXI3_IRQHandler+0xb0>
 2d6:	9360      	ld.w      	r3, (r3, 0x0)
 2d8:	238b      	addi      	r3, 140
 2da:	9340      	ld.w      	r2, (r3, 0x0)
 2dc:	3380      	movi      	r3, 128
 2de:	436c      	lsli      	r3, r3, 12
 2e0:	68c8      	and      	r3, r2
 2e2:	3b40      	cmpnei      	r3, 0
 2e4:	0c0d      	bf      	0x2fe	// 2fe <SYSCON_IRQHandler+0x15a>
        syscon_event_cb (EMRCV_EVENT);
 2e6:	016d      	lrw      	r3, 0x0	// 62c <EXI3_IRQHandler+0xb4>
 2e8:	9360      	ld.w      	r3, (r3, 0x0)
 2ea:	3013      	movi      	r0, 19
 2ec:	7bcd      	jsr      	r3
        H_SYSCON->ICR = (1ul<<EMRCV_EVENT);
 2ee:	0170      	lrw      	r3, 0x0	// 628 <EXI3_IRQHandler+0xb0>
 2f0:	9360      	ld.w      	r3, (r3, 0x0)
 2f2:	2383      	addi      	r3, 132
 2f4:	6c8f      	mov      	r2, r3
 2f6:	3380      	movi      	r3, 128
 2f8:	436c      	lsli      	r3, r3, 12
 2fa:	b260      	st.w      	r3, (r2, 0x0)
}
 2fc:	040c      	br      	0x314	// 314 <SYSCON_IRQHandler+0x170>
        syscon_event_cb (CMDERR_EVENT);
 2fe:	0173      	lrw      	r3, 0x0	// 62c <EXI3_IRQHandler+0xb4>
 300:	9360      	ld.w      	r3, (r3, 0x0)
 302:	301d      	movi      	r0, 29
 304:	7bcd      	jsr      	r3
        H_SYSCON->ICR = (1ul<<CMDERR_EVENT);
 306:	0176      	lrw      	r3, 0x0	// 628 <EXI3_IRQHandler+0xb0>
 308:	9360      	ld.w      	r3, (r3, 0x0)
 30a:	2383      	addi      	r3, 132
 30c:	6c8f      	mov      	r2, r3
 30e:	3380      	movi      	r3, 128
 310:	4376      	lsli      	r3, r3, 22
 312:	b260      	st.w      	r3, (r2, 0x0)
}
 314:	6c00      	or      	r0, r0
 316:	6fa3      	mov      	r14, r8
 318:	d9ee2001 	ld.w      	r15, (r14, 0x4)
 31c:	d90e2000 	ld.w      	r8, (r14, 0x0)
 320:	1402      	addi      	r14, r14, 8
 322:	1463      	ipop
 324:	1461      	nir
	...

00000328 <IFC_IRQHandler>:

ATTRIBUTE_ISR void IFC_IRQHandler(void)
{
 328:	1460      	nie
 32a:	1462      	ipush
 32c:	1422      	subi      	r14, r14, 8
 32e:	dd0e2000 	st.w      	r8, (r14, 0x0)
 332:	ddee2001 	st.w      	r15, (r14, 0x4)
 336:	6e3b      	mov      	r8, r14
    CSI_INTRPT_ENTER();
    isr_ifc_irqhandler();
 338:	e0000000 	bsr      	0x0	// 28 <isr_ifc_irqhandler>
    CSI_INTRPT_EXIT();
}
 33c:	6c00      	or      	r0, r0
 33e:	6fa3      	mov      	r14, r8
 340:	d9ee2001 	ld.w      	r15, (r14, 0x4)
 344:	d90e2000 	ld.w      	r8, (r14, 0x0)
 348:	1402      	addi      	r14, r14, 8
 34a:	1463      	ipop
 34c:	1461      	nir
	...

00000350 <ADC_IRQHandler>:

ATTRIBUTE_ISR void ADC_IRQHandler(void)
{
 350:	1460      	nie
 352:	1462      	ipush
 354:	1422      	subi      	r14, r14, 8
 356:	dd0e2000 	st.w      	r8, (r14, 0x0)
 35a:	ddee2001 	st.w      	r15, (r14, 0x4)
 35e:	6e3b      	mov      	r8, r14
    CSI_INTRPT_ENTER();
    isr_adc_irqhandler();
 360:	e0000000 	bsr      	0x0	// 3c <isr_adc_irqhandler>
    CSI_INTRPT_EXIT();
}
 364:	6c00      	or      	r0, r0
 366:	6fa3      	mov      	r14, r8
 368:	d9ee2001 	ld.w      	r15, (r14, 0x4)
 36c:	d90e2000 	ld.w      	r8, (r14, 0x0)
 370:	1402      	addi      	r14, r14, 8
 372:	1463      	ipop
 374:	1461      	nir
	...

00000378 <TC0_0_IRQHandler>:

ATTRIBUTE_ISR void TC0_0_IRQHandler(void)
{
 378:	1460      	nie
 37a:	1462      	ipush
 37c:	1422      	subi      	r14, r14, 8
 37e:	dd0e2000 	st.w      	r8, (r14, 0x0)
 382:	ddee2001 	st.w      	r15, (r14, 0x4)
 386:	6e3b      	mov      	r8, r14
    CSI_INTRPT_ENTER();
    isr_tc0_0_irqhandler();
 388:	e0000000 	bsr      	0x0	// 50 <isr_tc0_0_irqhandler>
    CSI_INTRPT_EXIT();
}
 38c:	6c00      	or      	r0, r0
 38e:	6fa3      	mov      	r14, r8
 390:	d9ee2001 	ld.w      	r15, (r14, 0x4)
 394:	d90e2000 	ld.w      	r8, (r14, 0x0)
 398:	1402      	addi      	r14, r14, 8
 39a:	1463      	ipop
 39c:	1461      	nir
	...

000003a0 <TC0_1_IRQHandler>:

ATTRIBUTE_ISR void TC0_1_IRQHandler(void)
{
 3a0:	1460      	nie
 3a2:	1462      	ipush
 3a4:	1422      	subi      	r14, r14, 8
 3a6:	dd0e2000 	st.w      	r8, (r14, 0x0)
 3aa:	ddee2001 	st.w      	r15, (r14, 0x4)
 3ae:	6e3b      	mov      	r8, r14
    CSI_INTRPT_ENTER();
    isr_tc0_1_irqhandler();
 3b0:	e0000000 	bsr      	0x0	// 64 <isr_tc0_1_irqhandler>
    CSI_INTRPT_EXIT();
}
 3b4:	6c00      	or      	r0, r0
 3b6:	6fa3      	mov      	r14, r8
 3b8:	d9ee2001 	ld.w      	r15, (r14, 0x4)
 3bc:	d90e2000 	ld.w      	r8, (r14, 0x0)
 3c0:	1402      	addi      	r14, r14, 8
 3c2:	1463      	ipop
 3c4:	1461      	nir
	...

000003c8 <TC0_2_IRQHandler>:

ATTRIBUTE_ISR void TC0_2_IRQHandler(void)
{
 3c8:	1460      	nie
 3ca:	1462      	ipush
 3cc:	1422      	subi      	r14, r14, 8
 3ce:	dd0e2000 	st.w      	r8, (r14, 0x0)
 3d2:	ddee2001 	st.w      	r15, (r14, 0x4)
 3d6:	6e3b      	mov      	r8, r14
    CSI_INTRPT_ENTER();
    isr_tc0_2_irqhandler();
 3d8:	e0000000 	bsr      	0x0	// 78 <isr_tc0_2_irqhandler>
    CSI_INTRPT_EXIT();
}
 3dc:	6c00      	or      	r0, r0
 3de:	6fa3      	mov      	r14, r8
 3e0:	d9ee2001 	ld.w      	r15, (r14, 0x4)
 3e4:	d90e2000 	ld.w      	r8, (r14, 0x0)
 3e8:	1402      	addi      	r14, r14, 8
 3ea:	1463      	ipop
 3ec:	1461      	nir
	...

000003f0 <TC1_IRQHandler>:

ATTRIBUTE_ISR void TC1_IRQHandler(void)
{
 3f0:	1460      	nie
 3f2:	1462      	ipush
 3f4:	1422      	subi      	r14, r14, 8
 3f6:	dd0e2000 	st.w      	r8, (r14, 0x0)
 3fa:	ddee2001 	st.w      	r15, (r14, 0x4)
 3fe:	6e3b      	mov      	r8, r14
    CSI_INTRPT_ENTER();
    isr_tc1_irqhandler();
 400:	e0000000 	bsr      	0x0	// 8c <isr_tc1_irqhandler>
    CSI_INTRPT_EXIT();
}
 404:	6c00      	or      	r0, r0
 406:	6fa3      	mov      	r14, r8
 408:	d9ee2001 	ld.w      	r15, (r14, 0x4)
 40c:	d90e2000 	ld.w      	r8, (r14, 0x0)
 410:	1402      	addi      	r14, r14, 8
 412:	1463      	ipop
 414:	1461      	nir
	...

00000418 <TC2_IRQHandler>:

ATTRIBUTE_ISR void TC2_IRQHandler(void)
{
 418:	1460      	nie
 41a:	1462      	ipush
 41c:	1422      	subi      	r14, r14, 8
 41e:	dd0e2000 	st.w      	r8, (r14, 0x0)
 422:	ddee2001 	st.w      	r15, (r14, 0x4)
 426:	6e3b      	mov      	r8, r14
    CSI_INTRPT_ENTER();
    isr_tc2_irqhandler();
 428:	e0000000 	bsr      	0x0	// a0 <isr_tc2_irqhandler>
    CSI_INTRPT_EXIT();
}
 42c:	6c00      	or      	r0, r0
 42e:	6fa3      	mov      	r14, r8
 430:	d9ee2001 	ld.w      	r15, (r14, 0x4)
 434:	d90e2000 	ld.w      	r8, (r14, 0x0)
 438:	1402      	addi      	r14, r14, 8
 43a:	1463      	ipop
 43c:	1461      	nir
	...

00000440 <TC3_IRQHandler>:

ATTRIBUTE_ISR void TC3_IRQHandler(void)
{
 440:	1460      	nie
 442:	1462      	ipush
 444:	1422      	subi      	r14, r14, 8
 446:	dd0e2000 	st.w      	r8, (r14, 0x0)
 44a:	ddee2001 	st.w      	r15, (r14, 0x4)
 44e:	6e3b      	mov      	r8, r14
    CSI_INTRPT_ENTER();
    isr_tc3_irqhandler();
 450:	e0000000 	bsr      	0x0	// b4 <isr_tc3_irqhandler>
    CSI_INTRPT_EXIT();
}
 454:	6c00      	or      	r0, r0
 456:	6fa3      	mov      	r14, r8
 458:	d9ee2001 	ld.w      	r15, (r14, 0x4)
 45c:	d90e2000 	ld.w      	r8, (r14, 0x0)
 460:	1402      	addi      	r14, r14, 8
 462:	1463      	ipop
 464:	1461      	nir
	...

00000468 <LED_IRQHandler>:

ATTRIBUTE_ISR void LED_IRQHandler(void)
{
 468:	1460      	nie
 46a:	1462      	ipush
 46c:	1422      	subi      	r14, r14, 8
 46e:	dd0e2000 	st.w      	r8, (r14, 0x0)
 472:	ddee2001 	st.w      	r15, (r14, 0x4)
 476:	6e3b      	mov      	r8, r14
    CSI_INTRPT_ENTER();
    isr_led_irqhandler();
 478:	e0000000 	bsr      	0x0	// c8 <isr_led_irqhandler>
    CSI_INTRPT_EXIT();
}
 47c:	6c00      	or      	r0, r0
 47e:	6fa3      	mov      	r14, r8
 480:	d9ee2001 	ld.w      	r15, (r14, 0x4)
 484:	d90e2000 	ld.w      	r8, (r14, 0x0)
 488:	1402      	addi      	r14, r14, 8
 48a:	1463      	ipop
 48c:	1461      	nir
	...

00000490 <EPWM_IRQHandler>:

ATTRIBUTE_ISR void EPWM_IRQHandler(void)
{
 490:	1460      	nie
 492:	1462      	ipush
 494:	1422      	subi      	r14, r14, 8
 496:	dd0e2000 	st.w      	r8, (r14, 0x0)
 49a:	ddee2001 	st.w      	r15, (r14, 0x4)
 49e:	6e3b      	mov      	r8, r14
    CSI_INTRPT_ENTER();
    isr_epwm_irqhandler();
 4a0:	e0000000 	bsr      	0x0	// dc <isr_epwm_irqhandler>
    CSI_INTRPT_EXIT();
}
 4a4:	6c00      	or      	r0, r0
 4a6:	6fa3      	mov      	r14, r8
 4a8:	d9ee2001 	ld.w      	r15, (r14, 0x4)
 4ac:	d90e2000 	ld.w      	r8, (r14, 0x0)
 4b0:	1402      	addi      	r14, r14, 8
 4b2:	1463      	ipop
 4b4:	1461      	nir
	...

000004b8 <EXI0_IRQHandler>:

ATTRIBUTE_ISR void EXI0_IRQHandler(void)
{
 4b8:	1460      	nie
 4ba:	1462      	ipush
 4bc:	1422      	subi      	r14, r14, 8
 4be:	dd0e2000 	st.w      	r8, (r14, 0x0)
 4c2:	ddee2001 	st.w      	r15, (r14, 0x4)
 4c6:	6e3b      	mov      	r8, r14
    CSI_INTRPT_ENTER();
    gpio_exi_cb(EXI_EVENT_0);
 4c8:	127a      	lrw      	r3, 0x0	// 630 <EXI3_IRQHandler+0xb8>
 4ca:	9360      	ld.w      	r3, (r3, 0x0)
 4cc:	3000      	movi      	r0, 0
 4ce:	7bcd      	jsr      	r3
    H_SYSCON->EXICR = 1ul<<EXI_EVENT_0;
 4d0:	1276      	lrw      	r3, 0x0	// 628 <EXI3_IRQHandler+0xb0>
 4d2:	9360      	ld.w      	r3, (r3, 0x0)
 4d4:	23ab      	addi      	r3, 172
 4d6:	3201      	movi      	r2, 1
 4d8:	b340      	st.w      	r2, (r3, 0x0)
    CSI_INTRPT_EXIT();
}
 4da:	6c00      	or      	r0, r0
 4dc:	6fa3      	mov      	r14, r8
 4de:	d9ee2001 	ld.w      	r15, (r14, 0x4)
 4e2:	d90e2000 	ld.w      	r8, (r14, 0x0)
 4e6:	1402      	addi      	r14, r14, 8
 4e8:	1463      	ipop
 4ea:	1461      	nir

000004ec <EXI1_IRQHandler>:

ATTRIBUTE_ISR void EXI1_IRQHandler(void)
{
 4ec:	1460      	nie
 4ee:	1462      	ipush
 4f0:	1422      	subi      	r14, r14, 8
 4f2:	dd0e2000 	st.w      	r8, (r14, 0x0)
 4f6:	ddee2001 	st.w      	r15, (r14, 0x4)
 4fa:	6e3b      	mov      	r8, r14
    CSI_INTRPT_ENTER();
    gpio_exi_cb(EXI_EVENT_1);
 4fc:	126d      	lrw      	r3, 0x0	// 630 <EXI3_IRQHandler+0xb8>
 4fe:	9360      	ld.w      	r3, (r3, 0x0)
 500:	3001      	movi      	r0, 1
 502:	7bcd      	jsr      	r3
    H_SYSCON->EXICR = 1ul<<EXI_EVENT_1;
 504:	1269      	lrw      	r3, 0x0	// 628 <EXI3_IRQHandler+0xb0>
 506:	9360      	ld.w      	r3, (r3, 0x0)
 508:	23ab      	addi      	r3, 172
 50a:	3202      	movi      	r2, 2
 50c:	b340      	st.w      	r2, (r3, 0x0)
    CSI_INTRPT_EXIT();
}
 50e:	6c00      	or      	r0, r0
 510:	6fa3      	mov      	r14, r8
 512:	d9ee2001 	ld.w      	r15, (r14, 0x4)
 516:	d90e2000 	ld.w      	r8, (r14, 0x0)
 51a:	1402      	addi      	r14, r14, 8
 51c:	1463      	ipop
 51e:	1461      	nir

00000520 <EXI2_IRQHandler>:

ATTRIBUTE_ISR void EXI2_IRQHandler(void)
{
 520:	1460      	nie
 522:	1462      	ipush
 524:	1422      	subi      	r14, r14, 8
 526:	dd0e2000 	st.w      	r8, (r14, 0x0)
 52a:	ddee2001 	st.w      	r15, (r14, 0x4)
 52e:	6e3b      	mov      	r8, r14
    CSI_INTRPT_ENTER();
    if (H_SYSCON->EXICR & (1ul<<EXI_EVENT_2)) {
 530:	117e      	lrw      	r3, 0x0	// 628 <EXI3_IRQHandler+0xb0>
 532:	9360      	ld.w      	r3, (r3, 0x0)
 534:	23ab      	addi      	r3, 172
 536:	9340      	ld.w      	r2, (r3, 0x0)
 538:	3304      	movi      	r3, 4
 53a:	68c8      	and      	r3, r2
 53c:	3b40      	cmpnei      	r3, 0
 53e:	0c0b      	bf      	0x554	// 554 <EXI2_IRQHandler+0x34>
        gpio_exi_cb(EXI_EVENT_2);
 540:	117c      	lrw      	r3, 0x0	// 630 <EXI3_IRQHandler+0xb8>
 542:	9360      	ld.w      	r3, (r3, 0x0)
 544:	3002      	movi      	r0, 2
 546:	7bcd      	jsr      	r3
        H_SYSCON->EXICR = (1ul<<EXI_EVENT_2);
 548:	1178      	lrw      	r3, 0x0	// 628 <EXI3_IRQHandler+0xb0>
 54a:	9360      	ld.w      	r3, (r3, 0x0)
 54c:	23ab      	addi      	r3, 172
 54e:	3204      	movi      	r2, 4
 550:	b340      	st.w      	r2, (r3, 0x0)
    } else {
        gpio_exi_cb(EXI_EVENT_3);
        H_SYSCON->EXICR = (1ul<<EXI_EVENT_3);
    }
    CSI_INTRPT_EXIT();
}
 552:	040a      	br      	0x566	// 566 <EXI2_IRQHandler+0x46>
        gpio_exi_cb(EXI_EVENT_3);
 554:	1177      	lrw      	r3, 0x0	// 630 <EXI3_IRQHandler+0xb8>
 556:	9360      	ld.w      	r3, (r3, 0x0)
 558:	3003      	movi      	r0, 3
 55a:	7bcd      	jsr      	r3
        H_SYSCON->EXICR = (1ul<<EXI_EVENT_3);
 55c:	1173      	lrw      	r3, 0x0	// 628 <EXI3_IRQHandler+0xb0>
 55e:	9360      	ld.w      	r3, (r3, 0x0)
 560:	23ab      	addi      	r3, 172
 562:	3208      	movi      	r2, 8
 564:	b340      	st.w      	r2, (r3, 0x0)
}
 566:	6c00      	or      	r0, r0
 568:	6fa3      	mov      	r14, r8
 56a:	d9ee2001 	ld.w      	r15, (r14, 0x4)
 56e:	d90e2000 	ld.w      	r8, (r14, 0x0)
 572:	1402      	addi      	r14, r14, 8
 574:	1463      	ipop
 576:	1461      	nir

00000578 <EXI3_IRQHandler>:

ATTRIBUTE_ISR void EXI3_IRQHandler(void)
{
 578:	1460      	nie
 57a:	1462      	ipush
 57c:	1422      	subi      	r14, r14, 8
 57e:	dd0e2000 	st.w      	r8, (r14, 0x0)
 582:	ddee2001 	st.w      	r15, (r14, 0x4)
 586:	6e3b      	mov      	r8, r14
    CSI_INTRPT_ENTER();
    if (H_SYSCON->EXICR & (1ul<<EXI_EVENT_4)) {
 588:	1168      	lrw      	r3, 0x0	// 628 <EXI3_IRQHandler+0xb0>
 58a:	9360      	ld.w      	r3, (r3, 0x0)
 58c:	23ab      	addi      	r3, 172
 58e:	9340      	ld.w      	r2, (r3, 0x0)
 590:	3310      	movi      	r3, 16
 592:	68c8      	and      	r3, r2
 594:	3b40      	cmpnei      	r3, 0
 596:	0c0b      	bf      	0x5ac	// 5ac <EXI3_IRQHandler+0x34>
        gpio_exi_cb(EXI_EVENT_4);
 598:	1166      	lrw      	r3, 0x0	// 630 <EXI3_IRQHandler+0xb8>
 59a:	9360      	ld.w      	r3, (r3, 0x0)
 59c:	3004      	movi      	r0, 4
 59e:	7bcd      	jsr      	r3
        H_SYSCON->EXICR = (1ul<<EXI_EVENT_4);
 5a0:	1162      	lrw      	r3, 0x0	// 628 <EXI3_IRQHandler+0xb0>
 5a2:	9360      	ld.w      	r3, (r3, 0x0)
 5a4:	23ab      	addi      	r3, 172
 5a6:	3210      	movi      	r2, 16
 5a8:	b340      	st.w      	r2, (r3, 0x0)
    } else {
        gpio_exi_cb(EXI_EVENT_9);
        H_SYSCON->EXICR = 1ul<<EXI_EVENT_9;
    }
    CSI_INTRPT_EXIT();
}
 5aa:	045f      	br      	0x668	// 668 <EXI3_IRQHandler+0xf0>
    } else if (H_SYSCON->EXICR & (1ul<<EXI_EVENT_5)) {
 5ac:	107f      	lrw      	r3, 0x0	// 628 <EXI3_IRQHandler+0xb0>
 5ae:	9360      	ld.w      	r3, (r3, 0x0)
 5b0:	23ab      	addi      	r3, 172
 5b2:	9340      	ld.w      	r2, (r3, 0x0)
 5b4:	3320      	movi      	r3, 32
 5b6:	68c8      	and      	r3, r2
 5b8:	3b40      	cmpnei      	r3, 0
 5ba:	0c0b      	bf      	0x5d0	// 5d0 <EXI3_IRQHandler+0x58>
        gpio_exi_cb(EXI_EVENT_5);
 5bc:	107d      	lrw      	r3, 0x0	// 630 <EXI3_IRQHandler+0xb8>
 5be:	9360      	ld.w      	r3, (r3, 0x0)
 5c0:	3005      	movi      	r0, 5
 5c2:	7bcd      	jsr      	r3
        H_SYSCON->EXICR = (1ul<<EXI_EVENT_5);
 5c4:	1079      	lrw      	r3, 0x0	// 628 <EXI3_IRQHandler+0xb0>
 5c6:	9360      	ld.w      	r3, (r3, 0x0)
 5c8:	23ab      	addi      	r3, 172
 5ca:	3220      	movi      	r2, 32
 5cc:	b340      	st.w      	r2, (r3, 0x0)
}
 5ce:	044d      	br      	0x668	// 668 <EXI3_IRQHandler+0xf0>
    } else if (H_SYSCON->EXICR & (1ul<<EXI_EVENT_6)) {
 5d0:	1076      	lrw      	r3, 0x0	// 628 <EXI3_IRQHandler+0xb0>
 5d2:	9360      	ld.w      	r3, (r3, 0x0)
 5d4:	23ab      	addi      	r3, 172
 5d6:	9340      	ld.w      	r2, (r3, 0x0)
 5d8:	3340      	movi      	r3, 64
 5da:	68c8      	and      	r3, r2
 5dc:	3b40      	cmpnei      	r3, 0
 5de:	0c0b      	bf      	0x5f4	// 5f4 <EXI3_IRQHandler+0x7c>
        gpio_exi_cb(EXI_EVENT_6);
 5e0:	1074      	lrw      	r3, 0x0	// 630 <EXI3_IRQHandler+0xb8>
 5e2:	9360      	ld.w      	r3, (r3, 0x0)
 5e4:	3006      	movi      	r0, 6
 5e6:	7bcd      	jsr      	r3
        H_SYSCON->EXICR = 1ul<<EXI_EVENT_6;
 5e8:	1070      	lrw      	r3, 0x0	// 628 <EXI3_IRQHandler+0xb0>
 5ea:	9360      	ld.w      	r3, (r3, 0x0)
 5ec:	23ab      	addi      	r3, 172
 5ee:	3240      	movi      	r2, 64
 5f0:	b340      	st.w      	r2, (r3, 0x0)
}
 5f2:	043b      	br      	0x668	// 668 <EXI3_IRQHandler+0xf0>
    } else if (H_SYSCON->EXICR & (1ul<<EXI_EVENT_7)) {
 5f4:	106d      	lrw      	r3, 0x0	// 628 <EXI3_IRQHandler+0xb0>
 5f6:	9360      	ld.w      	r3, (r3, 0x0)
 5f8:	23ab      	addi      	r3, 172
 5fa:	9340      	ld.w      	r2, (r3, 0x0)
 5fc:	3380      	movi      	r3, 128
 5fe:	68c8      	and      	r3, r2
 600:	3b40      	cmpnei      	r3, 0
 602:	0c0b      	bf      	0x618	// 618 <EXI3_IRQHandler+0xa0>
        gpio_exi_cb(EXI_EVENT_7);
 604:	106b      	lrw      	r3, 0x0	// 630 <EXI3_IRQHandler+0xb8>
 606:	9360      	ld.w      	r3, (r3, 0x0)
 608:	3007      	movi      	r0, 7
 60a:	7bcd      	jsr      	r3
        H_SYSCON->EXICR = 1ul<<EXI_EVENT_7;
 60c:	1067      	lrw      	r3, 0x0	// 628 <EXI3_IRQHandler+0xb0>
 60e:	9360      	ld.w      	r3, (r3, 0x0)
 610:	23ab      	addi      	r3, 172
 612:	3280      	movi      	r2, 128
 614:	b340      	st.w      	r2, (r3, 0x0)
}
 616:	0429      	br      	0x668	// 668 <EXI3_IRQHandler+0xf0>
    } else if (H_SYSCON->EXICR & (1ul<<EXI_EVENT_8)) {
 618:	1064      	lrw      	r3, 0x0	// 628 <EXI3_IRQHandler+0xb0>
 61a:	9360      	ld.w      	r3, (r3, 0x0)
 61c:	23ab      	addi      	r3, 172
 61e:	9340      	ld.w      	r2, (r3, 0x0)
 620:	3380      	movi      	r3, 128
 622:	4361      	lsli      	r3, r3, 1
 624:	0408      	br      	0x634	// 634 <EXI3_IRQHandler+0xbc>
	...
 632:	0000      	.short	0x0000
 634:	68c8      	and      	r3, r2
 636:	3b40      	cmpnei      	r3, 0
 638:	0c0d      	bf      	0x652	// 652 <EXI3_IRQHandler+0xda>
        gpio_exi_cb(EXI_EVENT_8);
 63a:	0377      	lrw      	r3, 0x0	// 858 <CMP1_IRQHandler+0x28>
 63c:	9360      	ld.w      	r3, (r3, 0x0)
 63e:	3008      	movi      	r0, 8
 640:	7bcd      	jsr      	r3
        H_SYSCON->EXICR = 1ul<<EXI_EVENT_8;
 642:	0378      	lrw      	r3, 0x0	// 85c <CMP1_IRQHandler+0x2c>
 644:	9360      	ld.w      	r3, (r3, 0x0)
 646:	23ab      	addi      	r3, 172
 648:	6c8f      	mov      	r2, r3
 64a:	3380      	movi      	r3, 128
 64c:	4361      	lsli      	r3, r3, 1
 64e:	b260      	st.w      	r3, (r2, 0x0)
}
 650:	040c      	br      	0x668	// 668 <EXI3_IRQHandler+0xf0>
        gpio_exi_cb(EXI_EVENT_9);
 652:	037d      	lrw      	r3, 0x0	// 858 <CMP1_IRQHandler+0x28>
 654:	9360      	ld.w      	r3, (r3, 0x0)
 656:	3009      	movi      	r0, 9
 658:	7bcd      	jsr      	r3
        H_SYSCON->EXICR = 1ul<<EXI_EVENT_9;
 65a:	037e      	lrw      	r3, 0x0	// 85c <CMP1_IRQHandler+0x2c>
 65c:	9360      	ld.w      	r3, (r3, 0x0)
 65e:	23ab      	addi      	r3, 172
 660:	6c8f      	mov      	r2, r3
 662:	3380      	movi      	r3, 128
 664:	4362      	lsli      	r3, r3, 2
 666:	b260      	st.w      	r3, (r2, 0x0)
}
 668:	6c00      	or      	r0, r0
 66a:	6fa3      	mov      	r14, r8
 66c:	d9ee2001 	ld.w      	r15, (r14, 0x4)
 670:	d90e2000 	ld.w      	r8, (r14, 0x0)
 674:	1402      	addi      	r14, r14, 8
 676:	1463      	ipop
 678:	1461      	nir
	...

0000067c <EXI4_IRQHandler>:

ATTRIBUTE_ISR void EXI4_IRQHandler(void)
{
 67c:	1460      	nie
 67e:	1462      	ipush
 680:	1422      	subi      	r14, r14, 8
 682:	dd0e2000 	st.w      	r8, (r14, 0x0)
 686:	ddee2001 	st.w      	r15, (r14, 0x4)
 68a:	6e3b      	mov      	r8, r14
    CSI_INTRPT_ENTER();
    if (H_SYSCON->EXICR & (1ul<<EXI_EVENT_10)) {
 68c:	1374      	lrw      	r3, 0x0	// 85c <CMP1_IRQHandler+0x2c>
 68e:	9360      	ld.w      	r3, (r3, 0x0)
 690:	23ab      	addi      	r3, 172
 692:	9340      	ld.w      	r2, (r3, 0x0)
 694:	3380      	movi      	r3, 128
 696:	4363      	lsli      	r3, r3, 3
 698:	68c8      	and      	r3, r2
 69a:	3b40      	cmpnei      	r3, 0
 69c:	0c0d      	bf      	0x6b6	// 6b6 <EXI4_IRQHandler+0x3a>
        gpio_exi_cb(EXI_EVENT_10);
 69e:	136f      	lrw      	r3, 0x0	// 858 <CMP1_IRQHandler+0x28>
 6a0:	9360      	ld.w      	r3, (r3, 0x0)
 6a2:	300a      	movi      	r0, 10
 6a4:	7bcd      	jsr      	r3
        H_SYSCON->EXICR = 1ul<<EXI_EVENT_10;
 6a6:	136e      	lrw      	r3, 0x0	// 85c <CMP1_IRQHandler+0x2c>
 6a8:	9360      	ld.w      	r3, (r3, 0x0)
 6aa:	23ab      	addi      	r3, 172
 6ac:	6c8f      	mov      	r2, r3
 6ae:	3380      	movi      	r3, 128
 6b0:	4363      	lsli      	r3, r3, 3
 6b2:	b260      	st.w      	r3, (r2, 0x0)
    } else {
        gpio_exi_cb(EXI_EVENT_15);
        H_SYSCON->EXICR = 1ul<<EXI_EVENT_15;
    }
    CSI_INTRPT_EXIT();
}
 6b4:	0460      	br      	0x774	// 774 <EXI4_IRQHandler+0xf8>
    } else if (H_SYSCON->EXICR & (1ul<<EXI_EVENT_11)) {
 6b6:	136a      	lrw      	r3, 0x0	// 85c <CMP1_IRQHandler+0x2c>
 6b8:	9360      	ld.w      	r3, (r3, 0x0)
 6ba:	23ab      	addi      	r3, 172
 6bc:	9340      	ld.w      	r2, (r3, 0x0)
 6be:	3380      	movi      	r3, 128
 6c0:	4364      	lsli      	r3, r3, 4
 6c2:	68c8      	and      	r3, r2
 6c4:	3b40      	cmpnei      	r3, 0
 6c6:	0c0d      	bf      	0x6e0	// 6e0 <EXI4_IRQHandler+0x64>
        gpio_exi_cb(EXI_EVENT_11);
 6c8:	1364      	lrw      	r3, 0x0	// 858 <CMP1_IRQHandler+0x28>
 6ca:	9360      	ld.w      	r3, (r3, 0x0)
 6cc:	300b      	movi      	r0, 11
 6ce:	7bcd      	jsr      	r3
        H_SYSCON->EXICR = 1ul<<EXI_EVENT_11;
 6d0:	1363      	lrw      	r3, 0x0	// 85c <CMP1_IRQHandler+0x2c>
 6d2:	9360      	ld.w      	r3, (r3, 0x0)
 6d4:	23ab      	addi      	r3, 172
 6d6:	6c8f      	mov      	r2, r3
 6d8:	3380      	movi      	r3, 128
 6da:	4364      	lsli      	r3, r3, 4
 6dc:	b260      	st.w      	r3, (r2, 0x0)
}
 6de:	044b      	br      	0x774	// 774 <EXI4_IRQHandler+0xf8>
    } else if (H_SYSCON->EXICR & (1ul<<EXI_EVENT_12)) {
 6e0:	127f      	lrw      	r3, 0x0	// 85c <CMP1_IRQHandler+0x2c>
 6e2:	9360      	ld.w      	r3, (r3, 0x0)
 6e4:	23ab      	addi      	r3, 172
 6e6:	9340      	ld.w      	r2, (r3, 0x0)
 6e8:	3380      	movi      	r3, 128
 6ea:	4365      	lsli      	r3, r3, 5
 6ec:	68c8      	and      	r3, r2
 6ee:	3b40      	cmpnei      	r3, 0
 6f0:	0c0d      	bf      	0x70a	// 70a <EXI4_IRQHandler+0x8e>
        gpio_exi_cb(EXI_EVENT_12);
 6f2:	127a      	lrw      	r3, 0x0	// 858 <CMP1_IRQHandler+0x28>
 6f4:	9360      	ld.w      	r3, (r3, 0x0)
 6f6:	300c      	movi      	r0, 12
 6f8:	7bcd      	jsr      	r3
        H_SYSCON->EXICR = 1ul<<EXI_EVENT_12;
 6fa:	1279      	lrw      	r3, 0x0	// 85c <CMP1_IRQHandler+0x2c>
 6fc:	9360      	ld.w      	r3, (r3, 0x0)
 6fe:	23ab      	addi      	r3, 172
 700:	6c8f      	mov      	r2, r3
 702:	3380      	movi      	r3, 128
 704:	4365      	lsli      	r3, r3, 5
 706:	b260      	st.w      	r3, (r2, 0x0)
}
 708:	0436      	br      	0x774	// 774 <EXI4_IRQHandler+0xf8>
    } else if (H_SYSCON->EXICR & (1ul<<EXI_EVENT_13)) {
 70a:	1275      	lrw      	r3, 0x0	// 85c <CMP1_IRQHandler+0x2c>
 70c:	9360      	ld.w      	r3, (r3, 0x0)
 70e:	23ab      	addi      	r3, 172
 710:	9340      	ld.w      	r2, (r3, 0x0)
 712:	3380      	movi      	r3, 128
 714:	4366      	lsli      	r3, r3, 6
 716:	68c8      	and      	r3, r2
 718:	3b40      	cmpnei      	r3, 0
 71a:	0c0d      	bf      	0x734	// 734 <EXI4_IRQHandler+0xb8>
        gpio_exi_cb(EXI_EVENT_13);
 71c:	126f      	lrw      	r3, 0x0	// 858 <CMP1_IRQHandler+0x28>
 71e:	9360      	ld.w      	r3, (r3, 0x0)
 720:	300d      	movi      	r0, 13
 722:	7bcd      	jsr      	r3
        H_SYSCON->EXICR = 1ul<<EXI_EVENT_13;
 724:	126e      	lrw      	r3, 0x0	// 85c <CMP1_IRQHandler+0x2c>
 726:	9360      	ld.w      	r3, (r3, 0x0)
 728:	23ab      	addi      	r3, 172
 72a:	6c8f      	mov      	r2, r3
 72c:	3380      	movi      	r3, 128
 72e:	4366      	lsli      	r3, r3, 6
 730:	b260      	st.w      	r3, (r2, 0x0)
}
 732:	0421      	br      	0x774	// 774 <EXI4_IRQHandler+0xf8>
    } else if (H_SYSCON->EXICR & (1ul<<EXI_EVENT_14)) {
 734:	126a      	lrw      	r3, 0x0	// 85c <CMP1_IRQHandler+0x2c>
 736:	9360      	ld.w      	r3, (r3, 0x0)
 738:	23ab      	addi      	r3, 172
 73a:	9340      	ld.w      	r2, (r3, 0x0)
 73c:	3380      	movi      	r3, 128
 73e:	4367      	lsli      	r3, r3, 7
 740:	68c8      	and      	r3, r2
 742:	3b40      	cmpnei      	r3, 0
 744:	0c0d      	bf      	0x75e	// 75e <EXI4_IRQHandler+0xe2>
        gpio_exi_cb(EXI_EVENT_14);
 746:	1265      	lrw      	r3, 0x0	// 858 <CMP1_IRQHandler+0x28>
 748:	9360      	ld.w      	r3, (r3, 0x0)
 74a:	300e      	movi      	r0, 14
 74c:	7bcd      	jsr      	r3
        H_SYSCON->EXICR = 1ul<<EXI_EVENT_14;
 74e:	1264      	lrw      	r3, 0x0	// 85c <CMP1_IRQHandler+0x2c>
 750:	9360      	ld.w      	r3, (r3, 0x0)
 752:	23ab      	addi      	r3, 172
 754:	6c8f      	mov      	r2, r3
 756:	3380      	movi      	r3, 128
 758:	4367      	lsli      	r3, r3, 7
 75a:	b260      	st.w      	r3, (r2, 0x0)
}
 75c:	040c      	br      	0x774	// 774 <EXI4_IRQHandler+0xf8>
        gpio_exi_cb(EXI_EVENT_15);
 75e:	117f      	lrw      	r3, 0x0	// 858 <CMP1_IRQHandler+0x28>
 760:	9360      	ld.w      	r3, (r3, 0x0)
 762:	300f      	movi      	r0, 15
 764:	7bcd      	jsr      	r3
        H_SYSCON->EXICR = 1ul<<EXI_EVENT_15;
 766:	117e      	lrw      	r3, 0x0	// 85c <CMP1_IRQHandler+0x2c>
 768:	9360      	ld.w      	r3, (r3, 0x0)
 76a:	23ab      	addi      	r3, 172
 76c:	6c8f      	mov      	r2, r3
 76e:	3380      	movi      	r3, 128
 770:	4368      	lsli      	r3, r3, 8
 772:	b260      	st.w      	r3, (r2, 0x0)
}
 774:	6c00      	or      	r0, r0
 776:	6fa3      	mov      	r14, r8
 778:	d9ee2001 	ld.w      	r15, (r14, 0x4)
 77c:	d90e2000 	ld.w      	r8, (r14, 0x0)
 780:	1402      	addi      	r14, r14, 8
 782:	1463      	ipop
 784:	1461      	nir
	...

00000788 <UART0_IRQHandler>:

ATTRIBUTE_ISR void UART0_IRQHandler(void)
{
 788:	1460      	nie
 78a:	1462      	ipush
 78c:	1421      	subi      	r14, r14, 4
 78e:	dd0e2000 	st.w      	r8, (r14, 0x0)
 792:	6e3b      	mov      	r8, r14
    CSI_INTRPT_ENTER();
//    isr_usart_irqhandler(H_UART0);
    CSI_INTRPT_EXIT();
}
 794:	6c00      	or      	r0, r0
 796:	6fa3      	mov      	r14, r8
 798:	d90e2000 	ld.w      	r8, (r14, 0x0)
 79c:	1401      	addi      	r14, r14, 4
 79e:	1463      	ipop
 7a0:	1461      	nir
	...

000007a4 <UART1_IRQHandler>:

ATTRIBUTE_ISR void UART1_IRQHandler(void)
{
 7a4:	1460      	nie
 7a6:	1462      	ipush
 7a8:	1421      	subi      	r14, r14, 4
 7aa:	dd0e2000 	st.w      	r8, (r14, 0x0)
 7ae:	6e3b      	mov      	r8, r14
    CSI_INTRPT_ENTER();
//    isr_uart_irqhandler(H_UART1);
    CSI_INTRPT_EXIT();
}
 7b0:	6c00      	or      	r0, r0
 7b2:	6fa3      	mov      	r14, r8
 7b4:	d90e2000 	ld.w      	r8, (r14, 0x0)
 7b8:	1401      	addi      	r14, r14, 4
 7ba:	1463      	ipop
 7bc:	1461      	nir
	...

000007c0 <I2C0_IRQHandler>:

ATTRIBUTE_ISR void I2C0_IRQHandler(void)
{
 7c0:	1460      	nie
 7c2:	1462      	ipush
 7c4:	1421      	subi      	r14, r14, 4
 7c6:	dd0e2000 	st.w      	r8, (r14, 0x0)
 7ca:	6e3b      	mov      	r8, r14
    CSI_INTRPT_ENTER();
//    isr_i2c_irqhandler(H_I2C);
    CSI_INTRPT_EXIT();
}
 7cc:	6c00      	or      	r0, r0
 7ce:	6fa3      	mov      	r14, r8
 7d0:	d90e2000 	ld.w      	r8, (r14, 0x0)
 7d4:	1401      	addi      	r14, r14, 4
 7d6:	1463      	ipop
 7d8:	1461      	nir
	...

000007dc <SPI0_IRQHandler>:

ATTRIBUTE_ISR void SPI0_IRQHandler(void)
{
 7dc:	1460      	nie
 7de:	1462      	ipush
 7e0:	1421      	subi      	r14, r14, 4
 7e2:	dd0e2000 	st.w      	r8, (r14, 0x0)
 7e6:	6e3b      	mov      	r8, r14
    CSI_INTRPT_ENTER();
//    isr_spi_irqhandler(H_SPI);
    CSI_INTRPT_EXIT();
}
 7e8:	6c00      	or      	r0, r0
 7ea:	6fa3      	mov      	r14, r8
 7ec:	d90e2000 	ld.w      	r8, (r14, 0x0)
 7f0:	1401      	addi      	r14, r14, 4
 7f2:	1463      	ipop
 7f4:	1461      	nir
	...

000007f8 <TKEY_IRQHandler>:

ATTRIBUTE_ISR void TKEY_IRQHandler(void)
{
 7f8:	1460      	nie
 7fa:	1462      	ipush
 7fc:	1421      	subi      	r14, r14, 4
 7fe:	dd0e2000 	st.w      	r8, (r14, 0x0)
 802:	6e3b      	mov      	r8, r14
    CSI_INTRPT_ENTER();
//    isr_tkey_irqhandler();
    CSI_INTRPT_EXIT();
}
 804:	6c00      	or      	r0, r0
 806:	6fa3      	mov      	r14, r8
 808:	d90e2000 	ld.w      	r8, (r14, 0x0)
 80c:	1401      	addi      	r14, r14, 4
 80e:	1463      	ipop
 810:	1461      	nir
	...

00000814 <CMP0_IRQHandler>:

ATTRIBUTE_ISR void CMP0_IRQHandler(void)
{
 814:	1460      	nie
 816:	1462      	ipush
 818:	1421      	subi      	r14, r14, 4
 81a:	dd0e2000 	st.w      	r8, (r14, 0x0)
 81e:	6e3b      	mov      	r8, r14
    CSI_INTRPT_ENTER();
//    isr_comp0_irqhandler();
    CSI_INTRPT_EXIT();
}
 820:	6c00      	or      	r0, r0
 822:	6fa3      	mov      	r14, r8
 824:	d90e2000 	ld.w      	r8, (r14, 0x0)
 828:	1401      	addi      	r14, r14, 4
 82a:	1463      	ipop
 82c:	1461      	nir
	...

00000830 <CMP1_IRQHandler>:

ATTRIBUTE_ISR void CMP1_IRQHandler(void)
{
 830:	1460      	nie
 832:	1462      	ipush
 834:	1422      	subi      	r14, r14, 8
 836:	dd0e2000 	st.w      	r8, (r14, 0x0)
 83a:	ddee2001 	st.w      	r15, (r14, 0x4)
 83e:	6e3b      	mov      	r8, r14
    CSI_INTRPT_ENTER();
    isr_comp1_irqhandler();
 840:	e0000000 	bsr      	0x0	// 168 <isr_comp1_irqhandler>
    CSI_INTRPT_EXIT();
}
 844:	6c00      	or      	r0, r0
 846:	6fa3      	mov      	r14, r8
 848:	d9ee2001 	ld.w      	r15, (r14, 0x4)
 84c:	d90e2000 	ld.w      	r8, (r14, 0x0)
 850:	1402      	addi      	r14, r14, 8
 852:	1463      	ipop
 854:	1461      	nir
	...
