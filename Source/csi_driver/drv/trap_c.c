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
//* @file     trap_c.c
//* @brief    source file for the trap process
//* @version  V1.0
//* @date     02. Spet 2019
//******************************************************************************

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <csi_config.h>

void trap_c(uint32_t *regs)
{
//    int i;
//    uint32_t vec = 0;
//    asm volatile(
//        "mfcr    %0, psr \n"
//        "lsri    %0, 16 \n"
//        "sextb   %0 \n"
//        :"=r"(vec):);
//
//    printf("CPU Exception : %d", vec);
//    printf("\n");
//
//    for (i = 0; i < 16; i++) {
//        printf("r%d: %08x\t", i, regs[i]);
//
//        if ((i % 5) == 4) {
//            printf("\n");
//        }
//    }
//
//    printf("\n");
//    printf("epsr: %8x\n", regs[16]);
//    printf("epc : %8x\n", regs[17]);

    while (1);
}

