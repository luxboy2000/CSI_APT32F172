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
//* @file     dw_ifc.c
//* @brief    CSI Source File for internal flash controller Driver
//* @version  V1.0
//* @date     02. Sept 2019
//******************************************************************************

#include <csi_config.h>
#include "soc.h"
#include "apt_errno.h"
#include "apt_syscon.h"
#include "csi_core.h"
#include "lib.h"
#include "dw_ifc.h"

#define ERR_IFC(errno) (CSI_DRV_ERRNO_IFC_BASE | errno)
#define IFC_NULL_PARAM_CHK(para)                         \
		do {                                        \
			if (para == NULL) {                     \
				return ERR_IFC(DRV_ERROR_PARAMETER);   \
			}                                       \
		} while (0)

ifc_reg_ptr H_IFC  = (APT_IFC_Reg_t   *)APT_IFC_BASE;

// ifc interrupt callback routine pointer
ifc_event_cb_t ifc_event_cb;


//sysclk_cfg_t sysclk_cfg = {10000000, 2500000, IMOSC_20M};
sysclk_cfg_t sysclk_cfg = {
							SYSTEM_CLOCK_SRC,
							AHB_CLOCK_FREQ,
							APB_CLOCK_FREQ
							};


/// Update address and data register
void ifc_update_addr_dr_cfg (uint32_t addr, uint32_t data)
{
	H_IFC->PF_AR = addr;
	H_IFC->PF_DR = data;
}


////////////////////////////////// Public //////////////////////////////////////
/**
 * @brief       ISR call-back registration
 * @param[i]    cb     pointer to customer ISR when EXI is called 
 * @param[i]    idx    exi isr number to be initialized
 * @return      zero on success
*/
int32_t csi_ifc_cb_init (ifc_event_cb_t cb)
{
	SYSCON_NULL_PARAM_CHK(cb);
	ifc_event_cb = cb;

	return 0;
}

/**
  @brief       IAP Program flash function.

				Flash program unit is one word, so the buffer should be orgnized in
				32bit aligned.
 
  @param[in]   addr    Start address of flash to be write
  @param[in]   size    number of word to be programmed
  @param[in]   ptrBuf  pointer of buffer to transfer data
  @return      the last completed address
*/
void csi_ifc_pgm (uint32_t addr, uint32_t size, uint32_t *ptrBuf)
{
	if (size<1) {
		return ERR_IFC(DRV_ERROR_PARAMETER);
	}
	
	uint32_t addr_priv = addr;
	
	for (uint32_t i=0;i<size;i++)
	{
		ifc_update_addr_dr_cfg (addr_priv, ptrBuf[i]);
		ifc_set_protkey(H_IFC);
		H_IFC->CMR = CMD_PGM;
		ifc_start_cmd(H_IFC);
		while (H_IFC->CR != 0);	// wait for command complete
		addr_priv += 4;
		
	}

}

/**
  @brief       Read back flash content.

				Return the content by the supplied buffer pointer.
  
  @param[in]   addr    Start address of flash to be read
  @param[in]   size    number of word to be read
  @param[in]   ptrBuf  pointer of buffer to transfer data
  \return      error code
*/
int32_t csi_ifc_read(uint32_t addr, uint32_t size, uint32_t *ptrBuf)
{
	if (size<1) {
		return ERR_IFC(DRV_ERROR_PARAMETER);
	}

	uint32_t addr_priv = addr;
	
	for (uint32_t i=0;i<size;i++) {
		ptrBuf[i] = *addr_priv++;
	}
	
}


/**
  \brief       config system clock
  \param[in]   sysclk_setup: system clock option
  \param[in]   hclk_freq: value of target hclk frequence
  \param[in]   pclk_freq: value of target hclk frequence
  \return      error code
*/
int32_t csi_ifc_systemclock_config(ifc_sysclk_e sysclk_setup, uint32_t hclk_freq, uint32_t pclk_freq)
{
	volatile uint32_t i;
	uint32_t target_sysclk_freq = 0;
	uint32_t target_hclk_freq, hclk_div;
	uint32_t target_pclk_freq, pclk_div;

	// parameter check
	if (hclk_freq < pclk_freq) {
		return ERR_SYSCON(DRV_ERROR_PARAMETER);
	}

	switch (sysclk_setup) {
		case IMOSC_40M:
			if ( hclk_freq <= 40000000 ) {
				target_sysclk_freq = 40000000;
			} else {
				return ERR_SYSCON(DRV_ERROR_PARAMETER);
			}
			break;
		case IMOSC_20M:
			if ( hclk_freq <= 20000000 ) {
				target_sysclk_freq = 20000000;
			} else {
				return ERR_SYSCON(DRV_ERROR_PARAMETER);
			}
			break;
		case EMOSC_24M:
			if ( (hclk_freq <= EMOSC_FREQ) && (EMOSC_FREQ <= 24000000) ) {
				target_sysclk_freq = EMOSC_FREQ;
			} else {
				return ERR_SYSCON(DRV_ERROR_PARAMETER);
			}
			break;
		case ISOSC_3M:
			if ( (hclk_freq <= 3000000) ) {
				target_sysclk_freq = 3000000;
			} else {
				return ERR_SYSCON(DRV_ERROR_PARAMETER);
			}
			break;
	}
	target_hclk_freq = hclk_freq;

	hclk_div = target_sysclk_freq/target_hclk_freq;
	target_hclk_freq = target_sysclk_freq/hclk_div;
	pclk_div = hclk_freq/pclk_freq;
	target_pclk_freq = target_hclk_freq/pclk_div;

	// switch system clock as IMO40M
	if ((sysclk_cfg._cur_sysclk == IMOSC_20M) && (sysclk_setup == IMOSC_40M)) {
		H_SYSCON->GCER = 1; // enable ISOSC
		for (i=0;i<100;i++);
		H_SYSCON->SCLKCR = (4 | SCLKCR_KEY); // switch to ISOSC as sysclk
		for (i=0;i<10;i++);
		if ((H_SYSCON->ERRINF) & (1ul<<4)) {
			return ERR_SYSCON(DRV_ERROR_SPECIFIC2);
		}
		H_SYSCON->GCDR = 2; // disable IMOSC
		H_SYSCON->CLCR |= (1ul<<22);
		H_SYSCON->GCER = 2; // enable IMOSC
		for (i=0;i<100;i++);
		H_SYSCON->SCLKCR = ((hclk_div<<8)|SCLKCR_KEY);
		for (i=0;i<10;i++);
		if ((H_SYSCON->ERRINF) & (1ul<<4)) {
			return ERR_SYSCON(DRV_ERROR_SPECIFIC3);
		}
	}
	// switch system clock as IMO20M
	else if ((sysclk_cfg._cur_sysclk == IMOSC_40M) && (sysclk_setup == IMOSC_20M)) {
		H_SYSCON->GCER = 1; // enable ISOSC
		for (i=0;i<100;i++);
		H_SYSCON->SCLKCR = (4 | SCLKCR_KEY); // switch to ISOSC as sysclk
		for (i=0;i<10;i++);
		if ((H_SYSCON->ERRINF) & (1ul<<4)) {
			return ERR_SYSCON(DRV_ERROR_SPECIFIC4);
		}
		H_SYSCON->GCDR = 2; // disable IMOSC
		H_SYSCON->CLCR &= ~(1ul<<22);
		H_SYSCON->GCER = 2; // enable IMOSC
		for (i=0;i<100;i++);
		H_SYSCON->SCLKCR = ((hclk_div<<8)|SCLKCR_KEY);
		for (i=0;i<10;i++);
		if ((H_SYSCON->ERRINF) & (1ul<<4)) {
			return ERR_SYSCON(DRV_ERROR_SPECIFIC5);
		}
	// switch system clock as EMO
	} else if ((sysclk_cfg._cur_sysclk != EMOSC_24M) && (sysclk_setup == EMOSC_24M)) {
		H_SYSCON->SCLKCR = (1 | (hclk_div<<8) | SCLKCR_KEY); // switch to EMOSC as sysclk
		for (i=0;i<10;i++);
		if ((H_SYSCON->ERRINF) & (1ul<<4)) {
			return ERR_SYSCON(DRV_ERROR_SPECIFIC6);
		}
	// switch system clock as ISO3M
	} else if ((sysclk_cfg._cur_sysclk != ISOSC_3M) && (sysclk_setup == ISOSC_3M)) {
		H_SYSCON->SCLKCR = (4 | (hclk_div<<8) | SCLKCR_KEY); // switch to ISOSC as sysclk
		for (i=0;i<10;i++);
		if ((H_SYSCON->ERRINF) & (1ul<<4)) {
			return ERR_SYSCON(DRV_ERROR_SPECIFIC7);
		}
	} else { // only change div option
		H_SYSCON->SCLKCR = ((H_SYSCON->SCLKCR)&0xff) |  (hclk_div<<8) | SCLKCR_KEY;
	}

	/* Setup PCLK divider */
	H_SYSCON->PCLKCR = ((pclk_div<<8)|PCLKCR_KEY);

	/* Store config to global variables */
	sysclk_cfg._cur_sysclk = sysclk_setup; 
	sysclk_cfg._cur_hclk_freq = target_hclk_freq;
	sysclk_cfg._cur_pclk_freq = target_pclk_freq;

	return 0;
}

/**
  \brief       Enable/disable pclk of individual peripheral
  \param[in]   status   en/dis operation
  \param[in]   pclk0_sel individual pclk target on PCLK0
						 defined as: PCLK_ADC/PCLK_UART0 ...
  \param[in]   pclk1_sel individual pclk target on PCLK1
  \return      negtive when assignment is not in right pclk domain
*/
int32_t csi_ifc_set_solo_pclk_switch(ifc_endis_e status, uint64_t pclk_sel)
{
	pclk_conr_type pclk_setup;
	pclk_setup.PCLKCR = pclk_sel;
	
	switch (status) {
		case ENABLE:  /*enable*/
			H_SYSCON->PCER0 = pclk_setup.w.PCLKCR0;
			H_SYSCON->PCER1 = pclk_setup.w.PCLKCR1;
			break;    
		default: /*disable*/
			H_SYSCON->PCDR0 = pclk_setup.w.PCLKCR0;
			H_SYSCON->PCDR1 = pclk_setup.w.PCLKCR1;
			break;
	}
	return 0;
}

/**
  \brief       Enable/disable pclk of all peripherals
  \param[in]   status   en/dis operation (enable is default)
  \return      negtive when assignment is not in right pclk domain
*/
void csi_ifc_set_all_pclk_switch(ifc_endis_e status)
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
int32_t csi_syscon_clockmonitor_set_switch(syscon_endis_e status, syscon_ckmrst_e rst_on_fail)
{
	if (!((H_SYSCON->GCSR) & 1ul)) {
		return ERR_SYSCON(DRV_ERROR_UNSUPPORTED);
	}

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
		return ERR_SYSCON(DRV_ERROR_SPECIFIC6);
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
	if (status == ENABLE) {
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
void csi_syscon_iwdt_set_switch(syscon_endis_e status)
{
	if (status == ENABLE) {
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
	H_SYSCON->IWDCR = (iwdt_ovt << 8) | (iwdt_wnd << 2) | IWDT_KEY;
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
void csi_syscon_lvd_set_switch(syscon_endis_e status)
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
  \return      LVD current level
*/
bool csi_syscon_lvd_get_status(void)
{
	bool lvd_flag;
	if ((H_SYSCON->LVDCR) & (1ul<<15)) {
		lvd_flag = true;    // vdd < vth
	}
	else {
		lvd_flag = false;   // vdd > vth
	}
	
	return lvd_flag;
}

/**
  \brief       EXI trigger level rising edge config
  \param[in]   exi_sel:  exi event to be set
  \param[in]   status:   enable/disable control(APT_DEF_ENABLE is default)
  \return      current setup of falling edge config
*/
uint32_t csi_syscon_exi_set_rising(exi_event_e exi_sel, syscon_endis_e status)
{
	if (status == ENABLE) { /* select as rising edge*/
		H_SYSCON->EXIRT |= 1ul<<exi_sel;
	}
	else
	{
		H_SYSCON->EXIRT &= ~(1ul<<exi_sel);
	}

	return H_SYSCON->EXIRT;
}

/**
  \brief       EXI trigger level rising edge config
  \param[in]   exi_sel:  exi event to be set
  \param[in]   status:   enable/disable control(APT_DEF_ENABLE is default)
  \return      current setup of falling edge config
*/
uint32_t csi_syscon_exi_set_falling(exi_event_e exi_sel, syscon_endis_e status)
{
	if (status == ENABLE) { /* select as falling edge*/
		H_SYSCON->EXIFT |= 1ul<<exi_sel;
	}
	else
	{
		H_SYSCON->EXIFT &= ~(1ul<<exi_sel);
	}

	return H_SYSCON->EXIFT;
}

/**
  \brief       EXI enabled/disable control
  \param[in]   exi_sel:  exi event to be set
  \param[in]   status:   enable/disable control(APT_DEF_ENABLE is default)
  \return      current masking status
*/
uint32_t csi_syscon_exi_set_switch(exi_event_e exi_sel, syscon_endis_e status)
{
	if (status == ENABLE) {
		H_SYSCON->EXIER = 1ul<<exi_sel;
	}
	else {
		H_SYSCON->EXIDR = 1ul<<exi_sel;
	}

	return H_SYSCON->EXIMR;
}

/**
  \brief       Clear EXI pending 
  \param[in]   exi_sel: exi event to be clear
  \return      None
*/
void csi_syscon_clear_exi_pending(exi_event_e exi_sel)
{
	H_SYSCON->EXICR = 1ul<<exi_sel;
}

/**
  \brief       Get interrupt pending bit
  \param[in]   exi_sel:  exi pending to be read
  \param[in]   status:   raw(T)/masked(F) pending bit select(APT_DEF_DISABLE is default)
  \return      corresponding bit of pending according to int_sel
*/
uint32_t csi_syscon_exi_get_status(exi_event_e exi_sel, syscon_endis_e status)
{
	if (status == ENABLE) {
		return ((H_SYSCON->EXIRS) & (1ul<<exi_sel));
	}
	else {
		return ((H_SYSCON->EXICR) & (1ul<<exi_sel));
	}
}

/**
  \brief       Software trigger EXI
  \param[in]   exi_sel  exi line to be triggered
  \return      None
*/
void csi_syscon_software_trigger_exi(exi_event_e exi_sel)
{
	H_SYSCON->EXIAR = 1ul<<exi_sel;
}


/**
  \brief       Reset source information
  \return      reset_src_t 
*/
reset_log_t csi_syscon_reset_log_get_status(void)
{
	reset_log_t rstlog;
	rstlog.w = (H_SYSCON->RSR);
	return rstlog;
}

/**
  \brief       Set interrupt enabled/disable control
  \param[in]   int_sel:  interrupt to be en/dis
  \param[in]   status:   enable/disable
  \return      current masking status
*/
uint32_t csi_syscon_interrupt_set_switch(syscon_event_e int_sel, syscon_endis_e status)
{
	if (status == ENABLE) {
		H_SYSCON->IECR = 1ul<<int_sel;
	}
	else {
		H_SYSCON->IDCR = 1ul<<int_sel;
	}

	return H_SYSCON->IMSR;
}

/**
  \brief       Clear pending bit
  \param[in]   int_sel:  interrupt to be clear
  \return      None
*/
void csi_syscon_interrupt_clear_pending(syscon_event_e int_sel)
{
	H_SYSCON->ICR = 1ul<<int_sel;
}

/**
  \brief       Get interrupt pending bit
  \param[in]   int_sel:  interrupt pending to be read
  \param[in]   status:   raw(T)/masked(F) pending bit select
  \return      corresponding bit of pending according to int_sel
*/
uint32_t csi_syscon_interrupt_get_status(syscon_event_e int_sel, syscon_endis_e status)
{
	if (status == ENABLE) {
		return ((H_SYSCON->RISR) & (1ul<<int_sel));
	}
	else {
		return ((H_SYSCON->ISR) & (1ul<<int_sel));
	}
}


/**
  \brief       Get CINF, FINF information
  \param[in]   info_sel information to be load
  \return      result stored in flash
*/
uint32_t csi_syscon_get_prj_infor(prj_infor_e info_sel)
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
prot_ret_e csi_syscon_get_prot_infor(prot_infor_e info_sel)
{
	prot_ret_e result;
	switch(info_sel)
	{
		case RDP:
			if ((H_SYSCON->OPT0) & (1ul<<27)) {
				result = RDP_ON;
			}
			else {
				result = RDP_OFF;
			}
			break;
		case DBP:
			if ((H_SYSCON->OPT0) & (1ul<<8)) {
				result = DBP_ON;
			}
			else {
				result = DBP_OFF;
			}
			break;
		case HDP:
			if ((H_SYSCON->OPT0) & (1ul<<16)) {
				result = HDP_ALL;
			}
			else if ((H_SYSCON->OPT0) & (1ul<<17)) {
				result = HDP_1K;
			}
			else if ((H_SYSCON->OPT0) & (1ul<<18)) {
				result = HDP_2K;
			}
			else if ((H_SYSCON->OPT0) & (1ul<<19)) {
				result = HDP_4K;
			}
			else {
				result = HDP_OFF;
			}
			break;
	}
	
	return result;
}

/**
  \brief       Set hfosc (96MHz) enable/disable
  \param[in]   status: enable/disable status
  \return      None
*/
void csi_syscon_hfosc_set_switch(syscon_endis_e status)
{
	if (status == ENABLE) {
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
void csi_syscon_clo_config(clo_src_e clo_sel)
{
	H_SYSCON->CLCR = ((H_SYSCON->CLCR) & ~(0xf<<16))|(clo_sel<<16);
}


