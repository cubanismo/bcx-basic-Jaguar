#NO_APP
	.text
	.even
	.globl	hiscore_sort
hiscore_sort:
	link.w %fp,#0
#APP
| 129 "basic_functions.c" 1
		move.l d1,-(a7)
	move.l 8(a6),d1
	jsr RAPTOR_resort_score_table
	move.l (a7)+,d1
| 0 "" 2
#NO_APP
	unlk %fp
	rts
	.even
	.globl	fullpowablitlist
fullpowablitlist:
	link.w %fp,#0
#APP
| 137 "basic_functions.c" 1
	movem.l d0-a5,-(sp)                               
	move.l 8(a6),a0                                   
	move.l RUPDALL_FLAG,-(sp)  |save update flag      
	move.l #0,RUPDALL_FLAG     |disable auto update   
	jsr RAPTOR_blitter_full                           
	move.l (sp)+,RUPDALL_FLAG  |restore update flag   
	movem.l (sp)+,d0-a5                               
	
| 0 "" 2
#NO_APP
	unlk %fp
	rts
	.even
	.globl	powaeeprom
powaeeprom:
	link.w %fp,#0
#APP
| 149 "basic_functions.c" 1
		movem.l d1-a5,-(sp)                                                   
	move.l 12(a6),a0                                                                  
	tst.l 8(a6)                                                                       
	beq.s savestuff                                                                   
	jsr eeReadBank                                                                    
	bra getout                                                                        
	                                                                                  
	savestuff:                                                                        
	jsr eeWriteBank                                                                   
	|move.w #0x134,0xF00058
	                                                                                  
	                                                                                  
	getout: ext.l d0 |sign extend d0                                                  
	movem.l (sp)+,d1-a5
| 0 "" 2
#NO_APP
	unlk %fp
	rts
	.even
	.globl	powablitlist
powablitlist:
	link.w %fp,#0
#APP
| 167 "basic_functions.c" 1
	movem.l d0-a5,-(sp)                               
	move.l 8(a6),a0                                   
	move.l RUPDALL_FLAG,-(sp)  |save update flag      
	move.l #0,RUPDALL_FLAG     |disable auto update   
	jsr RAPTOR_blitter                                
	move.l (sp)+,RUPDALL_FLAG  |restore update flag   
	movem.l (sp)+,d0-a5                               
	
| 0 "" 2
#NO_APP
	unlk %fp
	rts
	.even
	.globl	rbsort
rbsort:
	link.w %fp,#0
	movem.l #32380,-(%sp)
	move.l 12(%fp),%d5
	moveq #1,%d0
	cmp.l %d5,%d0
	jcc .L5
	move.l 8(%fp),%a3
	lea rbsort,%a5
.L17:
	move.l %d5,%d1
	subq.l #1,%d1
	move.l %d1,%d4
	lsr.l #1,%d4
	move.l %d4,%d0
	add.l %d4,%d0
	add.l %d0,%d0
	move.l (%a3,%d0.l),%d6
	move.l %a3,%a2
	moveq #1,%d2
	move.l %d2,%d3
	subq.l #1,%d3
	move.l %a2,%a4
	move.l %d6,%d0
	sub.l (%a2),%d0
	tst.l %d0
	jle .L23
.L8:
	addq.l #4,%a2
	addq.l #1,%d2
.L25:
	move.l %d2,%d3
	subq.l #1,%d3
	move.l %a2,%a4
	move.l %d6,%d0
	sub.l (%a2),%d0
	tst.l %d0
	jgt .L8
.L23:
	move.l %d1,%a0
	add.l %d1,%a0
	add.l %a0,%a0
	move.l %d6,%d0
	sub.l (%a3,%a0.l),%d0
	jpl .L9
	subq.l #4,%a0
	subq.l #1,%d1
	lea (-4,%a0),%a1
	move.l %d6,%d0
	sub.l (%a3,%a0.l),%d0
	jpl .L9
.L18:
	move.l %a1,%a0
	subq.l #1,%d1
	lea (-4,%a0),%a1
	move.l %d6,%d0
	sub.l (%a3,%a0.l),%d0
	jmi .L18
.L9:
	cmp.l %d3,%d1
	jls .L11
	lea (%a3,%a0.l),%a0
	move.l %a2,%a1
	moveq #0,%d0
.L12:
	move.b (%a1),%d6
	move.b (%a0),(%a1)+
	move.b %d6,(%a0)+
	addq.l #1,%d0
	moveq #4,%d6
	cmp.l %d0,%d6
	jne .L12
	cmp.l %d4,%d3
	jeq .L24
	cmp.l %d4,%d1
	jeq .L19
	move.l %d4,%a4
	add.l %d4,%a4
	add.l %a4,%a4
	lea (%a3,%a4.l),%a4
	subq.l #1,%d1
	move.l (%a4),%d6
.L26:
	addq.l #4,%a2
	addq.l #1,%d2
	jra .L25
.L24:
	move.l %d1,%a4
	add.l %d1,%a4
	add.l %a4,%a4
	lea (%a3,%a4.l),%a4
	move.l %d1,%d4
	subq.l #1,%d1
	move.l (%a4),%d6
	jra .L26
.L19:
	move.l %d3,%d4
	subq.l #1,%d1
	move.l (%a4),%d6
	jra .L26
.L11:
	addq.l #1,%d1
	sub.l %d1,%d5
	cmp.l %d1,%d5
	jls .L15
	move.l %d1,-(%sp)
	move.l %a3,-(%sp)
	jsr (%a5)
	add.l %d1,%d1
	add.l %d1,%d1
	add.l %d1,%a3
	addq.l #8,%sp
	moveq #1,%d0
	cmp.l %d5,%d0
	jcs .L17
.L5:
	movem.l -44(%fp),#15998
	unlk %fp
	rts
.L15:
	move.l %d5,-(%sp)
	move.l %d1,%d0
	add.l %d1,%d0
	add.l %d0,%d0
	pea (%a3,%d0.l)
	jsr (%a5)
	addq.l #8,%sp
	move.l %d1,%d5
	moveq #1,%d0
	cmp.l %d5,%d0
	jcs .L17
	jra .L5
	.even
	.globl	powaunpack
powaunpack:
	link.w %fp,#0
#APP
| 286 "basic_functions.c" 1
		movem.l d0-d7/a0-a6,-(sp)                                             
	move.l 8(a6),a0                                                                  
	move.l 12(a6),a1                                                                  
	|------------------------------------------------------------------------------- 
	|  n2e_d.ash -- NRV2E decompression in 68000 assembly                            
	|                                                                                
	|  This file is part of the UCL data compression library.                        
	|                                                                                
	|  Copyright (C) 1996-2004 Markus Franz Xaver Johannes Oberhumer                 
	|  All Rights Reserved.                                                          
	|                                                                                
	|  The UCL library is free software; you can redistribute it and/or              
	|  modify it under the terms of the GNU General Public License as                
	|  published by the Free Software Foundation; either version 2 of                
	|  the License, or (at your option) any later version.                           
	|                                                                                
	|  The UCL library is distributed in the hope that it will be useful,            
	|  but WITHOUT ANY WARRANTY; without even the implied warranty of                
	|  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the                 
	|  GNU General Public License for more details.                                  
	|                                                                                
	|  You should have received a copy of the GNU General Public License             
	|  along with the UCL library; see the file COPYING.                             
	|  If not, write to the Free Software Foundation, Inc.,                          
	|  59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.                      
	|                                                                                
	|  Markus F.X.J. Oberhumer                                                       
	|  <markus@oberhumer.com>                                                        
	|  http://www.oberhumer.com/opensource/ucl/                                      
	|                                                                                
	|------------------------------------------------------------------------------- 
	                                                                                 
	| ------------- DECOMPRESSION -------------                                      
	                                                                                 
	| decompress from a0 to a1                                                       
	|   note: must preserve d4 and a5-a7                                             
	                                                                                 
	|                                                                                
	| On entry:                                                                      
	|   a0  src pointer                                                              
	|   a1  dest pointer                                                             
	|                                                                                
	| On exit:                                                                       
	|   d1.l = 0x00008000                                                            
	|   d2.l = 0                                                                     
	|                                                                                
	| Register usage:                                                                
	|   a3  m_pos                                                                    
	|                                                                                
	|   d0  bit buffer                                                               
	|   d1  m_off                                                                    
	|   d2  m_len                                                                    
	|   d5  last_m_off                                                               
	|                                                                                
	|   d6  constant: -$500                                                          
	|   d7  constant: 0                                                              
	|                                                                                
	|                                                                                
	| Notes:                                                                         
	|   we have max_match = 65535, so we can use word arithmetics on d2              
	|   we have max_offset < 2**23, so we can use partial word arithmetics on d1     
	|                                                                                
	                                                                                 
	| ------------- constants & macros -------------                                 
	depack2e:                                                                        
	                moveq   #-0x50,D6       |   0xffffffb0                           
	                lsl.w   #4,D6           |   << 4                                 
	                                                                                 
	                moveq   #0,D7                                                    
	                moveq   #-1,D5          | last_off = -1                          
	                                                                                 
	| init d0 with high bit set                                                      
	||move.b  #$80,d0               | init d0.b for FILLBYTES                        
	                moveq   #-128,D0        | d0.b = $80                             
	                bra.s   decompr_start                                            
	                                                                                 
	                                                                                 
	| ------------- DECOMPRESSION -------------                                      
	                                                                                 
	decompr_literal:                                                                 
	                move.b  (A0)+,(A1)+                                              
	                                                                                 
	decompr_start:                                                                   
	decompr_loop:                                                                    
	| optimization: carry is clear -> we know that bits are available                
	|   cost literal:   4 +  8 + 10                                                  
	|   cost match:     4 + 10                                                       
	|   cost fillbits:  4 +  8 +  8                                                  
	                add.b   D0,D0                                                    
	                bcc.s   decompr_match                                            
	                bne.s   decompr_literal                                          
	                move.b  (A0)+,D0                                                 
	                addx.b  D0,D0                                                    
	                bcs.s   decompr_literal                                          
	                                                                                 
	                                                                                 
	decompr_match:                                                                   
	                moveq   #1,D1                                                    
	                moveq   #0,D2                                                    
	decompr_l1:                                                                      
	                add.b   D0,D0                                                    
	                bne.s   _l00                                                     
	                move.b  (A0)+,D0                                                 
	                addx.b  D0,D0                                                    
	_l00:                                                                            
	                addx.w  D1,D1                                                    
	| optimization: carry is clear -> we know that bits are available                
	|   cost loop continue:  4 + 10                                                  
	|   cost loop break:    4 +  8 + 10                                              
	|   cost fillbits:      4 +  8 +  8                                              
	                add.b   D0,D0                                                    
	                bcc.s   Lcon0                                                    
	                bne.s   decompr_break1                                           
	                move.b  (A0)+,D0                                                 
	                addx.b  D0,D0                                                    
	                bcs.s   decompr_break1                                           
	Lcon0:                                                                           
	                subq.w  #1,D1                                                    
	                add.b   D0,D0                                                    
	                bne.s   _l01                                                     
	                move.b  (A0)+,D0                                                 
	                addx.b  D0,D0                                                    
	_l01:                                                                            
	                addx.w  D1,D1                                                    
	                bpl.s   decompr_l1                                               
	                bra.s   decompr_end                                              
	decompr_break1:                                                                  
	                subq.w  #3,D1                                                    
	                bcs.s   decompr_prev_dist | last m_off                           
	                lsl.l   #8,D1                                                    
	                move.b  (A0)+,D1                                                 
	                not.l   D1                                                       
	                asr.l   #1,D1                                                    
	                bcc.s   decompr_get_mlen2                                        
	                                                                                 
	decompr_get_mlen1:                                                               
	                add.b   D0,D0                                                    
	                bne.s   _l02                                                     
	                move.b  (A0)+,D0                                                 
	                addx.b  D0,D0                                                    
	_l02:                                                                            
	                addx.w  D2,D2                                                    
	                bra.s   decompr_got_mlen                                         
	decompr_prev_dist:                                                               
	                move.l  D5,D1                                                    
	                add.b   D0,D0                                                    
	                bne.s   _l03                                                     
	                move.b  (A0)+,D0                                                 
	                addx.b  D0,D0                                                    
	_l03:                                                                            
	                bcs.s   decompr_get_mlen1                                        
	decompr_get_mlen2:                                                               
	                addq.w  #1,D2                                                    
	                add.b   D0,D0                                                    
	                bne.s   _l04                                                     
	                move.b  (A0)+,D0                                                 
	                addx.b  D0,D0                                                    
	_l04:                                                                            
	                bcs.s   decompr_get_mlen1                                        
	                                                                                 
	decompr_l2:                                                                      
	                add.b   D0,D0                                                    
	                bne.s   _l05                                                     
	                move.b  (A0)+,D0                                                 
	                addx.b  D0,D0                                                    
	_l05:                                                                            
	                addx.w  D2,D2                                                    
	| optimization: carry is clear -> we know that bits are available                
	|   cost loop continue:  4 + 10                                                  
	|   cost loop break:    4 +  8 + 10                                              
	|   cost fillbits:      4 +  8 +  8                                              
	                add.b   D0,D0                                                    
	                bcc.s   decompr_l2                                               
	                bne.s   Lbreak0                                                  
	                move.b  (A0)+,D0                                                 
	                addx.b  D0,D0                                                    
	                bcc.s   decompr_l2                                               
	Lbreak0:                                                                         
	                addq.w  #2,D2                                                    
	                                                                                 
	                                                                                 
	                                                                                 
	decompr_got_mlen:                                                                
	                move.l  D1,D5                                                    
	                lea     0(A1,D1.l),A3                                            
	                                                                                 
	| must use sub as cmp doesn't affect the X flag                                  
	                sub.l   D6,D1                                                    
	                addx.w  D7,D2                                                    
	                                                                                 
	| TODO: partly unroll this loop; could use some magic with d7 for address        
	|       computations, then compute a nice `jmp yyy(pc,dx.w)'                     
	                                                                                 
	|   cost for any m_len:   12 + 22 * (m_len - 1) + 4                              
	|     38, 60, 82, 104, 126, 148, 170, 192, 214, 236                              
	                move.b  (A3)+,(A1)+     | 12                                     
	Lcopy0:         move.b  (A3)+,(A1)+     | 12                                     
	                dbra    D2,Lcopy0       | 10 / 14                                
	                                                                                 
	                bra     decompr_loop                                             
	decompr_end:                                                                     
	                |rts                                                             
	                movem.l (sp)+,d0-d7/a0-a6                                        
	| vi:ts=8:et                                                                     
	
| 0 "" 2
#NO_APP
	unlk %fp
	rts
	.even
	.globl	powabzap
powabzap:
	link.w %fp,#0
#APP
| 496 "basic_functions.c" 1
		movem.l d0/d1/a0,-(sp)
	|movem.l 8(a6),d0/d1/d2/a0
	|move.l %d0,%d3 |multiply by 188, courtesy of gcc
	|add.l %d3,%d3  |(nope, not checking if there's a faster way, suck it up :P
	|add.l %d0,%d3
	|lsl.l #4,%d3
	|sub.l %d0,%d3
	|add.l %d3,%d3
	|add.l %d3,%d3
	|add.l d1,d3
	|lea raptor_liststart,a1
	|lea (a1,d3.l),a1
	|subq.l #1,d2 |no of iterations-1 for dbra
|powaloop2:	 move.l (a0)+,d3 
	|add.l d3,(a1) 
	|lea 188(a1),a1
	|dbra d2,powaloop2
	move.l 8(%fp),%a0
	move.l %a0,%d0
	add.l %a0,%d0
	add.l %a0,%d0
	lsl.l #4,%d0
	sub.l %a0,%d0
	add.l %d0,%d0
	add.l %d0,%d0
	add.l 12(%fp),%d0
	move.l raptor_liststart,%a0
	lea (a0,d0.l),a0
	move.l 20(a6),d0
	move.l 16(a6),d1
	subq.w #1,d1
	move.l 24(a6),d2
	powaloop6:
	move.l d0,(a0)
	add.l d2,a0
	dbra d1,powaloop6
	movem.l (sp)+,d0/d1/a0
	
| 0 "" 2
#NO_APP
	unlk %fp
	rts
	.even
	.globl	powabdiff
powabdiff:
	link.w %fp,#0
#APP
| 537 "basic_functions.c" 1
		movem.l d0/d1/d2/a0/a1,-(sp)
	|movem.l 8(a6),d0/d1/d2/a0
	|move.l %d0,%d3 |multiply by 188, courtesy of gcc
	|add.l %d3,%d3  |(nope, not checking if there's a faster way, suck it up :P
	|add.l %d0,%d3
	|lsl.l #4,%d3
	|sub.l %d0,%d3
	|add.l %d3,%d3
	|add.l %d3,%d3
	|add.l d1,d3
	|lea raptor_liststart,a1
	|lea (a1,d3.l),a1
	|subq.l #1,d2 |no of iterations-1 for dbra
|powaloop2:	 move.l (a0)+,d3 
	|add.l d3,(a1) 
	|lea 188(a1),a1
	|dbra d2,powaloop2
	move.l 8(%fp),%a0
	move.l %a0,%d0
	add.l %a0,%d0
	add.l %a0,%d0
	lsl.l #4,%d0
	sub.l %a0,%d0
	add.l %d0,%d0
	add.l %d0,%d0
	add.l 12(%fp),%d0
	move.l raptor_liststart,%a0
	lea (a0,d0.l),a0
	move.l 20(a6),a1
	move.l 16(a6),d1
	subq.w #1,d1
	move.l 24(a6),d0
	powaloop5:	move.l (a1)+,d2
	add.l d2,(a0)
	add.l d0,a0
	dbra d1,powaloop5
	movem.l (sp)+,d0/d1/d2/a0/a1
	
| 0 "" 2
#NO_APP
	unlk %fp
	rts
	.even
	.globl	powabset
powabset:
	link.w %fp,#0
#APP
| 578 "basic_functions.c" 1
		movem.l d0/d1/a0/a1,-(sp)
	|movem.l 8(a6),d0/d1/d2/a0
	||move.l %d0,%d3 |multiply by 188, courtesy of gcc
	||add.l %d3,%d3  |(nope, not checking if there's a faster way, suck it up :P
	||add.l %d0,%d3
	||lsl.l #4,%d3
	||sub.l %d0,%d3
	||add.l %d3,%d3
	||add.l %d3,%d3
	|mulu #188,d0
	|add.l d1,d0
	|lea raptor_liststart,a1
	|lea (a1,d0.l),a1
	||subq.l #1,d2 |no of iterations-1 for dbra
||powaloop:	 move.l (a0)+,(a1) 
	||lea 188(a1),a1
	||dbra d2,powaloop
	|move.l (a0),(a1)
	move.l 8(%fp),%a0
	move.l %a0,%d0
	add.l %a0,%d0
	add.l %a0,%d0
	lsl.l #4,%d0
	sub.l %a0,%d0
	add.l %d0,%d0
	add.l %d0,%d0
	add.l 12(%fp),%d0
	move.l raptor_liststart,%a0
	add.l d0,a0
	move.l 20(a6),a1
	move.l 16(a6),d1
	subq.w #1,d1
	move.l 24(a6),d0
	|move.l (a1),(%a0,%d0.l)
	powaloop4:	move.l (a1)+,(a0)
	add.l d0,a0
	dbra d1,powaloop4
	movem.l (sp)+,d0/d1/a0/a1
	
| 0 "" 2
#NO_APP
	unlk %fp
	rts
	.even
	.globl	powazap
powazap:
	link.w %fp,#0
#APP
| 621 "basic_functions.c" 1
		movem.l d0/d1/a0,-(sp)
	|movem.l 8(a6),d0/d1/d2/a0
	|move.l %d0,%d3 |multiply by 188, courtesy of gcc
	|add.l %d3,%d3  |(nope, not checking if there's a faster way, suck it up :P
	|add.l %d0,%d3
	|lsl.l #4,%d3
	|sub.l %d0,%d3
	|add.l %d3,%d3
	|add.l %d3,%d3
	|add.l d1,d3
	|lea raptor_liststart,a1
	|lea (a1,d3.l),a1
	|subq.l #1,d2 |no of iterations-1 for dbra
|powaloop2:	 move.l (a0)+,d3 
	|add.l d3,(a1) 
	|lea 188(a1),a1
	|dbra d2,powaloop2
	move.l 8(%fp),%a0
	move.l %a0,%d0
	add.l %a0,%d0
	add.l %a0,%d0
	lsl.l #4,%d0
	sub.l %a0,%d0
	add.l %d0,%d0
	add.l %d0,%d0
	add.l 12(%fp),%d0
	move.l raptor_liststart,%a0
	lea (a0,d0.l),a0
	move.l 20(a6),d0
	move.l 16(a6),d1
	subq.w #1,d1
	powaloop3:
	move.l d0,(a0)
	lea 188(a0),a0
	dbra d1,powaloop3
	movem.l (sp)+,d0/d1/a0
	
| 0 "" 2
#NO_APP
	unlk %fp
	rts
	.even
	.globl	powadiff
powadiff:
	link.w %fp,#0
#APP
| 661 "basic_functions.c" 1
		movem.l d0/d1/d2/d3/a0/a1,-(sp)
	|movem.l 8(a6),d0/d1/d2/a0
	|move.l %d0,%d3 |multiply by 188, courtesy of gcc
	|add.l %d3,%d3  |(nope, not checking if there's a faster way, suck it up :P
	|add.l %d0,%d3
	|lsl.l #4,%d3
	|sub.l %d0,%d3
	|add.l %d3,%d3
	|add.l %d3,%d3
	|add.l d1,d3
	|lea raptor_liststart,a1
	|lea (a1,d3.l),a1
	|subq.l #1,d2 |no of iterations-1 for dbra
|powaloop2:	 move.l (a0)+,d3 
	|add.l d3,(a1) 
	|lea 188(a1),a1
	|dbra d2,powaloop2
	move.l 8(%fp),%a0
	move.l %a0,%d0
	add.l %a0,%d0
	add.l %a0,%d0
	lsl.l #4,%d0
	sub.l %a0,%d0
	add.l %d0,%d0
	add.l %d0,%d0
	add.l 12(%fp),%d0
	move.l raptor_liststart,%a0
	lea (a0,d0.l),a0
	move.l 20(a6),a1
	move.l 16(a6),d1
	subq.w #1,d1
	powaloop2:	move.l (a1)+,d3
	add.l d3,(a0)
	lea 188(a0),a0
	dbra d1,powaloop2
	movem.l (sp)+,d0/d1/d2/d3/a0/a1
	
| 0 "" 2
#NO_APP
	unlk %fp
	rts
	.even
	.globl	powaset
powaset:
	link.w %fp,#0
#APP
| 701 "basic_functions.c" 1
		movem.l d0/d1/d2/d3/a0/a1,-(sp)
	|movem.l 8(a6),d0/d1/d2/a0
	||move.l %d0,%d3 |multiply by 188, courtesy of gcc
	||add.l %d3,%d3  |(nope, not checking if there's a faster way, suck it up :P
	||add.l %d0,%d3
	||lsl.l #4,%d3
	||sub.l %d0,%d3
	||add.l %d3,%d3
	||add.l %d3,%d3
	|mulu #188,d0
	|add.l d1,d0
	|lea raptor_liststart,a1
	|lea (a1,d0.l),a1
	||subq.l #1,d2 |no of iterations-1 for dbra
||powaloop:	 move.l (a0)+,(a1) 
	||lea 188(a1),a1
	||dbra d2,powaloop
	|move.l (a0),(a1)
	move.l 8(%fp),%a0
	move.l %a0,%d0
	add.l %a0,%d0
	add.l %a0,%d0
	lsl.l #4,%d0
	sub.l %a0,%d0
	add.l %d0,%d0
	add.l %d0,%d0
	add.l 12(%fp),%d0
	move.l raptor_liststart,%a0
	lea (a0,d0.l),a0
	move.l 20(a6),a1
	move.l 16(a6),d1
	subq.w #1,d1
	|move.l (a1),(%a0,%d0.l)
	powaloop:	move.l (a1)+,(a0)
	lea 188(a0),a0
	dbra d1,powaloop
	movem.l (sp)+,d0/d1/d2/d3/a0/a1
	
| 0 "" 2
#NO_APP
	unlk %fp
	rts
	.even
	.globl	bin2asc
bin2asc:
	link.w %fp,#0
#APP
| 743 "basic_functions.c" 1
		movem.l d1/d4/a0,-(sp)
	movem.l 8(a6),d1/d4/a0
	jsr RAPTOR_HEXtoDEC
	clr.b 1(a0,d4.w)    |hex2dec expects digits-1 in d4 and we want to zero out the byte after the last digit
	movem.l (sp)+,d1/d4/a0
	
| 0 "" 2
#NO_APP
	unlk %fp
	rts
	.even
	.globl	RBRA
RBRA:
	link.w %fp,#0
#APP
| 752 "basic_functions.c" 1
		movem.l d0-d3/a6,-(sp) |lolol
	movem.l 8(a6),d0-d3
	jsr RAPTOR_setup_object_bra
	movem.l (sp)+,d0-d3/a6    |lolol
	
| 0 "" 2
#NO_APP
	unlk %fp
	rts
	.even
	.globl	ZEROPAD
ZEROPAD:
	link.w %fp,#0
#APP
| 760 "basic_functions.c" 1
		movem.l d0-d4,-(sp)
	jsr Input_Read
	movem.l d0-d4,zero_left_pad
	movm.l (sp)+,d0-d4
	
| 0 "" 2
#NO_APP
	unlk %fp
	rts
	.even
	.globl	hiscore_check
hiscore_check:
	link.w %fp,#0
#APP
| 768 "basic_functions.c" 1
		move.l 8(a6),d0
	move.l 12(a6),a0
	movem.l d1/d2/d3/d4/d5/d6/d7/a1/a2/a3/a4/a5,-(sp)
	move.l 16(a6),d1
	jsr RAPTOR_chk_highscores
	move.l d7,position_in_highscore
	movem.l (sp)+,d1/d2/d3/d4/d5/d6/d7/a1/a2/a3/a4/a5
	
| 0 "" 2
#NO_APP
	unlk %fp
	rts
	.even
	.globl	SNDZEROPLAY
SNDZEROPLAY:
	link.w %fp,#0
#APP
| 779 "basic_functions.c" 1
	movem.l d0/a0/d1/d2/d3,-(a7)
	move.l 8(a6),d0
	move.l 12(a6),a0
	move.l 16(a6),d1
	move.l 20(a6),d2
	move.l 24(a6),d3
	jsr        Audio_Play
	movem.l (sp)+,d0/a0/d1/d2/d3
| 0 "" 2
#NO_APP
	unlk %fp
	rts
	.even
	.globl	fadesingle
fadesingle:
	link.w %fp,#0
#APP
| 792 "basic_functions.c" 1
		move.l d1,-(a7)
	move.w 10(a6),d1
	move.w 8(a6),d0
	jsr RAPTOR_fade_clutindex
	move.l (a7)+,d1
| 0 "" 2
#NO_APP
	unlk %fp
	rts
	.even
	.globl	fadepal
fadepal:
	link.w %fp,#0
#APP
| 801 "basic_functions.c" 1
		movem.l d7/a1,-(a7)
	move.l 16(a6),a1
	move.l 12(a6),d7
	move.l 8(a6),d0
	jsr RAPTOR_fade_clut
	movem.l (a7)+,d7/a1
| 0 "" 2
#NO_APP
	unlk %fp
	rts
	.even
	.globl	loadclut
loadclut:
	link.w %fp,#0
	movem.l #16480,-(%sp)
	move.w 14(%fp),%a1
	move.w 18(%fp),%d0
	jle .L42
	move.w %a1,%a1
	add.l #491552,%a1
	move.l %a1,%d1
	lsl.l #5,%d1
	move.l %d1,%a1
	move.l 8(%fp),%a2
	subq.w #1,%d0
	lea (2,%a1),%a0
	and.l #65535,%d0
	add.l %d0,%d0
	add.l %a0,%d0
	move.w (%a2)+,(%a1)
	move.l %a0,%a1
	cmp.l %a0,%d0
	jeq .L42
.L47:
	addq.l #2,%a0
	move.w (%a2)+,(%a1)
	move.l %a0,%a1
	cmp.l %a0,%d0
	jne .L47
.L42:
	movem.l (%sp)+,#1538
	unlk %fp
	rts
	.even
	.globl	SNDKILL
SNDKILL:
	link.w %fp,#0
	move.l %d1,-(%sp)
	move.l 8(%fp),%d0
	lea _U235_commands,%a0
	lsl.l #4,%d0
	moveq #1,%d1
	or.l %d0,%d1
	move.l %d1,(%a0)
	move.l %a0,U235SE_sfxplaylist_ptr
	move.l (%sp)+,%d1
	unlk %fp
	rts
	.even
	.globl	SNDDELTA
SNDDELTA:
	link.w %fp,#0
	move.l %d2,-(%sp)
	move.l %d1,-(%sp)
	move.l 12(%fp),%d1
	lea _U235_commands,%a0
	move.l %d1,%d0
	lsl.l #8,%d0
	move.l 8(%fp),%d2
	lsl.l %d2,%d1
	or.l %d1,%d0
	moveq #3,%d1
	or.l %d0,%d1
	move.l %d1,(%a0)
	move.l %a0,U235SE_sfxplaylist_ptr
	move.l (%sp)+,%d1
	move.l (%sp)+,%d2
	unlk %fp
	rts
	.even
	.globl	SNDFREQ
SNDFREQ:
	link.w %fp,#0
	move.l %d2,-(%sp)
	move.l %d1,-(%sp)
	move.l 8(%fp),%d0
	move.l 12(%fp),%d1
	lea _U235_commands,%a0
	lsl.l #4,%d0
	moveq #7,%d2
	or.l %d2,%d0
	swap %d1
	clr.w %d1
	or.l %d1,%d0
	move.l %d0,(%a0)
	move.l %a0,U235SE_sfxplaylist_ptr
	move.l (%sp)+,%d1
	move.l (%sp)+,%d2
	unlk %fp
	rts
	.even
	.globl	SNDPLAYFREQ
SNDPLAYFREQ:
	link.w %fp,#0
	movem.l #28672,-(%sp)
	move.l 8(%fp),%d0
	move.l 12(%fp),%d2
	move.l 16(%fp),%d1
	lea _U235_commands,%a0
	lsl.l #4,%d0
	moveq #4,%d3
	or.l %d3,%d0
	lsl.l #8,%d2
	or.l %d2,%d0
	swap %d1
	clr.w %d1
	or.l %d1,%d0
	move.l %d0,(%a0)
	move.l %a0,U235SE_sfxplaylist_ptr
	movem.l (%sp)+,#14
	unlk %fp
	rts
	.even
	.globl	SNDVOLRESET
SNDVOLRESET:
	link.w %fp,#0
	move.l %d1,-(%sp)
	move.l 8(%fp),%d0
	lea _U235_commands,%a0
	lsl.l #4,%d0
	moveq #8,%d1
	or.l %d0,%d1
	move.l %d1,(%a0)
	move.l %a0,U235SE_sfxplaylist_ptr
	move.l (%sp)+,%d1
	unlk %fp
	rts
	.even
	.globl	_plot
_plot:
	link.w %fp,#0
#APP
| 850 "basic_functions.c" 1
	movem.l   d0-d4/a0,-(a6)
	           move.l  8(a7),d0
	           move.l  12(a7),d1
	           move.b  _plot_colour,d2
	           moveq   #15,d4
	           btst    #0,d0
	           beq.s   plot_even
	           lsr.b   #4,d2
	           moveq   #-16,d4
	plot_even: asr.w   #1,d0
	           lea     RAPTOR_particle_gfx,a0
	           add.w   d0,a0
	           move.w  d1,d3
	           asl.w   #5,d3
	           asl.w   #7,d1
	           add.w   d1,a0
	           add.w   d3,a0
	           and.b   d4,(a0)
	           or.b    d2,(a0)
	           movem.l (a6)+,d0-d4/a0
| 0 "" 2
#NO_APP
	unlk %fp
	rts
	.even
	.globl	_GETPAD
_GETPAD:
	link.w %fp,#0
	move.l %d1,-(%sp)
	move.l 8(%fp),%d0
	moveq #1,%d1
	cmp.l %d0,%d1
	jeq .L60
	moveq #2,%d1
	cmp.l %d0,%d1
	jeq .L61
	moveq #0,%d0
	move.l (%sp)+,%d1
	unlk %fp
	rts
.L61:
	move.l U235SE_pad2,%d0
	move.l (%sp)+,%d1
	unlk %fp
	rts
.L60:
	move.l U235SE_pad1,%d0
	move.l (%sp)+,%d1
	unlk %fp
	rts
	.even
	.globl	_RSETLIST
_RSETLIST:
	link.w %fp,#0
#APP
| 885 "basic_functions.c" 1
	movem.l   d0-d7/a0-a6,-(a7)
	           move.l 8+60(sp),d0
	           jsr     RAPTOR_setlist
	           movem.l (a7)+,d0-d7/a0-a6
| 0 "" 2
#NO_APP
	unlk %fp
	rts
	.even
	.globl	_RHIT
_RHIT:
	link.w %fp,#0
#APP
| 893 "basic_functions.c" 1
	  movem.l d1-d7/a0-a6,-(a7)
| 0 "" 2
#NO_APP
	moveq #0,%d0
	move.l %d0,raptor_result
	move.l 8(%fp),raptor_sourcel
	move.l 12(%fp),raptor_sourceh
	move.l 16(%fp),raptor_targetl
	move.l 20(%fp),raptor_targeth
#APP
| 899 "basic_functions.c" 1
	  lea     RAPTOR_GPU_COLLISION,a0
| 0 "" 2
| 900 "basic_functions.c" 1
	  jsr     RAPTOR_call_GPU_code
| 0 "" 2
| 901 "basic_functions.c" 1
	  movem.l (a7)+,d1-d7/a0-a6
| 0 "" 2
#NO_APP
	move.l raptor_result,%d0
	unlk %fp
	rts
	.even
	.globl	_RSETOBJ
_RSETOBJ:
	link.w %fp,#0
	move.l 8(%fp),%a0
	move.l %a0,%d0
	add.l %a0,%d0
	add.l %a0,%d0
	lsl.l #4,%d0
	sub.l %a0,%d0
	add.l %d0,%d0
	add.l %d0,%d0
	add.l 12(%fp),%d0
	move.l raptor_liststart,%a0
	move.l 16(%fp),(%a0,%d0.l)
	unlk %fp
	rts
	.even
	.globl	_RGETOBJ
_RGETOBJ:
	link.w %fp,#0
	move.l 8(%fp),%a0
	move.l %a0,%d0
	add.l %a0,%d0
	add.l %a0,%d0
	lsl.l #4,%d0
	sub.l %a0,%d0
	add.l %d0,%d0
	add.l %d0,%d0
	add.l 12(%fp),%d0
	move.l raptor_liststart,%a0
	move.l (%a0,%d0.l),%d0
	unlk %fp
	rts
	.even
	.globl	_RUPDALL
_RUPDALL:
	link.w %fp,#0
	move.l %d1,-(%sp)
	move.l 8(%fp),%d0
	jne .L68
	move.b #4,%d0
	cmp.l RUPDALL_FLAG.l,%d0
	jeq .L69
#APP
| 927 "basic_functions.c" 1
		movem.l d0-d7/a0-a6,-(a7)
	jsr        RAPTOR_wait_frame_UPDATE_ALL
	movem.l    (a7)+,d0-d7/a0-a6
| 0 "" 2
#NO_APP
.L67:
	move.l -4(%fp),%d1
	unlk %fp
	rts
.L68:
	move.l 8(%fp),%d0
	moveq #1,%d1
	cmp.l %d0,%d1
	jeq .L73
	move.l 8(%fp),%d0
	moveq #2,%d1
	cmp.l %d0,%d1
	jne .L67
	clr.l RUPDALL_FLAG
	move.l -4(%fp),%d1
	unlk %fp
	rts
.L73:
	moveq #4,%d0
	move.l %d0,RUPDALL_FLAG
	move.l -4(%fp),%d1
	unlk %fp
	rts
.L69:
	jsr RAPTOR_wait_frame
	clr.l RUPDALL_FLAG
	move.l -4(%fp),%d1
	unlk %fp
	rts
	.even
	.globl	delay
delay:
	link.w %fp,#0
	movem.l #16480,-(%sp)
	move.l 8(%fp),%a1
	cmp.w #0,%a1
	jle .L75
	moveq #0,%d1
	lea _RUPDALL,%a2
.L77:
	clr.l -(%sp)
	jsr (%a2)
	addq.l #1,%d1
	addq.l #4,%sp
	cmp.l %d1,%a1
	jne .L77
.L75:
	movem.l -12(%fp),#1538
	unlk %fp
	rts
	.even
	.globl	_MODPLAY
_MODPLAY:
	link.w %fp,#0
	tst.l 8(%fp)
	jlt .L82
#APP
| 954 "basic_functions.c" 1
	move.l 8(a6),a0
	jsr RAPTOR_U235setmodule
	jsr RAPTOR_U235gomodule_stereo
| 0 "" 2
#NO_APP
	unlk %fp
	rts
.L82:
	unlk %fp
	jra RAPTOR_U235stopmodule
	.even
	.globl	_SNDPLAY
_SNDPLAY:
	link.w %fp,#-8
	move.l 8(%fp),-8(%fp)
	move.l 12(%fp),-4(%fp)
#APP
| 969 "basic_functions.c" 1
		move.l 8(a6),d0
	move.l 12(a6),d1
	|movem.l d2-d7/a0-a5,-(sp)
	|move.l d2,-(sp)
	|jsr RAPTOR_U235playsample
	lea RAPTOR_Version,a0
	lea U235SE_sfxplaylist_ptr,a1
	moveq #0,d0
	move.l d0,-(a0)
	rol.w #4,d1
	eor.l #0x3e800004,d1
	rol.w #8,d0
	or.w d0,d1
	move.l d1,-(a0)
	move.l raptor_samplebank_ptr,d0
	lsl.l #4,d0
	or.w #0xb,d0
	move.l d0,-(a0)
	move.l a0,(a1)
	||move.l #((RAPTOR_samplebank<<4)+0xb),(a0)+
	|move.l raptor_samplebank_ptr,d2
	|lsl.l #4,d2
	|or.w #0xb,d2
	|move.l d2,(a0)+
	|rol.w #4,d1
	|eor.l #0x3e800004,d1
	|rol.w #8,d0
	|or.w d0,d1
	|move.l d1,(a0)+
	|moveq #0,d0
	|move.l d0,(a0)
	|move.l #raptor_playlist,(a1)
	|move.l (sp)+,d2
	|movem.l (sp)+,d2-d7/a0-a5
| 0 "" 2
#NO_APP
	unlk %fp
	rts
	.even
	.globl	_MODVOL
_MODVOL:
	link.w %fp,#0
	move.l 8(%fp),U235SE_music_vol
	unlk %fp
	rts
	.even
	.globl	_SNDVOL
_SNDVOL:
	link.w %fp,#0
	move.l 8(%fp),U235SE_sfx_vol
	unlk %fp
	rts
	.even
	.globl	_RPARTI
_RPARTI:
	link.w %fp,#0
	moveq #12,%d0
	add.l 8(%fp),%d0
	move.l %d0,raptor_part_inject_addr
#APP
| 1022 "basic_functions.c" 1
	movem.l   d0-a6,-(a7)
	lea        RAPTOR_particle_injection_GPU,a0
	jsr    RAPTOR_call_GPU_code
	movem.l    (a7)+,d0-a6
| 0 "" 2
#NO_APP
	unlk %fp
	rts
	.even
	.globl	_RSETMAP
_RSETMAP:
	link.w %fp,#0
	move.l 8(%fp),raptor_map_position_x
	move.l 12(%fp),raptor_map_position_y
#APP
| 1032 "basic_functions.c" 1
	  movem.l d0-d7/a0-a6,-(a7)
	jsr        RAPTOR_map_set_position
	movem.l    (a7)+,d0-d7/a0-a6
| 0 "" 2
#NO_APP
	unlk %fp
	rts
	.even
	.globl	_RLOCATE
_RLOCATE:
	link.w %fp,#0
	move.l 8(%fp),_basic_r_xpos
	move.l 12(%fp),_basic_r_ypos
	unlk %fp
	rts
	.even
	.globl	_RPRINT
_RPRINT:
	link.w %fp,#0
#APP
| 1046 "basic_functions.c" 1
	movem.l   d0-d7/a0-a6,-(a7)
	move.l   _basic_r_xpos,d0
	move.l   _basic_r_ypos,d1
	move.l   _basic_r_size,d2
	move.l   _basic_r_indx,d3
	move.l   _basic_r_buffer,a0
	jsr      RAPTOR_print
	movem.l  (a7)+,d0-d7/a0-a6
	
| 0 "" 2
#NO_APP
	unlk %fp
	rts
	.even
	.globl	_cls
_cls:
	link.w %fp,#0
#APP
| 1059 "basic_functions.c" 1
	movem.l d0/d1/a0,-(a7)
	              lea RAPTOR_particle_gfx,a0
	              move.l raptor_partbuf_x,d0
	              move.l raptor_partbuf_y,d1
	              mulu d1,d0
	              lsr.l #3,d0
	              subq.w #1,d0
	              |used to be: move.w #(320*240)/2/4-1,d0
	              moveq #0,d1
	clr_loop:     move.l d1,(a0)+
	              dbra d0,clr_loop
	              movem.l (a7)+,d0/d1/a0
	
| 0 "" 2
#NO_APP
	unlk %fp
	rts
	.globl	position_in_highscore
	.bss
	.even
position_in_highscore:
	.skip 4
	.globl	zero_left_pad
	.even
zero_left_pad:
	.skip 4
	.globl	zero_right_pad
	.even
zero_right_pad:
	.skip 4
	.globl	zero_mousex_delta
	.even
zero_mousex_delta:
	.skip 4
	.globl	zero_mousey_delta
	.even
zero_mousey_delta:
	.skip 4
	.globl	zero_rotary_delta
	.even
zero_rotary_delta:
	.skip 4
	.globl	_basic_r_indx
	.even
_basic_r_indx:
	.skip 4
	.globl	_basic_r_size
	.even
_basic_r_size:
	.skip 4
	.globl	_basic_r_ypos
	.even
_basic_r_ypos:
	.skip 4
	.globl	_basic_r_xpos
	.even
_basic_r_xpos:
	.skip 4
	.globl	_xcpt
	.even
_xcpt:
	.skip 32
	.globl	_basic_r_buffer
	.even
_basic_r_buffer:
	.skip 4
	.globl	_yt2
	.even
_yt2:
	.skip 8
	.globl	_y
	.even
_y:
	.skip 8
	.globl	_errno
	.even
_errno:
	.skip 4
	.globl	_plot_colour
_plot_colour:
	.skip 1
.comm rlist,4
.lcomm _U235_commands,8
