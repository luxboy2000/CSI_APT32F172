/*
 * Copyright (C) 2019 APTCHIP Microelectronics Co., Ltd. All rights reserved.
 *
 *   http://www.aptchip.com
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 */

//******************************************************************************
//* @file     system.c
//* @brief    CSI Device System Source File
//* @version  V1.0
//* @date     02. Sept 2019
//******************************************************************************

#include <csi_config.h>
#include "soc.h"
#include "csi_core.h"

#ifndef CONFIG_SYSTICK_HZ
#define CONFIG_SYSTICK_HZ 100
#endif

/*----------------------------------------------------------------------------
  System Core Clock Variable
 *----------------------------------------------------------------------------*/
int SystemCoreClock = SYSTEM_CLOCK;  /* System Core Clock Frequency      */

void SystemCoreClockUpdate(void)
{
    SystemCoreClock = SYSTEM_CLOCK;
}

/**
  * @brief  initialize the system
  *         Initialize the psr and vbr.
  * @param  None
  * @return None
  */
void SystemInit(void)
{
    //__set_VBR((uint32_t) & (__Vectors));
    /* Here we may setting exception vector, MGU, cache, and so on. */

#ifdef CONFIG_KERNEL_NONE
#ifdef CONFIG_SYSTEM_SECURE
    __set_PSR(0xc0000140);
#else
    __set_PSR(0x80000140);
#endif
#endif

#ifndef CONFIG_KERNEL_NONE
    csi_coret_config(SYSTEM_CLOCK / CONFIG_SYSTICK_HZ, CORET_IRQn);    //10ms
    csi_vic_enable_irq(CORET_IRQn);
#else
    csi_coret_config(SYSTEM_CLOCK / CONFIG_SYSTICK_HZ, CORET_IRQn);    //for mdelay()
#endif

    SystemCoreClock = SYSTEM_CLOCK;

    //extern void mm_heap_initialize(void);
    //mm_heap_initialize();
}
