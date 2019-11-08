/*
 * Copyright (C) 2019 APTCHIP Microelectronics Co., Ltd. All rights reserved.
 *
 *   http://www.aptchip.com
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 */

//*****************************************************************************
//* @file     drv_syscon.h
//* @brief    header file for syscon driver
//* @version  V1.0
//* @date     02. Sept 2019
//*****************************************************************************

#ifndef _CSI_SYSCON_H_
#define _CSI_SYSCON_H_

#ifdef __cplusplus
extern "C" {
#endif

#include <stdint.h>
#include <stdbool.h>
#include <drv_common.h>

typedef struct {                            /*!< SYSCON Structure                         */
    __IOM uint32_t IDCCR;                   /*!< Identification & System Controller Clock Control Register */
    __IOM uint32_t GCER;                    /*!< System Controller General Control Enable Register */
    __IOM uint32_t GCDR;                    /*!< System Controller General Control Disable Register */
    __IOM uint32_t GCSR;                    /*!< System Controller General Control Status Register */
    __IOM uint32_t _RSVD0;                  /*!< System Controller Power Control Enable Register */
    __IOM uint32_t _RSVD1;                  /*!< System Controller Power Control Disable Register */
    __IOM uint32_t _RSVD2;                  /*!< System Controller Power Control Status Register */
    __IOM uint32_t SCLKCR;                  /*!< System Controller System Clock Selection & Division Register */
    __IOM uint32_t PCLKCR;                  /*!< System Controller Peripheral Clock Selection & Division Register */
    __IOM uint32_t _RSVD3;                  /*!< System Controller Peripheral Function Clock Selection & Division Register */
    __IOM uint32_t PCER0;                   /*!< System Controller Peripheral Clock Enable Register */
    __IOM uint32_t PCDR0;                   /*!< System Controller Peripheral Clock Disable Register */
    __IOM uint32_t PCSR0;                   /*!< System Controller Peripheral Clock Status Register */
    __IOM uint32_t PCER1;                   /*!< System Controller Peripheral Clock Enable Register */
    __IOM uint32_t PCDR1;                   /*!< System Controller Peripheral Clock Disable Register */
    __IOM uint32_t PCSR1;                   /*!< System Controller Peripheral Clock Status Register */
    __IOM uint32_t OSTR;                    /*!< System Controller External OSC Stable Time Control Register */
    __IOM uint32_t PSTR;                    /*!< System Controller PLL Stable Time Control Register */
    __IOM uint32_t PLLCR;                   /*!< System Controller PLL PMS Value Control Register */
    __IOM uint32_t LVDCR;                   /*!< System Controller LVD Control Register */
    __IOM uint32_t CLCR;                    /*!< System Controller Internal OSC Fine Tune Register */
    __IOM uint32_t PWRCR;                   /*!< System Controller Power Stable Time Control Register */
    __IOM uint32_t OPT4;                    /*!< System Controller OSC Trim Control Register */
    __IOM uint32_t OPT3;                    /*!< System Controller OSC Trim Control Register */
    __IOM uint32_t OPT2;                    /*!< System Controller OSC Trim Control Register */
    __IOM uint32_t OPT1;                    /*!< System Controller OSC Trim Control Register */
    __IOM uint32_t OPT0;                    /*!< System Controller Protection Control Register */
    __IOM uint32_t CQCR;                    /*!< System Controller Clock Quality Check Control Register */
    __IOM uint32_t CQSR;                    /*!< System Controller Clock Quality Check Control Register */
    __IOM uint32_t IECR;                    /*!< System Controller Interrupt Enable Register */
    __IOM uint32_t IDCR;                    /*!< System Controller Interrupt Disable Register */
    __IOM uint32_t IMSR;                    /*!< System Controller Interrupt Mask Register */
    __IOM uint32_t IAR;                     /*!< System Controller Interrupt Active Register */
    __IOM uint32_t ICR;                     /*!< System Controller Clear Status Register */
    __IOM uint32_t RISR;                    /*!< System Controller Raw Interrupt Status Register */
    __IOM uint32_t ISR;                     /*!< System Controller Raw Interrupt Status Register */
    __IOM uint32_t RSR;                     /*!< System Controller Raw Interrupt Status Register */
    __IOM uint32_t EXIRT;                   /*!< System Controller Reset Status Register */
    __IOM uint32_t EXIFT;                   /*!< System Controller External Interrupt Mode 1 (Positive Edge) Register */
    __IOM uint32_t EXIER;                   /*!< System Controller External Interrupt Mode 2 (Negative Edge) Register */
    __IOM uint32_t EXIDR;                   /*!< System Controller External Interrupt Enable Register */
    __IOM uint32_t EXIMR;                   /*!< System Controller External Interrupt Disable Register */
    __IOM uint32_t EXIAR;                   /*!< System Controller External Interrupt Mask Register */
    __IOM uint32_t EXICR;                   /*!< System Controller External Interrupt Active Register */
    __IOM uint32_t EXIRS;                   /*!< System Controller External Interrupt Clear Status Register */
    __IOM uint32_t IWDCR;                   /*!< System Controller Independent Watchdog Control Register */
    __IOM uint32_t IWDCNT;                  /*!< System Controller Independent Watchdog Counter Value Register */
    __IOM uint32_t IWDEDR;                  /*!< System Controller Independent Watchdog Enable/disable Register*/
    __IOM uint32_t CINF0;                   /*!< Customer Information Content mirror of 1st byte*/
    __IOM uint32_t CINF1;                   /*!< Customer Information Content mirror of 1st byte*/
    __IOM uint32_t FINF0;                   /*!< Customer Information Content mirror of 1st byte*/
    __IOM uint32_t FINF1;                   /*!< Customer Information Content mirror of 1st byte*/
    __IOM uint32_t _RSVD6;                  /*! @0C4*/
    __IOM uint32_t _RSVD7;                  /*! @0C8*/
    __IOM uint32_t _RSVD8;                  /*! @0CC*/
    __IOM uint32_t _RSVD9;                  /*! @0D0*/
    __IOM uint32_t _RSVD10;                 /*! @0D4*/
    __IOM uint32_t _RSVD11;                 /*! @0D8*/
    __IOM uint32_t _RSVD12;                 /*! @0DC*/
    __IOM uint32_t ERRINF;                  /*!< System Controller Context Save Register 0~3 */
    __IOM uint32_t _RSVD13;                 /*! @0E4*/
    __IOM uint32_t _RSVD14;                 /*! @0E8*/
    __IOM uint32_t _RSVD15;                 /*! @0EC*/
    __IOM uint32_t _RSVD16;                 /*! @0F0*/
    __IOM uint32_t _RSVD17;                 /*! @0F4*/
    __IOM uint32_t _RSVD18;                 /*! @0F8*/
    __IOM uint32_t ACCENA;                  /*! Access Enable register for smart option area in syscon mirror*/
    __IOM uint32_t PROT00;                  /*! Prot00*/
    __IOM uint32_t PROT01;                  /*! Prot01*/
    __IOM uint32_t PROT02;                  /*! Prot02*/
    __IOM uint32_t PROT03;                  /*! Prot03*/
    __IOM uint32_t PROT04;                  /*! Prot04*/
    __IOM uint32_t PROT05;                  /*! Prot05*/
    __IOM uint32_t PROT06;                  /*! Prot06*/
    __IOM uint32_t PROT07;                  /*! Prot07*/
    __IOM uint32_t PROT08;                  /*! Prot08*/
    __IOM uint32_t PROT09;                  /*! Prot09*/
    __IOM uint32_t PROT10;                  /*! Prot10*/
    __IOM uint32_t PROT11;                  /*! Prot11*/
    __IOM uint32_t PROT12;                  /*! Prot12*/
    __IOM uint32_t PROT13;                  /*! Prot13*/
    __IOM uint32_t PROT14;                  /*! Prot14*/
    __IOM uint32_t PROT15;                  /*! Prot15*/
    __IOM uint32_t PROT16;                  /*! Prot16*/
    __IOM uint32_t PROT17;                  /*! Prot17*/
    __IOM uint32_t PROT18;                  /*! Prot18*/
    __IOM uint32_t PROT19;                  /*! Prot19*/
}  APT_SYSCON_Reg_t, *syscon_handle_t;


extern syscon_handle_t H_SYSCON;


#define PWRCR_KEY               (0xA66Aul<<16)
#define SCLKCR_KEY              (0xD22Dul<<16)
#define PCLKCR_KEY              (0xC33Cul<<16)
#define LVDCR_KEY                 (0xB44Bul<<16)
#define IWDTCR_KEY              (0x8778ul<<16)
#define IWDEDR_KEY              (0x7887ul<<16)

/*----- PCLK EN/DIS Source Selection -----*/
#define PCLK_ENDIS_IFC           1ul
#define PCLK_ENDIS_ADC          (1ul<<4 )
#define PCLK_ENDIS_TKEY         (1ul<<6 )
#define PCLK_ENDIS_UART0        (1ul<<8 )
#define PCLK_ENDIS_UART1        (1ul<<9 )
#define PCLK_ENDIS_I2C          (1ul<<22)
                               
#define PCLK_ENDIS_TC0          (1ul<< 8)|(1ul<<31)
#define PCLK_ENDIS_TC1          (1ul<< 9)|(1ul<<31)
#define PCLK_ENDIS_TC2          (1ul<<10)|(1ul<<31)
#define PCLK_ENDIS_TC3          (1ul<<11)|(1ul<<31)
#define PCLK_ENDIS_EPWM         (1ul<<12)|(1ul<<31)
#define PCLK_ENDIS_LED          (1ul<<16)|(1ul<<31)
#define PCLK_ENDIS_CMP0         (1ul<<17)|(1ul<<31)
#define PCLK_ENDIS_CMP1         (1ul<<18)|(1ul<<31)
#define PCLK_ENDIS_CMP2         (1ul<<19)|(1ul<<31)
#define PCLK_ENDIS_CMP3         (1ul<<20)|(1ul<<31)
#define PCLK_ENDIS_CMP4         (1ul<<21)|(1ul<<31)
#define PCLK_ENDIS_OPA          (1ul<<22)|(1ul<<31)
#define PCLK_ENDIS_GPIOA0       (1ul<<24)|(1ul<<31)
#define PCLK_ENDIS_GPIOB0       (1ul<<25)|(1ul<<31)
#define PCLK_ENDIS_GPIOC0       (1ul<<26)|(1ul<<31)
#define PCLK_ENDIS_GPIOD0       (1ul<<27)|(1ul<<31)

/*----- Interrupt Source Selection -----*/
#define SYSCON_INT_ISOSC_ST     (1ul << 0)
#define SYSCON_INT_IMOSC_ST     (1ul << 1)
#define SYSCON_INT_EMOSC_ST     (1ul << 3)
#define SYSCON_INT_SYSCLK_ST    (1ul << 7)
#define SYSCON_INT_IWDT         (1ul << 8)
#define SYSCON_INT_LVD          (1ul << 11)
#define SYSCON_INT_EMFAIL       (1ul << 18)
#define SYSCON_INT_EMRCV        (1ul << 19)
#define SYSCON_INT_CMDERR       (1ul << 29)

/*----- EXI Source Selection -----*/
#define EXI_LINE0               (1ul << 0 )
#define EXI_LINE1               (1ul << 1 )
#define EXI_LINE2               (1ul << 2 )
#define EXI_LINE3               (1ul << 3 )
#define EXI_LINE4               (1ul << 4 )
#define EXI_LINE5               (1ul << 5 )
#define EXI_LINE6               (1ul << 6 )
#define EXI_LINE7               (1ul << 7 )
#define EXI_LINE8               (1ul << 8 )
#define EXI_LINE9               (1ul << 9 )
#define EXI_LINE10              (1ul << 10)
#define EXI_LINE11              (1ul << 11)
#define EXI_LINE12              (1ul << 12)
#define EXI_LINE13              (1ul << 13)
#define EXI_LINE14              (1ul << 14)
#define EXI_LINE15              (1ul << 15)

/*----- Clock Source Selection -----*/
typedef enum {
    ENDIS_ISOSC                = 1,    ///< select isosc as en/dis target
    ENDIS_IMOSC                = 2,    ///< select imosc as en/dis target
    ENDIS_EMOSC                = 8,    ///< select emosc as en/dis target
} clock_source_t;

/*----- System Clock Source Selection -----*/
typedef enum {
    SYSCLK_IMOSC_40M           = 0,    ///< select system clock as imosc 40M
    SYSCLK_IMOSC_20M              ,    ///< select system clock as imosc 20M
    SYSCLK_EMOSC                  ,    ///< select system clock as emosc
    SYSCLK_ISOSC                  ,    ///< select system clock as isosc
} sysclk_src_t;

/*----- iWDT overtime setup -----*/
typedef enum {
    IWDT_OVT_0P128             = 0,    ///< iwdt overtime 0p128S
    IWDT_OVT_0P256                ,    ///< iwdt overtime 0p256S
    IWDT_OVT_0P5S                 ,    ///< iwdt overtime 0p500S
    IWDT_OVT_1S                   ,    ///< iwdt overtime 1S
    IWDT_OVT_2S                   ,    ///< iwdt overtime 2S
    IWDT_OVT_3S                   ,    ///< iwdt overtime 3S
    IWDT_OVT_4S                   ,    ///< iwdt overtime 4S
    IWDT_OVT_8S                   ,    ///< iwdt overtime 8S
} iwdt_ovt_t;

/*----- iWDT alarm window setup -----*/
typedef enum {
    IWDT_WND_1IN8              = 0,    ///< iwdt window is 1in8 of total ovt
    IWDT_WND_2IN8                 ,    ///< iwdt window is 2in8 of total ovt
    IWDT_WND_3IN8                 ,    ///< iwdt window is 3in8 of total ovt
    IWDT_WND_4IN8                 ,    ///< iwdt window is 4in8 of total ovt
    IWDT_WND_5IN8                 ,    ///< iwdt window is 5in8 of total ovt
    IWDT_WND_6IN8                 ,    ///< iwdt window is 6in8 of total ovt
    IWDT_WND_7IN8                 ,    ///< iwdt window is 7in8 of total ovt
} iwdt_wnd_t;

/*----- LVD interrupt setup -----*/
typedef enum {
    LVD_INTAT2V55              = 0,    ///< LVD Int at 2V55
    LVD_INTAT3V00                 ,    ///< LVD Int at 3V00
    LVD_INTAT3V90                 ,    ///< LVD Int at 3V90
    LVD_INTAT4V10                 ,    ///< LVD Int at 4V10
    LVD_INTDIS                    ,    ///< LVD Interrupt disable
} lvd_intlvl_t;

/*----- LVD reset setup -----*/
typedef enum {
    LVD_RSTAT2P15              = 0,    ///< LVD Rst at 2P15
    LVD_RSTAT2P75                 ,    ///< LVD Rst at 2P75
    LVD_RSTAT3P35                 ,    ///< LVD Rst at 3P35
    LVD_RSTAT3P65                 ,    ///< LVD Rst at 3P65
} lvd_rstlvl_t;

/*----- information to be load selection -----*/
typedef enum {
    CINF0                      = 0,    ///< select custom information0
    CINF1                         ,    ///< select custom information1
    FINF0                         ,    ///< select factory information0 
    FINF1                         ,    ///< select factory information1 
} prj_infor_t;

/*----- protection information to be load selection -----*/
typedef enum {
    RDP                        = 0,    ///< select custom information0
    DBP                           ,    ///< select custom information1
    HDP                           ,    ///< select factory information0 
} prot_infor_t;

/*----- CLO source selection -----*/
typedef enum {
    CLO_ISCLK                  = 0,    ///< isclk as clo
    CLO_IMCLK                  = 1,    ///< imclk as clo
    CLO_EMCLK                  = 3,    ///< emclk as clo
    CLO_SYSCLK                 = 7,    ///< sysclk as clo
} clo_src_t;

/*----- Reset source selection -----*/
typedef union {
    struct {
        uint32_t RST_POR: 1;           ///< bit     0
        uint32_t RST_LVR: 1;           ///< bit     1
        uint32_t RST_EXT: 1;           ///< bit     2
        uint32_t Reserved1: 1;         ///< bit     3
        uint32_t RST_IWDT: 1;          ///< bit     4
        uint32_t Reserved2: 1;         ///< bit     5
        uint32_t RST_CMRST: 1;         ///< bit     6
        uint32_t RST_CPU: 1;           ///< bit     7
        uint32_t RST_SYSCON: 1;        ///< bit     8
        uint32_t Reserved3: 23;        ///< bit 9..31
    } b;
    uint32_t w;
} reset_src_t;



#ifdef __cplusplus
}
#endif

#endif /* _CSI_SYSCON_H_ */
