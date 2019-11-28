
Obj/drv_minilibc_port.o:     file format elf32-csky-little


Disassembly of section .text:

00000000 <fputc>:
#endif

//usart_handle_t console_handle = NULL;

int fputc(int ch, FILE *stream)
{
   0:	1421      	subi      	r14, r14, 4
   2:	dd0e2000 	st.w      	r8, (r14, 0x0)
   6:	6e3b      	mov      	r8, r14
   8:	1422      	subi      	r14, r14, 8
   a:	3300      	movi      	r3, 0
   c:	2b03      	subi      	r3, 4
   e:	60e0      	addu      	r3, r8
  10:	b300      	st.w      	r0, (r3, 0x0)
  12:	3300      	movi      	r3, 0
  14:	2b07      	subi      	r3, 8
  16:	60e0      	addu      	r3, r8
  18:	b320      	st.w      	r1, (r3, 0x0)
//        csi_usart_putchar(console_handle, '\r');
//    }
//
//    csi_usart_putchar(console_handle, ch);

    return 0;
  1a:	3300      	movi      	r3, 0
}
  1c:	6c0f      	mov      	r0, r3
  1e:	6fa3      	mov      	r14, r8
  20:	d90e2000 	ld.w      	r8, (r14, 0x0)
  24:	1401      	addi      	r14, r14, 4
  26:	783c      	jmp      	r15

00000028 <fgetc>:

int fgetc(FILE *stream)
{
  28:	1421      	subi      	r14, r14, 4
  2a:	dd0e2000 	st.w      	r8, (r14, 0x0)
  2e:	6e3b      	mov      	r8, r14
  30:	1421      	subi      	r14, r14, 4
  32:	3300      	movi      	r3, 0
  34:	2b03      	subi      	r3, 4
  36:	60e0      	addu      	r3, r8
  38:	b300      	st.w      	r0, (r3, 0x0)
//    }
//
//    csi_usart_getchar(console_handle, &ch);

 //   return ch;
	return 0;
  3a:	3300      	movi      	r3, 0
}
  3c:	6c0f      	mov      	r0, r3
  3e:	6fa3      	mov      	r14, r8
  40:	d90e2000 	ld.w      	r8, (r14, 0x0)
  44:	1401      	addi      	r14, r14, 4
  46:	783c      	jmp      	r15

00000048 <os_critical_enter>:

int os_critical_enter(unsigned int *lock)
{
  48:	1421      	subi      	r14, r14, 4
  4a:	dd0e2000 	st.w      	r8, (r14, 0x0)
  4e:	6e3b      	mov      	r8, r14
  50:	1421      	subi      	r14, r14, 4
  52:	3300      	movi      	r3, 0
  54:	2b03      	subi      	r3, 4
  56:	60e0      	addu      	r3, r8
  58:	b300      	st.w      	r0, (r3, 0x0)
#ifndef CONFIG_KERNEL_NONE
    csi_kernel_sched_suspend();
#endif

    return 0;
  5a:	3300      	movi      	r3, 0
}
  5c:	6c0f      	mov      	r0, r3
  5e:	6fa3      	mov      	r14, r8
  60:	d90e2000 	ld.w      	r8, (r14, 0x0)
  64:	1401      	addi      	r14, r14, 4
  66:	783c      	jmp      	r15

00000068 <os_critical_exit>:

int os_critical_exit(unsigned int *lock)
{
  68:	1421      	subi      	r14, r14, 4
  6a:	dd0e2000 	st.w      	r8, (r14, 0x0)
  6e:	6e3b      	mov      	r8, r14
  70:	1421      	subi      	r14, r14, 4
  72:	3300      	movi      	r3, 0
  74:	2b03      	subi      	r3, 4
  76:	60e0      	addu      	r3, r8
  78:	b300      	st.w      	r0, (r3, 0x0)
#ifndef CONFIG_KERNEL_NONE
    csi_kernel_sched_resume(0);
#endif

    return 0;
  7a:	3300      	movi      	r3, 0
}
  7c:	6c0f      	mov      	r0, r3
  7e:	6fa3      	mov      	r14, r8
  80:	d90e2000 	ld.w      	r8, (r14, 0x0)
  84:	1401      	addi      	r14, r14, 4
  86:	783c      	jmp      	r15
