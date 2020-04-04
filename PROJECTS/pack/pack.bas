
rlist=(RAPTOR_LIST *)strptr(RAPTOR_sprite_table)                        'define the rlist depedancy, this is only needed if you use rlist, if you want to use rsetobj this can be deleted
                                                                        'rlist commands are used below


dim buffer[352*250*2/4] as integer                                      'define enough space to store the decompressed image
                                                                        'how 352*250*2/4 is decided uppon is as follows: the original image is 352 pixels wide and 250 pixels high, 16 bit image uses 2 bytes per pixel
                                                                        'the integer datatype uses 4 bytes within RB+ and we do not need all 4 bytes of it, so we need to devide this by 4 so we dont waste space.
                                                                        

                                                                        
$comment                                                                define start of comment
powaunpack (source_address           ,destination_address) - unpacks data from source_address to destination_address.
                                                 Note that it's your responsibility to reserve enough RAM 
                                                 for unpacking. Also, no checking to see if a packed asset
                                                 exists at the source address - again it's your responsibility!
$comment                                                                define end of comment
                                                                
powaunpack ((int)strptr(source_image),(int)(int *)buffer)               'decompress the packed image defined in the assets.txt 'source_image' which gives the start address of the data.
                                                                        'as with loadclut, some conversion needs to be done to convert it into an integer value suitable for use
                                                                        'so we use (int) to convert the strptr(source_image) return value into integer.


rlist [0].gfxbase = (int)buffer                                         'change the pre defined object list object start of bitmap data address of the newly decompressed image. we just need the start address of the variable so we just use the variable name
rlist [0].active = R_is_active                                          'activate the object            

do                                                                      'start never ending loop
    vsync                                                               'waits till the next vertical blank and update all raptor objects
loop                                                                    'conclude the never ending loop
