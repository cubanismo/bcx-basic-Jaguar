@echo off

echo   ___           _             ___          _      _   
echo  ^| _ \__ _ _ __^| ^|_ ___ _ _  ^| _ ) __ _ __(_)__ _^| ^|_ 
echo  ^|   / _` ^| '_ \  _/ _ \ '_^| ^| _ \/ _` (_-^< / _^|_   _^|
echo  ^|_^|_\__,_^| .__/\__\___/_^|   ^|___/\__,_/__/_\__^| ^|_^|  
echo           ^|_^|                                         

rem -------------------------------------------------------------
rem Remove the .rbplus extension from the parameter if found
rem and pathname
set PROJECTNAME=%~n1

rem -------------------------------------------------------------
rem set build tools path
if "%RBTOOLS%" neq "" goto :set_from_environment
rem if not found then assume rbtools directory is the current.
rem Dangerous but compatible with old style build system
rem (new versions will have this set from the installer)
if "%RBTOOLS%" == "" for %%f in ("%cd%") do set RBTOOLS=%%~sf

:set_from_environment
if defined RBASIC+ goto :pathset
set PATH=%RBTOOLS%;%RBTOOLS%\bin;%PATH%
set RBASIC+=64

:pathset

rem if %RBTOOLS%=="" SET RBTOOLS=d:\Atom\raptor\RAPTOR~4
rem This gets the current path in 8.3 format, might be useful for RBTOOLS too?
set CURRENTPATH_FULL=%cd%
for %%f in ("%cd%") do set CURRENTPATH=%%~sf

rem -------------------------------------------------------------
rem check to see if project exists in "projects\projectname"
rem or "projectname" - the second has precedence
set BUILDPATH=%CURRENTPATH%\PROJECTS\%PROJECTNAME%
if exist %PROJECTNAME%\%PROJECTNAME%.bas set BUILDPATH=%CURRENTPATH%\%PROJECTNAME%
set TEMPDIR=%BUILDPATH%\build
rem assume no ROM mode
set ROM_MODE=

rem -------------------------------------------------------------
if [%PROJECTNAME%] neq [] goto :dobuild
echo Usage: build.bat projectname
echo        build.bat projectname sendy
echo        build.bat projectname ROM
echo        build.bat projectname ROM sendy
echo        build.bat projectname ROM FASTDEPACK
echo        build.bat projectname ROM FASTDEPACK sendy
echo        build.bat projectname ROM UNPACKED
echo        build.bat projectname ROM UNPACKED sendy
echo        build.bat projectname sendy bjl
echo        build.bat projectname new
echo.
echo Folder "projectname" must exist inside folder "projects"
echo and have a file called "projectname.bas" inside.
echo.
echo When building a ROM it is assumed that there will exist
echo a file called assets.txt inside the project folder
echo and will contain all assets to be included in ROM (if any).
echo By default the rb+ main program is packed into the ROM
echo and depacked during boot. This can be avoided by passing
echo the UNPACKED switch.
echo.
echo If FASTDEPACK is passed while building a ROM then the
echo code and data will be depacked using a GPU routine
echo instead of CPU resulting in faster startup times.
echo CONSIDER THIS EXPERIMENTAL FOR NOW - YOU'RE ON YOUR OWN!
echo.
echo if you specify "new" then a new project will be created
echo from the "include\template" folder. No project will be
echo created if folder exists.
echo .
echo If one of the parameters is BOSSMODE then virtualjaguar is not run.
echo.
echo If one of the parameters is CLEAN, the build folder will be wiped.
echo Otherwise, an incremental build is preformed
echo.
echo if you specify "sendy" the project, upon succesful compilation
echo will be sent to Skunkboard (caution - when using ROM, bank
echo #1 will be erased without any warning!)
echo.
echo "bjl" will upload the binary to Jaguar via BJL. Note that
echo you might need to edit the command line parameters to the uploader
echo in this file (just search for "lo_inp.exe")
echo.
echo Current projects:
if exist projects (
dir /AD /B projects
) else (
dir /AD /B
)
goto :veryend

rem -------------------------------------------------------------
:dobuild
if /i "%2" == "new" goto :newproject
echo ------------------------------------------------------------
echo Building RAPTOR Basic+ Application
echo.

rem -------------------------------------------------------------
rem If user specified CLEAN, zap the whole build folder
if /i "%2"=="CLEAN" goto :clean
if /i "%3"=="CLEAN" goto :clean
if /i "%4"=="CLEAN" goto :clean
if /i "%5"=="CLEAN" goto :clean
if /i "%6"=="CLEAN" goto :clean
goto :noclean

:clean
call rmdir /s /q %TEMPDIR%
mkdir %TEMPDIR%

:noclean

rem -------------------------------------------------------------
rem check if FASTDEPACK was passed

if /i "%2"=="FASTDEPACK" goto :setfast
if /i "%3"=="FASTDEPACK" goto :setfast
if /i "%4"=="FASTDEPACK" goto :setfast
if /i "%5"=="FASTDEPACK" goto :setfast
if /i "%6"=="FASTDEPACK" goto :setfast
goto :slowdepack

:setfast
echo GPU depack selected - helmets on!
set FASTDEPACK=fastdepack

:slowdepack

rem -------------------------------------------------------------
rem delete residual files from previous builds
if exist %BUILDPATH%\%PROJECTNAME%.abs del %BUILDPATH%\%PROJECTNAME%.abs
if exist %TEMPDIR%\basic.o del %TEMPDIR%\basic.o
if exist %TEMPDIR%\%PROJECTNAME%.c del %TEMPDIR%\%PROJECTNAME%.c
if exist %TEMPDIR%\%PROJECTNAME%.o del %TEMPDIR%\%PROJECTNAME%.o

rem -------------------------------------------------------------
rem abort build if bas file doesn't exist
if not exist %BUILDPATH%\%PROJECTNAME%.bas echo %BUILDPATH%\%PROJECTNAME%.bas doesn't exist!
if not exist %BUILDPATH%\%PROJECTNAME%.bas goto :builderror
if not exist %TEMPDIR% mkdir %TEMPDIR%
echo Build started on %date% %time% > %TEMPDIR%\build.log

rem -------------------------------------------------------------
rem let's build the linkfile and romassets.inc/.h/ramassets.inc right here
rem does asset conversion too
if exist %BUILDPATH%\%PROJECTNAME%.rom del %BUILDPATH%\%PROJECTNAME%.rom
if exist %TEMPDIR%\%PROJECTNAME%.bin del %TEMPDIR%\%PROJECTNAME%.bin
if exist %BUILDPATH%\romassets.h del %BUILDPATH%\romassets.h
if exist %BUILDPATH%\romassets.inc del %BUILDPATH%\romassets.inc
if exist %BUILDPATH%\ramassets.inc del %BUILDPATH%\ramassets.inc
if exist %TEMPDIR%\linkfile.bin del %TEMPDIR%\linkfile.bin
echo. >> %TEMPDIR%\build.log
buildlink %BUILDPATH%\assets.txt %BUILDPATH% %FASTDEPACK%
if %ERRORLEVEL% == 2 goto :builderror
if exist %TEMPDIR%\linkfile.bin set ROM_MODE=1

rem -------------------------------------------------------------
rem assemble raptor skeleton
:assembleraptor
echo. >> %TEMPDIR%\build.log
echo Assembling raptor skeleton... >> %TEMPDIR%\build.log
cd %BUILDPATH%
rmac -fb -u -i"%RBTOOLS%\include" -o build\basic.o rapapp.s >> %TEMPDIR%\build.log 2>&1
cd %CURRENTPATH_FULL%
if NOT EXIST %TEMPDIR%\basic.o goto :builderror

rem -------------------------------------------------------------
rem translate .bas file to C
echo. >> %TEMPDIR%\build.log
echo Translating .bas file to C... >> %TEMPDIR%\build.log
bc %BUILDPATH%\%PROJECTNAME%.bas  -f:%TEMPDIR%\%PROJECTNAME%.c >> %TEMPDIR%\build.log
if %ERRORLEVEL% NEQ 0 goto :builderror

rem -------------------------------------------------------------
rem Compile C code
echo. >> %TEMPDIR%\build.log
echo Compiling C code... >> %TEMPDIR%\build.log
m68k-atari-mint-c++ -O2 -I"%RBTOOLS%\include" -I%BUILDPATH%\ -c %TEMPDIR%\%PROJECTNAME%.c -o %TEMPDIR%\%PROJECTNAME%.o >> %TEMPDIR%\build.log 2>&1
if %ERRORLEVEL% NEQ 0 goto :builderror
if not exist %TEMPDIR%\%PROJECTNAME%.o goto :builderror
m68k-atari-mint-c++ -x c++ -O2 -I"%RBTOOLS%\include" -I%BUILDPATH%\ %TEMPDIR%\%PROJECTNAME%.c -S -o %TEMPDIR%\%PROJECTNAME%.s >> %TEMPDIR%\build.log 2>&1
if /i "%2" neq "ROM" (if "%ROM_MODE%"=="" goto :norom)

rem -------------------------------------------------------------
rem Link binaries
set PACKROM=packed
if /i "%2"=="UNPACKED" goto :unpackedrom
if /i "%3"=="UNPACKED" goto :unpackedrom
goto :packedrom
:unpackedrom
set PACKROM=unpacked
:packedrom
echo Building %PACKROM% ROM file...
echo. >> %TEMPDIR%\build.log
echo Linking things... >> %TEMPDIR%\build.log
rln -z -rq -m -o %TEMPDIR%\%PROJECTNAME%.bin -n -a 4000 x x %TEMPDIR%\basic.o "%RBTOOLS%\RAPTOR\RAPTOR.O" "%RBTOOLS%\U235SE\DSP.OBJ" "%RBTOOLS%\include\libm.a" "%RBTOOLS%\include\libc.a" "%RBTOOLS%\include\libgcc.a" "%RBTOOLS%\include\basic_functions.o" "%RBTOOLS%\include\ee_printf.o" "%RBTOOLS%\include\eeprom.o" %TEMPDIR%\%PROJECTNAME%.o >> %TEMPDIR%\build.log
if not exist %TEMPDIR%\%PROJECTNAME%.bin goto :builderror
rln -e -z -rq -m -o %BUILDPATH%\%PROJECTNAME%.abs -a 4000 x x %TEMPDIR%\basic.o "%RBTOOLS%\RAPTOR\RAPTOR.O" "%RBTOOLS%\U235SE\DSP.OBJ" "%RBTOOLS%\include\libm.a" "%RBTOOLS%\include\libc.a" "%RBTOOLS%\include\libgcc.a" "%RBTOOLS%\include\basic_functions.o" "%RBTOOLS%\include\ee_printf.o" "%RBTOOLS%\include\eeprom.o" %TEMPDIR%\%PROJECTNAME%.o >> %TEMPDIR%\build.log

rem -------------------------------------------------------------
rem Let's build a ROM
:buildrom
echo. >> %TEMPDIR%\build.log
echo Making %PACKROM% ROM... >> %TEMPDIR%\build.log
makearom %TEMPDIR%\%PROJECTNAME%.bin %TEMPDIR%\linkfile.bin %BUILDPATH%\%PROJECTNAME%.rom %PACKROM% %FASTDEPACK%
if %ERRORLEVEL% NEQ 0 goto :builderror
if not exist %BUILDPATH%\%PROJECTNAME%.rom goto :builderror

if /i "%6"=="sendy" goto :sendrom
if /i "%5"=="sendy" goto :sendrom
if /i "%4"=="sendy" goto :sendrom
if /i "%3"=="sendy" goto :sendrom
if /i "%2"=="sendy" goto :sendrom
echo. >> %TEMPDIR%\build.log
if /i "%2"=="BOSSMODE" goto :veryend
if /i "%3"=="BOSSMODE" goto :veryend
if /i "%4"=="BOSSMODE" goto :veryend
if /i "%5"=="BOSSMODE" goto :veryend
if /i "%6"=="BOSSMODE" goto :veryend
echo starting vj >> %TEMPDIR%\build.log
start virtualjaguar %BUILDPATH%\%PROJECTNAME%.rom --alpine
goto :veryend
:sendrom
jcp -r
ping localhost >NUL
jcp -f %BUILDPATH%\%PROJECTNAME%.rom
goto :veryend

:norom
rem -------------------------------------------------------------
rem Link binaries
echo Building ABS...
echo. >> %TEMPDIR%\build.log
echo Linking things... >> %TEMPDIR%\build.log
rln -e -z -rq -m -o %BUILDPATH%\%PROJECTNAME%.abs -a 4000 x x %TEMPDIR%\basic.o "%RBTOOLS%\RAPTOR\RAPTOR.O" "%RBTOOLS%\U235SE\DSP.OBJ" "%RBTOOLS%\include\libm.a" "%RBTOOLS%\include\libc.a" "%RBTOOLS%\include\libgcc.a" "%RBTOOLS%\include\basic_functions.o" "%RBTOOLS%\include\ee_printf.o" "%RBTOOLS%\include\eeprom.o" %TEMPDIR%\%PROJECTNAME%.o >> %TEMPDIR%\build.log
if not exist %BUILDPATH%\%PROJECTNAME%.abs goto :builderror

rem -------------------------------------------------------------
rem Check file size to see if we passed the 2mb barrier.
rem If yes, abort.
set file="%BUILDPATH%\%PROJECTNAME%.abs"
FOR /F "usebackq" %%A IN ('%file%') DO set size=%%~zA
echo File size=%size% bytes
if %size% lss 1900544 goto :runabs
echo ...which is waaay too big for .abs - aborting!
echo File too big for .abs - aborting build
goto :veryend

rem -------------------------------------------------------------
rem Don't run vj if no .abs file was produced
:runabs
if not exist %BUILDPATH%\%PROJECTNAME%.abs goto :builderror
echo. >> %TEMPDIR%\build.log
echo Build successful! >> %TEMPDIR%\build.log

rem -------------------------------------------------------------
rem Run vj or send binary to skunk
if /i "%2"=="sendy" goto :sendabs
echo. >> %TEMPDIR%\build.log
if /i "%2"=="BOSSMODE" goto :veryend
if /i "%3"=="BOSSMODE" goto :veryend
if /i "%4"=="BOSSMODE" goto :veryend
if /i "%5"=="BOSSMODE" goto :veryend
echo Starting vj
echo starting vj >> %TEMPDIR%\build.log
start virtualjaguar %BUILDPATH%\%PROJECTNAME%.abs --alpine
goto :veryend
:sendabs
if /i "%3"=="bjl" goto :sendbjl
echo Sending to skunkboard...
echo. >> %TEMPDIR%\build.log
echo Sending to skunkboard... >> %TEMPDIR%\build.log
jcp -r
ping localhost >NUL
jcp %BUILDPATH%\%PROJECTNAME%.abs
goto :veryend
:sendbjl
echo Sending to bjl (hopefully)... >> %TEMPDIR%\build.log
lo_inp.exe -8 -b 0x4000 %BUILDPATH%\%PROJECTNAME%.abs
goto :veryend

rem -------------------------------------------------------------
rem Error handler
:builderror
echo Build error!
if exist %TEMPDIR%\build.log echo Build error! >> %TEMPDIR%\build.log
if exist %TEMPDIR%\build.log type %TEMPDIR%\build.log
goto :veryend

rem -------------------------------------------------------------
rem Create a new project
:newproject
if exist projects\%PROJECTNAME%\%PROJECTNAME%.bas goto :veryend
xcopy /e "%RBTOOLS%\include\template" projects\%PROJECTNAME%\
rename projects\%PROJECTNAME%\template.bas %PROJECTNAME%.bas
echo Project: %PROJECTNAME% >projects\%PROJECTNAME%.rbplus
echo Creator: >>projects\%PROJECTNAME%.rbplus
echo Date of creation: %DATE% >>projects\%PROJECTNAME%.rbplus
echo Project %PROJECTNAME% created successfully!

:veryend

rem Unset variables
set CURRENTPATH=
set CURRENTPATHFULL=
set TEMPDIR=
set PROJECTNAME=
set FASTDEPACK=

goto :eof

