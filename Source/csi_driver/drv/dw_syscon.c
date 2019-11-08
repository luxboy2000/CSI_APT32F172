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
#include "csi_core.h"
#include "lib.h"



typedef struct {
    uint32_t pending_bit_num;
    void (*isr_ptr)(void);
} syscon_isr_table_t;

extern syscon_isr_table_t syscon_isr_table[];

static bool emosc_intialized_flag;

uint32_t _cur_sysclk, _cur_hclk_freq, _cur_pclk_freq;

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
  \param[in]   handle  usart handle to operate.
  \param[in]   lf_sel: low freq external osc selected(false in default)
  \param[in]   osc_stabletime: stable counter value (0x7 in default)
  \param[in]   osc_gain: gain control of external osc(0xf in default)
  \return      error code
*/
void dw_syscon_emosc_config(syscon_handle_t handle, bool lf_sel, uint32_t osc_stabletime, uint32_t osc_gain)
{
    switch (lf_sel) {
        case false: /* high freq emosc */
            handle->OSTR  = osc_stabletime;
            handle->PWRCR = ((handle->PWRCR) & ~(0xful<<8)) | (osc_gain<<8) | PWRCR_KEY;
            break;
        case true: /* low freq emosc */
            handle->OSTR  = osc_stabletime;
            handle->PWRCR = ((handle->PWRCR) & ~(0xful<<8)) | ((osc_gain & 7ul)<<8) | PWRCR_KEY;
            break;
    }

    emosc_intialized_flag = true;
}

/**
  \brief       config usart parity.
  \param[in]   handle  usart handle to operate.
  \param[in]   parity    \ref usart_parity_e
  \return      error code
*/
int32_t dw_syscon_set_clocksource_switch(syscon_handle_t handle, uint32_t target_clock, bool status)
{
    uint32_t cur_clkstatus;

    if ((target_clock == ENDIS_EMOSC) && !emosc_intialized_flag) {
        return -1;
    }

    cur_clkstatus = handle->GCSR;
    if (status == APT_DEF_ENABLE) {
        handle->GCER = target_clock;
        cur_clkstatus |= target_clock;
    }
    else {
        handle->GCDR = target_clock;
        cur_clkstatus &= ~target_clock;
    }

    mdelay (100);

    if (handle->GCSR != cur_clkstatus) {
        return -1;
    }
    else {
        return 0;
    }
}


/**
  \brief       config usart parity.
  \param[in]   handle  usart handle to operate.
  \param[in]   parity    \ref usart_parity_e
  \return      error code
*/
int32_t dw_syscon_systemclock_config(syscon_handle_t handle, sysclk_src_t target_sysclk, uint32_t hclk_freq, uint32_t pclk_freq)
{
    volatile uint32_t i;
    uint32_t target_sysclk_freq = 0;
    uint32_t target_hclk_freq, hclk_div;
    uint32_t target_pclk_freq, pclk_div;

    if (hclk_freq < pclk_freq) {
        return -1;  // Error config
    }

    switch (target_sysclk) {
        case SYSCLK_IMOSC_40M:
            target_sysclk_freq = 40000000;
			break;
        case SYSCLK_IMOSC_20M:
            target_sysclk_freq = 20000000;
            break;
        case SYSCLK_EMOSC:
            target_sysclk_freq = EMOSC_FREQ;
            break;
        case SYSCLK_ISOSC:
            target_sysclk_freq = 3000000;
            break;
    }
	target_hclk_freq = hclk_freq;

    hclk_div = target_sysclk_freq/target_hclk_freq;
    target_hclk_freq = target_sysclk_freq/hclk_div;
    pclk_div = hclk_freq/pclk_freq;
    target_pclk_freq = target_hclk_freq/pclk_div;

    if ((_cur_sysclk == SYSCLK_IMOSC_20M) && (target_sysclk == SYSCLK_IMOSC_40M)) {
        handle->GCER = 1; // enable ISOSC
        handle->ERRINF = 0;
        for (i=0;i<100;i++);
        handle->SCLKCR = (4 | SCLKCR_KEY); // switch to ISOSC as sysclk
        for (i=0;i<10;i++);
        if ((handle->ERRINF) & (1ul<<4)) {
            return -2;
        }
        handle->GCDR = 2; // disable IMOSC
        handle->CLCR |= (1ul<<22);
        handle->GCER = 2; // enable IMOSC
        for (i=0;i<100;i++);
        handle->SCLKCR = ((hclk_div<<8)|SCLKCR_KEY);
        for (i=0;i<10;i++);
        if ((handle->ERRINF) & (1ul<<4)) {
            return -2;
        }
    }
    else if ((_cur_sysclk == SYSCLK_IMOSC_40M) && (target_sysclk == SYSCLK_IMOSC_20M)) {
        handle->GCER = 1; // enable ISOSC
        handle->ERRINF = 0;
        for (i=0;i<100;i++);
        handle->SCLKCR = (4 | SCLKCR_KEY); // switch to ISOSC as sysclk
        for (i=0;i<10;i++);
        if ((handle->ERRINF) & (1ul<<4)) {
            return -2;
        }
        handle->GCDR = 2; // disable IMOSC
        handle->CLCR &= ~(1ul<<22);
        handle->GCER = 2; // enable IMOSC
        for (i=0;i<100;i++);
        handle->SCLKCR = ((hclk_div<<8)|SCLKCR_KEY);
        for (i=0;i<10;i++);
        if ((handle->ERRINF) & (1ul<<4)) {
            return -2;
        }
    } else if (target_sysclk == SYSCLK_EMOSC) {
        handle->ERRINF = 0;
        handle->SCLKCR = (1 | (hclk_div<<8) | SCLKCR_KEY); // switch to EMOSC as sysclk
        for (i=0;i<10;i++);
        if ((handle->ERRINF) & (1ul<<4)) {
            return -2;
        }
    } else if (target_sysclk == SYSCLK_ISOSC) {
        handle->ERRINF = 0;
        handle->SCLKCR = (4 | (hclk_div<<8) | SCLKCR_KEY); // switch to ISOSC as sysclk
        for (i=0;i<10;i++);
        if ((handle->ERRINF) & (1ul<<4)) {
            return -2;
        }
    }

    /* Setup PCLK divider */
    handle->PCLKCR = ((pclk_div<<8)|PCLKCR_KEY);

    /* Store config to global variables */
    _cur_sysclk = target_sysclk; 
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
int32_t dw_syscon_set_individual_pclk_switch(syscon_handle_t handle, bool status, uint32_t pclk0_sel, uint32_t pclk1_sel)
{
    if ((pclk0_sel & (1ul<<31))||!(pclk1_sel & (1ul<<31))) {    // wrong setup of pclk domain assignment
        return -1;
    }
    else {
        switch (status) {
            case true:  /*enable*/
                handle->PCER0 = pclk0_sel;
                handle->PCER1 = pclk1_sel;
                break;    
            case false: /*disable*/
                handle->PCDR0 = pclk0_sel;
                handle->PCDR1 = pclk1_sel;
                break;
        }
    }

    return 0;
}

/**
  \brief       Enable/disable pclk of all peripherals
  \param[in]   handle   syscon to be operate
  \param[in]   status   en/dis operation (enable is default)
  \return      negtive when assignment is not in right pclk domain
*/
void dw_syscon_set_all_pclk_switch(syscon_handle_t handle, bool status)
{
    switch (status) {
        case true:  /*enable*/
            handle->PCER0 = 0xffffffff;
            handle->PCER1 = 0xffffffff;
            break;    
        case false: /*disable*/
            handle->PCDR0 = 0xffffffff;
            handle->PCDR1 = 0xffffffff;
            break;
    }
}

/**
  \brief       Enable/disable emosc clock monitor
  \param[in]   handle   syscon to be operate
  \param[in]   status   en/dis operation
  \param[in]   rst_on_fail  generate reset when fail or not  (disable is default)
  \return      None
*/
int32_t dw_syscon_set_clockmonitor_switch(syscon_handle_t handle, bool status, bool rst_on_fail)
{
    if (!((handle->GCSR) & 1ul)) {
        return -1;  // fail to setup clock monitor, due to isosc absence
    }

    handle->ERRINF = 0;

    if ((status == APT_DEF_ENABLE) && (rst_on_fail == APT_DEF_ENABLE)) {
        handle->GCER = (1ul<<18) | (1ul<<19);
    }
    else if ((status == APT_DEF_ENABLE) && (rst_on_fail == APT_DEF_DISABLE)) {
        handle->GCER = (1ul<<18) ;
        handle->GCDR = (1ul<<19) ;
    }
    else {
        handle->GCDR = (1ul<<18) | (1ul<<19) ;
    }

    if ((handle->ERRINF) & (1ul<<11)) {
        return -2;
    }
    else {
        return 0;
    }
}

/**
  \brief       Enable/disable pclk under sleep mode
  \param[in]   handle   syscon to be operate
  \param[in]   status   en/dis operation (enable is default)
  \return      None
*/
void dw_syscon_pclk_active_under_sleep(syscon_handle_t handle, bool status)
{
    if (status == APT_DEF_ENABLE) {
        handle->GCER = (1ul<<8);
    } 
    else {
        handle->GCDR = (1ul<<8);
    }
}

/**
  \brief       Enable/disable iWDT
  \param[in]   handle   syscon to be operate
  \param[in]   status   en/dis operation(disable is default)
  \return      None
*/
void dw_syscon_set_iwdt_switch(syscon_handle_t handle, bool status)
{
    if (status == APT_DEF_ENABLE) {
        handle->IWDEDR = IWDEDR_KEY ;
    } 
    else {
        handle->IWDEDR = IWDEDR_KEY | 0x5555;
    }
}

/**
  \brief       Reload iwdt
  \param[in]   handle   syscon to be operate
  \return      None
*/
void dw_syscon_iwdt_reload(syscon_handle_t handle)
{
    volatile uint32_t i;
    handle->IWDCNT = (0x5Aul<<24);
    for (i=0;i<100;i++);
    while ((handle->IWDCNT) & (1ul<<31));
}

/**
  \brief       config iWDT overtime and alarm time
  \param[in]   handle   syscon to be operate
  \param[in]   iwdt_ovt overflow time config
  \param[in]   iwdt_wnd alarm window time config
  \return      None
*/
void dw_syscon_iwdt_config(syscon_handle_t handle, iwdt_ovt_t iwdt_ovt, iwdt_wnd_t iwdt_wnd)
{
    handle->IWDCR = (iwdt_ovt << 8) | (iwdt_wnd << 2) | (0x8778ul << 16);
}

/**
  \brief       config LVD level
  \param[in]   handle   syscon to be operate
  \param[in]   lvd_intlvl interrupt level selection
  \param[in]   lvd_rstlvl reset level selection (LVD_RSTAT2P15 is default)
  \return      None
*/
void dw_syscon_lvd_config(syscon_handle_t handle, lvd_intlvl_t lvd_intlvl, lvd_rstlvl_t lvd_rstlvl)
{
    if (lvd_intlvl == LVD_INTDIS) {
        handle->LVDCR = ((handle->LVDCR) & 0xf) | (0<<11) | (lvd_rstlvl<<12) | LVDCR_KEY;
    }
    else {
        handle->LVDCR = ((handle->LVDCR) & 0xf) | (1ul<<11) | (lvd_intlvl<<8) | (lvd_rstlvl<<12) | LVDCR_KEY;
    }

}

/*
  \brief       Enable/disable LVD
  \param[in]   handle   syscon to be operate
  \param[in]   status   en/dis operation(APT_DEF_ENABLE is default)
  \return      None
*/
void dw_syscon_set_lvd_switch(syscon_handle_t handle, bool status)
{
    if (status == APT_DEF_ENABLE) {
        handle->LVDCR = LVDCR_KEY | ((handle->LVDCR) & ~0xf) ;
    } 
    else {
        handle->LVDCR = LVDCR_KEY | ((handle->LVDCR) | 0xa);
    }
}

/**
  \brief       Get LVD level
  \param[in]   handle   syscon to be operate
  \param[in]   iwdt_ovt overflow time config
  \param[in]   iwdt_wnd alarm window time config
  \return      None
*/
bool dw_syscon_get_lvd_status(syscon_handle_t handle)
{
    bool lvd_flag;
    if ((handle->LVDCR) & (1ul<<15)) {
        lvd_flag = true;
    }
    else {
        lvd_flag = false;
    }
    
    return lvd_flag;
}

/**
  \brief       EXI trigger level rising edge config
  \param[in]   handle    syscon to be operate
  \param[in]   exi_sel:  exi line to be set
  \param[in]   status:   enable/disable control(APT_DEF_ENABLE is default)
  \return      current setup of falling edge config
*/
uint32_t dw_syscon_exi_set_rising(syscon_handle_t handle, uint32_t exi_sel, bool status)
{
    if (status == APT_DEF_ENABLE) { /* select as rising edge*/
        handle->EXIRT |= exi_sel;
    }
    else
    {
        handle->EXIRT &= ~exi_sel;
    }

    return handle->EXIRT;
}

/**
  \brief       EXI trigger level rising edge config
  \param[in]   handle    syscon to be operate
  \param[in]   exi_sel:  exi line to be set
  \param[in]   status:   enable/disable control(APT_DEF_ENABLE is default)
  \return      current setup of falling edge config
*/
uint32_t dw_syscon_exi_set_falling(syscon_handle_t handle, uint32_t exi_sel, bool status)
{
    if (status == APT_DEF_ENABLE) { /* select as falling edge*/
        handle->EXIFT |= exi_sel;
    }
    else
    {
        handle->EXIFT &= ~exi_sel;
    }

    return handle->EXIFT;
}

/**
  \brief       EXI enabled/disable control
  \param[in]   handle:   syscon to be operate
  \param[in]   exi_sel:  exi line to be set
  \param[in]   status:   enable/disable control(APT_DEF_ENABLE is default)
  \return      current masking status
*/
uint32_t dw_syscon_set_exi_switch(syscon_handle_t handle, uint32_t exi_sel, bool status)
{
    if (status == APT_DEF_ENABLE) {
        handle->EXIER = exi_sel;
    }
    else {
        handle->EXIDR = exi_sel;
    }

    return handle->EXIMR;
}

/**
  \brief       Clear EXI pending 
  \param[in]   handle   syscon to be operate
  \param[in]   iwdt_ovt overflow time config
  \param[in]   iwdt_wnd alarm window time config
  \return      None
*/
void dw_syscon_clear_exi_pending(syscon_handle_t handle, uint32_t exi_sel)
{
    handle->EXICR = exi_sel;
}

/**
  \brief       Get interrupt pending bit
  \param[in]   handle:   syscon to be operate
  \param[in]   exi_sel:  exi pending to be read
  \param[in]   status:   raw(T)/masked(F) pending bit select(APT_DEF_DISABLE is default)
  \return      corresponding bit of pending according to int_sel
*/
uint32_t dw_syscon_get_exi_status(syscon_handle_t handle, uint32_t exi_sel, bool status)
{
    if (status == APT_DEF_ENABLE) {
        return ((handle->EXIRS) & exi_sel);
    }
    else {
        return ((handle->EXICR) & exi_sel);
    }
}

/**
  \brief       Software trigger EXI
  \param[in]   handle   syscon to be operate
  \param[in]   exi_sel  exi line to be triggered
  \return      None
*/
void dw_syscon_software_trigger_exi(syscon_handle_t handle, uint32_t exi_sel)
{
    handle->EXIAR = exi_sel;
}


/**
  \brief       Reset source information
  \param[in]   handle   syscon to be operate
  \return      reset_src_t 
*/
reset_src_t dw_syscon_get_reset_source_status(syscon_handle_t handle)
{
    return (reset_src_t)(handle->RSR);
}

/**
  \brief       Set interrupt enabled/disable control
  \param[in]   handle:   syscon to be operate
  \param[in]   int_sel:  interrupt to be en/dis
  \param[in]   status:   enable/disable
  \return      current masking status
*/
uint32_t dw_syscon_set_interrupt_switch(syscon_handle_t handle, uint32_t int_sel, bool status)
{
    if (status == APT_DEF_ENABLE) {
        handle->IECR = int_sel;
    }
    else {
        handle->IDCR = int_sel;
    }

    return handle->IMSR;
}

/**
  \brief       Clear pending bit
  \param[in]   handle:   syscon to be operate
  \param[in]   int_sel:  interrupt to be clear
  \return      None
*/
void dw_syscon_clear_interrupt_pending(syscon_handle_t handle, uint32_t int_sel)
{
    handle->ICR = int_sel;
}

/**
  \brief       Get interrupt pending bit
  \param[in]   handle:   syscon to be operate
  \param[in]   int_sel:  interrupt pending to be read
  \param[in]   status:   raw(T)/masked(F) pending bit select
  \return      corresponding bit of pending according to int_sel
*/
uint32_t dw_syscon_get_interrupt_status(syscon_handle_t handle, uint32_t int_sel, bool status)
{
    if (status == APT_DEF_ENABLE) {
        return ((handle->RISR) & int_sel);
    }
    else {
        return ((handle->ISR) & int_sel);
    }
}


/**
  \brief       Get CINF, FINF information
  \param[in]   handle   syscon to be operate
  \param[in]   info_sel information to be load
  \return      result stored in flash
*/
uint32_t dw_syscon_get_project_information(syscon_handle_t handle, prj_infor_t info_sel)
{
    switch(info_sel)
    {
        case CINF0:
            return handle->CINF0;
            break;
        case CINF1:
            return handle->CINF1;
            break;
        case FINF0:
            return handle->FINF0;
            break;
        case FINF1:
            return handle->FINF1;
            break;
    }
	
	return 0;
}

/**
  \brief       Get protection status
  \param[in]   handle   syscon to be operate
  \param[in]   info_sel information to be load
  \return      result of check
*/
uint32_t dw_syscon_get_protection_information(syscon_handle_t handle, prot_infor_t info_sel)
{
    switch(info_sel)
    {
        case RDP:
            if ((handle->OPT0) & (1ul<<27)) {
                return APT_DEF_ENABLE;
            }
            else {
                return APT_DEF_DISABLE;
            }
            break;
        case DBP:
            if ((handle->OPT0) & (1ul<<8)) {
                return APT_DEF_ENABLE;
            }
            else {
                return APT_DEF_DISABLE;
            }
            break;
        case HDP:
            if ((handle->OPT0) & (1ul<<16)) {
                return 1;
            }
            else if ((handle->OPT0) & (1ul<<17)) {
                return 2;
            }
            else if ((handle->OPT0) & (1ul<<18)) {
                return 3;
            }
            else if ((handle->OPT0) & (1ul<<19)) {
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
  \param[in]   handle: syscon to be operate
  \param[in]   status: enable/disable status
  \return      None
*/
void dw_syscon_set_hfosc_switch(syscon_handle_t handle, bool status)
{
    if (status == APT_DEF_ENABLE) {
        handle->CLCR |= (1ul<<20);
        while (!((handle->CLCR) & (1ul<<21)));

    }
    else {
        handle->CLCR &= ~(1ul<<20);

    }
}

/**
  \brief       Set CLO output
  \param[in]   handle: syscon to be operate
  \param[in]   clo_sel: clo source selection
  \return      None
*/
void dw_syscon_clo_config(syscon_handle_t handle, clo_src_t clo_sel)
{
    handle->CLCR = ((handle->CLCR) & ~(0xf<<16))|(clo_sel<<16);
}


