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
#include <core_ck801.h>
#include <apt_common.h>


#define PWRCR_KEY (0xA66Aul<<16)
#define SCLKCR_KEY (0xD22Dul<<16)
#define PCLKCR_KEY (0xC33Cul<<16)
#define IWDEDR_KEY (0x7887ul<<16)
#define IWDT_KEY (0x8778ul<<16)
#define LVDCR_KEY (0xB44Bul<<16)

/*----- SYSCON Register Define -----*/
typedef struct {
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
} APT_SYSCON_Reg_t, *syscon_handle_t;

extern syscon_handle_t H_SYSCON;


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

/*----- Periph PCLK selection option -----*/
typedef enum {
    PCLK_IFC             = 1ull,            
    PCLK_ADC             = (1ull<<4),
    PCLK_TKEY            = (1ull<<6),
    PCLK_USART0          = (1ull<<8),
    PCLK_USART1          = (1ull<<9),
    PCLK_I2C             = (1ull<<22),
    PCLK_TC0             = (1ull<<(32+8)),
    PCLK_TC1             = (1ull<<(32+9)),
    PCLK_TC2             = (1ull<<(32+10)),
    PCLK_TC3             = (1ull<<(32+11)),
    PCLK_PWM             = (1ull<<(32+12)),
    PCLK_LED             = (1ull<<(32+16)),
    PCLK_CMP0            = (1ull<<(32+17)),
    PCLK_CMP1            = (1ull<<(32+18)),
    PCLK_CMP2            = (1ull<<(32+19)),
    PCLK_CMP3            = (1ull<<(32+20)),
    PCLK_CMP4            = (1ull<<(32+21)),
    PCLK_OPA             = (1ull<<(32+22)),
    PCLK_GPIOA0          = (1ull<<(32+24)),
    PCLK_GPIOB0          = (1ull<<(32+25)),
    PCLK_GPIOC0          = (1ull<<(32+26)),
    PCLK_GPIOD0          = (1ull<<(32+27)),
} syscon_pclk_e;

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

typedef enum {
    RDP_ON                      =0,
    RDP_OFF                       ,
    DBP_ON                        ,
    DBP_OFF                       ,
    HDP_ALL                       ,
    HDP_1K                        ,
    HDP_2K                        ,
    HDP_4K                        ,
    HDP_OFF                       ,
} prot_ret_e;

/*----- CLO source selection -----*/
typedef enum {
    CLO_ISCLK                  = 0,    ///< isclk as clo
    CLO_IMCLK                  = 1,    ///< imclk as clo
    CLO_EMCLK                  = 3,    ///< emclk as clo
    CLO_SYSCLK                 = 7,    ///< sysclk as clo
    CLO_AHBCLK                 = 11,   ///< ahbclk as clo
    CLO_APBCLK                 = 12,   ///< ahbclk as clo
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
} reset_log_t;



/*----- SYSCON Interrupt Event  -----*/
typedef enum {
    // ---------    EXI    ---------
    ISOSTBL_EVENT         =0,
    IMOSTBL_EVENT           ,
    RSVD_0                  ,
    EMOSTBL_EVENT           ,
    RSVD_1                  ,
    RSVD_2                  ,
    RSVD_3                  ,
    SYSCLK_EVENT            ,
    IWDTINT_EVENT           ,
    RSVD_4                  ,
    RSVD_5                  ,
    LVDINT_EVENT            ,
    RSVD_6                  ,
    RSVD_7                  ,
    RSVD_8                  ,
    RSVD_9                  ,
    RSVD_10                 ,
    RSVD_11                 ,
    EMFAIL_EVENT            ,
    EMRCV_EVENT             ,
    RSVD_12                 ,
    RSVD_13                 ,
    RSVD_14                 ,
    RSVD_15                 ,
    RSVD_16                 ,
    RSVD_17                 ,
    RSVD_18                 ,
    RSVD_19                 ,
    RSVD_20                 ,
    CMDERR_EVENT            ,
} syscon_event_e;

typedef void (*syscon_event_cb_t)(exi_event_e event);   ///< gpio Event call back.

////////////////////////////////// Public //////////////////////////////////////
/**
 * @brief       ISR call-back registration
 * @param[i]    cb:     pointer to customer ISR when EXI is called 
 * @param[i]    idx:    exi isr number to be initialized
 * @return      zero on success
*/
int32_t csi_syscon_cb_init (syscon_event_cb_t cb);

/**
  \brief       config usart parity.
  \param[in]   lf_sel: low freq external osc selected(false in default)
  \param[in]   osc_stabletime: stable counter value (0x7 in default)
  \param[in]   osc_gain: gain control of external osc(0xf in default)
  \return      error code
*/
void csi_syscon_emosc_config(syscon_emosc_lf_e lf_sel, uint32_t osc_stabletime, uint32_t osc_gain);

/**
  \brief       config usart parity.
  \param[in]   clock_source: clock source to be enable or disabled
  \param[in]   status: enable or disable
  \return      error code
*/
int32_t csi_syscon_set_clocksource_switch(syscon_oscsrc_e clock_source, syscon_endis_e status);

/**
  \brief       config system clock
  \param[in]   sysclk_setup: system clock option
  \param[in]   hclk_freq: value of target hclk frequence
  \param[in]   pclk_freq: value of target hclk frequence
  \return      error code
*/
int32_t csi_syscon_systemclock_config(syscon_sysclk_e sysclk_setup, uint32_t hclk_freq, uint32_t pclk_freq);

/**
  \brief       Enable/disable pclk of individual peripheral
  \param[in]   handle   syscon to be operate
  \param[in]   status   en/dis operation
  \param[in]   pclk_sel individual pclk target on PCLK0
                        defined as: PCLK_ENDIS_ADC/PCLK_ENDIS_UART0 ...
  \return      negtive when assignment is not in right pclk domain
*/
int32_t csi_syscon_set_solo_pclk_switch(syscon_endis_e status, uint64_t pclk_sel);

/**
  \brief       Enable/disable pclk of all peripherals
  \param[in]   status   en/dis operation (enable is default)
  \return      negtive when assignment is not in right pclk domain
*/
void csi_syscon_set_all_pclk_switch(syscon_endis_e status);

/**
  \brief       Enable/disable emosc clock monitor
  \param[in]   status   en/dis operation
  \param[in]   rst_on_fail  generate reset when fail or not  (disable is default)
  \return      None
*/
int32_t csi_syscon_clockmonitor_set_switch(syscon_endis_e status, syscon_ckmrst_e rst_on_fail);

/**
  \brief       Enable/disable pclk under sleep mode
  \param[in]   status   en/dis operation (enable is default)
  \return      None
*/
void csi_syscon_pclk_active_under_sleep(syscon_endis_e status);

/**
  \brief       Enable/disable iWDT
  \param[in]   status   en/dis operation(disable is default)
  \return      None
*/
void csi_syscon_iwdt_set_switch(syscon_endis_e status);

/**
  \brief       Reload iwdt
  \return      None
*/
void csi_syscon_iwdt_reload(void);

/**
  \brief       config iWDT overtime and alarm time
  \param[in]   iwdt_ovt overflow time config
  \param[in]   iwdt_wnd alarm window time config
  \return      None
*/
void csi_syscon_iwdt_config(iwdt_ovt_e iwdt_ovt, iwdt_wnd_e iwdt_wnd);

/**
  \brief       config LVD level
  \param[in]   lvd_intlvl interrupt level selection
  \param[in]   lvd_rstlvl reset level selection (LVD_RSTAT2P15 is default)
  \return      None
*/
void csi_syscon_lvd_config(lvd_intlvl_e lvd_intlvl, lvd_rstlvl_e lvd_rstlvl);

/*
  \brief       Enable/disable LVD
  \param[in]   status   en/dis operation(APT_DEF_ENABLE is default)
  \return      None
*/
void csi_syscon_lvd_set_switch(syscon_endis_e status);

/**
  \brief       Get LVD level
  \return      LVD current level
*/
bool csi_syscon_lvd_get_status(void);

/**
  \brief       EXI trigger level rising edge config
  \param[in]   exi_sel:  exi event to be set
  \param[in]   status:   enable/disable control(APT_DEF_ENABLE is default)
  \return      current setup of falling edge config
*/
uint32_t csi_syscon_exi_set_rising(exi_event_e exi_sel, syscon_endis_e status);

/**
  \brief       EXI trigger level rising edge config
  \param[in]   exi_sel:  exi event to be set
  \param[in]   status:   enable/disable control(APT_DEF_ENABLE is default)
  \return      current setup of falling edge config
*/
uint32_t csi_syscon_exi_set_falling(exi_event_e exi_sel, syscon_endis_e status);

/**
  \brief       EXI enabled/disable control
  \param[in]   exi_sel:  exi event to be set
  \param[in]   status:   enable/disable control(APT_DEF_ENABLE is default)
  \return      current masking status
*/
uint32_t csi_syscon_exi_set_switch(exi_event_e exi_sel, syscon_endis_e status);

/**
  \brief       Clear EXI pending 
  \param[in]   exi_sel: exi event to be clear
  \return      None
*/
void csi_syscon_clear_exi_pending(exi_event_e exi_sel);

/**
  \brief       Get interrupt pending bit
  \param[in]   exi_sel:  exi pending to be read
  \param[in]   status:   raw(T)/masked(F) pending bit select(APT_DEF_DISABLE is default)
  \return      corresponding bit of pending according to int_sel
*/
uint32_t csi_syscon_exi_get_status(exi_event_e exi_sel, syscon_endis_e status);

/**
  \brief       Software trigger EXI
  \param[in]   exi_sel  exi line to be triggered
  \return      None
*/
void csi_syscon_software_trigger_exi(exi_event_e exi_sel);

/**
  \brief       Reset source information
  \return      reset_src_t 
*/
reset_log_t csi_syscon_get_reset_log_get_status(void);

/**
  \brief       Set interrupt enabled/disable control
  \param[in]   int_sel:  interrupt to be en/dis
  \param[in]   status:   enable/disable
  \return      current masking status
*/
uint32_t csi_syscon_interrupt_set_switch(syscon_event_e int_sel, syscon_endis_e status);

/**
  \brief       Clear pending bit
  \param[in]   int_sel:  interrupt to be clear
  \return      None
*/
void csi_syscon_interrupt_clear_pending(syscon_event_e int_sel);

/**
  \brief       Get interrupt pending bit
  \param[in]   int_sel:  interrupt pending to be read
  \param[in]   status:   raw(T)/masked(F) pending bit select
  \return      corresponding bit of pending according to int_sel
*/
uint32_t csi_syscon_interrupt_get_status(syscon_event_e int_sel, syscon_endis_e status);

/**
  \brief       Get CINF, FINF information
  \param[in]   info_sel information to be load
  \return      result stored in flash
*/
uint32_t csi_syscon_get_prj_infor(prj_infor_e info_sel);

/**
  \brief       Get protection status
  \param[in]   info_sel information to be load
  \return      result of check
*/
prot_ret_e csi_syscon_get_prot_infor(prot_infor_e info_sel);

/**
  \brief       Set hfosc (96MHz) enable/disable
  \param[in]   status: enable/disable status
  \return      None
*/
void csi_syscon_hfosc_set_switch(syscon_endis_e status);

/**
  \brief       Set CLO output
  \param[in]   clo_sel: clo source selection
  \return      None
*/
void csi_syscon_clo_config(clo_src_e clo_sel);



#ifdef __cplusplus
}
#endif

#endif /* _CSI_SYSCON_H_ */
