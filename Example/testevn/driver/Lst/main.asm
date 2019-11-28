
Obj/main.o:     file format elf32-csky-little


Disassembly of section .text:

00000000 <main>:
 * 4 IO base address
 *
 * @return For MCU application, it's better to loop here
 */
int main()
{
   0:	1422      	subi      	r14, r14, 8
   2:	dd0e2000 	st.w      	r8, (r14, 0x0)
   6:	ddee2001 	st.w      	r15, (r14, 0x4)
   a:	6e3b      	mov      	r8, r14
   c:	1423      	subi      	r14, r14, 12
    // TODO
	//gpio_port_handle_t gpioa1_handle;
	
	csi_gpio_initialize(PORTA1);
   e:	3001      	movi      	r0, 1
  10:	e0000000 	bsr      	0x0	// 0 <csi_gpio_initialize>
	
	volatile uint32_t i;
	for (i=0;i<10000;i++);
  14:	3300      	movi      	r3, 0
  16:	2b07      	subi      	r3, 8
  18:	60e0      	addu      	r3, r8
  1a:	3200      	movi      	r2, 0
  1c:	b340      	st.w      	r2, (r3, 0x0)
  1e:	040a      	br      	0x32	// 32 <main+0x32>
  20:	3300      	movi      	r3, 0
  22:	2b07      	subi      	r3, 8
  24:	60e0      	addu      	r3, r8
  26:	9360      	ld.w      	r3, (r3, 0x0)
  28:	5b42      	addi      	r2, r3, 1
  2a:	3300      	movi      	r3, 0
  2c:	2b07      	subi      	r3, 8
  2e:	60e0      	addu      	r3, r8
  30:	b340      	st.w      	r2, (r3, 0x0)
  32:	3300      	movi      	r3, 0
  34:	2b07      	subi      	r3, 8
  36:	60e0      	addu      	r3, r8
  38:	9340      	ld.w      	r2, (r3, 0x0)
  3a:	107f      	lrw      	r3, 0x270f	// b4 <main+0xb4>
  3c:	648c      	cmphs      	r3, r2
  3e:	0bf1      	bt      	0x20	// 20 <main+0x20>
	csi_syscon_set_solo_pclk_switch(ENABLE, PCLK_GPIOB0);
  40:	103e      	lrw      	r1, 0x0	// b8 <main+0xb8>
  42:	105f      	lrw      	r2, 0x2000000	// bc <main+0xbc>
  44:	3000      	movi      	r0, 0
  46:	e0000000 	bsr      	0x0	// 0 <csi_syscon_set_solo_pclk_switch>
	
	csi_syscon_set_all_pclk_switch(ENABLE);
  4a:	3000      	movi      	r0, 0
  4c:	e0000000 	bsr      	0x0	// 0 <csi_syscon_set_all_pclk_switch>
	
	csi_gpio_pin_func_config(PA1_3,GPIO_MODE_AF3);
  50:	3106      	movi      	r1, 6
  52:	3013      	movi      	r0, 19
  54:	e0000000 	bsr      	0x0	// 0 <csi_gpio_pin_func_config>
	csi_syscon_clo_config(CLO_AHBCLK);
  58:	300b      	movi      	r0, 11
  5a:	e0000000 	bsr      	0x0	// 0 <csi_syscon_clo_config>
	
	volatile uint32_t mem_data;
	uint32_t *ptr = 0x00000004;
  5e:	3300      	movi      	r3, 0
  60:	2b03      	subi      	r3, 4
  62:	60e0      	addu      	r3, r8
  64:	3204      	movi      	r2, 4
  66:	b340      	st.w      	r2, (r3, 0x0)
	
	mem_data = *ptr;
  68:	3300      	movi      	r3, 0
  6a:	2b03      	subi      	r3, 4
  6c:	60e0      	addu      	r3, r8
  6e:	9360      	ld.w      	r3, (r3, 0x0)
  70:	9340      	ld.w      	r2, (r3, 0x0)
  72:	3300      	movi      	r3, 0
  74:	2b0b      	subi      	r3, 12
  76:	60e0      	addu      	r3, r8
  78:	b340      	st.w      	r2, (r3, 0x0)
	
	ptr = 0x8;
  7a:	3300      	movi      	r3, 0
  7c:	2b03      	subi      	r3, 4
  7e:	60e0      	addu      	r3, r8
  80:	3208      	movi      	r2, 8
  82:	b340      	st.w      	r2, (r3, 0x0)
	mem_data = *ptr;
  84:	3300      	movi      	r3, 0
  86:	2b03      	subi      	r3, 4
  88:	60e0      	addu      	r3, r8
  8a:	9360      	ld.w      	r3, (r3, 0x0)
  8c:	9340      	ld.w      	r2, (r3, 0x0)
  8e:	3300      	movi      	r3, 0
  90:	2b0b      	subi      	r3, 12
  92:	60e0      	addu      	r3, r8
  94:	b340      	st.w      	r2, (r3, 0x0)
	
	ptr = 0xA;
  96:	3300      	movi      	r3, 0
  98:	2b03      	subi      	r3, 4
  9a:	60e0      	addu      	r3, r8
  9c:	320a      	movi      	r2, 10
  9e:	b340      	st.w      	r2, (r3, 0x0)
	mem_data = *ptr;
  a0:	3300      	movi      	r3, 0
  a2:	2b03      	subi      	r3, 4
  a4:	60e0      	addu      	r3, r8
  a6:	9360      	ld.w      	r3, (r3, 0x0)
  a8:	9340      	ld.w      	r2, (r3, 0x0)
  aa:	3300      	movi      	r3, 0
  ac:	2b0b      	subi      	r3, 12
  ae:	60e0      	addu      	r3, r8
  b0:	b340      	st.w      	r2, (r3, 0x0)
		
	while(1);
  b2:	0400      	br      	0xb2	// b2 <main+0xb2>
  b4:	0000270f 	.long	0x0000270f
  b8:	00000000 	.long	0x00000000
  bc:	02000000 	.long	0x02000000
