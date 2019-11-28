
Obj/drv_system.o:     file format elf32-csky-little


Disassembly of section .text:

00000000 <SystemCoreClockUpdate>:
//int SystemCoreClock = SYSTEM_CLOCK;  /* System Core Clock Frequency      */
int SystemCoreClock = SYSTEM_CLOCK_FREQ;  /* System Core Clock Frequency      */


void SystemCoreClockUpdate(void)
{
   0:	1421      	subi      	r14, r14, 4
   2:	dd0e2000 	st.w      	r8, (r14, 0x0)
   6:	6e3b      	mov      	r8, r14
    SystemCoreClock = sysclk_cfg._cur_hclk_freq;
   8:	1066      	lrw      	r3, 0x0	// 20 <SystemCoreClockUpdate+0x20>
   a:	9361      	ld.w      	r3, (r3, 0x4)
   c:	6c8f      	mov      	r2, r3
   e:	1066      	lrw      	r3, 0x0	// 24 <SystemCoreClockUpdate+0x24>
  10:	b340      	st.w      	r2, (r3, 0x0)
}
  12:	6c00      	or      	r0, r0
  14:	6fa3      	mov      	r14, r8
  16:	d90e2000 	ld.w      	r8, (r14, 0x0)
  1a:	1401      	addi      	r14, r14, 4
  1c:	783c      	jmp      	r15
	...

00000028 <SystemInit>:
  *         Initialize the psr and vbr.
  * @param  None
  * @return None
  */
void SystemInit(void)
{
  28:	1422      	subi      	r14, r14, 8
  2a:	dd0e2000 	st.w      	r8, (r14, 0x0)
  2e:	ddee2001 	st.w      	r15, (r14, 0x4)
  32:	6e3b      	mov      	r8, r14
  34:	1423      	subi      	r14, r14, 12
    //__set_VBR((uint32_t) & (__Vectors));
    /* Here we may setting exception vector, MGU, cache, and so on. */
#ifdef CONFIG_IWDT_NONE
	csi_syscon_iwdt_set_switch(DISABLE);
  36:	3001      	movi      	r0, 1
  38:	e0000000 	bsr      	0x0	// 0 <csi_syscon_iwdt_set_switch>
  3c:	3300      	movi      	r3, 0
  3e:	2b0b      	subi      	r3, 12
  40:	60e0      	addu      	r3, r8
  42:	1143      	lrw      	r2, 0x80000140	// cc <SystemInit+0xa4>
  44:	b340      	st.w      	r2, (r3, 0x0)
  \details Writes the given value to the PSR Register.
  \param [in]    psr  PSR Register value to set
 */
__ALWAYS_INLINE void __set_PSR(uint32_t psr)
{
    __ASM volatile("mtcr %0, psr" : : "r"(psr));
  46:	3300      	movi      	r3, 0
  48:	2b0b      	subi      	r3, 12
  4a:	60e0      	addu      	r3, r8
  4c:	9360      	ld.w      	r3, (r3, 0x0)
  4e:	c0036420 	mtcr      	r3, cr<0, 0>

#ifndef CONFIG_KERNEL_NONE
    csi_coret_config(sysclk_cfg._cur_hclk_freq / CONFIG_SYSTICK_HZ, CORET_IRQn);    //10ms
    csi_vic_enable_irq(CORET_IRQn);
#else
    csi_coret_config(sysclk_cfg._cur_hclk_freq / CONFIG_SYSTICK_HZ, CORET_IRQn);    //for mdelay()
  52:	1160      	lrw      	r3, 0x0	// d0 <SystemInit+0xa8>
  54:	9361      	ld.w      	r3, (r3, 0x4)
  56:	3164      	movi      	r1, 100
  58:	6c0f      	mov      	r0, r3
  5a:	e0000000 	bsr      	0x0	// 0 <__udivsi3>
  5e:	6cc3      	mov      	r3, r0
  60:	6c8f      	mov      	r2, r3
  62:	3300      	movi      	r3, 0
  64:	2b03      	subi      	r3, 4
  66:	60e0      	addu      	r3, r8
  68:	b340      	st.w      	r2, (r3, 0x0)
  6a:	3300      	movi      	r3, 0
  6c:	2b07      	subi      	r3, 8
  6e:	60e0      	addu      	r3, r8
  70:	3200      	movi      	r2, 0
  72:	b340      	st.w      	r2, (r3, 0x0)
           function <b>SysTick_Config</b> is not included. In this case, the file <b><i>device</i>.h</b>
           must contain a vendor-specific implementation of this function.
 */
__ALWAYS_INLINE uint32_t csi_coret_config(uint32_t ticks, int32_t IRQn)
{
    if ((ticks - 1UL) > CORET_LOAD_RELOAD_Msk) {
  74:	3300      	movi      	r3, 0
  76:	2b03      	subi      	r3, 4
  78:	60e0      	addu      	r3, r8
  7a:	9360      	ld.w      	r3, (r3, 0x0)
  7c:	5b43      	subi      	r2, r3, 1
  7e:	1076      	lrw      	r3, 0xffffff	// d4 <SystemInit+0xac>
  80:	648c      	cmphs      	r3, r2
  82:	0c0e      	bf      	0x9e	// 9e <SystemInit+0x76>
        return (1UL);                                                   /* Reload value impossible */
    }

    CORET->LOAD  = (uint32_t)(ticks - 1UL);                           /* set reload register */
  84:	1075      	lrw      	r3, 0xe000e010	// d8 <SystemInit+0xb0>
  86:	3200      	movi      	r2, 0
  88:	2a03      	subi      	r2, 4
  8a:	60a0      	addu      	r2, r8
  8c:	9240      	ld.w      	r2, (r2, 0x0)
  8e:	2a00      	subi      	r2, 1
  90:	b341      	st.w      	r2, (r3, 0x4)
    CORET->VAL   = 0UL;                                               /* Load the CORET Counter Value */
  92:	1072      	lrw      	r3, 0xe000e010	// d8 <SystemInit+0xb0>
  94:	3200      	movi      	r2, 0
  96:	b342      	st.w      	r2, (r3, 0x8)
    CORET->CTRL  = CORET_CTRL_CLKSOURCE_Msk |
  98:	1070      	lrw      	r3, 0xe000e010	// d8 <SystemInit+0xb0>
  9a:	3207      	movi      	r2, 7
  9c:	b340      	st.w      	r2, (r3, 0x0)
#endif


	csi_syscon_systemclock_config(sysclk_cfg._cur_sysclk, sysclk_cfg._cur_hclk_freq, sysclk_cfg._cur_pclk_freq);
  9e:	106d      	lrw      	r3, 0x0	// d0 <SystemInit+0xa8>
  a0:	9300      	ld.w      	r0, (r3, 0x0)
  a2:	106c      	lrw      	r3, 0x0	// d0 <SystemInit+0xa8>
  a4:	9321      	ld.w      	r1, (r3, 0x4)
  a6:	106b      	lrw      	r3, 0x0	// d0 <SystemInit+0xa8>
  a8:	9362      	ld.w      	r3, (r3, 0x8)
  aa:	6c8f      	mov      	r2, r3
  ac:	e0000000 	bsr      	0x0	// 0 <csi_syscon_systemclock_config>
    SystemCoreClock = sysclk_cfg._cur_hclk_freq;
  b0:	1068      	lrw      	r3, 0x0	// d0 <SystemInit+0xa8>
  b2:	9361      	ld.w      	r3, (r3, 0x4)
  b4:	6c8f      	mov      	r2, r3
  b6:	106a      	lrw      	r3, 0x0	// dc <SystemInit+0xb4>
  b8:	b340      	st.w      	r2, (r3, 0x0)

    //extern void mm_heap_initialize(void);
    //mm_heap_initialize();
}
  ba:	6c00      	or      	r0, r0
  bc:	6fa3      	mov      	r14, r8
  be:	d9ee2001 	ld.w      	r15, (r14, 0x4)
  c2:	d90e2000 	ld.w      	r8, (r14, 0x0)
  c6:	1402      	addi      	r14, r14, 8
  c8:	783c      	jmp      	r15
  ca:	0000      	bkpt
  cc:	80000140 	.long	0x80000140
  d0:	00000000 	.long	0x00000000
  d4:	00ffffff 	.long	0x00ffffff
  d8:	e000e010 	.long	0xe000e010
  dc:	00000000 	.long	0x00000000
