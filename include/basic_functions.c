// C++
#if defined( __cplusplus )
  #define overloaded
  #define C_EXPORT EXTERN_C __declspec(dllexport)
  #define C_IMPORT EXTERN_C __declspec(dllimport)
#else
  #define C_EXPORT __declspec(dllexport)
  #define C_IMPORT __declspec(dllimport)
#endif

#include <ctype.h>
#include <math.h>
#include <stdio.h>
#include <string.h>
#include <stddef.h>
#include <stdlib.h>
#include <setjmp.h>
#include <time.h>
#include <stdarg.h>
#include <process.h>
#include "raptor.h"

//
// Function declarations, variables and externs
//

void basicmain() asm ("__Z9basicmainv"); //main function declaration
void colour();
void delay(int x) asm("delay");
int GETPAD(int pad);
void RSETLIST(int list_index);
void RSETOBJ(int spr_index, int offset, int value);
int RGETOBJ(int spr_index, int offset);
int RHIT(int r_sl, int r_sh, int r_tl, int r_th);
void RUPDALL(volatile int update);
void MODPLAY(int module);
void SNDPLAY(int sampleno, int channel);
void RPARTI(int *fx);
void RSETMAP(int x,int y);
void SNDKILL(int v) asm("SNDKILL");
void SNDDELTA(int v,int x) asm("SNDDELTA");
void SNDFREQ(int v,int y) asm("SNDFREQ");
void SNDVOLRESET(int v) asm("SNDVOLRESET");
void SNDPLAYFREQ(int v,int x,int y) asm("SNDPLAYFREQ");
void loadclut(unsigned short *paladdress, short target_clut, short no_of_indices) asm("loadclut");
int fadepal(int clut_no,int fade_cols,int *palette) asm("fadepal");
int fadesingle(short clut_index,short target_col) asm("fadesingle");
extern int U235SE_pad1 asm ("U235SE_pad1");
extern int U235SE_pad2 asm ("U235SE_pad2");
extern int U235SE_music_vol asm ("U235SE_music_vol");
extern int U235SE_sfx_vol asm ("U235SE_sfx_vol");
extern void *RAPTOR_sprite_table asm ("RAPTOR_sprite_table");
extern void *raptor_liststart asm ("raptor_liststart");
extern void *pixel_list asm ("pixel_list");
extern void *raptor_part_inject_addr asm ("raptor_part_inject_addr");
extern int raptor_map_position_x asm ("raptor_map_position_x");
extern int raptor_map_position_y asm ("raptor_map_position_y");
extern void RAPTOR_GPU_COLLISION() asm ("RAPTOR_GPU_COLLISION");
volatile extern int raptor_result asm ("raptor_result");
extern int raptor_sourcel asm ("raptor_sourcel");
extern int raptor_sourceh asm ("raptor_sourceh");
extern int raptor_targetl asm ("raptor_targetl");
extern int raptor_targeth asm ("raptor_targeth");
extern void *RAPTOR_module_list asm ("RAPTOR_module_list");
extern void *RAPTOR_U235setmodule() asm ("RAPTOR_U235setmodule");
extern void *RAPTOR_U235gomodule_stereo() asm ("RAPTOR_U235gomodule_stereo");
extern void *RAPTOR_U235playsample() asm ("RAPTOR_U235playsample");
extern void *RAPTOR_U235stopmodule() asm ("RAPTOR_U235stopmodule");
extern void RAPTOR_wait_frame() asm ("RAPTOR_wait_frame");
extern int RUPDALL_FLAG asm ("RUPDALL_FLAG");
extern void Audio_Play() asm ("Audio_Play");
void SNDZEROPLAY(int channel, void *sound_address, int sample_size, int sample_divider, int play_command) asm("SNDZEROPLAY");
short hiscore_check(int score, char *name, int table) asm("hiscore_check");
extern void ZEROPAD() asm("ZEROPAD");
extern void Input_Read() asm("Input_Read");
extern void powaset(int spr_index, int offset, int no_of_times, void *array_of_values) asm("powaset");
extern void powadiff(int spr_index, int offset, int no_of_times, void *array_of_values) asm("powadiff");
extern void powazap(int spr_index, int offset, int no_of_times, int value) asm("powazap");
extern void powabset(int spr_index, int offset, int no_of_times, void *array_of_values, int skip_offset) asm("powabset");
extern void powabdiff(int spr_index, int offset, int no_of_times, void *array_of_values, int skip_offset) asm("powabdiff");
extern void powabzap(int spr_index, int offset, int no_of_times, int value, int skip_offset) asm("powabzap");
extern void powaunpack(int source, int destination) asm("powaunpack");
extern void rbsort(void *base,size_t nmemb) asm("rbsort");
extern void RAPTOR_blitter() asm("RAPTOR_blitter");
extern void powablitlist(void *blitlist) asm("powablitlist");
extern int powaeeprom(int readwrite, void *buffer) asm ("powaeeprom");
extern void fullpowablitlist(void *blitlist) asm("fullpowablitlist");
extern void RAPTOR_blitter_full() asm("RAPTOR_blitter_full");
void hiscore_sort(int table_to_sort) asm("hiscore_sort");
//extern int RAPTOR_samplebank asm ("RAPTOR_samplebank");
extern int raptor_playlist asm("raptor_playlist");
extern int RAPTOR_Version asm("RAPTOR_Version");

unsigned char plot_colour=0;
int errno=0; //needed by some libc/libm functions
double y=0; //needed by some libc/libm functions
double yt2=0; //needed by some libc/libm functions
char *basic_r_buffer=(char *)0;
struct exception xcpt={0,0,0,0,0}; //needed by some libc/libm functions
volatile int basic_r_xpos=0;
volatile int basic_r_ypos=0;
int basic_r_size=0;
int basic_r_indx=0;
extern unsigned int *U235SE_sfxplaylist_ptr asm ("U235SE_sfxplaylist_ptr");
static unsigned int U235_commands[2]={0,0};
extern long raptor_partbuf_x asm("raptor_partbuf_x");
extern long raptor_partbuf_y asm("raptor_partbuf_y");
extern void RBRA(long object_number, long branch_type, long ypos, long object_to_branch_if_taken) asm("RBRA");
extern void bin2asc(long number, long no_digits, char *string) asm("bin2asc");

//Warning: do NOT change the order of these 5 variables!
//(when compiling with -O0, variables start at zero_left_pad and go downwards, with -O2 the opposite. GO FIGURE)
long zero_rotary_delta asm("zero_rotary_delta")=0;
long zero_mousey_delta asm("zero_mousey_delta")=0;
long zero_mousex_delta asm("zero_mousex_delta")=0;
unsigned long zero_right_pad asm("zero_right_pad")=0;
unsigned long zero_left_pad asm("zero_left_pad")=0;

extern void eeReadBank();
extern void eeWriteBank();
long position_in_highscore asm("position_in_highscore")=0;

//
// And now, teh c0d3!!!111
//
// -----------------------------------------------------------------------------
void hiscore_sort(int table_to_sort)
{
    __asm__ ("\tmove.l d1,-(a7)\n\t"
    "move.l 8(a6),d1\n\t"
    "jsr RAPTOR_resort_score_table\n\t"
    "move.l (a7)+,d1"); 
}
// -----------------------------------------------------------------------------
void fullpowablitlist(void *blitlist)
{
    __asm(""
    "movem.l d0-a5,-(sp)                               \n\t"
    "move.l 8(a6),a0                                   \n\t"
    "move.l RUPDALL_FLAG,-(sp)  |save update flag      \n\t"
    "move.l #0,RUPDALL_FLAG     |disable auto update   \n\t"
    "jsr RAPTOR_blitter_full                           \n\t"
    "move.l (sp)+,RUPDALL_FLAG  |restore update flag   \n\t"
    "movem.l (sp)+,d0-a5                               \n\t");
}
// -----------------------------------------------------------------------------
int powaeeprom(int readwrite, void *buffer)
{
    __asm("\tmovem.l d1-a5,-(sp)                                                   \n\t"
"move.l 12(a6),a0                                                                  \n\t"
"tst.l 8(a6)                                                                       \n\t"
"beq.s savestuff                                                                   \n\t"
"jsr eeReadBank                                                                    \n\t"
"bra getout                                                                        \n\t"
"                                                                                  \n\t"
"savestuff:                                                                        \n\t"
"jsr eeWriteBank                                                                   \n\t"
"|move.w #0x134,0xF00058\n\t"
"                                                                                  \n\t"
"                                                                                  \n\t"
"getout: ext.l d0 |sign extend d0                                                  \n\t"
"movem.l (sp)+,d1-a5");
}
// -----------------------------------------------------------------------------
void powablitlist(void *blitlist)
{
    __asm(""
    "movem.l d0-a5,-(sp)                               \n\t"
    "move.l 8(a6),a0                                   \n\t"
    "move.l RUPDALL_FLAG,-(sp)  |save update flag      \n\t"
    "move.l #0,RUPDALL_FLAG     |disable auto update   \n\t"
    "jsr RAPTOR_blitter                                \n\t"
    "move.l (sp)+,RUPDALL_FLAG  |restore update flag   \n\t"
    "movem.l (sp)+,d0-a5                               \n\t");
}
// -----------------------------------------------------------------------------
// Code obtained from https://code.google.com/p/propgcc/source/browse/lib/stdlib/qsort.c
// Butchered by ggn as usual

/*
 * from the libnix library for the Amiga, written by
 * Matthias Fleischer and Gunther Nikl and placed in the public
 * domain
 */
#include <stdio.h>
#include <stdlib.h>


/* sample compar function: int cmp(void *a,void *b){ return *(int *)a-*(int *)b; } */
//ggn: Well, don't mind if I do then, hehe
static inline int cmp(void *a,void *b){ return *(int *)a-*(int *)b; }


/* This qsort function does a little trick:
 * To reduce stackspace it iterates the larger interval instead of doing
 * the recursion on both intervals. 
 * So stackspace is limited to 32*stack_for_1_iteration = 
 * 32*4*(4 arguments+1 returnaddress+11 stored registers) = 2048 Bytes,
 * which is small enough for everybodys use.
 * (And this is the worst case if you own 4GB and sort an array of chars.)
 * Sparing the function calling overhead does improve performance, too.
 */


void rbsort(void *base,size_t nmemb)
{ static short size=4; //will sort longwords only
  char *base2=(char *)base;
  size_t i,a,b,c;
  while(nmemb>1)
  { a=0;
    b=nmemb-1;
    c=(a+b)/2; /* Middle element */
    for(;;)
    { while(cmp(&base2[size*c],&base2[size*a])>0) 
        a++; /* Look for one >= middle */
      while(cmp(&base2[size*c],&base2[size*b])<0) 
        b--; /* Look for one <= middle */
      if(a>=b)
        break; /* We found no pair */
      for(i=0;i<size;i++) /* swap them */
      { char tmp=base2[size*a+i];
        base2[size*a+i]=base2[size*b+i];
        base2[size*b+i]=tmp; }
      if(c==a) /* Keep track of middle element */
        c=b;
      else if(c==b)
        c=a;
      a++; /* These two are already sorted */
      b--;
    } /* a points to first element of right intervall now (b to last of left) */
    b++;
    if(b<nmemb-b) /* do recursion on smaller intervall and iteration on larger one */
    { rbsort(base2,b);
      base2=&base2[size*b];
      nmemb=nmemb-b; }
    else
    { rbsort(&base2[size*b],nmemb-b);
      nmemb=b; }
  }
}

//Original function for posterity:

//void qsort
//(void *base,size_t nmemb,size_t size,int (*compar)(const void *,const void *))
//{ char *base2=(char *)base;
//  size_t i,a,b,c;
//  while(nmemb>1)
//  { a=0;
//    b=nmemb-1;
//    c=(a+b)/2; /* Middle element */
//    for(;;)
//    { while((*compar)(&base2[size*c],&base2[size*a])>0) 
//        a++; /* Look for one >= middle */
//      while((*compar)(&base2[size*c],&base2[size*b])<0) 
//        b--; /* Look for one <= middle */
//      if(a>=b)
//        break; /* We found no pair */
//      for(i=0;i<size;i++) /* swap them */
//      { char tmp=base2[size*a+i];
//        base2[size*a+i]=base2[size*b+i];
//        base2[size*b+i]=tmp; }
//      if(c==a) /* Keep track of middle element */
//        c=b;
//      else if(c==b)
//        c=a;
//      a++; /* These two are already sorted */
//      b--;
//    } /* a points to first element of right intervall now (b to last of left) */
//    b++;
//    if(b<nmemb-b) /* do recursion on smaller intervall and iteration on larger one */
//    { qsort(base2,b,size,compar);
//      base2=&base2[size*b];
//      nmemb=nmemb-b; }
//    else
//    { qsort(&base2[size*b],nmemb-b,size,compar);
//      nmemb=b; }
//  }
//}



// -----------------------------------------------------------------------------
void powaunpack(int source, int destination)
{
    __asm__ ("\tmovem.l d0-d7/a0-a6,-(sp)                                             \n\t"
    "move.l 8(a6),a0                                                                  \n\t"
    "move.l 12(a6),a1                                                                  \n\t"
    "|------------------------------------------------------------------------------- \n\t"
    "|  n2e_d.ash -- NRV2E decompression in 68000 assembly                            \n\t"
    "|                                                                                \n\t"
    "|  This file is part of the UCL data compression library.                        \n\t"
    "|                                                                                \n\t"
    "|  Copyright (C) 1996-2004 Markus Franz Xaver Johannes Oberhumer                 \n\t"
    "|  All Rights Reserved.                                                          \n\t"
    "|                                                                                \n\t"
    "|  The UCL library is free software; you can redistribute it and/or              \n\t"
    "|  modify it under the terms of the GNU General Public License as                \n\t"
    "|  published by the Free Software Foundation; either version 2 of                \n\t"
    "|  the License, or (at your option) any later version.                           \n\t"
    "|                                                                                \n\t"
    "|  The UCL library is distributed in the hope that it will be useful,            \n\t"
    "|  but WITHOUT ANY WARRANTY; without even the implied warranty of                \n\t"
    "|  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the                 \n\t"
    "|  GNU General Public License for more details.                                  \n\t"
    "|                                                                                \n\t"
    "|  You should have received a copy of the GNU General Public License             \n\t"
    "|  along with the UCL library; see the file COPYING.                             \n\t"
    "|  If not, write to the Free Software Foundation, Inc.,                          \n\t"
    "|  59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.                      \n\t"
    "|                                                                                \n\t"
    "|  Markus F.X.J. Oberhumer                                                       \n\t"
    "|  <markus@oberhumer.com>                                                        \n\t"
    "|  http://www.oberhumer.com/opensource/ucl/                                      \n\t"
    "|                                                                                \n\t"
    "|------------------------------------------------------------------------------- \n\t"
    "                                                                                 \n\t"
    "| ------------- DECOMPRESSION -------------                                      \n\t"
    "                                                                                 \n\t"
    "| decompress from a0 to a1                                                       \n\t"
    "|   note: must preserve d4 and a5-a7                                             \n\t"
    "                                                                                 \n\t"
    "|                                                                                \n\t"
    "| On entry:                                                                      \n\t"
    "|   a0  src pointer                                                              \n\t"
    "|   a1  dest pointer                                                             \n\t"
    "|                                                                                \n\t"
    "| On exit:                                                                       \n\t"
    "|   d1.l = 0x00008000                                                            \n\t"
    "|   d2.l = 0                                                                     \n\t"
    "|                                                                                \n\t"
    "| Register usage:                                                                \n\t"
    "|   a3  m_pos                                                                    \n\t"
    "|                                                                                \n\t"
    "|   d0  bit buffer                                                               \n\t"
    "|   d1  m_off                                                                    \n\t"
    "|   d2  m_len                                                                    \n\t"
    "|   d5  last_m_off                                                               \n\t"
    "|                                                                                \n\t"
    "|   d6  constant: -$500                                                          \n\t"
    "|   d7  constant: 0                                                              \n\t"
    "|                                                                                \n\t"
    "|                                                                                \n\t"
    "| Notes:                                                                         \n\t"
    "|   we have max_match = 65535, so we can use word arithmetics on d2              \n\t"
    "|   we have max_offset < 2**23, so we can use partial word arithmetics on d1     \n\t"
    "|                                                                                \n\t"
    "                                                                                 \n\t"
    "| ------------- constants & macros -------------                                 \n\t"
    "depack2e:                                                                        \n\t"
    "                moveq   #-0x50,D6       |   0xffffffb0                           \n\t"
    "                lsl.w   #4,D6           |   << 4                                 \n\t"
    "                                                                                 \n\t"
    "                moveq   #0,D7                                                    \n\t"
    "                moveq   #-1,D5          | last_off = -1                          \n\t"
    "                                                                                 \n\t"
    "| init d0 with high bit set                                                      \n\t"
    "||move.b  #$80,d0               | init d0.b for FILLBYTES                        \n\t"
    "                moveq   #-128,D0        | d0.b = $80                             \n\t"
    "                bra.s   decompr_start                                            \n\t"
    "                                                                                 \n\t"
    "                                                                                 \n\t"
    "| ------------- DECOMPRESSION -------------                                      \n\t"
    "                                                                                 \n\t"
    "decompr_literal:                                                                 \n\t"
    "                move.b  (A0)+,(A1)+                                              \n\t"
    "                                                                                 \n\t"
    "decompr_start:                                                                   \n\t"
    "decompr_loop:                                                                    \n\t"
    "| optimization: carry is clear -> we know that bits are available                \n\t"
    "|   cost literal:   4 +  8 + 10                                                  \n\t"
    "|   cost match:     4 + 10                                                       \n\t"
    "|   cost fillbits:  4 +  8 +  8                                                  \n\t"
    "                add.b   D0,D0                                                    \n\t"
    "                bcc.s   decompr_match                                            \n\t"
    "                bne.s   decompr_literal                                          \n\t"
    "                move.b  (A0)+,D0                                                 \n\t"
    "                addx.b  D0,D0                                                    \n\t"
    "                bcs.s   decompr_literal                                          \n\t"
    "                                                                                 \n\t"
    "                                                                                 \n\t"
    "decompr_match:                                                                   \n\t"
    "                moveq   #1,D1                                                    \n\t"
    "                moveq   #0,D2                                                    \n\t"
    "decompr_l1:                                                                      \n\t"
    "                add.b   D0,D0                                                    \n\t"
    "                bne.s   _l00                                                     \n\t"
    "                move.b  (A0)+,D0                                                 \n\t"
    "                addx.b  D0,D0                                                    \n\t"
    "_l00:                                                                            \n\t"
    "                addx.w  D1,D1                                                    \n\t"
    "| optimization: carry is clear -> we know that bits are available                \n\t"
    "|   cost loop continue:  4 + 10                                                  \n\t"
    "|   cost loop break:    4 +  8 + 10                                              \n\t"
    "|   cost fillbits:      4 +  8 +  8                                              \n\t"
    "                add.b   D0,D0                                                    \n\t"
    "                bcc.s   Lcon0                                                    \n\t"
    "                bne.s   decompr_break1                                           \n\t"
    "                move.b  (A0)+,D0                                                 \n\t"
    "                addx.b  D0,D0                                                    \n\t"
    "                bcs.s   decompr_break1                                           \n\t"
    "Lcon0:                                                                           \n\t"
    "                subq.w  #1,D1                                                    \n\t"
    "                add.b   D0,D0                                                    \n\t"
    "                bne.s   _l01                                                     \n\t"
    "                move.b  (A0)+,D0                                                 \n\t"
    "                addx.b  D0,D0                                                    \n\t"
    "_l01:                                                                            \n\t"
    "                addx.w  D1,D1                                                    \n\t"
    "                bpl.s   decompr_l1                                               \n\t"
    "                bra.s   decompr_end                                              \n\t"
    "decompr_break1:                                                                  \n\t"
    "                subq.w  #3,D1                                                    \n\t"
    "                bcs.s   decompr_prev_dist | last m_off                           \n\t"
    "                lsl.l   #8,D1                                                    \n\t"
    "                move.b  (A0)+,D1                                                 \n\t"
    "                not.l   D1                                                       \n\t"
    "                asr.l   #1,D1                                                    \n\t"
    "                bcc.s   decompr_get_mlen2                                        \n\t"
    "                                                                                 \n\t"
    "decompr_get_mlen1:                                                               \n\t"
    "                add.b   D0,D0                                                    \n\t"
    "                bne.s   _l02                                                     \n\t"
    "                move.b  (A0)+,D0                                                 \n\t"
    "                addx.b  D0,D0                                                    \n\t"
    "_l02:                                                                            \n\t"
    "                addx.w  D2,D2                                                    \n\t"
    "                bra.s   decompr_got_mlen                                         \n\t"
    "decompr_prev_dist:                                                               \n\t"
    "                move.l  D5,D1                                                    \n\t"
    "                add.b   D0,D0                                                    \n\t"
    "                bne.s   _l03                                                     \n\t"
    "                move.b  (A0)+,D0                                                 \n\t"
    "                addx.b  D0,D0                                                    \n\t"
    "_l03:                                                                            \n\t"
    "                bcs.s   decompr_get_mlen1                                        \n\t"
    "decompr_get_mlen2:                                                               \n\t"
    "                addq.w  #1,D2                                                    \n\t"
    "                add.b   D0,D0                                                    \n\t"
    "                bne.s   _l04                                                     \n\t"
    "                move.b  (A0)+,D0                                                 \n\t"
    "                addx.b  D0,D0                                                    \n\t"
    "_l04:                                                                            \n\t"
    "                bcs.s   decompr_get_mlen1                                        \n\t"
    "                                                                                 \n\t"
    "decompr_l2:                                                                      \n\t"
    "                add.b   D0,D0                                                    \n\t"
    "                bne.s   _l05                                                     \n\t"
    "                move.b  (A0)+,D0                                                 \n\t"
    "                addx.b  D0,D0                                                    \n\t"
    "_l05:                                                                            \n\t"
    "                addx.w  D2,D2                                                    \n\t"
    "| optimization: carry is clear -> we know that bits are available                \n\t"
    "|   cost loop continue:  4 + 10                                                  \n\t"
    "|   cost loop break:    4 +  8 + 10                                              \n\t"
    "|   cost fillbits:      4 +  8 +  8                                              \n\t"
    "                add.b   D0,D0                                                    \n\t"
    "                bcc.s   decompr_l2                                               \n\t"
    "                bne.s   Lbreak0                                                  \n\t"
    "                move.b  (A0)+,D0                                                 \n\t"
    "                addx.b  D0,D0                                                    \n\t"
    "                bcc.s   decompr_l2                                               \n\t"
    "Lbreak0:                                                                         \n\t"
    "                addq.w  #2,D2                                                    \n\t"
    "                                                                                 \n\t"
    "                                                                                 \n\t"
    "                                                                                 \n\t"
    "decompr_got_mlen:                                                                \n\t"
    "                move.l  D1,D5                                                    \n\t"
    "                lea     0(A1,D1.l),A3                                            \n\t"
    "                                                                                 \n\t"
    "| must use sub as cmp doesn't affect the X flag                                  \n\t"
    "                sub.l   D6,D1                                                    \n\t"
    "                addx.w  D7,D2                                                    \n\t"
    "                                                                                 \n\t"
    "| TODO: partly unroll this loop; could use some magic with d7 for address        \n\t"
    "|       computations, then compute a nice `jmp yyy(pc,dx.w)'                     \n\t"
    "                                                                                 \n\t"
    "|   cost for any m_len:   12 + 22 * (m_len - 1) + 4                              \n\t"
    "|     38, 60, 82, 104, 126, 148, 170, 192, 214, 236                              \n\t"
    "                move.b  (A3)+,(A1)+     | 12                                     \n\t"
    "Lcopy0:         move.b  (A3)+,(A1)+     | 12                                     \n\t"
    "                dbra    D2,Lcopy0       | 10 / 14                                \n\t"
    "                                                                                 \n\t"
    "                bra     decompr_loop                                             \n\t"
    "decompr_end:                                                                     \n\t"
    "                |rts                                                             \n\t"
    "                movem.l (sp)+,d0-d7/a0-a6                                        \n\t"
    "| vi:ts=8:et                                                                     \n\t");
    
}

// -----------------------------------------------------------------------------
void powabzap(int spr_index, int offset, int no_of_times, int value, int skip_offset)
{
    __asm__ ("\tmovem.l d0/d1/a0,-(sp)\n\t"
            "|movem.l 8(a6),d0/d1/d2/a0\n\t"
            "|move.l %d0,%d3 |multiply by 188, courtesy of gcc\n\t"
            "|add.l %d3,%d3  |(nope, not checking if there's a faster way, suck it up :P\n\t"
            "|add.l %d0,%d3\n\t"
            "|lsl.l #4,%d3\n\t"
            "|sub.l %d0,%d3\n\t"
            "|add.l %d3,%d3\n\t"
            "|add.l %d3,%d3\n\t"
            "|add.l d1,d3\n\t"
            "|lea raptor_liststart,a1\n\t"
            "|lea (a1,d3.l),a1\n\t"
            "|subq.l #1,d2 |no of iterations-1 for dbra\n"
            "|powaloop2:\t move.l (a0)+,d3 \n\t"
            "|add.l d3,(a1) \n\t"
            "|lea 188(a1),a1\n\t"
            "|dbra d2,powaloop2\n\t"
    "move.l 8(%fp),%a0\n\t"
    "move.l %a0,%d0\n\t"
    "add.l %a0,%d0\n\t"
    "add.l %a0,%d0\n\t"
    "lsl.l #4,%d0\n\t"
    "sub.l %a0,%d0\n\t"
    "add.l %d0,%d0\n\t"
    "add.l %d0,%d0\n\t"
    "add.l 12(%fp),%d0\n\t"
    "move.l raptor_liststart,%a0\n\t"
    "lea (a0,d0.l),a0\n\t"
    "move.l 20(a6),d0\n\t"
    "move.l 16(a6),d1\n\t"
    "subq.w #1,d1\n\t"
        "move.l 24(a6),d2\n\t"
    "powaloop6:\n\t"
    "move.l d0,(a0)\n\t"
    "add.l d2,a0\n\t"
    "dbra d1,powaloop6\n\t"
            "movem.l (sp)+,d0/d1/a0\n\t");
}
// -----------------------------------------------------------------------------
void powabdiff(int spr_index, int offset, int no_of_times, void *array_of_values, int skip_offset)
{
    __asm__ ("\tmovem.l d0/d1/d2/a0/a1,-(sp)\n\t"
            "|movem.l 8(a6),d0/d1/d2/a0\n\t"
            "|move.l %d0,%d3 |multiply by 188, courtesy of gcc\n\t"
            "|add.l %d3,%d3  |(nope, not checking if there's a faster way, suck it up :P\n\t"
            "|add.l %d0,%d3\n\t"
            "|lsl.l #4,%d3\n\t"
            "|sub.l %d0,%d3\n\t"
            "|add.l %d3,%d3\n\t"
            "|add.l %d3,%d3\n\t"
            "|add.l d1,d3\n\t"
            "|lea raptor_liststart,a1\n\t"
            "|lea (a1,d3.l),a1\n\t"
            "|subq.l #1,d2 |no of iterations-1 for dbra\n"
            "|powaloop2:\t move.l (a0)+,d3 \n\t"
            "|add.l d3,(a1) \n\t"
            "|lea 188(a1),a1\n\t"
            "|dbra d2,powaloop2\n\t"
    "move.l 8(%fp),%a0\n\t"
    "move.l %a0,%d0\n\t"
    "add.l %a0,%d0\n\t"
    "add.l %a0,%d0\n\t"
    "lsl.l #4,%d0\n\t"
    "sub.l %a0,%d0\n\t"
    "add.l %d0,%d0\n\t"
    "add.l %d0,%d0\n\t"
    "add.l 12(%fp),%d0\n\t"
    "move.l raptor_liststart,%a0\n\t"
    "lea (a0,d0.l),a0\n\t"
    "move.l 20(a6),a1\n\t"
    "move.l 16(a6),d1\n\t"
    "subq.w #1,d1\n\t"
        "move.l 24(a6),d0\n\t"
    "powaloop5:\tmove.l (a1)+,d2\n\t"
    "add.l d2,(a0)\n\t"
    "add.l d0,a0\n\t"
    "dbra d1,powaloop5\n\t"
            "movem.l (sp)+,d0/d1/d2/a0/a1\n\t");
}
// -----------------------------------------------------------------------------
void powabset(int spr_index, int offset, int no_of_times, void *array_of_values, int skip_offset)
{
    __asm__ ("\tmovem.l d0/d1/a0/a1,-(sp)\n\t"
            "|movem.l 8(a6),d0/d1/d2/a0\n\t"
            "||move.l %d0,%d3 |multiply by 188, courtesy of gcc\n\t"
            "||add.l %d3,%d3  |(nope, not checking if there's a faster way, suck it up :P\n\t"
            "||add.l %d0,%d3\n\t"
            "||lsl.l #4,%d3\n\t"
            "||sub.l %d0,%d3\n\t"
            "||add.l %d3,%d3\n\t"
            "||add.l %d3,%d3\n\t"
            "|mulu #188,d0\n\t"
            "|add.l d1,d0\n\t"
            "|lea raptor_liststart,a1\n\t"
            "|lea (a1,d0.l),a1\n\t"
            "||subq.l #1,d2 |no of iterations-1 for dbra\n"
            "||powaloop:\t move.l (a0)+,(a1) \n\t"
            "||lea 188(a1),a1\n\t"
            "||dbra d2,powaloop\n\t"
            "|move.l (a0),(a1)\n\t"
    "move.l 8(%fp),%a0\n\t"
    "move.l %a0,%d0\n\t"
    "add.l %a0,%d0\n\t"
    "add.l %a0,%d0\n\t"
    "lsl.l #4,%d0\n\t"
    "sub.l %a0,%d0\n\t"
    "add.l %d0,%d0\n\t"
    "add.l %d0,%d0\n\t"
    "add.l 12(%fp),%d0\n\t"
    "move.l raptor_liststart,%a0\n\t"
    "add.l d0,a0\n\t"
    "move.l 20(a6),a1\n\t"
    "move.l 16(a6),d1\n\t"
    "subq.w #1,d1\n\t"
        "move.l 24(a6),d0\n\t"
    "|move.l (a1),(%a0,%d0.l)\n\t"
    "powaloop4:\tmove.l (a1)+,(a0)\n\t"
    "add.l d0,a0\n\t"
    "dbra d1,powaloop4\n\t"

            "movem.l (sp)+,d0/d1/a0/a1\n\t");
}
// -----------------------------------------------------------------------------
void powazap(int spr_index, int offset, int no_of_times, int value)
{
    __asm__ ("\tmovem.l d0/d1/a0,-(sp)\n\t"
            "|movem.l 8(a6),d0/d1/d2/a0\n\t"
            "|move.l %d0,%d3 |multiply by 188, courtesy of gcc\n\t"
            "|add.l %d3,%d3  |(nope, not checking if there's a faster way, suck it up :P\n\t"
            "|add.l %d0,%d3\n\t"
            "|lsl.l #4,%d3\n\t"
            "|sub.l %d0,%d3\n\t"
            "|add.l %d3,%d3\n\t"
            "|add.l %d3,%d3\n\t"
            "|add.l d1,d3\n\t"
            "|lea raptor_liststart,a1\n\t"
            "|lea (a1,d3.l),a1\n\t"
            "|subq.l #1,d2 |no of iterations-1 for dbra\n"
            "|powaloop2:\t move.l (a0)+,d3 \n\t"
            "|add.l d3,(a1) \n\t"
            "|lea 188(a1),a1\n\t"
            "|dbra d2,powaloop2\n\t"
    "move.l 8(%fp),%a0\n\t"
    "move.l %a0,%d0\n\t"
    "add.l %a0,%d0\n\t"
    "add.l %a0,%d0\n\t"
    "lsl.l #4,%d0\n\t"
    "sub.l %a0,%d0\n\t"
    "add.l %d0,%d0\n\t"
    "add.l %d0,%d0\n\t"
    "add.l 12(%fp),%d0\n\t"
    "move.l raptor_liststart,%a0\n\t"
    "lea (a0,d0.l),a0\n\t"
    "move.l 20(a6),d0\n\t"
    "move.l 16(a6),d1\n\t"
    "subq.w #1,d1\n\t"
    "powaloop3:\n\t"
    "move.l d0,(a0)\n\t"
    "lea 188(a0),a0\n\t"
    "dbra d1,powaloop3\n\t"
            "movem.l (sp)+,d0/d1/a0\n\t");
}
// -----------------------------------------------------------------------------
void powadiff(int spr_index, int offset, int no_of_times, void *array_of_values)
{
    __asm__ ("\tmovem.l d0/d1/d2/d3/a0/a1,-(sp)\n\t"
            "|movem.l 8(a6),d0/d1/d2/a0\n\t"
            "|move.l %d0,%d3 |multiply by 188, courtesy of gcc\n\t"
            "|add.l %d3,%d3  |(nope, not checking if there's a faster way, suck it up :P\n\t"
            "|add.l %d0,%d3\n\t"
            "|lsl.l #4,%d3\n\t"
            "|sub.l %d0,%d3\n\t"
            "|add.l %d3,%d3\n\t"
            "|add.l %d3,%d3\n\t"
            "|add.l d1,d3\n\t"
            "|lea raptor_liststart,a1\n\t"
            "|lea (a1,d3.l),a1\n\t"
            "|subq.l #1,d2 |no of iterations-1 for dbra\n"
            "|powaloop2:\t move.l (a0)+,d3 \n\t"
            "|add.l d3,(a1) \n\t"
            "|lea 188(a1),a1\n\t"
            "|dbra d2,powaloop2\n\t"
    "move.l 8(%fp),%a0\n\t"
    "move.l %a0,%d0\n\t"
    "add.l %a0,%d0\n\t"
    "add.l %a0,%d0\n\t"
    "lsl.l #4,%d0\n\t"
    "sub.l %a0,%d0\n\t"
    "add.l %d0,%d0\n\t"
    "add.l %d0,%d0\n\t"
    "add.l 12(%fp),%d0\n\t"
    "move.l raptor_liststart,%a0\n\t"
    "lea (a0,d0.l),a0\n\t"
    "move.l 20(a6),a1\n\t"
    "move.l 16(a6),d1\n\t"
    "subq.w #1,d1\n\t"
    "powaloop2:\tmove.l (a1)+,d3\n\t"
    "add.l d3,(a0)\n\t"
    "lea 188(a0),a0\n\t"
    "dbra d1,powaloop2\n\t"
            "movem.l (sp)+,d0/d1/d2/d3/a0/a1\n\t");
}
// -----------------------------------------------------------------------------
void powaset(int spr_index, int offset, int no_of_times, void *array_of_values)
{
    __asm__ ("\tmovem.l d0/d1/d2/d3/a0/a1,-(sp)\n\t"
            "|movem.l 8(a6),d0/d1/d2/a0\n\t"
            "||move.l %d0,%d3 |multiply by 188, courtesy of gcc\n\t"
            "||add.l %d3,%d3  |(nope, not checking if there's a faster way, suck it up :P\n\t"
            "||add.l %d0,%d3\n\t"
            "||lsl.l #4,%d3\n\t"
            "||sub.l %d0,%d3\n\t"
            "||add.l %d3,%d3\n\t"
            "||add.l %d3,%d3\n\t"
            "|mulu #188,d0\n\t"
            "|add.l d1,d0\n\t"
            "|lea raptor_liststart,a1\n\t"
            "|lea (a1,d0.l),a1\n\t"
            "||subq.l #1,d2 |no of iterations-1 for dbra\n"
            "||powaloop:\t move.l (a0)+,(a1) \n\t"
            "||lea 188(a1),a1\n\t"
            "||dbra d2,powaloop\n\t"
            "|move.l (a0),(a1)\n\t"
    "move.l 8(%fp),%a0\n\t"
    "move.l %a0,%d0\n\t"
    "add.l %a0,%d0\n\t"
    "add.l %a0,%d0\n\t"
    "lsl.l #4,%d0\n\t"
    "sub.l %a0,%d0\n\t"
    "add.l %d0,%d0\n\t"
    "add.l %d0,%d0\n\t"
    "add.l 12(%fp),%d0\n\t"
    "move.l raptor_liststart,%a0\n\t"
    "lea (a0,d0.l),a0\n\t"
    "move.l 20(a6),a1\n\t"
    "move.l 16(a6),d1\n\t"
    "subq.w #1,d1\n\t"
    "|move.l (a1),(%a0,%d0.l)\n\t"
    "powaloop:\tmove.l (a1)+,(a0)\n\t"
    "lea 188(a0),a0\n\t"
    "dbra d1,powaloop\n\t"

            "movem.l (sp)+,d0/d1/d2/d3/a0/a1\n\t");
}
// -----------------------------------------------------------------------------
void bin2asc(long number, long no_digits, char *string)
{
    __asm__ ("\tmovem.l d1/d4/a0,-(sp)\n\t"
            "movem.l 8(a6),d1/d4/a0\n\t"
            "jsr RAPTOR_HEXtoDEC\n\t"
            "clr.b 1(a0,d4.w)    |hex2dec expects digits-1 in d4 and we want to zero out the byte after the last digit\n\t"
            "movem.l (sp)+,d1/d4/a0\n\t");
}
// -----------------------------------------------------------------------------
void RBRA(long object_number, long branch_type, long ypos, long object_to_branch_if_taken)
{
    __asm__ ("\tmovem.l d0-d3/a6,-(sp) |lolol\n\t"
            "movem.l 8(a6),d0-d3\n\t"    
            "jsr RAPTOR_setup_object_bra\n\t"
            "movem.l (sp)+,d0-d3/a6    |lolol\n\t");
}
// -----------------------------------------------------------------------------
void ZEROPAD()
{
    __asm__ ("\tmovem.l d0-d4,-(sp)\n\t"
                "jsr Input_Read\n\t"
            "movem.l d0-d4,zero_left_pad\n\t"    
            "movm.l (sp)+,d0-d4\n\t");
}
// -----------------------------------------------------------------------------
short hiscore_check(int score, char *name, int table)
{
    __asm__ ("\tmove.l 8(a6),d0\n\t"
    "move.l 12(a6),a0\n\t"
    "movem.l d1/d2/d3/d4/d5/d6/d7/a1/a2/a3/a4/a5,-(sp)\n\t"
    "move.l 16(a6),d1\n\t"
    "jsr RAPTOR_chk_highscores\n\t"
    "move.l d7,position_in_highscore\n\t"
    "movem.l (sp)+,d1/d2/d3/d4/d5/d6/d7/a1/a2/a3/a4/a5\n\t");
}
// -----------------------------------------------------------------------------
void SNDZEROPLAY(int channel, void *sound_address, int sample_size, int sample_divider, int play_command)
{
__asm(""
    "movem.l d0/a0/d1/d2/d3,-(a7)\n\t"
    "move.l 8(a6),d0\n\t"
    "move.l 12(a6),a0\n\t"
    "move.l 16(a6),d1\n\t"
    "move.l 20(a6),d2\n\t"
    "move.l 24(a6),d3\n\t"
    "jsr        Audio_Play\n\t"
    "movem.l (sp)+,d0/a0/d1/d2/d3");
}
// -----------------------------------------------------------------------------
int fadesingle(short clut_index,short target_col)
{
    __asm__ ("\tmove.l d1,-(a7)\n\t"
    "move.w 10(a6),d1\n\t"
    "move.w 8(a6),d0\n\t"
    "jsr RAPTOR_fade_clutindex\n\t"
    "move.l (a7)+,d1"); 
}
// -----------------------------------------------------------------------------
int fadepal(int clut_no,int fade_cols,int *palette)
{
    __asm__ ("\tmovem.l d7/a1,-(a7)\n\t"
    "move.l 16(a6),a1\n\t"
    "move.l 12(a6),d7\n\t"
    "move.l 8(a6),d0\n\t"
    "jsr RAPTOR_fade_clut\n\t"
    "movem.l (a7)+,d7/a1");
}
// -----------------------------------------------------------------------------
void loadclut(unsigned short *paladdress, short target_clut, short no_of_indices)
{
    short i;
    unsigned short *src=(unsigned short *)paladdress;
    unsigned short *dest=(unsigned short *)(0xf00400+target_clut*(16*2));
    for (i=0;i<no_of_indices;i++)
        *dest++=*src++;
}
// -----------------------------------------------------------------------------
void SNDKILL(int v)
{
    U235_commands[0]=v<<4|1;
    U235SE_sfxplaylist_ptr=&U235_commands[0];
}
// -----------------------------------------------------------------------------
void SNDDELTA(int v,int x)
{
    U235_commands[0]=x<<8|x<<v|3;
    U235SE_sfxplaylist_ptr=&U235_commands[0];
}
// -----------------------------------------------------------------------------
void SNDFREQ(int v,int y)
{
    U235_commands[0]=y<<16|v<<4|7;
    U235SE_sfxplaylist_ptr=&U235_commands[0];
}
// -----------------------------------------------------------------------------
void SNDPLAYFREQ(int v,int x,int y)
{
    U235_commands[0]=y<<16|x<<8|v<<4|4;
    U235SE_sfxplaylist_ptr=&U235_commands[0];
}
// -----------------------------------------------------------------------------
void SNDVOLRESET(int v)
{
    U235_commands[0]=v<<4|8;
    U235SE_sfxplaylist_ptr=&U235_commands[0];
}
// -----------------------------------------------------------------------------
void plot(short plot_px, short plot_py)
{
__asm__ ("movem.l   d0-d4/a0,-(a6)\n\t"
"           move.l  8(a7),d0\n\t"
"           move.l  12(a7),d1\n\t"
"           move.b  _plot_colour,d2\n\t"
"           moveq   #15,d4\n\t"
"           btst    #0,d0\n\t"
"           beq.s   plot_even\n\t"
"           lsr.b   #4,d2\n\t"
"           moveq   #-16,d4\n\t"
"plot_even: asr.w   #1,d0\n\t"
"           lea     RAPTOR_particle_gfx,a0\n\t"
"           add.w   d0,a0\n\t"
"           move.w  d1,d3\n\t"
"           asl.w   #5,d3\n\t"
"           asl.w   #7,d1\n\t"
"           add.w   d1,a0\n\t"
"           add.w   d3,a0\n\t"
"           and.b   d4,(a0)\n\t"
"           or.b    d2,(a0)\n\t"
"           movem.l (a6)+,d0-d4/a0");
}
// -----------------------------------------------------------------------------
int GETPAD(int pad)
{
    if (pad==1)
        return U235SE_pad1;
    else if (pad==2)
        return U235SE_pad2;
    else
        return 0;
}
// -----------------------------------------------------------------------------
void RSETLIST(int list_index)
{
    //static int d0 asm ("d0")=list_index;
__asm__ ("movem.l   d0-d7/a0-a6,-(a7)\n\t"
"           move.l 8+60(sp),d0\n\t"
"           jsr     RAPTOR_setlist\n\t"
"           movem.l (a7)+,d0-d7/a0-a6");
}
// -----------------------------------------------------------------------------
int RHIT(int r_sl, int r_sh, int r_tl, int r_th)
{
    __asm__ ("  movem.l d1-d7/a0-a6,-(a7)");
    raptor_result=0;
    raptor_sourcel=r_sl;
    raptor_sourceh=r_sh;
    raptor_targetl=r_tl;
    raptor_targeth=r_th;
    __asm__ ("  lea     RAPTOR_GPU_COLLISION,a0");
    __asm__ ("  jsr     RAPTOR_call_GPU_code");
    __asm__ ("  movem.l (a7)+,d1-d7/a0-a6");
    return raptor_result;
}
// -----------------------------------------------------------------------------
void RSETOBJ(int spr_index, int offset, int value)
{
    char *a0;
    a0=(char *)raptor_liststart;
    a0=a0+offset+(spr_index*188);
    *(int *)a0=value;
}
// -----------------------------------------------------------------------------
int RGETOBJ(int spr_index, int offset)
{
    char *a0;
    a0=(char *)raptor_liststart;
    a0=a0+offset+(spr_index*188);
    return *(int *)a0;
}
// -----------------------------------------------------------------------------
void RUPDALL(volatile int update)
{
    if (update==0) //NOW
    {
        if (RUPDALL_FLAG!=4)
{
__asm__ ("\tmovem.l d0-d7/a0-a6,-(a7)\n\t"
"jsr        RAPTOR_wait_frame_UPDATE_ALL\n\t"
"movem.l    (a7)+,d0-d7/a0-a6");
}
        else
        {
            RAPTOR_wait_frame();
            RUPDALL_FLAG=0;
        }
    }
    else if (update==1) //VBL
    {
        RUPDALL_FLAG=4;
    }
    else if (update==2) //Remove VBL
    {
        RUPDALL_FLAG=0;
    }
}
// -----------------------------------------------------------------------------
void delay(int x)
{int delayloopcounter;for (delayloopcounter=0;delayloopcounter<x;delayloopcounter++) RUPDALL(0);}
// -----------------------------------------------------------------------------
void MODPLAY(int module)
{
    if (module>=0)
    {
__asm__("move.l 8(a6),a0\n\t"
"jsr RAPTOR_U235setmodule\n\t"
"jsr RAPTOR_U235gomodule_stereo");
    }
    else
    {
        RAPTOR_U235stopmodule();
    }
}
// -----------------------------------------------------------------------------
void SNDPLAY(int sampleno,int channel)
{
    // Jesus Christ, that was such a pain in the butt to get running
    volatile int s=sampleno;
    volatile int c=channel;
  __asm__ ("\tmove.l 8(a6),d0\n\t"
  "move.l 12(a6),d1\n\t"
  "move.l 8(a6),d0\n\t"
  "lea RAPTOR_Version,a0\n\t"
  "lea U235SE_sfxplaylist_ptr,a1\n\t"
  "move.l d0,-(a0)\n\t"
  "rol.w #4,d1\n\t"
  "eor.l #0x3e800004,d1\n\t"
  "rol.w #8,d0\n\t"
  "or.w d0,d1\n\t"
  "move.l d1,-(a0)\n\t"
  "move.l #RAPTOR_samplebank,d0\n\t"
  "lsl.l #4,d0\n\t"
  "or.w #0xb,d0\n\t"
  "move.l d0,-(a0)\n\t"
  "move.l a0,(a1)\n\t"
  "lea 0x200,a0\n\t"
  "|move.l     #16992,d0     | Put address of sample bank in d0\n\t"
  "|move.l     #RAPTOR_samplebank,d0     | Put address of sample bank in d0\n\t"
  "|lsl.l      #4, d0      | Move the address over for the command to fit\n\t"
  "|or.l      #0xb,d0           | add Set Sample Bank instruction\n\t"
  "|move.l     d0,(a0)+            | Write Set bank to playlist\n\t"
  "|move.l     #0x11940004,(a0)+   || 1194 = Y  00 = X  5 = Voice  4 = Command\n\t"
  "|move.l     #0,(a0)     | Terminate the end of the list  \n\t"
  "|move.l     #0x200,U235SE_sfxplaylist_ptr \n\t"
  );
}
// -----------------------------------------------------------------------------
void MODVOL(int volume)
{
    U235SE_music_vol=volume;
}
// -----------------------------------------------------------------------------
void SNDVOL(int volume)
{
    U235SE_sfx_vol=volume;
}
// -----------------------------------------------------------------------------
void RPARTI(int *fx)
{
    //fx is an array of longs - 6 rows and
    //as many columns as the user wants
    //first column should be:
    //zzz,zzz,zzz,no_particles,x,y (zzz=don't care)
    *(int *)&raptor_part_inject_addr=(int)&fx[3];
    __asm__ ("movem.l   d0-a6,-(a7)\n\t"
"lea        RAPTOR_particle_injection_GPU,a0\n\t"
"jsr    RAPTOR_call_GPU_code\n\t"
"movem.l    (a7)+,d0-a6");
}
// -----------------------------------------------------------------------------
void RSETMAP(int x,int y)
{
    raptor_map_position_x=x;
    raptor_map_position_y=y;
    __asm__ ("  movem.l d0-d7/a0-a6,-(a7)\n\t"
"jsr        RAPTOR_map_set_position\n\t"
"movem.l    (a7)+,d0-d7/a0-a6");
}
// -----------------------------------------------------------------------------
void RLOCATE(int x, int y)
{
    basic_r_xpos=x;
    basic_r_ypos=y;
}
// -----------------------------------------------------------------------------
void RPRINT()
{
    //volatile char *rprint_buffer __asm__ ("a0")=string;
    __asm__ ("movem.l   d0-d7/a0-a6,-(a7)\n\t"
          "move.l   _basic_r_xpos,d0\n\t"
          "move.l   _basic_r_ypos,d1\n\t"
          "move.l   _basic_r_size,d2\n\t"
          "move.l   _basic_r_indx,d3\n\t"
          "move.l   _basic_r_buffer,a0\n\t"
          "jsr      RAPTOR_print\n\t"
          "movem.l  (a7)+,d0-d7/a0-a6\n\t");
    
}
// -----------------------------------------------------------------------------
void cls(void)
{
    __asm__ ("movem.l d0/d1/a0,-(a7)\n\t"
"              lea RAPTOR_particle_gfx,a0\n\t"
"              move.l raptor_partbuf_x,d0\n\t"
"              move.l raptor_partbuf_y,d1\n\t"
"              mulu d1,d0\n\t"
"              lsr.l #3,d0\n\t"
"              subq.w #1,d0\n\t"
"              |used to be: move.w #(320*240)/2/4-1,d0\n\t"
"              moveq #0,d1\n\t"
"clr_loop:     move.l d1,(a0)+\n\t"
"              dbra d0,clr_loop\n\t"
"              movem.l (a7)+,d0/d1/a0\n\t");      
              
}
