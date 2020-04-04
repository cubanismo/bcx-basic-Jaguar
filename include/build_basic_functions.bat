REM rem ee_printf WILL crash without -O2, so take care!
..\BIN\m68k-atari-mint-gcc basic_functions.c -c -O2 -I. -Iinclude -fcall-saved-a1 -fcall-saved-d1
..\BIN\m68k-atari-mint-gcc basic_functions.c -S -O2 -I. -Iinclude -fcall-saved-a1 -fcall-saved-d1
..\BIN\m68k-atari-mint-gcc ee_printf.c -c -O3 -I. -Iinclude
