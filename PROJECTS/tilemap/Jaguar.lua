-------------------------------------------------
-------------------------------------------------
-- MDPPY
-- Kaneda (http://www.spritesmind.net)
--
-- v0.0 : 24 August '06
--		Initial working version
-- v0.1 : 10 April '07
--		public release
-------------------------------------------------
-------------------------------------------------

function main ()
	local isok = mappy.msgBox ("Jaguar Export", "This will export the layer in DC.W format", mappy.MMB_OKCANCEL, mappy.MMB_ICONQUESTION)
	if isok ~= mappy.MMB_OK then
		error("Exporting aborted",0)
	end 
 
  local w = mappy.getValue(mappy.MAPWIDTH)
  local h = mappy.getValue(mappy.MAPHEIGHT)

  if (w == 0) then
  	error("You need to load or create a map first",0)
	end
 
----	local isok,mapname = mappy.doDialogue ("MDPPY", "Name of file:", "mappy", mappy.MMB_DIALOGUE1)
----	if isok ~= mappy.MMB_OK then
----		error("no name given", 0)
----	end

  local isok,asname = mappy.fileRequester (".", "Source file (*.s)", "*.s", mappy.MMB_SAVE)
  if isok ~= mappy.MMB_OK then
		error("no filename given", 0)
	end
	if (not (string.sub (string.lower (asname), -4) == ".asm")) then
		asname = asname .. ".s"
	end

	local maxblk = mappy.getValue (mappy.NUMBLOCKSTR)
	local maxlayer = mappy.getValue (mappy.NUMLAYERS)
	local width  = mappy.getValue (mappy.MAPWIDTH)
	local height  = mappy.getValue (mappy.MAPHEIGHT)
	local nbColor = 16; --mappy.getValue (mappy.BLOCKDEPTH)
	outas = io.open (asname, "w")

	outas:write (  ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;\n" );
	outas:write (  ";;                         ;;\n" );
	outas:write (  ";; MAPPY Exporter for DC.W ;;\n" );
	outas:write (  ";;                         ;;\n" );
	outas:write (  ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;\n\n" );


---- 		.global mapname
---- mapname:
----		dc.w width
----		dc.w height
----		dc.b nbcolors
---- 		dc.l mapname_pal
----		dc.w nbtiles
----		dc.l mapname_tiles
----		dc.w nbmap/layer
----		dc.l mapname_maps


----------- maps

----------- maps=>bg
	--- change the order if you want a horizontal/vertical scroll, positive/negative scroll
	h = 0;
	while h < height do
		outas:write ( string.format('\n  dc.w ' ) );
		w = 0;
		while w < width do
			local R = mappy.getBlock (w, h , 0);
			outas:write ( string.format('$%X', R ) );
			
			if w ~= width-1 then
			  outas:write (string.format(','));
			end 
			
			w = w + 1
		end -- while w
		h = h + 1
	end -- while h

	outas:write ( string.format('\n END OF FILE\n') );
	
	outas:close ()
end

test, errormsg = pcall( main )
if not test then
    mappy.msgBox("Error ...", errormsg, mappy.MMB_OK, mappy.MMB_ICONEXCLAMATION)
end
