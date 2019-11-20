#ifndef __CSI_CONFIG_H__
#define __CSI_CONFIG_H__

#define CONFIG_CHIP_APT32F172 1
#define CONFIG_KERNEL_NONE 1
#define CONFIG_IWDT_NONE 1
#define CONFIG_HAVE_VIC 1
#define CONFIG_SEPARATE_IRQ_SP 1
#define CONFIG_ARCH_INTERRUPTSTACK 1024
#define CONFIG_MM_KERNEL_HEAPSIZE 24576

#ifndef ISO_DEFAULT_FREQ
#define ISO_DEFAULT_FREQ (3000000)
#endif

#ifndef IMO_DEFAULT_FREQ
#define IMO_DEFAULT_FREQ (20000000)
#endif

#ifndef HFO_DEFAULT_FREQ
#define HFO_DEFAULT_FREQ (96000000)
#endif

#ifndef SYSTEM_CLOCK_FREQ
#define SYSTEM_CLOCK_FREQ IMO_DEFAULT_FREQ 
#endif

//////////////////////////////////////////////////////////////////////////////////////
// <<< Use Configuration Wizard in Context Menu >>>
//////////////////////////////////////////////////////////////////////////////////////

// <o> EMOSC Frequency <0x0-24000000:1000000>
// <i> Define the frequency of external crystal oscillator
// <i> Note: If EMOSC is not used, keep the value none zero
// Customize
#define EMOSC_FREQ 10000000

/*-------  Select system clock -----*/
// <q> System Clock Source <2> [IMOSC_20M//IMOSC_40M//EMOSC_24M//ISOSC_3M]
// <i> Select the clock source as working clock
// Select one of the following osc source as system working clock
#define SYSTEM_CLOCK_SRC IMOSC_20M
//#define SYSTEM_CLOCK_SRC IMOSC_40M
//#define SYSTEM_CLOCK_SRC EMOSC_24M
//#define SYSTEM_CLOCK_SRC ISOSC_3M

/*-------  Define CPU clock (AHB clock) -----*/
// <o> System Core Clock Frequency <0x0-40000000:1000000>
// <i> Define the frequency of system core clock in HZ
// <i> Note: Freq of core clock should be less than selected clock source
// define system core clock in Hz unit
#define AHB_CLOCK_FREQ 20000000 
/*-------  Define PCLK clock (APB clock) -----*/
// <o> Peripheral Clock Frequency <0x0-40000000:1000000>
// <i> Define the frequency of peripheral clock in HZ
// <i> Note: Freq of peripheral clock should be less than core clock
// define peripheral clock in Hz unit
// Note: freq of peripheral clock should be less than core clock
#define APB_CLOCK_FREQ 10000000


#endif
