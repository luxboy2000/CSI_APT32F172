/*============================================================================
 * Name        : main.c
 * Author      : $(username)
 * Version     : 0.0.0
 * Copyright   : Your copyright notice
 * Description : Simple function in C, Ansi-style
 *============================================================================
 */

#include <apt_gpio.h>
#include <apt_syscon.h>

/**
 * @brief the main entry of the application; when run to here, the system has been initialized includes:
 * 1 CPU processor status register
 * 2 CPU vector base register
 * 3 CPU Units such as MGU, Cache...
 * 4 IO base address
 *
 * @return For MCU application, it's better to loop here
 */
int main()
{
    // TODO
	//gpio_port_handle_t gpioa1_handle;
	
	csi_gpio_initialize(PORTA1);
	
	volatile uint32_t i;
	for (i=0;i<10000;i++);
	csi_syscon_set_solo_pclk_switch(ENABLE, PCLK_GPIOB0);
	
	csi_syscon_set_all_pclk_switch(ENABLE);
	
	csi_gpio_pin_func_config(PA1_3,GPIO_MODE_AF3);
	csi_syscon_clo_config(CLO_AHBCLK);
	
	volatile uint32_t mem_data;
	uint32_t *ptr = 0x00000004;
	
	mem_data = *ptr;
	
	ptr = 0x8;
	mem_data = *ptr;
	
	ptr = 0xA;
	mem_data = *ptr;
		
	while(1);
    return 0;
}
