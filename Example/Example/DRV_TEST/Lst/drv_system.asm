
Obj/drv_system.o:     file format elf32-csky-little


Disassembly of section .text:

00000000 <csi_coret_config>:
  \note    When the variable <b>__Vendor_SysTickConfig</b> is set to 1, then the
           function <b>SysTick_Config</b> is not included. In this case, the file <b><i>device</i>.h</b>
           must contain a vendor-specific implementation of this function.
 */
__STATIC_INLINE uint32_t csi_coret_config(uint32_t ticks, int32_t IRQn)
{
   0:	1421      	subi      	sp, sp, 4
   2:	dd0e2000 	st.w      	r8, (sp, 0)
   6:	6e3b      	mov      	r8, sp
   8:	1422      	subi      	sp, sp, 8
   a:	3300      	movi      	r3, 0
   c:	2b03      	subi      	r3, 4
   e:	60e0      	addu      	r3, r8
  10:	b300      	st.w      	r0, (r3, 0)
  12:	3300      	movi      	r3, 0
  14:	2b07      	subi      	r3, 8
  16:	60e0      	addu      	r3, r8
  18:	b320      	st.w      	r1, (r3, 0)
    (void)IRQn;

    if ((ticks - 1UL) > CORET_LOAD_RELOAD_Msk) {
  1a:	3300      	movi      	r3, 0
  1c:	2b03      	subi      	r3, 4
  1e:	60e0      	addu      	r3, r8
  20:	9360      	ld.w      	r3, (r3, 0)
  22:	5b43      	subi      	r2, r3, 1
  24:	106d      	lrw      	r3, 0xffffff	// 58 <csi_coret_config+0x58>
  26:	648c      	cmphs      	r3, r2
  28:	0803      	bt      	0x2e	// 2e <csi_coret_config+0x2e>
        return (1UL);                                                   /* Reload value impossible */
  2a:	3301      	movi      	r3, 1
  2c:	040f      	br      	0x4a	// 4a <csi_coret_config+0x4a>
    }

    CORET->LOAD  = (uint32_t)(ticks - 1UL);                           /* set reload register */
  2e:	106c      	lrw      	r3, 0xe000e010	// 5c <csi_coret_config+0x5c>
  30:	3200      	movi      	r2, 0
  32:	2a03      	subi      	r2, 4
  34:	60a0      	addu      	r2, r8
  36:	9240      	ld.w      	r2, (r2, 0)
  38:	2a00      	subi      	r2, 1
  3a:	b341      	st.w      	r2, (r3, 0x4)
    CORET->VAL   = 0UL;                                               /* Load the CORET Counter Value */
  3c:	1068      	lrw      	r3, 0xe000e010	// 5c <csi_coret_config+0x5c>
  3e:	3200      	movi      	r2, 0
  40:	b342      	st.w      	r2, (r3, 0x8)
    CORET->CTRL  = CORET_CTRL_CLKSOURCE_Msk |
  42:	1067      	lrw      	r3, 0xe000e010	// 5c <csi_coret_config+0x5c>
  44:	3207      	movi      	r2, 7
  46:	b340      	st.w      	r2, (r3, 0)
                   CORET_CTRL_TICKINT_Msk |
                   CORET_CTRL_ENABLE_Msk;                           /* Enable CORET IRQ and CORET Timer */
    return (0UL);                                                     /* Function successful */
  48:	3300      	movi      	r3, 0
}
  4a:	6c0f      	mov      	r0, r3
  4c:	6fa3      	mov      	sp, r8
  4e:	d90e2000 	ld.w      	r8, (sp, 0)
  52:	1401      	addi      	sp, sp, 4
  54:	783c      	rts
  56:	0000      	bkpt
  58:	00ffffff 	.long	0x00ffffff
  5c:	e000e010 	.long	0xe000e010

00000060 <SystemCoreClockUpdate>:
  System Core Clock Variable
 *----------------------------------------------------------------------------*/
int SystemCoreClock = SYSTEM_CLOCK;  /* System Core Clock Frequency      */

void SystemCoreClockUpdate(void)
{
  60:	1421      	subi      	sp, sp, 4
  62:	dd0e2000 	st.w      	r8, (sp, 0)
  66:	6e3b      	mov      	r8, sp
    SystemCoreClock = SYSTEM_CLOCK;
  68:	1076      	lrw      	r3, 0	// c0 <SystemInit+0x44>
  6a:	1057      	lrw      	r2, 0x1312d00	// c4 <SystemInit+0x48>
  6c:	b340      	st.w      	r2, (r3, 0)
}
  6e:	6c00      	or      	r0, r0
  70:	6fa3      	mov      	sp, r8
  72:	d90e2000 	ld.w      	r8, (sp, 0)
  76:	1401      	addi      	sp, sp, 4
  78:	783c      	rts
	...

0000007c <SystemInit>:
  *         Initialize the psr and vbr.
  * @param  None
  * @return None
  */
void SystemInit(void)
{
  7c:	1422      	subi      	sp, sp, 8
  7e:	dd0e2000 	st.w      	r8, (sp, 0)
  82:	ddee2001 	st.w      	r15, (sp, 0x4)
  86:	6e3b      	mov      	r8, sp
  88:	1421      	subi      	sp, sp, 4
  8a:	3300      	movi      	r3, 0
  8c:	2b03      	subi      	r3, 4
  8e:	60e0      	addu      	r3, r8
  90:	104e      	lrw      	r2, 0x80000140	// c8 <SystemInit+0x4c>
  92:	b340      	st.w      	r2, (r3, 0)
  \details Writes the given value to the PSR Register.
  \param [in]    psr  PSR Register value to set
 */
__ALWAYS_STATIC_INLINE void __set_PSR(uint32_t psr)
{
    __ASM volatile("mtcr %0, psr" : : "r"(psr));
  94:	3300      	movi      	r3, 0
  96:	2b03      	subi      	r3, 4
  98:	60e0      	addu      	r3, r8
  9a:	9360      	ld.w      	r3, (r3, 0)
  9c:	c0036420 	mtcr      	r3, cr<0, 0>

#ifndef CONFIG_KERNEL_NONE
    csi_coret_config(SYSTEM_CLOCK / CONFIG_SYSTICK_HZ, CORET_IRQn);    //10ms
    csi_vic_enable_irq(CORET_IRQn);
#else
    csi_coret_config(SYSTEM_CLOCK / CONFIG_SYSTICK_HZ, CORET_IRQn);    //for mdelay()
  a0:	3100      	movi      	r1, 0
  a2:	100b      	lrw      	r0, 0x30d40	// cc <SystemInit+0x50>
  a4:	e0000000 	bsr      	0	// 0 <csi_coret_config>
#endif

    SystemCoreClock = SYSTEM_CLOCK;
  a8:	1066      	lrw      	r3, 0	// c0 <SystemInit+0x44>
  aa:	1047      	lrw      	r2, 0x1312d00	// c4 <SystemInit+0x48>
  ac:	b340      	st.w      	r2, (r3, 0)

    //extern void mm_heap_initialize(void);
    //mm_heap_initialize();
}
  ae:	6c00      	or      	r0, r0
  b0:	6fa3      	mov      	sp, r8
  b2:	d9ee2001 	ld.w      	r15, (sp, 0x4)
  b6:	d90e2000 	ld.w      	r8, (sp, 0)
  ba:	1402      	addi      	sp, sp, 8
  bc:	783c      	rts
  be:	0000      	bkpt
  c0:	00000000 	.long	0x00000000
  c4:	01312d00 	.long	0x01312d00
  c8:	80000140 	.long	0x80000140
  cc:	00030d40 	.long	0x00030d40
