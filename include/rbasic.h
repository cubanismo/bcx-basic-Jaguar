//Variables (remember, we compile with size of int = 32 bits)

extern int U235SE_pad1 asm ("U235SE_pad1");
extern int U235SE_pad2 asm ("U235SE_pad2");
extern void *RAPTOR_sprite_table asm ("RAPTOR_sprite_table");
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
extern void RAPTOR_wait_frame() asm ("_RAPTOR_wait_frame");
extern int RUPDALL_FLAG asm ("_RUPDALL_FLAG");
extern void *raptor_liststart asm ("raptor_liststart");
extern int rotary_mode1 asm("rotary_mode1");
extern int rotary_mode2 asm("rotary_mode2");
extern int turn_direction1 asm("turn_direction1");
extern int turn_direction2 asm("turn_direction2");
extern int rotary_interval1 asm("rotary_interval1");
extern int rotary_interval2 asm("rotary_interval2");
extern int spin_delta1 asm("spin_delta1");
extern int spin_delta2 asm("spin_delta2");
extern int raptor_used_particles asm("raptor_used_particles");
extern int raptor_free_particles asm("raptor_free_particles");
extern void *RAPTOR_particle_gfx asm("RAPTOR_particle_gfx");
extern int raptor_mt_present asm("raptor_mt_present");
extern int raptor_highscores1_hex[128] asm("raptor_highscores1_hex");
extern char raptor_highscores1_nam[10][8] asm("raptor_highscores1_nam");
extern int raptor_highscores2_hex[128] asm("raptor_highscores2_hex");
extern char raptor_highscores2_nam[10][8] asm("raptor_highscores2_nam");
extern int raptor_highscores3_hex[128] asm("raptor_highscores3_hex");
extern char raptor_highscores3_nam[10][8] asm("raptor_highscores3_nam");
extern int raptor_highscores4_hex[128] asm("raptor_highscores4_hex");
extern char raptor_highscores4_nam[10][8] asm("raptor_highscores4_nam");
extern int raptor_highscores5_hex[128] asm("raptor_highscores5_hex");
extern char raptor_highscores5_nam[10][8] asm("raptor_highscores5_nam");
extern unsigned long zero_left_pad asm("zero_left_pad");
extern unsigned long zero_right_pad asm("zero_right_pad");
extern long zero_mousex_delta asm("zero_mousex_delta");
extern long zero_mousey_delta asm("zero_mousey_delta");
extern long zero_rotary_delta asm("zero_rotary_delta");
extern short raptor_ntsc_flag asm("raptor_ntsc_flag");
extern long raptor_vbl_time_remain asm("raptor_vbl_time_remain");
extern long raptor_user_savedata asm("raptor_user_savedata");
extern void rbsort(void *base,size_t nmemb) asm("rbsort");
extern int raptor_blitter_use(int command) asm("raptor_blitter_use");
extern int powaeeprom(int readwrite, void *buffer) asm ("powaeeprom");
extern int U235SE_modregdump[4] asm("U235SE_modregdump");
extern void *RAPTOR_samplebank asm ("RAPTOR_samplebank");

//Zerosquare player equates
#define Zero_Chan_Format_Shift      30
#define Zero_Chan_Looping_Shift     29
#define Zero_Chan_Enabled_Shift     28
#define Zero_Audio_8bit_Signed      (0 << Zero_Chan_Format_Shift)
#define Zero_Audio_8bit_Unsigned    (1 << Zero_Chan_Format_Shift)
#define Zero_Audio_8bit_muLaw       (2 << Zero_Chan_Format_Shift)
#define Zero_Audio_Looping          (1 << Zero_Chan_Looping_Shift)
// Bit numbers for pad buttons
#define Input_Pad_Pause             ( 1 << 0 )
#define Input_Pad_A                 ( 1 << 1 )
#define Input_Pad_Up                ( 1 << 2 )
#define Input_Pad_Down              ( 1 << 3 )
#define Input_Pad_Left              ( 1 << 4 )
#define Input_Pad_Right             ( 1 << 5 )
#define Input_Pad_C1                ( 1 << 6 )
#define Input_Pad_B                 ( 1 << 7 )
#define Input_Pad_Star              ( 1 << 8 )
#define Input_Pad_7                 ( 1 << 9 )
#define Input_Pad_4                 ( 1 << 10 )
#define Input_Pad_1                 ( 1 << 11 )
#define Input_Pad_C2                ( 1 << 12 )
#define Input_Pad_C                 ( 1 << 13 )
#define Input_Pad_0                 ( 1 << 14 )
#define Input_Pad_8                 ( 1 << 15 )
#define Input_Pad_5                 ( 1 << 16 )
#define Input_Pad_2                 ( 1 << 17 )
#define Input_Pad_C3                ( 1 << 18 )
#define Input_Pad_Option            ( 1 << 19 )
#define Input_Pad_Sharp             ( 1 << 20 )
#define Input_Pad_9                 ( 1 << 21 )
#define Input_Pad_6                 ( 1 << 22 )
#define Input_Pad_3                 ( 1 << 23 )
// Bit numbers for mouse buttons
#define Input_Mouse_Left            ( 1 << 1 )
#define Input_Mouse_Right           ( 1 << 0 )

//Functions

void basicmain(); //main function declaration
extern unsigned char plot_colour asm ("_plot_colour");
extern int GETPAD(int pad) asm ("_GETPAD");
extern void MODPLAY(int module) asm ("_MODPLAY");
extern void SNDPLAY(int sampleno, int channel) asm ("_SNDPLAY");
extern void RPARTI(int *fx) asm ("_RPARTI");
extern void RSETLIST(int list_index) asm ("_RSETLIST");
//extern void RSETOBJ(int spr_index, int offset, int value) asm ("_RSETOBJ");
//extern int RGETOBJ(int spr_index, int offset) asm ("_RGETOBJ");
#define RSETOBJ(spr_index,offset,value) ((RAPTOR_LIST *)raptor_liststart)[spr_index].offset=value
#define RGETOBJ(spr_index,offset) ((RAPTOR_LIST *)raptor_liststart)[spr_index].offset
extern int RHIT(int r_sl, int r_sh, int r_tl, int r_th) asm ("_RHIT");
extern void RUPDALL(volatile int update) asm ("_RUPDALL");
extern void RSETMAP(int x,int y) asm ("_RSETMAP");
extern void colour() asm ("_colour");
extern void RPRINT() asm ("_RPRINT");
extern void RLOCATE(int x, int y) asm ("_RLOCATE");
extern int basic_r_xpos asm ("_basic_r_xpos");
extern int basic_r_ypos asm ("_basic_r_ypos");
extern int basic_r_indx asm ("_basic_r_indx");
extern int basic_r_size asm ("_basic_r_size");
extern char *basic_r_buffer asm ("_basic_r_buffer");
extern void plot(short plot_px, short plot_py) asm ("_plot");
extern void cls(void) asm ("_cls");
extern void MODVOL(int volume) asm ("_MODVOL");
extern void SNDVOL(int volume) asm ("_SNDVOL");
char *ee_printf(const char *fmt, ...) asm ("ee_printf");
void ee_sprintf(char * buf, const char *fmt, ...) asm ("_ee_sprintf");
void SNDKILL(int v) asm("SNDKILL");
void SNDDELTA(int v,int x) asm("SNDDELTA");
void SNDFREQ(int v,int y) asm("SNDFREQ");
void SNDVOLRESET(int v) asm("SNDVOLRESET");
void SNDPLAYFREQ(int v,int x,int y) asm("SNDPLAYFREQ");
void delay(int x) asm("delay");
void loadclut(unsigned short *paladdress, short target_clut, short no_of_indices) asm("loadclut");
extern void RAPTOR_particles_GPU_erase() asm ("RAPTOR_particles_GPU_erase");
extern void RAPTOR_particles_GPU_plot() asm ("RAPTOR_particles_GPU_plot");
extern void RAPTOR_fade_clut() asm ("RAPTOR_fade_clut");
extern void RAPTOR_fade_clutindex() asm ("RAPTOR_fade_clutindex");
extern int fadesingle(short clut_index,short target_col) asm("fadesingle");
int fadepal(int clut_no,int fade_cols,int *palette) asm("fadepal");
extern short raptor_fade_delay asm("raptor_fade_delay");
void SNDZEROPLAY(int channel, void *sound_address, int sample_size, int sample_divider, int play_command) asm("SNDZEROPLAY");
extern short hiscore_check(int score, char *name, int table) asm("hiscore_check");
extern void RAPTOR_resort_score_table() asm("RAPTOR_resort_score_table");
extern void RAPTOR_mt_save() asm("RAPTOR_mt_save");
extern void ZEROPAD() asm("ZEROPAD");
volatile extern void Input_SetJoyPort1() asm("Input_SetJoyPort1");
volatile extern void Input_SetJoyPort2() asm("Input_SetJoyPort2");
volatile extern void Input_SetNormalPadMode() asm("Input_SetNormalPadMode");
volatile extern void Input_SetRotaryMode() asm("Input_SetRotaryMode");
volatile extern void Input_SetAtariMouseMode() asm("Input_SetAtariMouseMode");
volatile extern void Input_SetAmigaMouseMode() asm("Input_SetAmigaMouseMode");
extern void RBRA(long object_number, long branch_type, long ypos, long object_to_branch_if_taken) asm("RBRA");
extern void bin2asc(long number, long no_digits, char *string) asm("bin2asc");
extern void powaset(int spr_index, int offset, int no_of_times, void *array_of_values) asm("powaset");
extern void powadiff(int spr_index, int offset, int no_of_times, void *array_of_values) asm("powadiff");
extern void powazap(int spr_index, int offset, int no_of_times, int value) asm("powazap");
extern void powabset(int spr_index, int offset, int no_of_times, void *array_of_values, int skip_offset) asm("powabset");
extern void powabdiff(int spr_index, int offset, int no_of_times, void *array_of_values, int skip_offset) asm("powabdiff");
extern void powabzap(int spr_index, int offset, int no_of_times, int value, int skip_offset) asm("powabzap");
extern void powaunpack(int source, int destination) asm("powaunpack");
extern void powablitlist(void *blitlist) asm("powablitlist");
extern void fullpowablitlist(void *blitlist) asm("fullpowablitlist");
extern void RAPTOR_particle_clear() asm ("RAPTOR_particle_clear");
extern int position_in_highscore asm("position_in_highscore");
extern void hiscore_sort(int table_to_sort) asm("hiscore_sort");

#define raptor_highscores_hex raptor_highscores1_hex
#define raptor_highscores_nam raptor_highscores1_nam


/* Construct binary constants at compile time
   Code by Tom Torfs */

/* Helper macros */
#define HEX__(n) 0x##n##LU
#define B8__(x) ((x&0x0000000FLU)?1:0) \
+((x&0x000000F0LU)?2:0) \
+((x&0x00000F00LU)?4:0) \
+((x&0x0000F000LU)?8:0) \
+((x&0x000F0000LU)?16:0) \
+((x&0x00F00000LU)?32:0) \
+((x&0x0F000000LU)?64:0) \
+((x&0xF0000000LU)?128:0)

/* User macros */
#define B8(d) ((unsigned char)B8__(HEX__(d)))
#define B16(dmsb,dlsb) (((unsigned short)B8(dmsb)<<8) \
+ B8(dlsb))
#define B32(dmsb,db2,db3,dlsb) (((unsigned long)B8(dmsb)<<24) \
+ ((unsigned long)B8(db2)<<16) \
+ ((unsigned long)B8(db3)<<8) \
+ B8(dlsb))

static __attribute__((always_inline)) short xdivs(int divid, short divis)
{
 __asm__("divs.w %1,%0;" : "+d"(divid) : "X"(divis) : "cc" );
 return (short)divid;
}

static __attribute__((always_inline)) unsigned short xdivu(unsigned int divid, unsigned short divis)
{
 __asm__("divu.w %1,%0;" : "+d"(divid) : "X"(divis) : "cc" );
 return (unsigned short)divid;
}

static __attribute__((always_inline)) int xmuls(int multid, short mults)
{
  __asm__("muls.w %1,%0;" : "+d"(multid) : "X"(mults) : "cc" );
  return multid;
}

static __attribute__((always_inline)) unsigned int xmulu(unsigned int multid, unsigned short mults)
{
  __asm__("mulu.w %1,%0;" : "+d"(multid) : "X"(mults) : "cc" );
  return multid;
}
