
Obj/drv_dw_ifc.o:     file format elf32-csky-little


Disassembly of section .text:

00000000 <ifc_update_addr_dr_cfg>:
// ifc interrupt callback routine pointer
ifc_event_cb_t ifc_event_cb;

/// Update address and data register
void ifc_update_addr_dr_cfg (uint32_t addr, uint32_t data)
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
	H_IFC->PF_AR = addr;
  1a:	106b      	lrw      	r3, 0x0	// 44 <ifc_update_addr_dr_cfg+0x44>
  1c:	9360      	ld.w      	r3, (r3, 0x0)
  1e:	3200      	movi      	r2, 0
  20:	2a03      	subi      	r2, 4
  22:	60a0      	addu      	r2, r8
  24:	9240      	ld.w      	r2, (r2, 0x0)
  26:	b346      	st.w      	r2, (r3, 0x18)
	H_IFC->PF_DR = data;
  28:	1067      	lrw      	r3, 0x0	// 44 <ifc_update_addr_dr_cfg+0x44>
  2a:	9360      	ld.w      	r3, (r3, 0x0)
  2c:	3200      	movi      	r2, 0
  2e:	2a07      	subi      	r2, 8
  30:	60a0      	addu      	r2, r8
  32:	9240      	ld.w      	r2, (r2, 0x0)
  34:	b347      	st.w      	r2, (r3, 0x1c)
}
  36:	6c00      	or      	r0, r0
  38:	6fa3      	mov      	r14, r8
  3a:	d90e2000 	ld.w      	r8, (r14, 0x0)
  3e:	1401      	addi      	r14, r14, 4
  40:	783c      	jmp      	r15
  42:	0000      	bkpt
  44:	00000000 	.long	0x00000000

00000048 <csi_ifc_cb_init>:
 * @param[i]    cb     pointer to customer ISR when EXI is called 
 * @param[i]    idx    exi isr number to be initialized
 * @return      zero on success
*/
int32_t csi_ifc_cb_init (ifc_event_cb_t cb)
{
  48:	1421      	subi      	r14, r14, 4
  4a:	dd0e2000 	st.w      	r8, (r14, 0x0)
  4e:	6e3b      	mov      	r8, r14
  50:	1422      	subi      	r14, r14, 8
  52:	3300      	movi      	r3, 0
  54:	2b07      	subi      	r3, 8
  56:	60e0      	addu      	r3, r8
  58:	b300      	st.w      	r0, (r3, 0x0)
	IFC_NULL_PARAM_CHK(cb);
  5a:	3300      	movi      	r3, 0
  5c:	2b07      	subi      	r3, 8
  5e:	60e0      	addu      	r3, r8
  60:	9360      	ld.w      	r3, (r3, 0x0)
  62:	3b40      	cmpnei      	r3, 0
  64:	0804      	bt      	0x6c	// 6c <csi_ifc_cb_init+0x24>
  66:	ea830103 	lrw      	r3, 0x81180084	// 470 <csi_ifc_byte_read+0x40>
  6a:	0419      	br      	0x9c	// 9c <csi_ifc_cb_init+0x54>
	ifc_event_cb = cb;
  6c:	ea830102 	lrw      	r3, 0x0	// 474 <csi_ifc_byte_read+0x44>
  70:	3200      	movi      	r2, 0
  72:	2a07      	subi      	r2, 8
  74:	60a0      	addu      	r2, r8
  76:	9240      	ld.w      	r2, (r2, 0x0)
  78:	b340      	st.w      	r2, (r3, 0x0)
  7a:	3300      	movi      	r3, 0
  7c:	2b03      	subi      	r3, 4
  7e:	60e0      	addu      	r3, r8
  80:	3202      	movi      	r2, 2
  82:	b340      	st.w      	r2, (r3, 0x0)
  \details Enable a device-specific interrupt in the VIC interrupt controller.
  \param [in]      IRQn  External interrupt number. Value cannot be negative.
 */
__ALWAYS_INLINE void csi_vic_enable_irq(int32_t IRQn)
{
    VIC->ISER[0U] = (uint32_t)(1UL << (((uint32_t)(int32_t)IRQn) & 0x1FUL));
  84:	0062      	lrw      	r3, 0xe000e100	// 478 <csi_ifc_byte_read+0x48>
  86:	3200      	movi      	r2, 0
  88:	2a03      	subi      	r2, 4
  8a:	60a0      	addu      	r2, r8
  8c:	9220      	ld.w      	r1, (r2, 0x0)
  8e:	321f      	movi      	r2, 31
  90:	6884      	and      	r2, r1
  92:	3101      	movi      	r1, 1
  94:	7048      	lsl      	r1, r2
  96:	6c87      	mov      	r2, r1
  98:	b340      	st.w      	r2, (r3, 0x0)

	csi_vic_enable_irq(IFC_IRQn);

	return 0;
  9a:	3300      	movi      	r3, 0
}
  9c:	6c0f      	mov      	r0, r3
  9e:	6fa3      	mov      	r14, r8
  a0:	d90e2000 	ld.w      	r8, (r14, 0x0)
  a4:	1401      	addi      	r14, r14, 4
  a6:	783c      	jmp      	r15

000000a8 <csi_ifc_program>:
  @param[in]   size    number of words to be programmed
  @param[in]   ptrBuf  pointer of buffer to transfer data
  @return      the last completed address
*/
uint32_t csi_ifc_program (uint32_t addr, uint32_t size, uint32_t *ptrBuf)
{
  a8:	1422      	subi      	r14, r14, 8
  aa:	dd0e2000 	st.w      	r8, (r14, 0x0)
  ae:	ddee2001 	st.w      	r15, (r14, 0x4)
  b2:	6e3b      	mov      	r8, r14
  b4:	1426      	subi      	r14, r14, 24
  b6:	3300      	movi      	r3, 0
  b8:	2b0f      	subi      	r3, 16
  ba:	60e0      	addu      	r3, r8
  bc:	b300      	st.w      	r0, (r3, 0x0)
  be:	3300      	movi      	r3, 0
  c0:	2b13      	subi      	r3, 20
  c2:	60e0      	addu      	r3, r8
  c4:	b320      	st.w      	r1, (r3, 0x0)
  c6:	3300      	movi      	r3, 0
  c8:	2b17      	subi      	r3, 24
  ca:	60e0      	addu      	r3, r8
  cc:	b340      	st.w      	r2, (r3, 0x0)
	if (size<1) {
  ce:	3300      	movi      	r3, 0
  d0:	2b13      	subi      	r3, 20
  d2:	60e0      	addu      	r3, r8
  d4:	9360      	ld.w      	r3, (r3, 0x0)
  d6:	3b40      	cmpnei      	r3, 0
  d8:	0803      	bt      	0xde	// de <csi_ifc_program+0x36>
		return ERR_IFC(DRV_ERROR_PARAMETER);
  da:	0079      	lrw      	r3, 0x81180084	// 470 <csi_ifc_byte_read+0x40>
  dc:	047b      	br      	0x1d2	// 1d2 <csi_ifc_program+0x12a>
	}
	
	uint32_t addr_priv = addr & 0xfffffffc;
  de:	3300      	movi      	r3, 0
  e0:	2b03      	subi      	r3, 4
  e2:	60e0      	addu      	r3, r8
  e4:	3200      	movi      	r2, 0
  e6:	2a0f      	subi      	r2, 16
  e8:	60a0      	addu      	r2, r8
  ea:	9240      	ld.w      	r2, (r2, 0x0)
  ec:	3a80      	bclri      	r2, 0
  ee:	3a81      	bclri      	r2, 1
  f0:	b340      	st.w      	r2, (r3, 0x0)
	uint32_t read_back;	// read back buffer to check pgm result
	
	ifc_clk_enable(H_IFC);
  f2:	007c      	lrw      	r3, 0x0	// 47c <csi_ifc_byte_read+0x4c>
  f4:	9360      	ld.w      	r3, (r3, 0x0)
  f6:	3201      	movi      	r2, 1
  f8:	b341      	st.w      	r2, (r3, 0x4)
	for (uint32_t i=0;i<size;i++)
  fa:	3300      	movi      	r3, 0
  fc:	2b07      	subi      	r3, 8
  fe:	60e0      	addu      	r3, r8
 100:	3200      	movi      	r2, 0
 102:	b340      	st.w      	r2, (r3, 0x0)
 104:	0454      	br      	0x1ac	// 1ac <csi_ifc_program+0x104>
	{
		ifc_update_addr_dr_cfg (addr_priv, ptrBuf[i]);
 106:	3300      	movi      	r3, 0
 108:	2b07      	subi      	r3, 8
 10a:	60e0      	addu      	r3, r8
 10c:	9360      	ld.w      	r3, (r3, 0x0)
 10e:	4362      	lsli      	r3, r3, 2
 110:	3200      	movi      	r2, 0
 112:	2a17      	subi      	r2, 24
 114:	60a0      	addu      	r2, r8
 116:	9240      	ld.w      	r2, (r2, 0x0)
 118:	60c8      	addu      	r3, r2
 11a:	9340      	ld.w      	r2, (r3, 0x0)
 11c:	3300      	movi      	r3, 0
 11e:	2b03      	subi      	r3, 4
 120:	60e0      	addu      	r3, r8
 122:	6c4b      	mov      	r1, r2
 124:	9300      	ld.w      	r0, (r3, 0x0)
 126:	e0000000 	bsr      	0x0	// 0 <ifc_update_addr_dr_cfg>
		ifc_set_protkey(H_IFC);
 12a:	016a      	lrw      	r3, 0x0	// 47c <csi_ifc_byte_read+0x4c>
 12c:	9360      	ld.w      	r3, (r3, 0x0)
 12e:	014a      	lrw      	r2, 0x5a5a5a5a	// 480 <csi_ifc_byte_read+0x50>
 130:	b348      	st.w      	r2, (r3, 0x20)
		H_IFC->CMR = CMD_PGM;
 132:	016c      	lrw      	r3, 0x0	// 47c <csi_ifc_byte_read+0x4c>
 134:	9360      	ld.w      	r3, (r3, 0x0)
 136:	3201      	movi      	r2, 1
 138:	b343      	st.w      	r2, (r3, 0xc)
		ifc_start_cmd(H_IFC);
 13a:	016e      	lrw      	r3, 0x0	// 47c <csi_ifc_byte_read+0x4c>
 13c:	9360      	ld.w      	r3, (r3, 0x0)
 13e:	3201      	movi      	r2, 1
 140:	b344      	st.w      	r2, (r3, 0x10)
		while (H_IFC->CR != 0);	// wait for command complete
 142:	6c00      	or      	r0, r0
 144:	0171      	lrw      	r3, 0x0	// 47c <csi_ifc_byte_read+0x4c>
 146:	9360      	ld.w      	r3, (r3, 0x0)
 148:	9364      	ld.w      	r3, (r3, 0x10)
 14a:	3b40      	cmpnei      	r3, 0
 14c:	0bfc      	bt      	0x144	// 144 <csi_ifc_program+0x9c>
		csi_ifc_read (addr_priv,1,&read_back);	//verify the pgm
 14e:	3200      	movi      	r2, 0
 150:	2a0b      	subi      	r2, 12
 152:	60a0      	addu      	r2, r8
 154:	3300      	movi      	r3, 0
 156:	2b03      	subi      	r3, 4
 158:	60e0      	addu      	r3, r8
 15a:	3101      	movi      	r1, 1
 15c:	9300      	ld.w      	r0, (r3, 0x0)
 15e:	e0000000 	bsr      	0x0	// 36c <csi_ifc_read>
		if (ptrBuf[i] != read_back) {
 162:	3300      	movi      	r3, 0
 164:	2b07      	subi      	r3, 8
 166:	60e0      	addu      	r3, r8
 168:	9360      	ld.w      	r3, (r3, 0x0)
 16a:	4362      	lsli      	r3, r3, 2
 16c:	3200      	movi      	r2, 0
 16e:	2a17      	subi      	r2, 24
 170:	60a0      	addu      	r2, r8
 172:	9240      	ld.w      	r2, (r2, 0x0)
 174:	60c8      	addu      	r3, r2
 176:	9340      	ld.w      	r2, (r3, 0x0)
 178:	3300      	movi      	r3, 0
 17a:	2b0b      	subi      	r3, 12
 17c:	60e0      	addu      	r3, r8
 17e:	9360      	ld.w      	r3, (r3, 0x0)
 180:	64ca      	cmpne      	r2, r3
 182:	0c03      	bf      	0x188	// 188 <csi_ifc_program+0xe0>
			return ERR_IFC(DRV_ERROR_SPECIFIC0);
 184:	017f      	lrw      	r3, 0x81180085	// 484 <csi_ifc_byte_read+0x54>
 186:	0426      	br      	0x1d2	// 1d2 <csi_ifc_program+0x12a>
		}
		addr_priv += 4;
 188:	3300      	movi      	r3, 0
 18a:	2b03      	subi      	r3, 4
 18c:	60e0      	addu      	r3, r8
 18e:	3200      	movi      	r2, 0
 190:	2a03      	subi      	r2, 4
 192:	60a0      	addu      	r2, r8
 194:	9240      	ld.w      	r2, (r2, 0x0)
 196:	2203      	addi      	r2, 4
 198:	b340      	st.w      	r2, (r3, 0x0)
	for (uint32_t i=0;i<size;i++)
 19a:	3300      	movi      	r3, 0
 19c:	2b07      	subi      	r3, 8
 19e:	60e0      	addu      	r3, r8
 1a0:	3200      	movi      	r2, 0
 1a2:	2a07      	subi      	r2, 8
 1a4:	60a0      	addu      	r2, r8
 1a6:	9240      	ld.w      	r2, (r2, 0x0)
 1a8:	2200      	addi      	r2, 1
 1aa:	b340      	st.w      	r2, (r3, 0x0)
 1ac:	3200      	movi      	r2, 0
 1ae:	2a07      	subi      	r2, 8
 1b0:	60a0      	addu      	r2, r8
 1b2:	3300      	movi      	r3, 0
 1b4:	2b13      	subi      	r3, 20
 1b6:	60e0      	addu      	r3, r8
 1b8:	9240      	ld.w      	r2, (r2, 0x0)
 1ba:	9360      	ld.w      	r3, (r3, 0x0)
 1bc:	64c8      	cmphs      	r2, r3
 1be:	0fa4      	bf      	0x106	// 106 <csi_ifc_program+0x5e>
	}
	ifc_clk_disable(H_IFC);
 1c0:	0270      	lrw      	r3, 0x0	// 47c <csi_ifc_byte_read+0x4c>
 1c2:	9360      	ld.w      	r3, (r3, 0x0)
 1c4:	3200      	movi      	r2, 0
 1c6:	b341      	st.w      	r2, (r3, 0x4)
	return addr_priv-4;
 1c8:	3300      	movi      	r3, 0
 1ca:	2b03      	subi      	r3, 4
 1cc:	60e0      	addu      	r3, r8
 1ce:	9360      	ld.w      	r3, (r3, 0x0)
 1d0:	2b03      	subi      	r3, 4
}
 1d2:	6c0f      	mov      	r0, r3
 1d4:	6fa3      	mov      	r14, r8
 1d6:	d9ee2001 	ld.w      	r15, (r14, 0x4)
 1da:	d90e2000 	ld.w      	r8, (r14, 0x0)
 1de:	1402      	addi      	r14, r14, 8
 1e0:	783c      	jmp      	r15
	...

000001e4 <csi_ifc_byte_program>:
  @param[in]   size    number of bytes to be programmed
  @param[in]   ptrBuf  pointer of buffer to transfer data
  @return      the last completed address
*/
uint32_t csi_ifc_byte_program (uint32_t addr, uint32_t size, uint8_t *ptrBuf)
{
 1e4:	1422      	subi      	r14, r14, 8
 1e6:	dd0e2000 	st.w      	r8, (r14, 0x0)
 1ea:	ddee2001 	st.w      	r15, (r14, 0x4)
 1ee:	6e3b      	mov      	r8, r14
 1f0:	1428      	subi      	r14, r14, 32
 1f2:	3300      	movi      	r3, 0
 1f4:	2b17      	subi      	r3, 24
 1f6:	60e0      	addu      	r3, r8
 1f8:	b300      	st.w      	r0, (r3, 0x0)
 1fa:	3300      	movi      	r3, 0
 1fc:	2b1b      	subi      	r3, 28
 1fe:	60e0      	addu      	r3, r8
 200:	b320      	st.w      	r1, (r3, 0x0)
 202:	3300      	movi      	r3, 0
 204:	2b1f      	subi      	r3, 32
 206:	60e0      	addu      	r3, r8
 208:	b340      	st.w      	r2, (r3, 0x0)
	if (size<1) {
 20a:	3300      	movi      	r3, 0
 20c:	2b1b      	subi      	r3, 28
 20e:	60e0      	addu      	r3, r8
 210:	9360      	ld.w      	r3, (r3, 0x0)
 212:	3b40      	cmpnei      	r3, 0
 214:	0803      	bt      	0x21a	// 21a <csi_ifc_byte_program+0x36>
		return ERR_IFC(DRV_ERROR_PARAMETER);
 216:	0368      	lrw      	r3, 0x81180084	// 470 <csi_ifc_byte_read+0x40>
 218:	04a1      	br      	0x35a	// 35a <csi_ifc_byte_program+0x176>
	uint32_t addr_priv;
	uint32_t addr_offset;
	uint32_t data_priv;
	uint8_t read_back;
	
	ifc_clk_enable(H_IFC);
 21a:	0366      	lrw      	r3, 0x0	// 47c <csi_ifc_byte_read+0x4c>
 21c:	9360      	ld.w      	r3, (r3, 0x0)
 21e:	3201      	movi      	r2, 1
 220:	b341      	st.w      	r2, (r3, 0x4)
	for (uint32_t i=0;i<size;i++)
 222:	3300      	movi      	r3, 0
 224:	2b03      	subi      	r3, 4
 226:	60e0      	addu      	r3, r8
 228:	3200      	movi      	r2, 0
 22a:	b340      	st.w      	r2, (r3, 0x0)
 22c:	0484      	br      	0x334	// 334 <csi_ifc_byte_program+0x150>
	{
		addr_priv = addr & 0xfffffffcul;
 22e:	3300      	movi      	r3, 0
 230:	2b07      	subi      	r3, 8
 232:	60e0      	addu      	r3, r8
 234:	3200      	movi      	r2, 0
 236:	2a17      	subi      	r2, 24
 238:	60a0      	addu      	r2, r8
 23a:	9240      	ld.w      	r2, (r2, 0x0)
 23c:	3a80      	bclri      	r2, 0
 23e:	3a81      	bclri      	r2, 1
 240:	b340      	st.w      	r2, (r3, 0x0)
		addr_offset = addr & 0x3ul;
 242:	3300      	movi      	r3, 0
 244:	2b0b      	subi      	r3, 12
 246:	60e0      	addu      	r3, r8
 248:	3200      	movi      	r2, 0
 24a:	2a17      	subi      	r2, 24
 24c:	60a0      	addu      	r2, r8
 24e:	9220      	ld.w      	r1, (r2, 0x0)
 250:	3203      	movi      	r2, 3
 252:	6884      	and      	r2, r1
 254:	b340      	st.w      	r2, (r3, 0x0)
		data_priv = 0xfffffffful;
 256:	3200      	movi      	r2, 0
 258:	2a0f      	subi      	r2, 16
 25a:	60a0      	addu      	r2, r8
 25c:	3300      	movi      	r3, 0
 25e:	2b00      	subi      	r3, 1
 260:	b260      	st.w      	r3, (r2, 0x0)
		data_priv &= (ptrBuf[i] << (addr_offset*4));
 262:	3200      	movi      	r2, 0
 264:	2a1f      	subi      	r2, 32
 266:	60a0      	addu      	r2, r8
 268:	3300      	movi      	r3, 0
 26a:	2b03      	subi      	r3, 4
 26c:	60e0      	addu      	r3, r8
 26e:	9240      	ld.w      	r2, (r2, 0x0)
 270:	9360      	ld.w      	r3, (r3, 0x0)
 272:	60c8      	addu      	r3, r2
 274:	8360      	ld.b      	r3, (r3, 0x0)
 276:	74cc      	zextb      	r3, r3
 278:	6c8f      	mov      	r2, r3
 27a:	3300      	movi      	r3, 0
 27c:	2b0b      	subi      	r3, 12
 27e:	60e0      	addu      	r3, r8
 280:	9360      	ld.w      	r3, (r3, 0x0)
 282:	4362      	lsli      	r3, r3, 2
 284:	708c      	lsl      	r2, r3
 286:	6ccb      	mov      	r3, r2
 288:	6c4f      	mov      	r1, r3
 28a:	3300      	movi      	r3, 0
 28c:	2b0f      	subi      	r3, 16
 28e:	60e0      	addu      	r3, r8
 290:	3200      	movi      	r2, 0
 292:	2a0f      	subi      	r2, 16
 294:	60a0      	addu      	r2, r8
 296:	9240      	ld.w      	r2, (r2, 0x0)
 298:	6884      	and      	r2, r1
 29a:	b340      	st.w      	r2, (r3, 0x0)
		
		ifc_update_addr_dr_cfg (addr_priv, data_priv);
 29c:	3200      	movi      	r2, 0
 29e:	2a0f      	subi      	r2, 16
 2a0:	60a0      	addu      	r2, r8
 2a2:	3300      	movi      	r3, 0
 2a4:	2b07      	subi      	r3, 8
 2a6:	60e0      	addu      	r3, r8
 2a8:	9220      	ld.w      	r1, (r2, 0x0)
 2aa:	9300      	ld.w      	r0, (r3, 0x0)
 2ac:	e0000000 	bsr      	0x0	// 0 <ifc_update_addr_dr_cfg>
		ifc_set_protkey(H_IFC);
 2b0:	1373      	lrw      	r3, 0x0	// 47c <csi_ifc_byte_read+0x4c>
 2b2:	9360      	ld.w      	r3, (r3, 0x0)
 2b4:	1353      	lrw      	r2, 0x5a5a5a5a	// 480 <csi_ifc_byte_read+0x50>
 2b6:	b348      	st.w      	r2, (r3, 0x20)
		H_IFC->CMR = CMD_PGM;
 2b8:	1371      	lrw      	r3, 0x0	// 47c <csi_ifc_byte_read+0x4c>
 2ba:	9360      	ld.w      	r3, (r3, 0x0)
 2bc:	3201      	movi      	r2, 1
 2be:	b343      	st.w      	r2, (r3, 0xc)
		ifc_start_cmd(H_IFC);
 2c0:	136f      	lrw      	r3, 0x0	// 47c <csi_ifc_byte_read+0x4c>
 2c2:	9360      	ld.w      	r3, (r3, 0x0)
 2c4:	3201      	movi      	r2, 1
 2c6:	b344      	st.w      	r2, (r3, 0x10)
		while (H_IFC->CR != 0);	// wait for command complete
 2c8:	6c00      	or      	r0, r0
 2ca:	136d      	lrw      	r3, 0x0	// 47c <csi_ifc_byte_read+0x4c>
 2cc:	9360      	ld.w      	r3, (r3, 0x0)
 2ce:	9364      	ld.w      	r3, (r3, 0x10)
 2d0:	3b40      	cmpnei      	r3, 0
 2d2:	0bfc      	bt      	0x2ca	// 2ca <csi_ifc_byte_program+0xe6>
		csi_ifc_byte_read (addr,1,&read_back); // verfiy the pgm
 2d4:	3200      	movi      	r2, 0
 2d6:	2a10      	subi      	r2, 17
 2d8:	60a0      	addu      	r2, r8
 2da:	3300      	movi      	r3, 0
 2dc:	2b17      	subi      	r3, 24
 2de:	60e0      	addu      	r3, r8
 2e0:	3101      	movi      	r1, 1
 2e2:	9300      	ld.w      	r0, (r3, 0x0)
 2e4:	e0000000 	bsr      	0x0	// 430 <csi_ifc_byte_read>
		if (read_back != ptrBuf[i]) {
 2e8:	3200      	movi      	r2, 0
 2ea:	2a1f      	subi      	r2, 32
 2ec:	60a0      	addu      	r2, r8
 2ee:	3300      	movi      	r3, 0
 2f0:	2b03      	subi      	r3, 4
 2f2:	60e0      	addu      	r3, r8
 2f4:	9240      	ld.w      	r2, (r2, 0x0)
 2f6:	9360      	ld.w      	r3, (r3, 0x0)
 2f8:	60c8      	addu      	r3, r2
 2fa:	8360      	ld.b      	r3, (r3, 0x0)
 2fc:	748c      	zextb      	r2, r3
 2fe:	3300      	movi      	r3, 0
 300:	2b10      	subi      	r3, 17
 302:	60e0      	addu      	r3, r8
 304:	8360      	ld.b      	r3, (r3, 0x0)
 306:	74cc      	zextb      	r3, r3
 308:	64ca      	cmpne      	r2, r3
 30a:	0c03      	bf      	0x310	// 310 <csi_ifc_byte_program+0x12c>
			return ERR_IFC(DRV_ERROR_SPECIFIC0);
 30c:	127e      	lrw      	r3, 0x81180085	// 484 <csi_ifc_byte_read+0x54>
 30e:	0426      	br      	0x35a	// 35a <csi_ifc_byte_program+0x176>
		}
		addr++;
 310:	3300      	movi      	r3, 0
 312:	2b17      	subi      	r3, 24
 314:	60e0      	addu      	r3, r8
 316:	3200      	movi      	r2, 0
 318:	2a17      	subi      	r2, 24
 31a:	60a0      	addu      	r2, r8
 31c:	9240      	ld.w      	r2, (r2, 0x0)
 31e:	2200      	addi      	r2, 1
 320:	b340      	st.w      	r2, (r3, 0x0)
	for (uint32_t i=0;i<size;i++)
 322:	3300      	movi      	r3, 0
 324:	2b03      	subi      	r3, 4
 326:	60e0      	addu      	r3, r8
 328:	3200      	movi      	r2, 0
 32a:	2a03      	subi      	r2, 4
 32c:	60a0      	addu      	r2, r8
 32e:	9240      	ld.w      	r2, (r2, 0x0)
 330:	2200      	addi      	r2, 1
 332:	b340      	st.w      	r2, (r3, 0x0)
 334:	3200      	movi      	r2, 0
 336:	2a03      	subi      	r2, 4
 338:	60a0      	addu      	r2, r8
 33a:	3300      	movi      	r3, 0
 33c:	2b1b      	subi      	r3, 28
 33e:	60e0      	addu      	r3, r8
 340:	9240      	ld.w      	r2, (r2, 0x0)
 342:	9360      	ld.w      	r3, (r3, 0x0)
 344:	64c8      	cmphs      	r2, r3
 346:	0f74      	bf      	0x22e	// 22e <csi_ifc_byte_program+0x4a>
		
	}
	
	ifc_clk_disable(H_IFC);
 348:	126d      	lrw      	r3, 0x0	// 47c <csi_ifc_byte_read+0x4c>
 34a:	9360      	ld.w      	r3, (r3, 0x0)
 34c:	3200      	movi      	r2, 0
 34e:	b341      	st.w      	r2, (r3, 0x4)
	return addr-1;
 350:	3300      	movi      	r3, 0
 352:	2b17      	subi      	r3, 24
 354:	60e0      	addu      	r3, r8
 356:	9360      	ld.w      	r3, (r3, 0x0)
 358:	2b00      	subi      	r3, 1
}
 35a:	6c0f      	mov      	r0, r3
 35c:	6fa3      	mov      	r14, r8
 35e:	d9ee2001 	ld.w      	r15, (r14, 0x4)
 362:	d90e2000 	ld.w      	r8, (r14, 0x0)
 366:	1402      	addi      	r14, r14, 8
 368:	783c      	jmp      	r15
	...

0000036c <csi_ifc_read>:
  @param[in]   size    number of words to be read
  @param[in]   ptrBuf  pointer of buffer to transfer data
  @return      error code
*/
uint32_t csi_ifc_read(uint32_t addr, uint32_t size, uint32_t *ptrBuf)
{
 36c:	1421      	subi      	r14, r14, 4
 36e:	dd0e2000 	st.w      	r8, (r14, 0x0)
 372:	6e3b      	mov      	r8, r14
 374:	1425      	subi      	r14, r14, 20
 376:	3300      	movi      	r3, 0
 378:	2b0b      	subi      	r3, 12
 37a:	60e0      	addu      	r3, r8
 37c:	b300      	st.w      	r0, (r3, 0x0)
 37e:	3300      	movi      	r3, 0
 380:	2b0f      	subi      	r3, 16
 382:	60e0      	addu      	r3, r8
 384:	b320      	st.w      	r1, (r3, 0x0)
 386:	3300      	movi      	r3, 0
 388:	2b13      	subi      	r3, 20
 38a:	60e0      	addu      	r3, r8
 38c:	b340      	st.w      	r2, (r3, 0x0)
	if (size<1) {
 38e:	3300      	movi      	r3, 0
 390:	2b0f      	subi      	r3, 16
 392:	60e0      	addu      	r3, r8
 394:	9360      	ld.w      	r3, (r3, 0x0)
 396:	3b40      	cmpnei      	r3, 0
 398:	0803      	bt      	0x39e	// 39e <csi_ifc_read+0x32>
		return ERR_IFC(DRV_ERROR_PARAMETER);
 39a:	1176      	lrw      	r3, 0x81180084	// 470 <csi_ifc_byte_read+0x40>
 39c:	0443      	br      	0x422	// 422 <csi_ifc_read+0xb6>
	}

	uint32_t *addr_priv = (uint32_t*)(addr & 0xfffffffc);
 39e:	3300      	movi      	r3, 0
 3a0:	2b0b      	subi      	r3, 12
 3a2:	60e0      	addu      	r3, r8
 3a4:	9360      	ld.w      	r3, (r3, 0x0)
 3a6:	3b80      	bclri      	r3, 0
 3a8:	3b81      	bclri      	r3, 1
 3aa:	6c8f      	mov      	r2, r3
 3ac:	3300      	movi      	r3, 0
 3ae:	2b03      	subi      	r3, 4
 3b0:	60e0      	addu      	r3, r8
 3b2:	b340      	st.w      	r2, (r3, 0x0)
	
	for (uint32_t i=0;i<size;i++) {
 3b4:	3300      	movi      	r3, 0
 3b6:	2b07      	subi      	r3, 8
 3b8:	60e0      	addu      	r3, r8
 3ba:	3200      	movi      	r2, 0
 3bc:	b340      	st.w      	r2, (r3, 0x0)
 3be:	0423      	br      	0x404	// 404 <csi_ifc_read+0x98>
		ptrBuf[i] = *addr_priv;
 3c0:	3300      	movi      	r3, 0
 3c2:	2b07      	subi      	r3, 8
 3c4:	60e0      	addu      	r3, r8
 3c6:	9360      	ld.w      	r3, (r3, 0x0)
 3c8:	4362      	lsli      	r3, r3, 2
 3ca:	3200      	movi      	r2, 0
 3cc:	2a13      	subi      	r2, 20
 3ce:	60a0      	addu      	r2, r8
 3d0:	9240      	ld.w      	r2, (r2, 0x0)
 3d2:	60c8      	addu      	r3, r2
 3d4:	3200      	movi      	r2, 0
 3d6:	2a03      	subi      	r2, 4
 3d8:	60a0      	addu      	r2, r8
 3da:	9240      	ld.w      	r2, (r2, 0x0)
 3dc:	9240      	ld.w      	r2, (r2, 0x0)
 3de:	b340      	st.w      	r2, (r3, 0x0)
		addr_priv += 4;
 3e0:	3300      	movi      	r3, 0
 3e2:	2b03      	subi      	r3, 4
 3e4:	60e0      	addu      	r3, r8
 3e6:	3200      	movi      	r2, 0
 3e8:	2a03      	subi      	r2, 4
 3ea:	60a0      	addu      	r2, r8
 3ec:	9240      	ld.w      	r2, (r2, 0x0)
 3ee:	220f      	addi      	r2, 16
 3f0:	b340      	st.w      	r2, (r3, 0x0)
	for (uint32_t i=0;i<size;i++) {
 3f2:	3300      	movi      	r3, 0
 3f4:	2b07      	subi      	r3, 8
 3f6:	60e0      	addu      	r3, r8
 3f8:	3200      	movi      	r2, 0
 3fa:	2a07      	subi      	r2, 8
 3fc:	60a0      	addu      	r2, r8
 3fe:	9240      	ld.w      	r2, (r2, 0x0)
 400:	2200      	addi      	r2, 1
 402:	b340      	st.w      	r2, (r3, 0x0)
 404:	3200      	movi      	r2, 0
 406:	2a07      	subi      	r2, 8
 408:	60a0      	addu      	r2, r8
 40a:	3300      	movi      	r3, 0
 40c:	2b0f      	subi      	r3, 16
 40e:	60e0      	addu      	r3, r8
 410:	9240      	ld.w      	r2, (r2, 0x0)
 412:	9360      	ld.w      	r3, (r3, 0x0)
 414:	64c8      	cmphs      	r2, r3
 416:	0fd5      	bf      	0x3c0	// 3c0 <csi_ifc_read+0x54>
	}
	
	return (uint32_t)addr_priv-4;
 418:	3300      	movi      	r3, 0
 41a:	2b03      	subi      	r3, 4
 41c:	60e0      	addu      	r3, r8
 41e:	9360      	ld.w      	r3, (r3, 0x0)
 420:	2b03      	subi      	r3, 4
}
 422:	6c0f      	mov      	r0, r3
 424:	6fa3      	mov      	r14, r8
 426:	d90e2000 	ld.w      	r8, (r14, 0x0)
 42a:	1401      	addi      	r14, r14, 4
 42c:	783c      	jmp      	r15
	...

00000430 <csi_ifc_byte_read>:
  @param[in]   size    number of bytes to be read
  @param[in]   ptrBuf  pointer of buffer to transfer data
  @return      error code
*/
uint32_t csi_ifc_byte_read(uint32_t addr, uint32_t size, uint8_t *ptrBuf)
{
 430:	1421      	subi      	r14, r14, 4
 432:	dd0e2000 	st.w      	r8, (r14, 0x0)
 436:	6e3b      	mov      	r8, r14
 438:	1427      	subi      	r14, r14, 28
 43a:	3300      	movi      	r3, 0
 43c:	2b13      	subi      	r3, 20
 43e:	60e0      	addu      	r3, r8
 440:	b300      	st.w      	r0, (r3, 0x0)
 442:	3300      	movi      	r3, 0
 444:	2b17      	subi      	r3, 24
 446:	60e0      	addu      	r3, r8
 448:	b320      	st.w      	r1, (r3, 0x0)
 44a:	3300      	movi      	r3, 0
 44c:	2b1b      	subi      	r3, 28
 44e:	60e0      	addu      	r3, r8
 450:	b340      	st.w      	r2, (r3, 0x0)
	if (size<1) {
 452:	3300      	movi      	r3, 0
 454:	2b17      	subi      	r3, 24
 456:	60e0      	addu      	r3, r8
 458:	9360      	ld.w      	r3, (r3, 0x0)
 45a:	3b40      	cmpnei      	r3, 0
 45c:	0803      	bt      	0x462	// 462 <csi_ifc_byte_read+0x32>
		return ERR_IFC(DRV_ERROR_PARAMETER);
 45e:	1065      	lrw      	r3, 0x81180084	// 470 <csi_ifc_byte_read+0x40>
 460:	0469      	br      	0x532	// 532 <csi_ifc_byte_read+0x102>

	uint32_t *addr_priv;
	uint32_t addr_offset;
	uint32_t data_priv;
	
	for (uint32_t i=0;i<size;i++)
 462:	3300      	movi      	r3, 0
 464:	2b03      	subi      	r3, 4
 466:	60e0      	addu      	r3, r8
 468:	3200      	movi      	r2, 0
 46a:	b340      	st.w      	r2, (r3, 0x0)
 46c:	0454      	br      	0x514	// 514 <csi_ifc_byte_read+0xe4>
 46e:	0000      	bkpt
 470:	81180084 	.long	0x81180084
 474:	00000000 	.long	0x00000000
 478:	e000e100 	.long	0xe000e100
 47c:	00000000 	.long	0x00000000
 480:	5a5a5a5a 	.long	0x5a5a5a5a
 484:	81180085 	.long	0x81180085
	{
		addr_priv = (uint32_t*)(addr & 0xfffffffcul);
 488:	3300      	movi      	r3, 0
 48a:	2b13      	subi      	r3, 20
 48c:	60e0      	addu      	r3, r8
 48e:	9360      	ld.w      	r3, (r3, 0x0)
 490:	3b80      	bclri      	r3, 0
 492:	3b81      	bclri      	r3, 1
 494:	6c8f      	mov      	r2, r3
 496:	3300      	movi      	r3, 0
 498:	2b07      	subi      	r3, 8
 49a:	60e0      	addu      	r3, r8
 49c:	b340      	st.w      	r2, (r3, 0x0)
		addr_offset = addr & 0x3ul;
 49e:	3300      	movi      	r3, 0
 4a0:	2b0b      	subi      	r3, 12
 4a2:	60e0      	addu      	r3, r8
 4a4:	3200      	movi      	r2, 0
 4a6:	2a13      	subi      	r2, 20
 4a8:	60a0      	addu      	r2, r8
 4aa:	9220      	ld.w      	r1, (r2, 0x0)
 4ac:	3203      	movi      	r2, 3
 4ae:	6884      	and      	r2, r1
 4b0:	b340      	st.w      	r2, (r3, 0x0)
		
		data_priv = *addr_priv;
 4b2:	3300      	movi      	r3, 0
 4b4:	2b0f      	subi      	r3, 16
 4b6:	60e0      	addu      	r3, r8
 4b8:	3200      	movi      	r2, 0
 4ba:	2a07      	subi      	r2, 8
 4bc:	60a0      	addu      	r2, r8
 4be:	9240      	ld.w      	r2, (r2, 0x0)
 4c0:	9240      	ld.w      	r2, (r2, 0x0)
 4c2:	b340      	st.w      	r2, (r3, 0x0)
		ptrBuf[i] = (data_priv >> (addr_offset*4)) & 0xfful;
 4c4:	3200      	movi      	r2, 0
 4c6:	2a1b      	subi      	r2, 28
 4c8:	60a0      	addu      	r2, r8
 4ca:	3300      	movi      	r3, 0
 4cc:	2b03      	subi      	r3, 4
 4ce:	60e0      	addu      	r3, r8
 4d0:	9240      	ld.w      	r2, (r2, 0x0)
 4d2:	9360      	ld.w      	r3, (r3, 0x0)
 4d4:	60c8      	addu      	r3, r2
 4d6:	3200      	movi      	r2, 0
 4d8:	2a0b      	subi      	r2, 12
 4da:	60a0      	addu      	r2, r8
 4dc:	9240      	ld.w      	r2, (r2, 0x0)
 4de:	4242      	lsli      	r2, r2, 2
 4e0:	3100      	movi      	r1, 0
 4e2:	290f      	subi      	r1, 16
 4e4:	6060      	addu      	r1, r8
 4e6:	9120      	ld.w      	r1, (r1, 0x0)
 4e8:	7049      	lsr      	r1, r2
 4ea:	6c87      	mov      	r2, r1
 4ec:	7488      	zextb      	r2, r2
 4ee:	a340      	st.b      	r2, (r3, 0x0)
		addr++;
 4f0:	3300      	movi      	r3, 0
 4f2:	2b13      	subi      	r3, 20
 4f4:	60e0      	addu      	r3, r8
 4f6:	3200      	movi      	r2, 0
 4f8:	2a13      	subi      	r2, 20
 4fa:	60a0      	addu      	r2, r8
 4fc:	9240      	ld.w      	r2, (r2, 0x0)
 4fe:	2200      	addi      	r2, 1
 500:	b340      	st.w      	r2, (r3, 0x0)
	for (uint32_t i=0;i<size;i++)
 502:	3300      	movi      	r3, 0
 504:	2b03      	subi      	r3, 4
 506:	60e0      	addu      	r3, r8
 508:	3200      	movi      	r2, 0
 50a:	2a03      	subi      	r2, 4
 50c:	60a0      	addu      	r2, r8
 50e:	9240      	ld.w      	r2, (r2, 0x0)
 510:	2200      	addi      	r2, 1
 512:	b340      	st.w      	r2, (r3, 0x0)
 514:	3200      	movi      	r2, 0
 516:	2a03      	subi      	r2, 4
 518:	60a0      	addu      	r2, r8
 51a:	3300      	movi      	r3, 0
 51c:	2b17      	subi      	r3, 24
 51e:	60e0      	addu      	r3, r8
 520:	9240      	ld.w      	r2, (r2, 0x0)
 522:	9360      	ld.w      	r3, (r3, 0x0)
 524:	64c8      	cmphs      	r2, r3
 526:	0fb1      	bf      	0x488	// 488 <csi_ifc_byte_read+0x58>
	}

	return addr-1;
 528:	3300      	movi      	r3, 0
 52a:	2b13      	subi      	r3, 20
 52c:	60e0      	addu      	r3, r8
 52e:	9360      	ld.w      	r3, (r3, 0x0)
 530:	2b00      	subi      	r3, 1
}
 532:	6c0f      	mov      	r0, r3
 534:	6fa3      	mov      	r14, r8
 536:	d90e2000 	ld.w      	r8, (r14, 0x0)
 53a:	1401      	addi      	r14, r14, 4
 53c:	783c      	jmp      	r15
	...

00000540 <csi_ifc_page_erase>:
  @param[in]   addr    Start page address of flash to be erase
  @param[in]   size    number of pages to be read
  @return      error code
*/
uint32_t csi_ifc_page_erase(ifc_page_adr addr, uint32_t size)
{
 540:	1422      	subi      	r14, r14, 8
 542:	dd0e2000 	st.w      	r8, (r14, 0x0)
 546:	ddee2001 	st.w      	r15, (r14, 0x4)
 54a:	6e3b      	mov      	r8, r14
 54c:	1424      	subi      	r14, r14, 16
 54e:	3300      	movi      	r3, 0
 550:	2b0b      	subi      	r3, 12
 552:	60e0      	addu      	r3, r8
 554:	b300      	st.w      	r0, (r3, 0x0)
 556:	3300      	movi      	r3, 0
 558:	2b0f      	subi      	r3, 16
 55a:	60e0      	addu      	r3, r8
 55c:	b320      	st.w      	r1, (r3, 0x0)
	if (size<1 || size > 64) {
 55e:	3300      	movi      	r3, 0
 560:	2b0f      	subi      	r3, 16
 562:	60e0      	addu      	r3, r8
 564:	9360      	ld.w      	r3, (r3, 0x0)
 566:	3b40      	cmpnei      	r3, 0
 568:	0c08      	bf      	0x578	// 578 <csi_ifc_page_erase+0x38>
 56a:	3300      	movi      	r3, 0
 56c:	2b0f      	subi      	r3, 16
 56e:	60e0      	addu      	r3, r8
 570:	9340      	ld.w      	r2, (r3, 0x0)
 572:	3340      	movi      	r3, 64
 574:	648c      	cmphs      	r3, r2
 576:	0803      	bt      	0x57c	// 57c <csi_ifc_page_erase+0x3c>
		return ERR_IFC(DRV_ERROR_PARAMETER);
 578:	0264      	lrw      	r3, 0x81180084	// 864 <csi_ifc_interrupt_get_status+0x60>
 57a:	045f      	br      	0x638	// 638 <csi_ifc_page_erase+0xf8>
	}

	uint32_t read_back;

	ifc_clk_enable(H_IFC);
 57c:	0264      	lrw      	r3, 0x0	// 868 <csi_ifc_interrupt_get_status+0x64>
 57e:	9360      	ld.w      	r3, (r3, 0x0)
 580:	3201      	movi      	r2, 1
 582:	b341      	st.w      	r2, (r3, 0x4)
	for (uint32_t i=0;i<size;i++)
 584:	3300      	movi      	r3, 0
 586:	2b03      	subi      	r3, 4
 588:	60e0      	addu      	r3, r8
 58a:	3200      	movi      	r2, 0
 58c:	b340      	st.w      	r2, (r3, 0x0)
 58e:	0441      	br      	0x610	// 610 <csi_ifc_page_erase+0xd0>
	{
		ifc_update_addr_dr_cfg (addr, 0x0);
 590:	3300      	movi      	r3, 0
 592:	2b0b      	subi      	r3, 12
 594:	60e0      	addu      	r3, r8
 596:	3100      	movi      	r1, 0
 598:	9300      	ld.w      	r0, (r3, 0x0)
 59a:	e0000000 	bsr      	0x0	// 0 <ifc_update_addr_dr_cfg>
		ifc_set_protkey(H_IFC);
 59e:	026c      	lrw      	r3, 0x0	// 868 <csi_ifc_interrupt_get_status+0x64>
 5a0:	9360      	ld.w      	r3, (r3, 0x0)
 5a2:	024c      	lrw      	r2, 0x5a5a5a5a	// 86c <csi_ifc_interrupt_get_status+0x68>
 5a4:	b348      	st.w      	r2, (r3, 0x20)
		H_IFC->CMR = CMP_PERS;
 5a6:	026e      	lrw      	r3, 0x0	// 868 <csi_ifc_interrupt_get_status+0x64>
 5a8:	9360      	ld.w      	r3, (r3, 0x0)
 5aa:	3202      	movi      	r2, 2
 5ac:	b343      	st.w      	r2, (r3, 0xc)
		ifc_start_cmd(H_IFC);
 5ae:	0270      	lrw      	r3, 0x0	// 868 <csi_ifc_interrupt_get_status+0x64>
 5b0:	9360      	ld.w      	r3, (r3, 0x0)
 5b2:	3201      	movi      	r2, 1
 5b4:	b344      	st.w      	r2, (r3, 0x10)
		while (H_IFC->CR != 0);	// wait for command complete
 5b6:	6c00      	or      	r0, r0
 5b8:	0273      	lrw      	r3, 0x0	// 868 <csi_ifc_interrupt_get_status+0x64>
 5ba:	9360      	ld.w      	r3, (r3, 0x0)
 5bc:	9364      	ld.w      	r3, (r3, 0x10)
 5be:	3b40      	cmpnei      	r3, 0
 5c0:	0bfc      	bt      	0x5b8	// 5b8 <csi_ifc_page_erase+0x78>
		csi_ifc_read (addr,1,&read_back);	//verify the pgm
 5c2:	3200      	movi      	r2, 0
 5c4:	2a07      	subi      	r2, 8
 5c6:	60a0      	addu      	r2, r8
 5c8:	3300      	movi      	r3, 0
 5ca:	2b0b      	subi      	r3, 12
 5cc:	60e0      	addu      	r3, r8
 5ce:	3101      	movi      	r1, 1
 5d0:	9300      	ld.w      	r0, (r3, 0x0)
 5d2:	e0000000 	bsr      	0x0	// 36c <csi_ifc_read>
		if (read_back != 0xffffffff) {
 5d6:	3300      	movi      	r3, 0
 5d8:	2b07      	subi      	r3, 8
 5da:	60e0      	addu      	r3, r8
 5dc:	9340      	ld.w      	r2, (r3, 0x0)
 5de:	3300      	movi      	r3, 0
 5e0:	2b00      	subi      	r3, 1
 5e2:	64ca      	cmpne      	r2, r3
 5e4:	0c03      	bf      	0x5ea	// 5ea <csi_ifc_page_erase+0xaa>
			return ERR_IFC(DRV_ERROR_SPECIFIC0);
 5e6:	027c      	lrw      	r3, 0x81180085	// 870 <csi_ifc_interrupt_get_status+0x6c>
 5e8:	0428      	br      	0x638	// 638 <csi_ifc_page_erase+0xf8>
		}
		addr += 0x400;
 5ea:	3300      	movi      	r3, 0
 5ec:	2b0b      	subi      	r3, 12
 5ee:	60e0      	addu      	r3, r8
 5f0:	3200      	movi      	r2, 0
 5f2:	2a0b      	subi      	r2, 12
 5f4:	60a0      	addu      	r2, r8
 5f6:	9240      	ld.w      	r2, (r2, 0x0)
 5f8:	0320      	lrw      	r1, 0x400	// 874 <csi_ifc_interrupt_get_status+0x70>
 5fa:	6084      	addu      	r2, r1
 5fc:	b340      	st.w      	r2, (r3, 0x0)
	for (uint32_t i=0;i<size;i++)
 5fe:	3300      	movi      	r3, 0
 600:	2b03      	subi      	r3, 4
 602:	60e0      	addu      	r3, r8
 604:	3200      	movi      	r2, 0
 606:	2a03      	subi      	r2, 4
 608:	60a0      	addu      	r2, r8
 60a:	9240      	ld.w      	r2, (r2, 0x0)
 60c:	2200      	addi      	r2, 1
 60e:	b340      	st.w      	r2, (r3, 0x0)
 610:	3200      	movi      	r2, 0
 612:	2a03      	subi      	r2, 4
 614:	60a0      	addu      	r2, r8
 616:	3300      	movi      	r3, 0
 618:	2b0f      	subi      	r3, 16
 61a:	60e0      	addu      	r3, r8
 61c:	9240      	ld.w      	r2, (r2, 0x0)
 61e:	9360      	ld.w      	r3, (r3, 0x0)
 620:	64c8      	cmphs      	r2, r3
 622:	0fb7      	bf      	0x590	// 590 <csi_ifc_page_erase+0x50>
	}
	
	ifc_clk_disable(H_IFC);
 624:	036e      	lrw      	r3, 0x0	// 868 <csi_ifc_interrupt_get_status+0x64>
 626:	9360      	ld.w      	r3, (r3, 0x0)
 628:	3200      	movi      	r2, 0
 62a:	b341      	st.w      	r2, (r3, 0x4)
	return addr-0x400;	
 62c:	3300      	movi      	r3, 0
 62e:	2b0b      	subi      	r3, 12
 630:	60e0      	addu      	r3, r8
 632:	9360      	ld.w      	r3, (r3, 0x0)
 634:	034e      	lrw      	r2, 0xfffffc00	// 878 <csi_ifc_interrupt_get_status+0x74>
 636:	60c8      	addu      	r3, r2
	
}
 638:	6c0f      	mov      	r0, r3
 63a:	6fa3      	mov      	r14, r8
 63c:	d9ee2001 	ld.w      	r15, (r14, 0x4)
 640:	d90e2000 	ld.w      	r8, (r14, 0x0)
 644:	1402      	addi      	r14, r14, 8
 646:	783c      	jmp      	r15

00000648 <csi_ifc_option_erase>:
				The result can be checked by syscon opt0.
  
  @return      error code
*/
uint32_t csi_ifc_option_erase(void)
{
 648:	1421      	subi      	r14, r14, 4
 64a:	dd0e2000 	st.w      	r8, (r14, 0x0)
 64e:	6e3b      	mov      	r8, r14
	ifc_clk_enable(H_IFC);
 650:	0379      	lrw      	r3, 0x0	// 868 <csi_ifc_interrupt_get_status+0x64>
 652:	9360      	ld.w      	r3, (r3, 0x0)
 654:	3201      	movi      	r2, 1
 656:	b341      	st.w      	r2, (r3, 0x4)
	ifc_set_protkey(H_IFC);
 658:	037b      	lrw      	r3, 0x0	// 868 <csi_ifc_interrupt_get_status+0x64>
 65a:	9360      	ld.w      	r3, (r3, 0x0)
 65c:	035b      	lrw      	r2, 0x5a5a5a5a	// 86c <csi_ifc_interrupt_get_status+0x68>
 65e:	b348      	st.w      	r2, (r3, 0x20)
	H_IFC->CMR = CMP_OPTERS | IFC_HMODE1;
 660:	037d      	lrw      	r3, 0x0	// 868 <csi_ifc_interrupt_get_status+0x64>
 662:	9340      	ld.w      	r2, (r3, 0x0)
 664:	3382      	movi      	r3, 130
 666:	4361      	lsli      	r3, r3, 1
 668:	b263      	st.w      	r3, (r2, 0xc)
	ifc_start_cmd(H_IFC);
 66a:	037f      	lrw      	r3, 0x0	// 868 <csi_ifc_interrupt_get_status+0x64>
 66c:	9360      	ld.w      	r3, (r3, 0x0)
 66e:	3201      	movi      	r2, 1
 670:	b344      	st.w      	r2, (r3, 0x10)
	while (H_IFC->CR != 0);	// wait for command complete
 672:	6c00      	or      	r0, r0
 674:	137d      	lrw      	r3, 0x0	// 868 <csi_ifc_interrupt_get_status+0x64>
 676:	9360      	ld.w      	r3, (r3, 0x0)
 678:	9364      	ld.w      	r3, (r3, 0x10)
 67a:	3b40      	cmpnei      	r3, 0
 67c:	0bfc      	bt      	0x674	// 674 <csi_ifc_option_erase+0x2c>
	
	ifc_clk_disable(H_IFC);
 67e:	137b      	lrw      	r3, 0x0	// 868 <csi_ifc_interrupt_get_status+0x64>
 680:	9360      	ld.w      	r3, (r3, 0x0)
 682:	3200      	movi      	r2, 0
 684:	b341      	st.w      	r2, (r3, 0x4)
	return 0;	
 686:	3300      	movi      	r3, 0
}
 688:	6c0f      	mov      	r0, r3
 68a:	6fa3      	mov      	r14, r8
 68c:	d90e2000 	ld.w      	r8, (r14, 0x0)
 690:	1401      	addi      	r14, r14, 4
 692:	783c      	jmp      	r15

00000694 <csi_ifc_user_option_set>:
				checked by syscon opt0.
  
  @return      error code
*/
uint32_t csi_ifc_user_option_set(uint32_t data)
{
 694:	1422      	subi      	r14, r14, 8
 696:	dd0e2000 	st.w      	r8, (r14, 0x0)
 69a:	ddee2001 	st.w      	r15, (r14, 0x4)
 69e:	6e3b      	mov      	r8, r14
 6a0:	1421      	subi      	r14, r14, 4
 6a2:	3300      	movi      	r3, 0
 6a4:	2b03      	subi      	r3, 4
 6a6:	60e0      	addu      	r3, r8
 6a8:	b300      	st.w      	r0, (r3, 0x0)
	ifc_clk_enable(H_IFC);
 6aa:	1370      	lrw      	r3, 0x0	// 868 <csi_ifc_interrupt_get_status+0x64>
 6ac:	9360      	ld.w      	r3, (r3, 0x0)
 6ae:	3201      	movi      	r2, 1
 6b0:	b341      	st.w      	r2, (r3, 0x4)
	ifc_set_protkey(H_IFC);
 6b2:	136e      	lrw      	r3, 0x0	// 868 <csi_ifc_interrupt_get_status+0x64>
 6b4:	9360      	ld.w      	r3, (r3, 0x0)
 6b6:	134e      	lrw      	r2, 0x5a5a5a5a	// 86c <csi_ifc_interrupt_get_status+0x68>
 6b8:	b348      	st.w      	r2, (r3, 0x20)
	ifc_update_addr_dr_cfg (0x0, data);
 6ba:	3300      	movi      	r3, 0
 6bc:	2b03      	subi      	r3, 4
 6be:	60e0      	addu      	r3, r8
 6c0:	9320      	ld.w      	r1, (r3, 0x0)
 6c2:	3000      	movi      	r0, 0
 6c4:	e0000000 	bsr      	0x0	// 0 <ifc_update_addr_dr_cfg>
	H_IFC->CMR = CMP_PGMOPT | IFC_HMODE1;
 6c8:	1368      	lrw      	r3, 0x0	// 868 <csi_ifc_interrupt_get_status+0x64>
 6ca:	9360      	ld.w      	r3, (r3, 0x0)
 6cc:	134c      	lrw      	r2, 0x10f	// 87c <csi_ifc_interrupt_get_status+0x78>
 6ce:	b343      	st.w      	r2, (r3, 0xc)
	ifc_start_cmd(H_IFC);
 6d0:	1366      	lrw      	r3, 0x0	// 868 <csi_ifc_interrupt_get_status+0x64>
 6d2:	9360      	ld.w      	r3, (r3, 0x0)
 6d4:	3201      	movi      	r2, 1
 6d6:	b344      	st.w      	r2, (r3, 0x10)
	while (H_IFC->CR != 0);	// wait for command complete
 6d8:	6c00      	or      	r0, r0
 6da:	1364      	lrw      	r3, 0x0	// 868 <csi_ifc_interrupt_get_status+0x64>
 6dc:	9360      	ld.w      	r3, (r3, 0x0)
 6de:	9364      	ld.w      	r3, (r3, 0x10)
 6e0:	3b40      	cmpnei      	r3, 0
 6e2:	0bfc      	bt      	0x6da	// 6da <csi_ifc_user_option_set+0x46>
	
	ifc_clk_disable(H_IFC);
 6e4:	1361      	lrw      	r3, 0x0	// 868 <csi_ifc_interrupt_get_status+0x64>
 6e6:	9360      	ld.w      	r3, (r3, 0x0)
 6e8:	3200      	movi      	r2, 0
 6ea:	b341      	st.w      	r2, (r3, 0x4)
	return 0;	
 6ec:	3300      	movi      	r3, 0
}
 6ee:	6c0f      	mov      	r0, r3
 6f0:	6fa3      	mov      	r14, r8
 6f2:	d9ee2001 	ld.w      	r15, (r14, 0x4)
 6f6:	d90e2000 	ld.w      	r8, (r14, 0x0)
 6fa:	1402      	addi      	r14, r14, 8
 6fc:	783c      	jmp      	r15
	...

00000700 <csi_ifc_prot_option_set>:
				checked by syscon opt0.
  
  @return      error code
*/
uint32_t csi_ifc_prot_option_set(ifc_cmd_e cmd)
{
 700:	1421      	subi      	r14, r14, 4
 702:	dd0e2000 	st.w      	r8, (r14, 0x0)
 706:	6e3b      	mov      	r8, r14
 708:	1421      	subi      	r14, r14, 4
 70a:	3300      	movi      	r3, 0
 70c:	2b03      	subi      	r3, 4
 70e:	60e0      	addu      	r3, r8
 710:	b300      	st.w      	r0, (r3, 0x0)
	ifc_clk_enable(H_IFC);
 712:	1276      	lrw      	r3, 0x0	// 868 <csi_ifc_interrupt_get_status+0x64>
 714:	9360      	ld.w      	r3, (r3, 0x0)
 716:	3201      	movi      	r2, 1
 718:	b341      	st.w      	r2, (r3, 0x4)
	ifc_set_protkey(H_IFC);
 71a:	1274      	lrw      	r3, 0x0	// 868 <csi_ifc_interrupt_get_status+0x64>
 71c:	9360      	ld.w      	r3, (r3, 0x0)
 71e:	1254      	lrw      	r2, 0x5a5a5a5a	// 86c <csi_ifc_interrupt_get_status+0x68>
 720:	b348      	st.w      	r2, (r3, 0x20)
	H_IFC->CMR = cmd | IFC_HMODE1;
 722:	1272      	lrw      	r3, 0x0	// 868 <csi_ifc_interrupt_get_status+0x64>
 724:	9360      	ld.w      	r3, (r3, 0x0)
 726:	3200      	movi      	r2, 0
 728:	2a03      	subi      	r2, 4
 72a:	60a0      	addu      	r2, r8
 72c:	9240      	ld.w      	r2, (r2, 0x0)
 72e:	3aa8      	bseti      	r2, 8
 730:	b343      	st.w      	r2, (r3, 0xc)
	ifc_start_cmd(H_IFC);
 732:	126e      	lrw      	r3, 0x0	// 868 <csi_ifc_interrupt_get_status+0x64>
 734:	9360      	ld.w      	r3, (r3, 0x0)
 736:	3201      	movi      	r2, 1
 738:	b344      	st.w      	r2, (r3, 0x10)
	while (H_IFC->CR != 0);	// wait for command complete
 73a:	6c00      	or      	r0, r0
 73c:	126b      	lrw      	r3, 0x0	// 868 <csi_ifc_interrupt_get_status+0x64>
 73e:	9360      	ld.w      	r3, (r3, 0x0)
 740:	9364      	ld.w      	r3, (r3, 0x10)
 742:	3b40      	cmpnei      	r3, 0
 744:	0bfc      	bt      	0x73c	// 73c <csi_ifc_prot_option_set+0x3c>
	
	ifc_clk_disable(H_IFC);
 746:	1269      	lrw      	r3, 0x0	// 868 <csi_ifc_interrupt_get_status+0x64>
 748:	9360      	ld.w      	r3, (r3, 0x0)
 74a:	3200      	movi      	r2, 0
 74c:	b341      	st.w      	r2, (r3, 0x4)
	return 0;	
 74e:	3300      	movi      	r3, 0
}
 750:	6c0f      	mov      	r0, r3
 752:	6fa3      	mov      	r14, r8
 754:	d90e2000 	ld.w      	r8, (r14, 0x0)
 758:	1401      	addi      	r14, r14, 4
 75a:	783c      	jmp      	r15

0000075c <csi_ifc_interrupt_set_switch>:
  \param[in]   int_sel:  interrupt to be en/dis
  \param[in]   status:   enable/disable
  \return      current masking status
*/
uint32_t csi_ifc_interrupt_set_switch(ifc_event_e int_sel, syscon_endis_e status)
{
 75c:	1421      	subi      	r14, r14, 4
 75e:	dd0e2000 	st.w      	r8, (r14, 0x0)
 762:	6e3b      	mov      	r8, r14
 764:	1422      	subi      	r14, r14, 8
 766:	3300      	movi      	r3, 0
 768:	2b03      	subi      	r3, 4
 76a:	60e0      	addu      	r3, r8
 76c:	b300      	st.w      	r0, (r3, 0x0)
 76e:	3300      	movi      	r3, 0
 770:	2b07      	subi      	r3, 8
 772:	60e0      	addu      	r3, r8
 774:	b320      	st.w      	r1, (r3, 0x0)
	if (status == ENABLE) {
 776:	3300      	movi      	r3, 0
 778:	2b07      	subi      	r3, 8
 77a:	60e0      	addu      	r3, r8
 77c:	9360      	ld.w      	r3, (r3, 0x0)
 77e:	3b40      	cmpnei      	r3, 0
 780:	0810      	bt      	0x7a0	// 7a0 <csi_ifc_interrupt_set_switch+0x44>
		H_IFC->IMCR |= 1ul<<int_sel;
 782:	117a      	lrw      	r3, 0x0	// 868 <csi_ifc_interrupt_get_status+0x64>
 784:	9360      	ld.w      	r3, (r3, 0x0)
 786:	1159      	lrw      	r2, 0x0	// 868 <csi_ifc_interrupt_get_status+0x64>
 788:	9240      	ld.w      	r2, (r2, 0x0)
 78a:	9229      	ld.w      	r1, (r2, 0x24)
 78c:	3200      	movi      	r2, 0
 78e:	2a03      	subi      	r2, 4
 790:	60a0      	addu      	r2, r8
 792:	3001      	movi      	r0, 1
 794:	9240      	ld.w      	r2, (r2, 0x0)
 796:	7008      	lsl      	r0, r2
 798:	6c83      	mov      	r2, r0
 79a:	6c84      	or      	r2, r1
 79c:	b349      	st.w      	r2, (r3, 0x24)
 79e:	0410      	br      	0x7be	// 7be <csi_ifc_interrupt_set_switch+0x62>
	}
	else {
		H_IFC->IMCR &= ~(1ul<<int_sel);
 7a0:	1172      	lrw      	r3, 0x0	// 868 <csi_ifc_interrupt_get_status+0x64>
 7a2:	9360      	ld.w      	r3, (r3, 0x0)
 7a4:	1151      	lrw      	r2, 0x0	// 868 <csi_ifc_interrupt_get_status+0x64>
 7a6:	9240      	ld.w      	r2, (r2, 0x0)
 7a8:	9229      	ld.w      	r1, (r2, 0x24)
 7aa:	3200      	movi      	r2, 0
 7ac:	2a03      	subi      	r2, 4
 7ae:	60a0      	addu      	r2, r8
 7b0:	3001      	movi      	r0, 1
 7b2:	9240      	ld.w      	r2, (r2, 0x0)
 7b4:	7008      	lsl      	r0, r2
 7b6:	6c83      	mov      	r2, r0
 7b8:	6c8a      	nor      	r2, r2
 7ba:	6884      	and      	r2, r1
 7bc:	b349      	st.w      	r2, (r3, 0x24)
	}

	return H_IFC->IMCR;
 7be:	116b      	lrw      	r3, 0x0	// 868 <csi_ifc_interrupt_get_status+0x64>
 7c0:	9360      	ld.w      	r3, (r3, 0x0)
 7c2:	9369      	ld.w      	r3, (r3, 0x24)
}
 7c4:	6c0f      	mov      	r0, r3
 7c6:	6fa3      	mov      	r14, r8
 7c8:	d90e2000 	ld.w      	r8, (r14, 0x0)
 7cc:	1401      	addi      	r14, r14, 4
 7ce:	783c      	jmp      	r15

000007d0 <csi_ifc_interrupt_clear_pending>:
  \brief       Clear interrupt pending bit
  \param[in]   int_sel:  interrupt to be clear
  \return      None
*/
void csi_ifc_interrupt_clear_pending(ifc_event_e int_sel)
{
 7d0:	1421      	subi      	r14, r14, 4
 7d2:	dd0e2000 	st.w      	r8, (r14, 0x0)
 7d6:	6e3b      	mov      	r8, r14
 7d8:	1421      	subi      	r14, r14, 4
 7da:	3300      	movi      	r3, 0
 7dc:	2b03      	subi      	r3, 4
 7de:	60e0      	addu      	r3, r8
 7e0:	b300      	st.w      	r0, (r3, 0x0)
	H_IFC->ICLR = 1ul<<int_sel;
 7e2:	1162      	lrw      	r3, 0x0	// 868 <csi_ifc_interrupt_get_status+0x64>
 7e4:	9360      	ld.w      	r3, (r3, 0x0)
 7e6:	3200      	movi      	r2, 0
 7e8:	2a03      	subi      	r2, 4
 7ea:	60a0      	addu      	r2, r8
 7ec:	3101      	movi      	r1, 1
 7ee:	9240      	ld.w      	r2, (r2, 0x0)
 7f0:	7048      	lsl      	r1, r2
 7f2:	6c87      	mov      	r2, r1
 7f4:	b34c      	st.w      	r2, (r3, 0x30)
}
 7f6:	6c00      	or      	r0, r0
 7f8:	6fa3      	mov      	r14, r8
 7fa:	d90e2000 	ld.w      	r8, (r14, 0x0)
 7fe:	1401      	addi      	r14, r14, 4
 800:	783c      	jmp      	r15
	...

00000804 <csi_ifc_interrupt_get_status>:
  \param[in]   int_sel:  interrupt pending to be read
  \param[in]   status:   raw(T)/masked(F) pending bit select
  \return      corresponding bit of pending according to int_sel
*/
uint32_t csi_ifc_interrupt_get_status(ifc_event_e int_sel, syscon_endis_e status)
{
 804:	1421      	subi      	r14, r14, 4
 806:	dd0e2000 	st.w      	r8, (r14, 0x0)
 80a:	6e3b      	mov      	r8, r14
 80c:	1422      	subi      	r14, r14, 8
 80e:	3300      	movi      	r3, 0
 810:	2b03      	subi      	r3, 4
 812:	60e0      	addu      	r3, r8
 814:	b300      	st.w      	r0, (r3, 0x0)
 816:	3300      	movi      	r3, 0
 818:	2b07      	subi      	r3, 8
 81a:	60e0      	addu      	r3, r8
 81c:	b320      	st.w      	r1, (r3, 0x0)
	if (status == ENABLE) {
 81e:	3300      	movi      	r3, 0
 820:	2b07      	subi      	r3, 8
 822:	60e0      	addu      	r3, r8
 824:	9360      	ld.w      	r3, (r3, 0x0)
 826:	3b40      	cmpnei      	r3, 0
 828:	080d      	bt      	0x842	// 842 <csi_ifc_interrupt_get_status+0x3e>
		return ((H_IFC->RISR) & (1ul<<int_sel));
 82a:	1070      	lrw      	r3, 0x0	// 868 <csi_ifc_interrupt_get_status+0x64>
 82c:	9360      	ld.w      	r3, (r3, 0x0)
 82e:	934a      	ld.w      	r2, (r3, 0x28)
 830:	3300      	movi      	r3, 0
 832:	2b03      	subi      	r3, 4
 834:	60e0      	addu      	r3, r8
 836:	3101      	movi      	r1, 1
 838:	9360      	ld.w      	r3, (r3, 0x0)
 83a:	704c      	lsl      	r1, r3
 83c:	6cc7      	mov      	r3, r1
 83e:	68c8      	and      	r3, r2
 840:	040c      	br      	0x858	// 858 <csi_ifc_interrupt_get_status+0x54>
	}
	else {
		return ((H_IFC->MISR) & (1ul<<int_sel));
 842:	106a      	lrw      	r3, 0x0	// 868 <csi_ifc_interrupt_get_status+0x64>
 844:	9360      	ld.w      	r3, (r3, 0x0)
 846:	934b      	ld.w      	r2, (r3, 0x2c)
 848:	3300      	movi      	r3, 0
 84a:	2b03      	subi      	r3, 4
 84c:	60e0      	addu      	r3, r8
 84e:	3101      	movi      	r1, 1
 850:	9360      	ld.w      	r3, (r3, 0x0)
 852:	704c      	lsl      	r1, r3
 854:	6cc7      	mov      	r3, r1
 856:	68c8      	and      	r3, r2
	}
}
 858:	6c0f      	mov      	r0, r3
 85a:	6fa3      	mov      	r14, r8
 85c:	d90e2000 	ld.w      	r8, (r14, 0x0)
 860:	1401      	addi      	r14, r14, 4
 862:	783c      	jmp      	r15
 864:	81180084 	.long	0x81180084
 868:	00000000 	.long	0x00000000
 86c:	5a5a5a5a 	.long	0x5a5a5a5a
 870:	81180085 	.long	0x81180085
 874:	00000400 	.long	0x00000400
 878:	fffffc00 	.long	0xfffffc00
 87c:	0000010f 	.long	0x0000010f
