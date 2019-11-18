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

#ifndef _CSI_GPIO_H_
#define _CSI_GPIO_H_

#ifdef __cplusplus
extern "C" {
#endif

#include <stdint.h>
#include <stdbool.h>
#include <drv_common.h>

/*----- SYSCON Register Define -----*/
typedef struct {
    __IOM uint32_t IDCCR;       /*!< 0x000: Identification & System Controller Clock Control Register */
    __OM  uint32_t GCER;        /*!< 0x004: System Controller General Control Enable Register */
    __OM  uint32_t GCDR;        /*!< 0x008: System Controller General Control Disable Register */
    __IM  uint32_t GCSR;        /*!< 0x00C: System Controller General Control Status Register */
    __IM  uint32_t CKST;        /*!< 0x010: Clock Stable Check Register*/
    __IOM uint32_t RAMCHK;      /*!< 0x014: SRAM Parity Check Control Register */
    __IOM uint32_t EFLCHK;      /*!< 0x018: EFlash Parity Check Control Register */
    __IOM uint32_t SCLKCR;      /*!< 0x01C: System Controller System Clock Selection & Division Register */
    __IOM uint32_t PCLKCR;      /*!< 0x020: System Controller Peripheral Clock Selection & Division Register */
    __IM  uint32_t _RSVD3;      /*!< 0x024: */
    __OM  uint32_t PCER0;       /*!< 0x028: System Controller Peripheral Clock Enable Register */
    __OM  uint32_t PCDR0;       /*!< 0x02C: System Controller Peripheral Clock Disable Register */
    __IM  uint32_t PCSR0;       /*!< 0x030: System Controller Peripheral Clock Status Register */
    __OM  uint32_t PCER1;       /*!< 0x034: System Controller Peripheral Clock Enable Register */
    __OM  uint32_t PCDR1;       /*!< 0x038: System Controller Peripheral Clock Disable Register */
    __IM  uint32_t PCSR1;       /*!< 0x03C: System Controller Peripheral Clock Status Register */
    __IOM uint32_t OSTR;        /*!< 0x040: System Controller External OSC Stable Time Control Register */
    __IM  uint32_t _RSVD4;      /*!< 0x044: System Controller PLL Stable Time Control Register */
    __IM  uint32_t _RSVD5;      /*!< 0x048: System Controller PLL PMS Value Control Register */
    __IOM uint32_t LVDCR;       /*!< 0x04C: System Controller LVD Control Register */
    __IOM uint32_t CLCR;        /*!< 0x050: System Controller IMOSC Fine Adjustment Register*/
    __IOM uint32_t PWRCR;       /*!< 0x054: System Controller Power Control Register */
    __IOM uint32_t VOSLCK;      /*!< 0x058: System Controller Power Control Register */
    __IM  uint32_t _RSVD6;      /*!< 0x05C: */
    __IM  uint32_t _RSVD7;      /*!< 0x060: */
    __IOM uint32_t OPT1;        /*!< 0x064: System Controller OSC Trim Control Register */
    __IOM uint32_t OPT0;        /*!< 0x068: System Controller Protection Control Register */
    __IOM uint32_t WKCR;        /*!< 0x06C: System Controller Clock Quality Check Control Register */
    __IM  uint32_t _RSVD8;      /*!< 0x070: System Controller Clock Quality Check Control Register */
    __OM  uint32_t IECR;        /*!< 0x074: System Controller Interrupt Enable Register */
    __OM  uint32_t IDCR;        /*!< 0x078: System Controller Interrupt Disable Register */
    __IOM uint32_t IMCR;        /*!< 0x07C: System Controller Interrupt Mask Register */
    __OM  uint32_t IAR;         /*!< 0x080: System Controller Interrupt Active Register */
    __OM  uint32_t ICR;         /*!< 0x084: System Controller Clear Status Register */
    __IM  uint32_t RISR;        /*!< 0x088: System Controller Raw Interrupt Status Register */
    __IM  uint32_t MISR;        /*!< 0x08C: System Controller Raw Interrupt Status Register */
    __IOM uint32_t RSR;         /*!< 0x090: System Controller Raw Interrupt Status Register */
    __IOM uint32_t EXIRT;       /*!< 0x094: System Controller Reset Status Register */
    __IOM uint32_t EXIFT;       /*!< 0x098: System Controller External Interrupt Mode 1 (Positive Edge) Register */
    __OM  uint32_t EXIER;       /*!< 0x09C: System Controller External Interrupt Mode 2 (Negative Edge) Register */
    __OM  uint32_t EXIDR;       /*!< 0x0A0: System Controller External Interrupt Enable Register */
    __IOM uint32_t EXIMR;       /*!< 0x0A4: System Controller External Interrupt Disable Register */
    __OM  uint32_t EXIAR;       /*!< 0x0A8: System Controller External Interrupt Mask Register */
    __IOM uint32_t EXICR;       /*!< 0x0AC: System Controller External Interrupt Active Register */
    __IM  uint32_t EXIRS;       /*!< 0x0B0: System Controller External Interrupt Clear Status Register */
    __IOM uint32_t IWDCR;       /*!< 0x0B4: System Controller Independent Watchdog Control Register */
    __IM  uint32_t IWDCNT;      /*!< 0x0B8: SystCem Controller Independent Watchdog Counter Value Register */
    __IOM uint32_t IWDEDR;      /*!< 0x0BC: System Controller Independent Watchdog Enable/disable Register*/
    __IOM uint32_t IOMAP0;      /*!< 0x0C0: Customer Information Content mirror of 1st byte*/
    __IOM uint32_t IOMAP2;      /*!< 0x0C4: Customer Information Content mirror of 1st byte*/
    __IOM uint32_t _RSVD11;     /*!< 0x0C8: Customer Information Content mirror of 1st byte*/
    __IOM uint32_t _RSVD12;     /*!< 0x0CC: Customer Information Content mirror of 1st byte*/
    __IM  uint32_t FINF0;       /*!< 0x0D0: Customer Information Content mirror of 1st byte*/
    __IM  uint32_t FINF1;       /*!< 0x0D4: Customer Information Content mirror of 1st byte*/
    __IM  uint32_t FINF2;       /*!< 0x0D8: Customer Information Content mirror of 1st byte*/
    __IM  uint32_t FINF3;       /*!< 0x0DC: Customer Information Content mirror of 1st byte*/
    __IM  uint32_t ERRINF;      /*!< 0x0E0: */
    __IM  uint32_t UID0 ;       /*!< 0x0E4: Customer Information Content mirror of 1st byte*/
    __IM  uint32_t UID1 ;       /*!< 0x0E8: Customer Information Content mirror of 1st byte*/
    __IM  uint32_t UID2 ;       /*!< 0x0EC: Customer Information Content mirror of 1st byte*/
    __IOM uint32_t PWROPT;      /*!< 0x0F0: Power recovery timmming control */
    __IOM uint32_t EVTRG;       /*!< 0x0F4: Trigger gen                                    */
    __IOM uint32_t EVPS;        /*!< 0x0F8: Trigger prs                                    */
    __IOM uint32_t EVSWF;       /*!< 0x0FC: Trigger software force                         */
    __IOM uint32_t URREG0;      /*!< 0x100: User defined reg0                              */
    __IOM uint32_t URREG1;      /*!< 0x104: User defined reg1                              */
    __IOM uint32_t URREG2;      /*!< 0x108: User defined reg0                              */
    __IOM uint32_t URREG3;      /*!< 0x10C: User defined reg1                              */
    __IOM uint32_t _RSVD9[59];  /*!< 0x110 ~ 0x1F8*/
    __IOM uint32_t ACCENA;      /*!< 0x1FC: Access Enable register for smart option area in syscon mirror*/
    __IOM uint32_t PROT00;      /*!< 0x200: Prot00*/
    __IOM uint32_t PROT01;      /*!< 0x204: Prot01*/
    __IOM uint32_t PROT02;      /*!< 0x208: Prot02*/
    __IOM uint32_t PROT03;      /*!< 0x20C: Prot03*/
    __IOM uint32_t PROT04;      /*!< 0x210: Prot04*/
    __IOM uint32_t PROT05;      /*!< 0x214: Prot05*/
    __IOM uint32_t PROT06;      /*!< 0x218: Prot06*/
    __IOM uint32_t PROT07;      /*!< 0x21C: Prot07*/
    __IOM uint32_t PROT08;      /*!< 0x220: Prot08*/
    __IOM uint32_t PROT09;      /*!< 0x224: Prot09*/
    __IOM uint32_t PROT10;      /*!< 0x228: Prot10*/
    __IOM uint32_t PROT11;      /*!< 0x22C: Prot11*/
    __IOM uint32_t PROT12;      /*!< 0x230: Prot12*/
    __IOM uint32_t PROT13;      /*!< 0x234: Prot13*/
    __IOM uint32_t PROT14;      /*!< 0x238: Prot14*/
    __IOM uint32_t PROT15;      /*!< 0x23C: Prot15*/
    __IOM uint32_t PROT16;      /*!< 0x240: Prot16*/
    __IOM uint32_t PROT17;      /*!< 0x244: Prot17*/
    __IOM uint32_t PROT18;      /*!< 0x248: Prot18*/
    __IOM uint32_t PROT19;      /*!< 0x248: Prot18*/
    __IOM uint32_t PROT20;      /*!< 0x250: Prot19*/
    __IOM uint32_t PROT21;      /*!< 0x254: Prot19*/
    __IOM uint32_t PROT22;      /*!< 0x258: Prot19*/
    __IOM uint32_t PROT23;      /*!< 0x25C: Prot19*/
    __IOM uint32_t PROT24;      /*!< 0x260: Prot19*/
    __IOM uint32_t PROT25;      /*!< 0x264: Prot19*/
    __IOM uint32_t PROT26;      /*!< 0x268: Prot19*/
    __IOM uint32_t PROT27;      /*!< 0x26C: Prot19*/
    __IOM uint32_t PROT28;      /*!< 0x270: Prot19*/
    __IOM uint32_t PROT29;      /*!< 0x274: Prot19*/
    __IOM uint32_t PROT30;      /*!< 0x278: Prot19*/
    __IOM uint32_t PROT31;      /*!< 0x27C: Prot19*/
    __IOM uint32_t PROT32;      /*!< 0x280: Prot19*/
    __IOM uint32_t PROT33;      /*!< 0x284: Prot19*/
    __IOM uint32_t PROT34;      /*!< 0x288: Prot19*/
    __IOM uint32_t PROT35;      /*!< 0x28C: Prot19*/

} APT_SYSCON_Reg_t, *syscon_handle_t;

/*----- SYSCON Event -----*/
typedef enum {
    GPIO_MODE_DISABLE          = 0,    ///< Disabled, High-Z
} syscon_event_e;

/*----- EMOSC mode -----*/
typedef enum {
    EMOSC_NR_OPTION            = 0,    ///< EMOSC Normal option
    EMOSC_LF_OPTION               ,    ///< EMOSC Low frequence option
} syscon_emosc_lf_e;


/*----- OSC enable/disable option -----*/
typedef enum {
    ISOSC                = 1,    ///< EMOSC Normal option
    IMOSC                = 2,    ///< EMOSC Low frequence option
    EMOSC                = 4,    ///< EMOSC Low frequence option
    HFOSC                = 8,    ///< EMOSC Low frequence option
} syscon_oscsrc_e;

/*----- System clock option -----*/
typedef enum {
    ISOSC_3M             = 0,    ///< EMOSC Normal option
    IMOSC_20M               ,    ///< EMOSC Low frequence option
    IMOSC_40M               ,    ///< EMOSC Low frequence option
    EMOSC                   ,    ///< EMOSC Low frequence option
} syscon_sysclk_e;

/*----- enable/disable option -----*/
typedef enum {
    ENABLE                     = 0,    ///< EMOSC Normal option
    DISABLE                       ,    ///< EMOSC Low frequence option
} syscon_endis_e;

/*----- Clock monitor Reset option -----*/
typedef enum {
    CKM_RST_OFF                = 0,    ///< EMOSC Normal option
    CKM_RST_ON                    ,    ///< EMOSC Low frequence option
} syscon_ckmrst_e;

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
} iwdt_ovt_e;

/*----- iWDT alarm window setup -----*/
typedef enum {
    IWDT_WND_1IN8              = 0,    ///< iwdt window is 1in8 of total ovt
    IWDT_WND_2IN8                 ,    ///< iwdt window is 2in8 of total ovt
    IWDT_WND_3IN8                 ,    ///< iwdt window is 3in8 of total ovt
    IWDT_WND_4IN8                 ,    ///< iwdt window is 4in8 of total ovt
    IWDT_WND_5IN8                 ,    ///< iwdt window is 5in8 of total ovt
    IWDT_WND_6IN8                 ,    ///< iwdt window is 6in8 of total ovt
    IWDT_WND_7IN8                 ,    ///< iwdt window is 7in8 of total ovt
} iwdt_wnd_e;

/*----- LVD interrupt setup -----*/
typedef enum {
    LVD_INTAT2V55              = 0,    ///< LVD Int at 2V55
    LVD_INTAT3V00                 ,    ///< LVD Int at 3V00
    LVD_INTAT3V90                 ,    ///< LVD Int at 3V90
    LVD_INTAT4V10                 ,    ///< LVD Int at 4V10
    LVD_INTDIS                    ,    ///< LVD Interrupt disable
} lvd_intlvl_e;

/*----- LVD reset setup -----*/
typedef enum {
    LVD_RSTAT2P15              = 0,    ///< LVD Rst at 2P15
    LVD_RSTAT2P75                 ,    ///< LVD Rst at 2P75
    LVD_RSTAT3P35                 ,    ///< LVD Rst at 3P35
    LVD_RSTAT3P65                 ,    ///< LVD Rst at 3P65
} lvd_rstlvl_e;

/*----- information to be load selection -----*/
typedef enum {
    CINF0                      = 0,    ///< select custom information0
    CINF1                         ,    ///< select custom information1
    FINF0                         ,    ///< select factory information0 
    FINF1                         ,    ///< select factory information1 
} prj_infor_e;

/*----- protection information to be load selection -----*/
typedef enum {
    RDP                        = 0,    ///< select custom information0
    DBP                           ,    ///< select custom information1
    HDP                           ,    ///< select factory information0 
} prot_infor_e;

/*----- CLO source selection -----*/
typedef enum {
    CLO_ISCLK                  = 0,    ///< isclk as clo
    CLO_IMCLK                  = 1,    ///< imclk as clo
    CLO_EMCLK                  = 3,    ///< emclk as clo
    CLO_SYSCLK                 = 7,    ///< sysclk as clo
} clo_src_e;

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









/*----- GPIO Pullup/Down: Mode Parameters: Data Bits -----*/
typedef enum {
    GPIO_PULLDIS               = 0,    ///< gpio pull disable
    GPIO_PULLUP                   ,    ///< gpio as pullup
    GPIO_PULLDOWN                 ,    ///< gpio as pulldown
} gpio_pull_e;

/*----- GPIO Drive Control Codes: Mode Parameters: Data Bits -----*/
typedef enum {
    GPIO_SLOW_WEAK             = 0,    ///< gpio as slow/weak drive
    GPIO_SLOW_STRG                ,    ///< gpio as slow/strong drive
    GPIO_FAST_WEAK                ,    ///< gpio as fast/strong drive
    GPIO_FAST_STRG                ,    ///< gpio as fast/strong drive
} gpio_direction_e;

/*----- GPIO Control Codes: Mode Parameters: Parity -----*/
typedef enum {
    GPIO_IRQ_MODE_RISING_EDGE     = 0,       ///< interrupt mode for rising edge
    GPIO_IRQ_MODE_FALLING_EDGE       ,       ///< interrupt mode for falling edge
    GPIO_IRQ_MODE_DOUBLE_EDGE        ,       ///< interrupt mode for double edge
    GPIO_IRQ_MODE_LOW_LEVEL          ,       ///< interrupt mode for low level
    GPIO_IRQ_MODE_HIGH_LEVEL         ,       ///< interrupt mode for high level
} gpio_irq_mode_e;

typedef void (*gpio_event_cb_t)(int32_t idx);   ///< gpio Event call back.

/**
  \brief       Initialize GPIO handle.
  \param[in]   gpio_pin    gpio pin idx.
  \param[in]   cb_event  event callback function \ref gpio_event_cb_t
  \return      gpio_pin_handle
*/
gpio_pin_handle_t csi_gpio_pin_initialize(int32_t gpio_pin, gpio_event_cb_t cb_event);

/**
  \brief       De-initialize GPIO pin handle.stops operation and releases the software resources used by the handle.
  \param[in]   handle    gpio pin handle to operate.
  \return      error code
*/
int32_t csi_gpio_pin_uninitialize(gpio_pin_handle_t handle);

/**
  \brief       config pin mode
  \param[in]   pin       gpio pin handle to operate.
  \param[in]   mode      \ref gpio_mode_e
  \return      error code
*/
int32_t csi_gpio_pin_config_mode(gpio_pin_handle_t handle,
                            gpio_mode_e mode);

/**
  \brief       config pin direction
  \param[in]   pin       gpio pin handle to operate.
  \param[in]   dir       \ref gpio_direction_e
  \return      error code
*/
int32_t csi_gpio_pin_config_direction(gpio_pin_handle_t handle,
                            gpio_direction_e dir);

/**
  \brief       config pin
  \param[in]   pin       gpio pin handle to operate.
  \param[in]   mode      \ref gpio_mode_e
  \param[in]   dir       \ref gpio_direction_e
  \return      error code
*/
int32_t csi_gpio_pin_config(gpio_pin_handle_t handle,
                                    gpio_mode_e mode,
                            gpio_direction_e dir);

/**
  \brief       Set one or zero to the selected GPIO pin.
  \param[in]   pin       gpio pin handle to operate.
  \param[in]   value     value to be set
  \return      error code
*/
int32_t csi_gpio_pin_write(gpio_pin_handle_t handle, bool value);

/**
  \brief       Get the value of  selected GPIO pin.
  \param[in]   pin       gpio pin handle to operate.
  \param[out]  value     buffer to store the pin value
  \return      error code
*/
int32_t csi_gpio_pin_read(gpio_pin_handle_t handle, bool *value);

/**
  \brief       set GPIO interrupt mode.
  \param[in]   pin       gpio pin handle to operate.
  \param[in]   mode      irq mode to be set
  \param[in]   enable    enable flag
  \return      error code
*/
int32_t csi_gpio_pin_set_irq(gpio_pin_handle_t handle, gpio_irq_mode_e mode, bool enable);


#ifdef __cplusplus
}
#endif

#endif /* _CSI_GPIO_H_ */
