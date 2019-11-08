
Obj/main.o:     file format elf32-csky-little


Disassembly of section .text:

00000000 <main>:
 * 4 IO base address
 *
 * @return For MCU application, it's better to loop here
 */
int main()
{
   0:	1421      	subi      	sp, sp, 4
   2:	dd0e2000 	st.w      	r8, (sp, 0)
   6:	6e3b      	mov      	r8, sp
    // TODO
	while(1);
   8:	0400      	br      	0x8	// 8 <main+0x8>
