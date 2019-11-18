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
//* @file     dw_syscon.c
//* @brief    CSI Source File for syscon Driver
//* @version  V1.0
//* @date     02. Sept 2019
//******************************************************************************

#include <csi_config.h>
#include "soc.h"
#include "apt_syscon.h"
#include "csi_core.h"
#include "lib.h"

#define ERR_SYSCON(errno) (CSI_DRV_ERRNO_SYSCON_BASE | errno)
#define SYSCON_NULL_PARAM_CHK(para)                         \
        do {                                        \
            if (para == NULL) {                     \
                return ERR_SYSCON(DRV_ERROR_PARAMETER);   \
            }                                       \
        } while (0)

syscon_handle_t H_SYSCON  = (APT_SYSCON_Reg_t   *)APT_SYSCON_BASE;


static bool emosc_intialized_flag;

uint32_t _cur_hclk_freq = 10000000;
uint32_t _cur_pclk_freq = 2500000;
syscon_sysclk_e _cur_sysclk = IMOSC_20M;

///**
//  \brief       Dispatch isr according to pending bit
//  \param[in]   None
//  \return      None
//*/
//ATTRIBUTE_WEAK void dw_syscon_irqhandler(void)
//{
//    uint32_t pendbit_num = 0;  // pending bit postion
//    void (*isr_ptr_priv)(void);
//
//    /* Check the pending bit number */
//    while ( !((SYSCON->MISR) & (1ul<<pendbit_num++)) );
//
//    isr_ptr_priv = NULL;
//    for (i=0;i<sizeof(syscon_isr_table)/8;i++) {
//        if (syscon_isr_table[i].pending_bit_num == pendbit_num) {
//            isr_ptr_priv = syscon_isr_table[i].isr_ptr;
//            break;
//        }
//    }
//
//    /* Call for isr if pending bit is registered with corresponding isr */
//    if (isr_ptr_priv != NULL) {
//        isr_ptr_priv();
//    }
//        
//    /* Clear pending bit */
//    SYSCON->ICR = (1ul<<pbit_num);
//
//
//
////
////    /* Dispatch the action for ISR */
////    switch (pendbit_num) {
////        case SYSCON_INT_EVENT_ISOSC_STABLE: 
////            /* Insert your code here */
////            break;
////        case SYSCON_INT_EVENT_IMOSC_STABLE:
////            /* Insert your code here */
////            break;
////        case SYSCON_INT_EVENT_ESOSC_STABLE: 
////            /* Insert your code here */
////            break;
////        case SYSCON_INT_EVENT_EMOSC_STABLE: 
////            /* Insert your code here */
////            break;
////        case SYSCON_INT_EVENT_HFOSC_STABLE: 
////            /* Insert your code here */
////            break;
////        case SYSCON_INT_EVENT_PLL_STABLE: 
////            /* Insert your code here */
////            break;
////        case SYSCON_INT_EVENT_SYSCLK_STABLE: 
////            /* Insert your code here */
////            break;
////        case SYSCON_INT_EVENT_IWDT: 
////            /* Insert your code here */
////            break;
////        case SYSCON_INT_EVENT_WKI: 
////            /* Insert your code here */
////            break;
////        case SYSCON_INT_EVENT_SRAMERR: 
////            /* Insert your code here */
////            break;
////        case SYSCON_INT_EVENT_LVD: 
////            /* Insert your code here */
////            break;
////        case SYSCON_INT_EVENT_HWD: 
////            /* Insert your code here */
////            break;
////        case SYSCON_INT_EVENT_OPTERR: 
////            /* Insert your code here */
////            break;
////        case SYSCON_INT_EVENT_UNLOCK: 
////            /* Insert your code here */
////            break;
////        case SYSCON_INT_EVENT_ESLOST: 
////            /* Insert your code here */
////            break;
////        case SYSCON_INT_EVENT_EMLOST: 
////            /* Insert your code here */
////            break;
////        case SYSCON_INT_EVENT_EVTRG0: 
////            /* Insert your code here */
////            break;
////        case SYSCON_INT_EVENT_EVTRG1: 
////            /* Insert your code here */
////            break;
////        case SYSCON_INT_EVENT_EVTRG2: 
////            /* Insert your code here */
////            break;
////        case SYSCON_INT_EVENT_EVTRG3: 
////            /* Insert your code here */
////            break;
////        case SYSCON_INT_EVENT_CMDERR: 
////            /* Insert your code here */
////            break;
////    }
//
//}

/**
  \brief       config usart parity.
  \param[in]   lf_sel: low freq external osc selected(false in default)
  \param[in]   osc_stabletime: stable counter value (0x7 in default)
  \param[in]   osc_gain: gain control of external osc(0xf in default)
  \return      error code
*/
void csi_syscon_emosc_config(syscon_emosc_lf_e lf_sel, uint32_t osc_stabletime, uint32_t osc_gain)
{
    switch (lf_sel) {
        case EMOSC_LF_OPTION: /* low freq emosc */
            H_SYSCON->OSTR  = osc_stabletime;
            H_SYSCON->PWRCR = ((H_SYSCON->PWRCR) & ~(0xful<<8)) | ((osc_gain & 7ul)<<8) | PWRCR_KEY;
            break;
        default: // normal 
            H_SYSCON->OSTR  = osc_stabletime;
            H_SYSCON->PWRCR = ((H_SYSCON->PWRCR) & ~(0xful<<8)) | (osc_gain<<8) | PWRCR_KEY;
    }

    emosc_intialized_flag = true;
}

/**
  \brief       config usart parity.
  \param[in]   clock_source: clock source to be enable or disabled
  \param[in]   status: enable or disable
  \return      error code
*/
int32_t csi_syscon_set_clocksource_switch(syscon_oscsrc_e clock_source, syscon_endis_e status)
{
    volatile uint32_t i;
    uint32_t cur_clkstatus;

    if ((clock_source == EMOSC) && !emosc_intialized_flag) {
        return ERR_SYSCON(DRV_ERROR_OSCSET_EMOSCUNSTABLE);
    }

    cur_clkstatus = H_SYSCON->GCSR;
    if (status == ENABLE) {
        H_SYSCON->GCER = clock_source;
        cur_clkstatus |= clock_source;
    }
    else {
        H_SYSCON->GCDR = clock_source;
        cur_clkstatus &= ~clock_source;
    }

    for (i=0;i<100;i++);

    if (H_SYSCON->GCSR != cur_clkstatus) {
        ERR_SYSCON(DRV_ERROR_OSCSET_CHECKFAIL);
    }
    else {
        return 0;
    }
}


/**
  \brief       config system clock
  \param[in]   sysclk_setup: system clock option
  \param[in]   hclk_freq: value of target hclk frequence
  \param[in]   pclk_freq: value of target hclk frequence
  \return      error code
*/
int32_t csi_syscon_systemclock_config(syscon_sysclk_e sysclk_setup, uint32_t hclk_freq, uint32_t pclk_freq)
{
    volatile uint32_t i;
    uint32_t target_sysclk_freq = 0;
    uint32_t target_hclk_freq, hclk_div;
    uint32_t target_pclk_freq, pclk_div;

    // parameter check
    if (hclk_freq < pclk_freq) {
        return ERR_SYSCON(DRV_ERROR_SYSFREQ_CFGERR0);
    }

    switch (sysclk_setup) {
        case IMOSC_40M:
            if ( hclk_freq <= 40000000 ) {
                target_sysclk_freq = 40000000;
            } else {
                return ERR_SYSCON(DRV_ERROR_SYSFREQ_CFGERR1);
            }
			break;
        case IMOSC_20M:
            if ( hclk_freq <= 20000000 ) {
                target_sysclk_freq = 20000000;
            } else {
                return ERR_SYSCON(DRV_ERROR_SYSFREQ_CFGERR2);
            }
        case EMOSC:
            if ( (hclk_freq <= EMOSC_FREQ) && (EMOSC_FREQ <= 24000000) ) {
                target_sysclk_freq = EMOSC_FREQ;
            } else {
                return ERR_SYSCON(DRV_ERROR_SYSFREQ_CFGERR3);
            }
            break;
        case ISOSC:
            if ( (hclk_freq <= 3000000) ) {
                target_sysclk_freq = 3000000;
            } else {
                return ERR_SYSCON(DRV_ERROR_SYSFREQ_CFGERR4);
            }
            break;
    }
	target_hclk_freq = hclk_freq;

    hclk_div = target_sysclk_freq/target_hclk_freq;
    target_hclk_freq = target_sysclk_freq/hclk_div;
    pclk_div = hclk_freq/pclk_freq;
    target_pclk_freq = target_hclk_freq/pclk_div;

    // switch system clock as IMO40M
    if ((_cur_sysclk == IMOSC_20M) && (sysclk_setup == IMOSC_40M)) {
        H_SYSCON->GCER = 1; // enable ISOSC
        H_SYSCON->ERRINF = 0;
        for (i=0;i<100;i++);
        H_SYSCON->SCLKCR = (4 | SCLKCR_KEY); // switch to ISOSC as sysclk
        for (i=0;i<10;i++);
        if ((H_SYSCON->ERRINF) & (1ul<<4)) {
            return ERR_SYSCON(DRV_ERROR_SYSCLK_SWFAIL0);
        }
        H_SYSCON->GCDR = 2; // disable IMOSC
        H_SYSCON->CLCR |= (1ul<<22);
        H_SYSCON->GCER = 2; // enable IMOSC
        for (i=0;i<100;i++);
        H_SYSCON->SCLKCR = ((hclk_div<<8)|SCLKCR_KEY);
        for (i=0;i<10;i++);
        if ((H_SYSCON->ERRINF) & (1ul<<4)) {
            return ERR_SYSCON(DRV_ERROR_SYSCLK_SWFAIL1);
        }
    }
    // switch system clock as IMO20M
    else if ((_cur_sysclk == IMOSC_40M) && (sysclk_setup == IMOSC_20M)) {
        H_SYSCON->GCER = 1; // enable ISOSC
        H_SYSCON->ERRINF = 0;
        for (i=0;i<100;i++);
        H_SYSCON->SCLKCR = (4 | SCLKCR_KEY); // switch to ISOSC as sysclk
        for (i=0;i<10;i++);
        if ((H_SYSCON->ERRINF) & (1ul<<4)) {
            return ERR_SYSCON(DRV_ERROR_SYSCLK_SWFAIL2);
        }
        H_SYSCON->GCDR = 2; // disable IMOSC
        H_SYSCON->CLCR &= ~(1ul<<22);
        H_SYSCON->GCER = 2; // enable IMOSC
        for (i=0;i<100;i++);
        H_SYSCON->SCLKCR = ((hclk_div<<8)|SCLKCR_KEY);
        for (i=0;i<10;i++);
        if ((H_SYSCON->ERRINF) & (1ul<<4)) {
            return ERR_SYSCON(DRV_ERROR_SYSCLK_SWFAIL3);
        }
    // switch system clock as EMO
    } else if ((_cur_sysclk != EMOSC) && (sysclk_setup == EMOSC)) {
        H_SYSCON->ERRINF = 0;
        H_SYSCON->SCLKCR = (1 | (hclk_div<<8) | SCLKCR_KEY); // switch to EMOSC as sysclk
        for (i=0;i<10;i++);
        if ((H_SYSCON->ERRINF) & (1ul<<4)) {
            return ERR_SYSCON(DRV_ERROR_SYSCLK_SWFAIL4);
        }
    // switch system clock as ISO3M
    } else if ((_cur_sysclk != ISOSC_3M) && (sysclk_setup == ISOSC_3M)) {
        H_SYSCON->ERRINF = 0;
        H_SYSCON->SCLKCR = (4 | (hclk_div<<8) | SCLKCR_KEY); // switch to ISOSC as sysclk
        for (i=0;i<10;i++);
        if ((H_SYSCON->ERRINF) & (1ul<<4)) {
            return ERR_SYSCON(DRV_ERROR_SYSCLK_SWFAIL5);
        }
    } else { // only change div option
        H_SYSCON->SCLKCR = ((H_SYSCON->SCLKCR)&0xff) |  (hclk_div<<8) | SCLKCR_KEY;
    }

    /* Setup PCLK divider */
    H_SYSCON->PCLKCR = ((pclk_div<<8)|PCLKCR_KEY);

    /* Store config to global variables */
    _cur_sysclk = sysclk_setup; 
    _cur_hclk_freq = target_hclk_freq;
    _cur_pclk_freq = target_pclk_freq;

    return 0;
}

/**
  \brief       Enable/disable pclk of individual peripheral
  \param[in]   handle   syscon to be operate
  \param[in]   status   en/dis operation
  \param[in]   pclk0_sel individual pclk target on PCLK0
                         defined as: PCLK_ENDIS_ADC/PCLK_ENDIS_UART0 ...
  \param[in]   pclk1_sel individual pclk target on PCLK1
  \return      negtive when assignment is not in right pclk domain
*/
int32_t csi_syscon_set_individual_pclk_switch(syscon_endis_e status, uint32_t pclk0_sel, uint32_t pclk1_sel)
{
    if ((pclk0_sel & (1ul<<31))||!(pclk1_sel & (1ul<<31))) {    // wrong setup of pclk domain assignment
        return -1;
    }
    else {
        switch (status) {
            case ENABLE:  /*enable*/
                H_SYSCON->PCER0 = pclk0_sel;
                H_SYSCON->PCER1 = pclk1_sel;
                break;    
            default: /*disable*/
                H_SYSCON->PCDR0 = pclk0_sel;
                H_SYSCON->PCDR1 = pclk1_sel;
                break;
        }
    }

    return 0;
}

/**
  \brief       Enable/disable pclk of all peripherals
  \param[in]   status   en/dis operation (enable is default)
  \return      negtive when assignment is not in right pclk domain
*/
void csi_syscon_set_all_pclk_switch(syscon_endis_e status)
{
    switch (status) {
        case ENABLE:  /*enable*/
            H_SYSCON->PCER0 = 0xffffffff;
            H_SYSCON->PCER1 = 0xffffffff;
            break;    
        default: /*disable*/
            H_SYSCON->PCDR0 = 0xffffffff;
            H_SYSCON->PCDR1 = 0xffffffff;
            break;
    }
}

/**
  \brief       Enable/disable emosc clock monitor
  \param[in]   status   en/dis operation
  \param[in]   rst_on_fail  generate reset when fail or not  (disable is default)
  \return      None
*/
int32_t csi_syscon_set_clockmonitor_switch(syscon_endis_e status, syscon_ckmrst_e rst_on_fail)
{
    if (!((H_SYSCON->GCSR) & 1ul)) {
        return ERR_SYSCON(DRV_ERROR_CKM_ISOABS);
    }

    H_SYSCON->ERRINF = 0;

    if ((status == ENABLE) && (rst_on_fail == CKM_RST_ON)) {
        H_SYSCON->GCER = (1ul<<18) | (1ul<<19);
    }
    else if ((status == ENABLE) && (rst_on_fail == CKM_RST_OFF)) {
        H_SYSCON->GCER = (1ul<<18) ;
        H_SYSCON->GCDR = (1ul<<19) ;
    }
    else {
        H_SYSCON->GCDR = (1ul<<18) | (1ul<<19) ;
    }

    if ((H_SYSCON->ERRINF) & (1ul<<11)) {
        return ERR_SYSCON(DRV_ERROR_CKM_SETFAIL);
    }
    else {
        return 0;
    }
}

/**
  \brief       Enable/disable pclk under sleep mode
  \param[in]   status   en/dis operation (enable is default)
  \return      None
*/
void csi_syscon_pclk_active_under_sleep(syscon_endis_e status)
{
    if (status == APT_DEF_ENABLE) {
        H_SYSCON->GCER = (1ul<<8);
    } 
    else {
        H_SYSCON->GCDR = (1ul<<8);
    }
}

/**
  \brief       Enable/disable iWDT
  \param[in]   status   en/dis operation(disable is default)
  \return      None
*/
void csi_syscon_set_iwdt_switch(syscon_endis_e status)
{
    if (status == APT_DEF_ENABLE) {
        H_SYSCON->IWDEDR = IWDEDR_KEY ;
    } 
    else {
        H_SYSCON->IWDEDR = IWDEDR_KEY | 0x5555;
    }
}

/**
  \brief       Reload iwdt
  \return      None
*/
void csi_syscon_iwdt_reload(void)
{
    volatile uint32_t i;
    H_SYSCON->IWDCNT = (0x5Aul<<24);
    for (i=0;i<100;i++);
    while ((H_SYSCON->IWDCNT) & (1ul<<31));
}

/**
  \brief       config iWDT overtime and alarm time
  \param[in]   iwdt_ovt overflow time config
  \param[in]   iwdt_wnd alarm window time config
  \return      None
*/
void csi_syscon_iwdt_config(iwdt_ovt_e iwdt_ovt, iwdt_wnd_e iwdt_wnd)
{
    H_SYSCON->IWDCR = (iwdt_ovt << 8) | (iwdt_wnd << 2) | (0x8778ul << 16);
}

/**
  \brief       config LVD level
  \param[in]   lvd_intlvl interrupt level selection
  \param[in]   lvd_rstlvl reset level selection (LVD_RSTAT2P15 is default)
  \return      None
*/
void csi_syscon_lvd_config(lvd_intlvl_e lvd_intlvl, lvd_rstlvl_e lvd_rstlvl)
{
    if (lvd_intlvl == LVD_INTDIS) {
        H_SYSCON->LVDCR = ((H_SYSCON->LVDCR) & 0xf) | (0<<11) | (lvd_rstlvl<<12) | LVDCR_KEY;
    }
    else {
        H_SYSCON->LVDCR = ((H_SYSCON->LVDCR) & 0xf) | (1ul<<11) | (lvd_intlvl<<8) | (lvd_rstlvl<<12) | LVDCR_KEY;
    }

}

/*
  \brief       Enable/disable LVD
  \param[in]   status   en/dis operation(APT_DEF_ENABLE is default)
  \return      None
*/
void csi_syscon_set_lvd_switch(syscon_endis_e status)
{
    if (status == ENABLE) {
        H_SYSCON->LVDCR = LVDCR_KEY | ((H_SYSCON->LVDCR) & ~0xf) ;
    } 
    else {
        H_SYSCON->LVDCR = LVDCR_KEY | ((H_SYSCON->LVDCR) | 0xa);
    }
}

/**
  \brief       Get LVD level
  \param[in]   iwdt_ovt overflow time config
  \param[in]   iwdt_wnd alarm window time config
  \return      None
*/
bool csi_syscon_get_lvd_status(void)
{
    bool lvd_flag;
    if ((H_SYSCON->LVDCR) & (1ul<<15)) {
        lvd_flag = true;
    }
    else {
        lvd_flag = false;
    }
    
    return lvd_flag;
}

/**
  \brief       EXI trigger level rising edge config
  \param[in]   exi_sel:  exi line to be set
  \param[in]   status:   enable/disable control(APT_DEF_ENABLE is default)
  \return      current setup of falling edge config
*/
uint32_t csi_syscon_exi_set_rising(uint32_t exi_sel, syscon_endis_e status)
{
    if (status == ENABLE) { /* select as rising edge*/
        H_SYSCON->EXIRT |= exi_sel;
    }
    else
    {
        H_SYSCON->EXIRT &= ~exi_sel;
    }

    return H_SYSCON->EXIRT;
}

/**
  \brief       EXI trigger level rising edge config
  \param[in]   exi_sel:  exi line to be set
  \param[in]   status:   enable/disable control(APT_DEF_ENABLE is default)
  \return      current setup of falling edge config
*/
uint32_t dw_syscon_exi_set_falling(uint32_t exi_sel, bool status)
{
    if (status == APT_DEF_ENABLE) { /* select as falling edge*/
        H_SYSCON->EXIFT |= exi_sel;
    }
    else
    {
        H_SYSCON->EXIFT &= ~exi_sel;
    }

    return H_SYSCON->EXIFT;
}

/**
  \brief       EXI enabled/disable control
  \param[in]   exi_sel:  exi line to be set
  \param[in]   status:   enable/disable control(APT_DEF_ENABLE is default)
  \return      current masking status
*/
uint32_t dw_syscon_set_exi_switch(uint32_t exi_sel, bool status)
{
    if (status == APT_DEF_ENABLE) {
        H_SYSCON->EXIER = exi_sel;
    }
    else {
        H_SYSCON->EXIDR = exi_sel;
    }

    return H_SYSCON->EXIMR;
}

/**
  \brief       Clear EXI pending 
  \param[in]   iwdt_ovt overflow time config
  \param[in]   iwdt_wnd alarm window time config
  \return      None
*/
void dw_syscon_clear_exi_pending(uint32_t exi_sel)
{
    H_SYSCON->EXICR = exi_sel;
}

/**
  \brief       Get interrupt pending bit
  \param[in]   exi_sel:  exi pending to be read
  \param[in]   status:   raw(T)/masked(F) pending bit select(APT_DEF_DISABLE is default)
  \return      corresponding bit of pending according to int_sel
*/
uint32_t dw_syscon_get_exi_status(uint32_t exi_sel, bool status)
{
    if (status == APT_DEF_ENABLE) {
        return ((H_SYSCON->EXIRS) & exi_sel);
    }
    else {
        return ((H_SYSCON->EXICR) & exi_sel);
    }
}

/**
  \brief       Software trigger EXI
  \param[in]   exi_sel  exi line to be triggered
  \return      None
*/
void dw_syscon_software_trigger_exi(uint32_t exi_sel)
{
    H_SYSCON->EXIAR = exi_sel;
}


/**
  \brief       Reset source information
  \return      reset_src_t 
*/
reset_src_t dw_syscon_get_reset_source_status(void)
{
    return (reset_src_t)(H_SYSCON->RSR);
}

/**
  \brief       Set interrupt enabled/disable control
  \param[in]   int_sel:  interrupt to be en/dis
  \param[in]   status:   enable/disable
  \return      current masking status
*/
uint32_t dw_syscon_set_interrupt_switch(uint32_t int_sel, bool status)
{
    if (status == APT_DEF_ENABLE) {
        H_SYSCON->IECR = int_sel;
    }
    else {
        H_SYSCON->IDCR = int_sel;
    }

    return H_SYSCON->IMSR;
}

/**
  \brief       Clear pending bit
  \param[in]   int_sel:  interrupt to be clear
  \return      None
*/
void dw_syscon_clear_interrupt_pending(uint32_t int_sel)
{
    H_SYSCON->ICR = int_sel;
}

/**
  \brief       Get interrupt pending bit
  \param[in]   int_sel:  interrupt pending to be read
  \param[in]   status:   raw(T)/masked(F) pending bit select
  \return      corresponding bit of pending according to int_sel
*/
uint32_t dw_syscon_get_interrupt_status(uint32_t int_sel, bool status)
{
    if (status == APT_DEF_ENABLE) {
        return ((H_SYSCON->RISR) & int_sel);
    }
    else {
        return ((H_SYSCON->ISR) & int_sel);
    }
}


/**
  \brief       Get CINF, FINF information
  \param[in]   info_sel information to be load
  \return      result stored in flash
*/
uint32_t dw_syscon_get_project_information(prj_infor_t info_sel)
{
    switch(info_sel)
    {
        case CINF0:
            return H_SYSCON->CINF0;
            break;
        case CINF1:
            return H_SYSCON->CINF1;
            break;
        case FINF0:
            return H_SYSCON->FINF0;
            break;
        case FINF1:
            return H_SYSCON->FINF1;
            break;
    }
	
	return 0;
}

/**
  \brief       Get protection status
  \param[in]   info_sel information to be load
  \return      result of check
*/
uint32_t dw_syscon_get_protection_information(prot_infor_t info_sel)
{
    switch(info_sel)
    {
        case RDP:
            if ((H_SYSCON->OPT0) & (1ul<<27)) {
                return APT_DEF_ENABLE;
            }
            else {
                return APT_DEF_DISABLE;
            }
            break;
        case DBP:
            if ((H_SYSCON->OPT0) & (1ul<<8)) {
                return APT_DEF_ENABLE;
            }
            else {
                return APT_DEF_DISABLE;
            }
            break;
        case HDP:
            if ((H_SYSCON->OPT0) & (1ul<<16)) {
                return 1;
            }
            else if ((H_SYSCON->OPT0) & (1ul<<17)) {
                return 2;
            }
            else if ((H_SYSCON->OPT0) & (1ul<<18)) {
                return 3;
            }
            else if ((H_SYSCON->OPT0) & (1ul<<19)) {
                return 4;
            }
            else {
                return APT_DEF_DISABLE;
            }
            break;
    }
	
	return 0;
}

/**
  \brief       Set hfosc (96MHz) enable/disable
  \param[in]   status: enable/disable status
  \return      None
*/
void dw_syscon_set_hfosc_switch(bool status)
{
    if (status == APT_DEF_ENABLE) {
        H_SYSCON->CLCR |= (1ul<<20);
        while (!((H_SYSCON->CLCR) & (1ul<<21)));

    }
    else {
        H_SYSCON->CLCR &= ~(1ul<<20);

    }
}

/**
  \brief       Set CLO output
  \param[in]   clo_sel: clo source selection
  \return      None
*/
void dw_syscon_clo_config(clo_src_t clo_sel)
{
    H_SYSCON->CLCR = ((H_SYSCON->CLCR) & ~(0xf<<16))|(clo_sel<<16);
}


