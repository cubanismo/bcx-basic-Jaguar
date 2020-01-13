'******************************************************************************
'         BCX - The Basic To C/C++ Translator Version 6.00  2008/03/13
'******************************************************************************
'                        (c) 1999 - 2009 Kevin Diggins
'******************************************************************************
CONST Version$ = "6.00 (2009/06/02)" 'BCX version number and date (YYYY/MM/DD)
'*******************************************************************************
'
'BCX is distributed under the terms of the GNU General Public License Ver.(2).
'The complete source code that is PRODUCED BY BCX is subject to a License
'Exception to the GPL, which allows you to produce commercial applications.
'
'******************************************************************************
'                             BCX LICENSE EXCEPTION
'******************************************************************************
'
'As a special exception, the BCX license gives permission for additional uses
'of the text contained in its release of BCX. The exception is that, if you use
'BCX to create source code that will link the BCX libraries with other files to
'produce an executable, this does not by itself cause the resulting executable
'to be covered by the GNU GPL.  Your use of that executable is in no way
'restricted on account of using BCX to produce source code that will link the
'BCX library code into it.
'
'This exception does not invalidate any other reasons why the executable file
'might be covered by the GNU General Public License.  This exception applies
'only to the code released with this BCX explicit exception. If you add or copy
'code from other sources, as the General Public License permits, the above
'exception does not apply to the code that you add in this way.
'
'To avoid misleading anyone as to the status of such modified files, you must
'delete this exception notice from them.  If you write modifications of your
'own for BCX, it is your choice whether to permit this exception to apply to
'your modifications.

'This program is distributed in the hope that it will be useful, but WITHOUT
'ANY WARRANTY; WITHOUT EVEN THE IMPLIED WARRANTY  OF MERCHANTABILITY OR FITNESS
'FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
'
'You should have received a copy of the GNU General Public License along with
'this program; if not, write to the Free Software Foundation, Inc.,
'59 Temple Place - Suite 330, Boston, MA  02111-1307, USA or visit
'http://www.gnu.org/copyleft/gpl.html#SEC1


$COMMENT - Comment section added 10/20/2004 05:00AM by Vic McClung
*******************************************************************************
Developer Guidelines
*******************************************************************************
Code should be written in BCX Basic. If it can not be written in BCX Basic for
some reason or results in code that seems too inefficient then this may be a
cue that a new Basic function is needed.

* All KEYWORDS should be capitalized
* Use two space indentation
* Use spaces not tabs
* Record all notes in reverse chronological order
* When adding a runtime function please enclose it as described below:
* The first line of code should be formatted as follows, that is the
* first line should be type name ( param1, parm1, ....)
* for example:
* FPRINT Outfile,"int Eof(FILE* stream)"
* DO NOT split the line!
* second line should only cantain the opening bracket, for example:
* FPRINT Outfile,"{"
* there should be no space between Outfile and the comma and no space
* between the comma and opening double quote, just like the example below:
*

IF Use_Eof THEN
  Add this line--->  IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: Eof"  <---- name of file used in RTL (Eof.c or Eof.cpp)
  FPRINT Outfile,"int EoF (FILE* stream)"
  FPRINT Outfile,"{"
  FPRINT Outfile,"  register int c, status = ((c = fgetc(stream)) == EOF);"
  FPRINT Outfile,"  ungetc(c,stream);"
  FPRINT Outfile,"  return status;"
  FPRINT Outfile,"}\n\n"
  Add this line--->  IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
END IF

* The last line of code in the function should be:
* FPRINT Outfile,"}\n\n"
* When adding a runtime procedure, include in the UseAll subroutine: Use_Eof = TRUE
* This enables creating the runtime library without writing a full-fledged parser to do it. 
* And most importantly....Have fun!

******************************************************************************************
    This section is used to communicate to-do's, changes, ideas, suggestions, etc.
******************************************************************************************
2009/06/02 05:00 GMT-5   Mike Henning
* Changed version to 6.00 as requested by Robert Wishlaw.
* Fixed a naming conflict with the new BCX_Dynacall when used as a return value.

2009/04/27 05:00 GMT-5   Mike Henning
* Merged my changes with Waynes
* New changes include handling of FREE and FREE DYNAMIC.
* DYNAMIC is ignored now relying on free to choose the appropriate method.
* The behavior should be the same now with or without parenthesis.
* Fixed some bugs in the SET statement handling - Variables were not being
* added or recognized properly.
* Fixed the output when using $TRACE
* Some bad code in BCX_PREPARE_COM_TRACE_LINE 
* Added a variation of BCX_DynaCall for easier runtime execution of functions
  not known at compile time.
  BCX_DynaCall("Dll_Name", "Function_Name", NumberOFArgs, ArgArray)

2009/03/12 05:00 GMT-5   Wayne Halsdorf
* Reformatted some of the code
* Added some addition tests for invalid type combinations in COM
* Added additional return types to COM
* Applied Robert Wishlaw's reformating of code

2009/02/12 05:00 GMT-5   Wayne Halsdorf
* Finished correcting all the bugs that I'm aware off in the COM section.
* To DO: 1. Reformat code (anyone up for this)
*        2. Add code to handle all variant types. (much easier to do now)
*        3. Put together a collection of COM examples to serve as a test base.
*        4. Inform Robert as to changes in COM that differ from currently in help file.

2009/01/27 05:00 GMT-5   Wayne Halsdorf
* Start of modification of COM routines to be able to handle arrays of OBJECTs.
* Note: Not every posible combination has been tried.
*       I use a modified version of BCX where I test out various ideas to improve
*       the performance and the expandablity of BCX. This version contains
*       some of those modifications to make it easier to modify changes in
*       the COM routines. Some can be easily added to the current version of BCX. 
* Added internal FUNCTIONS FindWord & GetWordInfo to lookup various words 
*       and return information on type.
*       The function FindWord uses a binary searcg method, with GetWordInfo
*       using a modified version, resulting in a maximum
*       lookup attempts (for x number words) equal to LOG(x)/LOG(2) 
*
2009/01/27 00:00 GMT-5    Mike Henning
* Fixed a bug in the BCX_SETCOLOR function that would cause many color 
  combinations to not show transparent correctly.


2009/01/24 11:00 GMT-7    Kevin Diggins
* Found and removed more unused global variables
* Minor text editing

2009/01/23 05:00 GMT-7    Kevin Diggins
* Found and removed more unused global variables
* Found and removed commented, deprecated code fragments
* Minor text editing and formatting

2009/01/21 05:00 GMT-5    Wayne Halsdorf
* Fixed bug in OPTIONAL (introduced in last fix of OPTIONAL) was adding phantom varible 
* Fixed BCX_SETCOLOR when 3 parameters supplied

2009/01/19 05:00 GMT-7    Kevin Diggins
* Reformatting & general text editing of this document for easier reading
* Removed StkTmp$[] & related dead code
* Removed Xport$ related dead code 
* Removed CObjectTest related dead code
* Removed LinesWritten dead function
* Removed CompStructVars dead function
* Removed Obsolete switches
* Replace FUNCTION BraceCount with new version by Mike Henning


2009/01/16 00:00 GMT-5    Wayne Halsdorf
* Fixed joining of strings detection routine
* 1. handle arrays of structures with string elements - structure[i].string$ , structure[i]->string$
* 2. handle dereference of pointer to structure with string element (*structure).string$
* Fixed bug in OPTIONAL. Example:  a=1 as int  would output wrong code for prototype
* Added code to SET/END SET so that the translator knows what type it is.

01/10/2009 00:00 GMT-5    Mike Henning
* Fixed the Descending dynamic string in qsort
* Added Kevins fixes for the COM functions
* Fixed the handling of the image index for BCX_TOOLBAR
* Removed a couple of function returns that were not needed giving
* "code can not be reached" compiler warnings.
* Added "return" to be sensed when removing dead callback code.
* Increased the buffers in USING$ from 100 to 512

2008/10/08 00:00 GMT-5    Wayne Halsdorf
* Fixed bug introduced in FREE when it was exteneded
* Fixed bug in type detection in CheckGlobal and CheckLocal

2008/10/07 00:00 GMT-5    Wayne Halsorf
* Fixed bug in SWAP when dealing with undefined typed
* Fixed internal bug for getting information from GetTypeInfo when
*   _CLASS is appended to structure type
* Extened usage of DYNAMIC and FREE to include use in structures

2008/08/22 00:00 GMT-5 -  Wayne Halsdorf
* fixed bug in getprocaddress
* fixed on ... goto,gosub,call so that the argument can be of the form (x BAND 7)
* Fixed obscure bug in SplitLines FUNCTION involving parentheses
* SWAP - Changed char to byte for safer swapping based on size
*      - Can now handle dynamic strings
* Rolled chdir, _chdir, rmdir, _rmdir, mkdir, _mkdir into one operation     

2008/07/08 00:00 GMT-8 -  Robert Wishlaw
* Replaced instances of while(1) with for(;;)

2008/07/08 00:00 GMT-8 -  Wayne Halsdorf
* Modified TALLY Function to accept an optional case insensitivity argument.

2008/05/28 19:00 GMT-8 -  Wayne Halsdorf
* Modified CONTAINEDIN Function to work with Borland compiler.

2008/05/26 20:00 GMT-8 -  Wayne Halsdorf
* Revised IncludeCount value to 29 to accomodate process.h header file.

2008/05/25 19:00 GMT-8 -  Wayne Halsdorf
* Repaired WITH ... END WITH bug

2007/02/23 15:45PM GMT-8 - Mike Henning
* Fixed the SAVEBMP function.

$COMMENT ================== END OF COMMENT SECTION ============================


CONST __BCX__ = 1 ' define BCX so we know we are in bc.bas

$NOMAIN
$GENFREE
$IPRINT_OFF
$NOINI
$LEANANDMEAN
$TURBO

$HEADER
  typedef long (CALLBACK *CPP_FARPROC)(char *);
  static CPP_FARPROC PPProc;
$HEADER

ENUM
  vt_UNKNOWN             '  Not a Variable
  vt_STRLIT              '  "Quoted String Literal"
  vt_INTEGER             '  Integer%
  vt_SINGLE              '  Single!
  vt_DOUBLE              '  Double#
  vt_LDOUBLE             '  Long Double¦
  vt_LLONG               '  Long Long
  vt_STRVAR              '  StringVariable$
  vt_DECFUNC             '  Translated Decimal Func: Strlen,Asin
  vt_NUMBER              '  A Pure Literal Number
  vt_FILEPTR             '  @ FILE*
  vt_UDT                 '  User ( or Windows ) Defined Type
  vt_STRUCT              '  Structures
  vt_UNION               '  Unions
  vt_LPSTR
  vt_BOOL
  vt_CHAR
  vt_LPSTRPTR
  vt_PCHAR
  vt_CHARPTR
  vt_VOID
  vt_LONG
  vt_DWORD
  vt_FARPROC
  vt_LPBYTE
  vt_LRESULT
  vt_BYTE
  vt_SHORT
  vt_USHORT
  vt_UINT
  vt_ULONG
  vt_ULLONG
  vt_HWND
  vt_HDC
  vt_COLORREF
  vt_HANDLE
  vt_HINSTANCE
  vt_WNDCLASSEX
  vt_HFONT
  vt_VARIANT
END ENUM


'*********************************
CONST vt_VarMin    =  2
CONST vt_VarMax    =  vt_VARIANT
'*********************************

ENUM
  mt_ProcessSetCommand
  mt_FuncSubDecC_Dec
  mt_FuncSubDecC_Dec2
  mt_Opts
  mt_Opts2
  mt_Opts3
  mt_OverLoad
  mt_OverLoad2
  mt_FuncSubx1
  mt_FuncSubx2
END ENUM

'*****************************************
' Variable types for COM, OLE and VARIANT
ENUM
  comvt_BAD = -1
  comvt_TRUE
  comvt_FALSE
  comvt_BOOL
  comvt_BSTR
  comvt_STRVAR
  comvt_R4
  comvt_R8
  comvt_R8_LITERAL
  comvt_CY
  comvt_DATE
  comvt_DISPATCH
  comvt_PVOID
  comvt_ERROR
  comvt_VARIANT
  comvt_UNKNOWN
  comvt_DECIMAL
  comvt_I1
  comvt_UI1
  comvt_I2
  comvt_UI2
  comvt_I4
  comvt_I4_LITERAL
  comvt_UI4
  comvt_I8
  comvt_UI8
  comvt_INT
  comvt_UINT
  comvt_VOID
  comvt_OBJECT
  comvt_EMPTY
  comvt_NULL
  comvt_HRESULT
  comvt_PTR
  comvt_SAFEARRAY
  comvt_CARRAY
  comvt_USERDEFINED
  comvt_LPSTR
  comvt_LPWSTR
  comvt_RECORD
  comvt_INT_PTR
  comvt_UINT_PTR
  comvt_FILETIME
  comvt_BLOB
  comvt_STREAM
  comvt_STORAGE
  comvt_STREAMED_OBJECT
  comvt_STORED_OBJECT
  comvt_BLOB_OBJECT
  comvt_CF
  comvt_CLSID
  comvt_VERSIONED_STREAM
  comvt_BSTR_BLOB
  comvt_NAMED_ARGUMENT
  comvt_CAST
  comvt_DEFAULT
END ENUM

CONST comvt_VECTOR    = 0x1000
CONST comvt_ARRAY     = 0x2000
CONST comvt_BYREF     = 0x4000
CONST comvt_TYPEMASK  = 0x0FFF
CONST comvt_ILLEGAL   = 0xFFFF
'*****************************************

CONST fprintf = ReDirectFPrint

'******************************
'   User Defined Type Support
'******************************

CONST MaxElements   =  128
CONST MaxTypes      =  512
CONST MaxLocalVars  =  512
CONST MaxGlobalVars = 4096  'max size 233000

'******************************
'   Library Support
'******************************

CONST MaxLib        = 64    ' max no of libraries

'***********************
'  Bracket Handling
'***********************

CONST c_SglQt = 39
CONST c_DblQt = 34
CONST c_LPar  = 40
CONST c_RPar  = 41
CONST c_Komma = 44
CONST c_LtBkt = 91
CONST c_RtBkt = 93

'**************************************************************
' $PROJECT/Runtime Library support
' These are used to keep Modifiers of BCX source code
' from accidently changing certain output lines of
' code that are used by the $PROJECT/Library code
'**************************************************************
CONST BCX_STR_RUNTIME          = "Runtime Functions"
CONST BCX_STR_VBS_STRUCTS      = "VBSCRIPT SUPPORT STRUCTURES"
CONST BCX_STR_MAIN_PROG        = "Main Program"
CONST BCX_STR_SYS_VARS         = "System Variables"
CONST BCX_STR_STD_MACROS       = "Standard Macros"
CONST BCX_STR_STD_PROTOS       = "Standard Prototypes"
CONST BCX_STR_USR_PROCS        = "User Subs and Functions"
CONST BCX_STR_USR_VARS         = "User Global Variables"
CONST BCX_STR_USR_PROTOS       = "User Prototypes"
CONST BCX_STR_USR_CONST        = "User Defined Constants"
CONST BCX_STR_USR_TYPES        = "User Defined Types And Unions"
'**************************************************************

TYPE functionParse
  NumArgs
  CommaPos[128]
END TYPE

'**************************************************************
'               These need to always stay in sync
'**************************************************************

CONST VarTypes$ = "%$#!@¦"


SET VarTypeLookup[] AS CHAR PTR
  "int", "int", "char *", "double", "float", "FILE *", "long double"
END SET

'**************************************************************
' Struture used in findword
TYPE tagWords
  pszWord AS PCHAR
  iType   AS Integer
END TYPE

CONST WordsInTable(A) = (SIZEOF(A)/SIZEOF(tagWords))

TYPE ARGTYPE
  Arg$
  ArgType
END TYPE


TYPE ProtoStore
  Prototype$[2048] AS CHAR
  Condition$[512]  AS CHAR
  CondLevel        AS INTEGER
END TYPE


TYPE Element
  ElementType      AS INTEGER
  ElementID        AS INTEGER
  ElementDynaPtr   AS INTEGER
  ElementName$[64] AS CHAR
END TYPE


TYPE UserTypeDefs
  TypeofDef             AS INTEGER
  EleCnt                AS INTEGER
  Elements[MaxElements] AS Element
  VarName$[64]          AS CHAR
END TYPE


TYPE VarInfo
  VarLine         AS INTEGER
  VarType         AS INTEGER
  VarDef          AS INTEGER
  VarPntr         AS INTEGER
  VarSF           AS INTEGER
  VarExtn         AS INTEGER
  VarCondLevel    AS INTEGER
  VarEmitFlag     AS INTEGER
  VarName$[64]    AS CHAR
  VarDim$[128]    AS CHAR
  VarModule[300]  AS CHAR
  VarCondDef[128] AS CHAR
END TYPE


TYPE VARCODE
  VarNo     AS INTEGER
  Method    AS INTEGER
  IsPtrFlag AS INTEGER
  Header$
  Proto$
  Functype$
  StaticOut$
  Token$
  AsToken$
END TYPE

TYPE tagComParamDiscrption
  DIM vtType AS Integer
  DIM sVariableName$
END TYPE

'*************************************************************************
' For information on reserved words, currently how to translate
' Additional information may be added in the future.
'*************************************************************************

TYPE tagEmitWords
  DIM spWord AS CHAR PTR
  DIM iWordID AS Integer
  DIM SUB fEmit(X AS Integer)
END TYPE

TYPE tagTokenSuFunctions
  DIM spFunctionName[32] AS CHAR
  DIM spFunctionXName[32] AS CHAR
  DIM iRFlag AS Integer
  DIM iCOM AS Integer
  DIM SUB fpTranslate(X AS Integer)
  DIM uiJFE AS ULONG
END TYPE
'*************************************************************************
'                            GLOBAL VARIABLES
'*************************************************************************

GLOBAL  ByrefVars$[1024]
GLOBAL  ByrefCnt
GLOBAL  CurLine$
GLOBAL  gLinesWritten
GLOBAL  LoopLocalVar[256]
GLOBAL  LoopLocalCnt
GLOBAL  GlobalVarCnt
GLOBAL  BaseTypeDefsCnt[16]
GLOBAL  TypeDefsCnt
GLOBAL  LocalVarCnt
GLOBAL  LocalDynArrCount                          ' Local Dynamic String Array Stack Counter
GLOBAL  LocalDynaCnt                              ' Queue Stack Counter
GLOBAL  GlobalDynaCnt
GLOBAL  Modules$[256]                             ' array of source filenames
GLOBAL  ModuleNdx                                 ' index of source files
GLOBAL  CombineRes                                ' Join generated rc file with existing rc file
GLOBAL  UserResFile$                              ' holds name of user *.rc file
GLOBAL  ResCompiler$                              ' resource compiler, lrc.exe
GLOBAL  ModuleLineNos[256]                        ' line no in source files, uses ModuleNdx also
GLOBAL  FPtrNdx                                   ' Controls $Include Files
GLOBAL  FPtr             [256] AS FILE            ' Controls $Include Files
GLOBAL  Stk$            [4096]                    ' Parse array
GLOBAL  ProtoType       [1024] AS ProtoStore      ' C prototype declarations of user func's
GLOBAL  SrcStk$          [128]                    ' used in parsing single line if-THEN-else
GLOBAL  SplitStk$        [128]                    ' used in parsing ":" separated lines
GLOBAL  SplitCnt
GLOBAL  SplitCur
GLOBAL  SrcTmp$                                   ' used for storing string to use as parameter to Parse()
GLOBAL  CaseStk$         [256]                    ' Stack For Nested "Select Case" variable
GLOBAL  CaseElseFlag     [256]                    ' Set if Select Case contains a Case Else
GLOBAL  Entry$           [256]                    ' Controls the $OnEntry
GLOBAL  Xit$             [256]                    ' Controls the $OnExit
GLOBAL  LocalDynArrName$ [256]                    ' Queues LOCAL dynamic string arrays
GLOBAL  GlobalDynaStr$   [256]
GLOBAL  DynaStr$         [256]                    ' Queues Dynamic strings in SUBS/FUNCTIONS
GLOBAL  StartSub$        [32]                     ' user's startup code subs
GLOBAL  StartNdx                                  ' index for StartSub$
GLOBAL  ExitSub$         [32]                     ' user's exit code subs
GLOBAL  ExitNdx                                   ' index for ExitSub$
GLOBAL  Library$         [MaxLib]                 ' stores libraries to used
GLOBAL  GlobalVarHash[MaxGlobalVars]
GLOBAL  GlobalVars[MaxGlobalVars] AS VarInfo      ' Holds global variables
GLOBAL  LocalVars[MaxLocalVars]   AS VarInfo      ' Holds local variables
GLOBAL  TypeDefs [MaxTypes]       AS UserTypeDefs ' Holds typedefs
GLOBAL  VarCode                   AS VARCODE
GLOBAL  UmQt                                      'Handles quoted lines split with a contination _
'****** Globals for COM parsing ************
GLOBAL  ComNdx
GLOBAL  ComStk$[256]
GLOBAL  ParamToken$[64]
'************************************************************************************************
GLOBAL  Accelerator$
GLOBAL  CallBackFlag
GLOBAL  CallType$         ' Calling convention cdecl, stdcall ...
GLOBAL  CaseFlag
GLOBAL  CaseVar$
GLOBAL  Cmd$
GLOBAL  CmdPP$            ' preprocessor file
GLOBAL  Comma
GLOBAL  Compiler$
GLOBAL  CmdLineConst$
GLOBAL  CmdLineFileOut$
GLOBAL  CurrentFuncType
GLOBAL  DimType$
GLOBAL  DllDecl$  [800][512] AS CHAR
GLOBAL  DllCnt
GLOBAL  Loadlibs$ [128][512] AS CHAR
GLOBAL  LoadLibsCnt
GLOBAL  Elapsed AS SINGLE
GLOBAL  EndOfProgram
GLOBAL  EntryCnt
GLOBAL  ErrFile
GLOBAL  szFile$
GLOBAL  Filnam$
GLOBAL  ForceMainToFunc
GLOBAL  Funcname$
GLOBAL  Handle$
GLOBAL  HFileCnt
GLOBAL  HFiles$[128]
GLOBAL  HFile$
GLOBAL  InConditional
GLOBAL  IncludeCount
GLOBAL  InIfDef$
GLOBAL  Indent
GLOBAL  InfoBoxWarn
GLOBAL  InDialogEvt
GLOBAL  ModDialogEvt
GLOBAL  InFunc
GLOBAL  InMain
GLOBAL  InWinMain
GLOBAL  IsCallBack
GLOBAL  TurboSize
GLOBAL  UseFileTest = TRUE
GLOBAL  UseCProto
GLOBAL  InTypeDef
GLOBAL  IsAuto
GLOBAL  NoTypeDeclare
GLOBAL  IsDim
GLOBAL  IsExported
GLOBAL  IsRegister
GLOBAL  IsStatic
GLOBAL  IsStdFunc
GLOBAL  IsLocal
GLOBAL  IsRaw
GLOBAL  KillCFile
GLOBAL  Keyword1$
GLOBAL  LastCmd
GLOBAL  LinesRead
GLOBAL  Linker$
GLOBAL  Lookup$
GLOBAL  MakeDLL
GLOBAL  Ndx
GLOBAL  NoMain
GLOBAL  NoDllMain
GLOBAL  OkayToSend
GLOBAL  Op$
GLOBAL  OptimizerEnabled
GLOBAL  OptimizerFirstSetting
GLOBAL  OptionBase
GLOBAL  OutfileClone$
GLOBAL  PassOne
GLOBAL  Project$
GLOBAL  ProtoCnt
GLOBAL  Pusher
GLOBAL  PPFlag
GLOBAL  PPDLL_HANDLE AS HINSTANCE
GLOBAL  Use_Library                 ' Vic McClung for Building Runtime Library
GLOBAL  Use_Project                 ' Vic McClung for $PROJECT Support
GLOBAL  Gen_Header                  ' Vic McClung for $Project Support
GLOBAL  Use_Dll                     ' Vic McClung for Building BCXRT.DLL
GLOBAL  Project_Main$               ' main file in project
GLOBAL  Project_List$               ' list of files in project
GLOBAL  Project_Path$               ' path for project output files, i.e. .h;.c;.cpp
GLOBAL  NoRT                        ' No Runtime
GLOBAL  NoKill                      ' don't erase BCXRT.C file - used for debugging runtime
GLOBAL  Quiet                       ' no output to screen, for use with BCX Builder
GLOBAL  ReDirect
GLOBAL  SaveOutfileNum AS FILE
GLOBAL  Scoot$
GLOBAL  ShowStatus
GLOBAL  SrcCnt
GLOBAL  SrcFlag
GLOBAL  TrcFlag
GLOBAL  TestForBcxIni
GLOBAL  FileIn$
GLOBAL  FileOut$
GLOBAL  FileErr$
GLOBAL  T$
GLOBAL  Res_File$
GLOBAL  ResFileOut$
GLOBAL  Test
GLOBAL  Statements
GLOBAL  TestState
GLOBAL  Tipe$
GLOBAL  TranslateSlash
GLOBAL  TypeName$[16]
GLOBAL  UseCpp
GLOBAL  UseFlag
GLOBAL  UseStdCall
GLOBAL  UseLCaseTbl
GLOBAL  WinHeaders
GLOBAL  W1$
GLOBAL  W2$
GLOBAL  W3$
GLOBAL  Var$
GLOBAL  XitCount
GLOBAL  Z$
GLOBAL ConstLastDef$

'**********************
GLOBAL  Use_GUINoMain
GLOBAL  Use_MDIGUINoMain
GLOBAL  GUIIcon$
GLOBAL  GUIMetric$
GLOBAL  Use_Wingui
GLOBAL  Use_MainEvent
GLOBAL  Use_Mdigui
GLOBAL  Use_ShowModal
GLOBAL  Use_EndModal
GLOBAL  Use_AnsiToWide
GLOBAL  Use_Asinh
GLOBAL  Use_Acosh
GLOBAL  Use_AppActivate
GLOBAL  Use_Atanh
GLOBAL  Use_Abs
GLOBAL  Use_Asc
GLOBAL  Use_AppExeName
GLOBAL  Use_AppExePath
GLOBAL  Use_Bff
GLOBAL  Use_Boolstr
GLOBAL  Use_Bor
GLOBAL  Use_Band
GLOBAL  Use_Bnot
GLOBAL  Use_Bin
GLOBAL  Use_Bin2dec
GLOBAL  Use_Cvd
GLOBAL  Use_Cvld
GLOBAL  Use_Cvi
GLOBAL  Use_Cvl
GLOBAL  Use_Cvs
GLOBAL  Use_Cdbl
GLOBAL  Use_Cldbl
GLOBAL  Use_Csng
GLOBAL  Use_Clear
GLOBAL  Use_Chr
GLOBAL  Use_Cbool
GLOBAL  Use_Cint
GLOBAL  Use_Clng
GLOBAL  Use_Color
GLOBAL  Use_ComboBoxLoadFile
GLOBAL  Use_Console
GLOBAL  Use_ContainedIn
GLOBAL  Use_Static
GLOBAL  Use_Crlf
GLOBAL  Use_Csrlin
GLOBAL  Use_Date
GLOBAL  Use_Del
GLOBAL  Use_Doevents
GLOBAL  Use_Download
GLOBAL  Use_Draw
GLOBAL  Use_Dynacall
GLOBAL  Use_DynacallA
GLOBAL  Use_DynamicA
GLOBAL  Use_DrawTransBMP
GLOBAL  Use_Elf
GLOBAL  Use_Enclose
GLOBAL  Use_Environ
GLOBAL  Use_EnumFile
GLOBAL  Use_Exist
GLOBAL  Use_ExitCode
GLOBAL  Use_Extract
GLOBAL  Use_LeanAndMean
GLOBAL  Use_LoadFile
GLOBAL  Use_FillArray
GLOBAL  Use_FirstInstance
GLOBAL  Use_Findfirst
GLOBAL  Use_Findnext
GLOBAL  Use_FindInType
GLOBAL  Use_Fint
GLOBAL  Use_Fix
GLOBAL  Use_FileLocked
GLOBAL  Use_Frac
GLOBAL  Use_Fracl
GLOBAL  Use_Get
GLOBAL  Use_SetDimension
GLOBAL  Use_GetDimension
GLOBAL  Use_Getdrive
GLOBAL  Use_Getfilename
GLOBAL  Use_Getattr
GLOBAL  Use_GetResource
GLOBAL  Use_GetSpecialFolder
GLOBAL  Use_GetTextSize
GLOBAL  Use_GenFree
GLOBAL  Use_Gosub
GLOBAL  Use_Hex
GLOBAL  Use_Hex2Dec
GLOBAL  Use_Hook
GLOBAL  Use_Iif
GLOBAL  Use_Inputbuffer
GLOBAL  Use_Inkey
GLOBAL  Use_InkeyD
GLOBAL  Use_Inputbox
GLOBAL  Use_Infobox
GLOBAL  Use_Isptr
GLOBAL  Use_Inp
GLOBAL  Use_Inpw
GLOBAL  Use_Ins
GLOBAL  Use_Instr
GLOBAL  Use_Inchr
GLOBAL  Use_iReplace
GLOBAL  Use_IRemove
GLOBAL  Use_Instrrev
GLOBAL  Use_Imod
GLOBAL  Use_Join
GLOBAL  Use_Lcase
GLOBAL  Use_Ldouble
GLOBAL  Use_Left
GLOBAL  Use_Like
GLOBAL  Use_ListBoxLoadFile
GLOBAL  Use_Loc
GLOBAL  Use_Locate
GLOBAL  Use_Lof
GLOBAL  Use_Lpad
GLOBAL  Use_Ltrim
GLOBAL  Use_Mcase
GLOBAL  Use_Mid
GLOBAL  Use_Midstr
GLOBAL  Use_Msgbox
GLOBAL  Use_Mkd
GLOBAL  Use_Mkld
GLOBAL  Use_Mki
GLOBAL  Use_Mkl
GLOBAL  Use_Mks
GLOBAL  Use_Min
GLOBAL  Use_Modstyle
GLOBAL  Use_Max
GLOBAL  Use_Now
GLOBAL  Use_Numqsortdint
GLOBAL  Use_Numqsortaint
GLOBAL  Use_Numqsortdfloat
GLOBAL  Use_Numqsortafloat
GLOBAL  Use_Numqsortddouble
GLOBAL  Use_Numqsortadouble
GLOBAL  Use_Idxqsort
GLOBAL  Use_IdxqsortSt
GLOBAL  Use_PtrqsortSt
GLOBAL  Use_Oct
GLOBAL  Use_Outp
GLOBAL  Use_Outpw
GLOBAL  Use_Overloaded
GLOBAL  Use_Panel
GLOBAL  Use_PeekStr
GLOBAL  Use_Pos
GLOBAL  Use_Printer
GLOBAL  Use_ProgressBar
GLOBAL  Use_Proto
GLOBAL  Use_Put
GLOBAL  Use_QBColor
GLOBAL  Use_Randomize
GLOBAL  Use_Rec
GLOBAL  Use_RecCount
GLOBAL  Use_Remain
GLOBAL  Use_Remove
GLOBAL  Use_Repeat
GLOBAL  Use_Replace
GLOBAL  Use_Reverse
GLOBAL  Use_Right
GLOBAL  Use_Rpad
GLOBAL  Use_Rnd
GLOBAL  Use_Exp
GLOBAL  Use_Retain
GLOBAL  Use_Round
GLOBAL  Use_Rtrim
GLOBAL  Use_Scan
GLOBAL  Use_SearchPath
GLOBAL  Use_Sgn
GLOBAL  Use_SingleFile
GLOBAL  Use_Space
GLOBAL  Use_Split
GLOBAL  Use_DSplit
GLOBAL  Use_StartupCode
GLOBAL  Use_Stristr
GLOBAL  Use_StrStr
GLOBAL  Use_Str
GLOBAL  Use_Strl
GLOBAL  Use_Str_Cmp
GLOBAL  Use_Strim
GLOBAL  Use_String
GLOBAL  Use_Strptr
GLOBAL  Use_Strqsorta
GLOBAL  Use_Strqsortd
GLOBAL  Use_Strtoken
GLOBAL  Use_DynStrqsorta
GLOBAL  Use_DynStrqsortd
GLOBAL  Use_Resource
GLOBAL  Use_GenResFile
GLOBAL  Use_Swap
GLOBAL  Use_Sysmacros
GLOBAL  Use_SysStr
GLOBAL  Use_sziif
GLOBAL  Use_Tally
GLOBAL  Use_TempFileName
GLOBAL  Use_Textmode
GLOBAL  Use_Threads
GLOBAL  Use_Timer
GLOBAL  Use_Treeview
GLOBAL  Use_Trim
GLOBAL  Use_Turbo
GLOBAL  Use_Ucase
GLOBAL  Use_Using
GLOBAL  Use_Ubound
GLOBAL  Use_VChr
GLOBAL  Use_VBS
GLOBAL  Use_Verify
GLOBAL  Use_Val
GLOBAL  Use_Vall
GLOBAL  Use_WideToAnsi
GLOBAL  Use_Vscroll
GLOBAL  Use_Hscroll

'*******************

GLOBAL  Use_Bitmap
GLOBAL  Use_Blackrect
GLOBAL  Use_BmpButton
GLOBAL  Use_Button
GLOBAL  Use_Center
GLOBAL  Use_Checkbox
GLOBAL  Use_Combobox
GLOBAL  Use_Datepick
GLOBAL  Use_Edit
GLOBAL  Use_Grayrect
GLOBAL  Use_Group
GLOBAL  Use_Hide
GLOBAL  Use_Icon
GLOBAL  Use_Label
GLOBAL  Use_Listview
GLOBAL  Use_Radio
GLOBAL  Use_Refresh
GLOBAL  Use_SetFont
GLOBAL  Use_Show
GLOBAL  Use_Whiterect

'********************************
' PB Compatible String Constants
'********************************

GLOBAL  Use_BEL
GLOBAL  Use_BS
GLOBAL  Use_CR
GLOBAL  Use_DDQ
GLOBAL  Use_DQ
GLOBAL  Use_EOF
GLOBAL  Use_ESC
GLOBAL  Use_FF
GLOBAL  Use_LF
GLOBAL  Use_NUL
GLOBAL  Use_SPC
GLOBAL  Use_TAB
GLOBAL  Use_VT

'*********************

GLOBAL  O1$    '  "%o"
GLOBAL  S1$    '  "%s"
GLOBAL  S2$    '  "%s%s"
GLOBAL  D1$    '  "%G"
GLOBAL  D2$    '  "% .19LG"
GLOBAL  X1$    '  "%X"
GLOBAL  T0$    '  "%H:%M:%S"
GLOBAL  T1$    '  "%H"
GLOBAL  T2$    '  "%M"
GLOBAL  T3$    '  "%S"
GLOBAL  T4$    '  "%p"
GLOBAL  T5$    '  "%Y"
GLOBAL  T6$    '  "%m"
GLOBAL  T7$    '  "%d"
GLOBAL  T8$    '  "%A"
GLOBAL  T9$    '  "%w"
GLOBAL  T10$   '  "%j"
GLOBAL  T11$   '  "%U"
GLOBAL  U1$

'**************************************************************

GLOBAL  prcFile$   ' translated subs and functions
GLOBAL  udtFile$   ' translated User Defined Types
GLOBAL  datFile$   ' translated DATA statements
GLOBAL  cstFile$   ' translated CONSTants
GLOBAL  ovrFile$   ' translated overloaded subs and functions
GLOBAL  hdrFile$   ' user specified .h directives
GLOBAL  setFile$   ' translated GLOBAL set statements
GLOBAL  resFile$   ' user specified .rc directives
GLOBAL  enuFile$   ' user GLOBAL enum blocks


SET VarStorage[6][18] AS CHAR
  "static ",
  "extern ",
  "",
  "static volatile ",
  "extern volatile ",
  "volatile "
END SET

'*************************************************************************
' Current information on reserved word, table is in alpabetical order
' Wayne Halsdorf
'*************************************************************************
GLOBAL iRIndex[97][2] AS Integer    'Low to High Lookup table for BCXWords[]
SET BCXWords[] AS tagTokenSuFunctions
  {"#include","#include"            ,0,comvt_BAD}, ',NULL         ,83886083},
  {"$accelerator","$accelerator"    ,0,comvt_BAD}, ',NULL         ,83886083},
  {"$asm","$asm"                    ,0,comvt_BAD}, ',NULL         ,83886083},
  {"$bcx$","$bcx$"                  ,0,comvt_BAD}, ',NULL         ,83886083},
  {"$bcx_resource","$bcx_resource"  ,0,comvt_BAD}, ',NULL         ,83886083},
  {"$bcxversion","$bcxversion"      ,0,comvt_BAD}, ',NULL         ,83886083},
  {"$ccode","$ccode"                ,0,comvt_BAD}, ',NULL         ,83886083},
  {"$comment","$comment"            ,0,comvt_BAD}, ',NULL         ,83886083},
  {"$compiler","$compiler"          ,0,comvt_BAD}, ',NULL         ,83886083},
  {"$cpp","$cpp"                    ,0,comvt_BAD}, ',NULL         ,83886083},
  {"$dll","$dll"                    ,0,comvt_BAD}, ',NULL         ,83886083},
  {"$else","~else"                  ,0,comvt_BAD}, ',NULL         ,83886083},
  {"$elseif","~elseif"              ,0,comvt_BAD}, ',NULL         ,83886083},
  {"$endif",""                      ,0,comvt_BAD}, ',CondEndIf    ,83886083},
  {"$file$","$file$"                ,0,comvt_BAD}, ',NULL         ,83886083},
  {"$fsstatic","$fsstatic"          ,0,comvt_BAD}, ',NULL         ,83886083},
  {"$genfree","$genfree"            ,0,comvt_BAD}, ',NULL         ,83886083},
  {"$header","$header"              ,0,comvt_BAD}, ',NULL         ,83886083},
  {"$hscroll","~hscroll"            ,0,comvt_BAD}, ',NULL         ,83886083},
  {"$if",""                         ,0,comvt_BAD}, ',CondIf       ,83886083},
  {"$ifdef",""                      ,0,comvt_BAD}, ',CondIf       ,83886083},
  {"$ifndef",""                     ,0,comvt_BAD}, ',CondIfndef   ,83886083},
  {"$include","$include"            ,0,comvt_BAD}, ',NULL         ,83886083},
  {"$iprint_off","$iprint_off"      ,0,comvt_BAD}, ',NULL         ,83886083},
  {"$iprint_on","$iprint_on"        ,0,comvt_BAD}, ',NULL         ,83886083},
  {"$lcc$","$lcc$"                  ,0,comvt_BAD}, ',NULL         ,83886083},
  {"$library","$library"            ,0,comvt_BAD}, ',NULL         ,83886083},
  {"$linker","$linker"              ,0,comvt_BAD}, ',NULL         ,83886083},
  {"$noini","$noini"                ,0,comvt_BAD}, ',NULL         ,83886083},
  {"$nolibmain","$nolibmain"        ,0,comvt_BAD}, ',NULL         ,83886083},
  {"$nomain","$nomain"              ,0,comvt_BAD}, ',NULL         ,83886083},
  {"$nowin","$nowin"                ,0,comvt_BAD}, ',NULL         ,83886083},
  {"$onentry","$onentry"            ,0,comvt_BAD}, ',NULL         ,83886083},
  {"$onexit","$onexit"              ,0,comvt_BAD}, ',NULL         ,83886083},
  {"$optimizer off","$optimizer off",0,comvt_BAD}, ',NULL         ,83886083},
  {"$optimizer on","$optimizer  on" ,0,comvt_BAD}, ',NULL         ,83886083},
  {"$pack","$pack"                  ,0,comvt_BAD}, ',NULL         ,83886083},
  {"$pp","$pp"                      ,0,comvt_BAD}, ',NULL         ,83886083},
  {"$prj","$prj"                    ,0,comvt_BAD}, ',NULL         ,83886083},
  {"$prjuse","$prjuse"              ,0,comvt_BAD}, ',NULL         ,83886083},
  {"$resource","$resource"          ,0,comvt_BAD}, ',NULL         ,83886083},
  {"$source","$source"              ,0,comvt_BAD}, ',NULL         ,83886083},
  {"$test","$test"                  ,0,comvt_BAD}, ',NULL         ,83886083},
  {"$trace","$trace"                ,0,comvt_BAD}, ',NULL         ,83886083},
  {"$vscroll","~vscroll"            ,0,comvt_BAD}, ',NULL         ,83886083},
  {"_asm","_asm"                    ,0,comvt_BAD}, ',NULL         ,83886083},
  {"abs",""                         ,0,comvt_R8 }, ',MatPro001    ,83886081},
  {"acos","acos"                    ,0,comvt_R8 }, ',NULL         ,83886081},
  {"acosh",""                       ,0,comvt_R8 }, ',MatPro003    ,83886081},
  {"acosl","acosl"                  ,0,comvt_BAD}, ',NULL         ,83886081},
  {"alias","alias"                  ,0,comvt_BAD}, ',NULL         ,83886083},
  {"and","and"                      ,0,comvt_BAD}, ',NULL         ,83886081},
  {"ansitowide",""                  ,0,comvt_BAD}, ',UniPro001    ,83886081},
  {"appactivate",""                 ,0,comvt_BAD}, ',Trans_004    ,83886081},
  {"append","append"                ,0,comvt_BAD}, ',NULL         ,83886081},
  {"appexename$",""                 ,0,comvt_BAD}, ',FilMan001    ,83886081},
  {"appexepath$",""                 ,0,comvt_BAD}, ',FilMan002    ,83886081},
  {"argc","argc"                    ,0,comvt_BAD}, ',NULL         ,83886081},
  {"argv","argv"                    ,0,comvt_BAD}, ',NULL         ,83886081},
  {"argv$","argv$"                  ,0,comvt_BAD}, ',NULL         ,83886081},
  {"as","as"                        ,0,comvt_BAD}, ',NULL         ,83886081},
  {"asc",""                         ,0,comvt_BAD}, ',ConPro001    ,83886081},
  {"ascending","ascending"          ,0,comvt_BAD}, ',NULL         ,83886083},
  {"asin","asin"                    ,0,comvt_R8 }, ',NULL         ,83886081},
  {"asinh",""                       ,0,comvt_R8 }, ',MatPro005    ,83886081},
  {"asinl","asinl"                  ,0,comvt_BAD}, ',NULL         ,83886081},
  {"atan","atan"                    ,0,comvt_R8 }, ',NULL         ,83886081},
  {"atanh",""                       ,0,comvt_R8 }, ',MatPro007    ,83886081},
  {"atanl","atanl"                  ,0,comvt_R8 }, ',NULL         ,83886081},
  {"atn","atan"                     ,0,comvt_R8 }, ',NULL         ,83886081},
  {"atnl","atanl"                   ,0,comvt_R8 }, ',NULL         ,83886081},
  {"auto",""                        ,0,comvt_BAD}, ',Trans_009    ,83886083},
  {"band",""                        ,0,comvt_BAD}, ',Trans_010    ,83886081},
  {"base","base"                    ,0,comvt_BAD}, ',NULL         ,83886083},
  {"bcopy",""                       ,0,comvt_BAD}, ',StrPro001    ,83886081},
  {"bcx_classname$","BCX_ClassName$",0,comvt_BAD}, ',NULL         ,0},
  {"bcxlib","bcxlib"                ,0,comvt_BAD}, ',NULL         ,83886083},
  {"bcxsplitpath$",""               ,0,comvt_BAD}, ',FilMan004    ,0},
  {"begin",""                       ,0,comvt_BAD}, ',Trans_BCX_093,83886083},
  {"bel$",""                        ,0,comvt_BAD}, ',StrConst     ,83886083},
  {"bff$",""                        ,0,comvt_BAD}, ',FilMan005    ,83886081},
  {"bin$",""                        ,0,comvt_BAD}, ',MatPro008    ,83886081},
  {"bin2dec",""                     ,0,comvt_I4 }, ',MatPro009    ,83886081},
  {"binary","binary"                ,0,comvt_BAD}, ',NULL         ,83886081},
  {"bnot",""                        ,0,comvt_BAD}, ',Trans_BCX_098,0},
  {"bool","BOOL"                    ,0,comvt_BAD}, ',NULL         ,0},
  {"bool$",""                       ,0,comvt_BAD}, ',Trans_BCX_099,83886081},
  {"boolean","BOOL"                 ,0,comvt_BAD}, ',NULL         ,0},
  {"bor",""                         ,0,comvt_BAD}, ',Trans_BCX_100,83886081},
  {"bs$",""                         ,0,comvt_BAD}, ',StrConst     ,83886083},
  {"byref","byref"                  ,0,comvt_BAD}, ',NULL         ,83886081},
  {"byte","BYTE"                    ,0,comvt_BAD}, ',NULL         ,0},
  {"c_declare",""                   ,0,comvt_BAD}, ',OthPro003    ,83886083},
  {"call","call"                    ,0,comvt_BAD}, ',NULL         ,83886083},
  {"callback",""                    ,0,comvt_BAD}, ',Trans_BCX_103,83886081},
  {"callwindowproc",""              ,0,comvt_BAD}, ',Trans_BCX_104,0},
  {"case","case"                    ,0,comvt_BAD}, ',NULL         ,83886083},
  {"cbctl","LOWORD(wParam)"         ,0,comvt_BAD}, ',NULL         ,83886081},
  {"cbctlmsg","HIWORD(wParam)"      ,0,comvt_BAD}, ',NULL         ,83886081},
  {"cbhndl","hWnd"                  ,0,comvt_BAD}, ',NULL         ,83886081},
  {"cbhwnd","hWnd"                  ,0,comvt_BAD}, ',NULL         ,83886081},
  {"cblparam","lParam"              ,0,comvt_BAD}, ',NULL         ,83886081},
  {"cbmsg","Msg"                    ,0,comvt_BAD}, ',NULL         ,83886081},
  {"cbool",""                       ,0,comvt_BAD}, ',Trans_BCX_105,83886081},
  {"cbwparam","wParam"              ,0,comvt_BAD}, ',NULL         ,83886081},
  {"cdbl",""                        ,0,comvt_BAD}, ',MatPro010    ,83886081},
  {"center",""                      ,0,comvt_BAD}, ',Trans_BCX_107,83886081},
  {"char","char"                    ,0,comvt_BAD}, ',NULL         ,0},
  {"chr$",""                        ,0,comvt_BAD}, ',ConPro002    ,83886081},
  {"cint",""                        ,0,comvt_BAD}, ',MatPro011    ,83886081},
  {"cldbl",""                       ,0,comvt_BAD}, ',Trans_BCX_110,0},
  {"clear","clear"                  ,0,comvt_BAD}, ',NULL         ,83886081},
  {"clng",""                        ,0,comvt_BAD}, ',MatPro012    ,83886081},
  {"close",""                       ,0,comvt_BAD}, ',FilMan006    ,83886081},
  {"close#","close"                 ,0,comvt_BAD}, ',NULL         ,83886081},
  {"closedialog",""                 ,0,comvt_BAD}, ',BCX_GUI_001  ,0},
  {"cls",""                         ,0,comvt_BAD}, ',DOSPro001    ,83886081},
  {"color",""                       ,0,comvt_BAD}, ',DOSPro002    ,83886081},
  {"color_bg",""                    ,0,comvt_BAD}, ',DOSPro002    ,0},
  {"color_fg",""                    ,0,comvt_BAD}, ',DOSPro002    ,0},
  {"colorref","COLORREF"            ,0,comvt_BAD}, ',NULL         ,0},
  {"colour",""                      ,0,comvt_BAD}, ',NULL         ,83886083},
  {"comboboxloadfile",""            ,0,comvt_BAD}, ',FilMan007    ,67108865},
  {"concat","strcat"                ,0,comvt_BAD}, ',NULL         ,83886081},
  {"console","console"              ,0,comvt_BAD}, ',NULL         ,83886081},
  {"const","const"                  ,0,comvt_BAD}, ',NULL         ,83886083},
  {"containedin",""                 ,0,comvt_BAD}, ',StrPro003    ,83886083},
  {"copyfile","copyfile"            ,0,comvt_BAD}, ',NULL         ,83886081},
  {"cos","cos"                      ,0,comvt_R8 }, ',NULL         ,83886081},
  {"cosh","cosh"                    ,0,comvt_R8 }, ',NULL         ,83886081},
  {"cosl","cosl"                    ,0,comvt_BAD}, ',NULL         ,0},
  {"cr$",""                         ,0,comvt_BAD}, ',StrConst     ,83886083},
  {"createobject",""                ,0,comvt_BAD}, ',Trans_BCX_113,0},
  {"crlf$",""                       ,0,comvt_BAD}, ',StrConst     ,83886083},
  {"csng",""                        ,0,comvt_BAD}, ',MatPro016    ,83886081},
  {"csrlin",""                      ,0,comvt_BAD}, ',DOSPro003    ,83886081},
  {"cursorx",""                     ,0,comvt_BAD}, ',DOSPro004    ,83886081},
  {"cursory",""                     ,0,comvt_BAD}, ',DOSPro003    ,83886081},
  {"cvd",""                         ,0,comvt_BAD}, ',ConPro003    ,83886081},
  {"cvi",""                         ,0,comvt_BAD}, ',ConPro004    ,83886081},
  {"cvl",""                         ,0,comvt_BAD}, ',ConPro005    ,83886081},
  {"cvld",""                        ,0,comvt_BAD}, ',ConPro006    ,0},
  {"cvs",""                         ,0,comvt_BAD}, ',ConPro007    ,83886081},
  {"data","data"                    ,0,comvt_BAD}, ',NULL         ,218103809},
  {"data$","DATA$"                  ,0,comvt_BAD}, ',NULL         ,218103811},
  {"date$",""                       ,0,comvt_BAD}, ',DOSPro014    ,83886081},
  {"ddq$",""                        ,0,comvt_BAD}, ',StrConst     ,0},
  {"declare",""                     ,0,comvt_BAD}, ',Trans_BCX_128,83886083},
  {"decr","decr"                    ,0,comvt_BAD}, ',NULL         ,83886081},
  {"del$",""                        ,0,comvt_BAD}, ',StrPro004    ,83886081},
  {"delete",""                      ,0,comvt_BAD}, ',Trans_BCX_130,0},
  {"descending","descending"        ,0,comvt_BAD}, ',NULL         ,83886083},
  {"dim","dim"                      ,0,comvt_BAD}, ',NULL         ,83886081},
  {"do","do"                        ,0,comvt_BAD}, ',NULL         ,83886083},
  {"double","double"                ,0,comvt_BAD}, ',NULL         ,0},
  {"dq$",""                         ,0,comvt_BAD}, ',StrConst     ,83886083},
  {"dsplit",""                      ,0,comvt_BAD}, ',ArrPro001    ,83886081},
  {"dword","DWORD"                  ,0,comvt_BAD}, ',NULL         ,0},
  {"dynamic","dynamic"              ,0,comvt_BAD}, ',NULL         ,83886083},
  {"editloadfile",""                ,0,comvt_BAD}, ',BCXGUI064    ,83886081},
  {"ejectpage","ejectpage"          ,0,comvt_BAD}, ',NULL         ,83886081},
  {"else","else"                    ,0,comvt_BAD}, ',NULL         ,83886083},
  {"elseif","elseif"                ,0,comvt_BAD}, ',NULL         ,83886083},
  {"enc$",""                        ,0,comvt_BAD}, ',StrPro005    ,83886081},
  {"end",""                         ,0,comvt_BAD}, ',EndOfThis    ,83886083},
  {"enddraw",""                     ,0,comvt_BAD}, ',Trans_00193  ,0},
  {"endif","endif"                  ,0,comvt_BAD}, ',NULL         ,83886083},
  {"endmodal",""                    ,0,comvt_BAD}, ',Trans_00194  ,0},
  {"enum",""                        ,0,comvt_BAD}, ',SUB_202      ,83886083},
  {"environ$",""                    ,0,comvt_BAD}, ',SUB_203      ,83886081},
  {"eof$",""                        ,0,comvt_BAD}, ',StrConst     ,83886083},
  {"esc$",""                        ,0,comvt_BAD}, ',StrConst     ,83886083},
  {"events","events"                ,0,comvt_BAD}, ',NULL         ,83886083},
  {"exist",""                       ,0,comvt_BAD}, ',FilMan010    ,83886081},
  {"exit","exit"                    ,0,comvt_BAD}, ',NULL         ,83886083},
  {"exp",""                         ,0,comvt_R8 }, ',MatPro018    ,83886081},
  {"export","export"                ,0,comvt_BAD}, ',NULL         ,83886083},
  {"extern","extern"                ,0,comvt_BAD}, ',NULL         ,83886083},
  {"extract$",""                    ,0,comvt_BAD}, ',ExtStr001    ,83886081},
  {"false","FALSE"                  ,0,comvt_BAD}, ',NULL         ,0},
  {"farproc","FARPROC"              ,0,comvt_BAD}, ',NULL         ,0},
  {"ff$",""                         ,0,comvt_BAD}, ',StrConst     ,83886083},
  {"file","FILE"                    ,0,comvt_BAD}, ',NULL         ,0},
  {"filelocked",""                  ,0,comvt_BAD}, ',FilMan011    ,83886081},
  {"fillarray",""                   ,0,comvt_BAD}, ',ArrPro002    ,83886081},
  {"findfirst$",""                  ,0,comvt_BAD}, ',FilMan012    ,83886081},
  {"findfirstinstance",""           ,0,comvt_BAD}, ',OthPro016    ,83886081},
  {"findintype",""                  ,0,comvt_BAD}, ',ExtStr002    ,0},
  {"findnext$",""                   ,0,comvt_BAD}, ',FilMan013    ,83886081},
  {"finput","finput"                ,0,comvt_BAD}, ',NULL         ,83886081},
  {"fint",""                        ,0,comvt_INT}, ',SUB_217      ,0},
  {"fix",""                         ,0,comvt_R4 }, ',MatPro019    ,83886081},
  {"flush","fflush"                 ,0,comvt_BAD}, ',NULL         ,83886081},
  {"for",""                         ,0,comvt_BAD}, ',FORCHK       ,83886083},
  {"fprint","fprint"                ,0,comvt_BAD}, ',NULL         ,83886081},
  {"frac",""                        ,0,comvt_R8 }, ',MatPro020    ,83886081},
  {"fracl",""                       ,0,comvt_BAD}, ',SUB_222      ,0},
  {"free","free"                    ,0,comvt_BAD}, ',NULL         ,83886081},
  {"freeglobals","FreeGlobals"      ,0,comvt_BAD}, ',NULL         ,83886083},
  {"from","from"                    ,0,comvt_BAD}, ',NULL         ,0},
  {"function",""                    ,0,comvt_BAD}, ',ConFlo006    ,83886083},
  {"fwrite","fwrite"                ,0,comvt_BAD}, ',NULL         ,83886081},
  {"get$",""                        ,0,comvt_BAD}, ',GETTEST      ,83886081},
  {"getattr",""                     ,0,comvt_BAD}, ',FilMan016    ,83886081},
  {"getbmp",""                      ,0,comvt_BAD}, ',SUB_229      ,83886081},
  {"getbvalue","GetBValue"          ,0,comvt_BAD}, ',NULL         ,0},
  {"getc","getc"                    ,0,comvt_BAD}, ',NULL         ,83886081},
  {"getdimension",""                ,0,comvt_BAD}, ',BCXGUI065    ,0},
  {"getdrive",""                    ,0,comvt_BAD}, ',FolDri004    ,83886081},
  {"getfilename$",""                ,0,comvt_BAD}, ',FilMan015    ,83886081},
  {"getgvalue","GetGValue"          ,0,comvt_BAD}, ',NULL         ,0},
  {"getobject",""                   ,0,comvt_BAD}, ',SUB_225      ,0},
  {"getprocaddress",""              ,0,comvt_BAD}, ',SUB_226      ,0},
  {"getresource",""                 ,0,comvt_BAD}, ',SUB_236      ,0},
  {"getrvalue","GetRValue"          ,0,comvt_BAD}, ',NULL         ,0},
  {"getspecialfolder",""            ,0,comvt_BAD}, ',FolDri005    ,0},
  {"getspecialfolder$",""           ,0,comvt_BAD}, ',FolDri005    ,0},
  {"gettextsize",""                 ,0,comvt_BAD}, ',BCXGUI067    ,0},
  {"global","global"                ,0,comvt_BAD}, ',NULL         ,83886081},
  {"gosub","gosub"                  ,0,comvt_BAD}, ',NULL         ,83886083},
  {"goto","goto"                    ,0,comvt_BAD}, ',NULL         ,83886083},
  {"gui","gui"                      ,0,comvt_BAD}, ',NULL         ,83886083},
  {"hex$",""                        ,0,comvt_BAD}, ',MatPro021    ,83886081},
  {"hex2dec",""                     ,0,comvt_I4 }, ',MatPro022    ,83886081},
  {"hibyte","HIBYTE"                ,0,comvt_BAD}, ',NULL         ,0},
  {"hide",""                        ,0,comvt_BAD}, ',BCXGUI069    ,83886081},
  {"hiword","HIWORD"                ,0,comvt_BAD}, ',NULL         ,0},
  {"hypot","hypot"                  ,0,comvt_R8 }, ',NULL         ,83886081},
  {"icon","icon"                    ,0,comvt_BAD}, ',NULL         ,83886083},
  {"if","if"                        ,0,comvt_BAD}, ',NULL         ,83886083},
  {"iif",""                         ,0,comvt_R8 }, ',ConFlo010    ,218103809},
  {"iif$",""                        ,0,comvt_BAD}, ',ConFlo011    ,218103809},
  {"imod",""                        ,0,comvt_BAD}, ',MatPro024    ,83886081},
  {"in","in"                        ,0,comvt_BAD}, ',NULL         ,83886081},
  {"inchr",""                       ,0,comvt_R4 }, ',ExtStr004    ,83886081},
  {"incr","incr"                    ,0,comvt_BAD}, ',NULL         ,83886081},
  {"infobox",""                     ,0,comvt_BAD}, ',SUB_253      ,83886081},
  {"inkey",""                       ,0,comvt_BAD}, ',KeyPro001    ,83886081},
  {"inkey$",""                      ,0,comvt_BAD}, ',KeyPro002    ,83886081},
  {"inp",""                         ,0,comvt_BAD}, ',HarPro001    ,83886081},
  {"input","input"                  ,0,comvt_BAD}, ',NULL         ,83886081},
  {"inputbox$",""                   ,0,comvt_BAD}, ',BCXGUI070    ,83886081},
  {"inputbuffer","inputbuffer"      ,0,comvt_BAD}, ',NULL         ,83886081},
  {"inputnumber","inputnumber"      ,0,comvt_BAD}, ',NULL         ,83886081},
  {"inpw",""                        ,0,comvt_BAD}, ',HarPro002    ,83886081},
  {"ins$",""                        ,0,comvt_BAD}, ',ExtStr003    ,83886081},
  {"instat","kbhit()"               ,0,comvt_BAD}, ',NULL         ,83886081},
  {"instr",""                       ,0,comvt_R4 }, ',ExtStr005    ,83886081},
  {"instrrev",""                    ,0,comvt_R4 }, ',ExtStr006    ,83886081},
  {"int","int"                      ,0,comvt_BAD}, ',NULL         ,83886081},
  {"integer","int"                  ,0,comvt_BAD}, ',NULL         ,0},
  {"iremove","iremove"              ,0,comvt_BAD}, ',NULL         ,83886081},
  {"iremove$",""                    ,0,comvt_BAD}, ',ExtStr007    ,83886081},
  {"ireplace$",""                   ,0,comvt_BAD}, ',ExtStr008    ,83886081},
  {"is","is"                        ,0,comvt_BAD}, ',NULL         ,83886081},
  {"isptr",""                       ,0,comvt_BAD}, ',SUB_258      ,83886081},
  {"iterate","continue"             ,0,comvt_BAD}, ',NULL         ,83886083},
  {"join$",""                       ,0,comvt_BAD}, ',ExtStr009    ,83886081},
  {"kill","kill"                    ,0,comvt_BAD}, ',NULL         ,83886081},
  {"lcase$",""                      ,0,comvt_BAD}, ',ExtStr010    ,83886081},
  {"ldouble",""                     ,0,comvt_BAD}, ',SUB_270      ,0},
  {"left$",""                       ,0,comvt_BAD}, ',ExtStr011    ,83886081},
  {"len","strlen"                   ,0,comvt_R4 }, ',NULL         ,83886081},
  {"lf$",""                         ,0,comvt_BAD}, ',StrConst     ,83886083},
  {"lib","lib"                      ,0,comvt_BAD}, ',NULL         ,83886083},
  {"like",""                        ,0,comvt_BAD}, ',ExtStr013    ,83886081},
  {"line",""                        ,0,comvt_BAD}, ',MIXED_001    ,83886081},
  {"listboxloadfile",""             ,0,comvt_BAD}, ',FilMan019    ,83886081},
  {"load_dll","LoadLibrary"         ,0,comvt_BAD}, ',NULL         ,83886081},
  {"loadfile$",""                   ,0,comvt_BAD}, ',FilMan020    ,83886081},
  {"loadlibrary","LoadLibrary"      ,0,comvt_BAD}, ',NULL         ,83886081},
  {"lobyte","LOBYTE"                ,0,comvt_BAD}, ',NULL         ,0},
  {"loc",""                         ,0,comvt_BAD}, ',FilMan021    ,83886081},
  {"local","local"                  ,0,comvt_BAD}, ',NULL         ,83886081},
  {"locate",""                      ,0,comvt_BAD}, ',DOSPro005    ,83886081},
  {"lof",""                         ,0,comvt_R8 }, ',FilMan022    ,83886081},
  {"log","log"                      ,0,comvt_R8 }, ',NULL         ,83886081},
  {"log10","log10"                  ,0,comvt_R8 }, ',NULL         ,83886081},
  {"log10l","log10l"                ,0,comvt_BAD}, ',NULL         ,0},
  {"logl","logl"                    ,0,comvt_BAD}, ',NULL         ,0},
  {"long","long"                    ,0,comvt_BAD}, ',NULL         ,0},
  {"longlong","LONGLONG"            ,0,comvt_BAD}, ',NULL         ,0},
  {"loop","loop"                    ,0,comvt_BAD}, ',NULL         ,83886083},
  {"loword","LOWORD"                ,0,comvt_BAD}, ',NULL         ,0},
  {"lpad$",""                       ,0,comvt_BAD}, ',ExtStr014    ,83886081},
  {"lpbyte","LPBYTE"                ,0,comvt_BAD}, ',NULL         ,0},
  {"lprint",""                      ,0,comvt_BAD}, ',SUB_276      ,83886081},
  {"lpstr","LPSTR"                  ,0,comvt_BAD}, ',NULL         ,0},
  {"ltrim$",""                      ,0,comvt_BAD}, ',ExtStr015    ,83886081},
  {"main","main"                    ,0,comvt_BAD}, ',NULL         ,0},
  {"makeintresource","MAKEINTRESOURCE",0,comvt_BAD}, ',NULL       ,0},
  {"makelong","MAKELONG"            ,0,comvt_BAD}, ',NULL         ,0},
  {"makeword","MAKEWORD"            ,0,comvt_BAD}, ',NULL         ,0},
  {"max",""                         ,0,comvt_R8 }, ',MatPro029    ,83886081},
  {"mcase$",""                      ,0,comvt_BAD}, ',ExtStr016    ,83886081},
  {"mdigui","mdigui"                ,0,comvt_BAD}, ',NULL         ,0},
  {"mid$",""                        ,0,comvt_BAD}, ',ExtStr017    ,83886081},
  {"min",""                         ,0,comvt_R8 }, ',MatPro030    ,83886081},
  {"mkd$",""                        ,0,comvt_BAD}, ',ConPro008    ,83886081},
  {"mki$",""                        ,0,comvt_BAD}, ',ConPro009    ,83886081},
  {"mkl$",""                        ,0,comvt_BAD}, ',ConPro010    ,83886081},
  {"mkld$",""                       ,0,comvt_BAD}, ',ConPro011    ,0},
  {"mks$",""                        ,0,comvt_BAD}, ',ConPro012    ,83886081},
  {"mod","fmod"                     ,0,comvt_BAD}, ',NULL         ,83886081},
  {"modstyle",""                    ,0,comvt_BAD}, ',BCXGUI072    ,83886081},
  {"msgbox",""                      ,0,comvt_BAD}, ',BCXGUI073    ,83886081},
  {"name","name"                    ,0,comvt_BAD}, ',NULL         ,83886081},
  {"new",""                         ,0,comvt_BAD}, ',OOP_NEW      ,83886081},
  {"next","next"                    ,0,comvt_BAD}, ',NULL         ,83886083},
  {"nosort","WS_CHILD|WS_VISIBLE|WS_VSCROLL",0,comvt_BAD}, ',NULL ,0},
  {"not","not"                      ,0,comvt_BAD}, ',NULL         ,83886081},
  {"nothing",""                     ,0,comvt_BAD}, ',SUB_309      ,0},
  {"now$",""                        ,0,comvt_BAD}, ',DOSPro016    ,83886081},
  {"nul$",""                        ,0,comvt_BAD}, ',StrConst     ,83886083},
  {"null","NULL"                    ,0,comvt_BAD}, ',NULL         ,0},
  {"object",""                      ,0,comvt_BAD}, ',COM_OBJ      ,0},
  {"oct$",""                        ,0,comvt_BAD}, ',MatPro032    ,83886081},
  {"on","on"                        ,0,comvt_BAD}, ',NULL         ,83886083},
  {"open",""                        ,0,comvt_BAD}, ',FilMan023    ,83886081},
  {"option","option"                ,0,comvt_BAD}, ',NULL         ,83886083},
  {"optional","optional"            ,0,comvt_BAD}, ',NULL         ,83886083},
  {"or","or"                        ,0,comvt_BAD}, ',NULL         ,83886081},
  {"outp",""                        ,0,comvt_BAD}, ',HarPro003    ,83886081},
  {"output","output"                ,0,comvt_BAD}, ',NULL         ,83886081},
  {"outpw",""                       ,0,comvt_BAD}, ',HarPro004    ,83886081},
  {"overloaded","overloaded"        ,0,comvt_BAD}, ',NULL         ,83886083},
  {"panel","panel"                  ,0,comvt_BAD}, ',NULL         ,83886081},
  {"peek$",""                       ,0,comvt_BAD}, ',ExtStr019    ,83886081},
  {"pixels","pixels"                ,0,comvt_BAD}, ',NULL         ,83886083},
  {"playwav",""                     ,0,comvt_BAD}, ',SUB_329      ,83886081},
  {"poke","memmove"                 ,0,comvt_BAD}, ',NULL         ,83886081},
  {"pos",""                         ,0,comvt_R4 }, ',DOSPro007    ,83886081},
  {"pow","pow"                      ,0,comvt_R8 }, ',NULL         ,83886081},
  {"powl","powl"                    ,0,comvt_BAD}, ',NULL         ,0},
  {"preserve","PRESERVE"            ,0,comvt_BAD}, ',NULL         ,83886083},
  {"print",""                       ,0,comvt_BAD}, ',DOSPro008    ,83886081},
  {"print#","fprint"                ,0,comvt_BAD}, ',NULL         ,83886081},
  {"private",""                     ,0,comvt_BAD}, ',SUB_334      ,83886083},
  {"program","program"              ,0,comvt_BAD}, ',NULL         ,83886083},
  {"ptr",""                         ,1,comvt_BAD}, ',SUB_325      ,83886081},
  {"put$",""                        ,0,comvt_BAD}, ',PUTTEST      ,83886081},
  {"qbcolor",""                     ,0,comvt_BAD}, ',BCXGUI075    ,83886081},
  {"qsort","qsort"                  ,0,comvt_BAD}, ',NULL         ,83886081},
  {"qsortidx","qsortidx"            ,0,comvt_BAD}, ',NULL         ,83886081},
  {"randomize",""                   ,0,comvt_BAD}, ',MatPro035    ,83886081},
  {"raw","raw"                      ,0,comvt_BAD}, ',NULL         ,83886083},
  {"rec",""                         ,0,comvt_BAD}, ',FilMan025    ,83886081},
  {"reccount",""                    ,0,comvt_BAD}, ',FilMan026    ,83886081},
  {"reclen","reclen"                ,0,comvt_BAD}, ',NULL         ,83886081},
  {"record","record"                ,0,comvt_BAD}, ',NULL         ,83886081},
  {"redim","redim"                  ,0,comvt_BAD}, ',NULL         ,83886081},
  {"refresh",""                     ,0,comvt_BAD}, ',BCXGUI076    ,0},
  {"register","register"            ,0,comvt_BAD}, ',NULL         ,83886083},
  {"rem","rem"                      ,0,comvt_BAD}, ',NULL         ,117440516},
  {"remain$",""                     ,0,comvt_BAD}, ',ExtStr023    ,218103809},
  {"remove","remove"                ,0,comvt_BAD}, ',NULL         ,218103809},
  {"remove$",""                     ,0,comvt_BAD}, ',ExtStr024    ,218103809},
  {"rename","rename"                ,0,comvt_BAD}, ',NULL         ,83886081},
  {"repeat","repeat"                ,0,comvt_BAD}, ',NULL         ,83886083},
  {"repeat$",""                     ,0,comvt_BAD}, ',ExtStr025    ,83886081},
  {"replace","replace"              ,0,comvt_BAD}, ',NULL         ,83886081},
  {"replace$",""                    ,0,comvt_BAD}, ',ExtStr026    ,83886081},
  {"retain$",""                     ,0,comvt_BAD}, ',ExtStr027    ,83886081},
  {"return","return"                ,0,comvt_BAD}, ',NULL         ,83886083},
  {"reverse$",""                    ,0,comvt_BAD}, ',ExtStr028    ,83886081},
  {"rewind",""                      ,0,comvt_BAD}, ',FilMan030    ,0},
  {"rgb","RGB"                      ,0,comvt_BAD}, ',NULL         ,0},
  {"right$",""                      ,0,comvt_BAD}, ',ExtStr029    ,83886081},
  {"rnd",""                         ,0,comvt_R4 }, ',MatPro036    ,83886081},
  {"round",""                       ,0,comvt_R8 }, ',MatPro037    ,83886081},
  {"rpad$",""                       ,0,comvt_BAD}, ',ExtStr030    ,83886081},
  {"rtrim$",""                      ,0,comvt_BAD}, ',ExtStr031    ,83886081},
  {"scanerror","scanerror"          ,0,comvt_BAD}, ',NULL         ,83886083},
  {"searchpath$",""                 ,0,comvt_BAD}, ',SUB_367      ,83886081},
  {"seek","seek"                    ,0,comvt_BAD}, ',NULL         ,83886081},
  {"select","select"                ,0,comvt_BAD}, ',NULL         ,83886083},
  {"sendmessage",""                 ,0,comvt_BAD}, ',SUB_369      ,0},
  {"set","set"                      ,0,comvt_BAD}, ',NULL         ,83886081},
  {"set_bcx_bitmap2",""             ,0,comvt_BAD}, ',BCXGUI078    ,0},
  {"setdimension",""                ,0,comvt_BAD}, ',BCXGUI081    ,0},
  {"setformcolor","setformcolor"    ,0,comvt_BAD}, ',NULL         ,83886081},
  {"sgn",""                         ,0,comvt_R4 }, ',MatPro038    ,83886081},
  {"shared","shared"                ,0,comvt_BAD}, ',NULL         ,83886081},
  {"shell","shell"                  ,0,comvt_BAD}, ',NULL         ,83886081},
  {"short","short"                  ,0,comvt_BAD}, ',NULL         ,0},
  {"show",""                        ,0,comvt_BAD}, ',BCXGUI083    ,83886081},
  {"showmodal",""                   ,0,comvt_BAD}, ',BCXGUI084    ,0},
  {"sin","sin"                      ,0,comvt_R8 }, ',NULL         ,83886081},
  {"single","float"                 ,0,comvt_BAD}, ',NULL         ,0},
  {"sinh","sinh"                    ,0,comvt_R8 }, ',NULL         ,83886081},
  {"sinl","sinl"                    ,0,comvt_BAD}, ',NULL         ,0},
  {"sizeof","sizeof"                ,0,comvt_R4 }, ',NULL         ,83886081},
  {"sleep","Sleep"                  ,0,comvt_BAD}, ',NULL         ,0},
  {"sndmsg",""                      ,0,comvt_BAD}, ',SUB_369      ,0},
  {"space$",""                      ,0,comvt_BAD}, ',ExtStr032    ,83886081},
  {"spc$",""                        ,0,comvt_BAD}, ',StrConst     ,83886083},
  {"split",""                       ,0,comvt_BAD}, ',ArrPro008    ,83886081},
  {"splitbarbg","SplitBarBG"        ,0,comvt_BAD}, ',NULL         ,0},
  {"splitbarfg","SplitBarFG"        ,0,comvt_BAD}, ',NULL         ,0},
  {"sprint","sprint"                ,0,comvt_BAD}, ',NULL         ,83886081},
  {"sqr","sqrt"                     ,0,comvt_R8 }, ',NULL         ,83886081},
  {"sqrl","sqrtl"                   ,0,comvt_BAD}, ',NULL         ,0},
  {"sqrt","sqrt"                    ,0,comvt_R8 }, ',NULL         ,83886081},
  {"sqrtl","sqrtl"                  ,0,comvt_BAD}, ',NULL         ,0},
  {"startdraw",""                   ,0,comvt_BAD}, ',SUB_364      ,0},
  {"static","static"                ,0,comvt_BAD}, ',NULL         ,83886083},
  {"stdcall","stdcall"              ,0,comvt_BAD}, ',NULL         ,83886083},
  {"step","step"                    ,0,comvt_BAD}, ',NULL         ,83886083},
  {"str$",""                        ,0,comvt_BAD}, ',ExtStr034    ,83886081},
  {"strarray","LPSTR*"              ,0,comvt_BAD}, ',NULL         ,83886081},
  {"strim$",""                      ,0,comvt_BAD}, ',ExtStr036    ,83886081},
  {"string","string"                ,0,comvt_BAD}, ',NULL         ,0},
  {"string$",""                     ,0,comvt_BAD}, ',ExtStr037    ,83886081},
  {"strl$",""                       ,0,comvt_BAD}, ',SUB_366      ,0},
  {"strptr",""                      ,0,comvt_BAD}, ',PoiPro001    ,83886081},
  {"strtoken$",""                   ,0,comvt_BAD}, ',ExtStr035    ,0},
  {"sub","sub"                      ,0,comvt_BAD}, ',NULL         ,83886083},
  {"swap","swap"                    ,0,comvt_BAD}, ',NULL         ,83886081},
  {"sysstr",""                      ,0,comvt_BAD}, ',ExtStr038    ,0},
  {"tab$",""                        ,0,comvt_BAD}, ',StrConst     ,83886083},
  {"tally",""                       ,0,comvt_R4}, ',ExtStr039     ,83886081},
  {"tan","tan"                      ,0,comvt_R8 }, ',NULL         ,83886081},
  {"tanh","tanh"                    ,0,comvt_R8 }, ',NULL         ,83886081},
  {"tanl","tanl"                    ,0,comvt_BAD}, ',NULL         ,0},
  {"tempfilename$",""               ,0,comvt_BAD}, ',FilMan032    ,83886081},
  {"textmode","textmode"            ,0,comvt_BAD}, ',NULL         ,83886081},
  {"then","then"                    ,0,comvt_BAD}, ',NULL         ,83886083},
  {"this",""                        ,0,comvt_BAD}, ',SUB_412      ,0},
  {"timer",""                       ,0,comvt_R4}, ',DOSPro020     ,83886081},
  {"to","to"                        ,0,comvt_BAD}, ',NULL         ,83886083},
  {"trim$",""                       ,0,comvt_BAD}, ',SUB_404      ,83886081},
  {"true","TRUE"                    ,0,comvt_BAD}, ',NULL         ,0},
  {"type","type"                    ,0,comvt_BAD}, ',NULL         ,83886083},
  {"ubound",""                      ,0,comvt_BAD}, ',ArrPro009    ,83886081},
  {"ucase$",""                      ,0,comvt_BAD}, ',ExtStr041    ,83886081},
  {"uint","UINT"                    ,0,comvt_BAD}, ',NULL         ,0},
  {"ulong","ULONG"                  ,0,comvt_BAD}, ',NULL         ,0},
  {"ulonglong","ULONGLONG"          ,0,comvt_BAD}, ',NULL         ,0},
  {"union","union"                  ,0,comvt_BAD}, ',NULL         ,83886083},
  {"until","until"                  ,0,comvt_BAD}, ',NULL         ,83886083},
  {"uptime","uptime"                ,0,comvt_BAD}, ',NULL         ,83886081},
  {"ushort","USHORT"                ,0,comvt_BAD}, ',NULL         ,0},
  {"using$",""                      ,0,comvt_BAD}, ',ExtStr042    ,83886081},
  {"val",""                         ,0,comvt_R8 }, ',ConPro013    ,83886081},
  {"vall",""                        ,0,comvt_BAD}, ',ConPro015    ,0},
  {"variant","VARIANT"              ,0,comvt_BAD}, ',NULL         ,0},
  {"vbs_addcode",""                 ,0,comvt_BAD}, ',ScrPro001    ,83886081},
  {"vbs_error$",""                  ,0,comvt_BAD}, ',ScrPro004    ,0},
  {"vbs_eval_num",""                ,0,comvt_BAD}, ',ScrPro002    ,83886081},
  {"vbs_eval_num#",""               ,0,comvt_BAD}, ',ScrPro002    ,83886081},
  {"vbs_eval_str$",""               ,0,comvt_BAD}, ',ScrPro001    ,83886081},
  {"vbs_reset",""                   ,0,comvt_BAD}, ',ScrPro004    ,83886081},
  {"vbs_run_script",""              ,0,comvt_BAD}, ',ScrPro001    ,83886081},
  {"vbs_start",""                   ,0,comvt_BAD}, ',ScrPro004    ,83886081},
  {"vbs_stop",""                    ,0,comvt_BAD}, ',ScrPro004    ,83886081},
  {"vchr$",""                       ,0,comvt_BAD}, ',ConPro014    ,83886081},
  {"verify",""                      ,0,comvt_BAD}, ',ExtStr043    ,83886081},
  {"vsync",""                       ,0,comvt_BAD}, ',NULL         ,83886081},
  {"vt$",""                         ,0,comvt_BAD}, ',StrConst     ,83886083},
  {"wend","wend"                    ,0,comvt_BAD}, ',NULL         ,83886083},
  {"while","while"                  ,0,comvt_BAD}, ',NULL         ,83886083},
  {"widetoansi$",""                 ,0,comvt_BAD}, ',UniPro002    ,83886081},
  {"with",""                        ,0,comvt_BAD}, ',WithThis     ,83886083},
  {"write","write"                  ,0,comvt_BAD}, ',NULL         ,83886081},
  {"xor","xor"                      ,0,comvt_BAD}, ',NULL         ,83886081},
  {"¦¦¦¦","¦¦¦¦"                    ,0,comvt_BAD}  ',NULL         ,0}
END SET

'*************************************************************************
'                              CODE BEGINS
'*************************************************************************
FUNCTION main(ARGC AS INTEGER, ARGV AS PCHAR PTR)

  GLOBAL  szTmp$    * 1048576
  GLOBAL  Src$      * 1048576
  GLOBAL  AbortSrc$ * 1048576
  GLOBAL  WarnMsg$  * 32767
  GLOBAL  RmLibs$   * 32767          ' libraries to remove

  CALL InitReservedWordsLookup

  IncludeCount           =   29      ' C Library Header Files Count
  ProtoCnt               =   0       ' Prototypes counter
  WinHeaders             =  TRUE     ' Include Win specific headers (*.h)
  TranslateSlash         =  TRUE     ' Default TO changing "\" TO "\\"
  OkayToSend             =  TRUE
  OptimizerEnabled       =  TRUE
  OptimizerFirstSetting  =  TRUE
  Use_SingleFile         =  TRUE
  NoRT                   =  FALSE
  Use_StartupCode        =  FALSE
  StartNdx               =  0
  Use_ExitCode           =  FALSE
  Use_LeanAndMean        =  FALSE
  ExitNdx                =  0
  Gen_Header             =  FALSE
  Project_Main$          =  ""
  HFile$                 =  ""
  CmdLineFileOut$        =  ""
  RmLibs$                =  ""
  InMain                 =  TRUE
  TestState              =  FALSE
  CmdLineConst$          = ""
  Project_List$          = ""
  SrcFlag                = TRUE

  D1$  = VCHR$(8,34,37,32,46,49,53,71,34)
  D2$  = VCHR$(9,34,37,32,46,49,57,76,71,34)

  O1$  = VCHR$(4,34,37,111,34)

  S1$  = VCHR$(4,34,37,115,34)
  S2$  = VCHR$(6,34,37,115,37,115,34)

  T0$  = VCHR$(10,34,37,72,58,37,77,58,37,83,34)
  T1$  = VCHR$(4,34,37, 72,34)
  T2$  = VCHR$(4,34,37, 77,34)
  T3$  = VCHR$(4,34,37, 83,34)
  T4$  = VCHR$(4,34,37,112,34)
  T5$  = VCHR$(4,34,37, 89,34)
  T6$  = VCHR$(4,34,37,109,34)
  T7$  = VCHR$(4,34,37,100,34)
  T8$  = VCHR$(4,34,37, 65,34)
  T9$  = VCHR$(4,34,37,119,34)
  T10$ = VCHR$(4,34,37,106,34)
  T11$ = VCHR$(4,34,37, 85,34)

  X1$  = VCHR$(4,34,37,88,34)
  U1$  = VCHR$(7,37,39,42,46,42,32,102)

  W1$  = ENC$("%*.*s%*.*lf")
  W2$  = ENC$("%s%*.*s")
  W3$  = ENC$("%s%*.*s%s")

  '**************************************************************************
  PPFlag = FALSE           ' Initialize User-Defined PreProcessor
  PPProc = NULL
  PPDLL_HANDLE = NULL
  '**************************************************************************

  IF COMMAND$ = "" THEN
    PRINT "BCX-32: BASIC to C/C++ Translator by Kevin Diggins (c) 1999-2009"
    PRINT "Version ", Version$, "  Compiled with ";
    $IF __BCPLUSPLUS__
      PRINT "Borland C++"
    $ELSEIF __BORLANDC__
      PRINT "Borland C"
    $ELSEIF __POCC__
      PRINT "Pelles C"
    $ELSEIF __LCC__
      PRINT "LCCWin32 C"
    $ELSEIF __WATCOM_CPLUSPLUS__
      PRINT "Open Watcom C++"
    $ELSEIF __MINGW32__
      PRINT "MinGW32 C"
    $ELSEIF __DMC__
      PRINT "Digital Mars C/C++"
    $ELSEIF _MSC_VER
      PRINT "Microsoft Visual C++"
    $ELSE
      PRINT "Unknown"
    $ENDIF

    PRINT " Usage: BC infile [.bas] [options]"
    PRINT " [-c] Generate C++ Compatible code"
    PRINT " [-d] DEFINE a constant ... ex. BC MyFile -D:MyConst[=SomeValue]"
    PRINT " [-e] Write ERRORS to BCX.ERR file"
    PRINT " [-f] Output FILENAME... ex. BC MyFile -f:C:\\MyFiles\\MyFile.c"
    PRINT " [-h] Generate HEADER file for use with $Projects"
    PRINT " [-i] Send Warnings and Errors to INFOBOX"
    PRINT " [-k] KILL the generated BCX generated 'C' file"
    PRINT " [-l] Create Runtime LIBRARY source and header Files"
    PRINT " [-n] Enable NO RUNTIME Code Generation"
    PRINT " [-o] OUTPUT a copy of the generated C file to STDOUT"
    PRINT " [-q] QUIET - No output to screen during translation"
    PRINT " [-r] Update BCX Path variable in the Windows REGISTRY"
    PRINT " [-s] Show STATUS of translation by line number"
    PRINT " [-w] Enable WARNINGS during translation"
    PRINT " [-x] EXCLUDE Win32 Headers from the resulting C file"
    PRINT " [-t] TURBO Mode ON w/optional size ... ex. BC MyFile -t[:1024]"
    PRINT " [-u] Turn UNICODE Support ON"

    IF BCXPATH$ = "Not Found" THEN
      CREATEREGSTRING _
      (HKEY_LOCAL_MACHINE,"Software\\Bcx-32\\Bcx\\Settings","Path",APPEXEPATH$)
      PRINT "      BCX Path set to ", BCXPATH$
    END IF
    CALL FREEGLOBALS
    END
  END IF

  IF BCXPATH$ = "Not Found" THEN
    CREATEREGSTRING _
    (HKEY_LOCAL_MACHINE,"Software\\Bcx-32\\Bcx\\Settings","Path",APPEXEPATH$)
    PRINT "      BCX Path set to ", BCXPATH$
  END IF

  IF LCASE$(COMMAND$) = "-r" THEN
    CREATEREGSTRING _
    (HKEY_LOCAL_MACHINE,"Software\\Bcx-32\\Bcx\\Settings","Path",APPEXEPATH$)
    PRINT "      BCX Path set to ", BCXPATH$
    END
  END IF

  ' build runtime library - no filename as first parameter
  IF LCASE$(LEFT$(COMMAND$(1),2)) = "-l" THEN
    Use_Library = TRUE
    Cmd$ = LCASE$(COMMAND$(1))
    IF INCHR(Cmd$, "c") THEN UseCpp  = TRUE
    IF INCHR(Cmd$, "n") THEN NoKill  = TRUE
    IF INCHR(Cmd$, "d") THEN Use_Dll = TRUE
    IF INCHR(Cmd$, "q") THEN Quiet   = TRUE
  ELSE
    NoKill      = FALSE
    Use_Project  =  FALSE
    Use_Library  =  FALSE
    Use_Dll      =  FALSE
    Quiet        =  FALSE
  END IF

  FOR INTEGER i = 2 TO ARGC-1
    IF INSTR(LCASE$(ARGV$[i]),"-f") THEN CmdLineFileOut$ = MID$(ARGV$[i],4)
    IF INSTR(LCASE$(ARGV$[i]),"-d") THEN CmdLineConst$ = CmdLineConst$ + MID$(ARGV$[i],4) + CHR$(1)
    IF LCASE$(ARGV$[i]) = "-c" THEN UseCpp      = TRUE
    IF LCASE$(ARGV$[i]) = "-e" THEN ErrFile     = TRUE
    IF LCASE$(ARGV$[i]) = "-h" THEN Gen_Header  = TRUE
    IF LCASE$(ARGV$[i]) = "-i" THEN InfoBoxWarn = TRUE
    IF LCASE$(ARGV$[i]) = "-q" THEN Quiet       = TRUE
    IF LCASE$(ARGV$[i]) = "-k" THEN KillCFile   = TRUE
    IF LCASE$(ARGV$[i]) = "-n" THEN NoRT        = TRUE
    IF LCASE$(ARGV$[i]) = "-o" THEN ReDirect    = TRUE
    IF LCASE$(ARGV$[i]) = "-s" THEN ShowStatus  = TRUE
    IF LCASE$(ARGV$[i]) = "-w" THEN TestState   = TRUE
    IF LCASE$(ARGV$[i]) = "-x" THEN WinHeaders  = FALSE
    IF INSTR(LCASE$(ARGV$[i]),"-t") THEN
      Use_Turbo = TRUE
      TurboSize = VAL(MID$(ARGV$[i],4))
      IF TurboSize <> 0 THEN
        IF (TurboSize & (TurboSize-1)) <> 0 THEN
          TurboSize = 512
          Warning("Invalid $Turbo size - defaulting to 512")
        END IF
      ELSE
        TurboSize = 512
      END IF
    END IF
  NEXT

  '****************************** [ Announce Program ] ********************************
  IF ShowStatus THEN CLS

  IF NOT Quiet THEN
    PRINT "BCX-32: BASIC to C/C++ Translator by Kevin Diggins (c) 1999-2009"
    PRINT "BCX-32 Version ", Version$
  END IF
  '************************************************************************************

  IF INCHR(COMMAND$(1),".") THEN
    Cmd$ = COMMAND$(1)                                 ' Allow ANY extension
  ELSE
    Cmd$ = UCASE$(EXTRACT$(COMMAND$(1),".")) + ".BAS"  ' Assume implicit .BAS
  END IF

  IF Use_Library THEN
    OPEN "bcxRT.bas" FOR OUTPUT AS hRT
    FPRINT hRT, "$NOINI"
    FPRINT hRT, "$NOMAIN"
    CLOSE hRT
    Cmd$ = "BCXRT.BAS"
  END IF

  IF INCHR(Cmd$,"*") OR INCHR(Cmd$,"?") THEN Cmd$ = FINDFIRST$(Cmd$)

  CmdPP$ = "" 'quiet the warning

  $IF BCXPP   ' Invoke the BCX Standard Preprocessor - bcxpp.exe
    CmdPP$ = EXTRACT$(Cmd$,".") + ".PPO"
    IF NOT Quiet THEN PRINT "Preproccessing " + Cmd$ + "..."
    SHELL "BCXPP.EXE " + Cmd$
    IF NOT Quiet THEN PRINT "Translating " + CmdPP$ + "..."
    FileIn$  = CmdPP$
  $ELSE
    FileIn$ = Cmd
  $ENDIF

  IF CmdLineFileOut$ = "" THEN
    FileOut$ = LEFT$(Cmd$, INSTRREV(Cmd$,".",0)-1) + ".C"
  ELSE
    FileOut$ = CmdLineFileOut$
  END IF

  FileErr$ = LEFT$(Cmd$, INSTRREV(Cmd$,".",0)-1) + ".ERR"

  IF EXIST(FileErr$) THEN
    SHELL "DEL " + FileErr$
  END IF

  '*******************************************************

  prcFile$ = TEMPFILENAME$(TEMPDIR$,"prc")
  udtFile$ = TEMPFILENAME$(TEMPDIR$,"udt")
  datFile$ = TEMPFILENAME$(TEMPDIR$,"dat")
  cstFile$ = TEMPFILENAME$(TEMPDIR$,"cst")
  ovrFile$ = TEMPFILENAME$(TEMPDIR$,"ovr")
  hdrFile$ = TEMPFILENAME$(TEMPDIR$,"hdr")
  setFile$ = TEMPFILENAME$(TEMPDIR$,"set")
  resFile$ = TEMPFILENAME$(TEMPDIR$,"res")
  enuFile$ = TEMPFILENAME$(TEMPDIR$,"enu")

  '**************************************************************************

  OPEN FileIn$  FOR INPUT  AS SourceFile
  OPEN FileOut$ FOR OUTPUT AS FP2           ' THE FINAL C FILE <<<<<<<<

  '**************************************************************************
  Outfile = FP2                    ' Outfile = FP3 when in a SUB or FUNCTION
  '**************************************************************************

  OPEN prcFile$ FOR OUTPUT AS FP3  ' Temp File FOR Storing User Functions
  OPEN udtFile$ FOR OUTPUT AS FP4  ' Temp File FOR Storing User Def Types
  OPEN datFile$ FOR OUTPUT AS FP5  ' Temp File FOR Storing User "Data"
  OPEN cstFile$ FOR OUTPUT AS FP6  ' Temp File FOR Storing User CONST
  OPEN hdrFile$ FOR OUTPUT AS FP7  ' Temp File FOR Storing User .H files
  OPEN ovrFile$ FOR OUTPUT AS FP8  ' Temp File FOR Storing overloaded funcs
  OPEN setFile$ FOR OUTPUT AS FP9  ' Temp File FOR Storing GLOBAL SET Vars
  OPEN resFile$ FOR OUTPUT AS FP10 ' Temp File FOR Storing User .rc files
  OPEN enuFile$ FOR OUTPUT AS FP11 ' Temp File FOR Storing User global enums

  '*************************************************************************

  ModuleNdx = 1
  Modules$[ModuleNdx] = FileIn$       ' store the current module name
  ModuleLineNos[ModuleNdx] = 0

  '**************************************************************************
  IF Use_Library THEN UseAll( UseCpp )

  IF NoRT = TRUE THEN CALL EnableProject

  CALL EmitProlog
  CALL ClearIfThenStacks
  CALL EmitCompilerDefines
  CALL EmitCmdLineConst

  '*****************
  '  The Main LOOP
  '*****************
  ReadSrcLine:
  '*****************

  WHILE NOT EOF(SourceFile) OR SplitCnt
    IF SplitCnt = 0 THEN                                        'Process separated lines before
      LINE INPUT SourceFile,Src$                                'getting next line from file.
      ModuleLineNos[ModuleNdx]++
      CALL StripCode(Src$)                                      'Remove spaces, tabs, comments
      IF *Src = 0 THEN ITERATE

      IF JoinLines(Src$) = 1 THEN ITERATE                       'Join continuation lines " _"

      IF INCHR(Src$,"[") THEN CALL BracketHandler(Src$,0)       'Fix Brackets
      IF SplitLines(Src$) THEN Src$ = SplitStk$[++SplitCur]     'Split statements separated by
    ELSE                                                         'colons and single line if/then
      Src$ = SplitStk$[++SplitCur]
    END IF
    IF SplitCur = SplitCnt THEN SplitCur = SplitCnt = 0

    IF *Src = 0 THEN ITERATE
    AbortSrc$ = Src$

    '***************************************************************************
    ReProcess:  ' label added for use with BCX User-Defined PreProcessor
    '             so line could be changed and be run back thru BCX from start
    '***************************************************************************

    IF TrcFlag AND InFunc THEN
      IF NOT iMatchLft(Src$,"$trace") THEN
        IF NOT iMatchLft(Src$,"end ") AND INSTR(Src$,"FUNCTION",0,1) = 0 THEN
          FPRINT Outfile,"// [", TRIM$(Modules$[ModuleNdx]), " - ", TRIM$(STR$(ModuleLineNos[ModuleNdx])), "] ", Src$
          Z$ = TRIM$(Modules$[ModuleNdx])
          Z$ = REPLACE$(Z$,"\\","\\\\")
          Z$ = " " + Z$ + " - " + STR$(ModuleLineNos[ModuleNdx]) + " \\n"
          Z$ = "printf(" + ENC$(Z$) + ");"
          FPRINT Outfile,Z$
        END IF
      END IF
    END IF

    '******************************

    IF SrcFlag THEN
      IF NOT iMatchLft(Src$,"$sourc") AND *Src <> 33 THEN  '33 = !
        FPRINT Outfile,"// [", TRIM$(Modules$[ModuleNdx]), " - ", TRIM$(STR$(ModuleLineNos[ModuleNdx])), "] ", Src$
      END IF
    END IF

    '******************************

    IF ShowStatus THEN
      LOCATE 2,1,0
      PRINT "Processing Module: ", TRIM$(Modules$[ModuleNdx]), " - Line:", ModuleLineNos[ModuleNdx]
    END IF


    '******************************

    IF Src[0] = 33 THEN  'Test for ! symbol -- inline C
      Src[0] = 32
      FPRINT Outfile,Src$
      Src$ = ""
    END IF

    '******************************

    IF iMatchLft(Src$,"bcx_resource ") THEN
      Use_GenResFile = TRUE
      FPRINT FP10, MID$(Src$,14)
      Src$ = ""
    END IF

    '******************************
    IF *Src$ = 0 THEN ITERATE

    DIM RAW di
    di = Directives()
    IF di = 0 THEN GOTO ReadNextLine
    IF di = 1 THEN GOTO ReadSrcLine

    IF iMatchLft(Src$,"set ") THEN
        CALL ProcessSetCommand(0)
    END IF

    IF iMatchLft(Src$,"sharedset ") THEN
      CALL ProcessSetCommand(1)
    END IF

    ' handle_msg handler
    IF iMatchLft(Src$,"handle_msg") THEN
      CALL ProcessMsgCracker
    END IF

    IF iMatchLft(Src$,"handle_cmd") THEN
      CALL ProcessCmdHandler
    END IF

    PassOne = TRUE

    '****************
    '    CallParse:
    '****************

    CALL CheckParQuotes

    IF PPFlag THEN           ' PreProcess the line
      GLOBAL ppret AS LONG
      ppret = PPProc(Src$)   ' Error in PP returns error message in Src$
      IF ppret = 0 THEN Abort(Src$)
      IF ppret = 2 THEN GOTO ReProcess
    END IF

    IF SpecialCaseHandler(Src$) THEN ITERATE

    CALL Parse(Src$)

    PassOne = FALSE

    IF Ndx THEN
      CALL Emit
    END IF

    '****************
    ReadNextLine:
    '****************
  WEND

  '***************************************************
  ' END OF MAIN LOOP -- All Source code has been read
  '***************************************************
  ' everything from here below must be stopped from
  ' executing more than once

  IF CmdLineConst$ > "" THEN
    Src$ = "CONST " + CmdLineConst$
    CALL Parse (Src$)
    CALL Emit
    CmdLineConst$ = ""
  END IF

  IF TestForBcxIni = FALSE THEN
    TestForBcxIni = TRUE
    szFile$ = CURDIR$ + "\\bcx.ini"

    IF NOT EXIST(szFile$) THEN
      szFile$ = APPEXEPATH$ + "bcx.ini"
    END IF

    IF EXIST(szFile$) THEN
      CALL PushFileIO
      OPEN szFile$ FOR INPUT AS SourceFile
      Modules$[++ModuleNdx] = szFile$
      ModuleLineNos[ModuleNdx] = 0
      GOTO ReadSrcLine
    END IF
  END IF

  IF Use_VBS THEN
    CALL Emit_VBSCRIPT_Support
  END IF

  FLUSH (Outfile)            '*************************************
  IF FPtrNdx THEN            '  Pop out the $Include File Handles
    CALL PopFileIO           '  and close them in sequence until
    GOTO ReadSrcLine         '  we end up back in the main file
  END IF                     '*************************************

  CALL EmitLibs

  IF Use_GenFree AND GlobalDynaCnt THEN
    CALL MakeFreeGlobals
  END IF

  CALL ExportInternalConst
  CALL EmitEpilog
  CALL CloseAll
  CALL AddProtos
  CALL DeclareVariables
  CALL AddFuncs
  CALL CloseAll

  '***************************
  '   Final Disk Gymnastics
  '***************************

  IF UseCpp AND CmdLineFileOut$ = "" THEN
    szTmp$ = EXTRACT$(UCASE$(FileOut$),".") + ".CPP"
    KILL szTmp$
    RENAME FileOut$, szTmp$
    FileOut$ = szTmp$
  END IF

  OPEN  FileOut$ FOR INPUT  AS FP1
  OPEN  hdrFile$ FOR INPUT  AS FP2
  OPEN "$temp$"  FOR OUTPUT AS FP3

  GLOBAL DoCountLines
  DoCountLines = TRUE

  FOR INTEGER i = 1 TO 4
    LINE INPUT FP1,Z$        ' Read from "C" FileOut$
    FPRINT FP3,Z$            ' Write to $temp$
  NEXT

  IF UseCpp THEN
    IF NOT Use_Library THEN FPRINT FP3,"//              Translated for compiling with a C++ Compiler"
  ELSE
    IF NOT Use_Library THEN FPRINT FP3,"//              Translated for compiling with a C Compiler"
  END IF

  IF NOT Use_Library THEN FPRINT FP3,"// *********************************************************************"

  IF Use_LeanAndMean = TRUE THEN
    FPRINT FP3,"#define WIN32_LEAN_AND_MEAN // limits reading seldom used header files"
  END IF

  DO
    LINE INPUT FP1,Z$        ' Read from "C" FileOut$
    FPRINT FP3,Z$            ' Write to $temp$
    IF LEFT$(Z$,8) <> "#include" THEN EXIT LOOP
  LOOP

  WHILE NOT EOF(FP2)
    LINE INPUT FP2,Z$       ' Read from BCX.HDR
    FPRINT FP3,Z$           ' Write to $temp$
  WEND

  DIM RAW Lastlyne$
  Lastlyne$ = ""

  WHILE NOT EOF(FP1)
    STATIC bMainOut = 0
    LINE INPUT FP1,Z$       ' Read from "C" FileOut$

    IF iMatchLft(Lastlyne$, "#if") THEN
      IF iMatchLft(Z$, "#endif") THEN
        Lastlyne$ = ""
        ITERATE
      ELSE
        FPRINT FP3, Lastlyne$
      END IF
    END IF
    Lastlyne$ = Z$
    IF iMatchLft(Lastlyne$, "#if") THEN ITERATE

    FPRINT FP3,Z$           ' Write to $temp$

    IF bMainOut THEN ITERATE

    IF _
      LEFT$(LTRIM$(Z$),8)  = "void basicmain"          OR _
      LEFT$(LTRIM$(Z$),18) = "int WINAPI WinMain" OR _
      LEFT$(LTRIM$(Z$),41) = "__declspec(dllexport) BOOL WINAPI DllMain" THEN

      WHILE TRIM$(Z$) <> "{"
        LINE INPUT FP1,Z$
        FPRINT FP3,Z$
      WEND

      IF Use_StartupCode THEN
        FPRINT FP3,Scoot$,"int BCX_SUCode = BCX_StartupCode_();  // execute user's startup code"
      END IF

      IF Use_ExitCode THEN
        FPRINT FP3,Scoot$,"int BCX_EXCode = BCX_ExitCode_();     // Prepare for user's exit code"
      END IF

      IF DllCnt THEN
        DIM RAW i

        FPRINT FP3, ""
        FPRINT FP3, "// **********[ DLL Declarations ]**********"
        FPRINT FP3, ""

        '------------------------------------------------------------------------
        ' Emit LoadLibrary assignments
        ' HMODULE  H_DLLNAME = LoadLibrary("DLLNAME.DLL");
        ' Todo: Add a check for H_DLLNAME = NULL in case of failure to load the DLL.
        '------------------------------------------------------------------------

        FOR i = 0 TO LoadLibsCnt - 1
          FPRINT FP3, "HMODULE  H_", UCASE$(EXTRACT$(Loadlibs$[i], ".")), _
          " = LoadLibrary(", ENC$(Loadlibs$[i]), ");"
        NEXT i

        FOR i = 1 TO DllCnt
          FPRINT FP3, DllDecl$[i]    ' Emit the users DLL Declarations
        NEXT

        FPRINT FP3, ""
        FPRINT FP3, "// ****************************************"
        FPRINT FP3, ""
      END IF
      bMainOut++
    END IF
  WEND

  DoCountLines = FALSE

  CALL CloseAll
  KILL hdrFile$
  KILL FileOut$

  '***************************************************************
  RENAME "$temp$", FileOut$       ' This is our FINAL "C" File
  '***************************************************************

  IF Use_Resource AND NOT Use_GenResFile THEN
    IF UserResFile$ > "" THEN Res_File$ = UserResFile$
  END IF

  IF Use_GenResFile THEN

    CombineRes = FALSE

    IF EXIST(UserResFile$) THEN CombineRes = TRUE 'don't overwrite rc file
    szTmp$ = EXTRACT$(UCASE$(FileOut$),".") + "__.rc"
    Res_File$ = szTmp$


    OPEN resFile$ FOR INPUT  AS ResIn
    OPEN szTmp$   FOR OUTPUT AS ResOut

    FPRINT ResOut, "//  BCX Generated Resource File"
    FPRINT ResOut, "//  Date: ",DATE$, " Time: ",TIME$
    FPRINT ResOut, ""
    FPRINT ResOut, "#include <windows.h>"
    FPRINT ResOut, ""

    IF CombineRes THEN
      OPEN UserResFile$ FOR INPUT AS UserResIn
      FPRINT ResOut, "// User *.rc file listing"
      FPRINT ResOut, ""
      WHILE NOT EOF(UserResIn)
        LINE INPUT UserResIn,Z$    ' Read from user resource file
        IF INSTR(Z$,"windows.h",0,1) > 0 THEN
          Z$ = ""
        END IF
        FPRINT ResOut,Z$           ' Write to final *.rc file
      WEND
    END IF

    FPRINT ResOut, ""
    FPRINT ResOut, "// BCX generated *.rc file listing"
    FPRINT ResOut, ""

    WHILE NOT EOF(ResIn)
      LINE INPUT ResIn,Z$       ' Read from temp$
      IF INSTR(Z$,"include",0,1) > 0 THEN
        FPRINT ResOut, ""
      END IF
      FPRINT ResOut,Z$          ' Write to final *.rc file
    WEND

    CLOSE ResOut
    CLOSE ResIn

    IF CombineRes THEN
      CLOSE UserResIn
    END IF

  END IF

  IF EXIST(resFile$) THEN
    KILL resFile$
  END IF

  '*******************************
  IF ShowStatus THEN LOCATE 2,1,1
  '*******************************
  IF NOT Quiet THEN

    INCR LinesRead, ModuleLineNos[1]

    Elapsed! = ROUND((float)clock()/(float)CLOCKS_PER_SEC,2)

    PRINT "[Lines In:" ; LinesRead ; "] [Lines Out:" ; gLinesWritten ; "] ";

    PRINT "[Statements:" ; Statements ; "] [Time:" ; Elapsed! ; " sec's]"

    IF Use_Library THEN
      Z$ = "BCX Created Runtime Library Files"
    ELSE
      Z$ = "BCX translated " + REMOVE$(FileIn$," ") + " to " + REMOVE$(FileOut$," ")
    END IF

    IF NOT Use_Library THEN
      IF UseCpp THEN
        Z$ = Z$ + " For a C++ Compiler"
      ELSE
        Z$ = Z$ + " For a C Compiler"
      END IF
    END IF

    IF Use_Project THEN
      Z$ = Z$ + " With No Runtime"
    END IF

    PRINT Z$
  END IF

  IF Use_Project AND Gen_Header THEN
    CALL Project_Support
  END IF

  IF Use_Library THEN
    CALL Library_Support
  END IF

  CALL PostProcess

  IF WarnMsg$ > "" THEN
    IF InfoBoxWarn THEN
      INFOBOX("Warnings! :" , WarnMsg$)
    ELSE
      PRINT "Warnings! :", CRLF$, WarnMsg$
    END IF
  END IF

  IF KillCFile THEN KILL FileOut$   ' -k switch issued ?

  CALL FREEGLOBALS

END FUNCTION  ' Function main  (END of BCX Translator)









SUB Project_Support()
  ' **************************************************************
  ' Added for $Project Support
  ' This reads the .c file created by BCX and creates the .h files
  ' from the information at the top of the .c file in sections such
  ' as '  User Defined Structs And Unions and User Prototyes, etc.
  ' I have instigated the BCX_STR_XXX_XXX MACROS to prevent changes
  ' being made unawares that will affect this code.
  ' **************************************************************
  LOCAL nPos1
  LOCAL nPos2
  LOCAL sExt$
  LOCAL cHFn$
  Z$ = ""
  IF EXIST( FileOut$ ) THEN
    CLOSE
    IF CmdLineFileOut$ = "" THEN
      Project_Path$ = CURDIR$
    ELSE
      Project_Path$ = MID$( CmdLineFileOut$, 1, INSTRREV(CmdLineFileOut$, "\", 0 ) - 1)
    END IF
    IF INCHR( COMMAND$(1), "\") THEN ' has a path
      cHFn$ = MID$( COMMAND$(1), INSTRREV( COMMAND$(1), "\", 0 ) + 1 )
    ELSE
      cHFn$ = COMMAND$(1)
    END IF
    IF INCHR( cHFn$, "." ) THEN ' has an extension
      cHFn$ = MID$( cHFn$, 1, INSTRREV( cHFn$, ".", 0 ) -1 )
    END IF
    HFile$ = Project_Path$ + "\" + cHFn$ + ".bh"

    OPEN FileOut$ FOR INPUT AS PJ1
    OPEN HFile$ FOR OUTPUT AS PJ2
    FPRINT PJ2, "#ifndef __BCX_HEADER_" + UCASE$(cHFn$) + "__"

    WHILE NOT EOF(PJ1)

      WHILE NOT INSTR(Z$, $BCX_STR_SYS_VARS) AND _
        NOT INSTR(Z$, $BCX_STR_USR_VARS) AND _
        NOT INSTR(Z$, $BCX_STR_STD_MACROS) AND _
        NOT INSTR(Z$, $BCX_STR_STD_PROTOS) AND _
        NOT INSTR(Z$, $BCX_STR_USR_PROTOS) AND _
        NOT INSTR(Z$, $BCX_STR_USR_CONST) AND _
        NOT INSTR(Z$, $BCX_STR_MAIN_PROG) AND _
        NOT INSTR(Z$, $BCX_STR_USR_PROCS) AND _
        NOT INSTR(Z$, $BCX_STR_USR_TYPES) AND _
        NOT EOF(PJ1)
        LINE INPUT PJ1, Z$
      WEND
      IF INSTR(Z$, $BCX_STR_SYS_VARS) THEN
        LINE INPUT PJ1, Z$ ' get rid of '// ***************
        IF EOF(PJ1) THEN EXIT WHILE
        FPRINT PJ2, "// *****************"
        FPRINT PJ2, "// " + $BCX_STR_SYS_VARS
        FPRINT PJ2, "// *****************"
        FPRINT PJ2, ""
        LINE INPUT PJ1, Z$
        WHILE NOT INSTR(Z$, $BCX_STR_USR_VARS) AND _
          NOT INSTR(Z$, $BCX_STR_STD_MACROS) AND _
          NOT INSTR(Z$, $BCX_STR_STD_PROTOS) AND _
          NOT INSTR(Z$, $BCX_STR_USR_PROTOS) AND _
          NOT INSTR(Z$, $BCX_STR_USR_CONST) AND _
          NOT INSTR(Z$, $BCX_STR_MAIN_PROG) AND _
          NOT INSTR(Z$, $BCX_STR_USR_PROCS) AND _
          NOT INSTR(Z$, $BCX_STR_USR_TYPES) AND _
          NOT EOF(PJ1)
          IF LEFT$( Z$, 4) = "// *" THEN
            LINE INPUT PJ1, Z$
            EXIT WHILE
          ELSEIF Z$ = "" THEN
          ELSEIF LEFT$(TRIM$(Z$),2) = "//" THEN
          ELSEIF Z$ <> "" THEN
            IF INCHR(Z$, "=" ) THEN
              ' Get rid of = TO ;
              ' char    CRLF[3]={13,10,0}; // Carr Rtn & Line Feed
              nPos1 = INCHR(Z$, "=" )
              nPos2 = INCHR(Z$, ";" )
              sExt$ = MID$( Z$, nPos1, nPos2 - nPos1 )
              REPLACE sExt$ WITH "" IN Z$
            END IF
            IF NOT LEFT$(Z$, 6) = "static" THEN
              FPRINT PJ2, "extern " + Z$
            END IF
          END IF
          LINE INPUT PJ1, Z$
        WEND
        FPRINT PJ2, ""
      ELSEIF INSTR(Z$, $BCX_STR_USR_VARS) THEN
        LINE INPUT PJ1, Z$ ' get rid of '// ***************
        FPRINT PJ2, "// *****************"
        FPRINT PJ2, "// " + $BCX_STR_USR_VARS
        FPRINT PJ2, "// *****************"
        FPRINT PJ2, ""
        LINE INPUT PJ1, Z$
        WHILE NOT INSTR(Z$, $BCX_STR_SYS_VARS) AND _
          NOT INSTR(Z$, $BCX_STR_STD_MACROS) AND _
          NOT INSTR(Z$, $BCX_STR_STD_PROTOS) AND _
          NOT INSTR(Z$, $BCX_STR_USR_PROTOS) AND _
          NOT INSTR(Z$, $BCX_STR_USR_CONST) AND _
          NOT INSTR(Z$, $BCX_STR_MAIN_PROG) AND _
          NOT INSTR(Z$, $BCX_STR_USR_PROCS) AND _
          NOT INSTR(Z$, $BCX_STR_USR_TYPES) AND _
          NOT EOF(PJ1)
          IF LEFT$( Z$, 4) = "// *" THEN
            LINE INPUT PJ1, Z$
            EXIT WHILE
          ELSEIF Z$ = "" THEN
          ELSEIF LEFT$(TRIM$(Z$),2) = "//" THEN
          ELSEIF LEFT$(TRIM$(Z$),1) = "#" THEN
            FPRINT PJ2, Z$
          ELSEIF Z$ <> "" THEN
            IF INCHR(Z$, "=" ) THEN
              ' Get rid of = TO ;
              ' char    CRLF[3]={13,10,0}; // Carr Rtn & Line Feed
              nPos1 = INCHR(Z$, "=" )
              nPos2 = INCHR(Z$, ";" )
              sExt$ = MID$( Z$, nPos1, nPos2 - nPos1 )
              REPLACE sExt$ WITH "" IN Z$
            END IF
            IF LEFT$(Z$, 6) <> "extern" THEN
              FPRINT PJ2, "extern " + Z$
            ELSE
              FPRINT PJ2, Z$
            END IF
          END IF
          LINE INPUT PJ1, Z$
        WEND
        FPRINT PJ2, ""
      ELSEIF INSTR(Z$, $BCX_STR_STD_MACROS) THEN
        LINE INPUT PJ1, Z$ ' get rid of '// ***************
        FPRINT PJ2, "// *****************"
        FPRINT PJ2, "// " + $BCX_STR_STD_MACROS
        FPRINT PJ2, "// *****************"
        FPRINT PJ2, ""
        LINE INPUT PJ1, Z$
        WHILE NOT INSTR(Z$, $BCX_STR_SYS_VARS) AND _
          NOT INSTR(Z$, $BCX_STR_USR_VARS) AND _
          NOT INSTR(Z$, $BCX_STR_STD_PROTOS) AND _
          NOT INSTR(Z$, $BCX_STR_USR_PROTOS) AND _
          NOT INSTR(Z$, $BCX_STR_USR_CONST) AND _
          NOT INSTR(Z$, $BCX_STR_MAIN_PROG) AND _
          NOT INSTR(Z$, $BCX_STR_USR_PROCS) AND _
          NOT INSTR(Z$, $BCX_STR_USR_TYPES) AND _
          NOT EOF(PJ1)
          IF LEFT$( Z$, 4) = "// *" THEN
            LINE INPUT PJ1, Z$
            EXIT WHILE
          ELSEIF Z$ = "" THEN
          ELSEIF LEFT$(TRIM$(Z$),2) = "//" THEN
          ELSEIF Z$ <> "" THEN
            FPRINT PJ2,Z$
          END IF
          LINE INPUT PJ1, Z$
        WEND
        FPRINT PJ2, ""
      ELSEIF INSTR(Z$, $BCX_STR_STD_PROTOS) THEN
        LINE INPUT PJ1, Z$ ' get rid of '// ***************
        FPRINT PJ2, "// *****************"
        FPRINT PJ2, "// " + $BCX_STR_STD_PROTOS
        FPRINT PJ2, "// *****************"
        FPRINT PJ2, ""
        LINE INPUT PJ1, Z$
        WHILE NOT INSTR(Z$, $BCX_STR_SYS_VARS) AND _
          NOT INSTR(Z$, $BCX_STR_USR_VARS) AND _
          NOT INSTR(Z$, $BCX_STR_STD_MACROS) AND _
          NOT INSTR(Z$, $BCX_STR_USR_PROTOS) AND _
          NOT INSTR(Z$, $BCX_STR_USR_CONST) AND _
          NOT INSTR(Z$, $BCX_STR_MAIN_PROG) AND _
          NOT INSTR(Z$, $BCX_STR_USR_PROCS) AND _
          NOT INSTR(Z$, $BCX_STR_USR_TYPES) AND _
          NOT EOF(PJ1)
          IF LEFT$( Z$, 4) = "// *" THEN
            LINE INPUT PJ1, Z$
            EXIT WHILE
          ELSEIF Z$ = "" THEN
          ELSEIF LEFT$(TRIM$(Z$),2) = "//" THEN
          ELSEIF Z$ <> "" THEN
            LOCAL p AS CHAR PTR
            ' added to get rid of assignment to optional parameters
            ' PellesC don't like them
            WHILE INCHR(Z$, "=" )
              ' remove = up to comma, space, right paren, semi-colon
              ' char*   mid (char*, int, int=-1);
              nPos1 = INCHR(Z$, "=" )
              p = Z$
              p = p + nPos1 - 1
              DO
                IF *p <> ASC(",") AND *p <> ASC(" ") AND *p <> ASC(")") THEN
                  *p = 1
                ELSE
                  EXIT DO
                END IF
                p++
              LOOP
              REPLACE CHR$(1) WITH ""  IN Z$
            WEND
            IF LEFT$(Z$, 6) <> "extern" THEN
              FPRINT PJ2, "extern " + Z$
            ELSE
              FPRINT PJ2, Z$
            END IF
          END IF
          LINE INPUT PJ1, Z$
        WEND
        FPRINT PJ2, ""
      ELSEIF INSTR(Z$, $BCX_STR_USR_PROTOS) THEN
        LINE INPUT PJ1, Z$ ' get rid of '// ***************
        FPRINT PJ2, "// *****************"
        FPRINT PJ2, "// " + $BCX_STR_USR_PROTOS
        FPRINT PJ2, "// *****************"
        FPRINT PJ2, ""
        LINE INPUT PJ1, Z$
        IF EOF(PJ1) THEN EXIT WHILE
        WHILE NOT INSTR(Z$, $BCX_STR_SYS_VARS) AND _
          NOT INSTR(Z$, $BCX_STR_USR_VARS) AND _
          NOT INSTR(Z$, $BCX_STR_STD_MACROS) AND _
          NOT INSTR(Z$, $BCX_STR_STD_PROTOS) AND _
          NOT INSTR(Z$, $BCX_STR_USR_CONST) AND _
          NOT INSTR(Z$, $BCX_STR_MAIN_PROG) AND _
          NOT INSTR(Z$, $BCX_STR_USR_PROCS) AND _
          NOT INSTR(Z$, $BCX_STR_USR_TYPES) AND _
          NOT EOF(PJ1)
          IF LEFT$( Z$, 4) = "// *" THEN
            LINE INPUT PJ1, Z$
            EXIT WHILE
          ELSEIF INSTR(Z$, " main") OR INSTR(Z$, " WinMain") THEN
          ELSEIF Z$ = "" THEN
          ELSEIF LEFT$(TRIM$(Z$),2) = "//" THEN
          ELSEIF LEFT$(Z$,1) = " " THEN
          ELSEIF Z$ <> "" THEN
            FPRINT PJ2, "extern " + Z$
          END IF
          LINE INPUT PJ1, Z$
        WEND
        FPRINT PJ2, ""
      ELSEIF INSTR(Z$, $BCX_STR_USR_CONST) THEN
        LINE INPUT PJ1, Z$ ' get rid of '// ***************
        FPRINT PJ2, "// *****************"
        FPRINT PJ2, "// " + $BCX_STR_USR_CONST
        FPRINT PJ2, "// *****************"
        FPRINT PJ2, ""
        LINE INPUT PJ1, Z$
        WHILE NOT INSTR(Z$, $BCX_STR_SYS_VARS) AND _
          NOT INSTR(Z$, $BCX_STR_USR_VARS) AND _
          NOT INSTR(Z$, $BCX_STR_STD_MACROS) AND _
          NOT INSTR(Z$, $BCX_STR_STD_PROTOS) AND _
          NOT INSTR(Z$, $BCX_STR_USR_PROTOS) AND _
          NOT INSTR(Z$, $BCX_STR_MAIN_PROG) AND _
          NOT INSTR(Z$, $BCX_STR_USR_PROCS) AND _
          NOT INSTR(Z$, $BCX_STR_USR_TYPES) AND _
          NOT EOF(PJ1)
          IF LEFT$( Z$, 4) = "// *" THEN
            LINE INPUT PJ1, Z$
            EXIT WHILE
          ELSEIF Z$ = "" THEN
          ELSEIF LEFT$(TRIM$(Z$),2) = "//" THEN
          ELSEIF Z$ <> "" THEN
            FPRINT PJ2, Z$
          END IF
          LINE INPUT PJ1, Z$
        WEND
        FPRINT PJ2, ""
      ELSEIF INSTR(Z$, $BCX_STR_MAIN_PROG) THEN
        EXIT WHILE
      ELSEIF INSTR(Z$, $BCX_STR_USR_PROCS) THEN
        EXIT WHILE
      ELSEIF INSTR(Z$, $BCX_STR_USR_TYPES) THEN
        LINE INPUT PJ1, Z$ ' get rid of '// ***************
        FPRINT PJ2, "// *****************"
        FPRINT PJ2, "// " + $BCX_STR_USR_TYPES
        FPRINT PJ2, "// *****************"
        FPRINT PJ2, ""
        LINE INPUT PJ1, Z$
        WHILE NOT INSTR(Z$, $BCX_STR_SYS_VARS) AND _
          NOT INSTR(Z$, $BCX_STR_USR_VARS) AND _
          NOT INSTR(Z$, $BCX_STR_STD_MACROS) AND _
          NOT INSTR(Z$, $BCX_STR_STD_PROTOS) AND _
          NOT INSTR(Z$, $BCX_STR_USR_PROTOS) AND _
          NOT INSTR(Z$, $BCX_STR_USR_CONST) AND _
          NOT INSTR(Z$, $BCX_STR_MAIN_PROG) AND _
          NOT INSTR(Z$, $BCX_STR_USR_PROCS) AND _
          NOT EOF(PJ1)
          IF LEFT$( Z$, 4) = "// *" THEN
            LINE INPUT PJ1, Z$
            EXIT WHILE
          ELSEIF Z$ = "" THEN
          ELSEIF LEFT$(TRIM$(Z$),2) = "//" THEN
          ELSEIF Z$ <> "" THEN
            'IF LEFT$(Z$, 7) = "typedef" THEN
            '  FPRINT PJ2, "extern " + Z$
            'ELSE
            FPRINT PJ2, Z$
            'END IF
          END IF
          LINE INPUT PJ1, Z$
        WEND
        FPRINT PJ2, ""
      END IF
    WEND
    FPRINT PJ2, "#endif // __BCX_HEADER_" + UCASE$(cHFn$) + "__"
    CLOSE PJ1
    CLOSE PJ2
  END IF

  ' **************************************************************
  ' End of $Project Support
  ' **************************************************************
END SUB ' Project_Support

' **************************************************************
' BCX Runtime Library Support
' **************************************************************

' NOTE: LCC-WIN32's MAKE.EXE REQUIRES TABS, 8 SPACES WON'T DO!!!

SUB Library_Support()

  CONST MAX_C_FILES = 500

  LOCAL thisDir$
  LOCAL BCXDir$
  LOCAL SrcDir$
  LOCAL ObjDir$
  LOCAL LibDir$
  LOCAL DllDir$
  LOCAL Exprt$
  LOCAL IncLibFile$
  LOCAL IncDir$
  LOCAL IncFile$
  LOCAL RTFile$
  LOCAL RSPFile$
  LOCAL BuildBat$
  LOCAL nPos1
  LOCAL nPos2
  LOCAL sExt$
  LOCAL SrcF$
  LOCAL SrcExt$
  LOCAL TmpF$
  LOCAL TmpExt$
  LOCAL BraceCnt
  LOCAL typePos
  LOCAL pstr$
  LOCAL fstr$
  LOCAL DYNAMIC C_Files$[MAX_C_FILES]
  LOCAL cIdx
  LOCAL rspNdx
  LOCAL Z1$
  LOCAL i_
  DIM RAW NewSrc$ * 1024 * 25
  DIM RAW OldSrc$ * 1024 * 25
  ' ************************************************************

  IF UseCpp THEN
    SrcExt$ = ".cpp"
    RTFile$ = "BCXRT.CPP"
  ELSE
    SrcExt$ = ".c"
    RTFile$ = "BCXRT.C"
  END IF
  thisDir$ = CURDIR$
  BCXDir$  = LEFT$( BCXPATH$, LEN( BCXPATH$ ) - 4 )
  SrcDir$ = BCXDir$ + "rtlib\\source\\"
  ObjDir$ = BCXDir$ + "rtlib\\obj\\"
  LibDir$ = BCXDir$ + "rtlib\\lib\\"
  DllDir$ = BCXDir$ + "rtlib\\dll\\"
  IncDir$ = BCXDir$ + "rtlib\\include\\"
  RSPFile$ = BCXDir$ + "rtlib\\bcxrt.rsp"
  BuildBat$ = BCXDir$ + "rtlib\\BuildRTL.bat"
  IncLibFile$ = IncDir$ + "BCXLib.h"
  IncFile$ = IncDir$ + "bcxRT.h"

  Z$ = ""

  ' Make Sure Directories exist
  ' and if not make them
  IF EXIST( "BCXRT.BAS" ) THEN KILL "BCXRT.BAS"
  IF NOT EXIST( BCXDir$ + "rtlib" ) THEN MKDIR BCXDir$ + "rtlib"
  IF NOT EXIST( SrcDir$ ) THEN MKDIR SrcDir$
  IF NOT EXIST( ObjDir$ ) THEN MKDIR ObjDir$
  IF NOT EXIST( IncDir$ ) THEN MKDIR IncDir$
  IF NOT EXIST( LibDir$ ) THEN MKDIR LibDir$
  IF NOT EXIST( DllDir$ ) THEN MKDIR DllDir$

  IF NOT EXIST( SrcDir$ ) THEN MSGBOX( "Failed to Create " + SrcDir$ ) : END = 1
  IF NOT EXIST( ObjDir$ ) THEN MSGBOX( "Failed to Create " + ObjDir$ ) : END = 1
  IF NOT EXIST( IncDir$ ) THEN MSGBOX( "Failed to Create " + IncDir$ ) : END = 1
  IF NOT EXIST( LibDir$ ) THEN MSGBOX( "Failed to Create " + LibDir$ ) : END = 1
  IF NOT EXIST( DllDir$ ) THEN MSGBOX( "Failed to Create " + DllDir$ ) : END = 1

  IF NOT EXIST( ObjDir$ + "LC" ) THEN MKDIR ObjDir$ + "LC"
  IF NOT EXIST( ObjDir$ + "PC" ) THEN MKDIR ObjDir$ + "PC"
  IF NOT EXIST( ObjDir$ + "BC" ) THEN MKDIR ObjDir$ + "BC"
  IF NOT EXIST( ObjDir$ + "MC" ) THEN MKDIR ObjDir$ + "MC"
  IF NOT EXIST( ObjDir$ + "WC" ) THEN MKDIR ObjDir$ + "WC"
  IF NOT EXIST( ObjDir$ + "GC" ) THEN MKDIR ObjDir$ + "GC"
  IF NOT EXIST( ObjDir$ + "DC" ) THEN MKDIR ObjDir$ + "DC"

  IF NOT EXIST( ObjDir$ + "LC" ) THEN MSGBOX( "Failed to Create " + ObjDir$ + "LC" ) : END = 1
  IF NOT EXIST( ObjDir$ + "PC" ) THEN MSGBOX( "Failed to Create " + ObjDir$ + "PC" ) : END = 1
  IF NOT EXIST( ObjDir$ + "BC" ) THEN MSGBOX( "Failed to Create " + ObjDir$ + "BC" ) : END = 1
  IF NOT EXIST( ObjDir$ + "MC" ) THEN MSGBOX( "Failed to Create " + ObjDir$ + "MC" ) : END = 1
  IF NOT EXIST( ObjDir$ + "WC" ) THEN MSGBOX( "Failed to Create " + ObjDir$ + "WC" ) : END = 1
  IF NOT EXIST( ObjDir$ + "GC" ) THEN MSGBOX( "Failed to Create " + ObjDir$ + "GC" ) : END = 1
  IF NOT EXIST( ObjDir$ + "DC" ) THEN MSGBOX( "Failed to Create " + ObjDir$ + "DC" ) : END = 1

  IF NOT EXIST( LibDir$ + "LC" ) THEN MKDIR LibDir$ + "LC"
  IF NOT EXIST( LibDir$ + "PC" ) THEN MKDIR LibDir$ + "PC"
  IF NOT EXIST( LibDir$ + "BC" ) THEN MKDIR LibDir$ + "BC"
  IF NOT EXIST( LibDir$ + "MC" ) THEN MKDIR LibDir$ + "MC"
  IF NOT EXIST( LibDir$ + "WC" ) THEN MKDIR LibDir$ + "WC"
  IF NOT EXIST( LibDir$ + "GC" ) THEN MKDIR LibDir$ + "GC"
  IF NOT EXIST( LibDir$ + "DC" ) THEN MKDIR LibDir$ + "DC"

  IF NOT EXIST( LibDir$ + "LC" ) THEN MSGBOX( "Failed to Create " + LibDir$ + "LC" ) : END = 1
  IF NOT EXIST( LibDir$ + "PC" ) THEN MSGBOX( "Failed to Create " + LibDir$ + "PC" ) : END = 1
  IF NOT EXIST( LibDir$ + "BC" ) THEN MSGBOX( "Failed to Create " + LibDir$ + "BC" ) : END = 1
  IF NOT EXIST( LibDir$ + "MC" ) THEN MSGBOX( "Failed to Create " + LibDir$ + "MC" ) : END = 1
  IF NOT EXIST( LibDir$ + "WC" ) THEN MSGBOX( "Failed to Create " + LibDir$ + "WC" ) : END = 1
  IF NOT EXIST( LibDir$ + "GC" ) THEN MSGBOX( "Failed to Create " + LibDir$ + "GC" ) : END = 1
  IF NOT EXIST( LibDir$ + "DC" ) THEN MSGBOX( "Failed to Create " + LibDir$ + "DC" ) : END = 1

  IF EXIST( RTFile$ ) THEN
    CLOSE
    IF Use_Dll THEN
      SrcF$ = SrcDir$ + "\\BCXRTDLL" + SrcExt$
      OPEN SrcF$ FOR OUTPUT AS LB5
      FPRINT LB5, "#include <bcxLib.h>\n\n"
      FPRINT LB5,"__declspec(dllexport) BOOL WINAPI DllMain (HINSTANCE hInst, DWORD Reason, LPVOID Reserved)"
      FPRINT LB5,"{"
      FPRINT LB5," switch (Reason)"
      FPRINT LB5," {"
      FPRINT LB5,"    case DLL_PROCESS_ATTACH:"
      FPRINT LB5,"      BCX_hInstance = hInst;"
      FPRINT LB5,"      break;"
      FPRINT LB5,"    case DLL_PROCESS_DETACH:"
      FPRINT LB5,"      break;"
      FPRINT LB5,"    case DLL_THREAD_ATTACH:"
      FPRINT LB5,"      break;"
      FPRINT LB5,"    case DLL_THREAD_DETACH:"
      FPRINT LB5,"      break;"
      FPRINT LB5," }"
      FPRINT LB5," return TRUE;"
      FPRINT LB5,"}\n\n"
    END IF
    OPEN IncFile$ FOR OUTPUT AS LB0
    OPEN RTFile$ FOR INPUT AS LB1
    OPEN IncLibFile$ FOR OUTPUT AS LB2
    WHILE NOT INSTR( Z$, "BCXRTHEADER: SYSTEM VARIABLES" )
      READLINE1:
      Z$ = Getline$()
      IF INSTR( Z$, "BCXRTHEADER: SYSTEM VARIABLES" ) THEN ITERATE
      Z1$ = Z$
      Z$ = TRIM$(Z$)
      ' check for structs
      IF LEFT$(Z$, 7) = "typedef" THEN
        IF INSTR(Z$, "struct") THEN
          BraceCnt = BraceCount( Z$ )
          FPRINT LB2, Z$
          WHILE BraceCnt = 0
            Z$ = Getline$()
            BraceCnt = BraceCnt + BraceCount( Z$ )
            FPRINT LB2, Z$
          WEND
          WHILE BraceCnt <> 0
            Z$ = Getline$()
            BraceCnt = BraceCnt + BraceCount( Z$ )
            FPRINT LB2, Z$
          WEND
          GOTO READLINE1
        END IF
        ITERATE
      END IF
      '----
      IF LEFT$(Z$,18) = "DECLARE_INTERFACE_" THEN
        FPRINT LB2, Z1$
        WHILE TRUE
          Z$ = Getline$()
          IF INSTR( Z$, "BCXRTHEADER: SYSTEM VARIABLES" ) THEN EXIT
          FPRINT LB2, Z$
          IF INCHR(Z$, ";") AND INCHR(Z$, "}") THEN EXIT
        WEND
        ITERATE
      END IF
      IF Z$ = "" OR LEFT$(Z$, 2)  = "//" OR LEFT$(Z$, 1)  = " " OR _
        LEFT$(Z$, 1)  = "{" OR LEFT$(Z$, 1)  = "}" OR _
        LEFT$(Z$, 9)  = "STDMETHOD" OR LEFT$(Z$, 7)  = "DECLARE" OR _
        LEFT$(Z$, 9)  = "ITypeInfo" OR LEFT$(Z$, 1) = "#" THEN
        FPRINT LB2, Z1$
        ITERATE
      END IF
      IF iMatchLft(Z$,"const") THEN
        REPLACE "=" WITH ";" IN Z1$
        FPRINT LB2, "extern " + Z1$
        WHILE NOT INCHR(Z$, ";")
          Z$ = Getline$()
          'FPRINT LB2, Z$
        WEND
        ITERATE
      END IF
      IF iMatchLft(Z$,"enum") THEN
        FPRINT LB2, Z1$
        WHILE NOT INCHR(Z$, ";")
          Z$ = Getline$()
          IF INSTR( Z$, "BCXRTHEADER: SYSTEM VARIABLES" ) THEN EXIT
          FPRINT LB2, Z$
        WEND
        ITERATE
      END IF
      IF INCHR(Z$, "=" ) AND INCHR(Z$, ";" ) THEN
        ' Get rid of = TO ;
        ' char    CRLF[3]={13,10,0}; // Carr Rtn & Line Feed
        nPos1 = INCHR(Z$, "=" )
        nPos2 = INCHR(Z$, ";" )
        sExt$ = MID$( Z$, nPos1, nPos2 - nPos1 )
        REPLACE sExt$ WITH "" IN Z$
        IF NOT Use_Dll THEN
          Z$ = "extern " + Z$
        END IF
        FPRINT LB2, Z$
      ELSEIF INCHR( Z$, "=") AND NOT INCHR(Z$, ";" ) THEN
        REPLACE "=" WITH ";" IN Z$
        IF NOT Use_Dll THEN
          FPRINT LB2, "extern " + Z$
        END IF
        Z$ = ""
        WHILE NOT INCHR(Z$, ";" )
          Z$ = Getline$()
          IF INSTR( Z$, "BCXRTHEADER: SYSTEM VARIABLES" ) THEN EXIT
        WEND
      ELSE
        IF NOT Use_Dll THEN
          Z$ = "extern " + Z$
        END IF
        FPRINT LB2, Z$
      END IF
    WEND

    WHILE NOT INSTR( Z$, "// BCXRTHEADER: STANDARD PROTOTYPES" )
      FPRINT LB2, Z$
      READLINE:
      Z$ = Getline$()
      IF Z$ = "" THEN ITERATE
      IF LEFT$(Z$, 2)  = "//" THEN ITERATE
      IF LEFT$(Z$, 1)  = " " THEN ITERATE
      IF LEFT$(Z$, 1)  = "{" THEN ITERATE
      IF LEFT$(Z$, 1)  = "}" THEN ITERATE
      IF LEFT$(Z$, 1)  = "#" THEN ITERATE
      IF LEFT$(Z$, 6) = "static" THEN
        IF Use_Dll THEN
          REPLACE "static " WITH "C_EXPORT " IN Z$
        ELSE
          REPLACE "static " WITH "" IN Z$
        END IF
      END IF
      IF LEFT$(Z$, 7) = "typedef" THEN
        IF INSTR(Z$, "struct") THEN
          BraceCnt = BraceCount( Z$ )
          FPRINT LB2, Z$
          WHILE BraceCnt = 0
            Z$ = Getline$()
            BraceCnt = BraceCnt + BraceCount( Z$ )
            FPRINT LB2, Z$
          WEND
          WHILE BraceCnt <> 0
            Z$ = Getline$()
            BraceCnt = BraceCnt + BraceCount( Z$ )
            FPRINT LB2, Z$
          WEND
          GOTO READLINE
        END IF
        ITERATE
      END IF
      IF INCHR(Z$, "=" ) THEN
        ' Get rid of = TO ;
        ' char    CRLF[3]={13,10,0}; // Carr Rtn & Line Feed
        nPos1 = INCHR(Z$, "=" )
        nPos2 = INCHR(Z$, ";" )
        sExt$ = MID$( Z$, nPos1, nPos2 - nPos1 )
        REPLACE sExt$ WITH "" IN Z$
      END IF
      IF NOT Use_Dll THEN Z$ = "extern " + Z$
    WEND

    ' Kludge solution to Ljubisas New Com Stuff

    FPRINT LB0, "// *************************************************"
    FPRINT LB0, "// Late binding COM support section"
    FPRINT LB0, "// (c) Ljubisa Knezevic 2004-2009, ljube@blic.net"
    FPRINT LB0, "// *************************************************"
    FPRINT LB0, "// types used by Late binding COM support"
    FPRINT LB0, ""
    FPRINT LB0, "#define COM_STACK_SIZE  64"
    FPRINT LB0, "#ifndef CON_VARBOOL2BOOL"
    FPRINT LB0, "#define CON_VARBOOL2BOOL(b) ((BOOL)(b ? TRUE : FALSE))"
    FPRINT LB0, "#endif"
    FPRINT LB0, ""
    FPRINT LB0, "typedef struct _OBJECT"
    FPRINT LB0, "{"
    FPRINT LB0, "IUnknown*  p_unknown;"
    FPRINT LB0, "VARIANT    pObjects[COM_STACK_SIZE];"
    FPRINT LB0, "BOOL       pStatus;"
    FPRINT LB0, "int        ipointer;"
    FPRINT LB0, "}OBJECT, *LPOBJECT;"
    FPRINT LB0, ""
    FPRINT LB0, "typedef struct _PARAM_VARARRAY"
    FPRINT LB0, "{"
    FPRINT LB0, "VARIANT  pParams[COM_STACK_SIZE];"
    FPRINT LB0, "}PARAM_VARARRAY, *LPPARAM_VARARRAY;"
    ' End of ComKludge

    FPRINT LB0, ""
    FPRINT LB0, "// *************************************************"
    FPRINT LB0, "// Standard Prototypes"
    FPRINT LB0, "// *************************************************"
    FPRINT LB0, ""

    WHILE NOT INSTR( Z$, "Runtime Functions" )
      FPRINT LB2, Z$
      BYPASS:
      Z$ = Getline$()
      IF Z$ = "" THEN ITERATE
      IF LEFT$(Z$, 2)  = "//" THEN ITERATE
      IF LEFT$(Z$, 1)  = " " THEN ITERATE
      IF LEFT$(Z$, 1)  = "{" THEN ITERATE
      IF LEFT$(Z$, 1)  = "}" THEN ITERATE
      IF LEFT$(Z$, 6)  = "STDAPI" THEN ITERATE
      IF LEFT$(Z$, 7)  = "#define" THEN ITERATE
      IF LEFT$(Z$, 1)  = "#" THEN ITERATE
      IF LEFT$(Z$, 6)  = "static" THEN
        REPLACE "static " WITH "" IN Z$
      END IF

      IF LEFT$(Z$, 7) = "typedef" THEN
        FPRINT LB0, Z$
        ITERATE
      END IF


      IF Use_Dll THEN
        typePos = INCHR( Z$, "(")
        typePos = INSTRREV( Z$," ", typePos-2)
        pstr$   = LEFT$(Z$,typePos-1)
        fstr$   = MID$(Z$,typePos)
        FPRINT LB0, Z% '"C_EXPORT " + Z$
        FPRINT LB2, "C_EXPORT " + Z$
        GOTO BYPASS
      ELSE
        Z$ = "extern " + Z$
        FPRINT LB0, Z$
      END IF

    WEND
    FPRINT LB2, "//     End of bcxLIB.h Runtime Library Include File"
    FPRINT LB2, "// *************************************************"
    CLOSE LB2

    ' Create the .c source files

    cIdx = 0
    Z$ = Getline$()
    Z$ = Getline$()
    TmpExt$ = ".tmp"
    IF Use_Dll THEN

      WHILE NOT EOF(LB1)
        Z$ = Getline$()
        IF NOT INSTR(Z$, "BCXRTLIB:") THEN ITERATE
        Z$ = Getline$() ' get next line following "BCXRTLIB:"

        WHILE LEFT$(TRIM$(Z$),1) = "#"
          FPRINT LB5, Z$
          Z$ = Getline$()
        WEND

        WHILE NOT INCHR( Z$, "(")
          Z$ = Z$ + TRIM$(Getline$())
        WEND

        typePos = INCHR( Z$, "(")
        typePos = INSTRREV( Z$," ", typePos-2)
        pstr$   = LEFT$(Z$,typePos-1)
        fstr$   = MID$(Z$,typePos)
        FPRINT LB5,"C_EXPORT " + Z$

        Z$ = Getline$()

        WHILE NOT INSTR( Z$, "ENDBCXRTLIB" )
          FPRINT LB5, Z$
          Z$ = Getline$()
        WEND

      WEND
      FPRINT LB5, ""
      CLOSE LB5
    ELSE
      WHILE NOT EOF(LB1)

        Z$ = Getline$()

        IF NOT INSTR(Z$, "BCXRTLIB:") THEN ITERATE
        SrcF$ = TRIM$(MID$( Z$, INCHR(Z$, ":") + 1))

        Exprt$ = SrcF$
        IF cIdx >= MAX_C_FILES THEN MSGBOX "TOO MANY C FILES", "ERROR!" : END = 1
        C_Files$[cIdx++] = SrcF$
        TmpF$ = SrcDir$ + "\" + SrcF$ + TmpExt$
        SrcF$ = SrcDir$ + "\" + SrcF$ + SrcExt$

        ' First write to temp file for comparison if
        ' Source file exists
        IF EXIST ( SrcF$ ) THEN
          OPEN TmpF$ FOR OUTPUT AS LB2
        ELSE
          OPEN SrcF$ FOR OUTPUT AS LB2
        END IF

        FPRINT LB2, "#include <bcxLib.h>"
        FPRINT LB2, ""


        Z$ = Getline$()

        WHILE NOT INSTR( Z$, "ENDBCXRTLIB" )
          FPRINT LB2, Z$
          Z$ = Getline$()
        WEND

        FPRINT LB2, ""
        CLOSE LB2

        ' compare files and if new is same as what
        ' exist, don't replace it.  This will make
        ' it much quicker to rebuild the .lib if the .c/.cpp
        ' files are not changed from version to version
        ' All of this is in anticipation of using a make file
        ' or build.exe to build the runtime library only if
        ' needed.  Theoretically the same code will compile
        ' and link for all C and C++ compilers and if it won't
        ' we need to fix it.

        IF EXIST ( TmpF$ ) AND EXIST ( SrcF$ ) THEN
          ' Load them both into memory
          ' I have dim'ed both to be 100,000 bytes, as of this
          ' writing the largest .c/.cpp file is < 5KB so
          ' this should be good for a while
          NewSrc$ = LOADFILE$( TmpF$ )
          OldSrc$ = LOADFILE$( SrcF$ )
          ' compare them
          IF NewSrc$ = OldSrc$ THEN
            ' if same then kill the tmp and keep old one
            KILL TmpF$
          ELSE
            COPYFILE TmpF$, SrcF$
          END IF
        ELSE ' both don't exist, copy tmp to src
          COPYFILE TmpF$, SrcF$
          KILL TmpF$
        END IF

      WEND
    END IF
    CLOSE LB1

    ' create response file for BCC55's TLib.exe

    OPEN RSPFile$ FOR OUTPUT AS LB3

    REDIM PRESERVE C_Files$[cIdx]

    QSORT DYNAMIC C_Files$, cIdx

    cIdx--

    FOR INTEGER i = 0 TO cIdx
      IF i < cIdx THEN
        FPRINT LB3, " + " + ObjDir$ + "BC\\" + C_Files$[i] + ".obj" + " &"
      ELSE
        FPRINT LB3, " + " + ObjDir$ + "BC\\" + C_Files$[i] + ".obj"
      END IF
    NEXT

    CLOSE LB3

    ' emit BuildRTL.bat if it doesn't exist only
    IF NOT EXIST ( BuildBat$ ) THEN
      OPEN BuildBat$ FOR OUTPUT AS LB4
      ' This is a work in progress
      $IPRINT_ON
      FPRINT LB4,"@ECHO OFF"
      FPRINT LB4,""
      FPRINT LB4,":: IF EXIST .\obj\DC\*.obj ERASE .\obj\DC\*.obj"
      FPRINT LB4,""
      FPRINT LB4,":: IF EXIST .\obj\LC\*.obj ERASE .\obj\LC\*.obj"
      FPRINT LB4,""
      FPRINT LB4,":: IF EXIST .\obj\MC\*.obj ERASE .\obj\MC\*.obj"
      FPRINT LB4,""
      FPRINT LB4,":: IF EXIST .\obj\BC\*.obj ERASE .\obj\BC\*.obj"
      FPRINT LB4,""
      FPRINT LB4,":: IF EXIST .\obj\PC\*.obj ERASE .\obj\PC\*.obj"
      FPRINT LB4,""
      FPRINT LB4,":: IF EXIST .\obj\WC\*.obj ERASE .\obj\WC\*.obj"
      FPRINT LB4,""
      FPRINT LB4,":: IF EXIST .\obj\GC\*.o   ERASE .\obj\GC\*.o"
      FPRINT LB4,""
      FPRINT LB4,"IF EXIST .\source\*.err ERASE .\source\*.err"
      FPRINT LB4,""
      FPRINT LB4,":: IF EXIST .\source\*.c ERASE .\source\*.c"
      FPRINT LB4,""
      FPRINT LB4,":: IF EXIST .\source\*.cpp ERASE .\source\*.cpp"
      FPRINT LB4,""
      FPRINT LB4,"IF EXIST *.err ERASE *.err"
      FPRINT LB4,""
      FPRINT LB4,"IF EXIST bcxrt.rsp ERASE bcxrt.rsp"
      FPRINT LB4,""
      FPRINT LB4,"IF EXIST bcxRT.lib ERASE bcxRT.lib"
      FPRINT LB4,""
      FPRINT LB4,"REM NOTE You must change the location of your compiler installs here"
      FPRINT LB4,"REM ================================================================"
      FPRINT LB4,"SET BCX_INSTALL=C:\BCX"
      FPRINT LB4,""
      FPRINT LB4,"SET MC_INSTALL=", ENC$("C:\PROGRAM FILES\Microsoft Visual C++ Toolkit 2003")
      FPRINT LB4,""
      FPRINT LB4,"SET BC_INSTALL=C:\Borland\BCC55"
      FPRINT LB4,""
      FPRINT LB4,"SET LC_INSTALL=C:\LCC"
      FPRINT LB4,""
      FPRINT LB4,"SET PC_INSTALL=C:\PellesC"
      FPRINT LB4,""
      FPRINT LB4,"SET WC_INSTALL=C:\WATCOM"
      FPRINT LB4,""
      FPRINT LB4,"SET GC_INSTALL=C:\MINGW"
      FPRINT LB4,""
      FPRINT LB4,"SET DC_INSTALL=C:\DM"
      FPRINT LB4,""
      FPRINT LB4,"REM ================================================================"
      FPRINT LB4,"REM NOTE You must change the location of your compiler installs above"
      FPRINT LB4,""
      FPRINT LB4,"IF /i ", ENC$("%1"), " == ", ENC$("D"), " GOTO DMARS32"
      FPRINT LB4,""
      FPRINT LB4,"IF /i ", ENC$("%1"), " == ", ENC$("M"), " GOTO VCCPLUS"
      FPRINT LB4,""
      FPRINT LB4,"IF /i ", ENC$("%1"), " == ", ENC$("L"), " GOTO LCCWIN32"
      FPRINT LB4,""
      FPRINT LB4,"IF /i ", ENC$("%1"), " == ", ENC$("P"), " GOTO PELLESC"
      FPRINT LB4,""
      FPRINT LB4,"IF /i ", ENC$("%1"), " == ", ENC$("B"), " GOTO BCC55"
      FPRINT LB4,""
      FPRINT LB4,"IF /i ", ENC$("%1"), " == ", ENC$("W"), " GOTO WATCOM"
      FPRINT LB4,""
      FPRINT LB4,"IF /i ", ENC$("%1"), " == ", ENC$("G"), " GOTO GCC"
      FPRINT LB4,""
      FPRINT LB4,"IF /i ", ENC$("%1"), " == ", ENC$("A"), " GOTO LCCWIN32"
      FPRINT LB4,""
      FPRINT LB4,"ECHO Missing Parameter"
      FPRINT LB4,"ECHO D for Digial Mars"
      FPRINT LB4,"ECHO M for MSVC++"
      FPRINT LB4,"ECHO L for LCCWin32"
      FPRINT LB4,"ECHO P for Pelles C"
      FPRINT LB4,"ECHO B for Borland C++ 5.5"
      FPRINT LB4,"ECHO W for Open Watcom"
      FPRINT LB4,"ECHO G for MinGW GCC"
      FPRINT LB4,"ECHO A for ", ENC$("ALL"), " = Build Libraries For MCVC++, Borland C++ 5.5, MinGW GCC, Open Watcom, LccWin32, Digital Mars and Pelles C"
      FPRINT LB4,"GOTO FINISHED"
      FPRINT LB4,""
      FPRINT LB4,"REM ========= BUILD LIBRARY with MINGW GCC Compiler"
      FPRINT LB4,":GCC"
      FPRINT LB4,""
      FPRINT LB4,"ECHO Creating BCX Runtime Library for MinGW GCC..."
      FPRINT LB4,""
      FPRINT LB4,"%BCX_INSTALL%\BIN\BC.EXE -lcq"
      FPRINT LB4,""
      FPRINT LB4,"COPY .\include\bcxlib.h %GC_INSTALL%\include\bcxlib.h /Y"
      FPRINT LB4,""
      FPRINT LB4,"COPY .\include\bcxrt.h %GC_INSTALL%\include\bcxrt.h /Y"
      FPRINT LB4,""
      FPRINT LB4,"SET GCCFLAGS=-c -pipe -mconsole -mwin32 -w -s -O2 -D_WIN32_IE=0x0501"
      FPRINT LB4,""
      FPRINT LB4,"FOR %%I IN (.\source\*.cpp) DO %GC_INSTALL%\bin\gcc.exe %GCCFLAGS% %%I -o .\obj\GC\%%~nI.o"
      FPRINT LB4,""
      FPRINT LB4,"IF ERRORLEVEL 1 GOTO ERROR"
      FPRINT LB4,""
      FPRINT LB4,"FOR %%I IN (.\obj\GC\*.o ) DO %GC_INSTALL%\bin\ar.exe -rf %GC_INSTALL%\lib\libbcxrt.a .\obj\GC\%%~nI.o"
      FPRINT LB4,""
      FPRINT LB4,"IF EXIST %GC_INSTALL%\lib\libbcxrt.a COPY %GC_INSTALL%\lib\libbcxrt.a .\lib\GC\libbcxrt.a /Y"
      FPRINT LB4,""
      FPRINT LB4,"ERASE bcxrt.rsp"
      FPRINT LB4,""
      FPRINT LB4,"IF /i ", ENC$("%1"), " == ", ENC$("A"), " GOTO DMARS32"
      FPRINT LB4,""
      FPRINT LB4,"GOTO FINISHED"
      FPRINT LB4,""
      FPRINT LB4,"REM ========= BUILD LIBRARY with Digital Mars Compiler"
      FPRINT LB4,":DMARS32"
      FPRINT LB4,""
      FPRINT LB4,"ECHO Creating BCX Runtime Library for Digital Mars..."
      FPRINT LB4,""
      FPRINT LB4,"%BCX_INSTALL%\BIN\BC.EXE -lcq"
      FPRINT LB4,""
      FPRINT LB4,"COPY .\include\bcxlib.h %DC_INSTALL%\include\bcxlib.h /Y"
      FPRINT LB4,""
      FPRINT LB4,"COPY .\include\bcxrt.h %DC_INSTALL%\include\bcxrt.h /Y"
      FPRINT LB4,""
      FPRINT LB4,"SET DMARSFLAGS=-D_WIN32_WINNT=0x0400 -I", ENC$("C:\Program Files\Microsoft Platform SDK for Windows XP SP2\Include"), " -cpp -c -w7"
      FPRINT LB4,""
      FPRINT LB4,"FOR %%I IN (.\source\*.cpp) DO %DC_INSTALL%\bin\dmc.exe %%I %DMARSFLAGS% -o.\obj\DC\%%~nI.obj"
      FPRINT LB4,""
      FPRINT LB4,"IF ERRORLEVEL 1 GOTO ERROR"
      FPRINT LB4,""
      FPRINT LB4,"IF EXIST %DC_INSTALL%\lib\bcxRT.lib ERASE %DC_INSTALL%\lib\bcxRT.lib"
      FPRINT LB4,""
      FPRINT LB4,"%DC_INSTALL%\bin\lib.exe -c %DC_INSTALL%\lib\bcxRT.lib .\obj\DC\abs.obj"
      FPRINT LB4,""
      FPRINT LB4,"%DC_INSTALL%\bin\lib.exe -d %DC_INSTALL%\lib\bcxRT.lib abs"
      FPRINT LB4,""
      FPRINT LB4,"FOR %%I IN (.\obj\DC\*.obj ) DO %DC_INSTALL%\bin\lib.exe %DC_INSTALL%\lib\bcxRT.lib .\obj\DC\%%~nI.obj"
      FPRINT LB4,""
      FPRINT LB4,"IF EXIST %DC_INSTALL%\lib\bcxRT.lib COPY %DC_INSTALL%\lib\bcxRT.lib .\lib\DC\bcxRT.lib /Y"
      FPRINT LB4,""
      FPRINT LB4,"IF EXIST %DC_INSTALL%\lib\bcxRT.bak ERASE %DC_INSTALL%\lib\bcxRT.bak"
      FPRINT LB4,""
      FPRINT LB4,"IF EXIST bcxRT.rsp ERASE bcxrt.rsp"
      FPRINT LB4,""
      FPRINT LB4,"IF /i ", ENC$("%1"), " == ", ENC$("A"), " GOTO WATCOM"
      FPRINT LB4,""
      FPRINT LB4,""
      FPRINT LB4,"GOTO FINISHED"
      FPRINT LB4,""
      FPRINT LB4,"REM ========= BUILD LIBRARY with Open Watcom Compiler"
      FPRINT LB4,":WATCOM"
      FPRINT LB4,""
      FPRINT LB4,"ECHO Creating BCX Runtime Library for Open Watcom..."
      FPRINT LB4,""
      FPRINT LB4,"%BCX_INSTALL%\BIN\BC.EXE -lcq"
      FPRINT LB4,""
      FPRINT LB4,"COPY .\include\bcxlib.h %WC_INSTALL%\h\bcxlib.h /Y"
      FPRINT LB4,""
      FPRINT LB4,"COPY .\include\bcxrt.h %WC_INSTALL%\h\bcxrt.h /Y"
      FPRINT LB4,""
      FPRINT LB4,"CALL %WC_INSTALL%\setvars.bat"
      FPRINT LB4,""
      FPRINT LB4,"SET WPP386=/bt=nt /bc /os /vcap /zw /d0 /D__WIN32__ /zq /D_WIN32_WINNT=0x0400 /D_WIN32_IE=0x0300"
      FPRINT LB4,""
      FPRINT LB4,"FOR %%I IN (.\source\*.cpp) DO %WC_INSTALL%\binnt\WPP386.exe %%I /fo=.\obj\WC\%%~nI /fr=%%~nI.err"
      FPRINT LB4,""
      FPRINT LB4,"IF ERRORLEVEL 1 GOTO ERROR"
      FPRINT LB4,""
      FPRINT LB4,"FOR %%I IN (.\obj\WC\*.obj ) DO %WC_INSTALL%\binnt\WLIB.exe /b /q %WC_INSTALL%\lib386\nt\bcxRT.lib + .\obj\WC\%%~nI.obj"
      FPRINT LB4,""
      FPRINT LB4,"IF EXIST %WC_INSTALL%\lib386\nt\bcxRT.lib COPY %WC_INSTALL%\lib386\nt\bcxRT.lib .\lib\WC\bcxRT.lib /Y"
      FPRINT LB4,""
      FPRINT LB4,"ERASE bcxrt.rsp"
      FPRINT LB4,""
      FPRINT LB4,"GOTO FINISHED"
      FPRINT LB4,""
      FPRINT LB4,"REM ========= BUILD LIBRARY WITH Borland C++ 5.5 Free Commandline tools"
      FPRINT LB4,":BCC55"
      FPRINT LB4,""
      FPRINT LB4,"ECHO Creating BCX Runtime Library for Borland C++ 5.5..."
      FPRINT LB4,""
      FPRINT LB4,"SET BCCFLAGS=-c -a8 -D__WIN32__ -w-8012 -w-8004 -w-8066 -w-8057 -w-8002 -w-8060"
      FPRINT LB4,""
      FPRINT LB4,"%BCX_INSTALL%\BIN\BC.EXE -lcq"
      FPRINT LB4,""
      FPRINT LB4,"COPY .\include\bcxlib.h %BC_INSTALL%\include\bcxlib.h /Y"
      FPRINT LB4,""
      FPRINT LB4,"COPY .\include\bcxrt.h %BC_INSTALL%\include\bcxrt.h /Y"
      FPRINT LB4,""
      FPRINT LB4,"IF EXIST %BC_INSTALL%\lib\bcxRT.lib ERASE %BC_INSTALL%\lib\bcxRT.lib"
      FPRINT LB4,""
      FPRINT LB4,"FOR %%I IN (.\source\*.cpp) DO %BC_INSTALL%\bin\bcc32.exe %BCCFLAGS% -o.\obj\BC\%%~nI.obj %%I"
      FPRINT LB4,""
      FPRINT LB4,"%BC_INSTALL%\bin\tlib.exe %BC_INSTALL%\lib\bcxRT.lib @bcxrt.rsp /P32"
      FPRINT LB4,""
      FPRINT LB4,"IF EXIST %BC_INSTALL%\lib\bcxRT.lib COPY %BC_INSTALL%\lib\bcxRT.lib .\lib\BC\bcxRT.lib /Y"
      FPRINT LB4,""
      FPRINT LB4,"ERASE bcxrt.rsp"
      FPRINT LB4,""
      FPRINT LB4,"IF /i ", ENC$("%1"), " == ", ENC$("A"), " GOTO GCC"
      FPRINT LB4,""
      FPRINT LB4,"GOTO FINISHED"
      FPRINT LB4,""
      FPRINT LB4,"REM ========= BUILD LIBRARY WITH MSVC++ Free Visual C++ Toolkit 2003"
      FPRINT LB4,":VCCPLUS"
      FPRINT LB4,""
      FPRINT LB4,"ECHO Creating BCX Runtime Library for Microsoft Visual C++ Toolkit 2003..,"
      FPRINT LB4,""
      FPRINT LB4,"SET MSVCPPFLAGS=/c /O1 /Gd /W1 /Ze /MT /D_WIN32_IE=0x0501 /D_WIN32_WINNT=0x0400"
      FPRINT LB4,""
      FPRINT LB4,"%BCX_INSTALL%\BIN\BC.EXE -lcq"
      FPRINT LB4,""
      FPRINT LB4,"COPY .\include\bcxlib.h %MC_INSTALL%\include\bcxlib.h /Y"
      FPRINT LB4,""
      FPRINT LB4,"COPY .\include\bcxrt.h %MC_INSTALL%\include\bcxrt.h /Y"
      FPRINT LB4,""
      FPRINT LB4,"CALL %MC_INSTALL%\VCVARS32.BAT"
      FPRINT LB4,""
      FPRINT LB4,"FOR %%I IN (.\source\*.cpp) DO %MC_INSTALL%\bin\cl.exe %MSVCPPFLAGS% /Fo.\obj\MC\%%~nI.obj %%I"
      FPRINT LB4,""
      FPRINT LB4,"%MC_INSTALL%\bin\lib.exe .\obj\MC\*.obj"
      FPRINT LB4,"REM  bcxRT.lib  \LIBPATH:%MC_INSTALL%\lib"
      FPRINT LB4,"IF EXIST .\obj\MC\*.lib     REN   .\obj\MC\*.lib bcxRT.lib"
      FPRINT LB4,"IF EXIST .\obj\MC\bcxRT.lib COPY  .\obj\MC\bcxRT.lib %MC_INSTALL%\lib\bcxRT.lib /Y"
      FPRINT LB4,"IF EXIST .\obj\MC\bcxRT.lib COPY  .\obj\MC\bcxRT.lib .\lib\MC\bcxRT.lib /Y"
      FPRINT LB4,"IF EXIST .\obj\MC\bcxRT.lib ERASE .\obj\MC\bcxRT.lib"
      FPRINT LB4,""
      FPRINT LB4,"IF /i ", ENC$("%1"), " == ", ENC$("A"), " GOTO BCC55"
      FPRINT LB4,""
      FPRINT LB4,"GOTO FINISHED"
      FPRINT LB4,""
      FPRINT LB4,"REM ========= BUILD LIBRARY WITH PELLESC"
      FPRINT LB4,""
      FPRINT LB4,":PELLESC"
      FPRINT LB4,""
      FPRINT LB4,"ECHO Creating BCX Runtime Library for PellesC..."
      FPRINT LB4,""
      FPRINT LB4,"%BCX_INSTALL%\BIN\BC.EXE -lq"
      FPRINT LB4,""
      FPRINT LB4,"COPY .\include\bcxlib.h %PC_INSTALL%\include\bcxlib.h /Y"
      FPRINT LB4,""
      FPRINT LB4,"COPY .\include\bcxrt.h %PC_INSTALL%\include\bcxrt.h /Y"
      FPRINT LB4,""
      FPRINT LB4,"call %PC_INSTALL%\bin\povars32.bat"
      FPRINT LB4,""
      FPRINT LB4,"SET PELLESFLAGS=-W0 -Ot -Gd -Go -Ze -Zx -X -Tx86-coff"
      FPRINT LB4,""
      FPRINT LB4,"FOR %%f IN (.\source\*.c) DO %PC_INSTALL%\bin\pocc.exe %PELLESFLAGS% /Fo .\obj\PC\%%~nf.obj -I%PC_INSTALL%\include -I%PC_INSTALL%\include\sys -I%PC_INSTALL%\include\win -I%PC_INSTALL%\include\win\gl %%f"
      FPRINT LB4,""
      FPRINT LB4,"%PC_INSTALL%\BIN\POLIB.EXE /OUT:%PC_INSTALL%\lib\bcxRT.lib .\obj\PC\*.obj"
      FPRINT LB4,""
      FPRINT LB4,"IF EXIST %PC_INSTALL%\lib\bcxRT.lib COPY %PC_INSTALL%\lib\bcxRT.lib .\lib\PC\bcxRT.lib /Y"
      FPRINT LB4,""
      FPRINT LB4,"IF /i ", ENC$("%1"), " == ", ENC$("A"), " GOTO VCCPLUS"
      FPRINT LB4,""
      FPRINT LB4,"GOTO FINISHED"
      FPRINT LB4,""
      FPRINT LB4,"REM ========= BUILD LIBRARY WITH LCCWIN32"
      FPRINT LB4,""
      FPRINT LB4,":LCCWIN32"
      FPRINT LB4,""
      FPRINT LB4,"ECHO Creating BCX Runtime Library for LccWin32..."
      FPRINT LB4,""
      FPRINT LB4,"%BCX_INSTALL%\BIN\BC.EXE -lq"
      FPRINT LB4,""
      FPRINT LB4,"COPY .\include\bcxlib.h %LC_INSTALL%\include\bcxlib.h /Y"
      FPRINT LB4,""
      FPRINT LB4,"COPY .\include\bcxrt.h %LC_INSTALL%\include\bcxrt.h /Y"
      FPRINT LB4,""
      FPRINT LB4,":: FOR %%f IN (.\source\*.c) do %LC_INSTALL%\bin\lcc.exe -Zp1 .\source\%%~nf.c -Fo.\obj\LC\%%~nf.obj"
      FPRINT LB4,""
      FPRINT LB4,"%BCX_INSTALL%\BIN\BUILD.EXE .\obj\LC\*.obj .\source\*.c ", ENC$("%LC_INSTALL%\bin\lcc.exe -Zp1 .\source\$dn.c -Fo.\obj\LC\$dn.obj")
      FPRINT LB4,""
      FPRINT LB4,"IF EXIST bcxrt.rsp ERASE bcxrt.rsp"
      FPRINT LB4,""
      FPRINT LB4,"FOR %%I IN (.\obj\LC\*.obj) DO ECHO %%I >> bcxrt.rsp"
      FPRINT LB4,""
      FPRINT LB4,"%LC_INSTALL%\bin\lcclib.exe bcxRT.lib @bcxrt.rsp"
      FPRINT LB4,""
      FPRINT LB4,"ERASE bcxrt.rsp"
      FPRINT LB4,""
      FPRINT LB4,"COPY bcxRT.lib %LC_INSTALL%\lib\bcxRT.lib /Y"
      FPRINT LB4,""
      FPRINT LB4,"COPY bcxRT.lib .\lib\LC\bcxRT.lib /Y"
      FPRINT LB4,""
      FPRINT LB4,"ERASE bcxRT.lib"
      FPRINT LB4,""
      FPRINT LB4,"IF /i ", ENC$("%1"), " == ", ENC$("A"), " GOTO PELLESC"
      FPRINT LB4,""
      FPRINT LB4,"GOTO FINISHED"
      FPRINT LB4,""
      FPRINT LB4,":ERROR"
      FPRINT LB4,""
      FPRINT LB4,"ECHO ERROR!"
      FPRINT LB4,""
      FPRINT LB4,"GOTO OUTOFHERE"
      FPRINT LB4,""
      FPRINT LB4,":FINISHED"
      FPRINT LB4,""
      FPRINT LB4,"ECHO Finished!"
      FPRINT LB4,""
      FPRINT LB4,":OUTOFHERE"
      $IPRINT_OFF
      CLOSE LB4
    END IF

    IF NoKill = FALSE THEN
      KILL RTFile$  ' BCXRT.C(PP) is a file automatically created by BCX for
      ' use in building the BCXRT.LIB
    END IF
    ' *******************************************************
  END IF ' Exist( "BCXRT.C" ) THEN
END SUB ' Library_Support




FUNCTION Getline$( )
  DIM RAW cArg$
  LINE INPUT LB1, cArg$
  IF INSTR( cArg$, "/*" ) THEN REPLACE "/*" WITH "// " IN cArg$
  IF INSTR( cArg$, "*/" ) THEN REPLACE "*/" WITH "" IN cArg$
  FUNCTION = cArg$
END FUNCTION ' GetLine$

' **************************************************************
' End of BCX Runtime Library Support
' **************************************************************



SUB EmitCmdLineConst()
  IF CmdLineConst$ > "" THEN
    RAW Ftmp AS FILE
    FPRINT FP7, ""
    FPRINT FP7, "// ***************************************************"
    FPRINT FP7, "// Commandline Defines"
    FPRINT FP7, "// ***************************************************"
    FPRINT FP7, ""
    ' Save FILE Ptr to SourceFile
    Ftmp = FP6
    ' Direct output to HeaderFile
    FP6 = FP7
    FOR INTEGER i = 1 TO TALLY( CmdLineConst$, CHR$(1) )
      Src$ = STRTOKEN$( CmdLineConst$, CHR$(1), i )
      IF Src$ = "" THEN EXIT
      Src$ = "CONST " + Src$ ' CmdLineConst$
      CALL Parse (Src$)
      CALL Emit
    NEXT
    CmdLineConst$ = ""
    ' Restore Ptr to SourceFile
    FP6 = Ftmp
    FPRINT FP7, ""
  END IF
END SUB 'EmitCmdLineConst



SUB EmitCompilerDefines()
  FPRINT FP7,""
  IF Use_Library THEN
    FPRINT FP7,"// BCXRTHEADER: COMPILER DEFINES"
  ELSE
    FPRINT FP7,"// ***************************************************"
    FPRINT FP7,"// Compiler Defines"
    FPRINT FP7,"// ***************************************************"
  END IF
  FPRINT FP7,""
  FPRINT FP7,"// C++"
  FPRINT FP7,"#if defined( __cplusplus )"
  FPRINT FP7,"  #define overloaded"
  FPRINT FP7,"  #define C_EXPORT EXTERN_C __declspec(dllexport)"
  FPRINT FP7,"  #define C_IMPORT EXTERN_C __declspec(dllimport)"
  FPRINT FP7,"#else"
  FPRINT FP7,"  #define C_EXPORT __declspec(dllexport)"
  FPRINT FP7,"  #define C_IMPORT __declspec(dllimport)"
  FPRINT FP7,"#endif"
  FPRINT FP7,""
  IF Use_Library THEN FPRINT FP7,"// END BCXRTHEADER\n\n"
END SUB 'EmitCompilerDefines

SUB Emit_VBSCRIPT_Support
  STATIC nTimes = 0
  IF nTimes > 0 THEN EXIT SUB
  INCR nTimes
  Use_AnsiToWide = Use_WideToAnsi = TRUE
  FPRINT FP7, ""
  IF Use_Library THEN
    FPRINT FP7, "// BCXRTHEADER: VBSCRIPT SUPPORT STRUCTURES"
  ELSE
    FPRINT FP7, "// ****************************************"
    FPRINT FP7, "// ***** " + $BCX_STR_VBS_STRUCTS + "  *****"
    FPRINT FP7, "// ****************************************"
    FPRINT FP7, ""
  END IF
  FPRINT FP7, "const GUID IID_IScriptControl ="
  FPRINT FP7, "{"
  FPRINT FP7, "   0x0e59f1d3,0x1fbe,0x11d0,"
  FPRINT FP7, "  {0x8f,0xf2,0x00,0xa0,0xd1,0x00,0x38,0xbc}"
  FPRINT FP7, "};"
  FPRINT FP7, ""
  FPRINT FP7, "enum ScriptControlStates"
  FPRINT FP7, "{"
  FPRINT FP7, "  SCRIPTSTATE_UNINITIALIZED0, SCRIPTSTATE_STARTED1, SCRIPTSTATE_CONNECTED2,"
  FPRINT FP7, "  SCRIPTSTATE_DISCONNECTED3, SCRIPTSTATE_CLOSED4, SCRIPTSTATE_INITIALIZED5"
  FPRINT FP7, "};"
  FPRINT FP7, ""
  FPRINT FP7, "const GUID IID_IScriptError ="
  FPRINT FP7, "{"
  FPRINT FP7, "   0x70841C78, 0x67D, 0x11D0,"
  FPRINT FP7, "  {0x95, 0xD8, 0x0, 0xA0, 0x24, 0x63, 0xAB, 0x28}"
  FPRINT FP7, "};"
  FPRINT FP7, ""
  FPRINT FP7, "// ------------------------------"
  FPRINT FP7, "#undef  INTERFACE"
  FPRINT FP7, "#define INTERFACE IScriptError"
  FPRINT FP7, "// ------------------------------"
  FPRINT FP7, "DECLARE_INTERFACE_(IScriptError, IDispatch) {"
  FPRINT FP7, "STDMETHOD (QueryInterface)(THIS_ REFIID riid, LPVOID FAR* ppvObj) PURE;"
  FPRINT FP7, "STDMETHOD_(ULONG, AddRef)(THIS)  PURE;"
  FPRINT FP7, "STDMETHOD_(ULONG, Release)(THIS) PURE;"
  FPRINT FP7, "STDMETHOD (GetTypeInfoCount)(THIS_ UINT FAR* pctinfo) PURE;"
  FPRINT FP7, "STDMETHOD (GetTypeInfo)(THIS_ UINT itinfo, LCID lcid,"
  FPRINT FP7, "ITypeInfo  FAR* FAR* pptinfo) PURE;"
  FPRINT FP7, "STDMETHOD (GetIDsOfNames)(THIS_ REFIID riid, OLECHAR FAR* FAR* rgszNames,"
  FPRINT FP7, "           UINT cNames, LCID lcid, DISPID FAR* rgdispid) PURE;"
  FPRINT FP7, "STDMETHOD (Invoke)(THIS_ DISPID dispidMember, REFIID riid, LCID lcid,"
  FPRINT FP7, "           WORD wFlags, DISPPARAMS FAR* pdispparams, VARIANT FAR* pvarResult,"
  FPRINT FP7, "           EXCEPINFO FAR* pexcepinfo, UINT FAR* puArgErr) PURE;"
  FPRINT FP7, "STDMETHOD (Get_Number)(THIS_  long* pNumber) PURE;"
  FPRINT FP7, "STDMETHOD (Get_Source)(THIS_ BSTR* pbstrSource) PURE;"
  FPRINT FP7, "STDMETHOD (Get_Description)(THIS_ BSTR* pbstrDescription) PURE;"
  FPRINT FP7, "STDMETHOD (Get_HelpFile)(THIS_ BSTR* pbstrHelpFile) PURE;"
  FPRINT FP7, "STDMETHOD (Get_HelpContext)(THIS_ long* pHelpContext) PURE;"
  FPRINT FP7, "STDMETHOD (Get_Text)(THIS_ BSTR* pbstrText) PURE;"
  FPRINT FP7, "STDMETHOD (Get_Line)(THIS_ long* pLine) PURE;"
  FPRINT FP7, "STDMETHOD (Get_Column)(THIS_ long* pColumn) PURE;"
  FPRINT FP7, "STDMETHOD (Clear)(THIS) PURE;};"
  FPRINT FP7, ""
  FPRINT FP7, "// ------------------------------"
  FPRINT FP7, "#undef  INTERFACE"
  FPRINT FP7, "#define INTERFACE IScriptControl"
  FPRINT FP7, "// ------------------------------"
  FPRINT FP7, "DECLARE_INTERFACE_(IScriptControl, IDispatch) {"
  FPRINT FP7, "STDMETHOD (QueryInterface)(THIS_ REFIID riid, LPVOID FAR* ppvObj) PURE;"
  FPRINT FP7, "STDMETHOD_(ULONG, AddRef)(THIS)  PURE;"
  FPRINT FP7, "STDMETHOD_(ULONG, Release)(THIS) PURE;"
  FPRINT FP7, "STDMETHOD (GetTypeInfoCount)(THIS_ UINT FAR* pctinfo) PURE;"
  FPRINT FP7, "STDMETHOD (GetTypeInfo)(THIS_ UINT itinfo, LCID lcid,"
  FPRINT FP7, "ITypeInfo  FAR* FAR* pptinfo) PURE;"
  FPRINT FP7, "STDMETHOD (GetIDsOfNames)(THIS_ REFIID riid, OLECHAR FAR* FAR* rgszNames,"
  FPRINT FP7, "           UINT cNames, LCID lcid, DISPID FAR* rgdispid) PURE;"
  FPRINT FP7, "STDMETHOD (Invoke)(THIS_ DISPID dispidMember, REFIID riid, LCID lcid,"
  FPRINT FP7, "           WORD wFlags, DISPPARAMS FAR* pdispparams, VARIANT FAR* pvarResult,"
  FPRINT FP7, "           EXCEPINFO FAR* pexcepinfo, UINT FAR* puArgErr) PURE;"
  FPRINT FP7, "STDMETHOD (get_Language)(THIS_ BSTR* pbstrLanguage) PURE;"
  FPRINT FP7, "STDMETHOD (put_Language)(THIS_ BSTR pbstrLanguage) PURE;"
  FPRINT FP7, "STDMETHOD (get_State)(THIS_ enum ScriptControlStates* pssState) PURE;"
  FPRINT FP7, "STDMETHOD (put_State)(THIS_ enum ScriptControlStates pssState ) PURE;"
  FPRINT FP7, "STDMETHOD (put_SitehWnd)(THIS_ long phwnd) PURE;"
  FPRINT FP7, "STDMETHOD (get_SitehWnd)(THIS_ long* phwnd) PURE;"
  FPRINT FP7, "STDMETHOD (get_Timeout)(THIS_ long* plMilliseconds) PURE;"
  FPRINT FP7, "STDMETHOD (put_Timeout)(THIS_ long plMilliseconds) PURE;"
  FPRINT FP7, "STDMETHOD (get_AllowUI)(THIS_ VARIANT_BOOL* pfAllowUI) PURE;"
  FPRINT FP7, "STDMETHOD (put_AllowUI)(THIS_ VARIANT_BOOL pfAllowUI) PURE;"
  FPRINT FP7, "STDMETHOD (get_UseSafeSubset)(THIS_ VARIANT_BOOL* pfUseSafeSubset) PURE;"
  FPRINT FP7, "STDMETHOD (put_UseSafeSubset)(THIS_ VARIANT_BOOL pfUseSafeSubset) PURE;"
  FPRINT FP7, "STDMETHOD (get_Modules)(THIS_ interface"
  FPRINT FP7, "           IScriptModuleCollection** ppmods) PURE;"
  FPRINT FP7, "STDMETHOD (get_Error)(THIS_ interface IScriptError** ppse) PURE;"
  FPRINT FP7, "STDMETHOD (get_CodeObject)(THIS_ IDispatch** ppdispObject) PURE;"
  FPRINT FP7, "STDMETHOD (get_Procedures)(THIS_ interface"
  FPRINT FP7, "           IScriptProcedureCollection** ppdispProcedures) PURE;"
  FPRINT FP7, "STDMETHOD (_AboutBox)(THIS) PURE;"
  FPRINT FP7, "STDMETHOD (AddObject)(THIS_ BSTR Name, IDispatch* Object,"
  FPRINT FP7, "           VARIANT_BOOL AddMembers) PURE;"
  FPRINT FP7, "STDMETHOD (Reset)(THIS) PURE;"
  FPRINT FP7, "STDMETHOD (AddCode)(THIS_ BSTR Code) PURE;"
  FPRINT FP7, "STDMETHOD (Eval)(THIS_ BSTR Expression, VARIANT* pvarResult) PURE;"
  FPRINT FP7, "STDMETHOD (ExecuteStatement)(THIS_ BSTR Statement) PURE;"
  FPRINT FP7, "STDMETHOD (Run)(THIS_ BSTR ProcedureName, SAFEARRAY** Parameters,"
  FPRINT FP7, "           VARIANT* pvarResult) PURE;};"
  FPRINT FP7, ""
  IF Use_Project OR Use_Library THEN
    FPRINT FP7, "BOOL OLE_ERROR_S;"
    FPRINT FP7, "IScriptControl *pSC;"
  ELSE
    FPRINT FP7, "static BOOL OLE_ERROR_S;"
    FPRINT FP7, "static IScriptControl *pSC;"
  END IF

  AddLibrary("ole32.lib")
  AddLibrary("oleaut32.lib")
  IF Use_Library THEN FPRINT FP7, "// END BCXRTHEADER\n\n"
END SUB 'Emit_VBSCRIPT_Support



SUB MakeFreeGlobals
  Src$ = "SUB FreeGlobals"
  PassOne = 1
  CALL Parse(Src$)
  CALL Emit
  WHILE GlobalDynaCnt
    FPRINT Outfile,"  ", GlobalDynaStr$[GlobalDynaCnt]
    GlobalDynaCnt--
  WEND
  Src$ = "END SUB"
  PassOne = 1
  CALL Parse(Src$)
  CALL Emit
END SUB ' MakeFreeGlobals



SUB ProcessMsgHandlerEnd
  'END HANDLER
  Src$ = "FUNCTION = LReturn"
  CALL Parse(Src$)
  CALL Emit
  Src$ = "END FUNCTION"
  CALL Parse(Src$)
  CALL Emit
  Src$ = ""
END SUB



SUB ProcessMsgCracker
  'handle_msg( WM_SIZE, form1_onSize)
  ' HANDLE_MSG WM_SIZE INLINE SendMessage(hWnd, WM_XXXX, 0, 0 ) : EXIT FUNCTION
  DIM RAW bInline AS BOOLEAN
  DIM RAW msg_$
  DIM RAW proc_$
  DIM RAW ret_$
  DIM RAW tmp_$[16]
  DIM RAW tmpNdx
  DIM RAW i
  tmpNdx = 0
  bInline = FALSE
  FastLexer(Src$, " ", "")
  IF LCASE$(Stk$[3]) = "inline" THEN bInline = TRUE
  IF bInline = TRUE THEN
    msg_$  = Stk$[2]
    tmp_$[++tmpNdx] = "IF Msg = " + msg_$ + " THEN "
    Src$ = MID$( Stk$[4], 2, LEN(Stk$[4]) - 2 )
    FastLexer(Src$, ":","")
    FOR i = 1 TO Ndx
      tmp_$[++tmpNdx] = Stk$[i]
    NEXT
    tmp_$[++tmpNdx] = "END IF"
    FOR i = 1 TO tmpNdx
      CALL Parse(tmp_$[i])
      CALL Emit
    NEXT
  ELSE
    FastLexer(Src$, " ,()","")
    msg_$  = Stk$[2]
    proc_$ = Stk$[3]
    ret_$  = Stk$[4]
    IF ret_$ <> "" THEN ret_$ = ","+ret_$
    Src$ = "IF Msg = " + msg_$ + " THEN" : CALL Parse(Src$) : CALL Emit
    IF LEN(TRIM$(ret_$)) THEN
      Src$ = "  FUNCTION=" + proc_$ + "(hWnd,wParam,lParam" + ret_$ + ")" : CALL Parse(Src$) : CALL Emit
    ELSE
      Src$ = "  " + proc_$ + "(hWnd,wParam,lParam" + ret_$ + ")" : CALL Parse(Src$) : CALL Emit
    END IF
    Src$ = "END IF" : CALL Parse(Src$) : CALL Emit
  END IF
  Src$ = ""
END SUB



SUB ProcessCmdHandler
  ' handle_cmd( IDM_NEW, procedure, retval )
  ' handle_cmd IDM_NEW INLINE SendMessage(hWnd, WM_XXXX, 0, 0) : EXIT FUNCTION:
  DIM RAW bInline AS BOOLEAN
  DIM RAW id_$
  DIM RAW proc_$
  DIM RAW ret_$
  DIM RAW tmp_$[16]
  DIM RAW tmpNdx
  DIM RAW i
  tmpNdx = 0
  bInline = FALSE
  FastLexer(Src$, " ", "")
  IF LCASE$(Stk$[3]) = "inline" THEN bInline = TRUE
  IF bInline = TRUE THEN
    id_$  = Stk$[2]
    tmp_$[++tmpNdx] = "IF Msg = WM_COMMAND AND CBCTL = " + id_$ + " THEN "
    Src$ = MID$( Stk$[4], 2, LEN(Stk$[4]) - 2 )
    FastLexer(Src$, ":","")
    FOR i = 1 TO Ndx
      tmp_$[++tmpNdx] = Stk$[i]
    NEXT
    tmp_$[++tmpNdx] = "END IF"
    FOR i = 1 TO tmpNdx
      CALL Parse(tmp_$[i])
      CALL Emit
    NEXT
  ELSE
    FastLexer(Src$, " ,()","")
    id_$ = Stk$[2]
    proc_$ = Stk$[3]
    ret_$ = Stk$[4]
    IF ret_$ <> "" THEN ret_$ = ","+ret_$
    Src$ = "IF Msg = WM_COMMAND AND CBCTL = " + id_$ + " THEN" : CALL Parse(Src$) : CALL Emit
    IF LEN(TRIM$(ret_$)) THEN
      Src$ = "  FUNCTION=" + proc_$ + "(hWnd,wParam,lParam" + ret_$ + ")" : CALL Parse(Src$) : CALL Emit
    ELSE
      Src$ = "  " + proc_$ + "(hWnd,wParam,lParam" + ret_$ + ") " : CALL Parse(Src$) : CALL Emit
    END IF
    Src$ = "END IF" : CALL Parse(Src$) : CALL Emit
  END IF
  Src$ = ""
END SUB




SUB ProcessSetCommand(GS)
  DIM RAW i, ii, j, SetString=0
  DIM RAW CVar$
  DIM RAW vt

  LOCAL SaveFP AS FILE
  SaveFP = Outfile
  IF NOT InFunc THEN Outfile = FP9     ' Global context

  IF INCHR(Src$,"$") AND TALLY(Src$,"[") >1 THEN
    Src$ = STRIM$(Src$)
    IREMOVE "as string" FROM Src$
    IREMOVE "as char"   FROM Src$
    CONCAT(Src$," AS char")
  END IF

  CONCAT(Src$,"=")
  PassOne = 1
  CALL Parse(Src$)
  Tipe$ = ""

  FOR i = 1 TO Ndx
    IF iMatchWrd(Stk$[i],"as") THEN
      Tipe$ = Stk$[i+1]
      Stk$[i]   = ""
      Stk$[i+1] = ""
      EXIT FOR
    END IF
  NEXT

  IF Tipe$ = "" THEN
    szTmp$ = Stk$[2]
    SetString = DataType(Stk$[2])
    j = SetString
    VarCode.Method% = mt_ProcessSetCommand
    VarCode.Token$ = szTmp$
    VarCode.VarNo% = j
    CALL GetVarCode(&VarCode)
    IF GS THEN
      FPRINT Outfile,Scoot$,REMOVE$(VarCode.StaticOut$,"static ");
    ELSE
      FPRINT Outfile,Scoot$,VarCode.StaticOut$;
    END IF

    DIM RAW lszTmp$
    lszTmp$ = ""
    CVar$ = Clean$(Stk$[2])
    CALL ValidVar(CVar$)
    vt = DataType(Stk$[2])
    FOR i = 3 TO Ndx
      CONCAT (lszTmp$, Stk$[i])
    NEXT
    IF vt = vt_STRVAR AND lszTmp$ <> "" THEN
      CONCAT (lszTmp$, "[2048]")
    END IF
    IF NOT InFunc THEN
      CALL AddGlobal(CVar$, vt, 0,lszTmp$,0,0,0,1)
    ELSE
      CALL AddLocal(CVar$, vt, 0,lszTmp$,0,0,1)
    END IF
  ELSE
    CVar$ = Clean$(Stk$[2])

    IF GS THEN
      FPRINT Outfile,Scoot$ ; Tipe$;" ";CVar$;
    ELSE
      FPRINT Outfile,Scoot$ ; "static ";Tipe$;" ";CVar$;
    END IF

    DIM RAW DimType$
    DIM RAW IsPointer
    DIM RAW id

    DimType$ = REMOVE$(Tipe$,"*") ' *mh - 3/9/09
    GetTypeInfo(Tipe$, &IsPointer, &id, &vt)

    IF vt = vt_STRVAR THEN
      CONCAT(DimType$, "[2048]")
    END IF

    IF NOT InFunc THEN
      CALL AddGlobal(CVar$, vt, id, DimType$,IsPointer,0,0,1)
    ELSE
      CALL AddLocal(CVar$, vt, id, DimType$,IsPointer,0,1)
    END IF
  END IF

  i = 2
  j = 0
  DO
    i++
    IF Stk$[i]= "=" THEN j = 1
    IF SetString = vt_STRVAR AND j = 1 THEN
      FPRINT Outfile,"[2048]=";
    ELSE
      FPRINT Outfile,Stk$[i];
    END IF
    IF Stk$[i]= "=" THEN EXIT LOOP
    IF i = Ndx THEN EXIT LOOP
  LOOP

  FPRINT Outfile,""
  FPRINT Outfile,"{"

  WHILE NOT EOF(SourceFile)
    LINE INPUT SourceFile,Src$
    ModuleLineNos[ModuleNdx]++
    CALL StripCode(Src$)
    IF JoinLines(Src$) = 1 THEN ITERATE
    PassOne = TRUE
    CALL XParse(Src$)
    PassOne = FALSE
    CALL TokenSubstitutions
    IF iMatchLft(Src$,"end ") THEN EXIT LOOP
    IF LEN (Src$) THEN
      FPRINT Outfile,"  ";
      FOR ii = 1 TO Ndx
        FPRINT Outfile, Clean$(Stk$[ii]);
      NEXT ii
      FPRINT Outfile,""
    END IF
  WEND
  FPRINT Outfile,"};\n"
  Src$ = ""
  Outfile = SaveFP
END SUB 'ProcessSetCommand







FUNCTION Directives
  DIM RAW lszTmp$, i
  '       = #          = $
  IF *Src = 35 OR *Src = 36 THEN
    Z$ = RTRIM$(LCASE$(LEFT$(Src$,6)))
    '******************************
    SELECT CASE Z$
      '****************************
      CASE "$accel"
      '****************************
      CALL XParse(Src$)
      Accelerator$ = REMOVE$(Stk$[2],DQ$)
      Src$ = ""
      EXIT FUNCTION
      '****************************
      CASE "$bcx_r"
      '****************************
      Src$ = ""
      Use_GenResFile = TRUE
      DO
        IF EOF(SourceFile) THEN Abort ("Unbalanced $BCX_RESOURCE")
        LINE INPUT SourceFile,Src$
        ModuleLineNos[ModuleNdx]++
        CALL StripCode(Src$)
        IF iMatchLft(Src$,"$bcx_r") THEN EXIT LOOP
        FPRINT FP10,Src$
      LOOP
      Src$ = ""
      EXIT FUNCTION
      '****************************
      CASE "$bcxve"
      '****************************
      Src$ = TRIM$(MID$(Src$,12))
      REMOVE DQ$ FROM Src$
      IF LCASE$(Version$) < LCASE$(Src$) THEN
        Abort (CRLF$ + "Your Translator needs updating." + CRLF$ + _
        "This program " + ENC$(Modules$[ModuleNdx]) + " requires BCX Version: " + Src$ + " or later." + CRLF$ + CRLF$)
      ELSE
        PRINT ""
        PRINT "Program written for BCX Version ", Src$
        PRINT ""
      END IF
      EXIT FUNCTION
      '****************************
      CASE "$compi"
      '****************************
      PassOne = 1
      CALL XParse(Src$)
      PassOne = 0
      Compiler$ = Stk$[2]
      Src$ = ""
      EXIT FUNCTION
      '****************************
      CASE "$genfr"
      '****************************
      Use_GenFree = TRUE
      Src$ = ""
      EXIT FUNCTION
      '****************************
      CASE "$filet"
      '****************************
      FastLexer(Src$,SPC$,"")
      IF iMatchWrd(Stk$[2],"ON") THEN
        UseFileTest = TRUE
      ELSEIF iMatchWrd(Stk$[2],"OFF") THEN
        UseFileTest = FALSE
      ELSE
        Abort("Unrecognized argument to $FILETEST")
      END IF
      Src$ = ""
      EXIT FUNCTION
      '****************************
      CASE "$noini"
      '****************************
      Src$ = ""
      TestForBcxIni = TRUE
      EXIT FUNCTION
      '****************************
      CASE "$linke"
      '****************************
      PassOne = 1
      CALL XParse(Src$)
      PassOne = 0
      Linker$ = Stk$[2]
      Src$ = ""
      EXIT FUNCTION
      '****************************
      CASE "$onexi"
      '****************************
      PassOne = 1
      CALL XParse(Src$)
      PassOne = 0
      XitCount++
      Xit$[XitCount]= Stk$[2]
      Src$ = ""
      EXIT FUNCTION
      '****************************
      CASE "$onent"
      '****************************
      PassOne = 1
      CALL XParse(Src$)
      PassOne = 0
      EntryCnt++
      Entry$[EntryCnt]= Stk$[2]
      Src$ = ""
      EXIT FUNCTION
      '****************************
      CASE "$pack","$pack("
      '****************************
      'Src$ = EXTRACT$(Src$,"'") ' allow Basic comments
      Src$ = MID$(Src$,6)
      FPRINT FP4,"#pragma pack ",LTRIM$(Src$)
      Src$ = ""
      EXIT FUNCTION
      '****************************
      CASE "$nodll"
      '****************************
      NoDllMain = TRUE
      Src$ = ""
      EXIT FUNCTION
      '****************************
      CASE "$pelle"
      '****************************
      Src$ = ""
      EXIT FUNCTION
      '****************************
      CASE "$stdca"
      '****************************
      UseStdCall = TRUE
      Src$ = ""
      EXIT FUNCTION
      '****************************
      CASE "$iprin"
      '****************************
      IF INSTR(LCASE$(Src$),"_on") THEN
        TranslateSlash = TRUE
      ELSE
        TranslateSlash = FALSE
      END IF
      Src$ = ""
      EXIT FUNCTION
      '****************************
      CASE "$nowin"
      '****************************
      WinHeaders = FALSE
      Src$ = ""
      EXIT FUNCTION
      '****************************
      CASE "$nomai"
      '****************************
      NoMain = TRUE
      Src$ = ""
      EXIT FUNCTION
      '****************************
      CASE "$test"
      '****************************
      TestState = NOT TestState
      Src$ = ""
      EXIT FUNCTION
      '****************************
      CASE "$typed"
      '****************************
      FPRINT FP7,"typedef " + REMAIN$(Src$," "),";"
      Src$ = ""
      EXIT FUNCTION
      '****************************
      ' must be after CASE "$pelle"
      CASE "$proje" ' $PROJECT 6/13/2004 7:41AM Vic McClung
      CALL EnableProject
      Src$ = ""
      EXIT FUNCTION
      '****************************
      CASE "$prj"
      '****************************
      Project$ = UCASE$(EXTRACT$(COMMAND$(1),".")) + ".USE"
      HFile$   = UCASE$(EXTRACT$(COMMAND$(1),".")) + ".H"
      Use_SingleFile = FALSE
      Src$ = ""
      EXIT FUNCTION
      '****************************
      CASE "$prjus"
      '****************************
      PreParse(Src$)
      CALL SetUsed
      Src$ = ""
      EXIT FUNCTION
      '****************************
      CASE "$resou"
      '****************************
      Use_Resource = TRUE
      CALL XParse(Src$)
      ResCompiler$ = Stk$[2]
      UserResFile$ = REMOVE$(Stk$[3], DQ$)
      Src$ = ""
      EXIT FUNCTION
      '****************************
      CASE "$leana" ' LeanAndMean
      Use_LeanAndMean = TRUE
      Src$ = ""
      EXIT FUNCTION
      '****************************
      CASE "$turbo"
      Src$ = LTRIM$(MID$(Src$,7))
      IF *Src$ <> 0 THEN
        TurboSize = VAL(Src$)
        IF (TurboSize & (TurboSize-1)) <> 0 THEN
          TurboSize = 512
          Warning("Invalid $Turbo size - defaulting to 512")
        END IF
      ELSE
        TurboSize = 512
      END IF

      Use_Turbo = TRUE
      Src$ = ""
      EXIT FUNCTION
      '****************************
      CASE "$sourc"
      '****************************
      SrcFlag = NOT SrcFlag
      Src$ = ""
      EXIT FUNCTION
      '****************************
      CASE "$fssta"
      '****************************
      Use_Static = NOT Use_Static
      Src$ = ""
      EXIT FUNCTION
      '****************************
      CASE "$trace"
      '****************************
      TrcFlag = NOT TrcFlag
      Src$ = ""
      EXIT FUNCTION
      '****************************
      CASE "$pp"
      '****************************
      PPFlag = NOT PPFlag
      IF PPFlag THEN
        IF PPDLL_HANDLE = NULL THEN
          PPDLL_HANDLE = LOADLIBRARY( "BCXPP.DLL")
          IF NOT PPDLL_HANDLE THEN ' failed to load preprocessor dll
            Abort ("Failed to Open BCX Preprocessor DLL!")
          ELSE
            PRINT "BCXPP.DLL Successfully Loaded"
          END IF
          PPProc = (CPP_FARPROC) GetProcAddress (PPDLL_HANDLE,"_ProcessLine");
          IF NOT PPProc THEN
            Abort ("Couldn't Find 'ProcessLine' Procedure in BCX Preprocessor DLL!")
          END IF
        END IF
      END IF
      Src$ = ""
      EXIT FUNCTION
      '****************************
      CASE "$inclu"
      '****************************
      DIM RAW orgfileName$
      IREPLACE "$BCX$" WITH BCXPATH$ IN Src$
      szFile$ = TRIM$(REMOVE$(MID$(Src$,9),DQ$))
      IF LEFT$(szFile$,1) = "<" THEN
        szFile$ = MID$(szFile$, 2, LEN(szFile$)-2)
        szFile$ = ENVIRON$("BCXLIB") + szFile$
      END IF
      orgfileName$ = szFile$
      IF NOT EXIST(szFile$) THEN
        szFile$ = BcxSplitPath$(szFile$, FNAME|FEXT)
        szFile$ = BcxSplitPath$(FileIn$, FDRV|FPATH) + szFile$
      END IF
      IF NOT EXIST(szFile$) THEN Abort("Unable to locate " + orgfileName$)
      CALL PushFileIO
      OPEN szFile$ FOR INPUT AS SourceFile
      Modules$[++ModuleNdx] = szFile$
      ModuleLineNos[ModuleNdx] = 0
      FUNCTION = 1
      '****************************
      ' Beginning of Temporary Directives
      ' in support of C++ Classes
      '****************************
      CASE "$try"
      '****************************
      FPRINT Outfile,"try {"
      Src$ = ""
      EXIT FUNCTION
      '****************************
      CASE "$throw" ' $throw "An Exception has Occured!"
      szTmp$ = MID$(Src$,8)
      IF szTmp$ = "" THEN szTmp$ = ENC$("An Exception has occured!")
      FPRINT Outfile,Scoot$,"throw " + szTmp$ + ";"
      Src$ = ""
      EXIT FUNCTION
      '****************************
      CASE "$catch"
      '****************************
      szTmp$ = MID$(Src$,8)
      IF szTmp$ = "" THEN szTmp$ = "char *str"
      FPRINT Outfile,"}"
      FPRINT Outfile,"catch (" + szTmp$ + ")" ' catch (char *str)
      FPRINT Outfile,"{"
      Src$ = ""
      EXIT FUNCTION
      '****************************
      CASE "$endtr","$endna"
      '****************************
      FPRINT Outfile,"}"
      Src$ = ""
      EXIT FUNCTION
      '****************************
      CASE "$names" ' $namespace/$endnamespace
      '****************************
      UseCpp = TRUE
      szTmp$ = MID$(Src$,INCHR(Src$," ")+1)
      FPRINT Outfile,"namespace " + LTRIM$(szTmp$)
      FPRINT Outfile,"{"
      Src$ = ""
      EXIT FUNCTION
      '****************************
      CASE "$usena" ' $usenamespace = using namespace std; etc.
      '****************************
      UseCpp = TRUE
      szTmp$ = MID$(Src$, INCHR(Src$, " ") + 1)
      IF RIGHT$(TRIM$(szTmp$),1) <> ";" THEN
        FPRINT Outfile,"using namespace ", szTmp$, ";"
      ELSE
        FPRINT Outfile,"using namespace ", szTmp$
      END IF
      Src$ = ""
      EXIT FUNCTION
      '****************************
      CASE "$class" ' $class/$endclass
      '****************************
      STATIC BeenHere
      UseCpp = TRUE
      szTmp$ = MID$(Src$, INCHR(Src$, " ") + 1)
      IF NOT BeenHere THEN
        BeenHere++
        FPRINT FP4,"#ifndef __cplusplus"
        FPRINT FP4,"  #error A C++ compiler is required"
        FPRINT FP4,"#endif"
      END IF
      WHILE NOT iMatchLft(Src$,"$endclass")
        IF EOF(SourceFile) THEN Abort ("$Class Without $EndClass")
        LINE INPUT SourceFile,Src$
        ModuleLineNos[ModuleNdx]++
        'StripCode(Src$)
        IF iMatchLft(Src$,"$endclass") THEN
          EXIT LOOP
        END IF
        FPRINT FP4,Src$
      WEND
      Src$ = ""
      EXIT FUNCTION
      '****************************
      ' END of Temporary Directives
      ' in support of C++ Classes
      '****************************
      CASE "$comme"
      '****************************
      Src$ = ""
      DO
        IF EOF(SourceFile) THEN Abort ("Unbalanced $Comment")
        LINE INPUT SourceFile,Src$
        ModuleLineNos[ModuleNdx]++
        CALL StripTabs
        IF iMatchLft(LTRIM$(Src$),"$comment") THEN EXIT LOOP
        FPRINT Outfile,"// ",Src$
      LOOP
      Src$ = ""
      EXIT FUNCTION
      '****************************
      CASE "$ccode"
      '****************************
      Src$ = ""
      DO
        IF EOF(SourceFile) THEN Abort ("Unbalanced $Ccode")
        LINE INPUT SourceFile,Src$
        ModuleLineNos[ModuleNdx]++
        CALL StripTabs
        IF iMatchLft(LTRIM$(Src$) ,"$ccode") THEN
          IF SrcFlag THEN 'comments seem to interfere with C line continuations '\'
            FPRINT Outfile,"// [", TRIM$(Modules$[ModuleNdx]), " - ", _
            TRIM$(STR$(ModuleLineNos[ModuleNdx])), "] End of $CCODE Block"
          END IF
          EXIT LOOP
        END IF
        FPRINT Outfile,RTRIM$(Src$)
      LOOP
      Src$ = ""
      EXIT FUNCTION
      '****************************
      CASE "$cprot"
      '****************************
      FastLexer(Src$, SPC$, "!")

      IF iMatchWrd(Stk$[2], "!") THEN
        ProtoCnt++
        ProtoType[ProtoCnt].Prototype$ = REMAIN$(Src$, "!")
        ProtoType[ProtoCnt].Condition$ = ""
        ProtoType[ProtoCnt].CondLevel  = 0
      ELSE
        i = iMatchNQ(Src$, "function")
        IF i = 0 THEN
          i = iMatchNQ(Src$, "sub")
        END IF
        IF i THEN
          Src$ = "c_declare " + MID$(Src$, i)
        ELSE
          i = iMatchNQ(Src$, "$cproto")
          Src$ = "c_declare function " + MID$(Src$, i+7)
        END IF
        UseCProto = TRUE
        FUNCTION = 2
      END IF
      Src$ = ""
      EXIT FUNCTION
      '****************************
      CASE "$heade"
      '****************************
      Src$ = ""
      FPRINT FP7, "// ***************************************************"
      FPRINT FP7, ""
      DO
        IF EOF(SourceFile) THEN Abort ("Unbalanced $Header")
        LINE INPUT SourceFile,Src$
        ModuleLineNos[ModuleNdx]++
        CALL StripTabs
        Src$ = TRIM$(Src$)
        IF iMatchLft(Src$,"$heade") THEN EXIT LOOP
        FPRINT FP7,Src$
      LOOP
      Src$ = ""
      FPRINT FP7, ""
      EXIT FUNCTION
      '****************************
      CASE "$asm"
      '****************************
      IF NOT iMatchLft(Src$,"$asm") THEN
        Abort ("Unknown metastatement: " + Src$)
      END IF
      Src$ = ""
      IF OptimizerEnabled = TRUE THEN
        FPRINT Outfile,"#if defined ( __POCC__ ) && !defined( __cplusplus )"
        FPRINT Outfile,"#pragma optimize(none) // No Optimizations in ASM block"
        FPRINT Outfile,"#elif !defined ( __cplusplus )"
        FPRINT Outfile,"#pragma optimize(0) // No Optimizations in ASM block"
        FPRINT Outfile,"#endif"
      END IF
      DO
        IF EOF(SourceFile) THEN Abort ("Unbalanced $Asm")
        LINE INPUT SourceFile,Src$
        ModuleLineNos[ModuleNdx]++
        IF SrcFlag THEN
          FPRINT Outfile,"// ",Src$
        END IF
        CALL StripTabs
        Src$ = TRIM$(Src$)

        DIM meta_asm_loop
        DIM meta_asm_comment_present AS BOOL
        DIM Src_Len
        Src_Len = LEN(Src$)
        meta_asm_comment_present = FALSE
        FOR meta_asm_loop = 0 TO Src_Len
          '******************************************
          '   Extracts both the Basic Single Quote
          '   and the Assembly Semicolon
          '******************************************
          IF Src[meta_asm_loop] = 39 OR Src[meta_asm_loop] = 59 THEN
            lszTmp$ = RIGHT$(Src$,Src_Len - meta_asm_loop - 1)
            Src[meta_asm_loop] = 0
            meta_asm_comment_present = TRUE
            EXIT LOOP
          END IF
        NEXT
        Src$ = TRIM$(Src$)
        IF iMatchLft(Src$,"$asm") THEN EXIT LOOP
        REPLACE "$" WITH "0x" IN Src$
        IREPLACE "&h" WITH "0x" IN Src$
        IF Src$ <> "" THEN
          Src$ = "_asm(" + ENC$(Src$) + CHR$(1)
          IF meta_asm_comment_present THEN
            Src$ = Src$ + TAB$ + "//" + lszTmp$
          END IF
          SrcTmp$ = Src$
          FPRINT Outfile,"#if !defined( __POCC__ ) && !defined (__cplusplus )"
          REPLACE CHR$(1) WITH ")" IN Src$
          FPRINT Outfile,Src$
          FPRINT Outfile,"#else"
          REPLACE "_asm(" WITH "__asm{" IN SrcTmp$
          REPLACE CHR$(1) WITH "}" IN SrcTmp$
          FPRINT Outfile,REMOVE$(SrcTmp$,DQ$)
          FPRINT Outfile,"#endif"
        END IF
      LOOP
      IF OptimizerEnabled = TRUE THEN
        FPRINT Outfile,"#if defined ( __POCC__ ) && !defined ( __cplusplus )"
        FPRINT Outfile,"#pragma optimize()     // Restoring Optimizer state"
        FPRINT Outfile,"#elif !defined ( __cplusplus )"
        FPRINT Outfile,"#pragma optimize(1)    // Restoring Optimizer state"
        FPRINT Outfile,"#endif"
      END IF
      Src$ = ""
      EXIT FUNCTION
      '****************************
      CASE "$optim"
      '****************************
      Src$ = LCASE$(Src$)

      IF NOT iMatchLft(Src$,"$optimizer") THEN
        Abort("Unknown metastatement: " + Src$)
      END IF

      lszTmp$ = LCASE$(LTRIM$(RIGHT$(Src$,LEN(Src$)-10)))

      IF INSTR(lszTmp$,"on") = 1 THEN
        IF OptimizerFirstSetting = TRUE THEN
          OptimizerFirstSetting = FALSE
          Src$ = "~pragmaoptimizeon"
          OptimizerEnabled = TRUE
        ELSE
          IF OptimizerEnabled = FALSE THEN
            OptimizerEnabled = TRUE
            Src$ = "~pragmaoptimizeon"
          END IF
        END IF

      ELSEIF INSTR(lszTmp$,"off") = 1 THEN
        IF OptimizerFirstSetting = TRUE THEN
          OptimizerFirstSetting = FALSE
          Src$ = "~pragmaoptimizeoff"
          OptimizerEnabled = FALSE
        ELSE
          IF OptimizerEnabled = TRUE THEN
            OptimizerEnabled = FALSE
            Src$ = "~pragmaoptimizeoff"
          END IF
        END IF
      ELSE
        Abort("Error in $OPTIMIZER MetaStatement: " + Src$ )
      END IF
      FUNCTION = 2
      '****************************
      CASE "#inclu"
      '****************************
      FPRINT FP7, LCASE$(Src$)
      Src$ = ""
      EXIT FUNCTION
      '****************************
      CASE "$libra"
      '****************************
      'Src$ = EXTRACT$(Src$,"'")   ' allow comments
      REPLACE "\\" WITH "\\\\" IN Src$
      Src$ = REMOVE$(LCASE$(Src$),"$library")
      Src$ = TRIM$(Src$)
      AddLibrary(Src$)
      Src$ = ""
      EXIT FUNCTION
      '****************************
      CASE "$nolib"
      '****************************
      'Src$ = EXTRACT$(Src$,"'")   ' allow comments
      REPLACE "\\" WITH "\\\\" IN Src$
      Src$ = REMOVE$(LCASE$(Src$),"$nolibrary")
      RemoveLibrary(Src$)
      Src$ = ""
      EXIT FUNCTION
    END SELECT
  END IF
  FUNCTION = 2
END FUNCTION ' Directives




SUB EnableProject
  LOCAL cHFn$
  STATIC cnt = 0
  IF cnt > 0 THEN EXIT SUB
  cnt++
  Project_Main$ = TRIM$(REMOVE$(MID$(Src$,9),DQ$))
  Project_Main$ = EXTRACT$(Project_Main$,"'")                  ' allow comments
  Project_Main$ = EXTRACT$(Project_Main$, ".")
  Use_Project   = TRUE
  FPRINT FP7,""
  FPRINT FP7,"// include BCX Runtime header file"
  FPRINT FP7,"#include <bcxRT.h>"
  FPRINT FP7,""
  IF INCHR( COMMAND$(1), "\") THEN ' has a path
    cHFn$ = MID$( COMMAND$(1), INSTRREV( COMMAND$(1), "\", 0 ) + 1 )
  ELSE
    cHFn$ = COMMAND$(1)
  END IF
  IF INCHR( cHFn$, "." ) THEN ' has an extension
    cHFn$ = MID$( cHFn$, 1, INSTRREV( cHFn$, ".", 0 ) -1 )
  END IF
  FPRINT FP7, "#define __BCX_HEADER_" + UCASE$(cHFn$) + "__"
END SUB ' EnableProject





FUNCTION SubVarType(TokenNum)
  DIM RAW k, j = 0

  k = CheckLocal(Stk$[TokenNum], &j)
  IF k = vt_CHAR THEN
    IF *LocalVars[j].VarDim$ <> ASC("[") AND LocalVars[j].VarPntr = 0 THEN
      k = vt_INTEGER
    END IF

  ELSEIF k = vt_UNKNOWN THEN
    k = CheckGlobal(Stk$[TokenNum], &j)
    IF k = vt_CHAR THEN
      IF *GlobalVars[j].VarDim$ <> ASC("[") AND GlobalVars[j].VarPntr = 0 THEN
        k = vt_INTEGER
      END IF
    END IF
  END IF

  j = ASC(RIGHT$(Stk$[TokenNum],1))

  SELECT CASE k

    CASE vt_STRVAR, vt_CHAR
    IF j <> 36 THEN
      CONCAT (Stk$[TokenNum], "$")
    END IF

    CASE vt_INTEGER
    IF j <> 37 THEN
      CONCAT (Stk$[TokenNum], "%")
    END IF

    CASE vt_SINGLE
    IF j <> 33 THEN
      CONCAT (Stk$[TokenNum], "!")
    END IF

    CASE vt_DOUBLE
    IF j <> 35 THEN
      CONCAT (Stk$[TokenNum], "#")
    END IF

    CASE vt_LDOUBLE
    IF j <> 166 THEN
      CONCAT (Stk$[TokenNum], "¦")
    END IF

  END SELECT
  FUNCTION = k
END FUNCTION ' SubVarType






FUNCTION PrintWriteFormat$(DoWrite)
  DIM RAW Stak[128] AS ARGTYPE
  DIM RAW Frmat$
  DIM RAW Arg$
  DIM RAW ZZ$
  DIM RAW Cast$
  DIM RAW TmpClean$
  DIM RAW NewLineFlag = 0
  DIM RAW Argcount = 0
  DIM RAW i = 0
  DIM RAW j = 0
  DIM RAW k = 0

  Frmat$ = ""
  Arg$   = ""
  ZZ$    = ""

  IF Stk$[Ndx]= ";" THEN
    NewLineFlag = TRUE
    Ndx--
  END IF

  IF Ndx = 1 THEN GOTO PrintWriteLabel

  Stak[1].ArgType = -1
  j = 2

  WHILE j <= Ndx
    TmpClean$ = Clean$(Stk$[j])
    IF TmpClean$ <> "BCX_DynaCallA" AND TmpClean$ <> "BCX_DynaCallB" THEN
      i = SubVarType(j)
      IF Stak[Argcount+1].ArgType = -1 THEN
        IF i = vt_CHAR OR i = vt_STRVAR OR i = vt_INTEGER OR i = vt_SINGLE OR i = vt_DOUBLE OR i = vt_LDOUBLE THEN
          Stak[Argcount+1].ArgType = i
        END IF
      END IF

      IF Stk$[j] = "(" THEN
        i = 0
        DO
          IF Stk$[j] = "(" THEN i++
          IF Stk$[j] = ")" THEN i--
          CONCAT (Arg$,Stk$[j])
          j++
        LOOP UNTIL i <= 0 OR j >= Ndx
      END IF

      IF Stk$[j] = "[" THEN
        i = 0
        DO
          IF Stk$[j] = "[" THEN i++
          IF Stk$[j] = "]" THEN i--
          CONCAT (Arg$,Stk$[j])
          j++
          IF Stk$[j] = "["  AND i = 0 THEN ITERATE
        LOOP UNTIL i <= 0 OR j >= Ndx
      END IF

      IF Stk$[j] = ";" OR Stk$[j] = "," OR Stk$[j] = "&" THEN
        Argcount++
        Stak[Argcount].Arg$ = Arg$
        Stak[Argcount+1].ArgType = -1
        Arg$ = ""
        j++
      ELSE
        CONCAT (Arg$,Stk$[j])
        j++
      END IF
    ELSE
      CONCAT(Arg$,Stk$[j])
      j++
    END IF
  WEND

  Argcount++
  Stak[Argcount].Arg$ = Arg$
  Arg$ = ""

  FOR i = 1 TO Argcount

    j = Stak[i].ArgType
    IF j = -1 THEN
      ZZ$ = EXTRACT$(Stak[i].Arg$,"(")
      j = DataType(ZZ$)
    END IF

    SELECT CASE j

      CASE vt_STRLIT, vt_STRVAR, vt_CHAR
      IF DoWrite THEN
        Frmat$ = Frmat$ + "\\" + DQ$ + "%s" + "\\" + DQ$ + ","
      ELSE
        CONCAT (Frmat$,"%s")
      END IF
      IF LEFT$(ZZ$, 12) = "BCX_DynaCall" THEN
        Arg$ = Arg$ + ",(char*)" + Stak[i].Arg$
      ELSE
        Arg$ = Arg$ + "," + Stak[i].Arg$
      END IF

      CASE vt_INTEGER, vt_DECFUNC
      IF DoWrite THEN
        Frmat$ = Frmat$ + "%d" + ","
      ELSE
        CONCAT (Frmat$,"% d")
      END IF
      Arg$ = Arg$ + ",(int)" + Stak[i].Arg$

      CASE vt_SINGLE
      IF DoWrite THEN
        Frmat$ = Frmat$ + "%.7G" + ","
      ELSE
        CONCAT (Frmat$,"% .7G")
      END IF
      Arg$ = Arg$ + ",(float)" + Stak[i].Arg$

      CASE vt_DOUBLE,vt_NUMBER
      IF DoWrite THEN
        Frmat$ = Frmat$ + "%.15G" + ","
      ELSE
        CONCAT (Frmat$,"% .15G")
      END IF
      Arg$ = Arg$ + ",(double)" + Stak[i].Arg$

      CASE vt_LDOUBLE
      IF DoWrite THEN
        Frmat$ = Frmat$ + "%.19LG" + ","
      ELSE
        CONCAT (Frmat$,"% .19LG")
      END IF
      Arg$ = Arg$ + ",(LDOUBLE)" + Stak[i].Arg$

      CASE ELSE
      IF ASC(Stak[i].Arg$) = ASC("(") THEN
        ZZ$ = ""
        CONCAT(Arg$,",")
        DO
          k = INSTR(Stak[i].Arg$,")")
          Cast$ = MID$(Stak[i].Arg$ ,1 ,k)
          Stak[i].Arg$ = TRIM$(MID$(Stak[i].Arg$,k+1))
          IREPLACE "char*"   WITH "char *" IN Cast$
          IREPLACE "lpstr"   WITH "char *" IN Cast$
          IREPLACE "integer" WITH "int" IN Cast$
          IREPLACE "single"  WITH "float" IN Cast$
          IREPLACE "ldouble" WITH "LDOUBLE" IN Cast$
          IF ZZ$ = "" THEN
            IF Cast$ = "(char *)" OR Cast$ = "(int)" OR Cast$ = "(float)" OR Cast$ = "(double)" OR Cast$ = "(LDOUBLE)" THEN
              ZZ$ = Cast$
            ELSE
              ZZ$ = "(double)"
              Cast$ = ZZ$ + Cast$
            END IF
            RemoveAll(ZZ$,"()")
            IREPLACE "char *"  WITH "%s"      IN ZZ$
            IREPLACE "int"     WITH "% d"     IN ZZ$
            IREPLACE "float"   WITH "% .7G"   IN ZZ$
            IREPLACE "ldouble" WITH "% .19LG" IN ZZ$
            IREPLACE "double"  WITH "% .15G"  IN ZZ$
          END IF
          CONCAT(Arg$,Cast$)
        LOOP WHILE ASC(Stak[i].Arg$) = 40

        CONCAT(Arg$, Stak[i].Arg$)
        CONCAT (Frmat$,ZZ$)

        IF DoWrite THEN CONCAT (Frmat$,",")
      ELSE
        IF DoWrite THEN
          Frmat$ = Frmat$ + "%G" + ","
        ELSE
          CONCAT (Frmat$,"% G")
          Arg$ = Arg$ + ",(float)" + Stak[i].Arg$
        END IF
      END IF

    END SELECT
  NEXT

  IF DoWrite THEN Frmat$ = LEFT$(Frmat$,LEN(Frmat$)-1)

  '*********************
  PrintWriteLabel:
  '*********************

  IF NewLineFlag = 0 THEN
    CONCAT (Frmat$,"\\n")
  END IF
  FUNCTION = "basic_r_buffer=(char *)ee_printf(" + ENC$(Frmat$) + Clean$(Arg$) + ");"
END FUNCTION ' PrintWriteFormat$






SUB EmitInputCode

  DIM RAW Argcount = 0
  DIM RAW VarCnt = 0
  DIM RAW i = 0
  DIM RAW j = 0
  DIM RAW l = 0
  DIM RAW Arg$
  DIM RAW Tmp$
  DIM RAW Frmat$
  DIM AUTO Stak$[128]
  DIM RAW Y$
  DIM RAW ZZ$

  IF NOT Use_Inputbuffer THEN
    Use_Inputbuffer = TRUE
    Use_Scan    = TRUE
    Use_Proto   = TRUE
    UseFlag     = TRUE
    Use_Split   = TRUE
    Use_Remove  = TRUE
    Use_StrStr  = TRUE
    Use_Mid     = TRUE
    Use_Left    = TRUE
    Use_Instr   = TRUE
    Use_Stristr = TRUE
    UseLCaseTbl = TRUE
  END IF

  Arg$   =  ""
  ZZ$    =  ""
  Frmat$ =  ""
  Tmp$   =  DQ$ + "," + DQ$ + "," + DQ$ + " " + DQ$

  IF DataType(Stk$[2]) = vt_STRLIT THEN
    FPRINT Outfile,Scoot$,"printf(" ; Clean$(Stk$[2]) ; ");"
  END IF

  IF DataType(Stk$[2]) = vt_STRLIT THEN
    j = 4
  ELSE
    j = 2
  END IF

  l = j

  WHILE j <= Ndx
    IF j = l THEN
      i = SubVarType(j)
    END IF
    IF Stk$[j] = "," THEN l = j + 1
    CONCAT(ZZ$, Stk$[j])
    j++
  WEND

  FastLexer(ZZ$, "", ",")

  j = 1 '0

  WHILE j <= Ndx
    IF Stk$[j] = "," THEN
      Argcount++
      Stak$[Argcount]= Arg$
      Arg$ = ""
      j++
    ELSE
      CONCAT (Arg$, Stk$[j])
      j++
      IF j < Ndx THEN
        IF Stk$[j] = "[" THEN
          i = 0
          DO
            DoAgain:
            IF Stk$[j] = "[" THEN i++
            IF Stk$[j] = "]" THEN i--
            CONCAT (Arg$,Stk$[j])
            j++
            IF Stk$[j] = "[" AND i = 0 THEN GOTO DoAgain
          LOOP UNTIL i <= 0 OR j >= Ndx
        END IF
      END IF
    END IF
  WEND

  Argcount++
  Stak$[Argcount] = Arg$
  Arg$ = ""

  FOR i = 1 TO Argcount
    Y$ = Stak$[i]
    j  = DataType(Y$)

    SELECT CASE j

      CASE vt_STRVAR
      CONCAT (Frmat$,"%s")
      Arg$ = Arg$ + "," + Clean$(Stak$[i])
      FPRINT Outfile,Scoot$, "*" + TRIM$(Clean$(Stak$[i])) + "=0;"
      VarCnt++

      CASE vt_INTEGER
      CONCAT (Frmat$,"%d")
      Arg$ = Arg$ + ",&" + Clean$(Stak$[i])
      FPRINT Outfile,Scoot$, Clean$(Stak$[i]) + "=0;"
      VarCnt++

      CASE vt_SINGLE
      CONCAT (Frmat$,"%g")
      Arg$ = Arg$ + ",&" + Clean$(Stak$[i])
      FPRINT Outfile,Scoot$, Clean$(Stak$[i]) + "=0;"
      VarCnt++

      CASE vt_DOUBLE
      CONCAT (Frmat$,"%lG")
      Arg$ = Arg$ + ",&" + Clean$(Stak$[i])
      FPRINT Outfile,Scoot$, Clean$(Stak$[i]) + "=0;"
      VarCnt++

      CASE vt_LDOUBLE
      CONCAT (Frmat$,"%lG")
      Arg$ = Arg$ + ",&" + Clean$(Stak$[i])
      FPRINT Outfile,Scoot$, Clean$(Stak$[i]) + "=0;"
      VarCnt++

      CASE ELSE
      CONCAT (Frmat$,"%d")
      Arg$ = Arg$ + ",&" + Clean$(Stak$[i])
      FPRINT Outfile,Scoot$, Clean$(Stak$[i]) + "=0;"
      VarCnt++
    END SELECT
  NEXT

  FPRINT Outfile,Scoot$, "gets(InputBuffer);"
  FPRINT Outfile,Scoot$, "ScanError = scan(InputBuffer," + ENC$(Frmat$) + Arg$ + ");\n"
  FPRINT Outfile,Scoot$, "*InputBuffer=0;"
END SUB ' EmitInputCode





SUB EmitFileInputCode
  DIM RAW Argcount = 0
  DIM RAW VarCnt = 0
  DIM RAW i
  DIM RAW j
  DIM RAW Arg$
  DIM RAW Frmat$
  DIM RAW FHandle$
  DIM RAW Y$
  DIM RAW ZZ$
  DIM AUTO Stak$[128]

  Arg$     =  ""
  Frmat$   =  ""
  ZZ$      =  ""
  FHandle$ =  ""

  IF NOT Use_Inputbuffer THEN
    Use_Inputbuffer = TRUE
    Use_Scan  = TRUE
    Use_Proto = TRUE
    UseFlag   = TRUE
    Use_Split = TRUE
    Use_Remove= TRUE
    Use_StrStr= TRUE
    Use_Mid   = TRUE
    Use_Left  = TRUE
    Use_Instr = TRUE
    Use_Stristr = TRUE
    UseLCaseTbl = TRUE
  END IF

  i = 4                      ' Extract the file handle
  FOR j = 2 TO Ndx
    IF *Stk$[j] = ASC(",") THEN i=j+1 : EXIT FOR
    FHandle$ = FHandle$ + Stk$[j]
  NEXT j


  FOR j = i TO Ndx           ' build the variable list
    IF j = i THEN SubVarType(j)
    IF Stk$[j] = "," THEN SubVarType(j+1)
    CONCAT(ZZ$, Stk$[j])
  NEXT

  FastLexer(ZZ$, "", ",")

  j = 1 '0

  WHILE j <= Ndx
    IF Stk$[j] = "," THEN
      Argcount++
      Stak$[Argcount]= Arg$
      Arg$ = ""
      j++
    ELSE
      CONCAT (Arg$, Stk$[j])
      j++
      IF j < Ndx THEN
        IF Stk$[j] = "[" THEN
          i = 0
          DO
            DoAgain:
            IF Stk$[j] = "[" THEN i++
            IF Stk$[j] = "]" THEN i--
            CONCAT (Arg$,Stk$[j])
            j++
            IF Stk$[j] = "[" AND i = 0 THEN GOTO DoAgain
          LOOP UNTIL i <= 0 OR j >= Ndx
        END IF
      END IF
    END IF
  WEND

  Argcount++
  Stak$[Argcount] = Arg$
  Arg$ = ""

  FOR i = 1 TO Argcount
    Y$ = Stak$[i]
    j  = DataType(Y$)

    SELECT CASE j

      CASE vt_STRVAR
      CONCAT (Frmat$, "%s")
      Arg$ = Arg$ + "," + Clean$(Stak$[i])
      FPRINT Outfile,Scoot$, "*" + TRIM$(Clean$(Stak$[i])) + "=0;"
      VarCnt++

      CASE vt_INTEGER
      CONCAT (Frmat$, "%d")
      Arg$ = Arg$ + ",&" + Clean$(Stak$[i])
      FPRINT Outfile,Scoot$, Clean$(Stak$[i]) + "=0;"
      VarCnt++

      CASE vt_SINGLE
      CONCAT (Frmat$, "%g")
      Arg$ = Arg$ + ",&" + Clean$(Stak$[i])
      FPRINT Outfile,Scoot$, Clean$(Stak$[i]) + "=0;"
      VarCnt++

      CASE vt_DOUBLE
      CONCAT (Frmat$, "%lG")
      Arg$ = Arg$ + ",&" + Clean$(Stak$[i])
      FPRINT Outfile,Scoot$, Clean$(Stak$[i]) + "=0;"
      VarCnt++

      CASE vt_LDOUBLE
      CONCAT (Frmat$, "%lG")
      Arg$ = Arg$ + ",&" + Clean$(Stak$[i])
      FPRINT Outfile,Scoot$, Clean$(Stak$[i]) + "=0;"
      VarCnt++

      CASE ELSE
      CONCAT (Frmat$, "%d")
      Arg$ = Arg$ + ",&" + Clean$(Stak$[i])
      FPRINT Outfile,Scoot$, Clean$(Stak$[i]) + "=0;"
      VarCnt++

    END SELECT
  NEXT
  FPRINT Outfile,Scoot$, "fgets(InputBuffer,1048576," ; FHandle$ ; ");"
  FPRINT Outfile,Scoot$, "if(InputBuffer[strlen(InputBuffer)-1]== 10)"
  FPRINT Outfile,Scoot$, "   InputBuffer[strlen(InputBuffer)-1]=0;"
  FPRINT Outfile,Scoot$, "ScanError = scan(InputBuffer," + ENC$(Frmat$) + Arg$ + ");\n"
  FPRINT Outfile,Scoot$, "*InputBuffer=0;"
END SUB ' EmitFileInputCode







SUB AddFuncs
  DIM RAW ZZ$
  DIM RAW Last$
  Last$ = ""

  CALL CloseAll

  OPEN prcFile$ FOR INPUT  AS FP1
  OPEN FileOut$ FOR APPEND AS Outfile

  IF ProtoType[1].Prototype$ > "" THEN
    IF Use_Library THEN
      FPRINT Outfile,"// BCXRTHEADER: USER SUBS AND FUNCTIONS"
    ELSE
      FPRINT Outfile,""
      FPRINT Outfile,"// ************************************"
      FPRINT Outfile,"//       " + $BCX_STR_USR_PROCS
      FPRINT Outfile,"// ************************************"
    END IF
    FPRINT Outfile,"\n"
  END IF

  WHILE NOT EOF(FP1)
    LINE INPUT FP1,ZZ$

    '================== strip out dead callback code ======================

    IF INSTR(ZZ$,"DefWindowProc") THEN
      IF  INSTR(Last$,"return ")  OR  _
        INSTR(Last$,"CallWindowProc")  OR _
        INSTR(Last$,"DefWindowProc")   OR _
        INSTR(Last$,"DefMDIChildProc") OR _
        INSTR(Last$,"DefFrameProc") THEN
        Last$ = ""
        ITERATE
      END IF
    END IF
    '======================================================================

    FPRINT Outfile,ZZ$
    IF LEFT$(ZZ$,2) <> "//" THEN
      Last$ = ZZ$
    END IF
  WEND
  IF Use_Library THEN FPRINT Outfile,"// END BCXRTHEADER\n\n"

  CALL CloseAll

  KILL prcFile$   ' translated subs and functions
  KILL udtFile$   ' translated User Defined Types
  KILL datFile$   ' translated DATA statements
  KILL cstFile$   ' translated CONSTants
  KILL ovrFile$   ' translated overloaded subs and functions
  KILL setFile$   ' translated KILL set statements
  KILL enuFile$   ' translated GLOBAL enum blocks
END SUB ' AddFuncs





FUNCTION CheckLocal(ZZ$, BYREF varidx)
  DIM RAW TT$

  IF LocalVarCnt THEN
    TT$ = Clean$(ZZ$)
    RemoveAll(TT$, " &*()", 1)
    IF INSTR(TT$,"[") THEN TT$ = LEFT$(TT$,INSTR(TT$,"[")-1)
    FOR INTEGER i = 1 TO LocalVarCnt
      IF TT$ = LocalVars[i].VarName$ THEN
        varidx = i
        FUNCTION = LocalVars[i].VarType
      END IF
    NEXT
  END IF
  FUNCTION = vt_UNKNOWN
END FUNCTION ' CheckLocal






FUNCTION CheckGlobal(ZZ$, BYREF varidx)
  DIM RAW hn
  DIM RAW s
  DIM RAW TT$

  TT$ = Clean$(ZZ$)
  RemoveAll(TT$, " &*()", 1)
  IF INSTR(TT$,"[") THEN TT$ = LEFT$(TT$,INSTR(TT$,"[")-1)
  hn  = HashNumber(TT$)

  WHILE GlobalVarHash[hn]
    s = GlobalVarHash[hn]
    IF TT$ = GlobalVars[s].VarName$ THEN
      varidx = s
      FUNCTION = GlobalVars[s].VarType
    END IF
    hn = IMOD(hn + 1,MaxGlobalVars)
  WEND
  FUNCTION = vt_UNKNOWN
END FUNCTION ' CheckGlobal





FUNCTION CheckType(ZZ$)
  DIM RAW Keyword$
  DIM RAW varid = 0
  DIM RAW i

  Keyword$ = LCASE$(ZZ$)
  i = FindWord(Keyword$, tTypes, WordsInTable(tTypes))
  IF i <> -1 THEN FUNCTION = tTypes[i].iType
  i = CheckLocal(ZZ$, &varid)
  IF i = vt_UNKNOWN THEN
    i = DefsID(ZZ$)
    IF i THEN FUNCTION = TypeDefs[i].TypeofDef
  ELSE
    FUNCTION = i
  END IF
  FUNCTION = CheckGlobal(ZZ$, &varid)
END FUNCTION ' CheckType








SUB ExportInternalConst
  IF Use_FillArray THEN
    Src$="CONST vt_INTEGER =  2"
    PassOne = 1
    CALL Parse(Src$)
    CALL Emit
    Src$="CONST vt_SINGLE  =  3"
    PassOne = 1
    CALL Parse(Src$)
    CALL Emit
    Src$="CONST vt_DOUBLE  =  4"
    PassOne = 1
    CALL Parse(Src$)
    CALL Emit
    Src$="CONST vt_LDOUBLE  =  5"
    PassOne = 1
    CALL Parse(Src$)
    CALL Emit
  END IF
END SUB ' ExportInternalConst






FUNCTION RestrictedWords(ZZ$)
  IF ZZ$ = "CmdLine"    THEN FUNCTION = 1
  IF ZZ$ = "CmdShow"    THEN FUNCTION = 1
  IF ZZ$ = "hInst"      THEN FUNCTION = 1
  IF ZZ$ = "hPrev"      THEN FUNCTION = 1
  IF ZZ$ = "hWnd"       THEN FUNCTION = 1
  IF ZZ$ = "lParam"     THEN FUNCTION = 1
  IF ZZ$ = "Msg"        THEN FUNCTION = 1
  IF ZZ$ = "wParam"     THEN FUNCTION = 1
  IF ZZ$ = "vt_INTEGER" THEN FUNCTION = 1
  IF ZZ$ = "vt_SINGLE"  THEN FUNCTION = 1
  IF ZZ$ = "vt_DOUBLE"  THEN FUNCTION = 1
  IF ZZ$ = "vt_LDOUBLE" THEN FUNCTION = 1
  FUNCTION = 0
END FUNCTION ' RestrictedWords





FUNCTION DataType(ZZ$)
  DIM RAW Keyword$
  DIM RAW i

  IF ZZ[0] = 34 THEN
    FUNCTION = vt_STRLIT
  END IF

  IF INCHR(ZZ$,"$") THEN
    FUNCTION = vt_STRVAR
  END IF

  IF IsNumber(ZZ$) THEN
    FUNCTION = vt_NUMBER
  END IF

  i = DefsID(ZZ$)
  IF i THEN FUNCTION = TypeDefs[i].TypeofDef

  '****************
  '   Functions
  '****************

  Keyword$ = LCASE$(ZZ$)
  i = FindWord(Keyword$,tBcxWords,WordsInTable(tBcxWords))
  IF i <> -1 THEN FUNCTION = tBcxWords[i].iType

  IF INCHR(ZZ$,"%") THEN
    FUNCTION = vt_INTEGER
  END IF

  IF INCHR(ZZ$,"!") THEN
    FUNCTION = vt_SINGLE
  END IF

  IF INCHR(ZZ$,"#") THEN
    FUNCTION = vt_DOUBLE
  END IF

  IF INCHR(ZZ$,"^") THEN
    FUNCTION = vt_DOUBLE
  END IF

  IF INCHR(ZZ$,"¦") THEN
    FUNCTION = vt_LDOUBLE
  END IF

  IF iMatchRgt(ZZ$,"@") THEN
    FUNCTION = vt_FILEPTR
  END IF

  IF INCHR(ZZ$," ") THEN
    FUNCTION = vt_UDT
  END IF

  IF isalpha(*ZZ$) THEN
    FUNCTION = vt_INTEGER
  END IF

  FUNCTION = vt_UNKNOWN
END FUNCTION ' DataType






SUB CloseAll
  IF PPDLL_HANDLE THEN
    FreeLibrary(PPDLL_HANDLE)
    PPDLL_HANDLE = NULL
    PPProc = NULL
  END IF
  CLOSE   ' Flush and Close all open files
END SUB ' CloseAll







FUNCTION Clean$(ZZ$)
  DIM RAW Tmp$

  IF INCHR(ZZ$,"%") THEN
    IF TRIM$(ZZ$) = "%" THEN FUNCTION = " % "
  END IF

  IF iMatchNQ(ZZ$,"!=") THEN FUNCTION = ZZ$

  Tmp$ = ZZ$
  RemoveAll(Tmp$,"%$#!@¦",1)   '1 = ignore anything in quotes

  FUNCTION = Tmp$
END FUNCTION ' Clean$






SUB RemoveAll OPTIONAL(Arg$, MatchChars$, qtflag=0)
  DIM RAW C = Arg AS PCHAR
  DIM RAW pmc AS PCHAR

  WHILE *Arg
    IF qtflag THEN
      IF *Arg = 34 THEN
        *(C++) = *Arg
        WHILE *(++Arg) <> 34
          *(C++) = *Arg
          IF *Arg = 0 THEN EXIT SUB
        WEND
        *(C++) = *(Arg++)
        ITERATE
      END IF
    END IF

    pmc = MatchChars
    WHILE *pmc
      IF *(pmc++) = *Arg THEN GOTO SKIP
    WEND
    *(C++) = *Arg

    SKIP:
    INCR Arg
  WEND
  *C = 0
END SUB






SUB Warning OPTIONAL(ZZ$, WarnLvl=0)
  LOCAL fErr AS FILE
  IF WarnLvl THEN
    WarnMsg$ = WarnMsg$ + " Line" + STR$(ModuleLineNos[ModuleNdx]) + " in Module: " + TRIM$(Modules$[ModuleNdx]) + " - " + ZZ$
  ELSE
    WarnMsg$ = WarnMsg$ + ZZ$
  END IF

  WarnMsg$ = WarnMsg$ + CRLF$

  IF ErrFile THEN
    OPEN FileErr$ FOR APPEND AS fErr
    FPRINT fErr, "WARNING ";ZZ$
    CLOSE fErr
  END IF
END SUB ' Warnings





FUNCTION GetVarTypeName(i) AS LPSTR
  DIM STATIC A$
  SELECT CASE i
    CASE vt_INTEGER    :    A$ = "int"
    CASE vt_STRVAR     :    A$ = "char *"
    CASE vt_STRLIT     :    A$ = "STRLIT"
    CASE vt_UNKNOWN    :    A$ = "UNKNOWN"
    CASE vt_SINGLE     :    A$ = "float"
    CASE vt_DOUBLE     :    A$ = "double"
    CASE vt_LDOUBLE    :    A$ = "LDOUBLE"
    CASE vt_DECFUNC    :    A$ = "DECFUNC"
    CASE vt_NUMBER     :    A$ = "NUMBER"
    CASE vt_FILEPTR    :    A$ = "FILE*"
    CASE vt_UDT        :    A$ = "struct"
    CASE vt_STRUCT     :    A$ = "struct"
    CASE vt_UNION      :    A$ = "union"
    CASE vt_LPSTR      :    A$ = "LPSTR"
    CASE vt_BOOL       :    A$ = "BOOL"
    CASE vt_CHAR       :    A$ = "char"
    CASE vt_LPSTRPTR   :    A$ = "LPSTR *"
    CASE vt_CHARPTR    :    A$ = "char" ' Default String - 2048
    CASE vt_PCHAR      :    A$ = "PCHAR"
    CASE vt_VOID       :    A$ = "void"
    CASE vt_LONG       :    A$ = "long"
    CASE vt_DWORD      :    A$ = "DWORD"
    CASE vt_FARPROC    :    A$ = "FARPROC"
    CASE vt_LPBYTE     :    A$ = "LPBYTE"
    CASE vt_LRESULT    :    A$ = "LRESULT"
    CASE vt_BYTE       :    A$ = "BYTE"
    CASE vt_SHORT      :    A$ = "short"
    CASE vt_USHORT     :    A$ = "USHORT"
    CASE vt_COLORREF   :    A$ = "COLORREF"
    CASE vt_UINT       :    A$ = "UINT"
    CASE vt_ULONG      :    A$ = "ULONG"
    CASE vt_ULLONG     :    A$ = "ULLONG"
    CASE vt_LLONG      :    A$ = "long long"
    CASE vt_HANDLE     :    A$ = "HANDLE"
    CASE vt_HINSTANCE  :    A$ = "HINSTANCE"
    CASE vt_HDC        :    A$ = "HDC"
    CASE vt_VARIANT    :    A$ = "VARIANT"
    CASE ELSE          :    A$ = ""  'Assume the programmer has a brain
  END SELECT
  FUNCTION = A
END FUNCTION ' GetVarTypeName$




FUNCTION HashNumber(HT$)
  DIM RAW TT AS CHAR PTR
  DIM RAW i = 0 AS ULONG
  TT = HT
  WHILE *TT
    i <<= 1
    ! i ^= *TT;
    TT++
  WEND
  FUNCTION = IMOD(i,MaxGlobalVars)
END FUNCTION 'HashNumber





SUB AddLibrary (LibName$)
  STATIC nTimes
  LOCAL nLibNdx
  DIM RAW TempLibName$
  TempLibName$ = LCASE$(LibName$)

  IF NOT INCHR(TempLibName$,DQ$) AND NOT INCHR(TempLibName$,"<") THEN
    TempLibName$ = ENC$(TempLibName$,60,62)
  END IF

  IF nTimes = 0 THEN
    FOR INTEGER i = 0 TO MaxLib - 1
      Library$[i] = ""
    NEXT
    nTimes++
    Library$[0] = TempLibName$
    EXIT SUB
  END IF

  nLibNdx = 0
  WHILE Library$[nLibNdx] <> ""
    IF Library$[nLibNdx] = TempLibName$ THEN EXIT SUB
    INCR nLibNdx
  WEND

  IF nLibNdx < MaxLib - 1 THEN
    Library$[nLibNdx] = TempLibName$
  END IF
END SUB ' AddLibrary





SUB RemoveLibrary( LibName$ )
  IF NOT INSTR( RmLibs$, LibName$, 1, 1 ) THEN
    RmLibs$ = RmLibs$ + "," + LCASE$(LibName$)
  END IF
END SUB ' RemoveLibrary




SUB EmitLibs()
  STATIC nTimes
  STATIC nCount
  DIM RAW ltmp$
  IF nTimes > 0 THEN EXIT SUB
  INCR nTimes
  IF Library$[0] = "" THEN EXIT SUB
  FPRINT FP7,""
  FPRINT FP7,"#if !defined( __LCC__ )"
  FOR INTEGER i = 0 TO MaxLib - 1
    IF Library$[i] = "" AND nCount > 0 THEN
      GOTO NEXTLIB
    ELSEIF Library$[i] = "" THEN
      GOTO NEXTLIB
    END IF
    ltmp$ = Library$[i]
    RemoveAll(ltmp$,"<>" & DQ$)
    IF INSTR( RmLibs$, ltmp$ ) THEN ITERATE ' skip libraries that have been removed
    IF nCount = 0 THEN
      INCR nCount
      FPRINT FP7,"// *************************************************"
      FPRINT FP7,"// Instruct Linker to Search Object/Import Libraries"
      FPRINT FP7,"// *************************************************"
    END IF
    FPRINT FP7,"#pragma comment(lib,",ENC$(ltmp$), ")"
  NEXT

  NEXTLIB:

  FPRINT FP7, "#else"
  ' add lccwin32's default libraries to the remove library list so they won't be emitted
  RmLibs$ = RmLibs$ + ",<libc.lib>,<kernel32.lib>,<comdlg32.lib>,<user32.lib>,<gdi32.lib>,<advapi32.lib>,<comctl32.lib>,<crtdll.lib>"
  FOR INTEGER i = 0 TO MaxLib - 1
    IF Library$[i] = "" AND nCount > 0 THEN
      FPRINT FP7,"// *************************************************"
      FPRINT FP7,"// End of Object/Import Libraries To Search"
      FPRINT FP7,"// *************************************************"
      GOTO LIBEND
    ELSEIF Library$[i] = "" THEN
      GOTO LIBEND
    END IF
    IF INSTR( RmLibs$, Library$[i] ) THEN ITERATE ' skip libraries that have been removed
    IF nCount = 0 THEN
      INCR nCount
      FPRINT FP7,""
      FPRINT FP7,"// *************************************************"
      FPRINT FP7,"// Instruct Linker to Search Object/Import Libraries"
      FPRINT FP7,"// *************************************************"
    END IF
    FPRINT FP7,"#pragma lib ",Library$[i]
  NEXT

  LIBEND:

  FPRINT FP7,"#endif"
  IF Use_Library THEN FPRINT FP7,"// END BCXRTHEADER\n\n"
END SUB ' EmitLibs





SUB AddGlobal(GlobalName$, GlobalType, GlobalDef, GlobalDim$, GlobalPtr, GlobalFS, GlobalExtn, iEmitted)
  DIM RAW FirstVar$
  DIM RAW SecondVar$
  DIM RAW Warn$
  DIM RAW ss
  DIM RAW s

  IF Use_Project = TRUE THEN
    IF GlobalExtn = 0 THEN
      GlobalExtn = 2
    END IF
  END IF

  IF RestrictedWords(GlobalName$) AND TestState THEN
    Warn$ = "Restricted Word " + GlobalName$ + " on Line"
    Warn$ = Warn$ + STR$(ModuleLineNos[ModuleNdx]) + " in Module: " + TRIM$(Modules$[ModuleNdx])
    CALL Warning(Warn$)
  END IF

  ss = HashNumber(GlobalName$)

  WHILE GlobalVarHash[ss]
    s = GlobalVarHash[ss]
    IF GlobalName$ = GlobalVars[s].VarName$ THEN
      IF InConditional = 0 OR (InConditional > 0 AND InIfDef$ = GlobalVars[s].VarCondDef$) THEN
        IF GlobalVars[s].VarType <> GlobalType OR _
          GlobalDim$ <> GlobalVars[s].VarDim$ OR _
          GlobalVars[s].VarDef <> GlobalDef THEN
          FirstVar$ = "Line" + STR$(ModuleLineNos[ModuleNdx]) + " in Module: " + TRIM$(Modules$[ModuleNdx]) + " : " + GlobalName$ + GlobalDim$ + " as " + GetVarTypeName$(GlobalType) + " " + TypeDefs[GlobalDef].VarName$
          SecondVar$ = "Line" + STR$(GlobalVars[s].VarLine) + " in Module: " + GlobalVars[s].VarModule + " : " + GlobalName$ + GlobalVars[s].VarDim$ + " as " + GetVarTypeName$(GlobalVars[s].VarType) + " " + TypeDefs[GlobalVars[s].VarDef].VarName$
          Warn$ = "Two Variables " + FirstVar$ + " previously defined at " + SecondVar$
          CALL Warning(Warn$)
        END IF
        EXIT SUB
      END IF
    END IF
    ss = IMOD(ss + 1,MaxGlobalVars)
  WEND

  GlobalVarCnt++
  IF GlobalVarCnt = MaxGlobalVars THEN Abort("Maximum Global Variables reached.")
  GlobalVars[GlobalVarCnt].VarName$     =  GlobalName$
  GlobalVars[GlobalVarCnt].VarType      =  GlobalType
  GlobalVars[GlobalVarCnt].VarDef       =  GlobalDef
  GlobalVars[GlobalVarCnt].VarDim$      =  GlobalDim$
  GlobalVars[GlobalVarCnt].VarLine      =  ModuleLineNos[ModuleNdx]
  GlobalVars[GlobalVarCnt].VarPntr      =  GlobalPtr
  GlobalVars[GlobalVarCnt].VarSF        =  GlobalFS
  GlobalVars[GlobalVarCnt].VarEmitFlag  =  iEmitted
  GlobalVars[GlobalVarCnt].VarModule$   =  TRIM$(Modules$[ModuleNdx])
  GlobalVars[GlobalVarCnt].VarExtn      =  GlobalExtn
  GlobalVars[GlobalVarCnt].VarCondLevel =  InConditional
  GlobalVars[GlobalVarCnt].VarCondDef$  =  InIfDef$
  GlobalVarHash[ss] = GlobalVarCnt
END SUB ' AddGlobal





SUB AddLocal(LocalName$, LocalType, LocalDef, LocalDim$, LocalPtr, LocalFS, iEmitted)
  DIM RAW varid = 0
  DIM RAW FirstVar$
  DIM RAW SecondVar$
  DIM RAW Warn$
  DIM RAW s

  IF LocalVarCnt AND TestState THEN
    IF CheckGlobal(LocalName$, &varid) <> vt_UNKNOWN THEN

      IF LocalDef THEN
        FirstVar$ = "Line" + STR$(ModuleLineNos[ModuleNdx]) + " in Module: " + TRIM$(Modules$[ModuleNdx]) + " : " + LocalName$ + LocalDim$ + " as " + TypeDefs[LocalDef].VarName$
      ELSE
        FirstVar$ = "Line" + STR$(ModuleLineNos[ModuleNdx]) + " in Module: " + TRIM$(Modules$[ModuleNdx])  + " : " + LocalName$ + LocalDim$ + " as " + GetVarTypeName$(LocalType)
      END IF

      IF GlobalVars[varid].VarDef THEN
        SecondVar$ = "Line" + STR$(GlobalVars[varid].VarLine) + " in Module: " + GlobalVars[varid].VarModule + " : " + LocalName$ + GlobalVars[varid].VarDim$ + " as " + TypeDefs[GlobalVars[varid].VarDef].VarName$
      ELSE
        SecondVar$ = "Line" + STR$(GlobalVars[varid].VarLine) + " in Module: " + GlobalVars[varid].VarModule + " : " + LocalName$ + GlobalVars[varid].VarDim$ + " as " + GetVarTypeName$(GlobalVars[varid].VarType)
      END IF
      Warn$ = "Local Variable " + FirstVar$ + CRLF$ + "Has Same Name as Global " + SecondVar$
      CALL Warning(Warn$)
    END IF

    FOR s = 1 TO LocalVarCnt
      IF LocalName$ = LocalVars[s].VarName$ THEN
        IF LocalVars[s].VarType <> LocalType OR LocalDim$ <> LocalVars[s].VarDim$ OR LocalVars[s].VarDef <> LocalDef THEN
          FirstVar$ = "Line" + STR$(ModuleLineNos[ModuleNdx]) + " in Module: " + TRIM$(Modules$[ModuleNdx]) + " : " + LocalName$ + LocalDim$ + " as " + GetVarTypeName$(LocalType) + " " + TypeDefs[LocalDef].VarName$
          SecondVar$ = "Line" + STR$(LocalVars[s].VarLine) + " in Module: " + LocalVars[s].VarModule + " : " + LocalName$ + LocalVars[s].VarDim$ + " as " + GetVarTypeName$(LocalVars[s].VarType) + " " + TypeDefs[LocalVars[s].VarDef].VarName$
          Warn$ = "Two Variables " + FirstVar$ + " previously defined at " + SecondVar$
          CALL Warning(Warn$)
        END IF
        EXIT SUB
      END IF
    NEXT
  END IF

  LocalVarCnt++

  IF LocalVarCnt = MaxLocalVars THEN
    Warn$ = "Maximum Local Variables reached."
    Abort(Warn$)
  END IF

  LocalVars[LocalVarCnt].VarName$  =  LocalName$
  LocalVars[LocalVarCnt].VarType   =  LocalType
  LocalVars[LocalVarCnt].VarDef    =  LocalDef
  LocalVars[LocalVarCnt].VarDim$   =  LocalDim$
  LocalVars[LocalVarCnt].VarLine   =  ModuleLineNos[ModuleNdx]
  LocalVars[LocalVarCnt].VarPntr   =  LocalPtr
  LocalVars[LocalVarCnt].VarSF     =  LocalFS
  LocalVars[GlobalVarCnt].VarEmitFlag  =  iEmitted
  LocalVars[LocalVarCnt].VarModule$=  TRIM$(Modules$[ModuleNdx])
END SUB ' AddLocal





FUNCTION IsNumber(a$)
  DIM RAW i = 0
  IF NOT *a THEN FUNCTION = FALSE  ' Handle null arguments
  WHILE a[i]                       ' While NOT null terminator
    IF a[i]>47 AND a[i]<58 THEN    ' Test for 0123456789
      i++                          ' bump our index
    ELSE
      FUNCTION = FALSE             ' a$ is not a number
    END IF                         '
  WEND                             '
  FUNCTION = TRUE                  ' a$ is a number
END FUNCTION ' IsNumber





FUNCTION IsNumberEx(a$)
  DIM RAW i = 0
  IF NOT *a THEN FUNCTION = FALSE  ' Handle null arguments
  WHILE a[i]                       ' While NOT null terminator
    IF a[i]>44 AND a[i]<58 THEN    ' Test FOR -+.0123456789
      i++                          ' bump our index
    ELSE
      FUNCTION = FALSE             ' a$ is not a number
    END IF                         '
  WEND                             '
  FUNCTION = TRUE                  ' a$ is a number
END FUNCTION ' IsNumberEx





SUB StripTabs
  DIM RAW i = 0
  WHILE Src[i]
    IF Src[i] = 9 THEN Src[i] = 32
    i++
  WEND
END SUB ' StripTabs




SUB PushFileIO
  FPtr[++FPtrNdx] = SourceFile
END SUB 'PushFileIO





SUB PopFileIO
  IF FPtrNdx = 0 THEN EXIT SUB
  CLOSE SourceFile
  INCR LinesRead, ModuleLineNos[ModuleNdx--]
  SourceFile = FPtr[FPtrNdx--]
END SUB 'PopFileIO





FUNCTION Inset(Mane$,Match$)
  DIM RAW i = -1, j = -1
  WHILE Match[++i]
    WHILE Mane[++j]
      IF Match[i] = Mane[j] THEN FUNCTION = TRUE
    WEND
    j = -1
  WEND
  FUNCTION = FALSE
END FUNCTION 'Inset





SUB CheckParQuotes
  DIM RAW CountR=0 'Round bracket counter
  DIM RAW CountS=0 'Square bracket counter
  DIM RAW i=0
  DIM RAW DoCount=TRUE AS BOOL
  WHILE Src[i]
    IF Src[i]=34 THEN
      DoCount = NOT DoCount
    END IF
    IF DoCount THEN
      IF Src[i]=40 THEN
        CountR++
      ELSEIF Src[i]=41 THEN
        CountR--
      ELSEIF Src[i]=91 THEN
        CountS++
      ELSEIF Src[i]=93 THEN
        CountS--
      END IF
    END IF
    i++
  WEND
  IF NOT DoCount THEN
    Abort ("Unmatched Quotes")
  ELSEIF CountS THEN
    Abort ("Unmatched []")
  ELSEIF CountR THEN
    Abort ("Unmatched ()")
  END IF
END SUB ' CheckParQuotes




SUB ClearIfThenStacks
  FOR INTEGER i = 0 TO 127
    SrcStk$[i] = ""
  NEXT
  SrcCnt = 0
END SUB ' ClearIfThenStacks





FUNCTION IsQuoted(ZZ$)
  IF NOT iMatchLft(LTRIM$(ZZ$),DQ$) THEN EXIT FUNCTION
  IF NOT iMatchRgt(RTRIM$(ZZ$),DQ$) THEN EXIT FUNCTION
  FUNCTION = TRUE
END FUNCTION ' IsQuoted





SUB PostProcess
  DIM RAW A
  IF ReDirect = TRUE THEN
    OPEN FileOut$ FOR INPUT AS FP1
    WHILE NOT EOF(FP1)
      LINE INPUT FP1,Z$
      PRINT Z$
    WEND
    CALL CloseAll
  END IF
  '**************************
  OutfileClone$ = FileOut$
  FOR A = 1 TO EntryCnt
    OutfileClone$ = EXTRACT$(OutfileClone$,".")
    Cmd$ = REMOVE$(Entry$[A],DQ$)
    REPLACE "\\\\" WITH "\\" IN Cmd$
    IREPLACE "$file$"  WITH EXTRACT$(OutfileClone$,".") IN Cmd$

    IREPLACE "$PELLES$\\" WITH PELLESPATH$ IN Cmd$
    IREPLACE "$PELLES$"   WITH PELLESPATH$ IN Cmd$

    IREPLACE "$LCC$\\" WITH LCCPATH$ IN Cmd$
    IREPLACE "$LCC$"   WITH LCCPATH$ IN Cmd$

    IREPLACE "$BCX$\\" WITH BCXPATH$ IN Cmd$
    IREPLACE "$BCX$"   WITH BCXPATH$ IN Cmd$
    PRINT "Shelling Out To:", Linker$
    SHELL Cmd$
  NEXT

  IF Compiler$ > "" THEN
    Compiler$ = TRIM$(REMOVE$(Compiler$,DQ$))

    IF INCHR(Compiler$, " ") THEN
      Compiler$ = ENC$(EXTRACT$(Compiler$," ")) + " " +  REMAIN$(Compiler$," ")
    ELSE
      Compiler$ = ENC$(Compiler$)
    END IF

    FileOut$ = EXTRACT$(FileOut$,".") + ".c"
    Compiler$ = Compiler$ + " " + FileOut$

    IREPLACE "$PELLES$\\" WITH PELLESPATH$ IN Compiler$
    IREPLACE "$PELLES$"   WITH PELLESPATH$ IN Compiler$

    IREPLACE "$LCC$\\" WITH LCCPATH$ IN Compiler$
    IREPLACE "$LCC$"   WITH LCCPATH$ IN Compiler$

    IREPLACE "$FILE$"  WITH EXTRACT$(OutfileClone$,".") IN Compiler$
    REPLACE "\\\\" WITH "\\" IN Compiler$
    REPLACE DDQ$   WITH DQ$  IN Compiler$
    PRINT "Shelling Out To:", Compiler$
    SHELL Compiler$
  END IF

  '**************************

  IF ResCompiler$ > "" THEN
    ResCompiler$ = ENC$(ResCompiler$)
    ResCompiler$ = ResCompiler$ + " " + Res_File$

    IREPLACE "$PELLES$\\" WITH PELLESPATH$ IN ResCompiler$
    IREPLACE "$PELLES$"   WITH PELLESPATH$ IN ResCompiler$

    IREPLACE "$LCC$\\" WITH LCCPATH$ IN ResCompiler$
    IREPLACE "$LCC$"   WITH LCCPATH$ IN ResCompiler$

    IREPLACE "$FILE$" WITH EXTRACT$(OutfileClone$,".") IN ResCompiler$
    REPLACE "\\\\" WITH "\\" IN ResCompiler$
    REPLACE DDQ$   WITH DQ$  IN ResCompiler$
    PRINT "Shelling Out To:", ResCompiler$
    SHELL ResCompiler$
  END IF

  '**************************

  IF Linker$ > "" THEN
    Linker$ = TRIM$(REMOVE$(Linker$,DQ$))

    IF INCHR(Linker$, " ") THEN
      Linker$ = DQ$ + EXTRACT$(Linker$," ") + DQ$ + " " + REMAIN$(Linker$," ")
    ELSE
      Linker$ = ENC$(Linker$)
    END IF

    FileOut$ = EXTRACT$(FileOut$,".") + ".obj"
    Linker$ = Linker$ + " " + FileOut$

    IREPLACE "$PELLES$\\" WITH PELLESPATH$ IN Linker$
    IREPLACE "$PELLES$"   WITH PELLESPATH$ IN Linker$

    IREPLACE "$LCC$\\" WITH LCCPATH$ IN Linker$
    IREPLACE "$LCC$"   WITH LCCPATH$ IN Linker$

    IREPLACE "$FILE$" WITH EXTRACT$(OutfileClone$,".") IN Linker$
    REPLACE "\\\\" WITH "\\" IN Linker$
    REPLACE DDQ$   WITH DQ$  IN Linker$

    IF Use_Resource THEN
      ResFileOut$ = EXTRACT$(Res_File$,".") + ".res"
      Linker$ = Linker$ + " " + ResFileOut$
    END IF

    PRINT "Shelling Out To:", Linker$
    SHELL Linker$
  END IF
  '**************************
  FOR A = 1 TO XitCount
    FileOut$ = EXTRACT$(FileOut$,".")
    Cmd$ = REMOVE$(Xit$[A],DQ$)
    IREPLACE "$FILE$" WITH EXTRACT$(OutfileClone$,".") IN Cmd$
    IREPLACE "$PELLES$\\" WITH PELLESPATH$ IN Cmd$
    IREPLACE "$PELLES$"   WITH PELLESPATH$ IN Cmd$
    IREPLACE "$LCC$\\" WITH LCCPATH$ IN Cmd$
    IREPLACE "$LCC$"   WITH LCCPATH$ IN Cmd$
    IREPLACE "$BCX$\\" WITH BCXPATH$ IN Cmd$
    IREPLACE "$BCX$"   WITH BCXPATH$ IN Cmd$
    REPLACE "\\\\" WITH "\\" IN Cmd$
    REPLACE DDQ$ WITH DQ$ IN Cmd$
    PRINT "Shelling Out To:", Cmd$
    SHELL Cmd$
  NEXT
END SUB ' PostProcess






SUB XParse(Arg$)
  DIM RAW lszTmp$
  DIM RAW j, i = 0, Gapflag = 0
  DIM RAW InIF = 0

  IF TRIM$(Arg$) = "" THEN
    Ndx = 0
    EXIT SUB
  END IF

  '-----------------------------------------------
  ' A temporary cure to allow the C '&&' operator
  '-----------------------------------------------
  i = iMatchNQ(Arg$, "&&")
  WHILE i
    Arg$ = DEL$(Arg$, i, 2)
    Arg$ = INS$(Arg$, i, " and ")
    i = iMatchNQ(Arg$, "&&")
  WEND
  '-----------------------------------------------

  FastLexer(Arg$, SPC$, "=&()[]{}',+-*/<>?;.|:^")

  '****************************************
  '              Pre Parse
  '****************************************
  WHILE ++i < 17
    Stk$[i+Ndx] = ""
  WEND

  FOR i = 1 TO Ndx
    Keyword1$ = LCASE$(Stk$[i])

    IF Keyword1[1] <> 0 THEN
      SELECT CASE Keyword1$
        CASE "and"  : Stk$[i] = "&&"
        CASE "or"   : Stk$[i] = "||"
        CASE "not"  : Stk$[i] = "!"
        CASE "is"   : Stk$[i] = "="
        CASE "xor"  : Stk$[i] = "xor"

        CASE "if","iif","iif$","case","elseif","while"
        InIF = 1

        CASE "then"
        InIF = 0

        CASE "byval"
        Stk$[i] = ""
        Gapflag = TRUE

        CASE "byref"
        IF NOT iMatchWrd(Stk$[1], "declare") AND _
          NOT iMatchWrd(Stk$[1], "c_declare") THEN
          ByrefVars$[++ByrefCnt] = Stk$[i+1]
        END IF
        FOR j = i TO Ndx
          IF Stk$[j+1] = "," OR Stk$[j+1] = ")" THEN
            Stk$[j] = "PTR"
            EXIT FOR
          END IF
          Stk$[j] = Stk$[j+1]
        NEXT

        CASE ELSE
        IF PassOne THEN
          IF Keyword1$ = ENC$(CHR$(92)) THEN
            IF Stk$[i+1] <> CHR$(34) THEN
              Stk$[i] = "chr$"
              InsertTokens(i, 3, "(", "92", ")")
              INCR i,3
            ELSE
              CONCAT(Stk$[i],Stk$[i+1])
              Stk$[i+1] = ""
              Gapflag = TRUE
            END IF
          ELSEIF  TranslateSlash THEN
            REPLACE "\\" WITH "\\\\" IN Stk$[i]
          END IF
        END IF
      END SELECT

      '*******************************************************************
      '  Allow logical 'OR/AND' to be used as 'binary BOR/BAND'
      '*******************************************************************
      IF NOT InIF THEN
        IF Stk$[i] = "&&" THEN
          Stk$[i] = "BAND"
        ELSEIF Stk$[i] = "||" THEN
          Stk$[i] = "BOR"
        END IF
      END IF

    ELSE
      SELECT CASE ASC(Keyword1$)
        ' --------------------------------
        ' Connect (&)addressof operator.
        ' --------------------------------
        CASE ASC("&")
        IF i < 3 OR INCHR("+&,(=", Stk$[i-1]) THEN
          Stk$[i+1] = " &" + Stk$[i+1]
          Stk$[i] = "" : Gapflag=TRUE
        END IF

        CASE ASC("?")
        Stk$[i] = "print"

        CASE ASC("-")
        IF ASC(Stk$[i+1]) = ASC(">") THEN
          Stk$[i] = "->" & Stk$[i+2]
          Stk$[++i] = "" : Stk$[++i] = ""
          Gapflag=TRUE
        END IF

        CASE ASC(".")
        IF IsNumber(Stk$[i-1]) THEN
          Stk$[i] = Stk$[i-1] & "."
          Stk$[i-1] = "" : Gapflag=TRUE
        END IF
        IF NOT INCHR( ",)=<>*/+-^" , Stk[i+1]) THEN
          Stk$[i] = Stk$[i] & Stk$[i+1]
          Stk$[++i] = "" : Gapflag=TRUE
        END IF

      END SELECT
    END IF
  NEXT i


  IF Gapflag THEN
    FOR i = 1 TO Ndx
      IF NOT *Stk[i] THEN
        j = i + 1
        WHILE NOT *Stk[j] AND (j < Ndx)
          INCR j
        WEND
        IF NOT *Stk[j] THEN EXIT FOR
        Stk$[i] = Stk$[j] : Stk$[j] = ""
      END IF
    NEXT i
    Ndx = i-1
  END IF

  ' *******************************************************************
  ' Special Case Handler: BYREF - BCX prepends * to BYREF'd Variables
  ' *******************************************************************
  IF PassOne = 1 THEN
    IF InFunc THEN                      ' Must be in a SUB or FUNCTION
      FOR i = 1 TO Ndx
        FOR j = 1 TO ByrefCnt
          IF iMatchLft(Stk$[i], " &") THEN lszTmp$ = Stk$[i] + 2 ELSE lszTmp$ = Stk$[i]
          IF Clean$(lszTmp$) = Clean$(ByrefVars[j]) THEN

            IF i > 2 THEN
              IF INCHR("+-^%*/|&<=>,", Stk$[i-2]) AND Stk$[i-1] = "*" THEN
                Stk$[i-1] = ""
              END IF

              IF iMatchLft(Stk$[i], " &") THEN
                Stk$[i] = Stk$[i] + 2
                EXIT FOR
              END IF

            ELSEIF i = 2 THEN
              IF Stk$[i-1] = "*" THEN Stk$[i-1] = ""
            END IF

            Stk$[i] = "*" & Stk$[i]
            IF Stk$[i-1] <> "(" OR Stk$[i+1] <> ")" THEN
              Stk$[i] = ENC$(Stk$[i], ASC("("), ASC(")"))
            END IF
            EXIT FOR
          END IF
        NEXT
      NEXT
    END IF
  END IF


  ' *******************************************************************
  ' Special Case Handler: DIM BLAHBLAH[22][33] AS STATIC INTEGER
  ' *******************************************************************

  IF iMatchWrd(Stk$[1],"dim") THEN
    IF iMatchWrd(Stk$[Ndx-1],"static") THEN
      Stk$[1] = "static"
      Stk$[Ndx-1] = Stk$[Ndx]
      Ndx--
    END IF
  END IF

  ' ***************************************************************************
  ' Special Case Handler: In the contexts of UDT,s this handler transforms:
  ' FUNCTION Foo (a as integer) AS INTEGER         to:
  ' DIM FUNCTION Foo (a as integer) AS INTEGER
  '
  ' Change "as string" to "as char *" for UDTs and Declarations
  ' ***************************************************************************

  Keyword1$ = LCASE$(Stk$[1])

  IF InTypeDef THEN
    IF Keyword1$ <> "end" AND Keyword1$ <> "dim" AND Keyword1$ <> "declare" AND Keyword1$ <> "type" AND Keyword1$ <> "union" THEN
      InsertTokens(0, 1, "dim")
    END IF
  END IF

  '******************************
  '
  '******************************

  IF NOT InTypeDef THEN
    DIM RAW lsz$, Res = 1
    lsz$ =  SPC$ & Keyword1$ & SPC$
    IF iMatchNQ(" dim , local , global , raw , static , shared , dynamic , auto , register , extern ", lsz$) THEN
      Res = 1
    END IF
    lsz$ =  SPC$ & LCASE$(Stk$[2]) & SPC$
    IF iMatchNQ(" dim , local , global , raw , static , shared , dynamic , auto , register , extern ", lsz$) THEN
      Res = 2
    END IF

    IF Res > 0 THEN
      i = Ndx
      WHILE i > 1 AND Stk$[i] <> ")"
        IF iMatchWrd(Stk$[i], "as") THEN
          IF iMatchWrd(Stk$[i+1], "function") THEN
            IF i+1 = Ndx THEN Stk$[i] = ""  ' remove "as"
            Stk$[i+1] = ""
            InsertTokens(Res, 1, "function")
          ELSEIF iMatchWrd(Stk$[i+1], "sub") THEN
            IF i+1 = Ndx THEN Stk$[i] = ""  ' remove "as"
            Stk$[i+1] = ""
            InsertTokens(Res, 1, "sub")
          END IF
          CALL RemEmptyTokens
          EXIT WHILE
        END IF
        DECR i
      WEND
    END IF
  END IF


  IF InTypeDef OR iMatchWrd(Stk$[1], "declare") OR iMatchWrd(Stk$[1], "c_declare") THEN
    IF iMatchWrd(Stk$[2],"sub") OR iMatchWrd(Stk$[2],"function") THEN
      FOR INTEGER i = 2 TO Ndx
        IF iMatchLft(Stk$[i],"as") AND iMatchWrd(Stk$[i+1],"string") THEN
          IF *Stk$[i+2] <> ASC("*") THEN Stk$[i+1] = "char *"
        END IF
      NEXT
    END IF
  END IF
END SUB 'XParse







SUB TokenSubstitutions
  '*****************************
  ' Start Doing Text Substitutions
  '*****************************
  DIM RAW A
  DIM RAW CompPtr
  DIM RAW CompToken
  DIM RAW Keyword$
  DIM RAW a, i, j, Tmp

  '******************************************************************************************
  ' Following block added in 4.13 --  Dim XXX as string * 12345
  ' Works in  UDT, GLOBALS, LOCALS, and RAW
  '******************************************************************************************

  FOR i = 1 TO Ndx
    IF iMatchWrd(Stk$[i],"as") THEN
      IF iMatchWrd(Stk$[i+1],"string") THEN
        IF Stk$[i+2] = "*" THEN
          Stk$[i]   = "["
          Stk$[i+1] = Stk$[i+3]
          Stk$[i+2] = "]"
          Stk$[i+3] = "as"
          INCR Ndx
          Stk$[Ndx] = "char"
          EXIT FOR
        END IF
      END IF
    END IF
  NEXT

  '******************************************************************************************
  FOR i = 1 TO Ndx
    IF NOT InFunc THEN
      IF iMatchWrd(Stk$[i],"global") THEN Stk$[i] = "dim"
    END IF
  NEXT

  A = FALSE
  FOR Tmp = 1 TO Ndx
    IF *Stk[Tmp] = ASC("0") AND NOT iMatchWrd(MID$(Stk$[Tmp],2,1),"x") AND NOT iMatchWrd(MID$(Stk$[Tmp],2,1),"l") THEN
      Stk$[Tmp] = LTRIM$(Stk$[Tmp],48)   'allow leading zero's in numbers
      IF Stk$[Tmp] = "" THEN Stk$[Tmp] = "0"
    END IF

    IF iMatchWrd(Stk$[Tmp],"xor") THEN
      Stk$[Tmp] = "^"
    ELSEIF Stk$[Tmp] = "=" AND Stk$[Tmp+1]= ">" THEN
      Stk$[Tmp] = ">"
      Stk$[Tmp+1]= "="
    ELSEIF Stk$[Tmp] = "=" AND Stk$[Tmp+1]= "<" THEN
      Stk$[Tmp] = "<"
      Stk$[Tmp+1] = "="
    ELSEIF Stk$[Tmp] = "<" AND Stk$[Tmp+1]= ">"  THEN
      Stk$[Tmp]  = "!="
      Stk$[Tmp+1] = ""
      A = TRUE
    ELSEIF Stk$[Tmp]  = ">" AND Stk$[Tmp+1]= "<" THEN
      Stk$[Tmp]   = "!="
      Stk$[Tmp+1] = ""
      A = TRUE
    ELSEIF Stk$[Tmp]= "!" AND Stk$[Tmp+1]= "=" THEN
      Stk$[Tmp]= "!="
      Stk$[Tmp+1] = ""
      A = TRUE
    END IF
  NEXT

  IF A = TRUE THEN CALL RemEmptyTokens

  '*************************************************************************
  ' needed when recursively calling parse() after <> has already translated
  ' to != Otherwise, on pass 2, it emits as !== which is NOT desired.
  '*************************************************************************

  CompToken = 0

  FOR Tmp = 1 TO Ndx
    A = CheckLocal(Stk$[Tmp], &i)
    IF A = vt_UNKNOWN THEN A = CheckGlobal(Stk$[Tmp], &i)
    IF A = vt_STRUCT OR A = vt_UDT OR A = vt_UNION THEN
      CompToken = 1
    END IF
    IF iMatchWrd(Stk$[Tmp],"int") AND Stk$[Tmp+1] = "(" THEN
      Stk$[Tmp]= "fint"
    ELSEIF iMatchWrd(Stk$[Tmp],"integer") THEN
      Stk$[Tmp]= "int"
    ELSEIF iMatchWrd(Stk$[Tmp],"fint") AND Stk$[Tmp+1]= ")" THEN
      Stk$[Tmp]= "int"
    END IF
  NEXT

  '*****************************
  CompPtr = 0

  FOR Tmp = 1 TO Ndx
    Keyword$ = LCASE$(Stk$[Tmp])
    a = INCHR("abcdefghijklmnopqrstuvwxyz", Keyword$)

    SELECT CASE a
      CASE 1
      SELECT CASE Keyword$
        CASE "abs"
        Stk$[Tmp]= "Abs"
        Use_Abs = Use_Proto = TRUE

        CASE "acos"
        Stk$[Tmp]= "acos"

        CASE "acosl"
        Stk$[Tmp]= "acosl"

        CASE "acosh"
        Stk$[Tmp]= "acosh"
        Use_Acosh = Use_Proto = TRUE

        CASE "appactivate"
        Stk$[Tmp]= "AppActivate"
        Use_AppActivate = UseFlag = Use_Instr = Use_Stristr = TRUE
        Use_Lcase = Use_Left = Use_StrStr = TRUE
        UseLCaseTbl = TRUE

        CASE "appexename$"
        Stk$[Tmp] = "AppExeName$()"
        Use_AppExeName = UseFlag = TRUE

        CASE "appexepath$"
        Stk$[Tmp] = "AppExePath$()"
        IF Stk$[Tmp+1]= "(" AND Stk$[Tmp+2]= ")" THEN
          Stk$[Tmp+1] = ""
          Stk$[Tmp+2] = ""
        END IF
        Use_AppExePath = UseFlag = TRUE

        CASE "ansitowide"
        Stk$[Tmp] = "AnsiToWide"
        Use_AnsiToWide = UseFlag = TRUE

        CASE "argc"
        Stk$[Tmp]= "argc"

        CASE "argv"
        Stk$[Tmp]= "argv"

        CASE "argv$"
        Stk$[Tmp]= "argv$"

        CASE "asc"
        i=0
        j=GetNumArgs(Tmp+2,&i)
        IF *Stk[Tmp+2] = *DQ$ THEN
          IF j > 0 OR *Stk[Tmp+3] <> ASC(")") THEN
            Stk$[Tmp] = "asc"
            Use_Asc = Use_Proto = TRUE
          ELSE
            IF Stk$[Tmp+2] = DDQ$ THEN
              Stk$[Tmp] = "0"
            ELSE
              Stk$[Tmp] = LTRIM$(STR$(ASC(Stk$[Tmp+2],1)))
            END IF
            Stk$[Tmp+1] = "" : Stk$[Tmp+2] = "" : Stk$[Tmp+3] = ""
          END IF
        ELSE
          IF j > 0 THEN Stk$[i] = "+"
          Stk$[Tmp] = "(UCHAR)*"
        END IF

        CASE "asin"
        Stk$[Tmp]= "asin"

        CASE "asinl"
        Stk$[Tmp]= "asinl"

        CASE "asinh"
        Stk$[Tmp]= "asinh"
        Use_Asinh = Use_Proto = TRUE

        CASE "atanh"
        Stk$[Tmp]= "atanh"
        Use_Atanh = Use_Proto = TRUE

        CASE "atn","atan"
        Stk$[Tmp]= "atan"

        CASE "atnl","atanl"
        Stk$[Tmp]= "atanl"

        CASE "auto"
        IF iMatchWrd(Stk$[Tmp+1],"local") THEN
          Stk$[Tmp] = "dim" : Stk$[Tmp+1] = "raw"
        ELSE
          Stk$[Tmp]= "auto"
        END IF
      END SELECT

      CASE  2
      SELECT CASE Keyword$

        CASE "bcopy"
        *Stk[1] = 0
        FOR i = Tmp+1 TO Ndx
          IF iMatchWrd(Stk$[i],"to") THEN EXIT FOR
          CONCAT(Stk$[1], Stk$[i]) 'Source
        NEXT
        *Stk[2] = 0
        FOR i = i+1 TO Ndx
          CONCAT(Stk$[2], Stk$[i]) 'Destination
        NEXT
        Src$ = "memmove(&" + Stk$[2] + ",&" + Stk$[1] + ",sizeof(" + Stk$[2] + "))"
        REMOVE "&*" FROM Src$
        Ndx = 0
        CALL XParse(Src$)

        CASE "bel$"
        Stk$[Tmp] = "BEL$"
        Use_BEL = UseFlag = TRUE

        CASE "bs$"
        Stk$[Tmp] = "BS$"
        Use_BS = UseFlag = TRUE

        CASE "bool","boolean"
        Stk$[Tmp]= "BOOL"

        CASE "band"
        Stk$[Tmp]= " BAND "
        Use_Band = TRUE
        Use_Sysmacros = TRUE

        CASE "bnot"
        Stk$[Tmp] = " BNOT "
        Use_Bnot  = Use_Sysmacros = TRUE

        CASE "bcx_dynacall"
        Stk$[Tmp] = "BCX_DynaCallA"
        Use_DynacallA = TRUE

        ' *******************************************************************
        ' Special Case Handler: Maintain case sensitivity for this structure
        ' *******************************************************************

        CASE "bff$"
        Stk$[Tmp] = "$$BFF$"
        Use_Bff = UseFlag = TRUE

        CASE "bin$"
        Stk$[Tmp] = "$$Bin$"
        Use_Bin = UseFlag = TRUE

        CASE "bool$"
        Stk$[Tmp] = "$$BoolStr$"
        Use_Boolstr = UseFlag = TRUE

        CASE "bin2dec"
        Stk$[Tmp]= "Bin2Dec"
        Use_Bin2dec = Use_Proto = TRUE

        CASE "boolean"
        Stk$[Tmp]= "BOOLEAN"

        CASE "bor"
        Stk$[Tmp]= " BOR "
        Use_Bor = Use_Sysmacros = TRUE

        CASE "byte"
        Stk$[Tmp]= "BYTE"
      END SELECT

      CASE 3
      SELECT CASE Keyword$

        CASE "cls"
        Stk$[Tmp] = "cls"

        CASE "containedin"
        Stk$[Tmp] = "containedin"
        Use_ContainedIn = TRUE

        CASE "cr$"
        Stk$[Tmp] = "CR$"
        Use_CR = UseFlag = TRUE

        CASE "close#"
        Stk$[Tmp] = "close"

        CASE "close"
        IF LEFT$(Stk$[Tmp+1],1)= "#" THEN
          Stk$[Tmp+1] = MID$(Stk$[Tmp+1],2)
        END IF

        CASE "closedialog"
        Ndx = 1
        IF ModDialogEvt THEN
          Stk$[1] = "EndDialog(hWnd,0)"
        ELSE
          Stk$[1] = "DestroyWindow(hWnd)"
        END IF

        CASE "cvd"
        Stk$[Tmp]="CVD"
        Use_Cvd = Use_Proto = TRUE

        CASE "cvi"
        Stk$[Tmp]="CVI"
        Use_Cvi = Use_Proto = TRUE

        CASE "cvl"
        Stk$[Tmp]="CVL"
        Use_Cvl = Use_Proto = TRUE

        CASE "cvld"
        Stk$[Tmp]="CVLD"
        Use_Cvld = Use_Proto = TRUE

        CASE "cvs"
        Stk$[Tmp]="CVS"
        Use_Cvs = Use_Proto = TRUE

        CASE "concat"
        Stk$[Tmp]= "strcat"

        CASE "chr$"
        Stk$[Tmp]= "$$chr$"
        Use_Chr = UseFlag = TRUE

        CASE "char"
        Stk$[Tmp]= "char"

        CASE "crlf$"
        Stk$[Tmp] = "CRLF$"
        Use_Crlf = UseFlag = TRUE

        CASE "cbctl"
        Stk$[Tmp]= "LOWORD(wParam)"

        CASE "cbctlmsg"
        Stk$[Tmp]= "HIWORD(wParam)"

        CASE "cbhndl"
        Stk$[Tmp]= "hWnd"

        CASE "cbhwnd"
        Stk$[Tmp]= "hWnd"

        CASE "cblparam"
        Stk$[Tmp]= "lParam"

        CASE "cbmsg"
        Stk$[Tmp]= "Msg"

        CASE "cbwparam"
        Stk$[Tmp]= "wParam"

        CASE "cdbl"
        Stk$[Tmp]= "CDBL"
        Use_Cdbl = Use_Sysmacros = TRUE

        CASE "center"
        Stk$[Tmp] = "Center"
        Use_Center = Use_Proto = TRUE

        CASE "cint"
        Stk$[Tmp]= "Cint"
        Use_Cint = Use_Proto = TRUE

        CASE "cldbl"
        Stk$[Tmp]= "CLDBL"
        Use_Cldbl = Use_Sysmacros = TRUE

        CASE "clng"
        Stk$[Tmp]= "CLNG"
        Use_Clng = Use_Proto = TRUE

        CASE "color", "color_fg", "color_bg"
        Stk$[Tmp] = LCASE$(Stk$[Tmp])
        Use_Color = Use_Console = Use_Proto = TRUE

        CASE "comboboxloadfile"
        Stk$[Tmp] = "ComboBoxLoadFile"
        Use_ComboBoxLoadFile = TRUE
        Use_Proto   = TRUE
        Use_Trim    = TRUE
        UseFlag     = TRUE

        CASE "colorref"
        Stk$[Tmp]= "COLORREF"

        CASE "cos"
        Stk$[Tmp]= "cos"

        CASE "cosl"
        Stk$[Tmp]= "cosl"

        CASE "cosh"
        Stk$[Tmp]= "cosh"

        CASE "cbool"
        Stk$[Tmp] = "CBOOL"
        Use_Cbool = Use_Sysmacros = TRUE
        DIM AUTO fp AS functionParse, i, t, expos = 0

        IF SepFuncArgs(Tmp+1, &fp, TRUE) = 0 THEN Abort("No argument specified in CBOOL")
        FOR i = fp.CommaPos[0] TO fp.CommaPos[1]
          t = INCHR("!<>=", Stk$[i])
          IF t THEN
            IF t < 4 THEN
              IF Stk$[i+1] = "=" THEN
                Stk$[i] = Stk$[i] + Stk$[i+1]
                Stk$[i+1] = ""
              ELSEIF t = 1 AND Stk$[i] <> "!=" THEN
                ITERATE
              END IF
            ELSE
              IF Stk$[i+1] <> "=" THEN Stk$[i] = "=="
            END IF
            expos = i
            EXIT FOR
          END IF
        NEXT

        t = DataType(Stk$[expos-1])
        IF t = vt_STRLIT OR t = vt_STRVAR THEN
          IF expos THEN
            Stk$[Tmp+1] = Stk$[Tmp+1] + "strcmp("
            Stk$[fp.CommaPos[1]] = ")" + Stk$[expos] + "0)"
            Stk$[expos] = ","
            Src$ = ""
            FOR i = 1 TO Ndx
              Src$ = Src$ + Stk$[i] + SPC$
            NEXT
            FastLexer(Src$," ","(),")
          END IF
        END IF

        CASE "csng"
        Stk$[Tmp]= "CSNG"
        Use_Csng = Use_Sysmacros = TRUE

        CASE "cursorx"
        Stk$[Tmp] = "Pos()"
        Use_Pos  = Use_Proto = TRUE

        CASE "csrlin","cursory"
        Stk$[Tmp]  = "Csrlin()"
        Use_Csrlin = Use_Proto  = TRUE

        CASE "c_declare"
        CallType$ = "__cdecl "
        Stk$[Tmp]= "declare"
        IF iMatchWrd(Stk$[4], "lib") THEN
          NoTypeDeclare = FALSE
        ELSE
          NoTypeDeclare = TRUE
        END IF

      END SELECT

      CASE 4
      SELECT CASE Keyword$

	    CASE "delay"
		Stk$[Tmp] = "delay"
		
        CASE "dpeek"
        Stk$[Tmp] = "dpeek"

        CASE "declare"
        CallType$ = "__stdcall "
        Stk$[Tmp]= "declare"
        IF NOT iMatchWrd(Stk$[4], "lib") THEN
          NoTypeDeclare = TRUE
        ELSE
          NoTypeDeclare = FALSE
        END IF

        CASE "dq$"
        Stk$[Tmp] = "DQ$"
        Use_DQ = UseFlag = TRUE

        CASE "ddq$"
        Stk$[Tmp] = "DDQ$"
        Use_DDQ = UseFlag = TRUE

        CASE "data$"
        Stk$[Tmp]= "DATA$"

        CASE "date$"
        Stk$[Tmp] = "_strdate$(Date)"
        Use_Date = UseFlag = TRUE

        CASE "delete"
        IF UseCpp = FALSE THEN Abort( "'DELETE' can only be used with C++" )
        Stk$[Tmp]="delete "

        CASE "del$"
        Stk$[Tmp]= "del$"
        Use_Del = UseFlag = Use_Proto = TRUE

        CASE "double"
        Stk$[Tmp]= "double"

        CASE "dsplit"
        Stk$[Tmp]= "DSplit"
        Use_Proto  = TRUE
        UseFlag    = TRUE
        Use_DSplit = TRUE
        Use_Remove = TRUE
        Use_StrStr = TRUE
        Use_Mid    = TRUE
        Use_Left   = TRUE
        Use_Instr  = TRUE
        Use_Stristr = TRUE
        UseLCaseTbl = TRUE

        CASE "dword"
        Stk$[Tmp]= "DWORD"
      END SELECT

      CASE  5
      SELECT CASE Keyword$

        CASE "enddraw"
        Stk$[Tmp]= "EndDraw"
        Use_Draw = TRUE

        CASE "endmodal"
        Stk$[Tmp] = "EndModal"
        Use_Show = Use_Sysmacros = Use_ShowModal = Use_EndModal = TRUE

        CASE "extern"
        Stk$[Tmp] = "extern"

        CASE "editloadfile"
        Stk$[Tmp]= "EditLoadFile"
        Use_Elf     = TRUE
        Use_Exist   = TRUE
        Use_Get     = TRUE
        Use_Lof     = TRUE
        Use_Proto   = TRUE
        Use_Join    = TRUE
        UseFlag     = TRUE
        Use_Sysmacros = TRUE

        CASE "enc$"
        Stk$[Tmp]= "$$enc$"
        Use_Enclose = UseFlag = TRUE

        CASE "extract$"
        Stk$[Tmp]= "$$extract$"
        Use_Extract = Use_StrStr = UseFlag = TRUE

        CASE "eof$"
        Stk$[Tmp] = "EF$"
        Use_EOF = UseFlag = TRUE

        CASE "esc$"
        Stk$[Tmp] = "ESC$"
        Use_ESC = UseFlag = TRUE

        CASE "enum"
        IF Ndx = 1 THEN
          Use_EnumFile = TRUE
          '******************************************************
          '     We're dealing with a ENUM - END ENUM block
          '******************************************************
          DIM RAW EnumFlag = FALSE
          FPRINT FP11,""
          FPRINT FP11,"enum"
          FPRINT FP11,"  {"
          Src$ = ""
          WHILE NOT iMatchLft(Src$,"end ")
            IF EOF(SourceFile) THEN Abort ("Unbalanced ENUM")
            LINE INPUT SourceFile,Src$
            ModuleLineNos[ModuleNdx]++
            CALL StripCode(Src$)
            IF iMatchLft(Src$,"$comme") THEN
              Directives()
              ITERATE
            END IF
            Src$ = TRIM$(Src$)
            IF Src$ = "" THEN ITERATE ' line starts with comment
            IF LCASE$(LEFT$(Src$ + " ",4)) = "end " THEN
              EXIT LOOP
            ELSE
              IF EnumFlag = FALSE THEN
                EnumFlag = TRUE
              ELSE
                FPRINT FP11,","
              END IF
            END IF
            FPRINT FP11,"    ",RTRIM$(Src$);
          WEND
          Src$ = ""
          Ndx = 0
          FPRINT FP11,""
          FPRINT FP11,"  };\n"
          EXIT SUB
        END IF

        '*************************************************************
        '  We're dealing with a smaller, single line ENUM statement
        '*************************************************************

        Stk$[1] = "enum {"
        FOR j = 2 TO Ndx
          CONCAT (Stk$[1], Stk$[j])
        NEXT
        CONCAT (Stk$[1], "}")
        Ndx = 1

        CASE "environ$"
        Stk$[Tmp]= "Environ$"
        Use_Environ = UseFlag = TRUE

        CASE "exist"
        Stk$[Tmp]= "Exist"
        Use_Exist = Use_Proto = UseFlag = TRUE

        CASE "exp"
        Stk$[Tmp]= "Exp"
        Use_Exp = Use_Proto = TRUE

      END SELECT

      CASE  6
      SELECT CASE Keyword$

        CASE "freeglobals"
        Stk$[Tmp] = "FreeGlobals"

        CASE "ff$"
        Stk$[Tmp] = "FF$"
        Use_FF = UseFlag = TRUE

        CASE "function"
        IF Stk$[Tmp+1] = "=" THEN
          IF Stk$[Tmp+2] = DDQ$ THEN Stk$[Tmp+2] = "NUL$"
          Stk$[Tmp] = "functionreturn"
        END IF

        CASE "false"
        Stk$[Tmp]= "FALSE"

        CASE "file"
        Stk$[Tmp]= "FILE"

        CASE "findintype"

        'Convert this :FindInType(char *Token, Type.member, int c)
        'To this      :FindInType(char *Token, Stptr + offsetof(Type,member), sizeof(Type), int c)

        Stk$[Tmp]= "FindInType"
        Use_FindInType = Use_Proto = TRUE

        DIM RAW StMem$, StName$, VarName$
        DIM AUTO fp AS functionParse
        CALL SepFuncArgs(Tmp, &fp, TRUE)

        StMem$   = REMAIN$(Clean$(GetArg$(2, &fp)),".")
        VarName$ = EXTRACT$(Clean$(GetArg$(2, &fp)),".")

        FOR j = fp.CommaPos[1] + 1 TO fp.CommaPos[2] - 1
          Stk$[j] = ""
        NEXT

        IF CheckLocal(VarName$,&i) <> vt_UNKNOWN THEN
          StName$ = TypeDefs[LocalVars[i].VarDef].VarName$
        ELSEIF CheckGlobal(VarName$,&i) <> vt_UNKNOWN THEN
          StName$ = TypeDefs[GlobalVars[i].VarDef].VarName$
        END IF

        j = fp.CommaPos[1] + 1
        Stk$[j] =  "(char*)" & VarName$ & " + offsetof(" & StName$ & "," & StMem$ & "), sizeof(" & StName$ & ")"

        CASE "farproc"
        Stk$[Tmp] = "FARPROC"

        CASE "fillarray"
        Stk$[Tmp] = "fillarray"
        Use_FillArray = TRUE
        Use_Proto = TRUE

        CASE "findfirst$"
        Stk$[Tmp]= "findfirst$"
        Use_Findfirst = UseFlag = TRUE

        CASE "findfirstinstance"
        Stk$[Tmp]= "FindFirstInstance"
        Use_FirstInstance = TRUE

        CASE "findnext$"
        Stk$[Tmp]= "findnext$()"
        IF Stk$[Tmp+1]= "(" AND Stk$[Tmp+2]= ")" THEN
          Stk$[Tmp+1] = ""
          Stk$[Tmp+2] = ""
        END IF
        Use_Findnext = UseFlag = TRUE

        CASE "fint"
        Stk$[Tmp]= "FINT"
        Use_Fint = Use_Sysmacros = TRUE

        CASE "fix"
        Stk$[Tmp]= "FIX"
        Use_Fix = Use_Sysmacros = TRUE

        CASE "filelocked"
        Stk$[Tmp]= "FileLocked"
        Use_FileLocked = Use_Proto = TRUE

        CASE "flush"
        Stk$[Tmp]= "fflush"

        CASE "frac"
        Stk$[Tmp]= "FRAC"
        Use_Fix = Use_Frac = Use_Sysmacros = TRUE

        CASE "fracl"
        Stk$[Tmp]= "FRACL"
        Use_Fix = Use_Fracl = Use_Sysmacros = TRUE
      END SELECT

      CASE  7
      SELECT CASE Keyword$

        CASE "getpad"
		Stk$[Tmp]= "GETPAD"

        CASE "getdimension"
        Stk$[Tmp] = "GetDimension"
        Use_GetDimension = Use_Proto = TRUE

        CASE "getprocaddress"
        LOCAL GlobalName$, s, ss, tempA$
        GlobalName$ = Stk$[Tmp-2]
        ss = HashNumber(GlobalName$)
        WHILE GlobalVarHash[ss]
          s = GlobalVarHash[ss]
          IF GlobalName$ = GlobalVars[s].VarName$ THEN
            tempA$ = TypeDefs[GlobalVars[s].VarDef].VarName$
            IF GlobalVars[s].VarPntr THEN
              tempA$=tempA$+" *"
            END IF
          END IF
          ss = IMOD(ss + 1,MaxGlobalVars)
        WEND
        IF tempA$ = "" THEN
          LOCAL LocalName$
          LocalName$ = Stk$[Tmp-2]
          IF LocalVarCnt THEN
            FOR INTEGER i = 1 TO LocalVarCnt
              IF LocalName$ = LocalVars[i].VarName$ THEN
                tempA$ = TypeDefs[LocalVars[i].VarDef].VarName$
                IF LocalVars[i].VarPntr THEN
                  tempA$ = tempA$ + " *"
                END IF
                EXIT FOR
              END IF
            NEXT
          END IF
        END IF
        IF tempA$ <> "" THEN
          Stk$[Tmp]= "(" + tempA$ + ")GetProcAddress"
        ELSE
          Stk$[Tmp]= "GetProcAddress"
        END IF

        CASE "getattr"
        Stk$[Tmp]= "GETATTR"
        Use_Getattr = Use_Sysmacros = TRUE

        CASE "gettextsize"
        Stk$[Tmp] = "GetTextSize"
        Use_GetTextSize = Use_Proto = TRUE

        CASE "getbvalue"
        Stk$[Tmp]= "GetBValue"

        CASE "getc"
        Stk$[Tmp]= "getc"

        CASE "getdrive"
        Stk$[Tmp]= "_getdrive()"
        IF Stk$[Tmp+1]= "(" AND Stk$[Tmp+2]= ")" THEN
          Stk$[Tmp+1] = ""
          Stk$[Tmp+2] = ""
        END IF
        Use_Getdrive = Use_Proto = TRUE

        CASE "getfilename$"
        Stk$[Tmp] = "$$GetFileName$"
        Use_Getfilename = Use_Hook = TRUE

        CASE "getgvalue"
        Stk$[Tmp]= "GetGValue"

        CASE "getrvalue"
        Stk$[Tmp]= "GetRValue"

        CASE "getresource"
        Stk$[Tmp] = "GetResource"
        Use_GetResource = Use_Proto = TRUE

        CASE "getspecialfolder$", "getspecialfolder"
        Stk$[Tmp] = "$$GetSpecialFolder$"
        Use_GetSpecialFolder = TRUE
        Use_Proto = UseFlag  = TRUE

      END SELECT

      CASE  8
      SELECT CASE Keyword$

        CASE "hiword"
        Stk$[Tmp]= "HIWORD"

        CASE "hex$"
        Stk$[Tmp]= "hex$"
        Use_Hex = UseFlag = TRUE

        CASE "hex2dec"
        Stk$[Tmp]= "Hex2Dec"
        Use_Hex2Dec = UseLCaseTbl = Use_Proto = TRUE

        CASE "hibyte"
        Stk$[Tmp]= "HIBYTE"

        CASE "hide"
        Stk$[Tmp]= "Hide"
        Use_Hide = Use_Sysmacros = TRUE

        CASE "hypot"
        Stk$[Tmp]= "hypot"
      END SELECT

      CASE  9
      SELECT CASE Keyword$

        CASE "instr"
        Stk$[Tmp]= "instr"
        Use_Instr = Use_StrStr = Use_Proto = TRUE
        Use_Stristr = UseLCaseTbl = TRUE

        CASE "inchr"
        Stk$[Tmp]= "inchr"
        Use_Inchr = Use_Proto = TRUE

        CASE "imod"
        Stk$[Tmp]= "imod"
        Use_Imod = Use_Sysmacros = TRUE

        CASE "iif"
        Stk$[Tmp]= "iif"
        Use_Iif = Use_Proto = TRUE
        FOR i = Tmp+1 TO Ndx
          IF Stk$[i] = "=" THEN
            IF Stk$[i-1] <> "<" AND Stk$[i-1] <> ">" THEN
              Stk$[i] = "=="
            END IF
          END IF
        NEXT

        CASE "iif$"
        Stk$[Tmp]= "sziif$"
        Use_sziif = Use_Proto = TRUE
        FOR i = Tmp+1 TO Ndx
          IF Stk$[i] = "=" THEN
            IF Stk$[i-1] <> "<" AND Stk$[i-1] <> ">" THEN
              Stk$[i] = "=="
            END IF
          END IF
        NEXT

        CASE "inkey"
        UseFlag = Use_Proto = Use_InkeyD = TRUE
        Stk$[Tmp]= "inkeyd()"
        IF Stk$[Tmp+1]= "(" AND Stk$[Tmp+2]= ")" THEN
          Stk$[Tmp+1] = ""
          Stk$[Tmp+2] = ""
        END IF

        CASE "inkey$"
        UseFlag = Use_Proto = Use_Inkey = TRUE
        Stk$[Tmp]= "inkey$()"
        IF Stk$[Tmp+1]= "(" AND Stk$[Tmp+2]= ")" THEN
          Stk$[Tmp+1] = ""
          Stk$[Tmp+2] = ""
        END IF

        CASE "inp"
        Stk$[Tmp]= "Inp"
        Use_Inp = Use_Sysmacros = TRUE

        CASE "inputbox$"
        Stk$[Tmp] = "InputBox$"
        Use_Inputbox = UseFlag = TRUE


        CASE "infobox"
        Stk$[Tmp] = "InfoBox"
        Use_Infobox = UseFlag = TRUE

        CASE "inpw"
        Stk$[Tmp]= "Inpw"
        Use_Inpw = Use_Sysmacros = TRUE

        CASE "ins$"
        Stk$[Tmp]= "ins$"
        Use_Ins = Use_Proto = UseFlag = TRUE

        CASE "instat"
        Stk$[Tmp]= "kbhit()"

        CASE "instrrev"
        Stk$[Tmp]= "InstrRev"
        Use_Instrrev = Use_Proto = TRUE

        CASE "isptr"
        Stk$[Tmp]= "IsPtr"
        Use_Isptr = Use_Sysmacros = TRUE

        CASE "ireplace$"
        Stk$[Tmp]= "iReplace$"
        Use_iReplace = Use_Stristr = UseFlag = TRUE
        UseLCaseTbl = TRUE

        CASE "iremove$"
        Stk$[Tmp]= "IRemoveStr$"
        Use_IRemove = UseFlag = TRUE
        Use_Stristr = UseLCaseTbl = TRUE

        CASE "iterate"
        Stk$[Tmp]= "continue"
      END SELECT

      CASE  10
      SELECT CASE Keyword$
        CASE "join$"
        Stk$[Tmp]= "$$join$"
        Use_Join = UseFlag = TRUE
      END SELECT

      CASE  11

      CASE  12
      SELECT CASE Keyword$

        CASE "lpeek"
        Stk$[Tmp] = "lpeek"
          
        CASE "loadfile$"
        Stk$[Tmp]= "$$LoadFile$"
        Use_LoadFile = Use_Get = UseFlag = TRUE
        Use_Sysmacros = Use_Exist = Use_Lof = TRUE

        CASE "listboxloadfile"
        Stk$[Tmp] = "ListBoxLoadFile"
        Use_ListBoxLoadFile = TRUE
        Use_GetTextSize     = TRUE
        Use_Proto   = TRUE
        Use_Trim    = TRUE
        Use_String  = TRUE
        UseFlag     = TRUE

        CASE "lf$"
        Stk$[Tmp] = "LF$"
        Use_LF = UseFlag = TRUE

        CASE "line"
        IF iMatchWrd(Stk$[Tmp+1],"input") THEN
          Stk$[Tmp] = "lineinput"
          j = Tmp + 4
          Stk$[Tmp+1] = ""      ' Extract the file handle
          FOR i = Tmp+2 TO Ndx
            IF *Stk$[i] = ASC(",") THEN j=i+1 : EXIT FOR
            Stk$[Tmp+1] = Stk$[Tmp+1] + Stk$[i]
            Stk$[i] = ""
          NEXT j

          FOR i = j TO Ndx
            Stk$[Tmp+2]= Stk$[Tmp+2] & Stk$[i]
          NEXT
        END IF

        CASE "lcase$"
        Stk$[Tmp] = "$$lcase$"
        Use_Lcase = UseFlag = TRUE

        CASE "ldouble"
        Stk$[Tmp] = "LDOUBLE"
        Use_Ldouble = UseFlag = TRUE

        CASE "left$"
        Stk$[Tmp]= "$$left$"
        Use_Left = UseFlag = TRUE

        CASE "long"
        Stk$[Tmp]= "long"

        CASE "longlong"
        Stk$[Tmp] = "LONGLONG"

        CASE "lpbyte"
        Stk$[Tmp] = "LPBYTE"

        CASE "len"
        Stk$[Tmp]= "strlen"

        CASE "lprint"
        Stk$[Tmp]= "lprint"
        IF Tmp = Ndx THEN
          Ndx++
          Stk$[Ndx] = ENC$ ("")  ' Allow LPRINT with no args
        END IF

        CASE "lpad$"
        Stk$[Tmp]= "$$lpad$"
        Use_Lpad = UseFlag = TRUE

        CASE "ltrim$"
        Stk$[Tmp]= "$$ltrim$"
        Use_Ltrim = UseFlag = TRUE

        CASE "lof"
        Stk$[Tmp]= "lof"
        IF DataType(Stk$[Tmp + 2]) = vt_NUMBER THEN
          Stk$[Tmp + 2] = "FP" + Stk$[Tmp + 2]
        END IF
        Use_Lof = Use_Proto = TRUE

        CASE "loadlibrary", "load_dll"
        Stk$[Tmp]= "LoadLibrary"

        CASE "like"
        Stk$[Tmp] = "like"
        Use_Like  = Use_Proto = TRUE

        CASE "lobyte"
        Stk$[Tmp]= "LOBYTE"

        CASE "loc"
        IF DataType(Stk$[Tmp + 2]) = vt_NUMBER THEN
          Stk$[Tmp + 2] = "FP" + Stk$[Tmp + 2]
        END IF
        Stk$[Tmp] = "loc(" + Stk$[Tmp + 2] + "," + Stk$[Tmp + 2] + "len)"
        Stk$[Tmp + 1] = ""
        Stk$[Tmp + 2] = ""
        Stk$[Tmp + 3] = ""
        Use_Loc = TRUE

        CASE "locate"
        Use_Locate = Use_Console = Use_Proto = TRUE

        CASE "log"
        Stk$[Tmp]= "log"

        CASE "logl"
        Stk$[Tmp]= "logl"

        CASE "log10"
        Stk$[Tmp]= "log10"

        CASE "log10l"
        Stk$[Tmp]= "log10l"

        CASE "loword"
        Stk$[Tmp]= "LOWORD"

        CASE "lpstr"
        Stk$[Tmp]= "LPSTR"
      END SELECT

      CASE  13
      SELECT CASE Keyword$

        CASE "mkd$"
        IF Tmp > 2 THEN
          IF INCHR(Stk$[Tmp-2],"$") AND *Stk$[Tmp-1] = ASC("=") THEN
            Stk$[1] = "memcpy(" + Stk$[1]
            Stk$[Tmp-1] = ","
            Stk$[++Ndx] = ",9)"
          END IF
        END IF
        Stk$[Tmp]="MKD"
        Use_Mkd = UseFlag = TRUE

        CASE "mki$"
        IF Tmp > 2 THEN
          IF INCHR(Stk$[Tmp-2],"$") AND *Stk$[Tmp-1] = ASC("=") THEN
            Stk$[1] = "memcpy(" + Stk$[1]
            Stk$[Tmp-1] = ","
            Stk$[++Ndx] = ",3)"
          END IF
        END IF
        Stk$[Tmp]="MKI"
        Use_Mki = UseFlag = TRUE

        CASE "mkl$"
        IF Tmp > 2 THEN
          IF INCHR(Stk$[Tmp-2],"$") AND *Stk$[Tmp-1] = ASC("=") THEN
            Stk$[1] = "memcpy(" + Stk$[1]
            Stk$[Tmp-1] = ","
            Stk$[++Ndx] = ",5)"
          END IF
        END IF
        Stk$[Tmp]="MKL"
        Use_Mkl = UseFlag = TRUE

        CASE "mkld$"
        IF Tmp > 2 THEN
          IF INCHR(Stk$[Tmp-2],"$") AND *Stk$[Tmp-1] = ASC("=") THEN
            Stk$[1] = "memcpy(" + Stk$[1]
            Stk$[Tmp-1] = ","
            Stk$[++Ndx] = ",11)"
          END IF
        END IF
        Stk$[Tmp]="MKLD"
        Use_Mkld = UseFlag = TRUE

        CASE "mks$"
        IF Tmp > 2 THEN
          IF INCHR(Stk$[Tmp-2],"$") AND *Stk$[Tmp-1] = ASC("=") THEN
            Stk$[1] = "memcpy(" + Stk$[1]
            Stk$[Tmp-1] = ","
            Stk$[++Ndx] = ",5)"
          END IF
        END IF
        Stk$[Tmp]="MKS"
        Use_Mks = UseFlag = TRUE

        CASE "mid$"
        IF Tmp > 1 THEN
          Stk$[Tmp]= "$$mid$"
          Use_Mid = UseFlag = TRUE
        ELSE
          Stk$[Tmp]= "midstr"
          Use_Midstr = TRUE
        END IF

        CASE "min"
        Stk$[Tmp]= "MIN"
        Use_Min = Use_Proto = TRUE

        CASE "main"
        Stk$[Tmp]= "main"

        CASE "makeintresource"
        Stk$[Tmp]= "MAKEINTRESOURCE"

        CASE "makelong"
        Stk$[Tmp]= "MAKELONG"

        CASE "makeword"
        Stk$[Tmp]= "MAKEWORD"

        CASE "max"
        Stk$[Tmp]= "MAX"
        Use_Max = Use_Proto = TRUE

        CASE "mcase$"
        Stk$[Tmp] = "$$mcase$"
        Use_Mcase = UseFlag = TRUE

        CASE "mod"
        Stk$[Tmp]= "fmod"

        CASE "modstyle"
        Stk$[Tmp]= "ModStyle"
        Use_Modstyle = Use_Proto = TRUE

        CASE "msgbox"
        IF Stk$[Tmp-1]= "=" OR iMatchWrd(Stk$[Tmp-1], "if") OR iMatchWrd(Stk$[Tmp-1], "elseif") THEN
          Stk$[Tmp]= "MsgBox"
          Use_Msgbox = Use_Proto = TRUE
        END IF
      END SELECT

      CASE  14
      SELECT CASE Keyword$

        CASE "new"
        IF iMatchWrd(Stk$[Tmp-1],"binary") THEN EXIT
        IF UseCpp = FALSE THEN Abort( "'NEW' can only be used with C++" )
        Stk$[Tmp] = "new "

        CASE "nosort"
        Stk$[Tmp] = "WS_CHILD|WS_VISIBLE|WS_VSCROLL"

        CASE "nul$"
        Stk$[Tmp] = "NUL$"
        Use_NUL = UseFlag = TRUE

        CASE "null"
        Stk$[Tmp]= "NULL"

        CASE "now$"
        Stk$[Tmp]= "now$()"
        Use_Now = UseFlag = TRUE
      END SELECT

      CASE  15
      SELECT CASE Keyword$

        CASE "open"
        FOR A = Tmp+1 TO Ndx
          IF LEFT$(Stk$[A],1) = "#" THEN
            Stk$[A] = MID$(Stk$[A],2)
            EXIT FOR
          END IF
        NEXT

        CASE "oct$"
        Stk$[Tmp]= "oct$"
        Use_Oct = UseFlag = TRUE

        CASE "outp"
        Stk$[Tmp]= "Outp"
        Use_Outp = Use_Sysmacros = TRUE

        CASE "outpw"
        Stk$[Tmp]= "Outpw"
        Use_Outpw = Use_Sysmacros = TRUE

      END SELECT

      CASE  16
      SELECT CASE Keyword$

        CASE "peek"
        Stk$[Tmp] = "peek"

        CASE "plot"
        Stk$[Tmp] = "plot"

        CASE "preserve"
        Stk$[Tmp] = "PRESERVE"

        CASE "print#"
        Stk$[Tmp] = "fprint"

        CASE "print"
        IF LEFT$(Stk$[Tmp+1],1)= "#" THEN
          Stk$[Tmp] = "fprint"
          Stk$[Tmp+1] = MID$(Stk$[Tmp+1],2)
        END IF

        CASE "ptr"
        CompPtr = 1
        Stk$[Tmp-1] = Stk$[Tmp-1] + "*"
        Stk$[Tmp]= ""
        IF Tmp = Ndx THEN
          Ndx--
          WHILE TALLY(Stk$[Ndx],"*") = LEN(Stk$[Ndx])
            Stk$[Ndx-1] = Stk$[Ndx-1] + Stk$[Ndx]
            Stk$[Ndx] = ""
            Ndx--
          WEND
        ELSE
          i = Tmp-1
          WHILE TALLY(Stk$[i],"*") = LEN(Stk$[i])
            Stk$[i-1] = Stk$[i-1] + Stk$[i]
            Stk$[i] = ""
            i--
          WEND
        END IF

        CASE "panel"
        Stk$[Tmp] = "panel"
        Use_Panel = Use_Console = Use_Proto = TRUE

        CASE "peek$"
        Stk$[Tmp]= "$$peekstr$"
        Use_PeekStr = UseFlag = TRUE

        CASE "pos"
        Stk$[Tmp] = "Pos()"
        Use_Pos   = Use_Proto = TRUE

        CASE "pow"
        Stk$[Tmp]= "pow"

        CASE "powl"
        Stk$[Tmp]= "powl"

        CASE "private"
        IF iMatchWrd(Stk$[Tmp+1],"const") THEN
          Stk$[Tmp]= "enum "
          Stk$[Tmp+1]= Stk$[Tmp+2] + "{"
          Ndx++
          Stk$[Ndx]= "}"
        END IF
      END SELECT

      CASE  17
      SELECT CASE Keyword$
        CASE "qbcolor"
        Stk$[Tmp]= "qbcolor"
        Use_QBColor = Use_Proto = TRUE
      END SELECT

      CASE  18
      SELECT CASE Keyword$

        CASE "rsetlist"
		Stk$[Tmp]= "RSETLIST"

        CASE "rsetobj"
        Stk$[Tmp]= "RSETOBJ"

        CASE "rgetobj"
        Stk$[Tmp]= "RGETOBJ"

        CASE "rupdall"
		Stk$[Tmp]= "RUPDALL"

		CASE "rparti"
		
		'Stk$[Tmp]= "RPARTI(int *)"+Stk$[Tmp+2]+");"
		Stk$[Tmp+1]= "((int *)"
		'Stk$[Tmp+2]= ""
		
		
        CASE "rhit"
        Stk$[Tmp]= "RHIT"

        CASE "rewind"
        Stk$[Tmp]= "rewind"
        IF DataType(Stk$[Tmp + 2]) = vt_NUMBER THEN
          Stk$[Tmp + 2] = "FP" + Stk$[Tmp + 2]
        END IF

        CASE "remove$"
        Stk$[Tmp]= "$$RemoveStr$"
        Use_Remove = Use_StrStr = UseFlag = TRUE

        CASE "replace$"
        Stk$[Tmp]= "$$replace$"
        Use_Replace = Use_StrStr = UseFlag = TRUE

        CASE "right$"
        Stk$[Tmp]= "$$right$"
        Use_Right = UseFlag = TRUE

        CASE "rename"
        Stk$[Tmp]= "rename"

        CASE "register"
        Stk$[Tmp]= "register"

        CASE "randomize"
        Stk$[Tmp]= "randomize"
        Use_Randomize = TRUE
        Use_Rnd   = TRUE
        Use_Proto = TRUE
        IF Ndx = 1 THEN
          Use_Timer = TRUE
          Stk$[1] ="randomize(timer())"
        END IF

        CASE "rec"
        IF DataType(Stk$[Tmp + 2]) = vt_NUMBER THEN
          Stk$[Tmp + 2] = "FP" + Stk$[Tmp + 2]
        END IF
        Stk$[Tmp] = "rec(" + Stk$[Tmp + 2] + "," + Stk$[Tmp + 2] + "len)"
        Stk$[Tmp + 1] = ""
        Stk$[Tmp + 2] = ""
        Stk$[Tmp + 3] = ""
        Use_Rec = Use_Proto = TRUE

        CASE "reccount"
        DIM RAW length$

        IF DataType(Stk$[Tmp + 2]) = vt_NUMBER THEN
          Stk$[Tmp + 2] = "FP" + Stk$[Tmp + 2]
        END IF

        Stk$[Tmp] = "reccount"
        length$ = Stk$[Tmp + 2] + "len)"

        FOR i = Tmp+1 TO Ndx
          IF *Stk$[i] = ASC(")") THEN
            Stk$[i] = ""
            EXIT FOR
          END IF
          Stk$[Tmp] = Stk$[Tmp] + Stk$[i]
          Stk$[i] = ""
        NEXT i

        Stk$[Tmp] = Stk$[Tmp] + "," + length$
        Use_RecCount = Use_Proto = TRUE

        CASE "reclen"
        Stk$[Tmp] = "reclen"

        CASE "record"
        Stk$[Tmp] = "record"

        CASE "refresh"
        Stk$[Tmp]= "Refresh"
        Use_Refresh = Use_Sysmacros = TRUE

        CASE "remain$"
        Stk$[Tmp]= "$$remain$"
        Use_Remain = UseFlag = TRUE

        CASE "retain$"
        Stk$[Tmp]= "$$Retain$"
        Use_Retain = UseFlag = TRUE

        CASE "repeat$"
        Stk$[Tmp]= "$$repeat$"
        Use_Repeat = UseFlag = TRUE

        CASE "reverse$"
        Stk$[Tmp]= "$$reverse$"
        Use_Reverse = UseFlag = TRUE

        CASE "rgb"
        Stk$[Tmp]= "RGB"

        CASE "rnd"
        Stk$[Tmp]= "rnd()"
        IF Stk$[Tmp+1]= "(" AND Stk$[Tmp+2]= ")" THEN
          Stk$[Tmp+1] = ""
          Stk$[Tmp+2] = ""
        END IF
        Use_Rnd = Use_Proto = TRUE

        CASE "round"
        Stk$[Tmp]= "Round"
        Use_Round = Use_Proto = TRUE

        CASE "rpad$"
        Stk$[Tmp]= "$$rpad$"
        Use_Rpad = UseFlag = TRUE

        CASE "rtrim$"
        Stk$[Tmp]= "$$rtrim$"
        Use_Rtrim = UseFlag = TRUE
      END SELECT

      CASE  19
      SELECT CASE Keyword$

        CASE "sndkill"
        Stk$[Tmp]= "SNDKILL"

        CASE "sndplayfreq"
        Stk$[Tmp]= "SNDPLAYFREQ"

        CASE "snddelta"
        Stk$[Tmp]= "SNDDELTA"

        CASE "sndfreq"
        Stk$[Tmp]= "SNDFREQ"

        CASE "sndvolreset"
        Stk$[Tmp]= "SNDVOLRESET"

        CASE "setdimension"
        Stk$[Tmp] = "SetDimension"
        Use_SetDimension = Use_Proto = TRUE

        CASE "sprint"
        Stk$[Tmp]= "sprint"

        CASE "spc$"
        Stk$[Tmp] = "SPC$"
        Use_SPC = UseFlag = TRUE

        CASE "startdraw"
        Stk$[Tmp]= "StartDraw"
        Use_Draw = TRUE

        CASE "str$"
        Stk$[Tmp]= "$$str$"
        Use_Str = UseFlag = TRUE

        CASE "strl$"
        Stk$[Tmp]= "$$strl$"
        Use_Strl = UseFlag = TRUE

        CASE "searchpath$"
        Stk$[Tmp]= "$$SEARCHPATH$"
        Use_SearchPath = UseFlag  = TRUE

        CASE "sizeof"
        Stk$[Tmp]= "sizeof"

        CASE "sendmessage", "sndmsg"
        '*****************************
        '    SendMessage HELPER
        '*****************************
        IF NOT iMatchWrd(Stk$[1],"const") THEN
          Stk$[Tmp] = "SendMessage"
          Comma = i = 0
          A = Tmp+1

          DO
            IF A > Ndx THEN Abort("Malformed SendMessage")
            A++
            IF INCHR("([{",Stk$[A]) THEN INCR i
            IF INCHR(")]}",Stk$[A]) THEN DECR i
            IF i <> 0 THEN ITERATE

            IF *Stk$[A] = ASC(",") THEN
              IF Comma = 0 THEN
                IF NOT iMatchWrd(Stk$[A+2],"UINT") THEN
                  InsertTokens(A,3,"(","UINT",")")
                END IF
              ELSEIF Comma = 1 THEN
                IF NOT iMatchWrd(Stk$[A+2],"WPARAM") THEN
                  InsertTokens(A,3,"(","WPARAM",")")
                END IF
              ELSEIF Comma = 2 THEN
                IF NOT iMatchWrd(Stk$[A+2],"LPARAM") THEN
                  InsertTokens(A,3,"(","LPARAM",")")
                END IF
                EXIT LOOP
              END IF
              Comma++
            END IF    'Is a comma
          LOOP
        END IF

        CASE "sgn"
        Stk$[Tmp]= "sgn"
        Use_Sgn = Use_Proto = TRUE

        CASE "short"
        Stk$[Tmp] = "short"

        CASE "show"
        Stk$[Tmp]= "Show"
        Use_Show = Use_Sysmacros = TRUE

        CASE "showmodal"
        Stk$[Tmp] = "ShowModal"
        Use_Show = Use_Sysmacros = Use_ShowModal = Use_EndModal = TRUE

        CASE "sin"
        Stk$[Tmp]= "sin"

        CASE "sinl"
        Stk$[Tmp]= "sinl"

        CASE "single"
        Stk$[Tmp]= "float"

        CASE "sinh"
        Stk$[Tmp]= "sinh"

        CASE "space$"
        Stk$[Tmp]= "$$space$"
        Use_Space = UseFlag = TRUE

        CASE "split"
        Stk$[Tmp]= "Split"
        Use_Proto = TRUE
        UseFlag   = TRUE
        Use_Split = TRUE
        Use_Remove= TRUE
        Use_StrStr= TRUE
        Use_Mid   = TRUE
        Use_Left  = TRUE
        Use_Instr = TRUE
        Use_Stristr = TRUE
        UseLCaseTbl = TRUE

        CASE "splitbarfg"
        Stk$[Tmp]= "SplitBarFG"

        CASE "splitbarbg"
        Stk$[Tmp]= "SplitBarBG"

        CASE "sqr","sqrt"
        Stk$[Tmp]= "sqrt"

        CASE "sqrl","sqrtl"
        Stk$[Tmp]= "sqrtl"

        CASE "strarray"
        Stk$[Tmp]= "LPSTR*"

        CASE "strim$"
        Stk$[Tmp]= "$$strim$"
        Use_Strim = UseFlag = TRUE

        CASE "string"
        Stk$[Tmp]= "string"

        CASE "string$"
        Stk$[Tmp]= "$$string$"
        Use_String = UseFlag = TRUE

        CASE "strptr"
        Stk$[Tmp]= "STRPTR"
        Use_Strptr = Use_Sysmacros = TRUE

        CASE "strtoken$"
        Stk$[Tmp]= "StrToken$"
        Use_Strtoken = UseFlag = Use_Mid = Use_Left = Use_Extract = TRUE
        Use_Instr =Use_Instrrev = Use_Stristr = Use_Tally = Use_Remove = TRUE
        Use_StrStr = UseLCaseTbl = TRUE

        CASE "swap"
        Stk$[Tmp]= "swap"
        Use_Swap = Use_Proto = TRUE

        CASE "sysstr"
        Stk$[Tmp] = "SysStr"
        Use_SysStr = Use_Proto = TRUE

      END SELECT

      CASE  20
      SELECT CASE Keyword$

        CASE "tab$"
        Stk$[Tmp] = "TAB$"
        Use_TAB = UseFlag = TRUE

        CASE "true"
        Stk$[Tmp]= "TRUE"

        CASE "trim$"
        Stk$[Tmp]= "$$trim$"
        Use_Trim = UseFlag = TRUE

        CASE "tally"
        Stk$[Tmp]= "tally"
        Use_Tally = UseLCaseTbl = Use_Stristr = Use_StrStr = Use_Proto = TRUE

        CASE "tan"
        Stk$[Tmp]= "tan"

        CASE "tanh"
        Stk$[Tmp]= "tanh"

        CASE "tanl"
        Stk$[Tmp]= "tanl"

        CASE "tempfilename$"
        Stk$[Tmp] = "$$TempFileName$"
        Use_TempFileName = UseFlag = TRUE

        CASE "textmode"
        Stk$[Tmp]= "TextMode"
        Use_Textmode = Use_Proto = TRUE

        ' *********************************************************
        ' Special Case Handler: Substitute "This." with "This->"
        ' *********************************************************

        CASE "this"
        Stk$[Tmp] = "This"
        IF *Stk[Tmp+1] = ASC(".") THEN
          Stk$[Tmp+1] = "->" & MID$(Stk$[Tmp+1],2)
        END IF

        CASE "timer"
        Stk$[Tmp]= "timer()"
        IF Stk$[Tmp+1]= "(" AND Stk$[Tmp+2]= ")" THEN
          Stk$[Tmp+1] = ""
          Stk$[Tmp+2] = ""
        END IF
        Use_Timer = Use_Proto = TRUE
      END SELECT

      CASE  21
      SELECT CASE Keyword$
        CASE "uint"
        Stk$[Tmp]= "UINT"

        CASE "ushort"
        Stk$[Tmp] = "USHORT"

        CASE "ulong"
        Stk$[Tmp] = "ULONG"

        CASE "ulonglong"
        Stk$[Tmp] = "ULONGLONG"

        CASE "ucase$"
        Stk$[Tmp]= "$$ucase$"
        Use_Ucase = UseFlag = TRUE

        CASE "ubound"
        Stk$[Tmp]= "ubound"
        Use_Ubound = Use_Sysmacros = TRUE

        CASE "using$"
        Stk$[Tmp] = "$$Using$"
        Use_Using = UseFlag = TRUE
      END SELECT

      CASE  22
      SELECT CASE Keyword$

        CASE "val"
        Stk$[Tmp]= "VAL"
        Use_Val = Use_Sysmacros = TRUE

        CASE "vall"
        Stk$[Tmp]= "VALL"
        Use_Vall = Use_Sysmacros = TRUE

        CASE "variant"
        Stk$[Tmp]= "VARIANT"

        CASE "varptr"
        Stk$[Tmp]= ""

        CASE "vchr$"
        Stk$[Tmp] = "$$vchr$"
        Use_VChr = UseFlag = TRUE

        CASE "vt$"
        Stk$[Tmp] = "VT$"
        Use_VT = UseFlag = TRUE

        CASE "verify"
        Stk$[Tmp] = "Verify"
        Use_Verify = Use_Mid = UseFlag = TRUE

        CASE "vbs_addcode","vbs_run_script","vbs_eval_str$"
        Stk$[Tmp] = UCASE$(Stk$[Tmp])
        Use_VBS = UseFlag = TRUE

        CASE "vbs_eval_num","vbs_eval_num#"
        Stk$[Tmp] = "VBS_EVAL_NUM#"
        Use_VBS = UseFlag = TRUE

        CASE "vbs_start","vbs_stop","vbs_reset","vbs_error$"
        Use_VBS = UseFlag = TRUE
        Stk$[Tmp] = UCASE$(Stk$[Tmp]) + "()"
        IF Stk$[Tmp+1]= "(" AND Stk$[Tmp+2]= ")" THEN
          Stk$[Tmp+1] = ""
          Stk$[Tmp+2] = ""
        END IF

      END SELECT

      CASE  23
      SELECT CASE Keyword$

        CASE "widetoansi$"
        Stk$[Tmp] = "$$WideToAnsi$"
        Use_WideToAnsi = UseFlag = TRUE


      END SELECT
    END SELECT
  NEXT

  IF CompPtr = 1 THEN CALL RemEmptyTokens

  '************************************************************
  ' Moved the WITH/END WITH handling here from the Emit sub
  ' The ill formed variables would cause conflict with the new
  ' AsmUnKnown structs function.
  '************************************************************

  IF WithCnt THEN
    FOR i = 1 TO Ndx
      IF LEFT$(Stk$[i],1) = "." AND NOT IsNumber(MID$(Stk$[i],2,1)) THEN
        IF WithVar$[WithCnt] = "This" THEN
          Stk$[i] = "->" + MID$(Stk$[i],2)
        END IF
        IF i = 1 THEN
          Stk$[i] = WithVar$[WithCnt] + Stk$[i]
        ELSE
          IF NOT IsReservedWord(Stk$[i-1]) THEN
            IF NOT (isalpha(Stk[i-1][LEN(Stk$[i-1]-1)]) OR IsNumber(RIGHT$(Stk$[i-1],LEN(Stk$[i-1]-1)))) THEN
              Stk$[i] = WithVar$[WithCnt] + Stk$[i]
            END IF
          ELSE
            Stk$[i] = WithVar$[WithCnt] + Stk$[i]
          END IF
        END IF
        WHILE (isalpha(*Stk[i+1]) OR *Stk[i+1] = ASC(".")) AND (i < Ndx)
          INCR i
        WEND
      END IF
    NEXT
  END IF

  '************************************************************
  ' handle programming style global and locals using same name
  '************************************************************

  IF CompToken = 1 THEN

    Keyword$ = LCASE$(Stk$[1])

    SELECT CASE Keyword$
      CASE "dim"         :  CompToken = 0
      CASE "local"       :  CompToken = 0
      CASE "global"      :  CompToken = 0
      CASE "static"      :  CompToken = 0
      CASE "shared"      :  CompToken = 0
      CASE "raw"         :  CompToken = 0
      CASE "dynamic"     :  CompToken = 0
      CASE "free"        :  CompToken = 0
      CASE "redim"       :  CompToken = 0
      CASE "sub"         :  CompToken = 0
      CASE "function"    :  CompToken = 0
      CASE "overloaded"  :  CompToken = 0
      CASE "callback"    :  CompToken = 0
      CASE "public"      :  CompToken = 0
      CASE "declare"     :  CompToken = 0
      CASE "c_declare"   :  CompToken = 0
      CASE "auto"        :  CompToken = 0
      CASE "register"    :  CompToken = 0
      CASE "extern"      :  CompToken = 0
      CASE ELSE          :  CALL AsmUnknownStructs(1)
    END SELECT

  END IF
END SUB 'TokenSubstitutions



SUB JoinStrings( i, inif )
  '************************
  DIM RAW DoJoin   = 0
  DIM RAW InBrace  = 0
  DIM RAW OnlyPara = 0
  DIM RAW j  = 0
  DIM RAW l  = 0
  DIM RAW sj = i
  DIM RAW t$
  DIM RAW vt
  '************************

  WHILE i <= Ndx

    t$ = LCASE$(Stk$[i])

    IF NOT j AND NOT OnlyPara AND NOT InBrace THEN
      vt = DataType(Stk$[i])
      IF vt = vt_STRVAR OR vt = vt_STRLIT THEN
        sj = i
        INCR i
        ITERATE
      END IF
    END IF


    SELECT CASE t$

      CASE "&"
      IF OnlyPara THEN EXIT SELECT

      vt = DataType(Stk$[i+1])
      IF vt <> vt_STRVAR AND vt <> vt_STRLIT THEN
        vt = DataType(Stk$[i-1])
      END IF
      IF vt = vt_STRVAR OR vt = vt_STRLIT THEN
        j++
        Stk$[i] = ","
        t$ = ""
      END IF

      CASE "["
      INCR InBrace

      CASE "]"
      DECR InBrace

      CASE "("
      IF Stk$[i+1] <> "*" THEN
        CALL JoinStrings(i+1, inif)
        l = i-1
        WHILE Stk$[i] <> ")"
          Stk$[l] = Stk$[l] + Stk$[i] + " "
          Stk$[i] = ""
          i++
        WEND
        CONCAT(Stk$[l], Stk$[i])
        Stk$[i] = ""
      END IF

      CASE ")"
      IF j THEN
        Stk$[sj] = "join$(" + STR$(j+1) + "," + Stk$[sj]
        j = sj + 1
        WHILE j < i
          CONCAT(Stk$[sj], Stk$[j])
          Stk$[j] = ""
          j++
        WEND
        CONCAT(Stk$[sj], ")")
      END IF
      EXIT SUB

      CASE "||"
      Stk$[i] = " or "
      DoJoin = TRUE

      CASE "&&"
      Stk$[i] = " and "
      DoJoin = TRUE

      CASE "then", "for"
      DoJoin = TRUE

      CASE "="
      IF NOT inif THEN
        OnlyPara = TRUE
      ELSE
        DoJoin = TRUE
      END IF

      CASE "if", "elseif", "while"
      inif = TRUE
      sj = i + 1

      CASE  "sprint", "lprint", "fprint", "fprintf", "print", "print#"
      OnlyPara = TRUE

      CASE ELSE
      IF LEFT$(Stk$[i],2) = "]." OR LEFT$(Stk$[i],3) = "]->" THEN
        DECR InBrace
      END IF

    END SELECT

    IF (DoJoin OR INCHR(",+-*/^;:<>~|&", t$)) AND NOT OnlyPara AND NOT InBrace THEN
      DoJoin = 0
      IF j THEN
        Stk$[sj] = "join$(" + STR$(j+1) + "," + Stk$[sj]
        j = sj
        j++
        WHILE j < i
          CONCAT(Stk$[sj], Stk$[j])
          Stk$[j] = ""
          j++
        WEND
        CONCAT(Stk$[sj], ")")
      END IF
      j = 0
      sj = i + 1
    END IF

    INCR i

  WEND

  IF j THEN
    Stk$[sj] = "join$(" + STR$(j+1) + "," + Stk$[sj]
    j = sj
    j++
    WHILE j <= i
      CONCAT(Stk$[sj], Stk$[j])
      Stk$[j] = ""
      j++
    WEND
    CONCAT(Stk$[sj], ")")
  END IF

END SUB ' JoinStrings







SUB Transforms()
  '****************
  DIM RAW nBrace
  DIM RAW CntMarker
  DIM RAW IFCond
  DIM RAW a
  DIM RAW i
  DIM RAW j
  DIM RAW Keyword$
  DIM RAW lszTmp$
  '****************

  Keyword$ = ""
  lszTmp$  = ""

  IF Ndx = 3 AND NOT WithCnt THEN
    IF Stk$[2] = "+" AND Stk$[3] = "+" THEN
      FPRINT Outfile,Scoot$,Clean$(Stk$[1]);"++;"
      Ndx = 0
      Statements++
      EXIT SUB
    END IF
    IF Stk$[2] = "-" AND Stk$[3] = "-" THEN
      FPRINT Outfile,Scoot$,Clean$(Stk$[1]);"--;"
      Ndx = 0
      Statements++
      EXIT SUB
    END IF
    IF Stk$[1] = "+" AND Stk$[2] = "+" THEN
      FPRINT Outfile,Scoot$,"++";Clean$(Stk$[3]);";"
      Ndx = 0
      Statements++
      EXIT SUB
    END IF
    IF Stk$[1] = "-" AND Stk$[2] = "-" THEN
      FPRINT Outfile,Scoot$,"--";Clean$(Stk$[3]);";"
      Ndx = 0
      Statements++
      EXIT SUB
    END IF
  END IF

  Keyword$ = LCASE$(Stk$[1])
  a = INCHR("abcdefghijklmnopqrstuvwxyz$", Keyword$)
  SELECT CASE a

    CASE 3
    IF Keyword$ = "case" THEN
      nBrace = 0
      CntMarker = 2
      j = 0
      FOR i = 2 TO Ndx
        IF INCHR("([",Stk$[i]) THEN nBrace++
        IF INCHR(")]",Stk$[i]) THEN nBrace--
        IF Stk$[i] = ","  THEN
          IF nBrace=0 THEN CntMarker = i + 1
        END IF
        IF iMatchWrd(Stk$[i],"to") THEN
          j = 1
          Stk$[i] = " and <="
          Stk$[CntMarker] = ">=" + Stk$[CntMarker]
        END IF
      NEXT

      IF j=1 THEN
        Src$ = ""
        FOR i = 1 TO Ndx
          Src$ = Src$ + Stk$[i] + " "
        NEXT
        CALL XParse(Src$)
      END IF
      EXIT SUB
    END IF

    CASE 4

    '**************************************************************************
    ' The following code introduces the following DLL declarations to BCX
    '**************************************************************************
    '  DECLARE FUNCTION Foo LIB "FOO.DLL" ALIAS "FooA" ( A$ )
    '                     OR
    '  DECLARE FUNCTION Foo LIB "FOO.DLL" ( A$ ) - Alias will default to "FOO"
    '  [5.08.1102] Foo = (BCXFPROTx)GetProcAddress(H_FOO, "FooA");
    '**************************************************************************

    IF Keyword$ = "declare" AND iMatchWrd(Stk$[4],"lib") THEN
      DIM RAW alias$, i, idx=-1

      REMOVE DQ$ FROM Stk$[5]
      FOR i = 0 TO LoadLibsCnt - 1
        IF Stk$[5] = Loadlibs$[i] THEN
          idx = i
          EXIT FOR
        END IF
      NEXT i
      IF idx < 0 THEN
        Loadlibs$[LoadLibsCnt] = Stk$[5]
        INCR LoadLibsCnt
      END IF

      IF iMatchWrd(Stk$[6],"alias") THEN
        alias$ = Stk$[7]
        Stk$[6] = ""
        Stk$[7] = ""
      ELSE
        alias$ = ENC$(UCASE$(Stk$[3]))
      END IF

      INCR DllCnt
      IF DllCnt > 799 THEN Abort("Maximum number of declarations exceded.")
      DllDecl$ [DllCnt] = Clean$(Stk$[3]) + "=(BCXFPROT" + LTRIM$(STR$(DllCnt)) + _
      ")GetProcAddress(H_" + UCASE$(EXTRACT$(Stk$[5], ".")) + ", " + alias$ + ");"

      Stk$[4] = ""
      Stk$[5] = ""

      EXIT SUB
    END IF

    CASE 5

    IF Keyword$ = "end" AND iMatchWrd(Stk$[2],"events") THEN
      Stk$[1] = "endevents"
      IF iMatchWrd(Stk$[3], "main" ) THEN Use_MainEvent = TRUE
      Ndx=1
      EXIT SUB
    END IF

    IF Keyword$ = "end" AND iMatchWrd(Stk$[2],"mdievents") THEN
      Stk$[1] = "endmdievents"
      IF iMatchWrd(Stk$[3], "main" ) THEN Use_MainEvent = TRUE
      Ndx=1
      EXIT SUB
    END IF

    IF Keyword$ = "end" AND iMatchWrd(Stk$[2],"mdichildevents") THEN
      Stk$[1] = "endmdichildevents"
      IF iMatchWrd(Stk$[3], "main" ) THEN Use_MainEvent = TRUE
      Ndx=1
      EXIT SUB
    END IF

    CASE 7
    IF Keyword$ = "get$" THEN
      Stk$[1] = "~get"
      EXIT SUB
    END IF

    IF Keyword$ = "global" AND iMatchWrd(Stk$[2],"dynamic") THEN
      Stk$[1] = "global"
      EXIT SUB
    END IF


    CASE 9
    IF Keyword$ = "iremove" THEN
      '***********************************************************
      '  Translate   IREMOVE UCASE$("aaa") FROM LTRIM$(RTRIM$(A$))
      '  into   A$ = IREMOVE$(LTRIM$(RTRIM$(A$)),UCASE$("aaa"))
      '***********************************************************
      DIM RAW Mat$, Fat$

      Mat$ = ""
      Fat$ = ""
      FOR i = 2 TO Ndx
        IF iMatchWrd(Stk$[i],"from") THEN
          Stk$[i]= ""
          EXIT FOR
        END IF
      NEXT

      FOR j = 2 TO i
        CONCAT(Mat$,Stk$[j])    ' build match string
      NEXT

      FOR j = i TO Ndx
        CONCAT(Fat$,Stk$[j])     ' build fat source
      NEXT

      lszTmp$ = "=iremove$(" + Fat$ + "," + Mat$ + ")"

      FastLexer(Fat$," ()","")
      lszTmp$ = Stk$[Ndx] + lszTmp$
      CALL XParse(lszTmp$)
      CALL TokenSubstitutions
      CALL Emit
      Ndx = 0
      EXIT SUB
    END IF


    IF Keyword$ = "ireplace" THEN
      '**********************************************************
      '  IREPLACE "this" WITH "that" IN A$ is transformed into
      '  A$ = ireplace$ ( A$, "this", "that" )
      '  BCX 3.73 introduces CASE INSENSITIVE REPLACE
      '**********************************************************

      IF Ndx < 6 THEN Abort("Problem with IREPLACE statement")

      DIM RAW W, I, VV$, RR$, WW$
      VV$ = ""
      RR$ = ""
      WW$ = ""

      FOR W = 2 TO Ndx
        IF iMatchWrd(Stk$[W],"with") THEN
          Stk$[W]= ""
          EXIT FOR
        END IF
      NEXT

      FOR I = 2 TO Ndx
        IF iMatchWrd(Stk$[I],"in") THEN
          Stk$[I]= ""
          EXIT FOR
        END IF
      NEXT

      i = I+1
      FOR j = i TO Ndx
        CONCAT (VV$,Stk$[j])
      NEXT

      FOR j = 2 TO W
        CONCAT (RR$,Stk$[j])
      NEXT

      i = W+1
      FOR j = i TO I
        CONCAT (WW$,Stk$[j])
      NEXT

      lszTmp$ = "=ireplace$(" + VV$ + "," + RR$ + "," + WW$ + ")"

      FastLexer(VV$," ()","")
      lszTmp$ = Stk$[Ndx] + lszTmp$
      CALL XParse(lszTmp$)
      CALL TokenSubstitutions
      CALL Emit
      Ndx = 0
      EXIT SUB
    END IF


    CASE 12
    IF Keyword$ = "local" AND iMatchWrd(Stk$[2],"dynamic") THEN
      Stk$[1] = "dim"
      EXIT SUB
    END IF

    CASE 16
    IF Keyword$ = "put$" THEN
      Stk$[1] = "~put"
      EXIT SUB
    END IF

    CASE 18
    IF Keyword$ = "remove" THEN
      '***********************************************************
      '  Translate   REMOVE UCASE$("aaa") FROM LTRIM$(RTRIM$(A$))
      '  into   A$ = REMOVE$(LTRIM$(RTRIM$(A$)),UCASE$("aaa"))
      '***********************************************************
      DIM RAW Mat$, Fat$

      Mat$ = ""
      Fat$ = ""

      FOR i = 2 TO Ndx
        IF iMatchWrd(Stk$[i],"from") THEN
          Stk$[i]= ""
          EXIT FOR
        END IF
      NEXT

      FOR j = 2 TO i
        CONCAT(Mat$,Stk$[j])     ' build match string
      NEXT

      FOR j = i TO Ndx
        CONCAT(Fat$,Stk$[j])     ' build fat source
      NEXT

      lszTmp$ = "=remove$(" + Fat$ + "," + Mat$ + ")"

      FastLexer(Fat$," ()","")
      lszTmp$ = Stk$[Ndx] + lszTmp$
      CALL XParse(lszTmp$)
      CALL TokenSubstitutions
      CALL Emit
      Ndx = 0
      EXIT SUB

    END IF

    IF Keyword$ = "replace" THEN
      '*******************************************************
      '  REPLACE "this" WITH "that" IN A$ is transformed into
      '  A$ = replace$ ( A$, "this", "that" )
      '  BCX 2.93 allows expressions and arrays to be used
      '*******************************************************

      IF Ndx < 6 THEN Abort("Problem with REPLACE statement")

      DIM RAW W, I, VV$, RR$, WW$
      VV$ = ""
      RR$ = ""
      WW$ = ""

      FOR W = 2 TO Ndx
        IF iMatchWrd(Stk$[W],"with") THEN
          Stk$[W]= ""
          EXIT FOR
        END IF
      NEXT

      FOR I = 2 TO Ndx
        IF iMatchWrd(Stk$[I],"in") THEN
          Stk$[I]= ""
          EXIT FOR
        END IF
      NEXT
      
      IF I < W THEN Abort("Malformed REPLACE statement")

      i = I+1
      FOR j = i TO Ndx
        CONCAT (VV$,Stk$[j])
      NEXT

      FOR j = 2 TO W
        CONCAT (RR$,Stk$[j])
      NEXT

      i = W+1
      FOR j = i TO I
        CONCAT (WW$,Stk$[j])
      NEXT

      lszTmp$ = VV$ + "=replace$(" + VV$ + "," + RR$ + "," + WW$ + ")"

      CALL XParse(lszTmp$)
      CALL TokenSubstitutions
      CALL Emit
      Ndx = 0
      EXIT SUB

    END IF

    CASE 27
    SELECT CASE Keyword$
      '**************************
      CASE "$ifndef"
      Stk$[1] = "~ifndef"
      InConditional++
      '**************************
      CASE "$if","$ifdef"
      Stk$[1] = "~if"
      InConditional++
      '**************************
      CASE "$else"
      Stk$[1] = "~else"
      '**************************
      CASE "$elseif"
      Stk$[1] = "~elseif"
      '**************************
      CASE "$endif"
      Stk$[1] = "~endif"
      InConditional--
      IF InConditional < 0 THEN       'simple check to see if to see if conditionals are balanced
        Abort("To many $ENDIFs")
      END IF
      '**************************
      CASE "$vscroll"
      Stk$[1] = "~vscroll"
      '**************************
      CASE "$hscroll"
      Stk$[1] = "~hscroll"
      '**************************
      CASE "$cpp"
      Ndx = 0
      UseCpp = TRUE
      IncludeCount=IncludeCount+5
      '**************************
    END SELECT
    EXIT SUB
  END SELECT

  IF iMatchWrd(Stk$[2],"formload") THEN
    Stk$[2] = "FormLoad"
  END IF

  IFCond = 0

  FOR i = 1 TO Ndx
    IF iMatchWrd(Stk$[i],"if") THEN IFCond = i + 1
    IF iMatchWrd(Stk$[i],"then") AND iMatchWrd(Stk$[i+1],"if") THEN
      FOR j = i + 2 TO Ndx
        IF iMatchWrd(Stk$[j],"else") THEN
          EXIT FOR
        END IF
      NEXT
      IF j > Ndx THEN            ' safe to transform
        FOR j = i TO IFCond + 1 STEP -1
          Stk$[j] = Stk$[j - 1]
        NEXT
        Stk$[IFCond] = "("
        i++
        Stk$[i] = ")"
        i++
        FOR j = Ndx TO i STEP -1
          Stk$[j + 2] = Stk$[j]
        NEXT
        Ndx++
        Ndx++
        Stk$[i] = "&&"
        i++
        Stk$[i] = "("
        i++
        FOR i = i TO Ndx
          IF iMatchWrd(Stk$[i],"then") THEN
            Ndx++
            FOR j = Ndx TO i STEP -1
              Stk$[j] = Stk$[j - 1]
            NEXT
            Stk$[i] = ")"
            EXIT FOR
          END IF
        NEXT
        i--
      ELSE
        EXIT FOR
      END IF
    END IF
  NEXT
END SUB ' Transforms





SUB Parse(Arg$)
  '****************
  DIM RAW A, B
  DIM RAW CommaCnt
  DIM RAW Tmp
  DIM RAW i
  DIM RAW j
  DIM RAW k
  DIM RAW lszTmp$
  DIM RAW L_Stk_1$
  DIM RAW L_Stk_2$
  DIM RAW Var1$
  DIM RAW Plus2Amp = 0
  DIM RAW vt

  '****************
  L_Stk_1$ = ""
  L_Stk_2$ = ""
  lszTmp$  = ""
  Var1$    = ""
  '****************
  CALL XParse(Arg$)

  PassOne = 0

  IF NOT iMatchWrd(Stk$[1],"function")  THEN

    Plus2Amp = iMatchNQ(Arg$, "&")

    FOR Tmp = 2 TO Ndx-1

      IF Stk$[Tmp] = "+" THEN
        vt = DataType(Stk$[Tmp+1])
        IF vt = vt_STRVAR OR vt = vt_STRLIT THEN
          Stk$[Tmp] = "&"
          Plus2Amp = TRUE
        ELSE
          vt = DataType(Stk$[Tmp-1])
          IF vt = vt_STRVAR OR vt = vt_STRLIT THEN
            Stk$[Tmp] = "&"
            Plus2Amp = TRUE
          END IF
        END IF
      END IF
    NEXT

    IF Plus2Amp > 0 THEN
      Use_Join = UseFlag = TRUE
      j = 0
      k = 0
      FOR Tmp = 1 TO Ndx-1
        A = CheckLocal(Stk$[Tmp], &i)
        IF A = vt_UNKNOWN THEN A = CheckGlobal(Stk$[Tmp], &i)
        IF A = vt_STRUCT OR A = vt_UDT OR A = vt_UNION THEN   'added vt_UNION 4.40
          j = 1
        END IF
        IF Stk$[Tmp] = "&" THEN
          A = DataType(Stk$[Tmp+1])
          IF A = vt_STRVAR OR A = vt_STRLIT THEN
            k = 1
          ELSE
            A = DataType(Stk$[Tmp-1])
            IF A = vt_STRVAR OR A = vt_STRLIT THEN
              k = 1
            END IF
          END IF
        END IF
      NEXT
      IF k THEN
        IF j THEN CALL AsmUnknownStructs(0)
        CALL JoinStrings(1, 0)
        Src$ = ""
        FOR i = 1 TO Ndx
          IF Stk[i][0] THEN
            Src$ = Src$ + Stk$[i] + " "
          END IF
        NEXT
        CALL XParse(Src$)
      END IF
    END IF
  END IF

  '***********************************************************
  'Moved here by Mike H. Was being applied too early.
  'causing lines with multiple statements to not receive the
  'conversion. i.e. sp->lpVtbl->Release(sp) : sp = NULL
  '***********************************************************

  IF UseCpp THEN
    IF iMatchNQ(Src$,"->lpVtbl") THEN
      FOR INTEGER i= 1 TO Ndx
        IF iMatchRgt(Stk$[i],"->lpVtbl") THEN
          Stk$[i] = EXTRACT$(Stk$[i],"->lpVtbl")
          IF (Stk$[i+3] = Stk$[i-1] OR Stk$[i+3] = Stk$[i]) AND Stk$[i+3] <> ")" THEN
            Stk$[i+3] = ""
            IF Stk$[i+4] = "," THEN Stk$[i+4] = ""
          END IF
        END IF
      NEXT
      CALL RemEmptyTokens
    END IF
  END IF

  '********************************************************************
  '  At this point we have a fresh set of Stk$[] values, totaling Ndx
  '                Start handling some unique situations
  '********************************************************************

  CALL TokenSubstitutions
  IF Ndx = 0 THEN EXIT SUB

  CALL Transforms
  IF Ndx = 0 THEN EXIT SUB


  '***********************************************************
  'Modification to allow 2 names as function types
  '***********************************************************

  IF iMatchWrd(Stk$[1],"function") THEN
    IF iMatchWrd(Stk$[Ndx-2],"as") AND Stk$[Ndx] <> ")" THEN
      IF NOT iMatchWrd(Stk$[Ndx],"export") AND NOT iMatchWrd(Stk$[Ndx],"stdcall") THEN
        Stk$[Ndx-1] = Stk$[Ndx-1] + " " + Stk$[Ndx]
        Ndx--
      END IF
    END IF
  END IF

  '********************************************************************
  'Modification to allow 2 names as argument types in sub or function
  '********************************************************************

  IF iMatchWrd(Stk$[1],"function") OR iMatchWrd(Stk$[1],"sub") THEN
    DIM RAW offset
    DIM RAW LastBrk = Ndx - 2
    FOR i = Ndx TO 3 STEP -1
      IF Stk$[i] = ")" THEN
        LastBrk = i
        EXIT FOR
      END IF
    NEXT
    FOR i = 3 TO LastBrk
      offset = 2
      IF iMatchWrd(Stk$[i],"as") AND (i < LastBrk) AND Stk$[i + offset] <> "=" THEN
        IF iMatchWrd(Stk$[i+1],"function") THEN offset = 3
        IF NOT INCHR(Stk$[i + offset],")") AND NOT INCHR(Stk$[i + offset],",") THEN
          IF LEN(Stk$[i + offset]) <> 0 AND NOT iMatchWrd(Stk$[i + 3],"as") THEN
            Stk$[i+offset-1] = Stk$[i+offset-1] + " " + Stk$[i+offset]
            Stk$[i + offset] = ""
          END IF
        END IF
      END IF
    NEXT
  END IF

  '***********************************************************

  'DynaCall Handler

  IF NOT iMatchWrd(Stk$[1],"declare") THEN
    FOR i = 1 TO Ndx
      IF iMatchWrd(Stk$[i],"lib") THEN
        IF Stk$[i-1] = "(" AND (DataType(Stk$[i+1]) = vt_STRLIT OR DataType(Stk$[i+1]) = vt_STRVAR) THEN
          j = GetNumArgs(i+2)
          lszTmp$ = "BCX_DynaCallB"
          IF NOT iMatchWrd(Stk$[1],"print") THEN  'print does its own casting
            IF DataType(Stk$[i-2]) = vt_STRVAR OR DataType(Stk$[1]) = vt_STRVAR THEN
              lszTmp$ = "(char*)" & lszTmp$
            END IF
          END IF
          Var1$ = RIGHT$(Stk$[i-2], 1)
          IF INCHR ("!$#¦%", Var1$) THEN
            CONCAT (lszTmp$, Var1$)
            Stk$[i] = ENC$(LEFT$(Stk$[i-2], LEN(Stk$[i-2]) - 1))
          ELSE
            Stk$[i] = ENC$(Stk$[i-2])
          END IF
          Stk$[i-2] = lszTmp$
          FOR B = Ndx+3 TO i+3 STEP -1
            Stk$[B] = Stk$[B-3]
          NEXT
          Stk$[i+2] = Stk$[i+1]
          Stk$[i+1] = ","
          Stk$[i+3] = ","
          Stk$[i+4] = LTRIM$(STR$(j))
          Stk$[i+5] = IIF$(j, ",", ")")
          INCR Ndx, 3
          Use_Dynacall = UseFlag = TRUE
        END IF
      END IF
    NEXT
  END IF

  '****************[ Exponentiation Operator Handler ]******************

  IF INCHR(Arg$,"^") THEN
    DIM RAW lp = 0
    DIM RAW rp = 0

    Test = FALSE

    FOR i = 1 TO Ndx
      IF Stk$[i] = "^" THEN
        Test = TRUE
        IF Stk$[i+1] = "-" THEN
          Ndx++
          FOR A = Ndx TO i+2 STEP -1
            Stk$[A] = Stk$[A-1]
          NEXT
          Stk$[i+1] = "("
          B = i+3
          IF Stk$[B] = "(" THEN
            lp=0
            rp=0
            DO
              IF Stk$[B] = "(" THEN lp++
              IF Stk$[B] = ")" THEN rp++
              B++
            LOOP UNTIL lp = rp
            Ndx++
            j = B+1
            FOR A = Ndx TO j STEP -1
              Stk$[A] = Stk$[A-1]
            NEXT
            Stk$[B] = ")"
          ELSE
            B=i+4
            IF INCHR("[",Stk$[B]) THEN
              DO
                B++
              LOOP UNTIL INCHR("]",Stk$[B])
              Ndx++
              j = B+2
              FOR A = Ndx TO j STEP -1
                Stk$[A] = Stk$[A-1]
              NEXT
              Stk$[B+1] = ")"
            ELSE
              IF INCHR("(",Stk$[B]) THEN
                DO
                  B++
                LOOP UNTIL INCHR(")",Stk$[B])
                Ndx++
                j = B+2
                FOR A = Ndx TO j STEP -1
                  Stk$[A] = Stk$[A-1]
                NEXT
                Stk$[B+1] = ")"
              ELSE
                Ndx++
                j = B+1
                FOR A = Ndx TO j STEP -1
                  Stk$[A] = Stk$[A-1]
                NEXT
                Stk$[B] = ")"
              END IF
            END IF
          END IF
        END IF
      END IF
    NEXT

    IF Test THEN
      FOR i = 1 TO  Ndx
        IF Stk$[i] = "^" THEN
          A = i - 1
          B = 0

          WHILE Stk$[A] <> "="
            IF Stk$[A] = "]" THEN B++
            IF Stk$[A] = ")" THEN B++
            IF Stk$[A] = "[" THEN B--
            IF Stk$[A] = "(" THEN B--
            IF B = 0 THEN EXIT WHILE
            A--
          WEND

          IF Stk$[A] = "[" THEN A--
          IF Stk$[A] = "=" THEN A++

          IF Stk$[A] = "(" THEN
            B = DataType(Stk$[A-1])        ' check if it's a function
            IF NOT iMatchWrd(Stk$[A-1], "print") AND  _
              (B = vt_INTEGER OR B = vt_SINGLE OR B = vt_DOUBLE) THEN
              A--
            END IF
          END IF

          Arg$ = "pow("
          B = A - 1

          WHILE B > 0
            Arg$ = Stk$[B] + " " + Arg$ + " "
            B--
          WEND

          FOR B = A TO i - 1
            Arg$ = Arg$ + " " + Stk$[B]
          NEXT

          CONCAT (Arg$, ",")

          A = i + 1
          B = DataType(Stk$[A])
          IF (Stk$[A + 1] = "(" OR Stk$[A + 1] = "[") AND _
            (B = vt_INTEGER OR B = vt_SINGLE OR B = vt_DOUBLE) THEN
            A++
          END IF
          B = 0

          WHILE A <= Ndx
            IF Stk$[A] = "[" THEN B++
            IF Stk$[A] = "(" THEN B++
            IF Stk$[A] = "]" THEN B--
            IF Stk$[A] = ")" THEN B--
            IF NOT B THEN EXIT DO
            A++
          WEND

          FOR B = i + 1 TO A
            Arg$ = Arg$ + " " + Stk$[B]
          NEXT

          CONCAT(Arg$,")")
          A++
          WHILE A <= Ndx
            Arg$ = Arg$ + " " + Stk$[A]
            A++
          WEND
          EXIT FOR
        END IF
      NEXT
      CALL Parse(Arg$)
    END IF
  END IF

  '*****************************************************
  L_Stk_1$ = LCASE$(Stk$[1])   ' Performance Optimizer
  L_Stk_2$ = LCASE$(Stk$[2])   ' Performance Optimizer
  '*****************************************************


  IF L_Stk_1$ = "$dll" THEN
    MakeDLL = TRUE
    Ndx = 0

    IF L_Stk_2$ = "stdcall" THEN
      UseStdCall = TRUE
    END IF

    IF NoDllMain THEN
      EXIT SUB
    END IF

    FPRINT Outfile,""
    FPRINT Outfile,"__declspec(dllexport) BOOL WINAPI DllMain (HINSTANCE hInst, DWORD Reason, LPVOID Reserved)"
    FPRINT Outfile,"{"
    FPRINT Outfile," switch (Reason)"
    FPRINT Outfile," {"
    FPRINT Outfile," case DLL_PROCESS_ATTACH:"
    FPRINT Outfile," BCX_hInstance = hInst;"
    FPRINT Outfile," break;"
    FPRINT Outfile," case DLL_PROCESS_DETACH:"
    FPRINT Outfile," break;"
    FPRINT Outfile," case DLL_THREAD_ATTACH:"
    FPRINT Outfile," break;"
    FPRINT Outfile," case DLL_THREAD_DETACH:"
    FPRINT Outfile," break;"
    FPRINT Outfile," }"
    FPRINT Outfile," return TRUE;"
    FPRINT Outfile,"}\n\n"
    Src$ = "GLOBAL BCX_hInstance AS HINSTANCE"
    Parse(Src$)
    Emit()
    EXIT SUB
  END IF

  IsCallBack = 0

  '******************************
  IF iMatchWrd(Stk$[Ndx],"callback") THEN
    IsCallBack = 1
    Ndx--
  END IF
  '******************************

  IF L_Stk_1$ = "open" THEN
    FOR A = 1 TO Ndx
      IF iMatchWrd(Stk$[A],"binary") THEN
        EXIT FOR
      END IF
    NEXT
    IF A < Ndx THEN
      A++
      Var1$ = LCASE$(Stk$[A])
      IF Var1$ = "new" THEN
        Stk$[A-1]= "binarynew"
        FOR i = A+1 TO Ndx
          Stk$[i-1]= Stk$[i]
        NEXT
        Ndx--
      END IF

      IF Var1$ = "append" THEN
        Stk$[A-1]= "binaryappend"
        FOR i = A+1 TO Ndx
          Stk$[i-1]= Stk$[i]
        NEXT
        Ndx--
      END IF

      IF Var1$ = "input" THEN
        Stk$[A-1]= "binaryinput"
        FOR i = A+1 TO Ndx
          Stk$[i-1]= Stk$[i]
        NEXT
        Ndx--
      END IF

      IF Var1$ = "output" THEN
        Stk$[A-1]= "binaryoutput"
        FOR i = A+1 TO Ndx
          Stk$[i-1]= Stk$[i]
        NEXT
        Ndx--
      END IF
    END IF
  END IF


  IF L_Stk_1$ = "option" AND L_Stk_2$ = "base" THEN
    OptionBase = VAL(Stk$[3])
    Ndx = 0
    EXIT SUB
  END IF

  '******************************

  IF L_Stk_1$   = "dim"  THEN
    IF L_Stk_2$ = "shared"    OR _
      L_Stk_2$    = "dynamic"   OR _
      L_Stk_2$    = "raw"       OR _
      L_Stk_2$    = "local"     OR _
      L_Stk_2$    = "auto"      OR _
      L_Stk_2$    = "register"  OR _
      L_Stk_2$    = "static"    THEN
      Stk$[1]     = L_Stk_2$
      L_Stk_1$    = L_Stk_2$
      FOR i = 3 TO Ndx
        Stk$[i-1]= Stk$[i]
      NEXT
      Ndx--
    END IF
  END IF

  '******************************

  IF L_Stk_1$ = "public" THEN
    IF L_Stk_2$ = "function" OR L_Stk_2$ = "sub" THEN
      Stk$[1]  = L_Stk_2$
      L_Stk_1$ = L_Stk_2$
      FOR i = 3 TO Ndx
        Stk$[i-1] = Stk$[i]
      NEXT
      Ndx--
    END IF
  END IF

  '******************************

  ' creates a static function for use in $PROJECTs
  IF L_Stk_1$ = "private" THEN
    IF L_Stk_2$ = "function" OR L_Stk_2$ = "sub" THEN
      Use_Static = TRUE
      Stk$[1]  = L_Stk_2$
      L_Stk_1$ = L_Stk_2$
      FOR i = 3 TO Ndx
        Stk$[i-1] = Stk$[i]
      NEXT
      Ndx--
    END IF
  END IF


  '******************************

  IF L_Stk_1$ = "onexit" THEN
    IF L_Stk_2$ = "sub" THEN
      Use_ExitCode = Use_Proto = TRUE
      INCR ExitNdx
      ExitSub$[ExitNdx] = Stk$[3]
      Stk$[1]  = L_Stk_2$
      L_Stk_1$ = L_Stk_2$
      FOR i = 3 TO Ndx
        Stk$[i-1] = Stk$[i]
      NEXT
      Ndx--
    END IF
  END IF

  '******************************

  IF L_Stk_1$ = "onstart" THEN
    IF L_Stk_2$ = "sub" THEN
      Use_StartupCode = Use_Proto = TRUE
      INCR StartNdx
      StartSub$[StartNdx] = Stk$[3]
      Stk$[1]  = L_Stk_2$
      L_Stk_1$ = L_Stk_2$
      FOR i = 3 TO Ndx
        Stk$[i-1] = Stk$[i]
      NEXT
      Ndx--
    END IF
  END IF

  '******************************

  IF L_Stk_1$ = "overloaded" AND L_Stk_2$ = "function" THEN
    Stk$[1] = "overloadedfunction"
    L_Stk_1$ = "overloadedfunction"
    FOR i = 3 TO Ndx
      Stk$[i-1]= Stk$[i]
    NEXT
    Ndx--
  END IF

  '******************************

  IF L_Stk_1$ = "overloadedfunction" AND Stk$[2] <> "=" THEN
    OkayToSend = TRUE
  END IF
  '******************************

  IF L_Stk_1$ = "overloaded" AND L_Stk_2$ = "sub" THEN
    Stk$[1]= "overloadedsub"
    FOR i = 3 TO Ndx
      Stk$[i-1] = Stk$[i]
    NEXT
    Ndx--
  END IF

  '******************************

  IF L_Stk_1$ = "function" AND iMatchWrd(Stk[3],"optional") THEN
    Stk$[1]= "optfunction"
    L_Stk_1$ = "optfunction"
    FOR i = 4 TO Ndx
      Stk$[i-1]= Stk$[i]
    NEXT
    Ndx--
  END IF

  '******************************

  IF L_Stk_1$ = "optfunction" AND Stk$[2] <> "=" THEN
    OkayToSend = TRUE
  END IF

  '******************************

  IF L_Stk_1$ = "sub" AND iMatchWrd(Stk[3],"optional") THEN
    L_Stk_1$ = "optsub"
    Stk$[1]= "optsub"
    FOR i = 4 TO Ndx
      Stk$[i-1]= Stk$[i]
    NEXT
    Ndx--
  END IF

  '******************************

  IF L_Stk_1$ = "end" AND Stk$[2] <> "=" THEN
    Stk$[1]= L_Stk_1$ + L_Stk_2$
    Ndx = 1
  END IF

  '******************************

  IF L_Stk_1$ = "function" AND Stk$[2] <> "=" THEN
    OkayToSend = TRUE
  END IF

  '******************************

  IF L_Stk_1$ = "midstr"  THEN

    CommaCnt = 0

    FOR i = 1 TO Ndx
      IF Stk$[i] = "," THEN
        INCR CommaCnt
      ELSEIF Stk$[i]= "=" THEN
        IF CommaCnt < 2 THEN
          Stk$[i] = "-1,"
        ELSE
          Stk$[i]= ""
        END IF
        Stk$[i-1]= ","
        Ndx++
        Stk$[Ndx]= ")"
        EXIT FOR
      END IF
    NEXT
  END IF

  '******************************

  IF L_Stk_1$ = "endevents" OR L_Stk_1$ = "endmdievents" OR L_Stk_1$ = "endmdichildevents" THEN

    IF Use_Vscroll OR Use_Hscroll THEN
      Use_Min = Use_Max = TRUE
      '========================================================================
      Src$ = "GLOBAL BCX_siX AS SCROLLINFO"       : Parse(Src$) : Emit()
      Src$ = "GLOBAL BCX_siY AS SCROLLINFO"       : Parse(Src$) : Emit()
      Src$ = "GLOBAL BCX_DynaScroll AS INTEGER"   : Parse(Src$) : Emit()

    END IF

    IF Use_Vscroll OR Use_Hscroll THEN
      IF Use_Project THEN
        FPRINT Outfile,"  int BCX_ViewWidth  =", Use_Hscroll, ";"
        FPRINT Outfile,"  int BCX_ViewHeight =", Use_Vscroll, ";"
        FPRINT Outfile,"  int BCX_SmallChangeX;"
        FPRINT Outfile,"  int BCX_SmallChangeY;"
        FPRINT Outfile,"  int BCX_LargeChangeX;"
        FPRINT Outfile,"  int BCX_LargeChangeY;"
        FPRINT Outfile,"  int BCX_ScrollInit;"
      ELSE
        FPRINT Outfile,"  static int BCX_ViewWidth  =", Use_Hscroll, ";"
        FPRINT Outfile,"  static int BCX_ViewHeight =", Use_Vscroll, ";"
        FPRINT Outfile,"  static int BCX_SmallChangeX;"
        FPRINT Outfile,"  static int BCX_SmallChangeY;"
        FPRINT Outfile,"  static int BCX_LargeChangeX;"
        FPRINT Outfile,"  static int BCX_LargeChangeY;"
        FPRINT Outfile,"  static int BCX_ScrollInit;"
      END IF
      FPRINT Outfile,""
      FPRINT Outfile,"  if(!BCX_ScrollInit)"
      FPRINT Outfile,"   {"
      FPRINT Outfile,"     BCX_siY.cbSize=sizeof(BCX_siY);"
      FPRINT Outfile,"     BCX_siX.cbSize=sizeof(BCX_siX);"
      FPRINT Outfile,"     BCX_siY.fMask=SIF_ALL;"
      FPRINT Outfile,"     BCX_siX.fMask=SIF_ALL;"
      FPRINT Outfile,"     BCX_siX.nMax=BCX_ViewWidth;"
      FPRINT Outfile,"     BCX_siY.nMax=BCX_ViewHeight;"
      FPRINT Outfile,"     BCX_SmallChangeX=1;"
      FPRINT Outfile,"     BCX_LargeChangeX=20;"
      FPRINT Outfile,"     BCX_SmallChangeY=1;"
      FPRINT Outfile,"     BCX_LargeChangeY=20;"
      FPRINT Outfile,"     BCX_siY.nPage=1;"
      FPRINT Outfile,"     BCX_siX.nPage=1;"
      FPRINT Outfile,"     SetScrollInfo(hWnd,SB_VERT,&BCX_siY,TRUE);"
      FPRINT Outfile,"     SetScrollInfo(hWnd,SB_HORZ,&BCX_siX,TRUE);"
      FPRINT Outfile,"     BCX_DynaScroll=TRUE;"
      FPRINT Outfile,"     BCX_ScrollInit=TRUE;"
      FPRINT Outfile,"   }"
      FPRINT Outfile," if(Msg==WM_HSCROLL||WM_VSCROLL||WM_SIZE)"
      FPRINT Outfile,"   {"
      FPRINT Outfile,"     BCX_Scroll(hWnd,Msg,wParam,lParam,BCX_LargeChangeX,"
      FPRINT Outfile,"     BCX_LargeChangeY,BCX_SmallChangeX,BCX_SmallChangeY,"
      FPRINT Outfile,"     BCX_ViewWidth,BCX_ViewHeight,BCX_DynaScroll);"
      FPRINT Outfile,"   }"
    END IF

    IF L_Stk_1$ <> "endmdichildevents" AND Use_MainEvent THEN
      FPRINT Outfile,"  if(Msg==WM_DESTROY)"
      FPRINT Outfile,"    {"
      IF Use_MainEvent = TRUE THEN
        FPRINT Outfile,"       PostQuitMessage(0);"
        FPRINT Outfile,"       return 0;"
        Use_MainEvent = FALSE
      END IF
      FPRINT Outfile,"    }"
    END IF

    IF L_Stk_1$ = "endevents" THEN
      FPRINT Outfile," return DefWindowProc(hWnd,Msg,wParam,lParam);"
    ELSEIF L_Stk_1$ = "endmdievents" THEN
      FPRINT Outfile," return DefFrameProc(hWnd,BCX_hwndMDIClient,Msg,wParam,lParam);"
    ELSEIF L_Stk_1$ = "endmdichildevents" THEN
      FPRINT Outfile," return DefMDIChildProc(hWnd,Msg,wParam,lParam);"
    END IF
    FPRINT Outfile,"}\n\n"
    CALL BumpDown
    Ndx = 0
    L_Stk_1$ = ""
  END IF


  '******************************

  IF Stk$[2]= ":" THEN
    IF Ndx = 2 THEN
      Stk$[1]= UCASE$(Stk$[1]) + ":"    'preserve the GOTO labels
      Ndx = 1
      EXIT SUB
    END IF
  END IF

  '******************************

  IF LCASE$(Stk$[3])= "createwindow" THEN    'HELPER
    Comma = 0
    FOR A = 4 TO Ndx
      IF Stk$[A]= "," THEN Comma++
      IF Stk$[A]= "," THEN
        IF Comma = 8 THEN
          Stk$[A]= ",(HMENU)"
          Comma++
        END IF
      END IF
    NEXT
  END IF

  '******************************

  IF LCASE$(Stk$[3])= "createwindowex" THEN    'HELPER
    Comma = 0
    FOR A = 4 TO Ndx
      IF Stk$[A]= "," THEN Comma++
      IF Stk$[A]= "," THEN
        IF Comma = 9 THEN
          Stk$[A]= ",(HMENU)"
          Comma++
        END IF
      END IF
    NEXT
  END IF

  '******************************

  IF L_Stk_1$ = "case" AND L_Stk_2$ = "else" THEN
    Ndx = 1
    Stk$[1]= "caseelse"
  END IF


  '******************************

  FOR i = 1 TO Ndx
    IF iMatchWrd(Stk$[i],"let") THEN
      FOR j = i+1 TO Ndx
        Stk$[j-1] = Stk$[j]
      NEXT
      Ndx--
    END IF
  NEXT

  '******************************

  IF Stk$[Ndx]= "*" THEN
    Stk$[Ndx-1]= Stk$[Ndx-1] + "*"
    Ndx--
  END IF

  '******************************

  IF iMatchWrd(Stk$[3],"setwindowlong") THEN    'HELPER
    Comma = 0
    Stk$[3]= "(WNDPROC) SetWindowLong"
    FOR A = 4 TO Ndx
      IF Stk$[A]= "," THEN Comma++
      IF Stk$[A]= "," THEN
        IF Comma = 2 THEN
          Stk$[A]= ",(LONG)"
          Comma++
        END IF
      END IF
    NEXT
    EXIT SUB
  END IF


  IF TestState = TRUE THEN
    IF LastCmd = 0 THEN
      IF Stk$[1] = "*" THEN
        Z$ = Clean$(Stk$[2])
      ELSE
        Z$ = Clean$(Stk$[1])
      END IF
      IF LEFT$(Z$,1) = "*" THEN Z$ = MID$(Z$,2)
      i = INCHR(Z$,".")
      IF i = 0 THEN i = INSTR(Z$,"->")
      IF i > 0 THEN
        IF WithCnt THEN
          Z$ = WithVar$[WithCnt]
        ELSE
          Z$ = LEFT$(Z$, i - 1)
        END IF
      END IF
      IF INCHR(Z$,"[") THEN Z$ = EXTRACT$(Z$,"[")
      IF CheckLocal(Z$, &j) = vt_UNKNOWN THEN
        IF CheckGlobal(Z$, &j) = vt_UNKNOWN THEN
          Z$ = LCASE$(Z$)
          IF Stk$[2] = "=" AND Z$ <> "functionreturn" AND Z$ <> "bcx_retstr" AND Z$ <> "end" THEN
            Warning("Assignment before Declaration in Line " + STR$(ModuleLineNos[ModuleNdx]) + " in Module: " + TRIM$(Modules$[ModuleNdx]) + ": " + Src$)
          END IF
        END IF
      END IF
    END IF
  END IF
END SUB ' Parse







SUB FuncSubDecs1(s$)
  '*****************
  DIM RAW i, j
  '*****************
  IF iMatchWrd(Stk$[1], s$) THEN
    IF DataType(Stk$[2]) = vt_STRVAR THEN
      Abort("Invalid " + s$ + "name")
    END IF
  END IF

  FOR i = 1 TO Ndx
    IF Stk$[i]= "[" AND Stk$[i+1]= "]" THEN
      IF iMatchWrd(Stk$[i+2],"as") THEN
        Stk$[i+3] = Stk$[i+3] + "*"
      ELSEIF Stk$[i+2] = "[" THEN
        j = i-1
        WHILE i <= Ndx
          IF iMatchWrd(Stk$[i],"as") THEN EXIT FOR
          IF iMatchRgt(Stk$[j],"]") AND INCHR(",)=", Stk$[i]) THEN EXIT FOR
          Stk$[j] = Stk$[j] + Stk$[i]
          Stk$[i++] = ""
        WEND
        ITERATE
      ELSE
        IF DataType(Stk$[i-1]) = vt_STRVAR THEN
          Stk$[i-1] = Stk$[i-1] + "[][2048]"
        END IF
        Stk$[i-1] = "*"  +  Stk$[i-1]

      END IF
      Stk$[i++] = "" : Stk$[i] = ""
    END IF
  NEXT

  CALL RemEmptyTokens

  IsExported = FALSE

  IF iMatchWrd(Stk$[Ndx],"export") THEN
    Ndx--
    IsExported = TRUE
    IF UseStdCall THEN
      CallType$ = "__stdcall "
    ELSE
      CallType$ = "__cdecl "
    END IF
  END IF
END SUB ' FuncSubDecs1



SUB RemEmptyTokens()
  DIM RAW i, j
  FOR i = 1 TO Ndx
    IF NOT *Stk[i] THEN
      j = i
      WHILE NOT *Stk[j] AND (j < Ndx)
        INCR j
      WEND
      IF NOT *Stk[j] THEN EXIT FOR
      Stk$[i] = Stk$[j]
      Stk$[j] = ""
    END IF
  NEXT i
  Ndx = i-1
END SUB



SUB FuncSubDecs2(s$, method)
  IF iMatchWrd(Stk$[1], s$) THEN
    IF iMatchWrd(Stk$[Ndx-1],"as") THEN
      Abort("Attempted type assignment to " + s$)
    END IF
    VarCode.IsPtrFlag = 0
    CurrentFuncType = vt_VOID
  ELSE
    IF iMatchWrd(Stk$[Ndx-1],"as") THEN
      CurrentFuncType  = CheckType(Stk$[Ndx])
      VarCode.Token$   = Stk$[2]
      VarCode.AsToken$ = Stk$[Ndx]
      VarCode.IsPtrFlag = TALLY(Stk$[Ndx],"*")
      Stk$[Ndx--]   = ""
      Stk$[Ndx--] = ""
    ELSE
      CurrentFuncType = DataType(Stk$[2])
      VarCode.Token$ = Stk$[2]
      VarCode.IsPtrFlag = TALLY(Stk$[2],"*")
      VarCode.AsToken$ = ""
    END IF
  END IF
  VarCode.Proto$    = " ("
  VarCode.Header$   = " ("
  VarCode.Functype$ = ""
  VarCode.Method%   = method
  VarCode.VarNo%    = CurrentFuncType
  CALL GetVarCode(&VarCode)
END SUB ' FuncSubDecs2





SUB FuncSubDecs3(varcode AS VARCODE PTR)
  IF *Stk[Ndx-1] = ASC(".") THEN                    ' Allow Functions | Subs WITH one OR
    varcode->Header$ = varcode->Header$  +  "..."   ' more "." TO produce the "..." needed
  END IF

  varcode->Header$ = RTRIM$(varcode->Header$)
  IF iMatchRgt(varcode->Header$, ",") THEN
    MID$(varcode->Header$, LEN(varcode->Header$)) = ")"
  ELSE
    CONCAT(varcode->Header$, ")")
  END IF

  REPLACE "()" WITH "(void)" IN varcode->Header$
  varcode->Header$ = varcode->Functype$ + varcode->Token$ + varcode->Header$

  IF varcode->Method% = 2 THEN
    IF *Stk[Ndx-1] = ASC(".") THEN                  ' Allow Functions | Subs with one OR
      varcode->Proto$  = varcode->Proto$   +  "..." ' FOR variable argument declarations
    END IF

    varcode->Proto$ = RTRIM$(varcode->Proto$)
    IF iMatchRgt(varcode->Proto$, ",")  THEN
      MID$(varcode->Proto$, LEN(varcode->Proto$)) = ")"
    ELSE
      CONCAT(varcode->Proto$, ")")
    END IF

    REPLACE "()" WITH "(void)" IN varcode->Proto$

    varcode->Proto$ = varcode->Functype$ + varcode->Token$ + varcode->Proto$ + ";"
  END IF

  IF IsExported THEN
    varcode->Proto$  = "C_EXPORT " + varcode->Proto$
    varcode->Header$ = "C_EXPORT " + varcode->Header$
  END IF
END SUB ' FuncSubDecs3





SUB AddTypeDefs(TypeName$, TDef)
  TypeDefsCnt++
  IF TypeDefsCnt = MaxTypes THEN Abort("Exceeded TYPE Limits.")
  TypeDefs[TypeDefsCnt].VarName$ = TypeName$
  TypeDefs[TypeDefsCnt].TypeofDef = TDef
  TypeDefs[TypeDefsCnt].EleCnt = 0
END SUB ' AddTypeDefs





FUNCTION DefsID(ZZ$)
  DIM RAW i
  IF TypeDefsCnt > 0 THEN
    FOR i = 1 TO TypeDefsCnt
      IF ZZ$ = TypeDefs[i].VarName$ THEN
        FUNCTION = i
      END IF
    NEXT
  END IF
  FUNCTION = 0
END FUNCTION ' DefsID





SUB GetTypeInfo(stk$, BYREF IsPointer, BYREF UdtIdx, BYREF vtCode)
  DIM RAW Var1$
  IsPointer = TALLY(stk$,"*")
  Var1$     = REMOVE$(stk$,"*")
  ' if it's a CLASS then get the structure information added 2008/10/07
  IF RIGHT$(Var1$,6) = "_CLASS" THEN Var1$ = LEFT$(Var1$,LEN(Var1$)-6)
  vtCode    = CheckType(Var1$)

  IF vtCode = vt_UNKNOWN THEN
    CALL AddTypeDefs(Var1$, vt_UDT)    'windows def
    vtCode = vt_UDT
  END IF
  UdtIdx = 0
  IF vtCode = vt_STRUCT OR vtCode = vt_UNION OR vtCode = vt_UDT THEN
    UdtIdx = DefsID(Var1$)
  END IF
END SUB ' GetTypeInfo





SUB AddTypedefElement(WorkingTypeDefsCnt, ElType, EName$, EType$, EPtr)

  DIM RAW TD AS UserTypeDefs PTR

  TD = &(TypeDefs[WorkingTypeDefsCnt])
  IF TD->EleCnt = MaxElements THEN Abort("Exceeded TYPE Element Limits.")
  TD->Elements[TD->EleCnt].ElementType    = ElType
  TD->Elements[TD->EleCnt].ElementDynaPtr = EPtr
  IF ElType = vt_STRUCT OR ElType = vt_UNION OR ElType = vt_UDT THEN
    TD->Elements[TD->EleCnt].ElementID = DefsID(EType$)
  ELSE
    TD->Elements[TD->EleCnt].ElementID = 0
  END IF
  TD->Elements[TD->EleCnt].ElementName$ = EName$
  TD->EleCnt = 1 + TD->EleCnt

END SUB ' AddTypedefElement





FUNCTION GetElement$(StartStk, BYREF vt, BYREF dms, id)
  DIM RAW BC = 0, i, ZZ$

  FOR i = StartStk+1 TO Ndx
    IF Stk$[i] = "[" THEN
      INCR BC
    ELSEIF Stk$[i] = "]" THEN
      DECR BC
    ELSEIF BC = 0 THEN
      IF iMatchLft(Stk$[i], "->") OR *Stk$[i] = ASC(".") THEN
        ZZ$ = Clean$(Stk$[i])
        RemoveAll(ZZ$, ".->(*)", 1)
        vt = GetElementInfo(&id, &dms, ZZ$)
        IF vt <> vt_STRUCT AND vt <> vt_UNION THEN EXIT FOR
      END IF
    END IF
  NEXT

  IF vt = vt_UDT OR vt = vt_UNION OR vt = vt_STRUCT THEN
    ZZ$ = TypeDefs[id].VarName$
  ELSE
    ZZ$ = GetVarTypeName(vt)
  END IF
  FUNCTION = ZZ$
END FUNCTION






FUNCTION GetElementInfo(BYREF DefID, BYREF EPtr, Elename$)
  DIM RAW i, id
  id = DefID
  FOR i = 0 TO TypeDefs[id].EleCnt - 1
    IF Elename$ = TypeDefs[id].Elements[i].ElementName$ THEN
      DefID = TypeDefs[id].Elements[i].ElementID
      EPtr  = TypeDefs[id].Elements[i].ElementDynaPtr
      FUNCTION = TypeDefs[id].Elements[i].ElementType
    END IF
  NEXT

  FUNCTION = 0
END FUNCTION





SUB HandleNonsense
  DIM RAW i
  FOR i = 1 TO Ndx    ' tolerate nonsense like DIM A% as double
    IF iMatchWrd(Stk$[i],"as") THEN Stk$[i - 1] = Clean$(Stk$[i - 1])
    IF OptionBase THEN   ' This was the easiest way I could see to do this!
      IF Stk$[i] = "[" THEN Stk$[i+1] = LTRIM$(STR$(OptionBase)) + "+" + Stk$[i+1]
    END IF
  NEXT
END SUB ' HandleNonsense





SUB ValidVar(v$)
  DIM RAW ZZ$

  IF NOT isalpha(*v$) AND *v$ <> ASC("_") THEN
    IF NOT iMatchLft(v$, "(*") THEN  ' Allow byref format (*A).xxx
      Abort("Invalid String Variable Name")
    END IF
  END IF

  IF RestrictedWords(v$) AND TestState THEN
    ZZ$ = "Variable " + v$ + " on line"
    ZZ$ = ZZ$ + STR$(ModuleLineNos[ModuleNdx]) + " in Module: " + TRIM$(Modules$[ModuleNdx]) + " is a Restricted Word"
    CALL Warning(ZZ$)
  END IF
END SUB ' ValidVar




SUB PointerFix
  Stk$[Ndx-1] = Stk$[Ndx-1] + Stk$[Ndx]
  Stk[Ndx][0] = 0
  Ndx--
  WHILE TALLY(Stk$[Ndx],"*") = LEN(Stk$[Ndx])
    Stk$[Ndx-1] = Stk$[Ndx-1] + Stk$[Ndx]
    Stk[Ndx][0] = 0
    Ndx--
  WEND
END SUB ' PointerFix





SUB DimDynaString(SVar$, DG, s)
  DIM RAW A
  DIM RAW DS$

  DS$ = "if(" + SVar$ + ")free(" + SVar$ + ");"
  IF InFunc AND (IsLocal OR IsDim OR IsRaw OR IsAuto OR IsRegister) AND DG = 0 THEN
    LocalDynaCnt++
    DynaStr$[LocalDynaCnt] = DS$
    IF IsAuto THEN
      FPRINT Outfile,Scoot$ ;"auto char *";SVar$;";"
    ELSEIF IsRegister THEN
      FPRINT Outfile,Scoot$ ;"register char *";SVar$;";"
    ELSE
      FPRINT Outfile,Scoot$ ;"char *";SVar$;";"
    END IF
    CALL AddLocal(SVar$, vt_CHAR, 0,"",1,0,0)
  ELSE
    IF Use_GenFree THEN
      GlobalDynaCnt++ 
      GlobalDynaStr$[GlobalDynaCnt] = DS$
    END IF
    IF DG = 2 THEN
      CALL AddGlobal(SVar$, vt_CHAR, 0,"",1,0,1,0)
    ELSE
      IF s THEN
        CALL AddGlobal(SVar$, vt_CHAR, 0,"",1,0,2,0)
      ELSE
        CALL AddGlobal(SVar$, vt_CHAR, 0,"",1,0,0,0)
      END IF
    END IF
  END IF
  IF DG <> 2 THEN
    FPRINT Outfile,Scoot$ ; SVar$ ; "=(char*)calloc(256+";
    FOR A = 4 TO Ndx
      FPRINT Outfile,Clean$(Stk$[A]);
    NEXT
    FPRINT Outfile,",1);"
  END IF
END SUB ' DimDynaString




FUNCTION SubFuncTest
  IF iMatchWrd(Stk$[2],"function") OR iMatchWrd(Stk$[2],"sub") THEN
    FUNCTION = 1
  END IF
  FUNCTION = 0
END FUNCTION ' SubFuncTest




FUNCTION DimSubFunc(IsDynamic)
  '******************************
  DIM RAW i
  DIM RAW lszTmp$
  'DIM RAW AsPos      = Ndx
  DIM RAW StartPoint = 3
  DIM RAW Funptr     = 0

  '******************************
  lszTmp$ =   ""

  IF iMatchWrd(Stk$[Ndx],"stdcall") THEN
    CallType$ = "__stdcall "
    Ndx--
    IsStdFunc = TRUE
  ELSE
    CallType$ = "__cdecl "    ' Default calling convention
    IsStdFunc = FALSE
  END IF

  GLOBAL SFPOINTER
  DIM AUTO FP AS functionParse
  'DIM RAW TempProto$
  'CALL FuncSubDecs1("") 'convert [] to pointer * and $[] to [][2048]

  '------------------------------------------------------
  '  Convert dynamic array notation [] to pointer *
  '------------------------------------------------------
  '  IF IsDynamic THEN
  '    FOR i = 4 TO Ndx
  '      IF Stk$[i] = "[" AND Stk$[i+1] = "]" THEN
  '        Stk$[i]   = ""
  '        Stk$[i+1] = ""
  '        INCR Funptr
  '        INCR i
  '      ELSE
  '        EXIT FOR
  '      END IF
  '    NEXT i
  '    IF Funptr THEN CALL RemEmptyTokens
  '  END IF

  '------------------------------------------------------
  '  Find start of function body ( ... )
  '------------------------------------------------------
  CALL SepFuncArgs(3, &FP, TRUE)
  StartPoint = MAX(FP.CommaPos[0], 3)


  IF NOT InTypeDef THEN
    SFPOINTER = TRUE
    '------------------------------------------------------
    '  Get intialized data  " = xxx" or "= {xxx,xxx}"
    '------------------------------------------------------
    IF FP.NumArgs = 0 THEN
      i = MIN(FP.CommaPos[1]+1, Ndx)
    ELSE
      i = MIN(FP.CommaPos[FP.NumArgs]+1, Ndx)
    END IF

    IF Stk$[i] = "=" THEN
      Stk$[i++] = ""
      WHILE NOT iMatchWrd(Stk$[i], "as") AND i <= Ndx
        lszTmp$ = lszTmp$ +Stk$[i]
        Stk$[i++] = ""
      WEND
      RemoveAll(lszTmp$, "{}", 1)
      IF lszTmp$ <> "" THEN CALL RemEmptyTokens
    END IF
    '------------------------------------------------------

    FPRINT FP4, MakeDecProto$(&FP), ";"
    SFPOINTER = FALSE

    Ndx = StartPoint
    Stk$[2] = ""
    IF lszTmp$ <> "" THEN
      Stk$[Ndx++] = "="
      Stk$[Ndx++] = "{"
      Stk$[Ndx++] = Clean$(lszTmp$)
      Stk$[Ndx++] = "}"
    END IF
    Stk$[Ndx++] = "as"
    Stk$[Ndx] = Clean$(Stk$[3]) + "_TYPE" + STRING$(Funptr, ASC("*"))
    CALL RemEmptyTokens
    FUNCTION = FALSE

  ELSE
    FPRINT Outfile, Scoot$, MakeDecProto$(&FP), ";"
  END IF

  FUNCTION = TRUE
END FUNCTION ' DimSubFunc






SUB Emit
  '******************************
  DIM RAW HasStorage = 0
  DIM RAW A,B,i,j,Tmp
  DIM RAW FuncRetnFlag
  DIM RAW IsPointer = 0
  DIM RAW VType
  DIM RAW id = 0
  DIM RAW k  = 0
  DIM RAW vt = 0
  DIM RAW Arg$
  DIM RAW CVar$
  DIM RAW Keyword$
  DIM RAW lszTmp$
  DIM RAW Var1$
  DIM RAW ZZ$
  DIM RAW IsSubOrFuncPtr
  DIM RAW dms
  STATIC NoBreak
  STATIC NoBreak2

  '******************************
  FuncRetnFlag  =   0
  lszTmp$       =  ""
  ZZ$           =  ""
  '******************************

  '*************************************
  ' Resets the break suppression flag if
  ' any keyword follows other than these
  '*************************************

  Keyword$ = LCASE$(Stk$[1])

  IF NoBreak2 AND NOT iMatchLft(Keyword$,"case") AND NOT iMatchWrd(Keyword$,"endselect") THEN
    NoBreak2 = 0
  END IF

  '*********************
  EmitAgain:
  '*********************
  IF Ndx = 0 THEN EXIT SUB

  Statements++

  IF iMatchRgt(Stk$[1], ":") THEN    'This Must Be A Label
    FPRINT Outfile,""
    FPRINT Outfile,UCASE$(Stk$[1]),";"
    EXIT SUB
  END IF

  IF (CurrentFuncType = vt_STRVAR) AND InFunc AND OkayToSend THEN
    FPRINT Outfile,Scoot$,"char *BCX_RetStr={0};"
    OkayToSend = 0
  END IF


  '**************************
  '  SingleLineIfReEntry:
  '**************************

  Lookup$ = LCASE$(Stk$[1])

  SELECT CASE Lookup$

    '********************************************************************
    CASE "loadclut"
    '********************************************************************

    lszTmp$ = "" 

	FPRINT Outfile,Scoot$,"loadclut(";
	
    FOR j = 2 TO Ndx                 ' Allow size to be an expression
      IF Stk$[j]= "(" THEN EXIT FOR
      CONCAT(lszTmp$, Clean$(Stk$[j]))
    NEXT
	FPRINT Outfile,lszTmp$;
	
	j++
    FOR i = j TO Ndx                 ' Allow size to be an expression
      IF Stk$[i]= "," THEN EXIT FOR
      CONCAT(lszTmp$, Clean$(Stk$[i]))
    NEXT
	FPRINT Outfile,"(unsigned short *)";lszTmp$;",";
	
    i++
    lszTmp$ = ""
    FOR j = i TO Ndx                 ' Allow size to be an expression
      IF Stk$[j]= "," THEN EXIT FOR
      CONCAT(lszTmp$, Clean$(Stk$[j]))
    NEXT
	FPRINT Outfile,lszTmp$;",";
	
    j++
    lszTmp$ = ""
	
    FOR i = j TO Ndx                 ' Allow size to be an expression
      IF Stk$[i]= "," THEN EXIT FOR
      CONCAT(lszTmp$, Clean$(Stk$[i]))
    NEXT

    FPRINT Outfile,lszTmp$;";"

    '********************************************************************
    CASE "vsync"
    '********************************************************************
    FPRINT Outfile,Scoot$,"RUPDALL(0);"

    '********************************************************************
    CASE "lpoke", "dpoke", "poke"
    '********************************************************************

    lszTmp$ = ""

    FOR i = 2 TO Ndx                 ' Allow size to be an expression
      IF Stk$[i]= "," THEN EXIT FOR
      CONCAT(lszTmp$, Clean$(Stk$[i]))
    NEXT
    
    if left$(Lookup$,1)="l" then
      FPRINT Outfile,Scoot$,"*(volatile unsigned int*)(";lszTmp$;")=(volatile unsigned int)";
    elseif left$(Lookup$,1)="d" then
      FPRINT Outfile,Scoot$,"*(volatile unsigned short*)(";lszTmp$;")=(volatile unsigned short)";
    elseif left$(Lookup$,1)="p" then
      FPRINT Outfile,Scoot$,"*(volatile unsigned char*)(";lszTmp$;")=(volatile unsigned char)";
    endif

    i++
    lszTmp$ = ""

    FOR j = i TO Ndx                 ' Allow size to be an expression
      IF Stk$[j]= "," THEN EXIT FOR
      CONCAT(lszTmp$, Clean$(Stk$[j]))
    NEXT

    FPRINT Outfile,Scoot$,lszTmp$;";"

    '********************************************************************
    CASE "colour"
    '********************************************************************

    lszTmp$ = ""

    FOR i = 2 TO Ndx                 ' Allow size to be an expression
      IF Stk$[i]= "," THEN EXIT FOR
      CONCAT(lszTmp$, Clean$(Stk$[i]))
    NEXT

    FPRINT Outfile,Scoot$,"plot_colour=";lszTmp$;"<<4;"

    '********************************************************************
    CASE "rprint"
    '********************************************************************
    lszTmp$ = ""

    FOR i = 2 TO Ndx                 ' Allow size to be an expression
      IF Stk$[i]= "," THEN EXIT FOR
      CONCAT(lszTmp$, Clean$(Stk$[i]))
    NEXT

    FPRINT Outfile,Scoot$,"basic_r_buffer=(char *)";lszTmp$;";"
    FPRINT Outfile,Scoot$,"RPRINT();"

    '********************************************************************
    CASE "rprintint"
    '********************************************************************
    lszTmp$ = ""

    FOR i = 2 TO Ndx                 ' Allow size to be an expression
      IF Stk$[i]= "," THEN EXIT FOR
      CONCAT(lszTmp$, Clean$(Stk$[i]))
    NEXT

    FPRINT Outfile,Scoot$,"basic_r_buffer=ee_printf("+DQ$+"%d"+DQ$+",";lszTmp$;");"
    FPRINT Outfile,Scoot$,"RPRINT();"

    '********************************************************************
    CASE "rlocate"
    '********************************************************************
    lszTmp$ = ""

    FOR i = 2 TO Ndx                 ' Allow size to be an expression
      IF Stk$[i]= "," THEN EXIT FOR
      CONCAT(lszTmp$, Clean$(Stk$[i]))
    NEXT

    FPRINT Outfile,Scoot$,"RLOCATE(";lszTmp$;",";

    i++

    lszTmp$ = ""

    FOR j = i TO Ndx                 ' Allow size to be an expression
      CONCAT(lszTmp$, Clean$(Stk$[j]))
    NEXT

    FPRINT Outfile,lszTmp$;");"

    '********************************************************************
    CASE "fprint", "lprint", "sprint"  'LPRINT & FPRINT  handle,{list}
    '********************************************************************
    DIM RAW IsLprint = FALSE
    DIM RAW IsSprint = FALSE

    IF iMatchWrd(Stk$[1],"lprint") THEN
      Use_Proto = IsLprint = IsSprint = TRUE
      Stk$[1] = "sprint"
      Ndx++
      FOR i = Ndx TO 1 STEP -1
        Stk$[i] = Stk$[i-1]
      NEXT
      INCR Ndx,1
      FOR i = Ndx TO 1 STEP -1
        Stk$[i] = Stk$[i-1]
      NEXT
      Stk$[2] = "BcxPtr_Buffer"
      Stk$[3] = ","
    END IF

    IF iMatchWrd(Stk$[1],"sprint") THEN
      IsSprint = TRUE
    END IF

    IF IsNumber(Stk$[2]) THEN
      Stk$[2] = "FP" + Stk$[2]
    END IF

    IF IsSprint THEN
      Handle$ = Clean$(Stk$[2])
    ELSE
      IF LCASE$(Stk$[2]) = "stderr" THEN
        Handle$ = LCASE$(Stk$[2])
      ELSE

        IF CheckLocal(Stk$[2], &i) = vt_UNKNOWN THEN
          IF CheckGlobal(Stk$[2], &i) = vt_UNKNOWN THEN
            CALL AddGlobal(Stk$[2], vt_FILEPTR, 0,"",0,0,0,0)
          END IF
        END IF

        Handle$ = ""
        FOR i = 2 TO Ndx
          IF *Stk$[i] = ASC(",") OR *Stk$[i] = ASC(";") THEN
            Stk$[i] = ""
            EXIT FOR
          END IF
          Handle$ = Handle$ + Stk$[i]
          Stk$[i] = ""
        NEXT i

        Handle$ = Handle$ + "@"
      END IF
    END IF

    Stk$[2] = ""  'get rid of handle
    Stk$[3] = ""  'get rid of the Comma

    IF IsSprint THEN
      ZZ$ = "s" + PrintWriteFormat$(0)
      REMOVE "\\n" FROM ZZ$
    ELSE
      ZZ$ = "f" + PrintWriteFormat$(0)
    END IF

    ZZ$ = LEFT$(ZZ$,8) + REMOVE$(Handle$,"@") + "," + MID$(ZZ$,9)

    IF IsLprint THEN
      FPRINT Outfile,Scoot$, ZZ$
      FPRINT Outfile,Scoot$, "PrinterWrite(BcxPtr_Buffer);"
      IF NOT Use_Printer THEN
        SrcTmp$ = "printer" : Parse(SrcTmp$) : Emit()    ' Force printer globals declarations
      END IF
    ELSE
      FPRINT Outfile,Scoot$, ZZ$
    END IF

    '***********************
    CASE "end"
    '***********************

    IF Ndx = 1 THEN
      IF Use_Wingui = FALSE THEN
        FPRINT Outfile,Scoot$,"fflush(stdout);"
      END IF
      FPRINT Outfile,Scoot$,"ExitProcess(0);"
      EXIT SELECT
    END IF

    IF Stk$[2] = "=" THEN
      IF Use_Wingui = FALSE THEN
        FPRINT Outfile,Scoot$,"fflush(stdout);"
      END IF
      FPRINT Outfile,Scoot$,"ExitProcess(";
      FOR Tmp = 3 TO Ndx
        FPRINT Outfile,Clean$(Stk$[Tmp]);
      NEXT
      FPRINT Outfile,");"
      EXIT SELECT
    END IF

    IF iMatchWrd(Stk$[2],"if") THEN
      CALL BumpDown
      FPRINT Outfile,Scoot$,"}"
      CALL BumpDown
      EXIT SELECT
    END IF

    '***********************
    CASE "endif"
    '***********************

    CALL BumpDown
    FPRINT Outfile,Scoot$,"}"
    CALL BumpDown

    '***********************
    CASE "if"
    '***********************

    CALL EmitIfCond("if")

    '***********************
    CASE "elseif"
    '***********************

    CALL BumpDown
    FPRINT Outfile,Scoot$,"}"
    CALL BumpDown
    CALL EmitIfCond("else if")

    '******************************************************
    CASE "for"
    '******************************************************
    IF iMatchWrd(Stk$[2],"each") THEN ' "each" becomes reserved keyword

      FPRINT Outfile, Scoot$, "Not implemented!"

    ELSE ' this is "Normal" For - Next Loop
      DIM RAW FFlg = 0
      DIM RAW For1 = 0
      DIM RAW For2 = 0
      DIM RAW For3 = 0
      DIM RAW For4 = 0
      DIM RAW Reg$, xxx$, yyy$, zzz$, qqq$

      Reg$ = ""
      xxx$ = ""
      yyy$ = ""
      zzz$ = ""
      qqq$ = ""

      '******************************************************
      FOR i = Ndx TO 1 STEP -1
        IF iMatchWrd(Stk$[i],"step") THEN
          FFlg = TRUE
          EXIT FOR
        END IF
      NEXT

      IF NOT FFlg THEN
        Ndx++
        Stk$[Ndx] = "step"
        Ndx++
        Stk$[Ndx] = "1"
      END IF
      '******************************************************
      Test = FALSE

      FOR i = 1 TO Ndx
        IF Stk$[i]= "=" THEN Test = TRUE
      NEXT

      IF Test = FALSE THEN Abort("Missing =")
      '******************************************************
      Test = FALSE

      FOR i = 1 TO Ndx
        IF iMatchWrd(Stk$[i],"to") THEN Test = TRUE
      NEXT

      IF Test = FALSE THEN Abort("Missing TO")
      '******************************************************

      Reg$ = LCASE$(Stk$[2])

      SELECT CASE Reg$
        CASE "int","fint"
        Reg$ = SPC$
        LoopLocalVar[LoopLocalCnt++] = 1
        FPRINT Outfile,Scoot$,"  {register int ";

        CASE "single", "float"
        Reg$ = SPC$
        LoopLocalVar[LoopLocalCnt++] = 1
        FPRINT Outfile,Scoot$,"  {float ";

        CASE "double"
        Reg$ = SPC$
        LoopLocalVar[LoopLocalCnt++] = 1
        FPRINT Outfile,Scoot$,"  {double ";

        CASE "ldouble"
        Reg$ = SPC$
        LoopLocalVar[LoopLocalCnt++] = 1
        FPRINT Outfile,Scoot$,"  {LDOUBLE ";

        CASE ELSE
        Reg$ = ""
        LoopLocalVar[LoopLocalCnt++] = 0
      END SELECT

      IF LEN(Reg$) THEN
        FOR j = 3 TO Ndx
          Stk$[j-1] = Stk$[j]
        NEXT
        Ndx--
      END IF

      '******************************************************
      ' Every statement now conforms to the following:
      ' FOR xxx = yyy TO zzz STEP qqq
      '******************************************************

      FOR i = 2 TO Ndx
        IF Stk$[i] = "=" THEN
          For1 = i-1       'xxx spans from Stk$[2] to Stk$[For1]
          EXIT FOR
        END IF
      NEXT

      FOR i = For1+2 TO Ndx
        IF iMatchWrd(Stk$[i],"to") THEN
          For2 = i-1       'yyy spans from Stk$[For1+2] to Stk$[For2]
          EXIT FOR
        END IF
      NEXT

      FOR i = For2+2 TO Ndx
        IF iMatchWrd(Stk$[i],"step") THEN
          For3 = i-1       'zzz spans from Stk$[For2+2] to Stk$[For3]
          EXIT FOR
        END IF
      NEXT

      For4 = For3+2        'qqq spans from Stk$[For4] to Stk$[Ndx]

      FOR i = 2 TO For1
        CONCAT(xxx$,Stk$[i])
      NEXT

      FOR i = For1+2 TO For2
        CONCAT(yyy$,Stk$[i])
      NEXT

      FOR i = For2+2 TO For3
        CONCAT(zzz$,Stk$[i])
      NEXT

      FOR i = For4 TO Ndx
        CONCAT(qqq$,Stk$[i])
      NEXT

      xxx$ = Clean$(xxx$)
      yyy$ = Clean$(yyy$)
      zzz$ = Clean$(zzz$)
      qqq$ = Clean$(qqq$)

      IF Reg$ = SPC$ THEN FPRINT Outfile, xxx$, ";"
      Reg$ = ""

      IF IsNumberEx (qqq$) THEN
        IF LEFT$(qqq$,1) = "-" THEN
          FPRINT Outfile,Scoot$,"for(", Reg$, xxx$, "=", yyy$, "; ", xxx$, ">=" , zzz$, "; " , xxx$, "+=" , qqq$, ")"
        ELSE
          FPRINT Outfile,Scoot$,"for(", Reg$, xxx$, "=", yyy$, "; ", xxx$, "<=" , zzz$, "; " , xxx$, "+=" , qqq$, ")"
        END IF
      ELSE
        FPRINT Outfile,Scoot$,"for(", Reg$, xxx$, "=", yyy$, "; ", qqq$, ">=0 ? ", xxx$, "<=" , zzz$, " : ", xxx$, ">=", zzz$, "; " , xxx$, "+=" , qqq$, ")"
      END IF

      CALL BumpUp
      FPRINT Outfile,Scoot$,"{"
      CALL BumpUp
    END IF

    '***********************
    CASE "next"
    '***********************

    CALL BumpDown
    FPRINT Outfile,Scoot$,"}"
    IF LoopLocalVar[--LoopLocalCnt] THEN FPRINT Outfile,Scoot$,"}"
    IF LoopLocalCnt < 0 THEN Abort ("Next without For")
    CALL BumpDown

    '***********************
    CASE "do"
    '***********************

    FPRINT Outfile,Scoot$,"for(;;)"
    CALL BumpUp
    FPRINT Outfile,Scoot$,"{"
    CALL BumpUp

    '***********************
    CASE "loop"
    '***********************

    CALL BumpDown
    FPRINT Outfile,Scoot$,"}"
    CALL BumpDown

    '***********************
    CASE "caseelse"
    '***********************
    CaseElseFlag[Pusher] = TRUE

    IF CaseFlag THEN
      IF NoBreak2 = 0 THEN
        FPRINT Outfile,Scoot$,"break;"
      END IF
      CALL BumpDown
      FPRINT Outfile,Scoot$,"}"
      FPRINT Outfile,Scoot$,"// case else"
      FPRINT Outfile,Scoot$,"{"
      CALL BumpUp
    END IF

    '***********************
    CASE "endselect"
    '***********************

    IF CaseFlag THEN
      CALL BumpDown
      FPRINT Outfile,Scoot$,"}"
    END IF
    CALL BumpDown
    ' Only suppress this break if the Case block contains
    ' a "CASE ELSE" and the last statement is a redirection.
    IF CaseElseFlag[Pusher] = 0 OR NoBreak2 = 0 THEN
      FPRINT Outfile,Scoot$,"break;"
    END IF
    CALL BumpDown
    FPRINT Outfile,Scoot$,"}"

    NoBreak2 = CaseElseFlag[Pusher] = 0
    CALL Pop(CaseVar$)


    '***********************
    CASE "else"
    '***********************

    CALL BumpDown
    FPRINT Outfile,Scoot$,"}"
    CALL BumpDown
    FPRINT Outfile,Scoot$,"else"
    CALL BumpUp
    FPRINT Outfile,Scoot$,"{"
    CALL BumpUp

    ' **************
    CASE "case"
    ' **************

    FOR i = 2 TO Ndx

      IF Stk$[i] = "%" THEN Stk$[i] = " % "    ' Added by MrBCX 3.36

      IF Stk$[i] = "!=" THEN Stk$[i] = "<>"
      IF Stk$[i] = "!" AND Stk$[i+1] = "=" THEN
        Stk$[i] = "<>" : Stk$[i+1] = ""
      END IF

      IF isalpha(Stk[i][0]) THEN
        CONCAT(Stk$[i]," ")
      END IF
    NEXT

    szTmp$ = ""

    Test = FALSE

    IF DataType(CaseVar$) = vt_STRVAR THEN Test = TRUE
    i = 0
    FOR A = 2 TO Ndx
      IF INCHR("([",Stk$[A]) THEN i++
      IF INCHR(")]",Stk$[A]) THEN i--
      IF i THEN
        CONCAT(szTmp$, Stk$[A])
        ITERATE
      END IF

      IF Stk$[A] = "," THEN   ' comma
        IF NOT INCHR("<>=",Stk$[A+1]) THEN
          szTmp$ = szTmp$ + " or " + CaseVar$ + "="
        ELSE
          szTmp$ = szTmp$ + " or " + CaseVar$
        END IF
        Stk$[A] = ""
        ITERATE
      END IF

      IF Stk$[A] = "&&" THEN
        szTmp$ = szTmp$ + " and " + CaseVar$
        Stk$[A]= ""
      ELSEIF Stk$[A] = "||" THEN
        szTmp$ = szTmp$ + " or "  + CaseVar$
        Stk$[A]= ""
      ELSE
        CONCAT(szTmp$, Stk$[A])
      END IF
    NEXT

    IF CaseFlag = 0 THEN NoBreak = 0
    IF CaseFlag THEN
      IF NoBreak = 0 THEN
        IF NoBreak2 = 0 THEN FPRINT Outfile,Scoot$;"break;"
      END IF
      CALL BumpDown()
      FPRINT Outfile,Scoot$;"}"
      CALL BumpDown()
    END IF

    CaseFlag = TRUE
    IF iMatchLft(CaseVar$," BAND ") THEN
      NoBreak = 1
      Src$ = "IF " + szTmp$ + CaseVar$ + " Then "
    ELSE
      IF INCHR("<>=",szTmp$) AND NOT IsQuoted(szTmp$) THEN
        Src$ = "IF " + CaseVar$ + szTmp$ + " Then "
      ELSE
        Src$ = "IF " + CaseVar$ + " = " + szTmp$ + " Then "
      END IF
    END IF

    CALL Parse(Src$)
    CALL Emit()

    '***********************
    CASE "textmode"
    '***********************

    lszTmp$ = ""

    FOR i = 2 TO Ndx                 'allow size to be an expression
      CONCAT(lszTmp$, Clean$(Stk$[i]))
    NEXT

    FPRINT Outfile,Scoot$, "TextMode("; lszTmp$ ; ");"

    '***********************
    CASE "qsortidx"          'qsortidx idx, size_of_array, A$, key
    '***********************
    UseFlag = TRUE
    lszTmp$ = ""
    Var$ = Clean$(Stk$[2])             'index array
    FOR i = 4 TO Ndx-4                 'allow size to be an expression
      CONCAT(lszTmp$, Stk$[i])
    NEXT
    lszTmp$ = Clean$(lszTmp$)

    FPRINT Outfile,Scoot$,"Key = ",Stk[Ndx],";"

    IF Var$ <> "0" THEN
      FPRINT Outfile,Scoot$,"register int iDx;"
      FPRINT Outfile,Scoot$,"for(iDx=0; iDx<",lszTmp$,"; iDx+=1) ";
      FPRINT Outfile, Var$,"[iDx]=iDx;"
    END IF

    IF NOT INCHR(Stk$[Ndx-2],".") THEN   'Check if this is a struct sort
      Use_Idxqsort = TRUE
      FPRINT Outfile,Scoot$,"pppStr = ",Clean$(Stk[Ndx-2]),";"
      FPRINT Outfile,Scoot$,"qsort(";Var$;",";lszTmp$;",sizeof(int),IdxCompare);"
    ELSE

      DIM RAW Stptr$, StMem$, StName$

      StMem$ = REMAIN$(Clean$(Stk$[Ndx-2]),".")
      Stptr$ = EXTRACT$(Stk$[Ndx-2],".")

      IF CheckLocal(Stptr,&i) <> vt_UNKNOWN THEN
        StName$ = TypeDefs[LocalVars[i].VarDef].VarName$
      ELSEIF CheckGlobal(Stptr,&i) <> vt_UNKNOWN THEN
        StName$ = TypeDefs[GlobalVars[i].VarDef].VarName$
      END IF

      IF Var$ <> "0" THEN
        Use_IdxqsortSt = TRUE
        FPRINT Outfile,Scoot$,"cmp1 =(char*)(",Stptr$ ,") + offsetof(",StName$,",",StMem$,");"
        FPRINT Outfile,Scoot$,"StructSize = sizeof(",StName$,");"
        FPRINT Outfile,Scoot$,"qsort(",Var$;",",lszTmp$,",sizeof(int),IdxCompareSt);"
      ELSE
        Use_PtrqsortSt = TRUE
        FPRINT Outfile,Scoot$,"OffSet = offsetof(",StName$,",",StMem$,");"
        FPRINT Outfile,Scoot$,"qsort(",Stptr$;",",lszTmp$,",sizeof(",StName$,"),PtrCompareSt);"
      END IF
    END IF

    '***********************
    CASE "qsort"    'qsort A$,size_of_array,ascending|descending
    '***********************

    DIM RAW QST=0
    DIM RAW order=0

    UseFlag = TRUE

    IF iMatchWrd(Stk$[2],"dynamic") THEN
      QST = TRUE
      FOR j = 3 TO Ndx
        Stk$ [j-1] = Stk$[j]
      NEXT
      Ndx--
    END IF

    IF LCASE$(Stk$[Ndx])= "ascending"  THEN
      order = 2
      Ndx--
      Ndx--
    END IF

    IF LCASE$(Stk$[Ndx])= "descending" THEN
      order = 1
      Ndx--
      Ndx--
    END IF

    IF order = 0 THEN order = 2      'default to ascending

    lszTmp$ = ""

    FOR i = 4 TO Ndx                 'allow size to be an expression
      CONCAT(lszTmp$, Stk$[i])
    NEXT

    Var$ = Clean$(Stk$[2])
    vt = DataType(Stk$[2])

    IF vt <> vt_STRVAR AND vt <> vt_INTEGER AND vt <> vt_SINGLE AND vt <> vt_DOUBLE THEN
      vt = CheckType(Stk$[2])
    END IF

    FPRINT Outfile,Scoot$,"qsort(";Var$;",";Clean$(lszTmp$);

    SELECT CASE vt
      CASE vt_STRVAR
      IF NOT QST THEN
        IF order = 1 THEN
          FPRINT Outfile,",sizeof(";Var$;"[0]),StrCompareD);"
          Use_Strqsortd = TRUE
        ELSE
          FPRINT Outfile,",sizeof(";Var$;"[0]),StrCompareA);"
          Use_Strqsorta = TRUE
        END IF
      ELSE
        IF order = 1 THEN
          FPRINT Outfile,",sizeof(";Var$;"[0]),DynStrCompareD);"
          Use_DynStrqsortd = TRUE
        ELSE
          FPRINT Outfile,",sizeof(";Var$;"[0]),DynStrCompareA);"
          Use_DynStrqsorta = TRUE
        END IF
      END IF

      CASE vt_INTEGER
      IF order = 1 THEN
        FPRINT Outfile,",sizeof(int),NumCompareDint);"
        Use_Numqsortdint = TRUE
      ELSE
        FPRINT Outfile,",sizeof(int),NumCompareAint);"
        Use_Numqsortaint = TRUE
      END IF

      CASE vt_SINGLE
      IF order = 1 THEN
        FPRINT Outfile,",sizeof(float),NumCompareDfloat);"
        Use_Numqsortdfloat = TRUE
      ELSE
        FPRINT Outfile,",sizeof(float),NumCompareAfloat);"
        Use_Numqsortafloat = TRUE
      END IF

      CASE vt_DOUBLE
      IF order = 1 THEN
        FPRINT Outfile,",sizeof(double),NumCompareDdouble);"
        Use_Numqsortddouble = TRUE
      ELSE
        FPRINT Outfile,",sizeof(double),NumCompareAdouble);"
        Use_Numqsortadouble = TRUE
      END IF

      CASE ELSE
      IF order = 1 THEN
        FPRINT Outfile,",sizeof(int),NumCompareDint);"
        Use_Numqsortdint = TRUE
      ELSE
        FPRINT Outfile,",sizeof(int),NumCompareAint);"
        Use_Numqsortaint = TRUE
      END IF
    END SELECT

    '***********************
    CASE "endprogram"    'Force END of main- allow inclusions outside of main
    '***********************

    FPRINT Outfile,"  while(1) {};   //  End of main program"
    'FPRINT Outfile,"return 0;         //  End of main program"
    FPRINT Outfile,"}\n\n"
    EndOfProgram = 1

    '******************************
    ' Allow Conditional Compilation
    '******************************

    '***********************
    CASE "~ifndef"
    '***********************

    InIfDef$ = "#ifndef "
    FOR i = 2 TO Ndx
      InIfDef$ = InIfDef$ + Stk$[i] + " "
    NEXT
    InIfDef$ = TRIM$(InIfDef$)
    IF InFunc OR InMain THEN
      FPRINT Outfile,InIfDef$
    ELSE
      FPRINT FP6,InIfDef$
    END IF

    '***********************
    CASE "~if"
    '***********************

    InIfDef$ = "#if defined "
    FOR i = 2 TO Ndx
      InIfDef$ = InIfDef$ + Stk$[i] + " "
    NEXT
    InIfDef$ = TRIM$(InIfDef$)
    ConstLastDef$ = InIfDef$
    IF InFunc THEN
      IF Outfile = FP3 THEN FPRINT Outfile,"// FP3"
      IF Outfile = FP2 THEN FPRINT Outfile,"// FP2"
      FPRINT Outfile,InIfDef$,"// OUTFILE"
      InIfDef$ = "FP3"
    ELSEIF InMain THEN
      FPRINT Outfile, InIfDef$, "// --FP2--"
    END IF

    '***********************
    CASE "~else"
    '***********************

    InIfDef$ = "#else"
    ConstLastDef$ = InIfDef$
    IF InFunc OR InMain THEN
      FPRINT Outfile,InIfDef$
    ELSE
      FPRINT FP6,InIfDef$
    END IF

    '***********************
    CASE "~elseif"
    '***********************

    InIfDef$ = "#elif defined "
    FOR i = 2 TO Ndx
      InIfDef$ = InIfDef$ + Stk$[i] + " "
    NEXT
    InIfDef$ = TRIM$(InIfDef$)
    ConstLastDef$ = InIfDef$
    IF InFunc OR InMain THEN
      FPRINT Outfile, InIfDef$
    ELSE
      FPRINT FP6, InIfDef$
    END IF

    '***********************
    CASE "~endif"
    '***********************

    IF InIfDef$ = "FP3" THEN
      FPRINT FP3, "#endif  // FP3"
    ELSE 'elseif InMain THEN
      FPRINT Outfile, "#endif  // Main"
    END IF

    IF ConstLastDef$ = "FP6" THEN
      FPRINT FP6, "#endif  // FP6"
    END IF
    InIfDef$ = "#endif  // other"


    IF InConditional = 0 THEN
      InIfDef$ = ""
      ConstLastDef$ = ""
      'DidConsts = 0
    END IF

    '***********************
    CASE "~pragmaoptimizeon"
    '***********************

    FPRINT Outfile,"#ifdef __POCC__"
    FPRINT Outfile,"#pragma optimize(time)"
    FPRINT Outfile,"#endif"

    FPRINT Outfile,"#ifdef __LCC__"
    FPRINT Outfile,"#pragma optimize(1)"
    FPRINT Outfile,"#endif"

    '***********************
    CASE "~pragmaoptimizeoff"
    '***********************

    FPRINT Outfile,"#ifdef __POCC__"
    FPRINT Outfile,"#pragma optimize(none)"
    FPRINT Outfile,"#endif"

    FPRINT Outfile,"#ifdef __LCC__"
    FPRINT Outfile,"#pragma optimize(0)"
    FPRINT Outfile,"#endif"

    '***********************
    CASE "incr"
    '***********************

    j=FALSE
    FPRINT Outfile,Scoot$;
    FOR i=2 TO Ndx
      IF Stk$[i]="," THEN
        FPRINT Outfile,"+=(";
        j=TRUE
      ELSE
        FPRINT Outfile,Clean$(Stk$[i]);
      END IF
    NEXT
    FPRINT Outfile,IIF$(j,");","++;")

    '***********************
    CASE "decr"
    '***********************

    j=FALSE
    FPRINT Outfile,Scoot$;
    FOR i=2 TO Ndx
      IF Stk$[i]="," THEN
        FPRINT Outfile,"-=(";
        j=TRUE
      ELSE
        FPRINT Outfile,Clean$(Stk$[i]);
      END IF
    NEXT
    FPRINT Outfile,IIF$(j,");","--;")

    '***********************
    CASE "seek"
    '***********************

    IF DataType(Stk$[2])= vt_NUMBER THEN
      Stk$[2]= "FP" + Stk$[2]
    END IF
    IF CheckLocal(Stk$[2], &i) = vt_UNKNOWN THEN
      CALL AddGlobal(Stk$[2], vt_FILEPTR, 0,"",0,0,0,0)
    END IF

    FPRINT Outfile,Scoot$,"fseek(";
    FOR Tmp = 2 TO Ndx
      FPRINT Outfile,Clean$(Stk$[Tmp]);
    NEXT
    FPRINT Outfile,",0);"

    '***********************
    CASE "select"
    '***********************

    CaseVar$ = ""
    CaseFlag = 0

    FOR A = 3 TO Ndx
      CONCAT(CaseVar$, Stk$[A])
    NEXT

    CALL Push(CaseVar$)

    FPRINT Outfile,Scoot$,"for(;;)"
    FPRINT Outfile,Scoot$,"{"
    CALL BumpUp

    '***********************
    CASE "~get"
    '***********************

    Use_Get = TRUE
    Use_Sysmacros = TRUE

    IF DataType(Stk$[2])= vt_NUMBER THEN
      Stk$[2]= "FP" + Stk$[2]
    END IF
    IF CheckLocal(Stk$[2], &i) = vt_UNKNOWN THEN
      IF CheckGlobal(Stk$[2], &i) = vt_UNKNOWN THEN
        CALL AddGlobal(Stk$[2], vt_FILEPTR, 0,"",0,0,0,0)
      END IF
    END IF
    FPRINT Outfile,Scoot$,"GET(";
    FOR Tmp = 2 TO Ndx
      FPRINT Outfile,Clean$(Stk$[Tmp]);
    NEXT
    FPRINT Outfile,");"

    '***********************
    CASE "~put"
    '***********************

    Use_Put = TRUE
    Use_Sysmacros = TRUE

    IF DataType(Stk$[2]) = vt_NUMBER THEN
      Stk$[2]= "FP" + Stk$[2]
    END IF
    IF CheckLocal(Stk$[2], &i) = vt_UNKNOWN THEN
      IF CheckGlobal(Stk$[2], &i) = vt_UNKNOWN THEN
        CALL AddGlobal(Stk$[2], vt_FILEPTR, 0,"",0,0,0,0)
      END IF
    END IF
    FPRINT Outfile,Scoot$,"PUT(";
    FOR Tmp = 2 TO Ndx
      FPRINT Outfile,Clean$(Stk$[Tmp]);
    NEXT
    FPRINT Outfile,");"

    '***********************
    CASE "~vscroll"
    '***********************

    Use_Vscroll = VAL(Stk$[2])
    IF Use_Vscroll = 0 THEN Use_Vscroll = TRUE

    '***********************
    CASE "~hscroll"
    '***********************

    Use_Hscroll = VAL(Stk$[2])
    IF Use_Hscroll = 0 THEN Use_Hscroll = TRUE

    '***********************
    CASE "gosub"
    '***********************

    Use_Gosub = TRUE
    FPRINT Outfile,Scoot$,"if (setjmp(GosubStack[GosubNdx++])==0)";
    FPRINT Outfile," goto ";UCASE$(Stk$[2]);";"

    '***********************
    CASE "return"
    '***********************

    Use_Gosub = TRUE
    FPRINT Outfile,Scoot$,"longjmp (GosubStack [--GosubNdx],1 );"
    FPRINT Outfile,""

    '***********************
    CASE "data"
    '***********************

    IF Stk$[Ndx] <> "," THEN
      Stk$[Ndx+1] = ","
      Ndx++
    END IF
    FOR A = 2 TO Ndx
      IF INCHR(Stk$[A],DQ$) = 0 AND Stk$[A] <> "," THEN
        Stk$[A] = ENC$(Stk$[A])  ' Allow unquoted text
      END IF
      FPRINT FP5,Stk$[A];
    NEXT
    FPRINT FP5,""

    '***********************
    CASE "type"
    '***********************

    IF InTypeDef = 0 THEN
      SaveOutfileNum = Outfile
    END IF
    Outfile = FP4
    IF Ndx > 2 THEN
      IF InTypeDef THEN
        CALL Abort("Single line TYPE within type/union not supported")
      END IF
      FOR i = Ndx TO 1 STEP -1
        IF iMatchWrd(Stk$[i],"as") THEN
          EXIT FOR
        END IF
      NEXT
      IF NOT iMatchWrd(Stk$[i],"as") THEN
        CALL Abort("Missing AS TYPE")
      END IF
      FPRINT Outfile,"typedef ";
      j = i-1
      i++
      WHILE i <= Ndx
        FPRINT Outfile,Stk$[i];" ";
        i++
      WEND
      FOR i = 2 TO j
        FPRINT Outfile,Stk$[i];
      NEXT
      FPRINT Outfile,";"
      Outfile = SaveOutfileNum
    ELSE
      InTypeDef++
      TypeName$[InTypeDef] = Stk$[2]
      CALL AddTypeDefs(TypeName$[InTypeDef],vt_STRUCT)
      BaseTypeDefsCnt[InTypeDef] = TypeDefsCnt
      IF InTypeDef = 1 THEN
        FPRINT Outfile,""
        FPRINT Outfile,"typedef struct _";TypeName$[InTypeDef]
        FPRINT Outfile,"{"
        CALL BumpUp
      ELSE
        FPRINT Outfile,Scoot$;"struct"
        FPRINT Outfile,Scoot$;"{"
        CALL AddTypedefElement(BaseTypeDefsCnt[InTypeDef-1],vt_STRUCT,TypeName$[InTypeDef],TypeName$[InTypeDef], 0)
        CALL BumpUp
      END IF
    END IF

    '***********************
    CASE "endtype"
    '***********************

    IF InTypeDef = 1 THEN
      CALL BumpDown
      FPRINT Outfile,"}";TypeName$[InTypeDef];", *";"LP";UCASE$(TypeName$[InTypeDef]); ";"
      FPRINT Outfile,""
      Outfile = SaveOutfileNum
      FPRINT FP6,Scoot$;"#define ",UCASE$(TypeName$[InTypeDef]),"_CLASS struct _",UCASE$(TypeName$[InTypeDef]),"*"
    ELSE
      CALL BumpDown
      FPRINT Outfile,Scoot$;"} ";TypeName$[InTypeDef];";"
      FPRINT Outfile,""
    END IF
    InTypeDef--

    '***********************
    CASE "union"
    '***********************

    IF InTypeDef = 0 THEN
      SaveOutfileNum = Outfile
    END IF
    Outfile = FP4
    InTypeDef++
    TypeName$[InTypeDef] = Stk$[2]
    CALL AddTypeDefs(TypeName$[InTypeDef],vt_UNION)
    BaseTypeDefsCnt[InTypeDef] = TypeDefsCnt
    IF InTypeDef = 1 THEN
      FPRINT Outfile,""
      FPRINT Outfile,"typedef union "
      FPRINT Outfile,"{"
      CALL BumpUp
    ELSE
      FPRINT Outfile,Scoot$;"union"
      FPRINT Outfile,Scoot$;"{"
      CALL AddTypedefElement(BaseTypeDefsCnt[InTypeDef-1],vt_UNION,TypeName$[InTypeDef],TypeName$[InTypeDef], 0)
      CALL BumpUp
    END IF

    '***********************
    CASE "endunion"
    '***********************

    IF InTypeDef = 1 THEN
      CALL BumpDown
      FPRINT Outfile,"} ";TypeName$[InTypeDef];", *";"LP";UCASE$(TypeName$[InTypeDef]); ";"
      FPRINT Outfile,""
      Outfile = SaveOutfileNum
    ELSE
      CALL BumpDown
      FPRINT Outfile,Scoot$;"} ";TypeName$[InTypeDef];";"
      FPRINT Outfile,""
    END IF
    InTypeDef--

    '***********************
    CASE "with"
    '***********************
    GLOBAL WithVar$[8]
    GLOBAL WithCnt

    WithCnt++
    IF WithCnt = 8 THEN Abort("[With] depth exceeded")
    WithVar$[WithCnt] = ""
    FOR i = 2 TO Ndx
      CONCAT(WithVar$[WithCnt],Stk$[i])
    NEXT

    '***********************
    CASE "endwith"
    '***********************
      WithCnt--
    '***********************
    CASE "clear"
    '***********************

    Use_Clear = TRUE
    Use_Sysmacros = TRUE

    FPRINT Outfile, Scoot$, "Clear ";
    IF Stk$[2]<> "(" THEN FPRINT Outfile,"(";
    FOR i = 2 TO Ndx
      FPRINT Outfile,Clean$(Stk$[i]);
    NEXT
    IF Stk$[2]<> "(" THEN FPRINT Outfile,")";
    FPRINT Outfile,";"

    '***********************
    CASE "repeat"
    '***********************

    lszTmp$ = ""

    FOR i = 2 TO Ndx
      CONCAT(lszTmp$, Stk$[i])
    NEXT

    lszTmp$ = Clean$(lszTmp$)

    CALL BumpUp

    IF INCHR(Stk$[2],"-") THEN
      IF LEFT$(lszTmp$,1) = "-" THEN lszTmp$ = MID$(lszTmp$,2)
      FPRINT Outfile,Scoot$,"{register int BCX_REPEAT;"
      FPRINT Outfile,Scoot$,"for(BCX_REPEAT=";lszTmp$;";BCX_REPEAT>=1;BCX_REPEAT--)"
      FPRINT Outfile,Scoot$,"{"
    ELSE
      FPRINT Outfile,Scoot$,"{register int BCX_REPEAT;"
      FPRINT Outfile,Scoot$,"for(BCX_REPEAT=1;BCX_REPEAT<=";lszTmp$;";BCX_REPEAT++)"
      FPRINT Outfile,Scoot$,"{"
    END IF
    CALL BumpUp

    '***********************
    CASE "endrepeat"
    '***********************

    CALL BumpDown
    FPRINT Outfile,Scoot$,"}"
    FPRINT Outfile,Scoot$,"}"
    CALL BumpDown


    '******************************
    CASE "dialogbox" 'HELPER
    '******************************

    Comma = 0

    FPRINT Outfile,Scoot$,"DialogBox";

    FOR A = 2 TO Ndx
      IF Stk$[A] = "," THEN Comma++

      IF Comma = 3 THEN
        IF Stk$[A] = "," THEN Stk$[A] = ",(DLGPROC)"
      END IF

      FPRINT Outfile,Clean$(Stk$[A]);
    NEXT

    FPRINT Outfile,";"

    '********************************
    CASE "insertmenu"  'HELPER
    '********************************

    Comma = 0
    FPRINT Outfile,Scoot$,"InsertMenu";
    FOR A = 2 TO Ndx
      IF Stk$[A] = "," THEN Comma++
      IF Stk$[A] = "," THEN
        IF Comma = 3 THEN
          Stk$[A] = ",(UINT)"
        END IF
      END IF
      FPRINT Outfile,Clean$(Stk$[A]);
    NEXT
    FPRINT Outfile,";"

    '***********************
    CASE "const"
    '***********************

    DIM RAW Buffer$
    DIM RAW Sep$

    Buffer$ = ""
    Sep$    = ""
    Stk$[1] = ""

    FOR i = 2 TO Ndx
      IF Stk$[i] = "=" THEN
        INCR i
        EXIT FOR
      ELSE
        CONCAT(Stk$[1], Stk$[i])
      END IF
    NEXT
    Stk$[1] = "#define " + Clean$(Stk$[1]) + SPC$

    FOR i = i TO Ndx
      IF isalpha(Stk[i][0]) OR Stk[i][0] = ASC("_") AND _
      isalpha(Stk[i+1][0]) OR Stk[i+1][0] = ASC("_") THEN Sep$ = " " ELSE Sep$ = ""
      IF NOT IsQuoted(Stk$[i]) THEN REMOVE "$" FROM Stk$[i]
      Buffer$ = Buffer$ + Stk$[i] + Sep$
    NEXT

    Buffer$ = Stk$[1] + Buffer$

    IF InConditional THEN
      IF InFunc THEN
        FPRINT Outfile,Buffer$
      ELSE
        IF ConstLastDef$ <> "FP6" THEN
          FPRINT FP6,InIfDef$,"// FP6"
          ConstLastDef$ = "FP6"
        END IF
        FPRINT FP6,Buffer$
      END IF
    ELSE
      FPRINT FP6,Buffer$
    END IF

    '***********************
    CASE "kill"
    '***********************

    FPRINT Outfile,Scoot$,"DeleteFile (";
    FOR A = 2 TO Ndx
      FPRINT Outfile,Clean$(TRIM$(Stk$[A]));
    NEXT
    FPRINT Outfile,");"

    '***********************
    CASE "free"
    '***********************
    DIM RAW VI AS VarInfo PTR

    A = 2
    IF iMatchWrd(Stk$[2], "dynamic") THEN A = 3
    IF Stk$[A] = "(" THEN
      INCR A
      DECR Ndx
    END IF

    CVar$ = Clean$(Stk$[A])
    vt = CheckLocal(CVar$, &id)
    IF vt = vt_UNKNOWN THEN
      vt = CheckGlobal(CVar$, &id)
      IF vt = vt_UNKNOWN THEN
        Abort("Can not REDIM " + CVar$ + " not previously dimensioned")
      END IF
      VI = &GlobalVars[id]
    ELSE
      VI = &LocalVars[id]
    END IF

    CVar$ = ""
    FOR i = A TO Ndx
      CVar$ = CVar$ + Stk$[i]
    NEXT
    CVar$ = TRIM$(Clean$(CVar$))

    IF vt = vt_STRUCT OR vt = vt_UNION THEN
      GetElement$(2, &vt, &dms, VI->VarDef)
      IF vt <> vt_UNKNOWN AND dms > 0 THEN
        UseFlag = Use_DynamicA = TRUE
        FPRINT Outfile,Scoot$,"if (",  CVar$;
        FPRINT Outfile,") { DestroyArr((void **)", CVar$, ",", dms, ", 1); ";
        FPRINT Outfile,CVar$ ; "=NULL; }"
        EXIT SELECT
      END IF
    END IF

    IF VI->VarPntr > 1 THEN
      UseFlag = Use_DynamicA = TRUE
      FPRINT Outfile,Scoot$,"if ("  ; CVar$ ;
      FPRINT Outfile,") { DestroyArr((void **)" + CVar$ + "," + STR$(VI->VarPntr) + ", 1); ";
      FPRINT Outfile,CVar$ ; "=NULL; }"
    ELSE
      FPRINT Outfile,Scoot$,"free(", CVar$, "), ";
      'IF *CVar = ASC("&") THEN
        'FPRINT Outfile, "memset(", CVar$, ", 0, sizeof(", MID$(CVar$,2), "));"
      'ELSE
        FPRINT Outfile, CVar$, "=NULL;"
      'END IF
    END IF

    '*************************************************************************
    CASE "midstr"            ' alias TO MID$ statement(NOT FUNCTION)
    '*************************************************************************

    Src$ = ""
    FOR A = 1 TO Ndx
      CONCAT(Src$,Clean$(Stk$[A]))
    NEXT
    FPRINT Outfile,Scoot$, TRIM$(Src$), ";"

    '***********************
    CASE "swap"
    '***********************
    RAW VI1 AS VarInfo PTR
    RAW VI2 AS VarInfo PTR
    RAW indx AS Integer

    UseFlag = TRUE
    FPRINT Outfile,Scoot$,"swap ((byte*)&";

    FOR i = 2 TO Ndx
      IF Stk$[i]= "," THEN EXIT FOR
      FPRINT Outfile,Clean$(Stk$[i]);
    NEXT

    A = CheckLocal(Stk$[2], &indx)
    IF A = vt_UNKNOWN THEN
      A = CheckGlobal(Stk$[2], &indx)
      IF A = vt_UNKNOWN THEN
        Abort("Variable '"+Stk$[2]+"' in swap statement unknown")
      END IF
      VI1 = &GlobalVars[indx]
    ELSE
      VI1 = &LocalVars[indx]
    END IF

    IF RIGHT$(Stk$[i-1],1) <> "]" THEN
      IF VI1->VarType = vt_CHAR AND VI1->VarPntr = 1 THEN FPRINT Outfile,"[0]";
    END IF

    FPRINT Outfile,",(byte*)&";

    i++

    FOR j = i TO Ndx
      FPRINT Outfile,Clean$(Stk$[j]);
    NEXT

    A = CheckLocal(Stk$[i], &indx)
    IF A = vt_UNKNOWN THEN
      A = CheckGlobal(Stk$[i], &indx)
      IF A = vt_UNKNOWN THEN
        Abort("Variable '"+Stk$[i]+"' in swap statement unknown")
      END IF
      VI2 = &GlobalVars[indx]
    ELSE
      VI2 = &LocalVars[indx]
    END IF

    IF RIGHT$(Stk$[j-1],1) <> "]" THEN
      IF VI2->VarType = vt_CHAR AND VI2->VarPntr = 1 THEN FPRINT Outfile,"[0]";
    END IF

    IF VI1->VarType <> VI2->VarType THEN
      Warning("Possible size error in swap statement")
    END IF

    IF VI2->VarType = vt_STRVAR OR VI2->VarType = vt_CHAR THEN
      FPRINT Outfile,",strlen(";
    ELSE
      FPRINT Outfile,",sizeof(";
    END IF

    FOR j = i TO Ndx
      FPRINT Outfile,Clean$(Stk$[j]);
    NEXT

    FPRINT Outfile,"));"

    '***********************
    CASE "rename"
    '***********************

    FPRINT Outfile,Scoot$,"MoveFile (";
    FOR A = 2 TO Ndx
      FPRINT Outfile,Clean$(TRIM$(Stk$[A]));
    NEXT
    FPRINT Outfile,");"

    '***********************
    CASE "copyfile"
    '***********************

    FPRINT Outfile,Scoot$,"CopyFile (";
    FOR A = 2 TO Ndx
      FPRINT Outfile,Clean$(TRIM$(Stk$[A]));
    NEXT
    Stk$[Ndx]=UCASE$(Stk$[Ndx])
    SELECT CASE Stk$[Ndx]
      CASE "TRUE", "FALSE", "1", "0"
      FPRINT Outfile,Scoot$,");"
      CASE ELSE
      FPRINT Outfile,Scoot$,",FALSE);"
    END SELECT

    '***********************
    CASE "msgbox"          ' MsgBox Msg$,Title$,button
    '***********************

    j = 0
    k = 0

    FOR i = 2 TO Ndx
      IF Stk$[i] = "[" THEN
        j++
      ELSEIF Stk$[i] = "]" THEN
        j--
      ELSEIF Stk$[i] = "(" THEN
        j++
      ELSEIF Stk$[i] = ")" THEN
        j--
      END IF
      IF j = 0 AND Stk$[i] = "," THEN k++
    NEXT

    IF k = 0 THEN
      Ndx++
      Stk$[Ndx]= ","
      Ndx++
      Stk$[Ndx]= DDQ$
      k = 1
    END IF

    IF k = 1 THEN
      Ndx++
      Stk$[Ndx]= ","
      Ndx++
      Stk$[Ndx]= "0"
    END IF

    FPRINT Outfile,Scoot$,"MessageBox (GetActiveWindow(),";

    FOR A = 2 TO Ndx
      FPRINT Outfile,Clean$(Stk$[A]);
    NEXT
    FPRINT Outfile,");"

    '***********************
    CASE "shell"
    '***********************

    IF Ndx > 2 THEN
      FOR A = 3 TO Ndx
        Stk$[2] = Stk$[2] + Stk$[A]
      NEXT
    END IF
    ZZ$ = Stk$[2]
    IF ZZ$ = "" THEN ZZ$ = DDQ$
    FPRINT Outfile,Scoot$ ; "system(" ; Clean$(ZZ$) ; ");"

    '*****************************************************************************
    CASE "lineinput"    'LINEINPUT fp1,A$
    '                    LINEINPUT "prompt", A$  <<< Keyboard version 4.21
    '*****************************************************************************

    '     Test for new keyboard version of LINE INPUT
    i = DataType(Stk$[2])

    IF i = vt_STRLIT OR i = vt_STRVAR THEN
      IF i <> vt_STRLIT THEN Stk$[2] = Clean$(Stk$[2])
      FPRINT Outfile,Scoot$,"printf(", ENC$("%s"), ",", Stk$[2], ");"
      FPRINT Outfile,Scoot$,"gets(", Clean$(Stk$[3]),  ");"
      EXIT SELECT
    END IF

    ' ********************* Okay, we're dealing with a file ************************

    REMOVE "#" FROM Stk$[2]

    IF DataType(Stk$[2]) = vt_NUMBER THEN
      Stk$[2]= "FP" & Stk$[2]
    END IF

    Handle$ = EXTRACT$(Stk$[2], "[")

    IF CheckLocal(Handle$, &i) = vt_UNKNOWN THEN
      IF CheckGlobal(Handle$, &i) = vt_UNKNOWN THEN
        CALL AddGlobal(Handle$, vt_FILEPTR, 0,"",0,0,0,0)
      END IF
    END IF

    Var$ = Clean$(Stk$[3])
    Var1$ = ""
    CVar$ = Var$

    IF INCHR( Var$, "[" ) AND INCHR( Var$, "]" ) THEN
      IF INSTR( Var$, "[++" ) THEN
        REPLACE "++" WITH "" IN CVar$
      END IF
      IF INSTR( Var$, "[--" ) THEN
        REPLACE "--" WITH "" IN CVar$
      END IF
      IF INSTR( Var$, "++]" ) THEN
        REPLACE "++" WITH "" IN CVar$
        Var1$ = MID$(Var$,INCHR(Var$,"[")+1)
        Var1$ = EXTRACT$(Var1$,"]")
        Var$ = CVar$
      END IF
      IF INSTR( Var$, "--]" ) THEN
        REPLACE "--" WITH "" IN CVar$
        Var1$ = MID$(Var$,INCHR(Var$,"[")+1)
        Var1$ = EXTRACT$(Var1$,"]")
        Var$ = CVar$
      END IF
    END IF

    FPRINT Outfile,Scoot$, Var$ ; "[0]=0;"
    FPRINT Outfile,Scoot$, "fgets(" ; Var$ ; ",1048576,"; Clean$(Stk$[2]) ; ");"
    FPRINT Outfile,Scoot$, "if("    ; CVar$ ; "[strlen(" ;CVar$ ; ")-1]==10)";
    FPRINT Outfile,CVar$  ; "[strlen(" ; CVar$ ; ")-1]=0;"

    IF Var1$ <> "" THEN
      FPRINT Outfile,Var1$ ; ";"
    END IF

    '*************************************************************************
    CASE "open"    'OPEN filename$ FOR INPUT | OUTPUT | APPEND AS handle
    '*************************************************************************

    FOR A = 1 TO Ndx
      Keyword$ = LCASE$(Stk$[A])

      SELECT CASE Keyword$
        CASE "open"
        Stk$[A] = ""

        CASE "for"
        Stk$[A] = ""
        Filnam$ = ""
        FOR j = 2 TO A-1
          CONCAT (Filnam$,Stk$[j])
        NEXT
        Filnam$ = Clean$(Filnam$)

        CASE "as"
        Stk$[A] = ""
        IF DataType(Stk$[A + 1]) = vt_NUMBER THEN
          Stk$[A + 1] = "FP" + Stk$[A + 1]
        END IF
        IF CheckLocal(Stk$[A + 1], &i) = vt_UNKNOWN THEN
          IF CheckGlobal(Stk$[A + 1], &i) = vt_UNKNOWN THEN
            CALL AddGlobal(Stk$[A + 1], vt_FILEPTR, 0,"",0,0,0,0)
          END IF
        END IF

        Var$ = ""
        FOR j = A+1 TO Ndx
          IF iMatchWrd(Stk$[j], "reclen") THEN EXIT FOR
          CONCAT (Var$,Stk$[j])
          Stk$[j] = ""
        NEXT
        Handle$ = Var$ + "@"

        CASE "input"
        Op$ = ENC$("r")
        Stk$[A] = ""

        CASE "output"
        Op$ = ENC$("w")
        Stk$[A] = ""

        CASE "append"
        Op$ = ENC$("a")
        Stk$[A] = ""

        CASE "binary"
        Op$ = ENC$("rb+")
        Stk$[A] = ""

        CASE "binaryappend"
        Op$ = ENC$("ab+")
        Stk$[A] = ""

        CASE "binarynew"
        Op$ = ENC$("wb+")
        Stk$[A] = ""

        CASE "binaryinput"
        Op$ = ENC$("rb")
        Stk$[A] = ""

        CASE "binaryoutput"
        Op$ = ENC$("rb+")
        Stk$[A] = ""

        CASE "reclen"
        IF Stk$[A+1] = "=" THEN
          FOR j = A+2 TO Ndx
            Stk$[j-1] = Stk$[j]
          NEXT
          Ndx--
        END IF

        Var$ = EXTRACT$(Clean$(Handle$), "[") + "len"

        IF CheckLocal(Var$, &i) = vt_UNKNOWN THEN
          CALL AddGlobal(Var$, vt_INTEGER , 0,"",0,0,0,0)
        ELSE
          IF CheckLocal(Var$, &i) = vt_UNKNOWN THEN
            CALL AddLocal(Var$, vt_INTEGER , 0,"",0,0,0)
            Var$ = "int " + Var$
          END IF
        END IF

        i = CheckType(Stk$[A+1])
        ZZ$ = LCASE$(Stk$[A+1])
        IF i = vt_STRUCT OR i = vt_UNION OR ZZ$ = "int" OR ZZ$ = "double" OR ZZ$ = "float" THEN
          FPRINT Outfile,Scoot$,Var$ + " = sizeof(";Stk$[A+1];");"
        ELSE
          FPRINT Outfile,Scoot$,Var$ + " = ";Clean$(Stk$[A+1]);";"
        END IF
        Stk$[A] = ""
        Stk$[A + 1] = ""
      END SELECT
    NEXT
    IF UseFileTest THEN
      FPRINT Outfile,Scoot$,"if((";Clean$(Handle$);"=fopen(";Filnam$;",";Op$;"))==0)"
      FPRINT Outfile,Scoot$," {"
      lszTmp$ = ENC$("Can't open file %s\\n")
      FPRINT Outfile,Scoot$,"fprintf(stderr,";lszTmp$;",";Filnam$;");exit(1);"
      FPRINT Outfile,Scoot$," }"
    ELSE
      FPRINT Outfile,Scoot$,Clean$(Handle$);"=fopen(";Filnam$;",";Op$;");"
    END IF

    '*************************************************************************
    ' Statement  RECORD [#] filenumber,recordnumber [,location in record]
    ' Definition:          Position the file pointer anywhere in a file.
    ' filenumber           Filenumber from  1 to 99
    ' record number        RECORD number to point to. Default first record
    ' location in record   Optional location in RECORD. Default is Zero
    ' RECORD fp1, 6[, 10]
    '*************************************************************************

    CASE "record"
    DIM AUTO ffp AS functionParse
    DIM RAW numargs = 0

    IF DataType(Stk$[2]) = vt_NUMBER THEN
      Stk$[2]= "FP"  +  Stk$[2]
    END IF

    IF Ndx > 1 THEN numargs = SepFuncArgs(1, &ffp, FALSE)
    IF numargs < 1 THEN Abort("Missing required arguments to RECORD")
    IF numargs > 4 THEN Abort("Too many arguments to RECORD")

    IF numargs = 3 THEN
      FPRINT Outfile,Scoot$,"fseek("; GetArg$(1, &ffp); _
      ", ("; GetArg$(2, &ffp); " - 1) * ";Stk$[2];"len + ";GetArg$(3, &ffp);", SEEK_SET);"

    ELSEIF numargs = 2 THEN
      FPRINT Outfile,Scoot$,"fseek("; GetArg$(1, &ffp); _
      ", ("; GetArg$(2, &ffp); " - 1) * ";Stk$[2];"len, SEEK_SET);"
    ELSE
      FPRINT Outfile,Scoot$,"fseek("; GetArg$(1, &ffp); ", 0, SEEK_SET);"
    END IF

    '***********************
    CASE "fwrite"    'write handle,{list}
    '***********************

    IF DataType(Stk$[2]) = vt_NUMBER THEN
      Stk$[2] = "FP" + Stk$[Ndx]
    END IF

    IF CheckLocal(Stk$[2], &i) = vt_UNKNOWN THEN
      CALL AddGlobal(Stk$[2], vt_FILEPTR, 0,"",0,0,0,0)
    END IF

    Handle$ = ""
    FOR j = 2 TO Ndx
      IF iMatchWrd(Stk$[j], ",") OR iMatchWrd(Stk$[j], ";") THEN
        Stk$[j] = ""              'get rid of the Comma
        EXIT FOR
      END IF
      Handle$ = Handle$ + Stk$[j]
      Stk$[j] = ""                 'get rid of handle
    NEXT j

    Handle$ = Handle$ + "@"

    ZZ$ = "f" + PrintWriteFormat$(1)
    ZZ$ = LEFT$(ZZ$,8)  +  Clean$(Handle$)  +  ","  +  MID$(ZZ$,9)
    FPRINT Outfile,Scoot$, ZZ$

    '***********************
    CASE "close"               'CLOSE handle
    '***********************

    IF Ndx = 1 THEN
      FPRINT Outfile,Scoot$, "_fcloseall();"
      EXIT SELECT
    END IF

    IF DataType(Stk$[2]) = vt_NUMBER THEN
      Stk$[2]= "FP"  +  Stk$[Ndx]
    END IF

    IF CheckLocal(Stk$[2], &i) = vt_UNKNOWN THEN
      IF CheckGlobal(Stk$[2], &i) = vt_UNKNOWN THEN
        CALL AddGlobal(Stk$[2], vt_FILEPTR, 0,"",0,0,0,0)
      END IF
    END IF

    Handle$ = ""
    FOR j = 2 TO Ndx
      Handle$ = Handle$ + Stk$[j]
    NEXT j

    IF UseFileTest THEN
      FPRINT Outfile,Scoot$,"if(",Handle$,")"
      FPRINT Outfile,Scoot$," {"
      FPRINT Outfile,Scoot$,"   fclose(";Handle$;");"
      FPRINT Outfile,Scoot$,"   ";Handle$;"=NULL;"
      FPRINT Outfile,Scoot$," }"
    ELSE
      FPRINT Outfile,Scoot$,"fclose(";Handle$;");"
    END IF

    '***********************
    CASE "printer"
    '***********************

    IF iMatchWrd(Stk$[2],"open")      THEN FPRINT Outfile,Scoot$,"PrinterOpen();"
    IF iMatchWrd(Stk$[2],"ejectpage") THEN FPRINT Outfile,Scoot$,"EjectPage();"
    IF iMatchWrd(Stk$[2],"close")     THEN FPRINT Outfile,Scoot$,"PrinterClose();"

    '***********************
    CASE "call"
    '***********************

    lszTmp$ = ""
    FOR Tmp = 2 TO Ndx
      CONCAT(lszTmp$,  Clean$(Stk$[Tmp]))
    NEXT
    IF NOT iMatchRgt(lszTmp$,")") THEN
      CONCAT(lszTmp$,  "()")
    END IF
    CONCAT(lszTmp$,  ";")
    FPRINT Outfile,Scoot$,lszTmp$

    '*************************************************************************
    CASE "declare"
    '*************************************************************************
    DIM AUTO FP AS functionParse
    DIM RAW TempProto$
    CALL FuncSubDecs1("sub") 'convert [] to pointer * and $[] to [][2048]

    CALL SepFuncArgs(3, &FP, TRUE)

    TempProto$ = MakeDecProto$(&FP)

    IF NOT NoTypeDeclare THEN
      FPRINT FP4, TempProto$, ";"
    ELSE
      ProtoCnt++
      ProtoType[ProtoCnt].Prototype$ = TempProto$ + ";"
    END IF

    '*************************************************************************
    CASE "function", "sub"
    '*************************************************************************

    IF Stk$[2] = "main" THEN
      Stk$[1] = "function"
      Stk$[2] = "main%"
      ForceMainToFunc = TRUE
    END IF

    CALL FuncSubDecs1("sub")

    IsStdFunc = FALSE

    IF iMatchWrd(Stk$[Ndx],"stdcall") THEN
      CallType$ = "__stdcall "
      Ndx--
      IsStdFunc = TRUE
    END IF

    InFunc = TRUE
    InMain = FALSE
    LocalVarCnt = 0
    Outfile = FP3

    CALL FuncSubDecs2("sub", mt_FuncSubDecC_Dec)

    ' to compensate previous substitution errors not fixed

    VarCode.Functype$ = LTRIM$(VarCode.Functype$)

    Funcname$ = Clean$(Stk$[2])

    IF IsExported OR IsStdFunc THEN
      Funcname$ = CallType$ + Funcname$
    END IF

    VarCode.Method% = mt_FuncSubDecC_Dec2
    A = 3
    WHILE A <= Ndx
      IF Stk$[A+1] = "(" THEN ' sub/function ptr
        FOR k = A+2 TO Ndx
          IF Stk$[k] = ")" THEN
            EXIT FOR
          END IF
        NEXT
        IF iMatchWrd(Stk$[k+2], "sub") THEN
          j = vt_VOID
          VarCode.AsToken$ = "void"
        ELSEIF iMatchWrd(Stk$[k+2], "function") THEN
          CALL GetTypeInfo(Stk$[k+3], &IsPointer, &i, &j)
          VarCode.AsToken$ = Stk$[k+3]
        END IF
        VarCode.Token$ = Stk$[A]
        VarCode.VarNo% = j
        VarCode.IsPtrFlag = 1
        VarCode.Method% = mt_FuncSubx1
        CALL GetVarCode(&VarCode)
        Var$ = Clean$(Stk$[A])
        lszTmp$ = ""
        A += 2
        WHILE A <= k
          IF iMatchWrd(Stk$[A+1], "as") AND A < k THEN
            Tmp = A + 2
            WHILE Stk$[Tmp] <> "," AND Stk$[Tmp] <> ")"
              CALL GetTypeInfo(Stk$[Tmp], &IsPointer, &i, &j)
              CALL AddLocal(Stk$[A], j, i, "", IsPointer,0,0)
              VarCode.Token$ = Stk$[A]
              VarCode.AsToken$ = Stk$[Tmp]
              VarCode.VarNo% = j
              VarCode.IsPtrFlag = 1
              VarCode.Method% = mt_FuncSubx2
              CALL GetVarCode(&VarCode)
              Tmp++
              IF Stk$[Tmp] = "," THEN
                CONCAT(VarCode.Proto$,",")
                CONCAT(VarCode.Header$,",")
              END IF
            WEND
            A = Tmp
          ELSE
            IF Stk$[A] <> "," AND Stk$[A] <> ")" THEN
              IsPointer = TALLY((Stk$[A]), "*")
              Var$ = REMOVE$(Stk$[A], "*") ' in case we used ptr
              j = DataType(Var$)
              IF j <> vt_UNKNOWN AND InFunc = TRUE AND Var[0] THEN
                CALL AddLocal(Clean(Var$), j, 0, "", IsPointer,0,0)
              END IF
              VarCode.Token$ = Stk$[A]
              VarCode.AsToken$ = ""
              VarCode.VarNo% = j
              VarCode.IsPtrFlag = IsPointer
              VarCode.Method% = mt_FuncSubDecC_Dec2
              CALL GetVarCode(&VarCode)
            END IF
          END IF
          A++
        WEND
        A = k+3
        IF VarCode.Method% = mt_FuncSubDecC_Dec2 THEN
          MID$(VarCode.Proto$,LEN(VarCode.Proto$)-1,1) = ")"
          MID$(VarCode.Header$,LEN(VarCode.Header$)-1,1) = ")"
        ELSE
          CONCAT(VarCode.Proto$,")")
          CONCAT(VarCode.Header$,")")
        END IF
        VarCode.Method% = mt_FuncSubDecC_Dec2
      ELSE
        IF iMatchWrd(Stk$[A+1],"as") THEN
          CALL GetTypeInfo(Stk$[A+2], &IsPointer, &i, &j)
          Var$ = Clean$(Stk$[A])
          CALL AddLocal(Var$, j, i, "", IsPointer,0,0)
          VarCode.Token$ = Stk$[A]
          VarCode.AsToken$ = Stk$[A+2]
          VarCode.VarNo% = j
          VarCode.IsPtrFlag = IsPointer
          CALL GetVarCode(&VarCode)
          Stk$[A+1] = ""
          Stk$[A+2] = ""
          A+=2
        ELSE
          IF INCHR("=", Stk$[A]) AND Stk$[A] <> "" THEN
            CALL Abort("Illegal optional parameter found")
          END IF
          IF NOT INCHR(",().",Stk$[A]) AND Stk$[A] <> "" THEN
            IsPointer = TALLY((Stk$[A]), "*")
            Var$ = REMOVE$(Stk$[A], "*") ' in case we used ptr
            j = DataType(Var$)
            IF j <> vt_UNKNOWN AND Var[0] THEN
              CALL AddLocal(Clean(Var$), j, 0, "", IsPointer,0,0)
            END IF
            VarCode.Token$ = Stk$[A]
            VarCode.AsToken$ = ""
            VarCode.VarNo% = j
            VarCode.IsPtrFlag = IsPointer
            CALL GetVarCode(&VarCode)
          END IF
        END IF
      END IF
      A++
    WEND

    VarCode.Method% = 2
    VarCode.Token$ = Funcname$
    FuncSubDecs3(&VarCode)

    IF iMatchLft(VarCode.Header$,"main(")  THEN
      'VarCode.Header$ = "int main(int argc, char *argv[])"
      'VarCode.Proto$  = "int main(int argc, char *argv[]);"
      VarCode.Header$ = "void basicmain()"
      VarCode.Proto$  = "void basicmain();"
      CurrentFuncType = vt_INTEGER
    END IF

    IF Use_Static THEN
      VarCode.Header$ = "static " + VarCode.Header$
      VarCode.Proto$  = "static " + VarCode.Proto$
    END IF

    ProtoCnt++
    ProtoType[ProtoCnt].Prototype$ = VarCode.Proto$

    IF InIfDef$ = "FP3" THEN
      IF ProtoCnt > 1 THEN
        ProtoType[ProtoCnt].Condition$ = ProtoType[ProtoCnt-1].Condition$
      ELSE
        ProtoType[ProtoCnt].Condition$ = ""
      END IF
    ELSE
      ProtoType[ProtoCnt].Condition$ = InIfDef$
    END IF

    ProtoType[ProtoCnt].CondLevel  = InConditional

    IF *InIfDef$ THEN
      IF InIfDef$ <> "FP3" THEN
        FPRINT Outfile,InIfDef$
      END IF
    END IF
    FPRINT Outfile,VarCode.Header$
    FPRINT Outfile,Scoot$,"{"
    CALL BumpUp


    '***********************************************
    CASE "optfunction", "optsub"  ', "optdeclare"
    '***********************************************

    CALL FuncSubDecs1("optsub")

    InFunc  = TRUE
    LocalVarCnt = 0
    Outfile = FP3

    CALL FuncSubDecs2("optsub", mt_Opts)

    Funcname$ = Clean$(Stk$[2])

    VarCode.Method% = mt_Opts2

    A = 4
    WHILE A < Ndx
      IF Stk$[A] = "" THEN A++ : ITERATE
      IF Stk$[A] = "," THEN
        VarCode.Method% = mt_Opts3
        VarCode.Token$ = Stk$[A]
        CALL GetVarCode(&VarCode)
        VarCode.Method% = mt_Opts2
      ELSEIF Stk$[A] = "=" THEN
        VarCode.Method% = mt_Opts3
        IF Stk$[A + 1] = "-" THEN
          VarCode.Token$ = Stk$[A] + Stk$[A + 1] + Stk$[A + 2]
          Stk$[A + 1] = "" : Stk$[A + 2] = "" : A++
        ELSE
          VarCode.Token$ = Stk$[A] + Stk$[A + 1]
          Stk$[A + 1] = ""
        END IF
        IF iMatchWrd(Stk$[A+2],"as") THEN
          Stk$[A + 2] = "" : Stk$[A + 3] = ""
        END IF
        VarCode.VarNo% = j
        VarCode.IsPtrFlag = IsPointer
        CALL GetVarCode(&VarCode)
        VarCode.Method% = mt_Opts2
      ELSEIF iMatchWrd(Stk$[A+1],"as") THEN
        CALL GetTypeInfo(Stk$[A+2], &IsPointer, &i, &j)
        IF InFunc THEN
          Var$ = Clean$(Stk$[A])
          CALL AddLocal(Var$, j, i, "", IsPointer,0,0)
        END IF
        VarCode.VarNo% = j
        VarCode.Token$ = Stk$[A]
        VarCode.AsToken$ = Stk$[A+2]
        VarCode.IsPtrFlag = IsPointer
        CALL GetVarCode(&VarCode)
        Stk$[A+1]= "" : Stk$[A+2]= ""
      ELSE
        IsPointer = TALLY((Stk$[A]),"*")
        Var$ = REMOVE$(Stk$[A],"*")        '  in case we used ptr
        j = DataType(Var$)
        IF j <> vt_UNKNOWN THEN
          CALL AddLocal(Clean(Var$),j,0,"",IsPointer,0,0)
        END IF
        VarCode.VarNo% = j
        VarCode.Token$ = Stk$[A]
        VarCode.AsToken$ = ""
        VarCode.IsPtrFlag = IsPointer
        CALL GetVarCode(&VarCode)
      END IF

      A++
    WEND

    VarCode.Method% = 2
    VarCode.Token$ = Funcname$
    FuncSubDecs3(&VarCode)

    IF Use_Static THEN
      VarCode.Header$ = "static " + VarCode.Header$
      VarCode.Proto$ = "static " + VarCode.Proto$
    END IF

    ProtoCnt++
    ProtoType[ProtoCnt].Prototype$ = VarCode.Proto$

    IF InIfDef$ = "FP3" THEN
      ProtoType[ProtoCnt].Condition$ = ""
    ELSE
      ProtoType[ProtoCnt].Condition$ = InIfDef$
    END IF
    ProtoType[ProtoCnt].CondLevel  = InConditional

    FPRINT Outfile,VarCode.Header$
    FPRINT Outfile,Scoot$,"{"
    CALL BumpUp

    '*******************************************
    CASE "overloadedfunction", "overloadedsub"
    '*******************************************

    Use_Overloaded = TRUE

    CALL FuncSubDecs1("overloadedsub")

    InFunc = TRUE
    InMain = FALSE
    LocalVarCnt = 0

    Outfile = FP8    '<<----- writing TO BCX.OVR

    CALL FuncSubDecs2("overloadedsub", mt_OverLoad)

    Funcname$ = Clean$(Stk$[2])

    lszTmp$ = " overloaded " + Funcname$
    Funcname$ = lszTmp$

    VarCode.Method% = mt_OverLoad2

    FOR A = 3 TO Ndx

      IF iMatchWrd(Stk$[A+1],"as") THEN
        CALL GetTypeInfo(Stk$[A+2], &IsPointer, &i, &j)
        Var$ = Clean$(Stk$[A])
        CALL AddLocal(Var$, j, i, "", IsPointer,0,0)
        VarCode.AsToken$ = Stk$[A+2]
        Stk$[A+1] = ""
        Stk$[A+2] = ""
      ELSE
        Var$ = REMOVE$(Stk$[A],"*") ' in case we used ptr
        j = DataType(Var$)
        IF NOT INCHR(",().",Stk$[A]) AND Stk$[A] <> "" THEN
          IsPointer = TALLY((Stk$[A]),"*")
          IF j <> vt_UNKNOWN AND InFunc = TRUE AND Var[0] THEN
            CALL AddLocal(Clean(Var$), j, 0, "", IsPointer,0,0)
          END IF
        END IF
        VarCode.AsToken$ = ""
      END IF

      VarCode.VarNo% = j
      VarCode.Token$ = Stk$[A]
      CALL GetVarCode(&VarCode)

    NEXT

    VarCode.Method% = 1
    VarCode.Token$ = Funcname$
    FuncSubDecs3(&VarCode)

    IF Use_Static THEN
      VarCode.Header$ = "static " + VarCode.Header$
    END IF

    FPRINT Outfile,VarCode.Header$
    FPRINT Outfile,Scoot$,"{"

    CALL BumpUp

    '*******************************************************************
    CASE "functionreturn"       'This is an alias TO "FUNCTION ="
    '*******************************************************************
    IF CaseFlag THEN NoBreak2 = TRUE
    lszTmp$ = ""

    FOR A = 3 TO Ndx
      lszTmp$ = lszTmp$ + Stk$[A] + " "
    NEXT

    IF CurrentFuncType = vt_STRVAR THEN
      lszTmp$ = "BCX_RetStr$ = " + lszTmp$
      FuncRetnFlag = 1    '1 = return a string
      UseFlag = TRUE
    ELSE
      FuncRetnFlag = 2    '2 = return a number
    END IF

    IF FuncRetnFlag = 2 THEN
      '*********************************
      '    Clean up dynamic strings
      '*********************************
      IF LocalDynaCnt <> 0 THEN
        FOR j = 1 TO LocalDynaCnt
          FPRINT Outfile,Scoot$,DynaStr$[j]
        NEXT
      END IF
      '*********************************
      ' Clean up dynamic strings arrays
      '*********************************
      IF LocalDynArrCount <> 0 THEN
        FOR i = 1 TO LocalDynArrCount
          FPRINT Outfile,Scoot$,LocalDynArrName$[i]
        NEXT
      END IF
      '*********************************
      FPRINT Outfile,Scoot$,"return ";
      LastCmd = 2
    END IF

    CALL Parse(lszTmp$)
    LastCmd = 0
    GOTO EmitAgain

    '*******************************
    CASE "endfunction", "endsub"
    '*******************************

    IF iMatchWrd(Stk$[1],"endfunction") THEN
      InWinMain = FALSE
      LocalDynaCnt = 0
      LocalDynArrCount = 0

      IF InDialogEvt THEN
        FPRINT Outfile,Scoot$,"if(Msg==WM_CLOSE) DestroyWindow(hWnd);"
        FPRINT Outfile,Scoot$,"return 0;"
        InDialogEvt = FALSE
      END IF

      IF ModDialogEvt THEN
        FPRINT Outfile,Scoot$,"if(Msg==WM_CLOSE) EndDialog(hWnd,0);"
        FPRINT Outfile,Scoot$,"return 0;"
        ModDialogEvt = FALSE
      END IF

      IF CallBackFlag THEN
        FPRINT Outfile,Scoot$,"return DefWindowProc(hWnd, Msg, wParam, lParam);"
        CallBackFlag = FALSE
      END IF
    END IF

    IF iMatchWrd(Stk$[1],"endsub") THEN
      '**************************
      ' Clean up dynamic strings
      '**************************
      IF LocalDynaCnt <> 0 THEN
        FOR j = 1 TO LocalDynaCnt
          FPRINT Outfile,Scoot$,DynaStr$[j]
        NEXT
        LocalDynaCnt = 0
      END IF
      '*********************************
      ' Clean up dynamic strings arrays
      '*********************************
      IF LocalDynArrCount <> 0 THEN
        FOR i = 1 TO LocalDynArrCount
          FPRINT Outfile,Scoot$,LocalDynArrName$[i]
        NEXT
        LocalDynArrCount = 0
      END IF
    END IF
    '*********************************
    IF ForceMainToFunc = TRUE THEN
      FPRINT Outfile,Scoot$,"return 0;"
      ForceMainToFunc = FALSE
    END IF

    CALL BumpDown
    FPRINT Outfile,Scoot$,"}\n\n"
    CALL BumpDown
    InFunc = FALSE
    Use_Static = FALSE

    IF Outfile = FP3 THEN
      InIfDef$ = "FP3"
    END IF

    Outfile = FP2
    ByrefCnt = 0
    '***********************
    CASE "input"
    '***********************
    CALL EmitInputCode

    '***********************
    CASE "finput"
    '***********************
    CALL EmitFileInputCode

    '***********************
    CASE "dynamic"
    '***********************
    DIM RAW w = 0
    DIM RAW SOF$

    CALL HandleNonsense
    CVar$ = Clean$(Stk$[2])
    CALL ValidVar(CVar$)
    IF Stk$[Ndx] = "*" THEN CALL PointerFix

    ZZ$ = ""

    IF iMatchWrd(Stk$[Ndx-1], "as") THEN

      SOF$ = Stk$[Ndx]
      GetTypeInfo(SOF$, &w, &id, &vt)
      IF vt = vt_STRLIT OR vt = vt_DECFUNC OR vt = vt_NUMBER OR _
        (vt = vt_VOID AND INCHR(Stk$[Ndx], "*") = 0) THEN
        Abort(SOF$ + " is not a valid type")
      END IF
      IF vt = vt_FILEPTR AND INCHR(SOF$, "*") = 0 THEN SOF$ = SOF$ + "*"
      Ndx -= 2
    ELSE
      vt = DataType(Stk$[2])
      id = 0
      SOF$ = GetVarTypeName$(vt)
    END IF

    Use_DynamicA = TRUE
    UseFlag      = TRUE

    FOR i = 3 TO Ndx
      CONCAT(ZZ$, Stk$[i])
    NEXT

    dms = TALLY(ZZ$,"][") + 1

    IF dms > 1 THEN REPLACE "][" WITH "," IN ZZ$

    ZZ$ = Clean$(ZZ$)
    RemoveAll(ZZ$,"[]")

    IF vt = vt_STRVAR THEN
      vt = vt_CHAR
      SOF$ = "char"
      IF InTypeDef THEN
        IF Stk$[3] <> "[" THEN
          DECR dms
        ELSE
          vt = vt_CHARPTR
        END IF
      END IF

      dms++
      CONCAT(ZZ$,",2048")
    END IF

    IF InTypeDef THEN
      IF vt = vt_STRUCT THEN
        FPRINT Outfile, Scoot$, "struct _", SOF$, "  ", STRING$(dms,42), CVar$, ";"
      ELSE
        FPRINT Outfile, Scoot$, SOF$, "  ", STRING$(dms,42), CVar$, ";"
      END IF
      CALL AddTypedefElement(BaseTypeDefsCnt[InTypeDef], vt, CVar$, SOF$, dms)
    ELSEIF InFunc THEN
      LocalDynArrCount++
      LocalDynArrName$ [LocalDynArrCount] = "if (" + CVar$ + ") { DestroyArr((void **)" + CVar$ + "," + STR$(dms) + ", 1); " +  CVar$ + "=NULL; }"
      FPRINT Outfile,Scoot$,SOF$;"  ";STRING$(dms,42);CVar$;"=0;"
      CALL AddLocal(CVar$, vt, id,"",dms,0,0)
    ELSE
      IF Use_GenFree THEN
        GlobalDynaCnt++
        GlobalDynaStr$[GlobalDynaCnt] = "if (" + CVar$ + ") { DestroyArr((void **)" + CVar$ + "," + STR$(dms) + ", 1); " +  CVar$ + "=NULL; }"
      END IF
      CALL AddGlobal(CVar$, vt, id,"",dms,0,0,0)
    END IF

    IF NOT InTypeDef THEN
      FPRINT Outfile,Scoot$,CVar$ ; "= ("; SOF$ ;STRING$(dms,42);")CreateArr ("; CVar$ ; ",sizeof(";SOF$;"),0,";TRIM$(STR$(dms));"," ; ZZ$ ; ");"
    END IF


    '***********************
    CASE "redim"
    '***********************
    'REDIM b$ * 14
    'REDIM PRESERVE b$ * 20
    'REDIM a$[10]
    'REDIM PRESERVE a$[20]
    '***********************
    DIM RAW IsPreserve
    DIM RAW SOF$
    DIM RAW VI AS VarInfo PTR
    DIM RAW vt1 = 0
    DIM RAW IsSplat = 0
    DIM RAW BC = 0
    DIM RAW StartPoint
    DIM RAW AsPos = Ndx

    CALL HandleNonsense

    IsPreserve  = iMatchWrd(Stk$[2], "preserve")
    StartPoint  = 2 + IsPreserve

    vt1     = DataType(Stk$[StartPoint])
    CVar$   = Clean$(Stk$[StartPoint])
    IsSplat = iMatchWrd(Stk$[StartPoint + 1], "*")

    CALL ValidVar(CVar$)

    FOR i = Ndx TO 1 STEP -1
      IF iMatchWrd(Stk$[AsPos], "as") THEN
        AsPos = i - 1
        EXIT FOR
      END IF
    NEXT

    DIM RAW L = AsPos, SP = 0

    WHILE L > StartPoint
      IF Stk$[L] = "[" THEN
        DECR BC
      ELSEIF Stk$[L] = "]" THEN
        INCR BC
        IF BC = 1 THEN DECR L : ITERATE
      END IF
      IF BC = 0 THEN
        INCR SP
        IF Stk$[L-1] <> "]" THEN EXIT WHILE
        ZZ$ = "," + ZZ$
      ELSE
        ZZ$ = Stk$[L] + ZZ$
      END IF
      DECR L
    WEND


    'get info
    vt = CheckLocal(CVar$, &id)
    IF vt = vt_UNKNOWN THEN
      vt = CheckGlobal(CVar$, &id)
      IF vt = vt_UNKNOWN THEN
        Abort("Can not REDIM " + CVar$ + " not previously dimensioned")
      END IF
      VI = &GlobalVars[id]
    ELSE
      VI = &LocalVars[id]
    END IF
    dms = VI->VarPntr

    IF vt = vt_STRUCT OR vt = vt_UDT OR vt = vt_UNION THEN  'added vt_UNION 4.40

      SOF$ = GetElement$( StartPoint, &vt, &dms, VI->VarDef)

      i = Ndx
      Ndx = L-1
      CALL AsmUnknownStructs(1)
      Ndx = i
      CALL RemEmptyTokens

      CVar$   = Clean$(Stk$[StartPoint])
      IsSplat = iMatchWrd(Stk$[StartPoint + 1], "*")

    ELSE
      SOF$ = GetVarTypeName$(vt)
    END IF

    IF iMatchWrd(Stk$[Ndx-1], "as") THEN
      IF SOF$ <> Stk$[Ndx] AND NOT iMatchWrd(Stk$[Ndx], "string") THEN
        Abort("Can not change types for variable " + CVar$ + " previously defined as " + SOF$ + " on line" + STR$(VI->VarLine))
      END IF
      IF iMatchWrd(Stk$[Ndx], "string") THEN
        Ndx--
        Stk$[Ndx] = "["
        Stk$[++Ndx] = "2048"
        Stk$[++Ndx] = "]"
      ELSE
        Ndx -= 2
      END IF
    ELSE
      IF (vt = vt_CHAR AND vt1 = vt_STRVAR AND IsSplat = 0) OR vt = vt_CHARPTR THEN
        Ndx++
        Stk$[Ndx] = "["
        Stk$[++Ndx] = "2048"
        Stk$[++Ndx] = "]"
      END IF
    END IF

    IF Stk$[3 + IsPreserve] = "[" THEN
      IF IsPreserve THEN
        StartPoint = 4
      ELSE
        FPRINT Outfile,Scoot$, "if (" + CVar$ + ") { DestroyArr((void **)" + CVar$ + "," + STR$(dms) + ", 1); " +  CVar$ + "=NULL; }"
        StartPoint = 3
      END IF

      Use_DynamicA =TRUE
      UseFlag      =TRUE
      A = 0
      ZZ$ = ""
      FOR i = StartPoint TO Ndx
        IF Stk$[i] = "[" THEN
          A++
          i++
          BC = 1
          WHILE BC > 0
            IF Stk$[i] = "[" THEN
              BC++
              CONCAT(ZZ$, Stk$[i])
            ELSE
              IF Stk$[i] = "]" THEN
                BC--
                IF BC = 0 AND i < Ndx THEN
                  CONCAT(ZZ$, ",")
                END IF
                IF BC THEN
                  CONCAT(ZZ$, Stk$[i])
                END IF
              ELSE
                CONCAT(ZZ$, Stk$[i])
              END IF
            END IF
            i++
          WEND
          i--
        END IF
      NEXT
      ZZ$ = Clean$(ZZ$)

      IF vt = vt_STRLIT OR vt = vt_DECFUNC OR vt = vt_NUMBER OR _
        (vt = vt_VOID AND INCHR(Stk$[Ndx],"*") = 0) THEN
        Abort(Stk$[Ndx] + " is not a valid type")
      END IF
      IF vt = vt_STRVAR THEN
        SOF$ = "char"
        A++
        CONCAT(ZZ$,",2048")
      END IF

      IF A <> dms THEN
        Abort("Mismatch in dimensions for " + CVar$ + ", orignally " + STR$(dms) + " found " + STR$(A))
      END IF

      FPRINT Outfile,Scoot$,CVar$ ; "= ("; SOF$ ;STRING$(dms,42);")CreateArr ("; CVar$ ; ",sizeof(";SOF$;"),";TRIM$(STR$(IsPreserve));",";dms;"," ; ZZ$ ; ");"

      EXIT SELECT
    END IF

    IF Stk$[3]= "*" OR (IsPreserve AND Stk$[4]= "*") THEN       ' DIM MySTRING$ * NumBytes
      IF IsPreserve THEN
        FPRINT Outfile,Scoot$ ; CVar$ ; "=(char*)realloc(";CVar$;",256+";
        i = 5
      ELSE
        FPRINT Outfile,Scoot$ ; "free(" ; CVar$ ; ");"
        FPRINT Outfile,Scoot$ ; CVar$ ; "=(char*)calloc(256+";
        i = 4
      END IF

      FOR A = i TO Ndx
        FPRINT Outfile,Clean$(Stk$[A]);
      NEXT

      IF IsPreserve THEN
        FPRINT Outfile,");"
      ELSE
        FPRINT Outfile,",1);"
      END IF
      EXIT SELECT
    END IF

    Abort("Invalid REDIM statement")

    '*********************************************************
    CASE "dim", "local", "raw", "static", "auto", "register"
    '********************************************************
    ' DIM A$ * blah blah blah
    ' DIM a%[1000]  (integer)
    ' DIM a![1000]  (single)
    ' DIM a#[1000]  (double)
    ' DIM a¦[1000]  (long double)
    ' DIM A$[1000]  (string)
    ' DIM r             AS DATA_TYPE
    ' DIM r[1][2]...[n] AS DATA_TYPE
    ' DIM DYNAMIC A$[1000]
    '********************************************************
    DIM RAW w = 0
    DIM RAW UseStatic$
    DIM RAW IsVolatile = 0
    DIM RAW IV$

    IsVolatile = iMatchWrd(Stk$[2],"volatile")
    IF IsVolatile THEN
      IV$ = "volatile "
    ELSE
      IV$ = ""
    END IF
    IsSubOrFuncPtr = SubFuncTest()
    CALL HandleNonsense
    IF Stk$[Ndx] = "*" THEN CALL PointerFix
    Cmd$ = LCASE$(Stk$[1])

    IsRegister = IsAuto = IsDim = IsLocal = IsStatic = IsRaw = FALSE

    SELECT CASE Cmd$
      CASE "dim"      : IsDim      = TRUE
      CASE "local"    : IsLocal    = TRUE
      CASE "static"   : IsStatic   = TRUE
      CASE "raw"      : IsRaw      = TRUE
      CASE "auto"     : IsAuto     = TRUE
      CASE "register" : IsRegister = TRUE
    END SELECT

    '*************************************************************************

    IF IsSubOrFuncPtr THEN
      IF IsVolatile THEN Abort("volatile SUB/FUNCTION pointers not supported")

      IF DimSubFunc(0) THEN EXIT SELECT
    END IF

    '*************************************************************************
    CVar$ = Clean$(Stk$[2+IsVolatile])
    CALL ValidVar(CVar$)
    VType = DataType(Stk$[2+IsVolatile])

    '***********************************************************************

    IF Stk$[3+IsVolatile] = "*" THEN       ' DIM MySTRING$ * NumBytes
      IF IsVolatile THEN Abort("volatile dynamic strings not supported")
      CALL DimDynaString(CVar$, 0, 0)
      EXIT SELECT
    END IF


    IF iMatchWrd(Stk$[Ndx-1],"as") THEN
      Var1$ = CVar$
      IsPointer = TALLY(Stk$[Ndx],"*")

      DimType$ = ""
      lszTmp$  = ""

      FOR i = 2+IsVolatile TO Ndx-2
        CONCAT(lszTmp$, Stk$[i])
        IF i > 2+IsVolatile THEN CONCAT(DimType$, Stk$[i])
      NEXT

      Var$ = REMOVE$(Stk$[Ndx],"*")
      GetTypeInfo(Var$, &w, &id, &vt)

      IF vt = vt_STRVAR THEN
        Stk$[Ndx] = "char"
        Var$ = Stk$[Ndx]
        CONCAT(DimType$, "[2048]")
        CONCAT(lszTmp$, "[2048]")
      END IF

      IF InFunc OR InTypeDef THEN
        IF IsRegister OR IsAuto THEN
          IF IsRegister THEN
            IF IsVolatile THEN Abort("Register volatile not supported")
            IF vt = vt_FILEPTR THEN
              FPRINT Outfile,Scoot$,"register  FILE*   ";
            ELSE
              FPRINT Outfile,Scoot$,"register  ";Stk$[Ndx];"  ";
            END IF
          ELSE
            IF vt = vt_FILEPTR THEN
              FPRINT Outfile,Scoot$,"auto ";IV$;"  FILE*   ";
            ELSE
              FPRINT Outfile,Scoot$,"auto ";IV$;" ";Stk$[Ndx];"  ";
            END IF
          END IF
        ELSE
          IF IsRaw = TRUE THEN
            IF vt = vt_FILEPTR THEN
              FPRINT Outfile,Scoot$,"static ";IV$;"  FILE*   ";
            ELSE
              FPRINT Outfile,Scoot$,IV$;Stk$[Ndx];"  ";
            END IF
          ELSE
            IF InTypeDef THEN
              UseStatic$ = ""
            ELSE
              UseStatic$ = "static  "
            END IF
            IF vt = vt_STRUCT THEN
              FPRINT Outfile,Scoot$,UseStatic$;IV$;"struct _" ; Stk$[Ndx]; "  ";
            ELSE
              IF vt = vt_FILEPTR THEN
                FPRINT Outfile,Scoot$,UseStatic$;IV$;"FILE   *";
              ELSE
                FPRINT Outfile,Scoot$,UseStatic$;IV$;Stk$[Ndx] ; "  ";
              END IF
            END IF
            IF InTypeDef THEN
              CALL AddTypedefElement(BaseTypeDefsCnt[InTypeDef], vt, CVar$, Var$, 0)
            END IF
          END IF
        END IF

        IF InFunc AND NOT InTypeDef THEN
          CALL AddLocal(Var1$, vt, id, DimType$, IsPointer,0,0)
        END IF

        FPRINT Outfile,Clean$(lszTmp$); ";"

        IF NOT InTypeDef AND NOT IsStatic AND NOT IsRaw AND NOT IsRegister AND NOT IsVolatile THEN
          T$ = Clean$(EXTRACT$(lszTmp$,"["))
          IF IsPointer THEN
            FPRINT Outfile,Scoot$,"memset(&";T$;",0,sizeof(";Clean$(Var$) + " *";"));"
          ELSE
            FPRINT Outfile,Scoot$,"memset(&";T$;",0,sizeof(";T$;"));"
          END IF
        END IF
      ELSE
        IF IsVolatile THEN
          'IF AS THEN USE ASCHECK TO SET vt
          CALL AddGlobal(Var1$, vt, id, DimType$,IsPointer,0,3,0)
        ELSE
          'IF AS THEN USE ASCHECK TO SET vt
          CALL AddGlobal(Var1$, vt, id, DimType$,IsPointer,0,0,0)
        END IF
      END IF
      EXIT SELECT
    END IF

    '*************************************************************************

    IF InFunc OR InTypeDef THEN
      lszTmp$ = ""
      IF iMatchWrd(Stk$[3+IsVolatile],"as") THEN
        VType = CheckType(Stk$[4+IsVolatile])
        IF VType = vt_CHAR THEN
          IF Stk$[5] = "*" THEN
            lszTmp$ = "[" + Stk$[6+IsVolatile] + "]"
          END IF
        END IF
      ELSE

        FOR i = 3+IsVolatile TO Ndx
          CONCAT (lszTmp$, Stk$[i])
        NEXT

        lszTmp$ = LTRIM$(Clean$(lszTmp$))

        IF VType = vt_STRVAR THEN 'AND ((Stk$[3+IsVolatile] = "" AND InTypeDef) OR (NOT InTypeDef)) THEN
          IF lszTmp$ <> "[2048]" THEN CONCAT (lszTmp$, "[2048]")
        END IF
      END IF

      j = (NOT InTypeDef AND NOT IsStatic AND NOT IsRaw AND NOT IsRegister)

      IF j THEN
        T$ = Clean$(EXTRACT$(CVar$,"["))
      END IF

      SELECT CASE VType
        CASE vt_STRVAR
        IF IsRaw THEN
          FPRINT Outfile,Scoot$;IV$;"char ";CVar$;lszTmp$;";"
        ELSEIF IsAuto THEN
          FPRINT Outfile,Scoot$;"auto ";IV$;"char ";CVar$;lszTmp$;";"
        ELSEIF IsRegister THEN
          IF IsVolatile THEN Abort("register volatile not supported")
          FPRINT Outfile,Scoot$;"register char ";CVar$;lszTmp$;";"
        ELSE
          IF InTypeDef THEN
            FPRINT Outfile,Scoot$;IV$;"char ";CVar$;lszTmp$;";"
          ELSE
            FPRINT Outfile,Scoot$;"static ";IV$;"char ";CVar$;lszTmp$;";"
          END IF
        END IF
        IF j AND NOT IsVolatile THEN
          FPRINT Outfile,Scoot$;"memset(&";T$;",0,sizeof(";T$;"));"
        END IF

        CASE vt_VarMin TO vt_VarMax
        ZZ$ = GetVarTypeName$(VType)
        ZZ$ = RPAD$(ZZ$, 7)
        IF IsRaw THEN
          FPRINT Outfile,Scoot$;IV$;ZZ$;" ";CVar$;lszTmp$;";"
        ELSEIF IsAuto THEN
          FPRINT Outfile,Scoot$;"auto ";IV$;ZZ$;" ";CVar$;lszTmp$;";"
        ELSEIF IsRegister THEN
          IF IsVolatile THEN Abort("Regester volatile not supported")
          FPRINT Outfile,Scoot$;"register ";ZZ$;" ";CVar$;lszTmp$;";"
        ELSE
          IF InTypeDef THEN
            FPRINT Outfile,Scoot$;IV$;ZZ$;" ";CVar$;lszTmp$;";"
          ELSE
            FPRINT Outfile,Scoot$;"static ";IV$;ZZ$;" ";CVar$;lszTmp$;";"
          END IF
        END IF
        IF j AND NOT IsVolatile THEN
          FPRINT Outfile,Scoot$;"memset(&";T$;",0,sizeof(";T$;"));"
        END IF
      END SELECT
      IF InFunc AND NOT InTypeDef THEN
        CALL AddLocal(CVar$, VType, 0, lszTmp$,0,0,0)
      END IF
      IF InTypeDef THEN
        CALL AddTypedefElement(BaseTypeDefsCnt[InTypeDef], VType, CVar$, Var$, 0)
      END IF
      EXIT SELECT
    END IF

    '************************************************************************
    lszTmp$ = ""  ' if we get here, we're creating with a GLOBAL variable
    '************************************************************************

    FOR i = 3+IsVolatile TO Ndx
      CONCAT (lszTmp$, Stk$[i])
    NEXT

    IF VType = vt_STRVAR AND lszTmp$ <> "" THEN
      CONCAT (lszTmp$, "[2048]")
    END IF
    IF IsVolatile THEN
      'IF AS THEN USE ASCHECK TO SET VType
      CALL AddGlobal(CVar$, VType, 0,lszTmp$,0,0,3,0)
    ELSE
      'IF AS THEN USE ASCHECK TO SET VType
      CALL AddGlobal(CVar$, VType, 0,lszTmp$,0,0,0,0)
    END IF

    '***********************
    CASE "extern"
    '***********************
    DIM RAW IsVolatile

    IsSubOrFuncPtr = SubFuncTest()
    CALL HandleNonsense
    IsVolatile = iMatchWrd(Stk$[2],"volatile")
    CVar$ = Clean$(Stk$[2+IsVolatile])
    CALL ValidVar(CVar$)

    IF Stk$[Ndx] = "*" THEN CALL PointerFix

    IF Stk$[3+IsVolatile] = "*" THEN
      IF IsVolatile THEN Abort("volatile dynamic strings not supported")
      CALL DimDynaString(CVar$, 2, 0)
      EXIT SELECT
    END IF

    IF IsSubOrFuncPtr THEN
      IF IsVolatile THEN Abort("volatile SUB/FUNCTION pointers not supported")
      IF DimSubFunc(0) THEN EXIT SELECT
    END IF

    Var$ = Clean$(Stk$[2+IsVolatile])
    CALL ValidVar(Var$)

    IsPointer = 0
    DimType$  = ""

    IF iMatchWrd(Stk$[Ndx-1],"as") THEN
      GetTypeInfo(Stk$[Ndx], &IsPointer, &id, &vt)

      Stk$[Ndx] = REMOVE$(Stk$[Ndx],"*")
      FOR i = 3+IsVolatile TO Ndx-2
        CONCAT (DimType$, Stk$[i])
      NEXT

    ELSE

      i = 3+IsVolatile
      WHILE i <= Ndx
        CONCAT(DimType$,Stk$[i])
        i++
      WEND
      vt = DataType(Stk$[2+IsVolatile])
      id = 0
    END IF

    IF vt = vt_STRVAR THEN '  AND DimType$ <> "" THEN
      CONCAT (DimType$, "[2048]")
    END IF
    'IF AS THEN USE ASCHECK TO SET vt
    IF IsVolatile THEN
      CALL AddGlobal(Var$, vt, id, DimType$, IsPointer,0,4,0)
    ELSE
      CALL AddGlobal(Var$, vt, id, DimType$, IsPointer,0,1,0)
    END IF

    '*************************
    CASE "shared", "global"
    '*************************
    DIM RAW w = 0
    DIM RAW SOF$
    DIM RAW IsShared
    DIM RAW IsVolatile

    IsSubOrFuncPtr = SubFuncTest()
    CALL HandleNonsense
    IsVolatile = iMatchWrd(Stk$[2],"volatile")
    CVar$ = Clean$(Stk$[2+IsVolatile])
    CALL ValidVar(CVar$)

    IsShared = iMatchWrd(Stk$[1],"shared")

    IF Stk$[Ndx] = "*" THEN CALL PointerFix

    IF Stk$[3+IsVolatile] = "*" THEN
      IF IsVolatile THEN Abort("volatile dynamic strings not supported")
      CALL DimDynaString(CVar$, 1, IsShared)
      EXIT SELECT
    END IF

    IF IsSubOrFuncPtr THEN
      IF IsVolatile THEN Abort("volatile SUB/FUNCTION pointers not supported")
      CALL DimSubFunc(0)
      EXIT SELECT
    END IF

    IF iMatchWrd(Stk$[2],"dynamic") THEN
      CVar$ = Clean$(Stk$[3])

      CALL ValidVar(CVar$)
      IF iMatchWrd(Stk$[Ndx-1],"as") THEN
        SOF$ = Stk$[Ndx]
        GetTypeInfo(SOF$, &w, &id, &vt)
        IF vt = vt_STRLIT OR _
          vt = vt_DECFUNC OR _
          vt = vt_NUMBER OR _
          (vt = vt_VOID AND INCHR(Stk$[Ndx],"*") = 0) THEN
          Abort(Stk$[Ndx] + " is not a valid type")
        END IF
        Ndx -= 2
      ELSE
        vt = DataType(Stk$[3])
        id = 0
        SOF$ = GetVarTypeName$(vt)
      END IF

      Use_DynamicA = TRUE
      UseFlag      = TRUE

      ZZ$ = ""

      FOR i = 4 TO Ndx
        CONCAT(ZZ$, Stk$[i])
      NEXT

      dms = TALLY(ZZ$,"][") + 1

      IF dms > 1 THEN REPLACE "][" WITH "," IN ZZ$

      ZZ$ = Clean$(ZZ$)
      RemoveAll(ZZ$,"[]")

      IF vt = vt_STRVAR THEN
        vt = vt_CHAR
        SOF$ = "char"
        dms++
        CONCAT(ZZ$,",2048")
      END IF

      IF Use_GenFree THEN
        GlobalDynaCnt++
        GlobalDynaStr$[GlobalDynaCnt] = "if (" + CVar$ + ") { DestroyArr((void **)" + CVar$ + "," + STR$(dms) + ", 1); " +  CVar$ + "=NULL; }"
      END IF
      'IF AS THEN USE ASCHECK TO SET vt
      CALL AddGlobal(CVar$, vt, id,"",dms,0,0,0)

      FPRINT Outfile,Scoot$,CVar$ ; "= ("; SOF$ ;STRING$(dms,42);")CreateArr ("; CVar$ ; ",sizeof(";SOF$;"),0,";TRIM$(STR$(dms));"," ; ZZ$ ; ");"

      EXIT SELECT
    END IF

    IsPointer = 0

    Var$ = Clean$(Stk$[2+IsVolatile])
    CALL ValidVar(Var$)

    IF iMatchWrd(Stk$[Ndx-1],"as") THEN
      IF INCHR(Stk$[Ndx],"*") THEN
        IsPointer = TALLY(Stk$[Ndx],"*")
        Stk$[Ndx] = REMOVE$(Stk$[Ndx],"*")
      END IF
      DimType$ = ""
      FOR i = 3+IsVolatile TO Ndx-2
        CONCAT (DimType$, Stk$[i])
      NEXT
      GetTypeInfo(Stk$[Ndx], &w, &id, &vt)
    ELSE
      DimType$ = ""
      i = 3+IsVolatile
      WHILE i <= Ndx
        CONCAT(DimType$,Stk$[i])
        i++
      WEND
      vt = DataType(Stk$[2+IsVolatile])
      id = 0
    END IF

    IF vt = vt_STRVAR THEN
      CONCAT (DimType$, "[2048]")
    END IF
    'IF AS THEN USE ASCHECK TO SET vt
    IF IsShared THEN
      IF IsVolatile THEN
        CALL AddGlobal(Var$, vt, id, DimType$, IsPointer,0,5,0)
      ELSE
        CALL AddGlobal(Var$, vt, id, DimType$, IsPointer,0,2,0)
      END IF
    ELSE
      IF IsVolatile THEN
        CALL AddGlobal(Var$, vt, id, DimType$, IsPointer,0,3,0)
      ELSE
        CALL AddGlobal(Var$, vt, id, DimType$, IsPointer,0,0,0)
      END IF
    END IF

    '*********************************************************************
    CASE "while"

    CALL EmitIfCond("while")


    '***********************
    CASE "wend", "endwhile"
    '***********************

    CALL BumpDown
    FPRINT Outfile,Scoot$,"}"
    CALL BumpDown

    '***********************
    CASE "exit"
    '***********************

    IF CaseFlag THEN NoBreak2 = TRUE

    IF iMatchWrd(Stk$[2],"sub") THEN
      '*************************
      ' Clean up dynamic strings
      '*************************
      IF LocalDynaCnt <> 0 THEN
        FOR j = 1 TO LocalDynaCnt
          FPRINT Outfile,Scoot$,DynaStr$[j]
        NEXT
      END IF
      '*********************************
      ' Clean up dynamic strings arrays
      '*********************************
      IF LocalDynArrCount <> 0 THEN
        FOR i = 1 TO LocalDynArrCount
          FPRINT Outfile,Scoot$, LocalDynArrName$[i]
        NEXT
      END IF
      '*********************************
      FPRINT Outfile,Scoot$,"return;"
      EXIT SELECT
    END IF

    IF iMatchWrd(Stk$[2],"function") THEN
      '*************************
      ' Clean up dynamic strings
      '*************************

      IF LocalDynaCnt <> 0 THEN
        FOR j = 1 TO LocalDynaCnt
          FPRINT Outfile,Scoot$,DynaStr$[j]
        NEXT
      END IF
      '*********************************
      ' Clean up dynamic strings arrays
      '*********************************
      IF LocalDynArrCount <> 0 THEN
        FOR i = 1 TO LocalDynArrCount
          FPRINT Outfile,Scoot$, LocalDynArrName$[i]
        NEXT
      END IF
      '*********************************
      FPRINT Outfile,Scoot$,"return 0;"
    ELSE
      FPRINT Outfile,Scoot$,"break;"
    END IF

    '***********************
    CASE "goto"
    '***********************
    IF CaseFlag THEN NoBreak2 = TRUE

    FPRINT Outfile,Scoot$,"goto ";UCASE$(Stk$[2]);";"

    '***********************
    CASE "print"
    '***********************
    FPRINT Outfile,Scoot$ ; PrintWriteFormat$(0)
    FPRINT Outfile,Scoot$ ; "RPRINT();"

    '***********************
    CASE "write"
    '***********************

    FPRINT Outfile,Scoot$,PrintWriteFormat$(1)

    '***********************
    CASE "color"
    '***********************

    IF NoMain = TRUE OR MakeDLL = TRUE THEN
      Use_Console = TRUE
      FPRINT Outfile,"  hConsole = GetStdHandle (STD_OUTPUT_HANDLE);"
    END IF

    FPRINT Outfile,Scoot$,"color (";
    FOR A = 2 TO Ndx
      FPRINT Outfile,Clean$(Stk$[A]);
    NEXT
    FPRINT Outfile,Scoot$,");"

    '***********************
    CASE "locate"
    '***********************

    IF NoMain = TRUE OR MakeDLL = TRUE THEN
      Use_Console = TRUE
      FPRINT Outfile,"  hConsole = GetStdHandle (STD_OUTPUT_HANDLE);"
    END IF

    FPRINT Outfile,Scoot$,"locate (";
    FOR A = 2 TO Ndx
      FPRINT Outfile,Clean$(Stk$[A]);
    NEXT
    FPRINT Outfile,");"

    '***********************
    CASE "panel"
    '***********************

    IF NoMain = TRUE OR MakeDLL = TRUE THEN
      Use_Console = TRUE
      FPRINT Outfile,"  hConsole = GetStdHandle (STD_OUTPUT_HANDLE);"
    END IF

    FPRINT Outfile,Scoot$,"panel (";
    FOR A = 2 TO Ndx
      FPRINT Outfile,Clean$(Stk$[A]);
    NEXT
    FPRINT Outfile,");"

    '***********************
    CASE "cls"
    '***********************

    IF NoMain = TRUE OR MakeDLL = TRUE THEN
      Use_Console = TRUE
      FPRINT Outfile,"  hConsole = GetStdHandle (STD_OUTPUT_HANDLE);"
    END IF

    FPRINT Outfile,Scoot$,"cls();"

    '**********************************************************************
    CASE ELSE
    '**********************************************************************
    ' "="   We MUST be processing an assignment statement if we get here!
    '       or perhaps calling a SUB without using the CALL keyword
    '**********************************************************************

    FOR B = 1 TO Ndx
      IF Stk$[B]= "=" THEN EXIT FOR
    NEXT

    '*************************************************************************
    'There's no "=" so we're either calling a SUB or this is a FUNCTION RETURN
    '*************************************************************************

    IF B-1 = Ndx THEN
      lszTmp$ = ""
      FOR Tmp = 1 TO Ndx
        CONCAT(lszTmp$, Clean$(Stk$[Tmp]))
      NEXT
      CONCAT(lszTmp$, ";")
      IF FuncRetnFlag = 2 THEN
        FPRINT Outfile,lszTmp$
      ELSE
        FPRINT Outfile,Scoot$,lszTmp$
      END IF

      IF FuncRetnFlag = 2 THEN
        FuncRetnFlag = 0
        Stk$[1] = ""
        EXIT SUB
      END IF

      EXIT SELECT
    END IF

    '*************************************************************************
    '      It can only be one thing now -- a normal assignment statement
    '*************************************************************************

    FOR i = 2 TO B-1
      CONCAT(Stk$[1], Stk$[i])    ' IF present, build the Array Variable
    NEXT

    A = INCHR(Stk$[1], "*")
    IF A THEN
      IF NOT ( INCHR(Stk$[1], "$") AND A > 1 ) THEN 'Exclude strings BYREF
        RemoveAll(Stk$[1], "$")
        GOTO ProcessNumeric
      END IF
    END IF

    '*************************************************************************
    '                    'processing a string equation
    '*************************************************************************

    LOCAL strtest, varid, vi AS VarInfo PTR, vr$, brcnt

    strtest = DataType(Stk$[1])

    IF strtest = vt_INTEGER THEN
      brcnt = TALLY(Stk$[1], "[")
      vr$ = EXTRACT$(Stk$[1], "[")
      strtest = CheckLocal(vr$, &varid)
      IF strtest = vt_UNKNOWN THEN
        strtest = CheckGlobal(vr$, &varid)
        vi = &(GlobalVars[varid])
      ELSE
        vi = &(LocalVars[varid])
      END IF

      IF strtest = vt_CHAR THEN
        strtest = vt_STRVAR
      END IF
      IF strtest = vt_STRVAR THEN
        IF vi->VarPntr <> 0 THEN
          ' string pointer
          GOTO ProcessNumeric
        END IF
        IF TALLY(vi->VarDim,"[") = brcnt THEN
          ' the character within string
          GOTO ProcessNumeric
        END IF
        IF TALLY(vi->VarDim,"[") <> brcnt+1 THEN
          ' string pointer
          GOTO ProcessNumeric
        END IF
      END IF
    END IF

    IF strtest = vt_STRVAR THEN
      '*************************************************************************

      IF B+1 = Ndx THEN
        IF Stk$[Ndx] = DDQ$ THEN
          FPRINT Outfile,Scoot$,"*",Clean$(Stk$[1]),"=0;"
          GOTO StringExit
        END IF
      END IF

      ' [ Speed up No. 1 ] ****************************************************

      IF Ndx = 3 THEN
        Stk$[1]=Clean$(Stk$[1])
        Stk$[3]=Clean$(Stk$[3])

        IF Stk$[1] = "BCX_RetStr" THEN
          FPRINT Outfile,Scoot$,"BCX_RetStr=BCX_TmpStr(strlen(" ; Stk$[3] ; "));"
        END IF

        FPRINT Outfile,Scoot$,"strcpy(", Stk$[1], ",", Stk$[3], ");"
        GOTO StringExit
      END IF


      '***********************
      Arg$    = ""
      lszTmp$ = ""
      j=k=0
      '***********************
      IF iMatchLft(Stk$[3],"$$") THEN HasStorage = TRUE

      Var$ = Clean$(Stk$[1])

      IF Clean$(Stk$[B+1]) = Var$ THEN
        k = TRUE
      END IF

      FOR A = B+1 TO Ndx ' B marks the position of the "=" char

        IF Stk$[A]= "&" AND Stk$[A-1] <> "," AND Stk$[A-1] <> "(" THEN
          INCR j
          Arg$ = Arg$ + lszTmp$
          lszTmp$ = ","
        ELSE
          CONCAT(lszTmp$, Clean$(Stk$[A]))
        END IF
      NEXT

      IF *lszTmp <> 0 AND lszTmp$ <> "," THEN
        Arg$ = Arg$ + lszTmp$
      END IF


      '*************************************************************************
      '                                 Rules
      '*************************************************************************
      ' IF j = 0 & K = ANY                     THEN use strcpy
      ' IF j = 1 & K = TRUE                    THEN use strcat
      ' All else                               THEN use join
      '*************************************************************************

      RemoveAll(Var$, SPC$)             'Added this during the beta testing
      '*** needs to be checked out still ***
      'stk[++i] is getting here as stk [ + + i ]

      IF j = 0 THEN
        IF Var$ = "BCX_RetStr" THEN
          IF HasStorage THEN
            FPRINT Outfile,Scoot$,"BCX_RetStr=", Arg$, ";"
            GOTO StringExit
          ELSE
            FPRINT Outfile,Scoot$,"BCX_RetStr=BCX_TmpStr(strlen(" , Arg$ , "));"
          END IF
        END IF
        FPRINT Outfile,Scoot$,"strcpy(", Var$ , "," , Arg$, ");"
        GOTO StringExit
      END IF


      'If we make it here then we should have 2 or more expressions

      IF k = TRUE AND j = 1 THEN
        FPRINT Outfile,Scoot$,"strcat(", Arg$ , ");"
        GOTO StringExit
      END IF

      lszTmp$ = LTRIM$(STR$(++j))
      Use_Join = UseFlag = TRUE

      IF Var$ = "BCX_RetStr" THEN
        FPRINT Outfile,Scoot$,"BCX_RetStr=join(" , lszTmp$ , "," , Arg$, ");"
      ELSE
        FPRINT Outfile,Scoot$,"strcpy(",Var$, ", join(" , lszTmp$ , "," , Arg$, "));"
      END IF

      StringExit:
      EXIT SELECT

      '***********************
    ELSE
      '***********************
      ProcessNumeric:
      '***********************

      FOR i = 2 TO B
        Stk$[i] = ""
      NEXT

      Stk$[B]= "="    'This is necessary

      ' change x = x ? c to x ?= c

      IF Stk$[B + 1] = Stk$[1] AND Ndx = 5 THEN
        IF Inset(Stk$[B + 2], "+-*/") AND Stk$[B + 3] <> ">" THEN
          Stk$[B] = Stk$[B + 2] + Stk$[B]
          Stk$[B + 1] = ""
          Stk$[B + 2] = ""
        END IF
      END IF

      FPRINT Outfile,Scoot$,Clean$(Stk$[1]);
      FOR A = 2 TO Ndx
        IF Stk$[A] = "!" THEN
          FPRINT Outfile,"!";
        ELSE
          FPRINT Outfile,Clean$(Stk$[A]);
        END IF
      NEXT
      FPRINT Outfile,";"
    END IF
  END SELECT

  IF FuncRetnFlag = 1 THEN
    IF LocalDynaCnt <> 0 THEN
      FOR j = 1 TO LocalDynaCnt
        FPRINT Outfile,Scoot$,DynaStr$[j]
      NEXT
    END IF
    '******************************************************************
    FPRINT Outfile,Scoot$,"return BCX_RetStr;"  ' $ FUNCTION Return
    '******************************************************************
  END IF
END SUB ' Emit




SUB Abort(Z$)
  DIM RAW i = 0
  DIM RAW j = 0
  DIM RAW k = 0
  DIM RAW varnum = 0
  DIM RAW t$
  DIM RAW frmt$
  WarnMsg$ = ""

  IF LEFT$(AbortSrc$,11) = "$BCXVERSION" THEN
    CONCAT(WarnMsg$,Z$)
  ELSE
    WarnMsg$ = WarnMsg$ + Z$ + " at line" + STR$(ModuleLineNos[ModuleNdx]) + " in Module: " + TRIM$(Modules$[ModuleNdx]) + CRLF$

    WarnMsg$ = WarnMsg$ + "Original line" + CRLF$
    WarnMsg$ = WarnMsg$ +  AbortSrc$ + CRLF$
    WarnMsg$ = WarnMsg$ + "==============" + CRLF$
    WarnMsg$ = WarnMsg$ + "Current Tokens" + CRLF$
    WarnMsg$ = WarnMsg$ + "==============" + CRLF$

    FOR k = 1 TO Ndx
      j = LEN(Stk$[k])

      IF j < 40 THEN
        j = 40 - j
      ELSE
        j = 8 - IMOD(j,8)
      END IF

      frmt$ = LPAD$(STR$(k),3)

      WarnMsg$ = WarnMsg$ + frmt$ + " " + Stk$[k] + STRING$(j,32) + CRLF$

      t$ = Clean$(Stk$[k])
      i = CheckLocal(t$, &varnum)

      IF i <> vt_UNKNOWN THEN

        WarnMsg$ = WarnMsg$ + "is a LOCAL defined at line" + STR$(LocalVars[varnum].VarLine)

        WarnMsg$ = WarnMsg$ + " in Module: " + LocalVars[varnum].VarModule + CRLF$
      ELSE
        i = CheckGlobal(t$, &varnum)
        IF i <> vt_UNKNOWN THEN
          WarnMsg$ = WarnMsg$ + "is a GLOBAL defined at line" + STR$(GlobalVars[varnum].VarLine)
          WarnMsg$ = WarnMsg$ + " in Module: " + GlobalVars[varnum].VarModule + CRLF$
          WarnMsg$ = WarnMsg$ + " " + Stk$[k] & GlobalVars[varnum].VarDim$ + " as "
          IF GlobalVars[varnum].VarDef THEN
            WarnMsg$ = WarnMsg$ + TRIM$(TypeDefs[GlobalVars[varnum].VarDef].VarName$) + CRLF$
          ELSE
            WarnMsg$ = WarnMsg$ + TRIM$(GetVarTypeName$(GlobalVars[varnum].VarType)) + CRLF$
          END IF
        ELSE
          IF Stk[k][0] = 34 THEN
            WarnMsg$ = WarnMsg$ + "is a STRING LITERAL" + CRLF$
          END IF
        END IF
      END IF
    NEXT

    WarnMsg$ = WarnMsg$ + "===============" + CRLF$
    WarnMsg$ = WarnMsg$ + "Original Tokens" + CRLF$
    WarnMsg$ = WarnMsg$ + "===============" + CRLF$

    CALL XParse(AbortSrc$)

    FOR k = 1 TO Ndx
      j = LEN(Stk$[k])
      IF j < 40 THEN
        j = 40 - j
      ELSE
        j = 8 - IMOD(j,8)
      END IF

      frmt$ = LPAD$(STR$(k),3)

      WarnMsg$ = WarnMsg$ + frmt$ + " " + Stk$[k] + STRING$(j,32) + CRLF$

      t$ = Clean$(Stk$[k])
      i = CheckLocal(t$, &varnum)

      IF i <> vt_UNKNOWN THEN
        WarnMsg$ = WarnMsg$ + "is a LOCAL defined at line" + STR$(LocalVars[varnum].VarLine)
        WarnMsg$ = WarnMsg$ + " in Module: " + LocalVars[varnum].VarModule + CRLF$
      ELSE
        i = CheckGlobal(t$, &varnum)
        IF i <> vt_UNKNOWN THEN
          WarnMsg$ = WarnMsg$ + "is a GLOBAL defined at line" + STR$(GlobalVars[varnum].VarLine)
          WarnMsg$ = WarnMsg$ + " in Module: " + GlobalVars[varnum].VarModule + CRLF$
          WarnMsg$ = WarnMsg$ + " " + Stk$[k] & GlobalVars[varnum].VarDim$ + " as "
          IF GlobalVars[varnum].VarDef THEN
            WarnMsg$ = WarnMsg$ + TypeDefs[GlobalVars[varnum].VarDef].VarName$ + CRLF$
          ELSE
            WarnMsg$ = WarnMsg$ + GetVarTypeName$(GlobalVars[varnum].VarType) + CRLF$
          END IF
        ELSE
          IF Stk[k][0] = 34 THEN
            WarnMsg$ = WarnMsg$ + "is a string literal" + CRLF$
          END IF
        END IF
      END IF
    NEXT
  END IF

  WarnMsg$ = WarnMsg$ + CRLF$

  CALL CloseAll

  KILL ovrFile$
  KILL FileOut$
  KILL prcFile$
  KILL udtFile$
  KILL hdrFile$
  KILL cstFile$
  KILL datFile$
  KILL setFile$
  KILL enuFile$
  KILL resFile$
  KILL "$t$e$m$p"

  IF ErrFile THEN
    OPEN FileErr$ FOR APPEND AS fpErr
    FPRINT fpErr, Z$ ; " at line" ; ModuleLineNos[ModuleNdx] ; " in Module: "; TRIM$(Modules$[ModuleNdx]) 'LinesRead
    CLOSE fpErr
  END IF
  IF InfoBoxWarn THEN
    INFOBOX("Error! " + FileIn$,WarnMsg$)
  ELSE
    PRINT "Error!",CRLF$, FileIn$,CRLF$, WarnMsg$
  END IF
  CALL FREEGLOBALS
  END = 1
END SUB ' Abort



SUB BumpDown
  Indent--
  Indent--
  IF Indent<0 THEN Indent = 0
  Scoot$ = SPACE$(Indent)
END SUB ' BumpDown



SUB BumpUp
  IF Indent<0 THEN Indent = 0
  Indent++
  Indent++
  Scoot$ = SPACE$(Indent)
END SUB ' BumpUp



FUNCTION BraceCount( Arg$ )
  DIM RAW p AS CHAR PTR
  DIM RAW braces
  p = Arg$
  braces = 0
  WHILE *p
    IF *p = c_DblQt THEN
      p++
      WHILE *p <> c_DblQt
        IF *p = 0 THEN FUNCTION = braces
        p++
      WEND
    END IF
    IF *p = ASC("}") THEN braces--
    IF *p = ASC("{") THEN braces++
    p++
  WEND
  FUNCTION = braces
END FUNCTION ' BraceCount



FUNCTION BracketHandler(Src$,l) AS CHAR PTR
  DIM RAW s AS CHAR PTR

  s = Src$

  SELECT CASE l
    CASE 0
    DO
      IF *s = 0 THEN EXIT LOOP
      IF *s = c_DblQt THEN
        s++
        WHILE *s <> c_DblQt
          IF *s = 0 THEN EXIT LOOP
          s++
        WEND
      END IF

      IF *s = c_LtBkt THEN
        s++
        s = BracketHandler(s,1)
      END IF
      IF *s = c_LPar THEN
        s++
        s = BracketHandler(s,2)
      END IF
      s++
    LOOP

    CASE 1
    WHILE *s <> c_RtBkt
      IF *s = c_DblQt THEN
        s++
        WHILE *s <> c_DblQt
          IF *s = 0 THEN EXIT LOOP
          s++
        WEND
      END IF

      IF *s = c_LtBkt THEN
        s++
        s = BracketHandler(s, 1)
      END IF

      IF *s = c_LPar THEN
        s++
        s = BracketHandler(s, 2)
      END IF
      IF *s = c_Komma THEN *s = 1
      IF *s = 0 THEN EXIT LOOP
      s++
    WEND

    CASE 2
    WHILE *s <> c_RPar
      IF *s = c_DblQt THEN
        s++
        WHILE *s <> c_DblQt
          IF *s = 0 THEN EXIT LOOP
          s++
        WEND
      END IF

      IF *s = c_LtBkt THEN
        s++
        s = BracketHandler(s, 1)
      END IF

      IF *s = c_LPar THEN
        s++
        s = BracketHandler(s, 2)
      END IF
      IF *s = 0 THEN EXIT LOOP
      s++
    WEND
  END SELECT

  IF l = 0 THEN
    REPLACE CHR$(1) WITH "][" IN Src$
    FUNCTION = Src
  END IF
  FUNCTION = s
END FUNCTION ' BracketHandler



SUB Push(Z$)
  CaseStk$[++Pusher]= Z$
END SUB



SUB Pop(Z$)
  Z$ = CaseStk$[--Pusher]
END SUB ' Pop



SUB EmitEpilog
  IF Use_Wingui + MakeDLL + NoMain + EndOfProgram = 0 THEN
    FPRINT Outfile,"  while(1) {};   //  End of main program"
    'FPRINT Outfile,"  return 0;   //  End of main program"
    FPRINT Outfile,"}"
    FLUSH(Outfile)
    CALL BumpDown
  END IF
END SUB ' EmitEpilog




SUB EmitProlog
  IF Use_Library THEN
    FPRINT Outfile,"// BCXRTHEADER: INCLUDE FILES"
  ELSE
    FPRINT Outfile,"// *********************************************************************"
    FPRINT Outfile,"// Generated by Raptor Basic +, Reboot 2014-2015"
    FPRINT Outfile,"// Based on BCX32 - BASIC To C/C++ Translator (V) ", Version$
    FPRINT Outfile,"//                 BCX (c) 1999 - 2009 by Kevin Diggins"
    FPRINT Outfile,"// *********************************************************************"
  END IF
  FPRINT Outfile,"#include <ctype.h>"
  FPRINT Outfile,"#include <math.h>"
  FPRINT Outfile,"#include <stdio.h>"
  FPRINT Outfile,"#include <string.h>"
  FPRINT Outfile,"#include <stddef.h>"
  FPRINT Outfile,"#include <stdlib.h>"
  FPRINT Outfile,"#include <setjmp.h>"
  FPRINT Outfile,"#include <time.h>"
  FPRINT Outfile,"#include <stdarg.h>"
  FPRINT Outfile,"#include <process.h>"
  FPRINT Outfile,"#include "+DQ$+"rbasic.h"+DQ$+""
  FPRINT Outfile,"#include "+DQ$+"raptor.h"+DQ$+""
  FPRINT Outfile,"#include "+DQ$+"romassets.h"+DQ$+""
  FPRINT Outfile,""
  FPRINT Outfile,"#define UINT unsigned int"
  FPRINT Outfile,"#define WORD short"
  FPRINT Outfile,"#define BYTE char"
  FPRINT Outfile,"#define UWORD unsigned short"
  FPRINT Outfile,"#define UBYTE unsigned char"
  FPRINT Outfile,"//Lines inserted deliberately because of some bcx brokeness - fix at some point!"
  FPRINT Outfile,"//Lines inserted deliberately because of some bcx brokeness - fix at some point!"
  FPRINT Outfile,"//Lines inserted deliberately because of some bcx brokeness - fix at some point!"
  FPRINT Outfile,"#define peek(x) (*(volatile char *)(x))"
  FPRINT Outfile,"#define dpeek(x) (*(volatile short *)(x))"
  FPRINT Outfile,"#define lpeek(x) (*(volatile int *)(x))"

  IF Use_Library THEN
    FPRINT Outfile,"// END BCXRTHEADER\n\n"
    FPRINT Outfile,""
  ELSE
    FPRINT Outfile,"void basicmain()"
    '*****************************************************************************
    '         int main is conditionally removed later IN SUB AddProtos
    '*****************************************************************************
  END IF
  FLUSH (Outfile)
END SUB ' EmitProlog




SUB DeclareVariables
  DIM RAW i
  DIM RAW A
  DIM RAW P$
  'DIM RAW VAR$
  DIM RAW VarName$
  DIM RAW VarDim$
  DIM RAW Storage$

  OPEN FileOut$ FOR INPUT AS FP1
  OPEN "$t$e$m$p" FOR OUTPUT AS Outfile


  FOR A = 1 TO IncludeCount+4
    LINE INPUT FP1,Z$
    ' added condition that Use_Project is false or $NOWIN is ignored
    IF WinHeaders = FALSE AND Use_Project = FALSE THEN
      IF INSTR(Z$,"#include <windows.h>")   THEN Z$ = ""
      IF INSTR(Z$,"#include <windowsx.h>")  THEN Z$ = ""
      IF INSTR(Z$,"#include <commctrl.h>")  THEN Z$ = ""
      IF INSTR(Z$,"#include <mmsystem.h>")  THEN Z$ = ""
      IF INSTR(Z$,"#include <shellapi.h>")  THEN Z$ = ""
      IF INSTR(Z$,"#include <shlobj.h>")    THEN Z$ = ""
      IF INSTR(Z$,"#include <richedit.h>")  THEN Z$ = ""
      IF INSTR(Z$,"#include <wchar.h>")     THEN Z$ = ""
      IF INSTR(Z$,"#include <objbase.h>")   THEN Z$ = ""
      IF INSTR(Z$,"#include <ocidl.h>")     THEN Z$ = ""
      IF INSTR(Z$,"#include <winuser.h>")   THEN Z$ = ""
      IF INSTR(Z$,"#include <olectl.h>")    THEN Z$ = ""
      IF INSTR(Z$,"#include <oaidl.h>")     THEN Z$ = ""
      IF INSTR(Z$,"#include <ole2.h>")      THEN Z$ = ""
      IF INSTR(Z$,"#include <oleauto.h>")   THEN Z$ = ""
    END IF
    IF Z$ > "" THEN FPRINT Outfile,Z$
  NEXT


  OPEN cstFile$ FOR INPUT AS FP3

  IF LOF(cstFile$) > 0 THEN
    IF Use_Library THEN
      FPRINT Outfile,"// BCXRTHEADER: USER DEFINED CONSTANTS"
    ELSE
      FPRINT Outfile,""
      FPRINT Outfile,"// *************************************************"
      FPRINT Outfile,"//            " + $BCX_STR_USR_CONST
      FPRINT Outfile,"// *************************************************"
    END IF
    FPRINT Outfile,""
  END IF

  WHILE NOT EOF(FP3)
    LINE INPUT FP3,Z$
    FPRINT Outfile,LTRIM$(Z$)
  WEND

  IF Use_Library THEN FPRINT Outfile,"// END BCXRTHEADER\n\n"

  CLOSE FP3

  OPEN udtFile$ FOR INPUT AS FP3
  IF LOF(udtFile$)>0 THEN
    IF Use_Library THEN
      FPRINT Outfile,"// BCXRTHEADER: USER DEFINED TYPES AND UNIONS"
    ELSE
      FPRINT Outfile,""
      FPRINT Outfile,"// *************************************************"
      FPRINT Outfile,"//          " + $BCX_STR_USR_TYPES
      FPRINT Outfile,"// *************************************************"
    END IF
    WHILE NOT EOF(FP3)
      LINE INPUT FP3,Z$
      FPRINT Outfile,Scoot$,Z$
    WEND
    IF Use_Library THEN FPRINT FP3,"// END BCXRTHEADER\n\n"
  END IF
  CLOSE FP3

  IF HFileCnt > 0 THEN
    FPRINT Outfile,""
    FPRINT Outfile,"// *************************************************"
    FPRINT Outfile,"//                User Include Files"
    FPRINT Outfile,"// *************************************************"
    FPRINT Outfile,""
    A = 0
    WHILE A < HFileCnt
      FPRINT Outfile,HFiles$[A]
      A++
    WEND
  END IF

  IF Use_SingleFile = TRUE OR Use_Project = TRUE THEN

    IF Use_Console  OR _
      Use_Findfirst   OR _
      Use_Findnext    OR _
      Use_Gosub       OR _
      UseFlag         OR _
      Use_Date        OR _
      Use_Crlf        OR _
      Use_Inputbox    OR _
      Use_Infobox     OR _
      Use_Inputbuffer OR _
      Use_Dynacall     OR _
      Use_DynacallA  THEN

      IF Use_Library THEN
        FPRINT Outfile,"// BCXRTHEADER: SYSTEM VARIABLES"
      ELSE
        FPRINT Outfile,""
        FPRINT Outfile,"// *************************************************"
        FPRINT Outfile,"//                "+$BCX_STR_SYS_VARS
        FPRINT Outfile,"// *************************************************"
        FPRINT Outfile,""
      END IF
    END IF


    IF Use_Ldouble THEN
      FPRINT Outfile,"#define LDOUBLE long double"
    END IF

    IF Use_Idxqsort THEN
      FPRINT Outfile,"char*** pppStr;"
    END IF

    IF Use_Idxqsort OR Use_IdxqsortSt OR Use_PtrqsortSt THEN
      FPRINT Outfile,"int     Key;"
    END IF

    IF Use_IdxqsortSt THEN
      FPRINT Outfile,"char*   cmp1;"
      FPRINT Outfile,"int     StructSize;"
    END IF

    IF Use_PtrqsortSt THEN
      FPRINT Outfile,"int     OffSet;"
    END IF

    IF Use_Date THEN
      FPRINT Outfile,"char    Date [2048];"
    END IF

    IF Use_Inputbox THEN
      FPRINT Outfile,"char    BCX_INPUTBOX_VAL[2048];"
    END IF

    IF Use_NUL THEN
      IF Use_Project THEN FPRINT Outfile,"static ";
      FPRINT Outfile,"char    NUL [1]={0};     // Null"
    END IF

    IF Use_BEL THEN
      IF Use_Project THEN FPRINT Outfile,"static ";
      FPRINT Outfile,"char    BEL [2]={7,0};   // Bell"
    END IF

    IF Use_BS THEN
      IF Use_Project THEN FPRINT Outfile,"static ";
      FPRINT Outfile,"char    BS  [2]={8,0};   // Back Space"
    END IF

    IF Use_TAB THEN
      IF Use_Project THEN FPRINT Outfile,"static ";
      FPRINT Outfile,"char    TAB [2]={9,0};   // Horz Tab"
    END IF

    IF Use_LF THEN
      IF Use_Project THEN FPRINT Outfile,"static ";
      FPRINT Outfile,"char    LF  [2]={10,0};  // Line Feed"
    END IF

    IF Use_VT THEN
      IF Use_Project THEN FPRINT Outfile,"static ";
      FPRINT Outfile,"char    VT  [2]={11,0};  // Vert Tab"
    END IF

    IF Use_FF THEN
      IF Use_Project THEN FPRINT Outfile,"static ";
      FPRINT Outfile,"char    FF  [2]={12,0};  // Form Feed"
    END IF

    IF Use_CR THEN
      IF Use_Project THEN FPRINT Outfile,"static ";
      FPRINT Outfile,"char    CR  [2]={13,0};  // Carr Rtn"
    END IF

    IF Use_EOF THEN
      IF Use_Project THEN FPRINT Outfile,"static ";
      FPRINT Outfile,"char    EF  [2]={26,0};  // End-of-File"
    END IF

    IF Use_ESC THEN
      IF Use_Project THEN FPRINT Outfile,"static ";
      FPRINT Outfile,"char    ESC [2]={27,0};  // Escape"
    END IF

    IF Use_SPC THEN
      IF Use_Project THEN FPRINT Outfile,"static ";
      FPRINT Outfile,"char    SPC [2]={32,0};  // Space"
    END IF

    IF Use_DQ THEN
      IF Use_Project THEN FPRINT Outfile,"static ";
      FPRINT Outfile,"char    DQ  [2]={34,0};  // Double-Quote"
    END IF

    IF Use_DDQ THEN
      IF Use_Project THEN FPRINT Outfile,"static ";
      FPRINT Outfile,"char    DDQ [3]={34,34,0}; // Double-Double-Quote"
    END IF

    IF Use_Crlf THEN
      IF Use_Project THEN FPRINT Outfile,"static ";
      FPRINT Outfile,"char    CRLF[3]={13,10,0}; // Carr Rtn & Line Feed"
    END IF

    IF Use_Console THEN
      FPRINT Outfile,"COORD   cursor;"
      FPRINT Outfile,"HANDLE  hConsole;"
      FPRINT Outfile,"int     color_fg = 7;"
      FPRINT Outfile,"int     color_bg = 0;"
    END IF

    IF Use_Scan THEN
      FPRINT Outfile,"int     ScanError;"
    END IF

    IF Use_Inputbuffer = TRUE THEN
      FPRINT Outfile,"char    InputBuffer[1048576];"
    END IF

    IF Use_Hook THEN
      FPRINT Outfile,"HHOOK   CmDlgHook;"
    END IF

    IF Use_Findfirst OR Use_Findnext THEN
      FPRINT Outfile,"HANDLE FileHandle;"
      FPRINT Outfile,"WIN32_FIND_DATA FindData;"
    END IF

    IF Use_Gosub THEN
      FPRINT Outfile,"jmp_buf GosubStack[32];"
      FPRINT Outfile,"int     GosubNdx;"
    END IF

    IF Use_Dynacall OR Use_DynacallA THEN
      FPRINT Outfile,"HINSTANCE BCX_DllStore[256];"
    END IF
    IF Use_Library THEN FPRINT Outfile,"// END BCXRTHEADER\n\n"
  END IF

  IF GlobalVarCnt THEN
    IF Use_Library THEN
      FPRINT Outfile,"// BCXRTHEADER: USER GLOBAL VARIABLES"
    ELSE
      FPRINT Outfile,""
      FPRINT Outfile,"// *************************************************"
      FPRINT Outfile,"//            " + $BCX_STR_USR_VARS
      FPRINT Outfile,"// *************************************************"
      FPRINT Outfile,""
    END IF
  END IF

  '*************************************
  'Add Declared Dll variables
  '*************************************

  IF DllCnt THEN
    FOR INTEGER i = 1 TO DllCnt
      FPRINT Outfile, "static BCXFPROT", LTRIM$(STR$(i)), " ", EXTRACT$(DllDecl$[i],"="), ";"
    NEXT
  END IF

  '*************************************
  'First we declare the simple Variables
  '*************************************

  FOR i = 1 TO GlobalVarCnt
    IF GlobalVars[i].VarEmitFlag THEN ITERATE
    IF "" = GlobalVars[i].VarDim$ AND GlobalVars[i].VarCondLevel = 0 THEN
      P$ = ""
      IF GlobalVars[i].VarPntr THEN P$ = STRING$(GlobalVars[i].VarPntr,42)
      A = GlobalVars[i].VarType
      IF GlobalVars[i].VarSF THEN
        VarName$ = "(*" + GlobalVars[i].VarName$ + ")"
      ELSE
        VarName$ = GlobalVars[i].VarName$
      END IF

      Storage$ = VarStorage$[GlobalVars[i].VarExtn]
      VarDim$ = GlobalVars[i].VarDim$

      CALL PrintGlobal(A, i, Storage$, P$, VarName$, VarDim$)
    END IF
  NEXT

  '   Next, we declare the Arrays

  FOR i = 1 TO GlobalVarCnt
    IF GlobalVars[i].VarEmitFlag THEN ITERATE
    IF "" <> GlobalVars[i].VarDim$ AND GlobalVars[i].VarCondLevel = 0 THEN
      IF INSTR(GlobalVars[i].VarDim,"{") = 0 THEN     ' do uninitialized global arrays
        P$ = ""
        IF GlobalVars[i].VarPntr THEN P$ = STRING$(GlobalVars[i].VarPntr,42)
        A = GlobalVars[i].VarType
        IF GlobalVars[i].VarSF THEN
          VarName$ = "(*" + GlobalVars[i].VarName$ + EXTRACT$(GlobalVars[i].VarDim,"(") + ")"
          VarDim$ = MID$(GlobalVars[i].VarDim, INSTR(GlobalVars[i].VarDim,"("))
        ELSE
          VarName$ = GlobalVars[i].VarName$
          VarDim$ = GlobalVars[i].VarDim$
        END IF
        Storage$ = VarStorage$[GlobalVars[i].VarExtn]

        CALL PrintGlobal(A, i, Storage$, P$, VarName$, VarDim$)
      END IF
    END IF
  NEXT

  DIM RAW LastDef$
  DIM RAW LastLevel

  LastDef$ = ""
  LastLevel = 1

  FOR i = 1 TO GlobalVarCnt
    IF GlobalVars[i].VarEmitFlag THEN ITERATE
    IF GlobalVars[i].VarCondLevel THEN
      IF LastDef$ = "" THEN
        LastDef$ = GlobalVars[i].VarCondDef$
        LastLevel = GlobalVars[i].VarCondLevel
        FPRINT Outfile,LastDef$
      END IF
      IF LastDef$ <> GlobalVars[i].VarCondDef$ THEN
        IF GlobalVars[i].VarCondDef$ = "#else" THEN
          WHILE LastLevel > GlobalVars[i].VarCondLevel
            FPRINT Outfile,"#endif"
            LastLevel--
          WEND
          FPRINT Outfile,"#else"
          LastDef$ = GlobalVars[i].VarCondDef$
        ELSE
          WHILE LastLevel => GlobalVars[i].VarCondLevel
            FPRINT Outfile,"#endif"
            LastLevel--
          WEND
          LastDef$ = GlobalVars[i].VarCondDef$
          LastLevel = GlobalVars[i].VarCondLevel
          FPRINT Outfile,LastDef$
        END IF
      END IF
      P$ = ""
      IF GlobalVars[i].VarPntr THEN P$ = STRING$(GlobalVars[i].VarPntr,42)
      A = GlobalVars[i].VarType
      IF GlobalVars[i].VarSF THEN
        VarName$ = "(*" + GlobalVars[i].VarName$ + ")"
      ELSE
        VarName$ = GlobalVars[i].VarName$
      END IF
      VarDim$ = GlobalVars[i].VarDim
      Storage$ = VarStorage$[GlobalVars[i].VarExtn]

      CALL PrintGlobal(A, i, Storage$, P$, VarName$, VarDim$)

    END IF
  NEXT

  IF *LastDef$ THEN
    WHILE LastLevel
      FPRINT Outfile,"#endif"
      LastLevel--
    WEND
  END IF
  FPRINT Outfile,""
  IF Use_Library THEN FPRINT Outfile,"// END BCXRTHEADER\n\n"

  '********************************
  ' Read In The Data Statement File
  '********************************

  OPEN datFile$ FOR INPUT AS FP5
  IF LOF(datFile$) > 0 THEN
    FPRINT Outfile,""
    FPRINT Outfile,"// *************************************************"
    FPRINT Outfile,"//              User Data Statements"
    FPRINT Outfile,"// *************************************************"
    FPRINT Outfile,""
    FPRINT Outfile,"char * DATA [] ="
    FPRINT Outfile,"{"
    WHILE NOT EOF(FP5)
      LINE INPUT FP5,Z$
      FPRINT Outfile,Z$
    WEND
    FPRINT Outfile,"};"
  END IF
  CLOSE FP5

  WHILE NOT EOF(FP1)
    LINE INPUT FP1,Z$
    FPRINT Outfile,Z$
  WEND

  CALL CloseAll
  KILL FileOut$
  RENAME "$t$e$m$p", FileOut$
END SUB  'DeclareVariables






SUB PreParse(Arg$)
  '********************************************
  ' Stk$[) AND Ndx must be declared GLOBAL
  ' and are re-initialized WITH each invocation
  '*********************************************
  DIM RAW szChar$
  DIM RAW Strlit$
  DIM RAW Anyword$
  DIM RAW Counter
  DIM RAW TT
  DIM RAW Tmp
  DIM RAW Arglen
  DIM RAW A
  DIM RAW j
  '********************************************************************
  Anyword$ = "" ' This is the only local that needs to be initialized
  '********************************************************************
  Ndx = 0
  Arg$ = RTRIM$(Arg$)
  IF Arg$ = "" THEN
    Ndx = 0
    EXIT SUB
  END IF
  '********************
  FOR Tmp = 0 TO 15
    Stk$[Tmp] = ""
  NEXT
  '********************
  Arglen = LEN(Arg$)
  Counter = 0
  WHILE Counter <= Arglen
    IF Ndx => 4096 THEN Abort("Overflowed Parse Stack")
    Counter++
    szChar[0] =Arg[Counter-1]              'This eliminates using MID$
    szChar[1] = 0                          'Remember to null terminate
    TT = ASC(szChar$)
    '***************************************
    SELECT CASE TT
      '***************************************
      CASE 34   'Identify string literals
      '***************************************
      Strlit$ = szChar$
      szChar$ = ""
      DO
        IF szChar$ = DQ$  THEN EXIT LOOP
        Counter++
        IF Counter = Arglen THEN
          szChar[0] = Arg[Counter-1]        'This eliminates using MID$
          szChar[1] = 0                     'Remember to null terminate
          CONCAT (Strlit$,szChar$)
          IF szChar$ <> DQ$ THEN
            CONCAT (Strlit$,DQ$)            'Allow unquoted END of string
          END IF
          EXIT LOOP
        END IF
        szChar[0] = Arg[Counter-1]          'This eliminates using MID$
        szChar[1] = 0                       'Remember to null terminate
        CONCAT (Strlit$,szChar$)
      LOOP
      Ndx++
      Stk$[Ndx]= Strlit$
      '***************
      CASE 32 ' SPACE
      '***************
      IF Anyword[0] THEN
        Ndx++
        Stk$[Ndx] = Anyword$
        Anyword$ = ""
      END IF
      ' *****************************************************************
      '    =   &  (  )  [  ]  '  ,  +  -  *  /  ?  <  >  ;   |  :  ^
      CASE 61,38,40,41,91,93,39,44,43,45,42,47,63,60,62,59,124,58,94
      '******************************************************************
      IF LEN(Anyword$) THEN
        Ndx++
        Stk$[Ndx]= Anyword$
        Anyword$ = ""
      END IF
      Ndx++
      Stk$[Ndx]= szChar$
      '*****************
      CASE ELSE
      '*****************
      A=LEN(Anyword$)
      Anyword[A]   = Arg[Counter-1]        'This eliminates using MID$
      Anyword[A+1] = 0                     'Remember to null terminate
      '*****************
    END SELECT
    '*****************
  WEND
  IF LEN(Anyword$) THEN
    Ndx++
    Stk$[Ndx]= Anyword$
  END IF
  FOR j = 1 TO Ndx
    SELECT CASE LCASE$(Stk$[j])
      CASE "bor"
      Stk$[j] = "|"
      CASE "band"
      Stk$[j] = "&"
    END SELECT
  NEXT
END SUB ' PreParse




FUNCTION GetNumArgs OPTIONAL(Strt, NdxPos AS INTEGER PTR=NULL)
  DIM RAW CountR = 0  '() counter
  DIM RAW CountS = 0  '[] counter
  DIM RAW i           'loop counter
  DIM RAW j = 0       'comma counter
  DIM RAW k = 1       'function end flag
  FOR i = Strt TO Ndx
    IF Stk$[i] = "(" THEN
      CountR++
      k++
    ELSEIF Stk$[i] = ")" THEN
      CountR--
      k--
      IF k = 0 THEN EXIT FOR
    ELSEIF Stk$[i] = "[" THEN
      CountS++
    ELSEIF Stk$[i] = "]" THEN
      CountS--
    ELSEIF Stk$[i] = "," AND CountR = 0 AND CountS = 0 THEN
      j++
      IF NdxPos THEN *NdxPos = i
    END IF
  NEXT
  FUNCTION = j   'No. of commas = No. of args
END FUNCTION ' GetNumArgs





SUB GetVarCode(varcode AS VARCODE PTR)
  DIM RAW CB$, PT$, PTH$, VAR$, vn, RF$

  IF varcode->Method% = mt_Opts3 THEN
    varcode->Proto$ = varcode->Proto$  +  varcode->Token$
    IF varcode->Token$ = "," THEN
      varcode->Header$ = varcode->Header$ + varcode->Token$
    END IF
    EXIT SUB
  END IF
  IF varcode->Method% = mt_FuncSubx1 THEN
    varcode->Proto$ = varcode->Proto$  +  varcode->AsToken$ + "(*)("
    varcode->Header$ = varcode->Header$ + varcode->AsToken$  + " (*" + varcode->Token$ + ")("
    EXIT SUB
  END IF
  IF varcode->Method% = mt_FuncSubx2 THEN
    varcode->Proto$ = varcode->Proto$  +  varcode->AsToken$
    varcode->Header$ = varcode->Header$ + varcode->AsToken$ + " " + varcode->Token$
    EXIT SUB
  END IF
  IF IsCallBack THEN
    CB$ = "CALLBACK "
  ELSE
    CB$ = ""
  END IF

  IF INCHR(varcode->Token$,"*") OR INCHR(varcode->AsToken$,"*") OR varcode->IsPtrFlag THEN
    RemoveAll(varcode->Token$, "*")
    RemoveAll(varcode->AsToken$, "*")
    PT$  = STRING$(varcode->IsPtrFlag, ASC("*")) + " "
    PTH$ = PT$
  ELSE
    PTH$ = " "
    PT$ = ""
  END IF

  IF INCHR(varcode->Token$,"&") THEN
    RF$ = " &"
  ELSE
    RF$ = ""
  END IF
  vn = varcode->VarNo%
  VAR$ = GetVarTypeName$(vn)

  SELECT CASE vn

    '************************************************************************
    CASE vt_STRVAR
    '************************************************************************

    SELECT CASE varcode->Method%

      CASE mt_ProcessSetCommand
      varcode->StaticOut$ = "static char   " + Clean$(varcode->Token$)

      CASE mt_FuncSubDecC_Dec
      varcode->Functype$ = "char * " + CB$

      CASE mt_FuncSubDecC_Dec2
      IF NOT INCHR(varcode->Token$, "[") THEN
        varcode->Header$ = varcode->Header$  +  "char *" + Clean$(varcode->Token$)  +  ", "
        varcode->Proto$  = varcode->Proto$   +  "char *, "
      ELSE
        varcode->Header$ = varcode->Header$  +  "char " + REMOVE$(Clean$(varcode->Token$), "*") + ", "
        varcode->Proto$  = varcode->Proto$   +  "char [][2048], "
      END IF

      CASE mt_Opts
      varcode->Functype$ = "char *"

      CASE mt_Opts2
      varcode->Header$ = varcode->Header$  + "char * "  +  Clean$(varcode->Token$)
      varcode->Proto$  = varcode->Proto$   + "char* "

      CASE mt_OverLoad
      varcode->Functype$ = "char *"

      CASE mt_OverLoad2
      varcode->Header$ = varcode->Header$ + "char *" + Clean$(varcode->Token$) + ", "
    END SELECT

    '************************************************************************
    CASE vt_BOOL,vt_BYTE,vt_COLORREF,vt_DOUBLE,vt_DWORD,vt_FARPROC,vt_HDC, _
    vt_HANDLE,vt_HINSTANCE,vt_HWND,vt_INTEGER,vt_LONG,vt_LPBYTE,vt_LRESULT, _
    vt_SHORT,vt_SINGLE,vt_UINT,vt_ULONG,vt_USHORT,vt_VARIANT,vt_VOID,vt_LDOUBLE
    '************************************************************************

    SELECT CASE varcode->Method%

      CASE mt_ProcessSetCommand
      varcode->StaticOut$ = "static " + VAR$ + " " + Clean$(varcode->Token$)

      CASE mt_FuncSubDecC_Dec
      varcode->Functype$ = VAR$ + PTH$ + CB$

      CASE mt_FuncSubDecC_Dec2
      varcode->Header$ = varcode->Header$  +  VAR$ + PTH$ + Clean$(varcode->Token$)  +  ", "
      varcode->Proto$  = varcode->Proto$   +  VAR$ + RF$ + PT$ + ", "

      CASE mt_Opts
      varcode->Functype$ = VAR$ + PTH$

      CASE mt_Opts2
      varcode->Header$ = varcode->Header$  +  VAR$ + PTH$ + Clean$(varcode->Token$)
      varcode->Proto$ = varcode->Proto$   +  VAR$ + RF$ + PT$

      CASE mt_OverLoad
      varcode->Functype$ = VAR$ + " "

      CASE mt_OverLoad2
      varcode->Header$ = varcode->Header$ + VAR$ + PTH$ + Clean$(varcode->Token$) + ", "
    END SELECT

    '************************************************************************
    CASE vt_FILEPTR, vt_CHAR
    '************************************************************************

    SELECT CASE varcode->Method%

      CASE mt_FuncSubDecC_Dec
      varcode->Functype$ = VAR$ + PTH$ + CB$

      CASE mt_FuncSubDecC_Dec2
      varcode->Header$ = varcode->Header$  +  VAR$ + PTH$ + Clean$(varcode->Token$)  +  ", "
      varcode->Proto$  = varcode->Proto$   +  VAR$ + PT$ + ", "

      CASE mt_Opts
      varcode->Functype$ = VAR$ + PTH$

      CASE mt_Opts2
      varcode->Header$ = varcode->Header$  +  VAR$ + PTH$  +  Clean$(varcode->Token$)
      varcode->Proto$  = varcode->Proto$   +  VAR$ + PT$

      CASE mt_OverLoad
      varcode->Functype$ = VAR$ + " "

      CASE mt_OverLoad2
      varcode->Header$ = varcode->Header$ + VAR$ + PTH$ + Clean$(varcode->Token$) + ", "
    END SELECT

    '************************************************************************
    CASE vt_UDT, vt_STRUCT, vt_UNION
    '************************************************************************

    SELECT CASE varcode->Method%
      CASE mt_ProcessSetCommand
      IF vn = vt_UNION THEN
        varcode->StaticOut$ = "static union  " + Clean$(varcode->Token$)
      ELSE
        varcode->StaticOut$ = "static struct _" + Clean$(varcode->Token$) + " "
      END IF

      CASE mt_FuncSubDecC_Dec
      varcode->Functype$ = varcode->AsToken$ + PTH$ + CB$

      CASE mt_FuncSubDecC_Dec2
      varcode->Header$ = varcode->Header$  +  varcode->AsToken$ + PTH$ +  Clean$(varcode->Token$) + ", "
      varcode->Proto$  = varcode->Proto$   +  varcode->AsToken$ + RF$ + PT$ + ", "

      CASE mt_Opts
      varcode->Functype$ = varcode->AsToken$ + PTH$

      CASE mt_Opts2
      varcode->Header$ = varcode->Header$ + Clean$(varcode->AsToken$) + PTH$ + " " + Clean$(varcode->Token$)
      varcode->Proto$ = varcode->Proto$   + Clean$(varcode->AsToken$) + RF$ + PT$

      CASE mt_OverLoad
      varcode->Functype$ = VAR$ + " "

      CASE mt_OverLoad2
      varcode->Header$ = varcode->Header$ + varcode->AsToken$ + PTH$ + Clean$(varcode->Token$) + ", "
    END SELECT

    '************************************************************************
    CASE ELSE
    '************************************************************************

    SELECT CASE varcode->Method%
      CASE mt_FuncSubDecC_Dec
      varcode->Functype$ = varcode->AsToken$ + PTH$ + CB$

      CASE mt_FuncSubDecC_Dec2
      varcode->Header$ = varcode->Header$  +  varcode->AsToken$ + PTH$ +  Clean$(varcode->Token$) + ", "
      varcode->Proto$ = varcode->Proto$    +  varcode->AsToken$ + RF$ + PT$ + ", "

      CASE mt_Opts
      varcode->Functype$ = varcode->AsToken$ + PTH$

      CASE mt_Opts2
      varcode->Header$ = varcode->Header$ + Clean$(varcode->AsToken$) + " " + Clean$(varcode->Token$)
      varcode->Proto$  = varcode->Proto$  + Clean$(varcode->AsToken$)

    END SELECT
  END SELECT
END SUB ' GetVarCode




SUB AddProtos
  DIM RAW SaveMain$
  DIM RAW ZZ$
  DIM RAW A

  SaveMain$  = ""

  OPEN FileOut$ FOR INPUT  AS FP1
  OPEN "$t$e$m$p" FOR OUTPUT AS Outfile

  WHILE NOT EOF(FP1)
    LINE INPUT FP1,ZZ$
    'IF INSTR(ZZ$,"int main") THEN
    IF INSTR(ZZ$,"void basicmain") THEN
      SaveMain$ = ZZ$
      EXIT LOOP
    END IF

    FPRINT Outfile, ZZ$
  WEND

  IF Use_Sysmacros OR Use_Wingui THEN
    IF Use_Library THEN
      FPRINT Outfile,"// BCXRTHEADER: STANDARD MACROS"
    ELSE
      FPRINT Outfile,""
      FPRINT Outfile,"// *************************************************"
      FPRINT Outfile,"//               " + $BCX_STR_STD_MACROS
      FPRINT Outfile,"// *************************************************"
      FPRINT Outfile,""
    END IF
  END IF

  IF Use_Wingui OR Use_Library THEN
    IF NOT Use_Project THEN
      FPRINT Outfile,"#define DefaultFont ((BcxFont==0)?GetStockObject(DEFAULT_GUI_FONT):BcxFont)"
    ELSE
      FPRINT Outfile,"#ifndef __BCXFONT_DEFINED__"
      FPRINT Outfile,"#define __BCXFONT_DEFINED__"
      FPRINT Outfile,"#define DefaultFont ((BcxFont==0)?GetStockObject(DEFAULT_GUI_FONT):BcxFont)"
      FPRINT Outfile,"#endif"
    END IF
  END IF

  IF Use_Sysmacros THEN

    IF Use_Cbool THEN
      FPRINT Outfile,"#define CBOOL(A)(A!=0)?1:0"
    END IF

    IF Use_Isptr THEN
      FPRINT Outfile,"#define IsPtr(a)((DWORD)a)"
    END IF

    IF Use_Band THEN
      FPRINT Outfile,"#define BAND &"
    END IF

    IF Use_Bor THEN
      FPRINT Outfile,"#define BOR |"
    END IF

    IF Use_Bnot THEN
      FPRINT Outfile,"#define BNOT ~(int)"
    END IF

    IF Use_Inp THEN
      FPRINT Outfile,"#define Inp(port)_inp(port)"
    END IF

    IF Use_Inpw THEN
      FPRINT Outfile,"#define Inpw(port)_inpw(port)"
    END IF

    IF Use_Outp THEN
      FPRINT Outfile,"#define Outp(port,value)_outp(port,value)"
    END IF

    IF Use_Outpw THEN
      FPRINT Outfile,"#define Outpw(port,value)_outpw(port,value)"
    END IF

    IF Use_Ubound THEN
      FPRINT Outfile,"#define ubound(T)(sizeof((T))/sizeof((T[0]))-1)"
    END IF

    IF Use_Clear THEN
      FPRINT Outfile,"#define Clear(arg)memset(&arg,0,sizeof(arg))"
    END IF

    IF Use_Imod THEN
      FPRINT Outfile,"#define imod(a,b)((a)%(b))"
    END IF

    IF Use_Refresh THEN
      FPRINT Outfile,"#define Refresh(A) RedrawWindow(A,NULL,NULL,RDW_ERASE|RDW_INVALIDATE|RDW_ALLCHILDREN|RDW_UPDATENOW);"
    END IF

    IF Use_ShowModal THEN
      FPRINT Outfile,"#define ShowModal(Window)EnableWindow(GetWindow(Window,GW_OWNER),FALSE);Show(Window);"
    END IF

    IF Use_EndModal THEN
      FPRINT Outfile,"#define EndModal(Window)EnableWindow(GetWindow(Window,GW_OWNER),TRUE);DestroyWindow(Window);"
    END IF

    IF Use_Show THEN
      FPRINT Outfile,"#define Show(Window)RedrawWindow(Window,0,0,0);ShowWindow(Window,SW_SHOW);"
    END IF

    IF Use_Hide THEN
      FPRINT Outfile,"#define Hide(Window)ShowWindow(Window,SW_HIDE)"
    END IF

    IF Use_Get THEN
      FPRINT Outfile,"#define GET(A,B,C)fread(B,1,C,A)"
    END IF

    IF Use_Put THEN
      FPRINT Outfile,"#define PUT(A,B,C)fwrite(B,1,C,A)"
    END IF

    IF Use_Strptr THEN
      FPRINT Outfile,"#define STRPTR(A)((char*)&(A))"
    END IF

    IF Use_Val THEN
      FPRINT Outfile,"#define VAL(a)(double)atof(a)"
    END IF

    IF Use_Vall THEN
      FPRINT Outfile,"#if defined( __LCC__ ) || defined( __POCC__ )"
      FPRINT Outfile,"  #define VALL(a) (long double)strtold(a,(char**)NULL)"
      FPRINT Outfile,"#elif defined( __BCPLUSPLUS__ )"
      FPRINT Outfile,"  #define VALL(a) (long double)_strtold(a,(char**)NULL)"
      FPRINT Outfile,"#else"
      FPRINT Outfile,"  #define VALL(a) (long double)strtod(a,(char**)NULL)"
      FPRINT Outfile,"#endif"
    END IF

    IF Use_Getattr THEN
      FPRINT Outfile,"#define GETATTR(a)(DWORD)GetFileAttributes(a)"
    END IF

    IF Use_Fint THEN
      FPRINT Outfile,"#define FINT(a)floor(a)"
    END IF

    IF Use_Frac THEN
      FPRINT Outfile,"#define FRAC(a)(double)(a-FIX(a))"
      Use_Fix = TRUE
    END IF

    IF Use_Fracl THEN
      FPRINT Outfile,"#define FRACL(a)(long double)(a-FIX(a))"
      Use_Fix = TRUE
    END IF

    IF Use_Fix THEN
      FPRINT Outfile,"#define FIX(a)(int)((a))"
    END IF

    IF Use_Csng THEN
      FPRINT Outfile,"#define CSNG(a)((float)(a))"
    END IF

    IF Use_Cdbl THEN
      FPRINT Outfile,"#define CDBL(a)((double)(a))"
    END IF

    IF Use_Cldbl THEN
      FPRINT Outfile,"#define CLDBL(a)((long double)(a))"
    END IF

    FPRINT Outfile,""
    IF Use_Library THEN FPRINT Outfile,"// END BCXRTHEADER\n\n"
  END IF

  IF Use_Project = FALSE THEN

    IF UseFlag OR Use_Console OR Use_Proto THEN
      IF Use_Library THEN
        FPRINT Outfile,"// BCXRTHEADER: STANDARD PROTOTYPES"
      ELSE
        FPRINT Outfile,""
        FPRINT Outfile,"// *************************************************"
        FPRINT Outfile,"//               " + $BCX_STR_STD_PROTOS
        FPRINT Outfile,"// *************************************************"
        FPRINT Outfile,""
      END IF
    END IF

    IF Use_Acosh THEN
      FPRINT Outfile,"#if !defined( __WATCOM_CPLUSPLUS__ )"
      FPRINT Outfile,"double  acosh(double);"
      FPRINT Outfile,"#endif"
    END IF

    IF Use_Asinh THEN
      FPRINT Outfile,"#if !defined( __WATCOM_CPLUSPLUS__ )"
      FPRINT Outfile,"double  asinh(double);"
      FPRINT Outfile,"#endif"
    END IF

    IF Use_Atanh THEN
      FPRINT Outfile,"#if !defined( __WATCOM_CPLUSPLUS__ )"
      FPRINT Outfile,"double  atanh(double);"
      FPRINT Outfile,"#endif"
    END IF

    IF Use_Clng THEN
      FPRINT Outfile,"long    CLNG(double);"
    END IF

    IF Use_Cint THEN
      FPRINT Outfile,"int     Cint(double);"
    END IF

    IF Use_StartupCode THEN
      FPRINT Outfile,"int     BCX_StartupCode_(void);"
    END IF

    IF Use_ExitCode THEN
      FPRINT Outfile,"int     BCX_ExitCode_(void);"
    END IF

    IF Use_Str_Cmp THEN
      FPRINT Outfile,"int     str_cmp(char*, char*);"
    END IF

    IF Use_AppActivate THEN
      FPRINT Outfile,"int     AppActivate (char *);"
    END IF

    IF Use_Inputbox OR Use_Infobox THEN
      FPRINT Outfile,"LPWORD  lpwAlign(LPWORD);"
    END IF

    IF Use_VBS THEN
      FPRINT Outfile,"HRESULT VBS_RUN_SCRIPT (char*);"
      FPRINT Outfile,"HRESULT VBS_ADDCODE    (char*);"
      FPRINT Outfile,"double  VBS_EVAL_NUM   (char*);"
      FPRINT Outfile,"char*   VBS_EVAL_STR   (char*);"
      FPRINT Outfile,"BOOL    VBS_START      (void);"
      FPRINT Outfile,"void    VBS_STOP       (void);"
      FPRINT Outfile,"void    VBS_RESET      (void);"
      FPRINT Outfile,"char*   VBS_ERROR      (void);"
    END IF

    IF Use_QBColor THEN
      FPRINT Outfile,"int     qbcolor (int);"
    END IF

    IF Use_Color THEN
      FPRINT Outfile,"void    color (int,int);"
    END IF

    IF Use_Panel THEN
      FPRINT Outfile,"void    panel (int,int,int,int,int,int,int,int);"
    END IF

    IF Use_Locate THEN
      FPRINT Outfile,"void    locate (int,int,int=1,int=12);"
    END IF

    IF Use_Pos THEN
      FPRINT Outfile,"int     Pos (void);"
    END IF

    IF Use_Csrlin THEN
      FPRINT Outfile,"int     Csrlin (void);"
    END IF

    IF Use_Doevents THEN
      FPRINT Outfile,"void    DoEvents(void);"
    END IF

    IF Use_Randomize THEN
      FPRINT Outfile,"void    randomize (unsigned int);"
    END IF

    IF Use_Midstr THEN
      FPRINT Outfile,"void    midstr (char*, int, int, char *);"
    END IF

    IF Use_Swap THEN
      FPRINT Outfile,"void    swap (byte*,byte*,int);"
    END IF

    IF UseFlag THEN
      FPRINT Outfile,"char*   BCX_TmpStr(size_t);"
    END IF

    IF Use_sziif THEN
      FPRINT Outfile,"char*   sziif (BOOL,char*,char*);"
    END IF

    IF Use_Using THEN
      FPRINT Outfile,"char*   Using (char*,double);"
    END IF

    IF Use_TempFileName THEN
      FPRINT Outfile,"char*   TempFileName (char*,char*);"
    END IF

    IF Use_AppExePath THEN
      FPRINT Outfile,"char*   AppExePath (void);"
    END IF

    IF Use_AppExeName THEN
      FPRINT Outfile,"char*   AppExeName (void);"
    END IF

    IF Use_Lcase THEN
      FPRINT Outfile,"char*   lcase (char*);"
    END IF

    IF Use_Ucase THEN
      FPRINT Outfile,"char*   ucase (char*);"
    END IF

    IF Use_Mid THEN
      FPRINT Outfile,"char*   mid (char*, int, int=-1);"
    END IF

    IF Use_Ltrim THEN
      FPRINT Outfile,"char*   ltrim (char*,char=32);"
    END IF

    IF Use_Rtrim THEN
      FPRINT Outfile,"char*   rtrim (char*,char=32);"
    END IF

    IF Use_Trim THEN
      FPRINT Outfile,"char*   trim (char*);"
    END IF

    IF Use_Strim THEN
      FPRINT Outfile,"char*   strim   (char*);"
    END IF

    IF Use_Left THEN
      FPRINT Outfile,"char*   left (char*,int);"
    END IF

    IF Use_Right THEN
      FPRINT Outfile,"char*   right (char*,int);"
    END IF

    IF Use_Rpad THEN
      FPRINT Outfile,"char*   rpad (char*,int,int=32);"
    END IF

    IF Use_Lpad THEN
      FPRINT Outfile,"char*   lpad (char*,int,int=32);"
    END IF

    IF Use_String THEN
      FPRINT Outfile,"char*   string (int,int);"
    END IF

    IF Use_Repeat THEN
      FPRINT Outfile,"char*   repeat (int,char*);"
    END IF

    IF Use_Extract THEN
      FPRINT Outfile,"char*   extract (char*,char*);"
    END IF

    IF Use_Remain THEN
      FPRINT Outfile,"char*   remain (char*,char*);"
    END IF

    IF Use_Reverse THEN
      FPRINT Outfile,"char*   reverse (char*);"
    END IF

    IF Use_Mcase THEN
      FPRINT Outfile,"char*   mcase (char*);"
    END IF

    IF Use_Replace THEN
      FPRINT Outfile,"char*   replace (char*,char*,char*);"
    END IF

    IF Use_iReplace THEN
      FPRINT Outfile,"char*   iReplace (char*,char*,char*);"
    END IF

    IF Use_Space THEN
      FPRINT Outfile,"char*   space (int a);"
    END IF

    IF Use_Str THEN
      FPRINT Outfile,"char*   str (float);"
    END IF

    IF Use_Strl THEN
      FPRINT Outfile,"char*   strl (float);"
    END IF

    IF Use_Findfirst THEN
      FPRINT Outfile,"char*   findfirst (char*);"
    END IF

    IF Use_Findnext THEN
      FPRINT Outfile,"char*   findnext (void);"
    END IF

    IF Use_Environ THEN
      FPRINT Outfile,"char*   Environ (char*);"
    END IF

    IF Use_Boolstr THEN
      FPRINT Outfile,"char*   BoolStr (int);"
    END IF

    IF Use_Hex THEN
      FPRINT Outfile,"char*   hex (int);"
    END IF

    IF Use_Bin THEN
      FPRINT Outfile,"char*   Bin (int);"
    END IF

    IF Use_Oct THEN
      FPRINT Outfile,"char*   oct (int);"
    END IF

    IF Use_Now THEN
      FPRINT Outfile,"char*   now (void);"
    END IF

    IF Use_SearchPath THEN
      FPRINT Outfile,"char*   SEARCHPATH (char *);"
    END IF

    IF Use_Strtoken THEN
      FPRINT Outfile,"char*   StrToken (char*,char*,int);"
    END IF

    IF Use_FileLocked THEN
      FPRINT Outfile,"int    FileLocked (char*);"
    END IF

    IF Use_FillArray THEN
      FPRINT Outfile,"int     fillarray (char *, int, int, void *);"
    END IF

    IF Use_Remove THEN
      FPRINT Outfile,"char*   RemoveStr (char*,char*);"
    END IF

    IF Use_IRemove THEN
      FPRINT Outfile,"char*   IRemoveStr (char*,char*);"
    END IF

    IF Use_Hook THEN
      FPRINT Outfile,"LRESULT CALLBACK SBProc (int, WPARAM, LPARAM);"
    END IF


    IF Use_Join THEN
      FPRINT Outfile,"char*   join (int, ... );"
    END IF

    IF Use_Enclose THEN
      FPRINT Outfile,"char*   enc (char*, int=0, int=0);"
    END IF

    IF Use_Chr THEN
      FPRINT Outfile,"char*   chr";
      FPRINT Outfile,"(int,int=0,int=0,int=0,int=0,int=0,int=0,int=0,int=0,int=0);"
    END IF

    IF Use_VChr THEN
      FPRINT Outfile,"char*   vchr (int,...);"
    END IF

    IF Use_PeekStr THEN
      FPRINT Outfile,"char*   peekstr (LPVOID,int);"
    END IF


    IF Use_Asc THEN
      IF NOT Use_Library THEN FPRINT Outfile,"int     asc (char *,int=0);"
    END IF

    IF Use_Instrrev THEN
      FPRINT Outfile,"int     InstrRev (char*,char*,int=0,int=0);"
    END IF

    IF Use_FirstInstance THEN
      FPRINT Outfile,"BOOL    FindFirstInstance (char*);"
    END IF

    IF Use_Instr THEN
      FPRINT Outfile,"int     instr(char*,char*,int=0,int=0);"
    END IF

    IF UseLCaseTbl THEN
      FPRINT Outfile,"char    *MakeLCaseTbl(void);"
    END IF

    IF Use_Stristr THEN
      FPRINT Outfile,"char    *_stristr_(char*,char*);"
    END IF

    IF Use_StrStr THEN
      FPRINT Outfile,"char    *_strstr_(char*,char*);"
    END IF

    IF Use_Verify THEN
      FPRINT Outfile,"int     Verify (char *, char *);"
      FPRINT Outfile,"int     VerifyInstr(char*,char*,int=0);"
    END IF

    IF Use_Retain THEN
      FPRINT Outfile,"char*   Retain (char*,char *);"
    END IF

    IF Use_LoadFile THEN
      FPRINT Outfile,"char*   LoadFile (char*);"
    END IF

    IF Use_Inchr THEN
      FPRINT Outfile,"int     inchr (char*,char*);"
    END IF

    IF Use_Idxqsort THEN
      FPRINT Outfile,"int     IdxCompare (const void *,const void *);"
    END IF

    IF Use_IdxqsortSt THEN
      FPRINT Outfile,"int     IdxCompareSt (const void *,const void *);"
    END IF

    IF Use_PtrqsortSt THEN
      FPRINT Outfile,"int     PtrCompareSt (const void *,const void *);"
    END IF

    IF Use_Strqsorta THEN
      FPRINT Outfile,"int     StrCompareA (const void *,const void *);"
    END IF

    IF Use_Strqsortd THEN
      FPRINT Outfile,"int     StrCompareD (const void *,const void *);"
    END IF

    IF Use_DynStrqsorta THEN
      FPRINT Outfile,"int     DynStrCompareA (const void *,const void *);"
    END IF

    IF Use_DynStrqsortd THEN
      FPRINT Outfile,"int     DynStrCompareD (const void *,const void *);"
    END IF

    IF Use_Numqsortaint THEN
      FPRINT Outfile,"int     NumCompareAint (const void *,const void *);"
    END IF

    IF Use_Numqsortdint THEN
      FPRINT Outfile,"int     NumCompareDint (const void *,const void *);"
    END IF

    IF Use_Numqsortafloat THEN
      FPRINT Outfile,"int     NumCompareAfloat (const void *,const void *);"
    END IF

    IF Use_Numqsortdfloat THEN
      FPRINT Outfile,"int     NumCompareDfloat (const void *,const void *);"
    END IF

    IF Use_Numqsortadouble THEN
      FPRINT Outfile,"int     NumCompareAdouble (const void *,const void *);"
    END IF

    IF Use_Numqsortddouble THEN
      FPRINT Outfile,"int     NumCompareDdouble (const void *,const void *);"
    END IF

    IF Use_Msgbox THEN
      FPRINT Outfile,"int     MsgBox (char*,char*,int);"
    END IF

    IF Use_Like THEN
      FPRINT Outfile,"int     like (char*,char*);"
    END IF

    IF Use_Textmode THEN
      FPRINT Outfile,"int     TextMode (int);"
    END IF

    IF Use_Tally THEN
      FPRINT Outfile,"int tally (char*,char*,int=0);"
    END IF

    IF Use_Inkey THEN
      FPRINT Outfile,"char*   inkey (void);"
    END IF

    IF Use_InkeyD THEN
      FPRINT Outfile,"int     inkeyd (void);"
    END IF

    IF Use_Bin2dec THEN
      FPRINT Outfile,"int     Bin2Dec (char*);"
    END IF

    IF Use_Hex2Dec THEN
      FPRINT Outfile,"int     Hex2Dec (char*);"
    END IF

    IF Use_Download THEN
      FPRINT Outfile,"int     Download (char*,char*);"
    END IF

    IF Use_Exist THEN
      FPRINT Outfile,"BOOL    Exist   (char*);"
      FPRINT Outfile,"BOOL    Exist_A (char*);"
      FPRINT Outfile,"BOOL    Exist_B (char*);"
    END IF

    IF Use_Ins THEN
      FPRINT Outfile,"char*   ins (char *S, int i, char *a);"
    END IF

    IF Use_Del THEN
      FPRINT Outfile,"char*   del (char*,int,int);"
    END IF

    IF Use_Lof THEN
      FPRINT Outfile,"DWORD   lof (char*);"
    END IF

    IF Use_Sgn THEN
      FPRINT Outfile,"double  sgn (double);"
    END IF

    IF Use_Round THEN
      FPRINT Outfile,"double  Round (double,int);"
    END IF

    IF Use_Abs THEN
      FPRINT Outfile,"double  Abs (double);"
    END IF

    IF Use_Rnd THEN
      FPRINT Outfile,"float   rnd (void);"
    END IF

    IF Use_Exp THEN
      FPRINT Outfile,"double  Exp (double);"
    END IF

    IF Use_Min THEN
      FPRINT Outfile,"double  MIN (double,double);"
    END IF

    IF Use_Max THEN
      FPRINT Outfile,"double  MAX (double,double);"
    END IF

    IF Use_Timer THEN
      FPRINT Outfile,"float   timer (void);"
    END IF

    IF Use_Iif THEN
      FPRINT Outfile,"double  iif (BOOL,double,double);"
    END IF

    IF Use_Loc THEN
      FPRINT Outfile,"int     loc (FILE *fp, int fplen);"
    END IF

    IF Use_Rec THEN
      FPRINT Outfile,"int     rec (FILE *fp, int fplen);"
    END IF

    IF Use_RecCount THEN
      FPRINT Outfile,"int     reccount (FILE *fp, int fplen);"
    END IF

    IF Use_Scan THEN
      FPRINT Outfile,"int     scan (char *input, char *format, ... );"
    END IF

    IF Use_Split THEN
      FPRINT Outfile,"int     Split (char [][2048], char*, char*, int=0);"
    END IF

    IF Use_DSplit THEN
      FPRINT Outfile,"int     DSplit (LPSTR *, char*, char*, int=0);"
    END IF


    IF Use_SysStr THEN
      FPRINT Outfile,"BSTR    SysStr (char * szIn, int=0, int=0);"
    END IF

    IF Use_WideToAnsi THEN
      FPRINT Outfile,"char*   WideToAnsi (BSTR, UINT=CP_ACP, DWORD=0);"
    END IF

    IF Use_AnsiToWide THEN
      FPRINT Outfile,"LPOLESTR AnsiToWide (char*,UINT=CP_ACP,DWORD=MB_PRECOMPOSED);"
    END IF

    IF Use_Cvi THEN
      FPRINT Outfile,"short   CVI (char*);"
    END IF

    IF Use_Mki THEN
      FPRINT Outfile,"char*   MKI (short);"
    END IF

    IF Use_Cvl THEN
      FPRINT Outfile,"long    CVL (char*);"
    END IF

    IF Use_Mkl THEN
      FPRINT Outfile,"char*   MKL (int);"
    END IF

    IF Use_Cvs THEN
      FPRINT Outfile,"float   CVS (char*);"
    END IF

    IF Use_Mks THEN
      FPRINT Outfile,"char*   MKS (float);"
    END IF

    IF Use_Cvd THEN
      FPRINT Outfile,"double  CVD (char*);"
    END IF

    IF Use_Cvld THEN
      FPRINT Outfile,"long double  CVLD (char*);"
    END IF

    IF Use_Mkd THEN
      FPRINT Outfile,"char*   MKD (double);"
    END IF

    IF Use_Mkld THEN
      FPRINT Outfile,"char*   MKLD (long double);"
    END IF

    IF Use_Dynacall OR Use_DynacallA THEN
      FPRINT Outfile,"HINSTANCE BCX_LoadDll(char *);"
      FPRINT Outfile,"void    BCX_UnloadDll(void);"
      FPRINT Outfile,"typedef int (CALLBACK *DYNACALL1)(void);"
      IF Use_Dynacall THEN
        FPRINT Outfile,"int     BCX_DynaCallB(char *, char *, int, ...);"
      END IF
      IF Use_DynacallA THEN
        FPRINT Outfile,"int     BCX_DynaCallA(char *, char *, int, int *);"
      END IF
    END IF

    IF Use_DynamicA THEN
      FPRINT Outfile,"void*   CreateArr (void*,int,int,int,...);"
      FPRINT Outfile,"void*   CreateArr_internal(void*, int, int, int, va_list);"
      FPRINT Outfile,"void    DestroyArr (void**,int,int);"
    END IF

    IF Use_ContainedIn THEN
      FPRINT Outfile,"int     containedin(char * ,char **,int=0);"
    END IF

    IF Use_FindInType THEN
      FPRINT Outfile,"int     FindInType(char *,char *,int,int,int,int=0,int* =0);"
    END IF


    IF Use_SingleFile = FALSE THEN
      OPEN HFile$ FOR OUTPUT AS fpHFile
    END IF

    IF Use_Printer THEN
      FPRINT Outfile,"int  PrinterOpen  (void);"
      FPRINT Outfile,"void PrinterWrite (char*);"
      FPRINT Outfile,"void EjectPage    (void);"
      FPRINT Outfile,"void PrinterClose (void);"
    END IF
    IF Use_Library THEN FPRINT Outfile,"// END BCXRTHEADER\n\n"

  END IF ' IF Use_Project = FALSE

  IF ProtoCnt THEN
    IF Use_Library THEN
      FPRINT Outfile,"// BCXRTHEADER: USER PROTOTYPES"
    ELSE
      FPRINT Outfile,""
      FPRINT Outfile,"// *************************************************"
      FPRINT Outfile,"//               " + $BCX_STR_USR_PROTOS
      FPRINT Outfile,"// *************************************************"
    END IF
    FPRINT Outfile,""

    DIM RAW LastDef$
    DIM RAW LastLevel

    LastDef$ = ""
    LastLevel = 1

    FOR A = 1 TO ProtoCnt
      IF LastDef$ = "" THEN
        LastDef$ = ProtoType[A].Condition$
        LastLevel = ProtoType[A].CondLevel
        IF Use_SingleFile = FALSE THEN
          IF LastDef$ > "" THEN FPRINT fpHFile, LastDef$
        END IF
        IF LastDef$ > "" THEN FPRINT Outfile, LastDef$
      END IF

      IF LastDef$ <> ProtoType[A].Condition$ THEN
        IF ProtoType[A].Condition$ = "#else" THEN
          WHILE LastLevel > ProtoType[A].CondLevel
            IF Use_SingleFile = FALSE THEN
              FPRINT fpHFile, "#endif"
            END IF
            FPRINT Outfile,"#endif"
            LastLevel--
          WEND
          IF Use_SingleFile = FALSE THEN
            FPRINT fpHFile, "#else"
          END IF
          FPRINT Outfile,"#else"
          LastDef$ = ProtoType[A].Condition$
          LastLevel = ProtoType[A].CondLevel

        ELSE

          WHILE LastLevel > ProtoType[A].CondLevel
            IF Use_SingleFile = FALSE THEN
              FPRINT fpHFile, "#endif"
            END IF
            FPRINT Outfile,"#endif"
            LastLevel--
          WEND
          LastDef$ = ProtoType[A].Condition$
          LastLevel = ProtoType[A].CondLevel
          IF Use_SingleFile = FALSE THEN
            IF LastDef$ > "" THEN FPRINT fpHFile, LastDef$
          END IF
          IF LastDef$ > "" THEN FPRINT Outfile, LastDef$
        END IF
      END IF

      IF UseStdCall AND UseCpp THEN
        IF LEFT$(ProtoType[A].Prototype$, 9) = "C_EXPORT " THEN
          EmitExportDef(ProtoType[A].Prototype$)
        END IF
      END IF

      T$ = EXTRACT$(ProtoType[A].Prototype$, SPC$)
      T$ = RPAD$(T$, 7) + SPC$
      ProtoType[A].Prototype$ = T$ + REMAIN$(ProtoType[A].Prototype$, SPC$)

      IF Use_SingleFile = FALSE THEN
        FPRINT fpHFile, ProtoType[A].Prototype$
      END IF

      FPRINT Outfile,ProtoType[A].Prototype$

    NEXT A 'ProtoCnt


    IF *LastDef$ THEN
      WHILE LastLevel > 0
        IF Use_SingleFile = FALSE THEN
          FPRINT fpHFile, "#endif"
        END IF
        FPRINT Outfile,"#endif"
        LastLevel--
      WEND
    END IF
    IF Use_Library THEN FPRINT Outfile,"// END BCXRTHEADER\n\n"
  END IF

  FPRINT Outfile,""


  IF Use_EnumFile THEN
    IF Use_Library THEN
      FPRINT Outfile,"// BCXRTHEADER: USER GLOBAL ENUM BLOCKS"
    ELSE
      FPRINT Outfile,"// *************************************************"
      FPRINT Outfile,"//        User's GLOBAL ENUM blocks"
      FPRINT Outfile,"// *************************************************"
    END IF
    OPEN enuFile$ FOR INPUT AS FP8
    WHILE NOT EOF(FP8)
      LINE INPUT FP8,ZZ$
      FPRINT Outfile,ZZ$
    WEND
    CLOSE FP8
    IF Use_Library THEN FPRINT Outfile,"// END BCXRTHEADER\n\n"
    FPRINT Outfile,"\n\n"
  END IF

  ' begin for initialized global arrays
  DIM RAW P$, i
  DIM RAW VarName$
  DIM RAW VarDim$
  DIM RAW Storage$
  DIM RAW VAR$

  FPRINT Outfile,""
  FPRINT Outfile,"// *************************************************"
  FPRINT Outfile,"//            User Global Initialized Arrays"
  FPRINT Outfile,"// *************************************************"
  FPRINT Outfile,""

  FOR i = 1 TO GlobalVarCnt
    IF GlobalVars[i].VarEmitFlag THEN ITERATE
    IF "" <> GlobalVars[i].VarDim$ AND GlobalVars[i].VarCondLevel = 0 THEN
      IF INSTR(GlobalVars[i].VarDim,"{") THEN
        P$ = ""
        IF GlobalVars[i].VarPntr THEN P$ = STRING$(GlobalVars[i].VarPntr,42)
        A = GlobalVars[i].VarType
        IF GlobalVars[i].VarSF THEN
          VarName$ = "(*" + GlobalVars[i].VarName$ + EXTRACT$(GlobalVars[i].VarDim,"(") + ")"
          VarDim$ = MID$(GlobalVars[i].VarDim, INSTR(GlobalVars[i].VarDim,"("))
        ELSE
          VarName$ = GlobalVars[i].VarName$
          VarDim$ = GlobalVars[i].VarDim
        END IF
        Storage$ = VarStorage$[GlobalVars[i].VarExtn]
        SELECT CASE A
          ' handle exceptions

          CASE vt_STRVAR
          FPRINT Outfile,Storage$;"char    ";VarName$;VarDim$;";"

          CASE vt_FILEPTR
          REMOVE "@" FROM GlobalVars[i].VarName$
          FPRINT Outfile,Storage$;"FILE   *";VarName$;VarDim$;";"

          CASE vt_LPSTR
          FPRINT Outfile,Storage$;"LPSTR   ";P$;VarName$;VarDim$;";"
          CASE vt_BOOL
          FPRINT Outfile,Storage$;"BOOL    ";VarName$;VarDim$;";"
          ' handle normal

          CASE vt_UDT, vt_STRUCT, vt_UNION
          VAR$ = TypeDefs[GlobalVars[i].VarDef].VarName$
          VAR$ = RPAD$(VAR$, 7)
          FPRINT Outfile,Storage$;VAR$;" ";P$;VarName$;VarDim$;";"

          CASE vt_VarMin TO vt_VarMax
          VAR$ = GetVarTypeName$(GlobalVars[i].VarType)
          VAR$ = RPAD$(VAR$, 7)
          FPRINT Outfile,Storage$;VAR$;" ";P$;VarName$;VarDim$;";"
        END SELECT
      END IF
    END IF
  NEXT
  FPRINT Outfile,""
  ' end of initialized global arrays


  IF Use_Overloaded THEN
    IF Use_Library THEN
      FPRINT Outfile,"// BCXRTHEADER: USER OVERLOADED SUBS AND FUNCTIONS"
    ELSE
      FPRINT Outfile,"// *************************************************"
      FPRINT Outfile,"//        User's Overloaded Subs/Functions          "
      FPRINT Outfile,"// *************************************************"
    END IF

    OPEN ovrFile$ FOR INPUT AS FP8

    WHILE NOT EOF(FP8)
      LINE INPUT FP8,ZZ$
      IF INSTR(ZZ$,"overloaded") THEN
        FPRINT Outfile,"\n"
      END IF
      FPRINT Outfile,ZZ$
    WEND

    CLOSE FP8
    IF Use_Library THEN FPRINT Outfile,"// END BCXRTHEADER\n\n"
    FPRINT Outfile,"\n\n"
  END IF

  OPEN setFile$ FOR INPUT AS FP5
  IF LOF(setFile$) > 0 THEN
    IF Use_Library THEN
      FPRINT Outfile,"// BCXRTHEADER: USER GLOBAL SET STATEMENTS"
    ELSE
      FPRINT Outfile,"// *************************************************"
      FPRINT Outfile,"//              User GLOBAL SET Statements"
      FPRINT Outfile,"// *************************************************"
      FPRINT Outfile,""
    END IF
    WHILE NOT EOF(FP5)
      LINE INPUT FP5,Z$
      FPRINT Outfile,Z$
    WEND
    FPRINT Outfile,""
  END IF
  CLOSE FP5

  IF Use_Library THEN FPRINT Outfile,"// END BCXRTHEADER\n\n"

  IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIBHEADER: "

  IF Use_SingleFile = FALSE THEN
    CLOSE fpHFile
  END IF

  IF Use_Wingui = 0 AND NoMain = 0 THEN
    IF Use_Library THEN
      FPRINT Outfile,"// BCXRTHEADER: MAIN PROGRAM"
    ELSE
      FPRINT Outfile,"// *************************************************"
      FPRINT Outfile,"//                  " + $BCX_STR_MAIN_PROG
      FPRINT Outfile,"// *************************************************"
      FPRINT Outfile,""
    END IF
  END IF

  '**********************************************************************
  IF Use_Wingui + MakeDLL + NoMain = FALSE THEN
    FPRINT Outfile,SaveMain$  ' add the >> void main() back to the stream
    FPRINT Outfile,"{"        ' AND OPEN the main FUNCTION
  END IF
  '**********************************************************************

  IF (NoMain + Use_Wingui + MakeDLL = FALSE) AND (Use_Console = TRUE) THEN
    FPRINT Outfile,"  hConsole = GetStdHandle (STD_OUTPUT_HANDLE);"
  END IF

  WHILE NOT EOF(FP1)
    LINE INPUT FP1,ZZ$
    FPRINT Outfile,Scoot$,ZZ$
  WEND

  IF Use_Library THEN FPRINT Outfile,"// END BCXRTHEADER\n\n"

  IF Use_SingleFile = TRUE AND Use_Project = FALSE THEN
    CALL RunTimeFunctions
  ELSE
    IF Use_Project = FALSE THEN
      CALL SetFlags
    END IF
  END IF

  FLUSH(Outfile)
  CALL  CloseAll
  KILL  FileOut$
  RENAME "$t$e$m$p", FileOut$
END SUB ' AddProtos






SUB RunTimeFunctions
  DIM crtab$
  crtab$="\"+"n"+"\"+"t"
  FPRINT Outfile,""
  FPRINT Outfile,"// *************************************************"
  FPRINT Outfile,"//                 " + $BCX_STR_RUNTIME
  FPRINT Outfile,"// *************************************************"
  FPRINT Outfile,""
	


  IF UseFlag THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: BCX_TmpStr"
    IF Use_Turbo THEN
      FPRINT Outfile,"char BCX_TmpStr_buffer[256];"
      FPRINT Outfile,"char *BCX_TmpStr (size_t Bites)"
      FPRINT Outfile,"{"
      FPRINT Outfile,"  BCX_TmpStr_buffer[Bites]=0;"
      FPRINT Outfile,"  return &BCX_TmpStr_buffer[0]; //that's all you're gonna get ;)"
      FPRINT Outfile,"//  static int   StrCnt;"
      FPRINT Outfile,"//  static char *StrFunc[",TurboSize,"];"
      FPRINT Outfile,"//  StrCnt=(++StrCnt &",TurboSize-1,");"
      FPRINT Outfile,"//  StrFunc[StrCnt]=(char*)realloc(StrFunc[StrCnt],Bites + 128);"
      FPRINT Outfile,"//  return (char*)memset(StrFunc[StrCnt],0,Bites+128);"
      FPRINT Outfile,"}\n\n"
    ELSE
      FPRINT Outfile,"char BCX_TmpStr_buffer[256];"
      FPRINT Outfile,"char *BCX_TmpStr (size_t Bites)"
      FPRINT Outfile,"{"
      FPRINT Outfile,"  BCX_TmpStr_buffer[Bites]=0;"
      FPRINT Outfile,"  return &BCX_TmpStr_buffer[0]; //that's all you're gonna get ;)"
      FPRINT Outfile,"//  static int   StrCnt;"
      FPRINT Outfile,"//  static char *StrFunc[2048];"
      FPRINT Outfile,"//  StrCnt=(StrCnt + 1) & 2047;"
      FPRINT Outfile,"//  if(StrFunc[StrCnt]) free (StrFunc[StrCnt]);"
      FPRINT Outfile,"//  return StrFunc[StrCnt]=(char*)calloc(Bites+128,sizeof(char));"
      FPRINT Outfile,"}\n\n"
    END IF
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Str_Cmp THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: str_cmp"
    FPRINT Outfile,"int str_cmp (char *a, char *b)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  register int counter=0;"
    FPRINT Outfile,"  for(;;)"
    FPRINT Outfile,"   {"
    FPRINT Outfile,"    if((a[counter]^b[counter]))"
    FPRINT Outfile,"     {"
    FPRINT Outfile,"      if((UINT) a[counter]>= (UINT) b[counter])"
    FPRINT Outfile,"      return  1;"
    FPRINT Outfile,"      return -1;"
    FPRINT Outfile,"     }"
    FPRINT Outfile,"    if(!a[counter]) return 0;"
    FPRINT Outfile,"    counter++;"
    FPRINT Outfile,"   }"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Cint THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: Cint"
    FPRINT Outfile,"int Cint (double A)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  return (A >=0 ? (int)(A+0.5) : (int)(A-0.5));"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Clng THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: CLNG"
    FPRINT Outfile,"long CLNG (double A)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  float   r=.5;"
    FPRINT Outfile,"  double  a=A-(long)A;"
    FPRINT Outfile,"  if(A<0) { r=-.5; a=-a; }"
    FPRINT Outfile,"  if(((long)A % 2)==0&&a<=.5)"
    FPRINT Outfile,"    return (long)A;"
    FPRINT Outfile,"  else"
    FPRINT Outfile,"    return (long)(A+r);"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Left THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: left"
    FPRINT Outfile,"char *left (char *S, int length)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  register int tmplen = strlen(S);"
    FPRINT Outfile,"  if(length<1) return BCX_TmpStr(1);"
    FPRINT Outfile,"  if(length<tmplen) tmplen=length;"
    FPRINT Outfile,"  char *strtmp = BCX_TmpStr(tmplen);"
    FPRINT Outfile,"  return (char*)memcpy(strtmp,S,tmplen);"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Right THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: right"
    FPRINT Outfile,"char *right (char *S, int length)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  int tmplen = strlen(S);"
    FPRINT Outfile,"  char *BCX_RetStr = BCX_TmpStr(tmplen);"
    FPRINT Outfile,"  tmplen -= length;"
    FPRINT Outfile,"  if (tmplen<0) tmplen = 0;"
    FPRINT Outfile,"  return strcpy(BCX_RetStr, &S[tmplen]);"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Rpad THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: rpad"
    FPRINT Outfile,"char *rpad (char *a, int L, int c)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  char *strtmp;"
    FPRINT Outfile,"  int s = strlen(a);"
    FPRINT Outfile,"  if((L-s)<1) return a;"
    FPRINT Outfile,"  strtmp=BCX_TmpStr(L);"
    FPRINT Outfile,"  strcpy(strtmp,a);"
    FPRINT Outfile,"  memset(&strtmp[s],c,(L-s));"
    FPRINT Outfile,"  return strtmp;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Lpad THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: lpad"
    FPRINT Outfile,"char *lpad (char *a, int L, int c)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  char *strtmp;"
    FPRINT Outfile,"  L=L-strlen(a);"
    FPRINT Outfile,"  if(L<1) return a;"
    FPRINT Outfile,"  strtmp = BCX_TmpStr(L);"
    FPRINT Outfile,"  memset(strtmp,c,L);"
    FPRINT Outfile,"  return strcat(strtmp,a);"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Mid THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: mid"
    FPRINT Outfile,"char *mid (char *S, int start, int length)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  char *strtmp;"
    FPRINT Outfile,"  register int tmplen = strlen(S);"
    FPRINT Outfile,"  if(start>tmplen||start<1) return BCX_TmpStr(1);"
    FPRINT Outfile,"  if (length<0 || length>(tmplen-start)+1)"
    FPRINT Outfile,"    length = (tmplen-start)+1;"
    FPRINT Outfile,"  strtmp = BCX_TmpStr(length);"
    FPRINT Outfile,"  return (char*)memcpy(strtmp,&S[start-1],length);"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Trim THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: trim"
    FPRINT Outfile,"char *trim (char *S)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  while(*S==32 || *S==9 || *S==10 || *S==11 || *S==13)"
    '                 tab ,carriage return, vertical tab, newline, space
    FPRINT Outfile,"    S++;"
    FPRINT Outfile,"  register int i = strlen(S);"
    FPRINT Outfile,"  while( i>0 && (S[i-1]==32 || S[i-1]==9 || S[i-1]==10"
    FPRINT Outfile,"             || S[i-1]==11 || S[i-1]==13))"
    FPRINT Outfile,"    i--;"
    FPRINT Outfile,"  char *strtmp=BCX_TmpStr(i);"
    FPRINT Outfile,"  return (char*)memcpy(strtmp,S,i);"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Ltrim THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: ltrim"
    FPRINT Outfile,"char *ltrim (char *S, char c)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  if(S[0]==0) return S;"
    FPRINT Outfile,"  while((*S==32 || *S==c) && *S !=0) S++;"
    FPRINT Outfile,"  char *strtmp = BCX_TmpStr(strlen(S));"
    FPRINT Outfile,"  return strcpy(strtmp,S);"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Rtrim THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: rtrim"
    FPRINT Outfile,"char *rtrim (char *S,char c)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  if(S[0]==0) return S;"
    FPRINT Outfile,"  register int i = strlen(S);"
    FPRINT Outfile,"  while(i>0 && (S[i-1]==c || S[i-1]==32))"
    FPRINT Outfile,"    i--;"
    FPRINT Outfile,"  char *strtmp = BCX_TmpStr(i);"
    FPRINT Outfile,"  return (char*)memcpy(strtmp,S,i);"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Strim THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: strim"
    FPRINT Outfile,"char *strim (char *src)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  char *strtmp = BCX_TmpStr(strlen(src));"
    FPRINT Outfile,"  register char *dst = strtmp;"
    FPRINT Outfile,"  while (isspace((unsigned char)*src)) src++;"
    FPRINT Outfile,"  do"
    FPRINT Outfile,"  {"
    FPRINT Outfile,"    while (*src && !isspace((unsigned char)*src)) *dst++ = *src++;"
    FPRINT Outfile,"    if (*src)"
    FPRINT Outfile,"      {"
    FPRINT Outfile,"        *dst++ = *src++;"
    FPRINT Outfile,"        while (isspace((unsigned char)*src)) src++;"
    FPRINT Outfile,"      }"
    FPRINT Outfile,"  } while (*src);"
    FPRINT Outfile,"  if (isspace((unsigned char)*(--dst))) *dst = 0;"
    FPRINT Outfile,"  return strtmp;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Extract THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: extract"
    FPRINT Outfile,"char *extract (char *mane, char *match)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  register char *a;"
    FPRINT Outfile,"  register char *strtmp = BCX_TmpStr(strlen(mane));"
    FPRINT Outfile,"  if(*match!=0)"
    FPRINT Outfile,"    {"
    FPRINT Outfile,"      a=_strstr_(mane,match);"
    FPRINT Outfile,"      if(a) return (char*)memcpy(strtmp,mane,a-mane);"
    FPRINT Outfile,"    }"
    FPRINT Outfile,"  return strcpy(strtmp,mane);"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Remain THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: remain"
    FPRINT Outfile,"char *remain (char *mane, char *mat)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  register char *p = strstr(mane,mat);"
    FPRINT Outfile,"  if(p)"
    FPRINT Outfile,"  {"
    FPRINT Outfile,"    p+=(strlen(mat));"
    FPRINT Outfile,"    return p;"
    FPRINT Outfile,"  }"
    FPRINT Outfile,"  return mane;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Replace THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: replace"
    FPRINT Outfile,"char *replace (char *src, char *pat, char *rep)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  register size_t patsz, repsz, tmpsz, delta;"
    FPRINT Outfile,"  register char *strtmp, *p, *q, *r;"
    FPRINT Outfile,"  if (!pat || !*pat)"
    FPRINT Outfile,"   {"
    FPRINT Outfile,"     strtmp = BCX_TmpStr(strlen(src));"
    FPRINT Outfile,"     if (!strtmp) return NULL;"
    FPRINT Outfile,"     return strcpy(strtmp, src);"
    FPRINT Outfile,"   }"
    FPRINT Outfile,"  repsz = strlen(rep);"
    FPRINT Outfile,"  patsz = strlen(pat);"
    FPRINT Outfile,"  for (tmpsz=0, p=src; (q=_strstr_(p,pat))!=0; p=q+patsz)"
    FPRINT Outfile,"   tmpsz += (size_t) (q - p) + repsz;"
    FPRINT Outfile,"   tmpsz += strlen(p);"
    FPRINT Outfile,"   strtmp = BCX_TmpStr(tmpsz);"
    FPRINT Outfile,"   if (!strtmp) return NULL;"
    FPRINT Outfile,"    for (r=strtmp,p=src; (q=_strstr_(p,pat))!=0;p=q+patsz)"
    FPRINT Outfile,"     {"
    FPRINT Outfile,"       delta = (size_t) (q-p);"
    FPRINT Outfile,"       memcpy(r,p,delta); r += delta;"
    FPRINT Outfile,"       strcpy(r,rep);      r += repsz;"
    FPRINT Outfile,"     }"
    FPRINT Outfile,"  strcpy(r,p);"
    FPRINT Outfile,"  return strtmp;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Reverse THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: reverse"
    FPRINT Outfile,"char *reverse (char *s)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  int j=strlen(s);"
    FPRINT Outfile,"  register char *rstr = BCX_TmpStr(j);"
    FPRINT Outfile,"  while(j)  rstr[--j] = *(s++);"
    FPRINT Outfile,"  return rstr;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Findfirst THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: findfirst"
    FPRINT Outfile,"char *findfirst (char *S)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  register char *strtmp = BCX_TmpStr(strlen(S));"
    FPRINT Outfile,"  if(FileHandle) FindClose(FileHandle);"
    FPRINT Outfile,"  FileHandle = FindFirstFile(S,&FindData);"
    FPRINT Outfile,"  if (FileHandle != INVALID_HANDLE_VALUE)"
    FPRINT Outfile,"    strcpy(strtmp,FindData.cFileName);"
    FPRINT Outfile,"  return strtmp;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Findnext THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: findnext"
    FPRINT Outfile,"char *findnext (void)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  register int Found = FindNextFile(FileHandle,&FindData);"
    FPRINT Outfile,"  register char *strtmp = BCX_TmpStr(2048);"
    FPRINT Outfile,"  if(Found)"
    FPRINT Outfile,"    strcpy(strtmp,FindData.cFileName);"
    FPRINT Outfile,"  return strtmp;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Ucase THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: ucase"
    FPRINT Outfile,"char *ucase (char *S)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  register char *strtmp = BCX_TmpStr(strlen(S));"
    FPRINT Outfile,"  return strupr(strcpy(strtmp,S));"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Lcase THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: lcase"
    FPRINT Outfile,"char *lcase (char *S)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  register char *strtmp = BCX_TmpStr(strlen(S));"
    FPRINT Outfile,"  return strlwr(strcpy(strtmp,S));"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Mcase THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: mcase"
    FPRINT Outfile,"char *mcase (char *S)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  register char *strtmp = BCX_TmpStr(strlen(S)+1);"
    FPRINT Outfile,"  register char *s = strtmp;"
    FPRINT Outfile,"  strlwr(strcpy(strtmp,S));"
    FPRINT Outfile,"  while(*s)"
    FPRINT Outfile,"  {"
    FPRINT Outfile,"    if(islower(*s))"
    FPRINT Outfile,"      {"
    FPRINT Outfile,"        *s-=32;"
    FPRINT Outfile,"        while(isalpha(*++s));"
    FPRINT Outfile,"      }"
    FPRINT Outfile,"     s++;"
    FPRINT Outfile,"  }"
    FPRINT Outfile,"  return strtmp;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Remove THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: RemoveStr"
    FPRINT Outfile,"char *RemoveStr (char *a, char *b)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  char *strtmp, *p, *d;"
    FPRINT Outfile,"  int  tmplen;"
    FPRINT Outfile,"  strtmp = d = BCX_TmpStr(strlen(a));"
    FPRINT Outfile,"  if(!b || !*b) return strcpy(strtmp,a);"
    FPRINT Outfile,"  p=_strstr_(a,b); tmplen = strlen(b);"
    FPRINT Outfile,"  while(p)"
    FPRINT Outfile,"   {"
    FPRINT Outfile,"     memcpy(d,a,p-a);"
    FPRINT Outfile,"     d+= (p-a);"
    FPRINT Outfile,"     a=p+tmplen;"
    FPRINT Outfile,"     p=_strstr_(a,b);"
    FPRINT Outfile,"   }"
    FPRINT Outfile,"  strcpy(d,a);"
    FPRINT Outfile,"  return strtmp;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_IRemove THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: IRemove"
    FPRINT Outfile,"char *IRemoveStr (char *a, char *b)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  char *strtmp, *p, *d;"
    FPRINT Outfile,"  int  tmplen;"
    FPRINT Outfile,"  strtmp = d = BCX_TmpStr(strlen(a));"
    FPRINT Outfile,"  if(!b || !*b) return strcpy(strtmp,a);"
    FPRINT Outfile,"  p=_stristr_(a,b); tmplen = strlen(b);"
    FPRINT Outfile,"  while(p)"
    FPRINT Outfile,"   {"
    FPRINT Outfile,"     memcpy(d,a,p-a);"
    FPRINT Outfile,"     d+= (p-a);"
    FPRINT Outfile,"     a=p+tmplen;"
    FPRINT Outfile,"     p=_stristr_(a,b);"
    FPRINT Outfile,"   }"
    FPRINT Outfile,"  strcpy(d,a);"
    FPRINT Outfile,"  return strtmp;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF

  IF Use_Ins THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: ins"
    FPRINT Outfile,"char *ins (char *S, int i, char *a)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  register int j = strlen(S);"
    FPRINT Outfile,"  if(i<1 || i>j+1) return S;"
    FPRINT Outfile,"  register char *strtmp = BCX_TmpStr(j + strlen(a));"
    FPRINT Outfile,"  memcpy(strtmp,S,--i);"
    FPRINT Outfile,"  strcpy(&strtmp[i],a);"
    FPRINT Outfile,"  return strcat(strtmp,&S[i]);"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Del THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: del"
    FPRINT Outfile,"char *del (char *S, int i, int j)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  int ln = strlen(S);"
    FPRINT Outfile,"  if(i<1 || i>ln) return S;"
    FPRINT Outfile,"  register char *strtmp = BCX_TmpStr(ln);"
    FPRINT Outfile,"  memcpy(strtmp,S,--i);"
    FPRINT Outfile,"  return strcat(strtmp,&S[i+j]);"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Str THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: str"
    FPRINT Outfile,"char *str (float d)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  register char *strtmp = BCX_TmpStr(16);"
    FPRINT Outfile,"  ee_sprintf(strtmp,";D1$;",d);"
    FPRINT Outfile,"  return strtmp;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF

  IF Use_Strl THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: strl"
    FPRINT Outfile,"char *strl (float d)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  register char *strtmp = BCX_TmpStr(27);"
    FPRINT Outfile,"  sprintf(strtmp,";D2$;",d);"
    FPRINT Outfile,"  return strtmp;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF

  IF Use_Hex THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: hex"
    FPRINT Outfile,"char *hex (int a)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  register char *strtmp = BCX_TmpStr(16);"
    FPRINT Outfile,"  sprintf(strtmp,";X1$;",a);"
    FPRINT Outfile,"  return strtmp;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Repeat THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: repeat"
    FPRINT Outfile,"char *repeat (int count, char *a)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  register char *strtmp = BCX_TmpStr((1+count)*strlen(a));"
    FPRINT Outfile,"  while(count-->0) strtmp = strcat(strtmp, a);"
    FPRINT Outfile,"  return strtmp;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_String THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: string"
    FPRINT Outfile,"char *string (int count, int a)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  if(count<1) return BCX_TmpStr(1);"
    FPRINT Outfile,"  register char *strtmp = BCX_TmpStr(count);"
    FPRINT Outfile,"  return (char*)memset(strtmp,a,count);"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Space THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: space"
    FPRINT Outfile,"char *space (int count)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  if(count<1) return BCX_TmpStr(1);"
    FPRINT Outfile,"  register char *strtmp = BCX_TmpStr(count);"
    FPRINT Outfile,"  return (char*)memset(strtmp,32,count);"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Enclose THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: enc"
    FPRINT Outfile,"char *enc (char *A, int L, int R)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  register char *BCX_RetStr = BCX_TmpStr(strlen(A)+3);"
    FPRINT Outfile,"  if(L==0) L=34;"
    FPRINT Outfile,"  if(R==0) R=L;"
    FPRINT Outfile,"  sprintf(BCX_RetStr,",ENC$("%c%s%c%s"),",L,A,R,",ENC$("\0"),");"
    FPRINT Outfile,"  return BCX_RetStr;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Chr THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: chr"
    FPRINT Outfile,"char *chr (int a,int b,int c,int d,int e,int f,int g,int h,int i,int j)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  register char *strtmp = BCX_TmpStr(11);"
    FPRINT Outfile,"  strtmp[0]  = a;"
    FPRINT Outfile,"  strtmp[1]  = b;"
    FPRINT Outfile,"  strtmp[2]  = c;"
    FPRINT Outfile,"  strtmp[3]  = d;"
    FPRINT Outfile,"  strtmp[4]  = e;"
    FPRINT Outfile,"  strtmp[5]  = f;"
    FPRINT Outfile,"  strtmp[6]  = g;"
    FPRINT Outfile,"  strtmp[7]  = h;"
    FPRINT Outfile,"  strtmp[8]  = i;"
    FPRINT Outfile,"  strtmp[9]  = j;"
    FPRINT Outfile,"  strtmp[10] = 0;"
    FPRINT Outfile,"  return strtmp;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_VChr THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: vchr"
    FPRINT Outfile,"char *vchr(int charcount, ...)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  register int c = 0, i = charcount;"
    FPRINT Outfile,"  char *s_ = BCX_TmpStr(charcount + 1);"
    FPRINT Outfile,"  va_list marker;"
    FPRINT Outfile,"  s_[i] = 0;"
    FPRINT Outfile,"  va_start(marker, charcount);"
    FPRINT Outfile,"  while(i-- > 0) s_[c++] = va_arg(marker,int);"
    FPRINT Outfile,"  va_end(marker);"
    FPRINT Outfile,"  return s_;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Join THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: join"
    FPRINT Outfile,"char * join(int n, ...)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  register int i = n, tmplen = 0;"
    FPRINT Outfile,"  register char *s_;"
    FPRINT Outfile,"  register char *strtmp;"
    FPRINT Outfile,"  va_list marker;"
    FPRINT Outfile,"  va_start(marker, n); // Initialize variable arguments"
    FPRINT Outfile,"  while(i-- > 0)"
    FPRINT Outfile,"  {"
    FPRINT Outfile,"    s_ = va_arg(marker, char *);"
    FPRINT Outfile,"    if(s_) tmplen += strlen(s_);"
    FPRINT Outfile,"  }"
    FPRINT Outfile,"  strtmp = BCX_TmpStr(tmplen);"
    FPRINT Outfile,"  va_end(marker); // Reset variable arguments"
    FPRINT Outfile,"  i = n;"
    FPRINT Outfile,"  va_start(marker, n); // Initialize variable arguments"
    FPRINT Outfile,"  while(i-- > 0)"
    FPRINT Outfile,"  {"
    FPRINT Outfile,"    s_ = va_arg(marker, char *);"
    FPRINT Outfile,"    if(s_) strcat(strtmp, s_);"
    FPRINT Outfile,"  }"
    FPRINT Outfile,"  va_end(marker); // Reset variable arguments"
    FPRINT Outfile,"  return strtmp;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Environ THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: Environ"
    FPRINT Outfile,"char* Environ(char *S)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  char *strtmp = BCX_TmpStr(32767);"
    FPRINT Outfile,"  GetEnvironmentVariable(S,strtmp, 32767);"
    FPRINT Outfile,"  return strtmp;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Oct THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: oct"
    FPRINT Outfile,"char *oct (int a)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  char *strtmp = BCX_TmpStr(2048);"
    FPRINT Outfile,"  sprintf(strtmp,";O1$;",a);"
    FPRINT Outfile,"  return strtmp;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Bin THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: Bin"
    FPRINT Outfile,"char* Bin(int number)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  char *strtmp = BCX_TmpStr(2048);"
    FPRINT Outfile,"   itoa(number,strtmp,2);"
    FPRINT Outfile,"  return strtmp;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Inkey THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: inkey"
    FPRINT Outfile,"char* inkey(void)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  char *strtmp = BCX_TmpStr(2);"
    FPRINT Outfile,"  if (kbhit())"
    FPRINT Outfile,"   {"
    FPRINT Outfile,"     int asccodereturn = getch();"
    FPRINT Outfile,"     strtmp[0] = asccodereturn;"
    FPRINT Outfile,"     strtmp[1] = 0;"
    FPRINT Outfile,"   }"
    FPRINT Outfile,"  return strtmp;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_InkeyD THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: inkeyd"
    FPRINT Outfile,"int inkeyd(void)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  register int ch = 0;"
    FPRINT Outfile,"  INPUT_RECORD InputRecord;"
    FPRINT Outfile,"  DWORD Count = 0, cks;"
    FPRINT Outfile,"  WORD vkc, vsc;"
    FPRINT Outfile,"  HANDLE hStdIn = GetStdHandle(STD_INPUT_HANDLE);"
    FPRINT Outfile,"  PeekConsoleInput(hStdIn, &InputRecord, 1, &Count);"
    FPRINT Outfile,"  DWORD OldConsoleMode;"
    FPRINT Outfile,"  GetConsoleMode(hStdIn, &OldConsoleMode);"
    FPRINT Outfile,"  SetConsoleMode(hStdIn, 0);"
    FPRINT Outfile,"  register int i = 0;"
    FPRINT Outfile,"  static char uchr[44];"
    FPRINT Outfile,"  static char lchr[44];"
    FPRINT Outfile,"  strcpy(uchr," + DQ$ &"\\x7E\\x21\\x40\\x23\\x24\\x25\\x5E\\x26\\x2A\\x28\\x29\\x5F\\x2B\\x7C\\x7B\\x7D\\x3A\\x22\\x3C\\x3E\\x3F\\x60\\x31\\x32\\x33\\x34\\x35\\x36\\x37\\x38\\x39\\x30\\x2D\\x3D\\x5C\\x5B\\x5D\\x3B\\x27\\x2C\\x2E\\x2F\\x00" + DQ$ &");"
    FPRINT Outfile,"  strcpy(lchr," + DQ$ &"\\x60\\x31\\x32\\x33\\x34\\x35\\x36\\x37\\x38\\x39\\x30\\x2D\\x3D\\x5C\\x5B\\x5D\\x3B\\x27\\x2C\\x2E\\x2F\\x7E\\x21\\x40\\x23\\x24\\x25\\x5E\\x26\\x2A\\x28\\x29\\x5F\\x2B\\x7C\\x7B\\x7D\\x3A\\x22\\x3C\\x3E\\x3F\\x00" + DQ$ &");"
    FPRINT Outfile,"  ReadConsoleInput(hStdIn, &InputRecord, 1, &Count);"
    FPRINT Outfile,"  SetConsoleMode(hStdIn, OldConsoleMode);"
    FPRINT Outfile,"  if (Count && InputRecord.EventType == KEY_EVENT"
    FPRINT Outfile,"     && InputRecord.Event.KeyEvent.bKeyDown)"
    FPRINT Outfile,"   {"
    FPRINT Outfile,"    vkc = InputRecord.Event.KeyEvent.wVirtualKeyCode;"
    FPRINT Outfile,"    vsc = InputRecord.Event.KeyEvent.wVirtualScanCode;"
    FPRINT Outfile,"    ch = InputRecord.Event.KeyEvent.uChar.AsciiChar;"
    FPRINT Outfile,"    cks = InputRecord.Event.KeyEvent.dwControlKeyState;"
    FPRINT Outfile,"    FlushConsoleInputBuffer(hStdIn);"
    FPRINT Outfile,"    if(!ch && vsc>58)"
    FPRINT Outfile,"     {"
    FPRINT Outfile,"       if(cks & 3) return (1000+vsc)*(-1);"
    FPRINT Outfile,"       if(cks & 12) return (2000+vsc)*(-1);"
    FPRINT Outfile,"       return vsc*(-1);"
    FPRINT Outfile,"     }"
    FPRINT Outfile,"    if (ch && (cks & 3)) return vkc + 1000;"
    FPRINT Outfile,"    if ((vsc == 15) && (cks & 16)) return 15;"
    FPRINT Outfile,"    if (vkc == 27) return 27;"
    FPRINT Outfile,"    if (ch && (cks & 128))"
    FPRINT Outfile,"     {"
    FPRINT Outfile,"      for (i = 0; i <= strlen(lchr); i++)"
    FPRINT Outfile,"        {"
    FPRINT Outfile,"          if (uchr[i] == ch)"
    FPRINT Outfile,"            {"
    FPRINT Outfile,"             ch = lchr[i];"
    FPRINT Outfile,"             break;"
    FPRINT Outfile,"           }"
    FPRINT Outfile,"       }"
    FPRINT Outfile,"    }"
    FPRINT Outfile,"    if (ch) return ch;"
    FPRINT Outfile,"  }"
    FPRINT Outfile,"  return 0;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Now THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: now"
    FPRINT Outfile,"char *now (void)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  char A    [80];"
    FPRINT Outfile,"  char Date [80];"
    FPRINT Outfile,"  time_t elapse_time;"
    FPRINT Outfile,"  struct tm *tp;"
    FPRINT Outfile,"  char *strtmp = BCX_TmpStr(2048);"
    FPRINT Outfile,"  time(&elapse_time);"
    FPRINT Outfile,"  tp=localtime(&elapse_time);"
    FPRINT Outfile,"  strftime(A,256,", ENC$("%I:%M:%S: %p"), ",tp);"
    FPRINT Outfile,"  sprintf(strtmp,", ENC$("%s%s%s"), ",_strdate(Date),", ENC$(" "), ",A);"
    FPRINT Outfile,"  return strtmp;"
    FPRINT Outfile,"}"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Boolstr THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: BoolStr"
    FPRINT Outfile,"char * BoolStr (int a)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  char *BCX_RetStr=BCX_TmpStr(5);"
    FPRINT Outfile,"  if(a) return strcpy(BCX_RetStr,",ENC$("True"),");"
    FPRINT Outfile,"  return strcpy(BCX_RetStr,",ENC$("False"),");"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Using THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: Using"
    FPRINT Outfile,"char *Using (char *Mask, double Num)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  register int Spaces = 0;"
    FPRINT Outfile,"  register int CntDec = 0;"
    FPRINT Outfile,"  register int Decimals = 0;"
    FPRINT Outfile,"  register int Dollar = 0;"
    FPRINT Outfile,"  char* BCX_RetStr = BCX_TmpStr(512);"
    FPRINT Outfile,"  char Buf_1[512]={0};"
    FPRINT Outfile,"  char* p = Mask;"
    FPRINT Outfile,"  char* r;"
    FPRINT Outfile,"  int  len;"
    FPRINT Outfile,""
    FPRINT Outfile,"  while (*p)"
    FPRINT Outfile,"  {"
    FPRINT Outfile,"    if (*p == 36) Dollar++;"
    FPRINT Outfile,"    if (*p == 32) Spaces++;"
    FPRINT Outfile,"    if ((*p == 32 || *p == 35)&& CntDec) Decimals++;"
    FPRINT Outfile,"    if (*p == 46) CntDec = 1;"
    FPRINT Outfile,"    p++;"
    FPRINT Outfile,"  }"
    FPRINT Outfile,"  sprintf(Buf_1,", ENC$("%1.*f"), ",Decimals,Num);"
    FPRINT Outfile,""
    FPRINT Outfile,"  len = strlen(Buf_1)-Decimals-(Decimals>0?1:0);"
    FPRINT Outfile,"  r = BCX_RetStr+Dollar+Spaces;"
    FPRINT Outfile,"  p = Buf_1;"
    FPRINT Outfile,"  while (*p)"
    FPRINT Outfile,"   {"
    FPRINT Outfile,"     *r++ = *p++;"
    FPRINT Outfile,"     if (--len>2 && *(p-1) != '-' && len % 3 == 0)"
    FPRINT Outfile,"       {"
    FPRINT Outfile,"         *r++ = ',';"
    FPRINT Outfile,"       }"
    FPRINT Outfile,"   }"
    FPRINT Outfile,"  if(Dollar) BCX_RetStr[Spaces]=36;"
    FPRINT Outfile,"  if(Spaces) memset(BCX_RetStr,32,Spaces);"
    FPRINT Outfile,""
    FPRINT Outfile,"  return BCX_RetStr;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_SearchPath THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: SEARCHPATH"
    FPRINT Outfile,"char *SEARCHPATH (char *szFile)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  char *BCX_RetStr=BCX_TmpStr(MAX_PATH+1);"
    FPRINT Outfile,"  LPSTR lpbs=0;"
    FPRINT Outfile,"  SearchPath(0,szFile,0,MAX_PATH,BCX_RetStr,&lpbs);"
    FPRINT Outfile,"  if(lpbs) *lpbs=0;"
    FPRINT Outfile,"  return BCX_RetStr;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Instrrev THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: InstrRev"
    FPRINT Outfile,"int InstrRev (char *s, char *p, int os, int sens)"
    FPRINT Outfile,"{"
    FPRINT Outfile," int sl, pl, ox;"
    FPRINT Outfile," int (*cmp)(const char *, const char *, size_t );"
    FPRINT Outfile,""
    FPRINT Outfile," if (!s || !p)  return 0;"
    FPRINT Outfile," sl  = strlen(s); pl  = strlen(p);"
    FPRINT Outfile," if (os > sl || sl == 0 || pl == 0 || (ox = sl - pl) < 0)"
    FPRINT Outfile,"   return 0;"
    FPRINT Outfile,""
    FPRINT Outfile," if (os <= 0)  "
    FPRINT Outfile,"   os = ox ;"
    FPRINT Outfile," else if(os >= pl)"
    FPRINT Outfile,"   os = os - pl ;"
    FPRINT Outfile," else"
    FPRINT Outfile,"   return 0;"
    FPRINT Outfile,""
    FPRINT Outfile," cmp = (sens ? strnicmp : strncmp);"
    FPRINT Outfile," do { if (cmp(s + os , p, pl) == 0)"
    FPRINT Outfile,"       return os+1;"
    FPRINT Outfile,"    } while (os--);"
    FPRINT Outfile," return 0;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Instr THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: instr"
    FPRINT Outfile,"int instr(char* mane,char* match,int offset,int sensflag)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  register char *s;"
    FPRINT Outfile,"  if (!mane || !match || ! *match || offset>(int)strlen(mane)) return 0;"
    FPRINT Outfile,"  if (sensflag)"
    FPRINT Outfile,"    s = _stristr_(offset>0 ? mane+offset-1 : mane,match);"
    FPRINT Outfile,"  else"
    FPRINT Outfile,"    s = _strstr_(offset>0 ? mane+offset-1 : mane,match);"
    FPRINT Outfile,"  return s ? (int)(s-mane)+1 : 0;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF UseLCaseTbl THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: MakeLCaseTbl"
    FPRINT Outfile,"static inline char CharLowerA(char *x) { return *x|0x20; }"
    FPRINT Outfile,"char  *MakeLCaseTbl (void)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  static char tbl[256];"
    FPRINT Outfile,"  if(!tbl['a'])"
    FPRINT Outfile,"    {"
    FPRINT Outfile,"      int i; for (i=0; i < 256; i++)"
    FPRINT Outfile,"        tbl[i] = (char)(int)CharLowerA((char *)(unsigned char)i);"
    FPRINT Outfile,"    }"
    FPRINT Outfile,"  return tbl;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Stristr THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: _stristr_"
    FPRINT Outfile,"char *_stristr_(char *String, char *Pattern)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  int   mi=-1;"
    FPRINT Outfile,"  char *LowCase = MakeLCaseTbl();"
    FPRINT Outfile,"  while(Pattern[++mi])"
    FPRINT Outfile,"   {"
    FPRINT Outfile,"     if(String[mi]==0) return 0;"
    FPRINT Outfile,"     if(LowCase[(unsigned char)String[mi]]!=LowCase[(unsigned char)Pattern[mi]])"
    FPRINT Outfile,"       { String++; mi=-1; }"
    FPRINT Outfile,"   }"
    FPRINT Outfile,"  return String;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_StrStr THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: _strstr_"
    FPRINT Outfile,"char *_strstr_(char *String, char *Pattern)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  int   mi=-1;"
    FPRINT Outfile,"  while(Pattern[++mi])"
    FPRINT Outfile,"   {"
    FPRINT Outfile,"     if(String[mi]==0) return 0;"
    FPRINT Outfile,"     if(String[mi]!=Pattern[mi])"
    FPRINT Outfile,"       { String++; mi=-1; }"
    FPRINT Outfile,"   }"
    FPRINT Outfile,"  return String;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Inchr THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: inchr"
    FPRINT Outfile,"int inchr (char *A, char *B)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  register char* C=A;"
    FPRINT Outfile,"  while(*C)"
    FPRINT Outfile,"    {"
    FPRINT Outfile,"      if(*C==*B) return C-A+1;"
    FPRINT Outfile,"      C++;"
    FPRINT Outfile,"    }"
    FPRINT Outfile,"  return 0;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Asc THEN
    'IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: asc"
    FPRINT Outfile,"extern int asc (char *z,int index)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  return (unsigned char) z[index];"
    FPRINT Outfile,"}\n\n"
    'IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Sgn THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: sgn"
    FPRINT Outfile,"double sgn (double a)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  if(a<0) return -1;"
    FPRINT Outfile,"  if(a>0) return  1;"
    FPRINT Outfile,"  return  0;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Round THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: Round"
    FPRINT Outfile,"double Round (double n, int d)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  //What maniac would need to round to more than 7 digits?"
    FPRINT Outfile,"  float powa[8]={1,10,100,1000,10000,100000,1000000,10000000};"
    FPRINT Outfile,"  return (floor((n)*powa[d]+0.5)/powa[d]);"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Exist THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: Exist"
    FPRINT Outfile,"BOOL Exist (char *szFilePath)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  if(strchr(szFilePath, '*') || strchr(szFilePath, '?'))"
    FPRINT Outfile,"  return Exist_A (szFilePath);"
    FPRINT Outfile,"  return Exist_B (szFilePath);"
    FPRINT Outfile,"}"
    FPRINT Outfile,""
    FPRINT Outfile,"BOOL Exist_A (char *szFilePath)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  WIN32_FIND_DATA W32FindData;"
    FPRINT Outfile,"  HANDLE rc;"
    FPRINT Outfile,"  rc = FindFirstFile(szFilePath, &W32FindData);"
    FPRINT Outfile,"  if(rc == INVALID_HANDLE_VALUE) return FALSE;"
    FPRINT Outfile,"  FindClose(rc);"
    FPRINT Outfile,"  return TRUE;"
    FPRINT Outfile,"}"
    FPRINT Outfile,""
    FPRINT Outfile,"BOOL Exist_B (char *szFilePath)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  DWORD ret;"
    FPRINT Outfile,"  ret = GetFileAttributes(szFilePath);"
    FPRINT Outfile,"  if (ret != 0xffffffff) return TRUE;"
    FPRINT Outfile,"  return FALSE;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Tally THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: tally"
    FPRINT Outfile,"int tally (char *szLine, char *szChar, int sensflag)"
    FPRINT Outfile,"{"
    FPRINT Outfile," if(!*szChar) return 0;"
    FPRINT Outfile," int mlen = strlen(szChar);"
    FPRINT Outfile," register int iCount = 0;"
    FPRINT Outfile," register char *p = (sensflag == 0 ? _strstr_(szLine, szChar) : _stristr_(szLine, szChar));"
    FPRINT Outfile," while (p)"
    FPRINT Outfile," {"
    FPRINT Outfile," iCount++;"
    FPRINT Outfile," p+=mlen;"
    FPRINT Outfile," p = (sensflag == 0 ? _strstr_(p, szChar) : _stristr_(p, szChar));"
    FPRINT Outfile," }"
    FPRINT Outfile," return iCount;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Timer THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: timer"
    FPRINT Outfile,"float timer (void)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  return (GetTickCount()/1000.0);"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Rnd THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: rnd"
    FPRINT Outfile,"float rnd (void)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  return (float)rand()/RAND_MAX;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Exp THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: Exp"
    FPRINT Outfile,"double Exp (double arg)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  return pow(2.718281828459045,arg);"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Asinh THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: asinh"
    ' redefined in Watcom
    FPRINT Outfile,"#if !defined( __WATCOM_CPLUSPLUS__ )"
    FPRINT Outfile,"double asinh (double x)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  return(log(x+sqrt(x*x+1)));"
    FPRINT Outfile,"}"
    FPRINT Outfile,"#endif"
    FPRINT Outfile,"\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Acosh THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: acosh"
    ' redefined in Watcom
    FPRINT Outfile,"#if !defined( __WATCOM_CPLUSPLUS__ )"
    FPRINT Outfile,"double acosh (double x)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  if(x<1) return 1e308;"
    FPRINT Outfile,"  return(log(x+sqrt(x*x-1)));"
    FPRINT Outfile,"}"
    FPRINT Outfile,"#endif"
    FPRINT Outfile,"\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Atanh THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: atanh"
    ' redefined in Watcom
    FPRINT Outfile,"#if !defined( __WATCOM_CPLUSPLUS__ )"
    FPRINT Outfile,"double atanh (double x)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  if(x<=-1) return 1e308;"
    FPRINT Outfile,"  if(x>= 1) return 1e308;"
    FPRINT Outfile,"  return(log((1+x)/(1-x))/2);"
    FPRINT Outfile,"}"
    FPRINT Outfile,"#endif"
    FPRINT Outfile,"\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Randomize THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: randomize"
    FPRINT Outfile,"void randomize (unsigned int seed)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  srand(seed);"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Abs THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: Abs"
    FPRINT Outfile,"double Abs (double a)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  if(a<0) return -a;"
    FPRINT Outfile,"  return  a;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Max THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: MAX"
    FPRINT Outfile,"double MAX (double a, double b)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  if(a>b)"
    FPRINT Outfile,"  return a;"
    FPRINT Outfile,"  return b;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Min THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: MIN"
    FPRINT Outfile,"double MIN (double a, double b)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  if(a<b)"
    FPRINT Outfile,"  return a;"
    FPRINT Outfile,"  return b;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Locate THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: locate"
    FPRINT Outfile,"void locate (int row,int col,int show,int shape)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  CONSOLE_CURSOR_INFO cci = {0};"
    FPRINT Outfile,"  cursor.X = col-1;"
    FPRINT Outfile,"  cursor.Y = row-1;"
    FPRINT Outfile,"  SetConsoleCursorPosition(hConsole,cursor);"
    FPRINT Outfile,"  cci.bVisible = show;"
    FPRINT Outfile,"  cci.dwSize   = shape;"
    FPRINT Outfile,"  SetConsoleCursorInfo(hConsole,&cci);"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Pos THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: Pos"
    FPRINT Outfile,"int Pos (void)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  HANDLE  hStdOut;"
    FPRINT Outfile,"  CONSOLE_SCREEN_BUFFER_INFO  csbi = {0};"
    FPRINT Outfile,"  hStdOut=GetStdHandle(STD_OUTPUT_HANDLE);"
    FPRINT Outfile,"  GetConsoleScreenBufferInfo(hStdOut,&csbi);"
    FPRINT Outfile,"  return csbi.dwCursorPosition.X+1;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Csrlin THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: Csrlin"
    FPRINT Outfile,"int Csrlin (void)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  HANDLE  hStdOut;"
    FPRINT Outfile,"  CONSOLE_SCREEN_BUFFER_INFO  csbi = {0};"
    FPRINT Outfile,"  hStdOut=GetStdHandle(STD_OUTPUT_HANDLE);"
    FPRINT Outfile,"  GetConsoleScreenBufferInfo(hStdOut,&csbi);"
    FPRINT Outfile,"  return csbi.dwCursorPosition.Y+1;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF



  IF Use_Color THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: color"
    FPRINT Outfile,"void color (int fg, int bg)"
    FPRINT Outfile,"{"
    FPRINT Outfile," SetConsoleTextAttribute (hConsole,fg+bg*16);"
    FPRINT Outfile,"  color_fg = fg;"
    FPRINT Outfile,"  color_bg = bg;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Panel THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: panel"
    FPRINT Outfile,"void panel (int x1,int y1,int x2,int y2,int fg,int bg,int chr,int flg)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"DWORD ret;"
    FPRINT Outfile,"register int attr = fg+bg*16,x,y;"
    FPRINT Outfile,"for(y=y1;y<=y2;y++)"
    FPRINT Outfile," {"
    FPRINT Outfile,"  for(x=x1;x<=x2;x++)"
    FPRINT Outfile,"   {"
    FPRINT Outfile,"     cursor.X = x - 1;"
    FPRINT Outfile,"     cursor.Y = y - 1;"
    FPRINT Outfile,"     if(flg)FillConsoleOutputCharacter(hConsole,chr,1,cursor,&ret);"
    FPRINT Outfile,"     FillConsoleOutputAttribute(hConsole,attr,1,cursor,&ret);"
    FPRINT Outfile,"   }"
    FPRINT Outfile," }"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Midstr THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: midstr"
    FPRINT Outfile,"void midstr (char *src, int st, int length, char *rep)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  int srclen = strlen(src);"
    FPRINT Outfile,"  if(st>srclen++ || st<1) return;"
    FPRINT Outfile,"  int replen = strlen(rep);"
    FPRINT Outfile,"  if(replen < length || length==-1) length=replen;"
    FPRINT Outfile,"  if((st+length) > srclen) length=srclen-st;"
    FPRINT Outfile,"  memcpy(&src[st-1],rep,length);"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Swap THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: swap"
    FPRINT Outfile,"void swap ( byte* A, byte* B, int length)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  byte t;"
    FPRINT Outfile,"  while(length--)"
    FPRINT Outfile,"  {"
    FPRINT Outfile,"    t = *A;"
    FPRINT Outfile,"    *(A++) = *B;"
    FPRINT Outfile,"    *(B++) = t;"
    FPRINT Outfile,"  }"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Like THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: like"
    FPRINT Outfile,"int like (char *raw, char *pat)"
    FPRINT Outfile,"{"
    FPRINT Outfile," char a, b, d;"
    FPRINT Outfile," char *r, *p;"
    FPRINT Outfile," int star = 0;"
    FPRINT Outfile," for(;;) {"
    FPRINT Outfile,"   if ((d = *pat++)==0) return (star || !*raw);"
    FPRINT Outfile,"   else if (d == '*') star = 1;"
    FPRINT Outfile,"   else if (d == '?') { if (!*raw++) return 0; }"
    FPRINT Outfile,"   else break;"
    FPRINT Outfile," }"
    FPRINT Outfile," b = d;"
    FPRINT Outfile," do if ((a = *raw++) == b) {"
    FPRINT Outfile,"   r = raw;"
    FPRINT Outfile,"   p = pat;"
    FPRINT Outfile,"   do {"
    FPRINT Outfile,"     if ((d = *p++) == '*')"
    FPRINT Outfile,"       if (like(r, p - 1)) return 1;"
    FPRINT Outfile,"       else break;"
    FPRINT Outfile,"     else if (!d)"
    FPRINT Outfile,"       if (!*r) return 1;"
    FPRINT Outfile,"       else break;"
    FPRINT Outfile,"   } while (*r++ == d || d == '?');"
    FPRINT Outfile," } while (star && a);"
    FPRINT Outfile," return 0;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Lof THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: lof"
    FPRINT Outfile,"DWORD lof (char *FileName)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  WIN32_FIND_DATA W32FD;"
    FPRINT Outfile,"  HANDLE hFile;"
    FPRINT Outfile,"  int FSize;"
    FPRINT Outfile,"  if(strlen(FileName)==0) return 0;"
    FPRINT Outfile,"  hFile=FindFirstFile(FileName,&W32FD);"
    FPRINT Outfile,"  if(hFile!=INVALID_HANDLE_VALUE)"
    FPRINT Outfile,"   {"
    FPRINT Outfile,"     FSize=W32FD.nFileSizeLow;"
    FPRINT Outfile,"     FindClose(hFile);"
    FPRINT Outfile,"     return FSize;"
    FPRINT Outfile,"   }"
    FPRINT Outfile,"  return 0;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Iif THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: iif"
    FPRINT Outfile,"double iif (BOOL cond, double tp, double fp)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  if(cond) return tp;"
    FPRINT Outfile,"  return fp;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_sziif THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: sziif"
    FPRINT Outfile,"char * sziif (BOOL i, char *a, char *b)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  if(i) return a;"
    FPRINT Outfile,"  return b;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_DynamicA THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: CreateArr"
    FPRINT Outfile,"void *CreateArr(void *a, int elem_size, int update, int num_dims, ... )"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  va_list ap;"
    FPRINT Outfile,"  void   *RetPtr;"
    FPRINT Outfile,""
    FPRINT Outfile,"  va_start(ap, num_dims);"
    FPRINT Outfile,"  RetPtr = CreateArr_internal(a, elem_size, update, num_dims, ap);"
    FPRINT Outfile,"  va_end(ap);"
    FPRINT Outfile,"  return (RetPtr);"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "

    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: CreateArr_internal"
    FPRINT Outfile,"void *CreateArr_internal(void *a, int elem_size, int update, int num_dims, va_list ap)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  size_t s, s1, s2;"
    FPRINT Outfile,"  void **vp;"
    FPRINT Outfile,"  va_list marker;"
    FPRINT Outfile," "
    FPRINT Outfile,"#ifdef va_copy"
    FPRINT Outfile,"  va_copy(marker, ap);"
    FPRINT Outfile,"#else"
    FPRINT Outfile,"  marker = ap;"
    FPRINT Outfile,"#endif"
    FPRINT Outfile,"  s = va_arg(marker, size_t);"
    FPRINT Outfile,"  s2 = s + 2;"
    FPRINT Outfile,"  if(num_dims == 1)"
    FPRINT Outfile,"        {"
    FPRINT Outfile,"    if(update && a)"
    FPRINT Outfile,"        a=realloc(a,s2*elem_size);"
    FPRINT Outfile,"     else"
    FPRINT Outfile,"        a=calloc(s2,elem_size);"
    FPRINT Outfile,"    return a;"
    FPRINT Outfile,"   }"
    FPRINT Outfile," else"
    FPRINT Outfile,"    if(update && a)"
    FPRINT Outfile,"     {"
    FPRINT Outfile,"     s1 = 0;"
    FPRINT Outfile,"     vp = (void**)a;"
    FPRINT Outfile,"     while(*vp && s1 <= s)"
    FPRINT Outfile,"       {"
    FPRINT Outfile,"       vp++;"
    FPRINT Outfile,"       s1++;"
    FPRINT Outfile,"       }"
    FPRINT Outfile,"     if(s1 > s)"
    FPRINT Outfile,"       {"
    FPRINT Outfile,"       vp--;"
    FPRINT Outfile,"        DestroyArr(vp, num_dims, 0);"
    FPRINT Outfile,"       }"
    FPRINT Outfile,"      a=realloc(a,s2*sizeof(int));"
    FPRINT Outfile,"     s1 = 0;"
    FPRINT Outfile,"     vp = (void**)a;"
    FPRINT Outfile,"     while(*vp && s1 <= s)"
    FPRINT Outfile,"       {"
    FPRINT Outfile,"       vp++;"
    FPRINT Outfile,"       s1++;"
    FPRINT Outfile,"       }"
    FPRINT Outfile,"     while(s1 < s2)"
    FPRINT Outfile,"       {"
    FPRINT Outfile,"       *(((int *)vp)) = 0;"
    FPRINT Outfile,"       vp++;"
    FPRINT Outfile,"       s1++;"
    FPRINT Outfile,"       }"
    FPRINT Outfile,"     }"
    FPRINT Outfile,"   else"
    FPRINT Outfile,"      a=calloc(s2*sizeof(int),1);"
    FPRINT Outfile," vp = (void**)a;"
    FPRINT Outfile," if(--num_dims > 0)"
    FPRINT Outfile," {"
    FPRINT Outfile," for(s1 = 0; s1 < s; s1++)"
    FPRINT Outfile,"   {"
    FPRINT Outfile,"     vp[s1] = CreateArr_internal(vp[s1], elem_size, update, num_dims, marker);"
    FPRINT Outfile,"   }"
    FPRINT Outfile," }"
    FPRINT Outfile," return a;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "

    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: DestroyArr"
    FPRINT Outfile,"void DestroyArr (void** a,int num_dims, int top_free)"
    FPRINT Outfile,"{"
    FPRINT Outfile," int i = 0;"
    FPRINT Outfile," static int s = 0;"
    FPRINT Outfile," if(num_dims == 1)"
    FPRINT Outfile,"   {"
    FPRINT Outfile,"   free(a);"
    FPRINT Outfile,"   return;"
    FPRINT Outfile,"   }"
    FPRINT Outfile," s++;"
    FPRINT Outfile," num_dims--;  "
    FPRINT Outfile," while(a[i])"
    FPRINT Outfile,"     {"
    FPRINT Outfile,"   DestroyArr((void**)a[i], num_dims, top_free);"
    FPRINT Outfile,"   if(num_dims > 1)"
    FPRINT Outfile,"         free(a[i]);"
    FPRINT Outfile,"       a[i++]=NULL;"
    FPRINT Outfile,"       }"
    FPRINT Outfile," s--;"
    FPRINT Outfile," if(s == 0 && top_free)"
    FPRINT Outfile,"   free(a);"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF

  IF Use_Idxqsort THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: IdxCompare"
    FPRINT Outfile,"int IdxCompare (const void *one, const void *two)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  int *ptr1 = (int *)(one);"
    FPRINT Outfile,"  int *ptr2 = (int *)(two);"
    FPRINT Outfile,"  return stricmp (pppStr[Key][*ptr1],pppStr[Key][*ptr2]);"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF

  IF Use_IdxqsortSt THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: IdxCompareSt"
    FPRINT Outfile,"int IdxCompareSt (const void* one, const void* two)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"#define compare1 cmp1+(StructSize * (*(UINT *)(one)))"
    FPRINT Outfile,"#define compare2 cmp1+(StructSize * (*(UINT *)(two)))"
    FPRINT Outfile,""
    FPRINT Outfile," if (Key==0)"      'String
    FPRINT Outfile,"   return  stricmp(compare1, compare2);"
    FPRINT Outfile,""
    FPRINT Outfile," if (Key==1)"      'Integer
    FPRINT Outfile," {"
    FPRINT Outfile,"  if (*(int*)(compare1) < *(int*)(compare2)) return -1;"
    FPRINT Outfile,"  if (*(int*)(compare1) > *(int*)(compare2)) return 1;"
    FPRINT Outfile,"  return 0;"
    FPRINT Outfile," }"
    FPRINT Outfile,""
    FPRINT Outfile," if (Key==2)"      'Double
    FPRINT Outfile," {"
    FPRINT Outfile,"  if (*(double*)(compare1) < *(double*)(compare2)) return -1;"
    FPRINT Outfile,"  if (*(double*)(compare1) > *(double*)(compare2)) return 1;"
    FPRINT Outfile,"  return 0;"
    FPRINT Outfile," }"
    FPRINT Outfile,""
    FPRINT Outfile," if (Key==3)"      'Unsigned integer
    FPRINT Outfile," {"
    FPRINT Outfile,"  if (*(UINT*)(compare1) < *(UINT*)(compare2)) return -1;"
    FPRINT Outfile,"  if (*(UINT*)(compare1) > *(UINT*)(compare2)) return 1;"
    FPRINT Outfile," }"
    FPRINT Outfile,"return 0;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF

  IF Use_PtrqsortSt THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: PtrCompareSt"
    FPRINT Outfile,"int PtrCompareSt (const void* one, const void* two)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"#define pcompare1 ((char*)(one)+OffSet)"
    FPRINT Outfile,"#define pcompare2 ((char*)(two)+OffSet)"
    FPRINT Outfile,""
    FPRINT Outfile," if (Key==0)"
    FPRINT Outfile,"   return  stricmp(pcompare1, pcompare2);"
    FPRINT Outfile,""
    FPRINT Outfile," if (Key==1)"
    FPRINT Outfile," {"
    FPRINT Outfile,"  if (*(int*)(pcompare1) < *(int*)(pcompare2)) return -1;"
    FPRINT Outfile,"  if (*(int*)(pcompare1) > *(int*)(pcompare2)) return 1;"
    FPRINT Outfile,"  return 0;"
    FPRINT Outfile," }"
    FPRINT Outfile,""
    FPRINT Outfile," if (Key==2)"
    FPRINT Outfile," {"
    FPRINT Outfile,"  if (*(double*)(pcompare1) < *(double*)(pcompare2)) return -1;"
    FPRINT Outfile,"  if (*(double*)(pcompare1) > *(double*)(pcompare2)) return 1;"
    FPRINT Outfile,"  return 0;"
    FPRINT Outfile," }"
    FPRINT Outfile,""
    FPRINT Outfile," if (Key==3)"
    FPRINT Outfile," {"
    FPRINT Outfile,"  if (*(UINT*)(pcompare1) < *(UINT*)(pcompare2)) return -1;"
    FPRINT Outfile,"  if (*(UINT*)(pcompare1) > *(UINT*)(pcompare2)) return 1;"
    FPRINT Outfile," }"
    FPRINT Outfile,"return 0;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF

  IF Use_Strqsorta THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: StrCompareA"
    FPRINT Outfile,"int StrCompareA (const void *arg1, const void *arg2)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  char *v1 = (char*) arg1;"
    FPRINT Outfile,"  char *v2 = (char*) arg2;"
    FPRINT Outfile,"  return stricmp (v1,v2);"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Strqsortd THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: StrCompareD"
    FPRINT Outfile,"int StrCompareD (const void *arg1, const void *arg2)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  char *v1 = (char*) arg1;"
    FPRINT Outfile,"  char *v2 = (char*) arg2;"
    FPRINT Outfile,"  return stricmp (v2,v1);"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_DynStrqsorta THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: DynStrCompareA"
    FPRINT Outfile,"int DynStrCompareA (const void *arg1, const void *arg2)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  char *v1 = *(char **) arg1;"
    FPRINT Outfile,"  char *v2 = *(char **) arg2;"
    FPRINT Outfile,"  return stricmp(v1, v2);"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_DynStrqsortd THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: DynStrCompareD"
    FPRINT Outfile,"int DynStrCompareD (const void *arg1, const void *arg2)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  char *v1 = *(char **) arg1;"
    FPRINT Outfile,"  char *v2 = *(char **) arg2;"
    FPRINT Outfile,"  return stricmp(v2, v1);"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Numqsortaint THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: NumCompareAint"
    FPRINT Outfile,"int NumCompareAint (const void *one, const void *two)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  int *ptr1 = (int *)(one);"
    FPRINT Outfile,"  int *ptr2 = (int *)(two);"
    FPRINT Outfile,"  if (*ptr1 < *ptr2) return -1;"
    FPRINT Outfile,"  else if (*ptr1 == *ptr2) return 0;"
    FPRINT Outfile,"  else return 1;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Numqsortdint THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: NumCompareDint"
    FPRINT Outfile,"int NumCompareDint (const void *one, const void *two)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  int *ptr1 = (int *)(one);"
    FPRINT Outfile,"  int *ptr2 = (int *)(two);"
    FPRINT Outfile,"  if (*ptr1 > *ptr2) return -1;"
    FPRINT Outfile,"  else if (*ptr1 == *ptr2) return 0;"
    FPRINT Outfile,"  else return 1;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Numqsortafloat THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: NumCompareAfloat"
    FPRINT Outfile,"int NumCompareAfloat (const void *one, const void *two)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  float *ptr1 = (float *)(one);"
    FPRINT Outfile,"  float *ptr2 = (float *)(two);"
    FPRINT Outfile,"  if (*ptr1 < *ptr2) return -1;"
    FPRINT Outfile,"  else if (*ptr1 == *ptr2) return 0;"
    FPRINT Outfile,"  else return 1;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Numqsortdfloat THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: NumCompareDfloat"
    FPRINT Outfile,"int NumCompareDfloat (const void *one, const void *two)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  float *ptr1 = (float *)(one);"
    FPRINT Outfile,"  float *ptr2 = (float *)(two);"
    FPRINT Outfile,"  if (*ptr1 > *ptr2) return -1;"
    FPRINT Outfile,"  else if (*ptr1 == *ptr2) return 0;"
    FPRINT Outfile,"  else return 1;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Numqsortadouble THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: NumCompareAdouble"
    FPRINT Outfile,"int NumCompareAdouble (const void *one, const void *two)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  double *ptr1 = (double *)(one);"
    FPRINT Outfile,"  double *ptr2 = (double *)(two);"
    FPRINT Outfile,"  if (*ptr1 < *ptr2) return -1;"
    FPRINT Outfile,"  else if (*ptr1 == *ptr2) return 0;"
    FPRINT Outfile,"  else return 1;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Numqsortddouble THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: NumCompareDdouble"
    FPRINT Outfile,"int NumCompareDdouble (const void *one, const void *two)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  double *ptr1 = (double *)(one);"
    FPRINT Outfile,"  double *ptr2 = (double *)(two);"
    FPRINT Outfile,"  if (*ptr1 > *ptr2) return -1;"
    FPRINT Outfile,"  else if (*ptr1 == *ptr2) return 0;"
    FPRINT Outfile,"  else return 1;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_FillArray THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: fillarray"
    FPRINT Outfile,"int fillarray(char *input, int ArrayType, int MaxCnt, void *Array)"
    FPRINT Outfile,"{"
    FPRINT Outfile," if(MaxCnt < 1) return -1;"
    FPRINT Outfile," int c = 0, cnt=-1, cnt2;"
    FPRINT Outfile," char A[2048];"
    FPRINT Outfile," int    *intptr    = (int *)Array;"
    FPRINT Outfile," float  *floatptr  = (float *)Array;"
    FPRINT Outfile," double *doubleptr = (double *)Array;"
    FPRINT Outfile," long double *ldoubleptr = (long double *)Array;"
    FPRINT Outfile," for(;;)"
    FPRINT Outfile,"  {"
    FPRINT Outfile,"     cnt2=0;"
    FPRINT Outfile,"     while(input[++cnt]!=',')"
    FPRINT Outfile,"      {"
    FPRINT Outfile,"        if(input[cnt]==0) break;"
    FPRINT Outfile,"        A[cnt2++]=input[cnt];"
    FPRINT Outfile,"      }"
    FPRINT Outfile,"     A[cnt2]=0;"
    FPRINT Outfile,"     if(cnt2==0||c==MaxCnt) break;"
    FPRINT Outfile,"     "
    FPRINT Outfile,"     if(ArrayType==2)"
    FPRINT Outfile,"       intptr[c++] = atoi(A);"
    FPRINT Outfile,"     else if(ArrayType==3)"
    FPRINT Outfile,"       floatptr[c++] = atof(A);"
    FPRINT Outfile,"     else if(ArrayType==4)"
    FPRINT Outfile,"       doubleptr[c++] = atof(A);"
    FPRINT Outfile,"     else if(ArrayType==5)"
    FPRINT Outfile,"       ldoubleptr[c++] = atof(A);"
    FPRINT Outfile,""
    FPRINT Outfile,"     if(input[cnt]==0) break;"
    FPRINT Outfile,"  } "
    FPRINT Outfile," return (c-1);"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Loc THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: loc"
    FPRINT Outfile,"int loc(FILE *fp, int fplen)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  fpos_t t;"
    FPRINT Outfile,"  fgetpos(fp, &t);"
    FPRINT Outfile,"#if defined( __POCC__ )"
    FPRINT Outfile,"  t.off %= fplen;"
    FPRINT Outfile,"  return (int)t.off;"
    FPRINT Outfile,"#else"
    FPRINT Outfile,"  t %= fplen;"
    FPRINT Outfile,"  return (int)t;"
    FPRINT Outfile,"#endif"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Rec THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: rec"
    FPRINT Outfile,"int rec(FILE *fp, int fplen)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  fpos_t t;"
    FPRINT Outfile,"  fgetpos(fp, &t);"
    FPRINT Outfile,"#if defined( __POCC__ )"
    FPRINT Outfile,"  t.off /= fplen;"
    FPRINT Outfile,"  return (int)++t.off;"
    FPRINT Outfile,"#else"
    FPRINT Outfile,"  t /= fplen;"
    FPRINT Outfile,"  return (int)++t;"
    FPRINT Outfile,"#endif"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_RecCount THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: reccont"
    FPRINT Outfile,"int reccount(FILE *fp, int fplen)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  fpos_t t;"
    FPRINT Outfile,"  fseek(fp,0,SEEK_END);"
    FPRINT Outfile,"  fgetpos(fp, &t);"
    FPRINT Outfile,"#if defined( __POCC__ )"
    FPRINT Outfile,"  t.off /= fplen;"
    FPRINT Outfile,"  return (int)t.off;"
    FPRINT Outfile,"#else"
    FPRINT Outfile,"  t /= fplen;"
    FPRINT Outfile,"  return (int)t;"
    FPRINT Outfile,"#endif"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Scan THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: scan"
    FPRINT Outfile,"int scan(char *input, char *format, ... )"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  register int c,d ;"
    FPRINT Outfile,"  char     *s_;"
    FPRINT Outfile,"  int      *intptr;"
    FPRINT Outfile,"  float    *floatptr;"
    FPRINT Outfile,"  double   *doubleptr;"
    FPRINT Outfile,"  char     A[50][2048];"
    FPRINT Outfile,"  va_list  marker;"
    FPRINT Outfile,"  c = 0;"
    FPRINT Outfile,"  d = Split(A,input,"; ENC$(",") ; ");"
    FPRINT Outfile,"  va_start(marker, format); //Initialize arguments"
    FPRINT Outfile,"  while(d && *format)"
    FPRINT Outfile,"   {"
    FPRINT Outfile,"     if(*format == '%') format++;"
    FPRINT Outfile,"     if(*format == 's')"
    FPRINT Outfile,"       {"
    FPRINT Outfile,"         s_ = va_arg(marker, char *);"
    FPRINT Outfile,"         strcpy(s_, A[c]);"
    FPRINT Outfile,"         c++;"
    FPRINT Outfile,"         d--;"
    FPRINT Outfile,"       }"
    FPRINT Outfile,"  if(*format == 'd')"
    FPRINT Outfile,"    {"
    FPRINT Outfile,"      intptr = va_arg(marker, int *);"
    FPRINT Outfile,"      *intptr = atoi(A[c]);"
    FPRINT Outfile,"      c++;"
    FPRINT Outfile,"      d--;"
    FPRINT Outfile,"    }"
    FPRINT Outfile,"  if(*format == 'g')"
    FPRINT Outfile,"    {"
    FPRINT Outfile,"      floatptr = va_arg(marker, float *);"
    FPRINT Outfile,"      *floatptr = atof(A[c]);"
    FPRINT Outfile,"      c++;"
    FPRINT Outfile,"      d--;"
    FPRINT Outfile,"    }"
    FPRINT Outfile," if(*format == 'l')"
    FPRINT Outfile,"    {"
    FPRINT Outfile,"      format++;"
    FPRINT Outfile,"      doubleptr = va_arg(marker, double *);"
    FPRINT Outfile,"      *doubleptr = atof(A[c]);"
    FPRINT Outfile,"      c++;"
    FPRINT Outfile,"      d--;"
    FPRINT Outfile,"     }"
    FPRINT Outfile,"  format++;"
    FPRINT Outfile,"   }"
    FPRINT Outfile,"  va_end(marker);              // Reset variable arguments"
    FPRINT Outfile,"  if(d) return(1);             // More data than variables"
    FPRINT Outfile,"  if(*format == 0) return(0);  // OK"
    FPRINT Outfile,"  return(-1);                  // More variables than data"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Split THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: Split"
    FPRINT Outfile,"int Split (char Buf[][2048], char *T, char *Delim, int Flg)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  int  Begin = 0;"
    FPRINT Outfile,"  int  Count = 0;"
    FPRINT Outfile,"  int  Quote = 0;"
    FPRINT Outfile,"  int  Index,i;"
    FPRINT Outfile,"  int  lenT  = strlen(T);"
    FPRINT Outfile,"  char Chr34[2]={34,0};"
    FPRINT Outfile,"  for(Index=1;Index<=lenT;Index++)"
    FPRINT Outfile,"    {"
    FPRINT Outfile,"      if(instr(Delim,mid(T,Index,1))&&!Quote)"
    FPRINT Outfile,"        {"
    FPRINT Outfile,"          strcpy(Buf[Count],(char*)mid(T,Begin,Index-Begin));"
    FPRINT Outfile,"          if ((Flg & 2) == 0)  // 0 if old version"
    FPRINT Outfile,"           Count++;"
    FPRINT Outfile,"          else"
    FPRINT Outfile,"           if (Buf[Count][0] != 0) Count++;"
    FPRINT Outfile,"           Begin=0;"
    FPRINT Outfile,"           if((Flg & 1) == 1)   // 1 if true"
    FPRINT Outfile,"              strcpy(Buf[Count++],(char*)mid(T,Index,1));"
    FPRINT Outfile,"        }"
    FPRINT Outfile,"   else"
    FPRINT Outfile,"     {"
    FPRINT Outfile,"       if(strcmp(mid(T,Index,1),Chr34)==0) Quote=!Quote;"
    FPRINT Outfile,"       if(Begin==0) Begin=Index;"
    FPRINT Outfile,"     }"
    FPRINT Outfile,"   }"
    FPRINT Outfile,"  if(Begin)"
    FPRINT Outfile,"     strcpy(Buf[Count++],(char*)mid(T,Begin,Index-Begin));"
    FPRINT Outfile,"  if((Flg & 1) == 0)   // 0 if false"
    FPRINT Outfile,"      for(i=0;i<Count;i++) strcpy(Buf[i],(char*)RemoveStr(Buf[i],Chr34));"
    FPRINT Outfile,"  return Count;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_DSplit THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: DSplit"
    FPRINT Outfile,"int DSplit (LPSTR *Buf, char *T, char *Delim, int Flg)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  int  Begin=0;"
    FPRINT Outfile,"  int  Count=0;"
    FPRINT Outfile,"  int  Quote=0;"
    FPRINT Outfile,"  int  Index=0;"
    FPRINT Outfile,"  int  lenT  = strlen(T);"
    FPRINT Outfile,"  char Chr34[2]={34,0};"
    FPRINT Outfile,"  for(Index=1;Index<=lenT;Index++)"
    FPRINT Outfile,"   {"
    FPRINT Outfile,"     if(instr(Delim,mid(T,Index,1))&&!Quote)"
    FPRINT Outfile,"       {"
    FPRINT Outfile,"         strcpy(Buf[Count],(char*)mid(T,Begin,Index-Begin));"
    FPRINT Outfile,"         if ((Flg & 2) == 0)  // 0 if old version"
    FPRINT Outfile,"         Count++;"
    FPRINT Outfile,"     else"
    FPRINT Outfile,"         if (Buf[Count][0] != 0) Count++;"
    FPRINT Outfile,"         Begin=0;"
    FPRINT Outfile,"         if((Flg & 1) == 1)   // 1 if true"
    FPRINT Outfile,"             strcpy(Buf[Count++],(char*)mid(T,Index,1));"
    FPRINT Outfile,"       }"
    FPRINT Outfile,"    else"
    FPRINT Outfile,"      {"
    FPRINT Outfile,"        if(strcmp(mid(T,Index,1),Chr34)==0) Quote=!Quote;"
    FPRINT Outfile,"        if(Begin==0)  Begin=Index;"
    FPRINT Outfile,"      }"
    FPRINT Outfile,"   }"
    FPRINT Outfile,"  if(Begin) strcpy(Buf[Count++],(char*)mid(T,Begin,Index-Begin));"
    FPRINT Outfile,"  if((Flg & 1) == 0)   // 0 if false"
    FPRINT Outfile,"     for(Index=0;Index<Count;Index++) strcpy(Buf[Index],(char*)RemoveStr(Buf[Index],Chr34));"
    FPRINT Outfile,"  return Count;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Bin2dec THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: Bin2Dec"
    FPRINT Outfile,"int Bin2Dec (char *cptr)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  register int i, j = 0;"
    FPRINT Outfile,"  while(cptr && *cptr && strchr(";ENC$("01");", *cptr))"
    FPRINT Outfile,"  {"
    FPRINT Outfile,"    i = *cptr++ - '0';"
    FPRINT Outfile,"    j <<= 1;"
    FPRINT Outfile,"    j |= (i & 0x01);"
    FPRINT Outfile,"  }"
    FPRINT Outfile," return(j);"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Hex2Dec THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: Hex2Dec"
    FPRINT Outfile,"int Hex2Dec (char *szInput)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  char   ch;"
    FPRINT Outfile,"  char  *dwLen   = szInput+strlen(szInput);"
    FPRINT Outfile,"  char  *LowCase = MakeLCaseTbl();"
    FPRINT Outfile,"  DWORD  dwOut   = 0;"
    FPRINT Outfile,"  while(*szInput)"
    FPRINT Outfile,"    {"
    FPRINT Outfile,"      ch = LowCase[(unsigned char)*szInput++];"
    FPRINT Outfile,"      if((ch >= 'a' && ch <= 'f')  || (ch >= '0' && ch <= '9'))"
    FPRINT Outfile,"        dwOut |=((int)ch - (ch>'9' ? 'a'-10 : '0')) << ((dwLen - szInput) << 2);"
    FPRINT Outfile,"    }"
    FPRINT Outfile,"  return dwOut;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Verify THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: Verify"
    FPRINT Outfile,"int Verify (char *Src, char *Allowed)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  int i, j;"
    FPRINT Outfile,"  for (i=1; i<=strlen(Src); i++)"
    FPRINT Outfile,"    {"
    FPRINT Outfile,"      j=VerifyInstr(Allowed,mid(Src,i,1));"
    FPRINT Outfile,"      if (!j) return 0;"
    FPRINT Outfile,"    }"
    FPRINT Outfile,"  return TRUE;"
    FPRINT Outfile,"}\n\n"
    FPRINT Outfile,"int VerifyInstr(char* mane,char* match,int offset)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  char *s;"
    FPRINT Outfile,"  if (!mane || !match || !*match || offset>(int)strlen(mane)) return 0;"
    FPRINT Outfile,"  s = strstr (offset>0 ? mane+offset-1 : mane,match);"
    FPRINT Outfile,"  return s ? (int)(s-mane)+1 : 0;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Retain THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: Retain"
    FPRINT Outfile,"char *Retain (char *Text, char *ValidChars)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  char *BCX_RetStr=BCX_TmpStr(strlen(Text));"
    FPRINT Outfile,"  char *temp=BCX_RetStr;"
    FPRINT Outfile,"  while(*Text)"
    FPRINT Outfile,"    {"
    FPRINT Outfile,"      if(strchr(ValidChars,*Text)) *(temp++) = *Text;"
    FPRINT Outfile,"      Text++;"
    FPRINT Outfile,"    }"
    FPRINT Outfile,"  return BCX_RetStr;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_LoadFile THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: LoadFile"
    FPRINT Outfile,"char* LoadFile (char *N)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  FILE* FP1;"
    FPRINT Outfile,"  char* BCX_RetStr;"
    FPRINT Outfile,"  if(Exist(N))"
    FPRINT Outfile,"    {"
    FPRINT Outfile,"      BCX_RetStr=BCX_TmpStr(lof(N));"
    FPRINT Outfile,"      if((FP1=fopen(N,", ENC$("rb"), "))!=0)"
    FPRINT Outfile,"      GET(FP1,BCX_RetStr,lof(N));"
    FPRINT Outfile,"      fclose(FP1);"
    FPRINT Outfile,"      return BCX_RetStr;"
    FPRINT Outfile,"    }"
    FPRINT Outfile,"  else"
    FPRINT Outfile,"    {"
    FPRINT Outfile,"      BCX_RetStr=BCX_TmpStr(64);"
    FPRINT Outfile,"      return strcpy(BCX_RetStr,", ENC$("File Not Found"), ");"
    FPRINT Outfile,"    }"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Textmode THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: TextMode"
    FPRINT Outfile,"int TextMode (int Y)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  HANDLE hConsole = GetStdHandle(STD_OUTPUT_HANDLE);"
    FPRINT Outfile,"  COORD  Coord;"
    FPRINT Outfile,"  Coord.X = 80;"
    FPRINT Outfile,"  Coord.Y = Y;"
    FPRINT Outfile,"  return SetConsoleScreenBufferSize(hConsole,Coord);"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Msgbox THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: MsgBox"
    FPRINT Outfile,"int MsgBox (char *Msg, char *Title, int Num)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  return MessageBox(GetActiveWindow(),Msg,Title,Num);"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_PeekStr THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: peekstr"
    FPRINT Outfile,"char *peekstr (LPVOID Src, int Count)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  char *Des=BCX_TmpStr(Count);"
    FPRINT Outfile,"  memmove(Des,Src,Count);"
    FPRINT Outfile,"  return Des;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_QBColor THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: qbcolor"
    FPRINT Outfile,"int qbcolor (int N)"
    FPRINT Outfile,"{"
    FPRINT Outfile," switch (N)"
    FPRINT Outfile," {"
    FPRINT Outfile," case  0 : return RGB(0,0,0);"
    FPRINT Outfile," case  1 : return RGB(0,0,128);"
    FPRINT Outfile," case  2 : return RGB(0,128,0);"
    FPRINT Outfile," case  3 : return RGB(0,128,128);"
    FPRINT Outfile," case  4 : return RGB(196,0,0);"
    FPRINT Outfile," case  5 : return RGB(128,0,128);"
    FPRINT Outfile," case  6 : return RGB(128,64,0);"
    FPRINT Outfile," case  7 : return RGB(196,196,196);"
    FPRINT Outfile," case  8 : return RGB(128,128,128);"
    FPRINT Outfile," case  9 : return RGB(0,0, 255);"
    FPRINT Outfile," case 10 : return RGB(0,255,0);"
    FPRINT Outfile," case 11 : return RGB(0,255,255);"
    FPRINT Outfile," case 12 : return RGB(255,0,0);"
    FPRINT Outfile," case 13 : return RGB(255,0,255);"
    FPRINT Outfile," case 14 : return RGB(255,255,0);"
    FPRINT Outfile," case 15 : return RGB(255,255,255);"
    FPRINT Outfile," case 16 : return RGB(164,164,164);"
    FPRINT Outfile," case 17 : return RGB(128,160,255);"
    FPRINT Outfile," case 18 : return RGB(160,255,160);"
    FPRINT Outfile," case 19 : return RGB(160,255,255);"
    FPRINT Outfile," case 20 : return RGB(255,160,160);"
    FPRINT Outfile," case 21 : return RGB(255,160,255);"
    FPRINT Outfile," case 22 : return RGB(255,255,160);"
    FPRINT Outfile," case 23 : return RGB(212,212,212);"
    FPRINT Outfile," case 24 : return RGB(180,180,180);"
    FPRINT Outfile," case 25 : return RGB(188,220,255);"
    FPRINT Outfile," case 26 : return RGB(220,255,220);"
    FPRINT Outfile," case 27 : return RGB(220,255,255);"
    FPRINT Outfile," case 28 : return RGB(255,220,220);"
    FPRINT Outfile," case 29 : return RGB(255,220,255);"
    FPRINT Outfile," case 30 : return RGB(255,255,220);"
    FPRINT Outfile," case 31 : return RGB(228,228,228);"
    FPRINT Outfile," }"
    FPRINT Outfile,"return 0;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF

  IF Use_Cvi THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: CVI"
    FPRINT Outfile,"short CVI (char *s)"
    FPRINT Outfile,"{"
    FPRINT Outfile," return ((short*)s)[0];"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF

  IF Use_Mki THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: MKI"
    FPRINT Outfile,"char *MKI (short cvt)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  static char temp[3];"
    FPRINT Outfile,"  return (char *)memmove(temp,&cvt,2);"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF

  IF Use_Cvl THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: CVL"
    FPRINT Outfile,"long CVL (char *s)"
    FPRINT Outfile,"{"
    FPRINT Outfile," return ((long*)s)[0];"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF

  IF Use_Mkl THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: MKL"
    FPRINT Outfile,"char *MKL (int cvt)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  static char temp[5];"
    FPRINT Outfile,"  return (char *) memmove(temp,&cvt,4);"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF

  IF Use_Cvs THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: CVS"
    FPRINT Outfile,"float CVS (char *s)"
    FPRINT Outfile,"{"
    FPRINT Outfile," return ((float*)s)[0];"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF

  IF Use_Mks THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: MKS"
    FPRINT Outfile,"char *MKS (float cvt)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  static char temp[5];"
    FPRINT Outfile,"  return (char *) memmove(temp,&cvt,4);"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF

  IF Use_Cvd THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: CVD"
    FPRINT Outfile,"double CVD (char *s)"
    FPRINT Outfile,"{"
    FPRINT Outfile," return ((double*)s)[0];"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF

  IF Use_Cvld THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: CVLD"
    FPRINT Outfile,"long double CVLD (char *s)"
    FPRINT Outfile,"{"
    FPRINT Outfile," return ((long double*)s)[0];"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF

  IF Use_Mkd THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: MKD"
    FPRINT Outfile,"char *MKD (double cvt)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  static char temp[9];"
    FPRINT Outfile,"  return (char *) memmove(temp,&cvt,8);"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF

  IF Use_Mkld THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: MKLD"
    FPRINT Outfile,"char *MKLD (long double cvt)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  static char temp[11];"
    FPRINT Outfile,"  return (char *) memmove(temp,&cvt,10);"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF


  IF Use_Dynacall OR Use_DynacallA THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: BCX_LoadDll"
    FPRINT Outfile,"HINSTANCE BCX_LoadDll (char *DllName)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  static int DllCnt;"
    FPRINT Outfile,"  static int RegUnload;"
    FPRINT Outfile,"  if (!RegUnload) RegUnload=!atexit(BCX_UnloadDll);"
    FPRINT Outfile,"  DllCnt=(DllCnt+1) & 255;"
    FPRINT Outfile,"  FreeLibrary(BCX_DllStore[DllCnt]);"
    FPRINT Outfile,"  return BCX_DllStore[DllCnt]=LoadLibrary(DllName);"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "

    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: BCX_UnLoadDll"
    FPRINT Outfile,"void BCX_UnloadDll (void)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  register int i;"
    FPRINT Outfile,"  for(i=255;i>=0;i--)"
    FPRINT Outfile,"    {"
    FPRINT Outfile,"      FreeLibrary(BCX_DllStore[i]);"
    FPRINT Outfile,"    }"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "

    IF Use_Dynacall THEN
      IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: BCX_DynaCallB"
      FPRINT Outfile,"int BCX_DynaCallB (char *FuncName, char *DllName, int nArgs, ...)"
      FPRINT Outfile,"{"
      FPRINT Outfile,"  register int i;"
      FPRINT Outfile,"  HINSTANCE  hInst=0;"
      FPRINT Outfile,"  DYNACALL1 lpAddr=0;"
      FPRINT Outfile,"  int arg, result =0;"
      FPRINT Outfile,"  int *argtable = (int*)malloc(nArgs * sizeof *argtable);"
      FPRINT Outfile,"  char buff[256];"
      FPRINT Outfile,"  va_list ap;\n"
      FPRINT Outfile,"  hInst=GetModuleHandle(DllName);"
      FPRINT Outfile,"  if(hInst==NULL)"
      FPRINT Outfile,"  {"
      FPRINT Outfile,"      hInst=BCX_LoadDll(DllName);"
      FPRINT Outfile,"  }"
      FPRINT Outfile,"  lpAddr=(DYNACALL1)GetProcAddress(hInst,FuncName);"
      FPRINT Outfile,"  if(lpAddr==NULL)"
      FPRINT Outfile,"    {"
      FPRINT Outfile,"      sprintf(buff,",S2$,",FuncName,",DQ$,"A",DQ$,");"
      FPRINT Outfile,"      lpAddr=(DYNACALL1)GetProcAddress(hInst,buff);"
      FPRINT Outfile,"    }"
      FPRINT Outfile,"  if(lpAddr==NULL)"
      FPRINT Outfile,"    {"
      FPRINT Outfile,"      sprintf(buff,",S2$,",",DQ$,"_",DQ$,",FuncName);"
      FPRINT Outfile,"      lpAddr=(DYNACALL1)GetProcAddress(hInst,buff);"
      FPRINT Outfile,"    }"
      FPRINT Outfile,"  if (lpAddr)"
      FPRINT Outfile,"    {"
      FPRINT Outfile,"      va_start(ap,nArgs);"
      FPRINT Outfile,"      for (i=0; i<nArgs;i++)"
      FPRINT Outfile,"        {"
      FPRINT Outfile,"          argtable[i] = va_arg(ap,int);"
      FPRINT Outfile,"        }"
      FPRINT Outfile,"      va_end(ap);"
      FPRINT Outfile,"      while (--nArgs >= 0)"
      FPRINT Outfile,"        {"
      FPRINT Outfile,"          arg = argtable[nArgs];"
      FPRINT Outfile,"          #if defined( __LCC__ )"
      FPRINT Outfile,"          _asm(",ENC$("pushl %arg"),")"
      FPRINT Outfile,"          #elif defined( __MINGW32__ ) || defined( __TINYC__)"
      FPRINT Outfile,"          __asm__(",ENC$("pushl %0")," : : ",ENC$("r")," (arg));"
      FPRINT Outfile,"          #elif defined( __BCPLUSPLUS__ ) "
      FPRINT Outfile,"            asm push arg"
      FPRINT Outfile,"          #else"
      FPRINT Outfile,"          __asm{push arg}"
      FPRINT Outfile,"          #endif"
      FPRINT Outfile,"        }"
      FPRINT Outfile,"      result = (int)lpAddr();"
      FPRINT Outfile,"  }"
      FPRINT Outfile,"  free(argtable);"
      FPRINT Outfile,"  return result;"
      FPRINT Outfile,"}\n\n"
      IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
    END IF

    IF Use_DynacallA THEN
      IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: BCX_DynaCallA"
      FPRINT Outfile,"int BCX_DynaCallA (char *DllName, char *FuncName, int nArgs, int argtable[])"
      FPRINT Outfile,"{"
      FPRINT Outfile,"  HINSTANCE  hInst=0;"
      FPRINT Outfile,"  DYNACALL1 lpAddr=0;"
      FPRINT Outfile,"  int arg, result =0;"
      FPRINT Outfile,"  char buff[256];"
      FPRINT Outfile,"  hInst=GetModuleHandle(DllName);"
      FPRINT Outfile,"  if(hInst==NULL)"
      FPRINT Outfile,"  {"
      FPRINT Outfile,"      hInst=BCX_LoadDll(DllName);"
      FPRINT Outfile,"  }"
      FPRINT Outfile,"  lpAddr=(DYNACALL1)GetProcAddress(hInst,FuncName);"
      FPRINT Outfile,"  if(lpAddr==NULL)"
      FPRINT Outfile,"    {"
      FPRINT Outfile,"      sprintf(buff,",S2$,",FuncName,",DQ$,"A",DQ$,");"
      FPRINT Outfile,"      lpAddr=(DYNACALL1)GetProcAddress(hInst,buff);"
      FPRINT Outfile,"    }"
      FPRINT Outfile,"  if(lpAddr==NULL)"
      FPRINT Outfile,"    {"
      FPRINT Outfile,"      sprintf(buff,",S2$,",",DQ$,"_",DQ$,",FuncName);"
      FPRINT Outfile,"      lpAddr=(DYNACALL1)GetProcAddress(hInst,buff);"
      FPRINT Outfile,"    }"
      FPRINT Outfile,"  if (lpAddr)"
      FPRINT Outfile,"    {"
      FPRINT Outfile,"      while (--nArgs >= 0)"
      FPRINT Outfile,"        {"
      FPRINT Outfile,"          arg = argtable[nArgs];"
      FPRINT Outfile,"          #if defined( __LCC__ )"
      FPRINT Outfile,"          _asm(",ENC$("pushl %arg"),")"
      FPRINT Outfile,"          #elif defined( __MINGW32__ ) || defined( __TINYC__)"
      FPRINT Outfile,"          __asm__(",ENC$("pushl %0")," : : ",ENC$("r")," (arg));"
      FPRINT Outfile,"          #elif defined( __BCPLUSPLUS__ ) "
      FPRINT Outfile,"            asm push arg"
      FPRINT Outfile,"          #else"
      FPRINT Outfile,"          __asm{push arg}"
      FPRINT Outfile,"          #endif"
      FPRINT Outfile,"        }"
      FPRINT Outfile,"      result = (int)lpAddr();"
      FPRINT Outfile,"  }"
      FPRINT Outfile,"  return result;"
      FPRINT Outfile,"}\n\n"
      IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
    END IF
  END IF

  IF Use_Strtoken THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: StrToken"
    FPRINT Outfile,"char * StrToken (char *Source, char *TokenChar, int n)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  char *BCX_RetStr={0};"
    FPRINT Outfile,"  char *RetVal;"
    FPRINT Outfile,"  char *Copy;"
    FPRINT Outfile,"  int   Posn=0;"
    FPRINT Outfile,"  int   Find=0;"
    FPRINT Outfile,"  int   LenSrc=strlen(Source);"
    FPRINT Outfile,"  RetVal=(char*)calloc(LenSrc+1,1);"
    FPRINT Outfile,"  Copy=Source;"
    FPRINT Outfile,"  if(tally(Source,TokenChar)==0)"
    FPRINT Outfile,"    {"
    FPRINT Outfile,"      BCX_RetStr=BCX_TmpStr(1);"
    FPRINT Outfile,"      if(RetVal)free(RetVal);"
    FPRINT Outfile,"      return BCX_RetStr;"
    FPRINT Outfile,"    }"
    FPRINT Outfile,"  if(n==1)"
    FPRINT Outfile,"    {"
    FPRINT Outfile,"      BCX_RetStr=BCX_TmpStr(LenSrc);"
    FPRINT Outfile,"      strcpy(BCX_RetStr,(char*)extract(Source,TokenChar));"
    FPRINT Outfile,"      if(RetVal)free(RetVal);"
    FPRINT Outfile,"      return BCX_RetStr;"
    FPRINT Outfile,"    }"
    FPRINT Outfile,"  if(n>tally(Source,TokenChar)+1)"
    FPRINT Outfile,"    {"
    FPRINT Outfile,"      BCX_RetStr=BCX_TmpStr(1);"
    FPRINT Outfile,"      if(RetVal)free(RetVal);"
    FPRINT Outfile,"      return BCX_RetStr;"
    FPRINT Outfile,"    }"
    FPRINT Outfile,"  while(*Copy)"
    FPRINT Outfile,"    {"
    FPRINT Outfile,"      if(*Copy==TokenChar[0]) Find++;"
    FPRINT Outfile,"      if(Find==n) break;"
    FPRINT Outfile,"      Copy++;"
    FPRINT Outfile,"      Posn++;"
    FPRINT Outfile,"    }"
    FPRINT Outfile,"  if(n==tally(Source,TokenChar)+1)"
    FPRINT Outfile,"    {"
    FPRINT Outfile,"      Posn=LenSrc;"
    FPRINT Outfile,"      Copy=Source+Posn;"
    FPRINT Outfile,"      while(*Copy&&Source[Posn]!=TokenChar[0])"
    FPRINT Outfile,"        {"
    FPRINT Outfile,"          Posn--;"
    FPRINT Outfile,"          Copy--;"
    FPRINT Outfile,"        }"
    FPRINT Outfile,"    }"
    FPRINT Outfile,"  strcpy(RetVal,(char*)mid(Source,1,Posn));"
    FPRINT Outfile,"  strcpy(RetVal,(char*)mid(RetVal,InstrRev(RetVal,TokenChar)));"
    FPRINT Outfile,"  BCX_RetStr=BCX_TmpStr(LenSrc);"
    FPRINT Outfile,"  strcpy(BCX_RetStr,(char*)RemoveStr(RetVal,TokenChar));"
    FPRINT Outfile,"  if(RetVal)free(RetVal);"
    FPRINT Outfile,"  return BCX_RetStr;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF

  IF Use_iReplace THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: iReplace"
    FPRINT Outfile,"char *iReplace (char *src, char *pat, char *rep)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  size_t patsz, repsz, tmpsz, delta;"
    FPRINT Outfile,"  char *strtmp, *p, *q, *r;"
    FPRINT Outfile,"  if (!pat || !*pat)"
    FPRINT Outfile,"   {"
    FPRINT Outfile,"     strtmp = BCX_TmpStr(strlen(src));"
    FPRINT Outfile,"     if (!strtmp) return NULL;"
    FPRINT Outfile,"     return strcpy(strtmp, src);"
    FPRINT Outfile,"   }"
    FPRINT Outfile,"  repsz = strlen(rep);"
    FPRINT Outfile,"  patsz = strlen(pat);"
    FPRINT Outfile,"  for (tmpsz=0, p=src;(q=_stristr_(p,pat))!=0; p=q+patsz)"
    FPRINT Outfile,"    tmpsz += (size_t) (q - p) + repsz;"
    FPRINT Outfile,"    tmpsz += strlen(p);"
    FPRINT Outfile,"    strtmp = BCX_TmpStr(tmpsz);"
    FPRINT Outfile,"    if (!strtmp) return NULL;"
    FPRINT Outfile,"    for (r=strtmp,p=src;(q=_stristr_(p,pat))!=0;p=q+patsz)"
    FPRINT Outfile,"     {"
    FPRINT Outfile,"       delta = (size_t) (q-p);"
    FPRINT Outfile,"       memcpy(r,p,delta); r += delta;"
    FPRINT Outfile,"       strcpy(r,rep);      r += repsz;"
    FPRINT Outfile,"     }"
    FPRINT Outfile,"  strcpy(r,p);"
    FPRINT Outfile,"  return strtmp;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF

  IF Use_WideToAnsi THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: WideToAnsi"
    FPRINT Outfile,"char* WideToAnsi (BSTR WideStr, UINT CodePage,DWORD dwFlags)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  char *BCX_RetStr={0};"
    FPRINT Outfile,"  UINT uLen;"
    FPRINT Outfile,"  uLen=WideCharToMultiByte(CodePage,dwFlags,WideStr,-1,0,0,0,0);"
    FPRINT Outfile,"  BCX_RetStr=(char*)BCX_TmpStr(uLen);"
    FPRINT Outfile,"  WideCharToMultiByte(CodePage,dwFlags,WideStr,-1,BCX_RetStr,uLen,0,0);"
    FPRINT Outfile,"  return BCX_RetStr;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF

  IF Use_SysStr THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: SysStr"
    FPRINT Outfile,"BSTR SysStr (char * szIn, int widstr, int bfree)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  static  BSTR  bStr[32];"
    FPRINT Outfile,"  static  int   index;"
    FPRINT Outfile,"  if(bfree)"
    FPRINT Outfile,"    {"
    FPRINT Outfile,"      for(index=0; index<32; index+=1) "
    FPRINT Outfile,"        SysFreeString(bStr[index]);"
    FPRINT Outfile,"      return 0;"
    FPRINT Outfile,"    }"
    FPRINT Outfile,"  index=(++index & 31);"
    FPRINT Outfile,"  SysFreeString(bStr[index]);"
    FPRINT Outfile,"  int   length=strlen(szIn);"
    FPRINT Outfile,"  if(widstr)"
    FPRINT Outfile,"   {"
    FPRINT Outfile,"     bStr[index]=SysAllocStringLen(NULL, (2*length));"
    FPRINT Outfile,"     MultiByteToWideChar(CP_ACP,0,szIn,-1,bStr[index],(2*length+1));"
    FPRINT Outfile,"   }else{"
    FPRINT Outfile,"     bStr[index]=SysAllocStringByteLen(szIn, length);"
    FPRINT Outfile,"   }"
    FPRINT Outfile,"  return bStr[index];"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF

  IF Use_AnsiToWide THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: AnsiToWide"
    FPRINT Outfile,"LPOLESTR AnsiToWide (char *AnsiStr, UINT CodePage,DWORD dwFlags)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  UINT uLen;"
    FPRINT Outfile,"  BSTR WideStr;"
    FPRINT Outfile,"  uLen=MultiByteToWideChar(CodePage,dwFlags,AnsiStr,-1,0,0);"
    FPRINT Outfile,"  if(uLen<=1) return (BSTR) BCX_TmpStr(2);"
    FPRINT Outfile,"  WideStr=(BSTR) BCX_TmpStr(2*uLen);"
    FPRINT Outfile,"  MultiByteToWideChar(CodePage,dwFlags,AnsiStr,uLen,WideStr,uLen);"
    FPRINT Outfile,"  return WideStr;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF

  IF Use_VBS THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: VBS_START"
    FPRINT Outfile,"BOOL VBS_START (void)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  HRESULT  hResult;"
    FPRINT Outfile,"  GUID  clsid;"
    FPRINT Outfile,"  BSTR  Language;"
    FPRINT Outfile,"  OLE_ERROR_S=FALSE;"
    FPRINT Outfile,"  if(S_OK!=OleInitialize(0))"
    FPRINT Outfile,"    {"
    FPRINT Outfile,"      MessageBox(NULL,", ENC$("Couldn't initialize OLE!"), ",NULL,MB_OK);"
    FPRINT Outfile,"      PostQuitMessage(0);"
    FPRINT Outfile,"    }"
    FPRINT Outfile, "  #ifdef __BCX_MULTITHREADED__"
    FPRINT Outfile,"  CoInitializeEx(NULL,COINIT_MULTITHREADED);"
    FPRINT Outfile,"  #else"
    FPRINT Outfile,"  CoInitializeEx(NULL,COINIT_APARTMENTTHREADED);"
    FPRINT Outfile,"  #endif"
    FPRINT Outfile,"  hResult=CLSIDFromProgID(OLESTR(", ENC$("MSScriptControl.ScriptControl"), "),&clsid);"
    FPRINT Outfile,"  if(hResult!=S_OK)"
    FPRINT Outfile,"    {"
    FPRINT Outfile,"      for(;;)"
    FPRINT Outfile,"      {"
    FPRINT Outfile,"      if(hResult==REGDB_E_CLASSNOTREG)"
    FPRINT Outfile,"        {"
    FPRINT Outfile,"          OleUninitialize();"
    FPRINT Outfile,"          MessageBox (GetActiveWindow(),", ENC$("MSScriptControl::Class not registered"), ",", ENC$("Error"), ",MB_SETFOREGROUND);"
    FPRINT Outfile,"          PostQuitMessage(0);"
    FPRINT Outfile,"          break;"
    FPRINT Outfile,"        }"
    FPRINT Outfile,"      if(hResult==CLASS_E_NOAGGREGATION)"
    FPRINT Outfile,"        {"
    FPRINT Outfile,"          OleUninitialize();"
    FPRINT Outfile,"          MessageBox (GetActiveWindow(),", ENC$("MSScriptControl::Class not created"), ",", ENC$("Error"), ",MB_SETFOREGROUND);"
    FPRINT Outfile,"          PostQuitMessage(0);"
    FPRINT Outfile,"          break;"
    FPRINT Outfile,"        }"
    FPRINT Outfile,"      if(hResult==CLASS_E_CLASSNOTAVAILABLE)"
    FPRINT Outfile,"        {"
    FPRINT Outfile,"          OleUninitialize();"
    FPRINT Outfile,"          MessageBox (GetActiveWindow(),", ENC$("MSScriptControl::Class not available"), ",", ENC$("Error"), ",MB_SETFOREGROUND);"
    FPRINT Outfile,"          PostQuitMessage(0);"
    FPRINT Outfile,"          break;"
    FPRINT Outfile,"          }"
    FPRINT Outfile,"        {"
    FPRINT Outfile,"        VBS_STOP();"
    FPRINT Outfile,"        MessageBox (GetActiveWindow(),", ENC$("MSScriptControl::Unknown error"), ",", ENC$("Error"), ",MB_SETFOREGROUND);"
    FPRINT Outfile,"        PostQuitMessage(0);"
    FPRINT Outfile,"      }"
    FPRINT Outfile,"    break;"
    FPRINT Outfile,"    }"
    FPRINT Outfile,"}"
    FPRINT Outfile,"#ifndef __cplusplus"
    FPRINT Outfile,"hResult=CoCreateInstance(&clsid,0,CLSCTX_SERVER,&IID_IScriptControl,(void**)&pSC);"
    FPRINT Outfile,"#else"
    FPRINT Outfile,"hResult=CoCreateInstance(clsid,0,CLSCTX_SERVER,IID_IScriptControl,(void**)&pSC);"
    FPRINT Outfile,"#endif"
    FPRINT Outfile,"Language=SysAllocString(OLESTR(", ENC$("VBScript"), "));"
    FPRINT Outfile,"#ifndef __cplusplus"
    FPRINT Outfile,"hResult=pSC->lpVtbl->put_Language(pSC,Language);"
    FPRINT Outfile,"#else"
    FPRINT Outfile,"hResult=pSC->put_Language(Language);"
    FPRINT Outfile,"#endif"
    FPRINT Outfile,"SysFreeString(Language);;"
    FPRINT Outfile,"if(hResult!=S_OK)"
    FPRINT Outfile,"  {"
    FPRINT Outfile,"    VBS_STOP();"
    FPRINT Outfile,"    MessageBox (GetActiveWindow(),", ENC$("Could not start ScriptControl"), ",", ENC$("Error"), ",MB_SETFOREGROUND);"
    FPRINT Outfile,"    PostQuitMessage(0);"
    FPRINT Outfile,"  }"
    FPRINT Outfile,"return TRUE;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "

    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: VBS_STOP"
    FPRINT Outfile,"void VBS_STOP (void)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"#ifndef __cplusplus"
    FPRINT Outfile,"  pSC->lpVtbl->Release(pSC);"
    FPRINT Outfile,"#else"
    FPRINT Outfile,"  pSC->Release();"
    FPRINT Outfile,"#endif"
    FPRINT Outfile,"  pSC=0;;"
    FPRINT Outfile,"  OleUninitialize();"
    ' next line commented out - OleUninitialize calls CoUninitialize
    'FPRINT Outfile,"  CoUninitialize();"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "

    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: VBS_RESET"
    FPRINT Outfile,"void VBS_RESET (void)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"#ifndef __cplusplus"
    FPRINT Outfile,"  pSC->lpVtbl->Reset(pSC);"
    FPRINT Outfile,"#else"
    FPRINT Outfile,"  pSC->Reset();"
    FPRINT Outfile,"#endif"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "

    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: VBS_RUN_SCRIPT"
    FPRINT Outfile,"HRESULT VBS_RUN_SCRIPT (char *VB_SCRIPT)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  BSTR  MyCode;"
    FPRINT Outfile,"  HRESULT  hResult;"
    FPRINT Outfile,"  MyCode=SysAllocString(AnsiToWide(VB_SCRIPT));"
    FPRINT Outfile,"#ifndef __cplusplus"
    FPRINT Outfile,"  hResult=pSC->lpVtbl->ExecuteStatement(pSC,MyCode);"
    FPRINT Outfile,"#else"
    FPRINT Outfile,"  hResult=pSC->ExecuteStatement(MyCode);"
    FPRINT Outfile,"#endif"
    FPRINT Outfile,"  SysFreeString(MyCode);"
    FPRINT Outfile,"  return SUCCEEDED(hResult);"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "

    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: VBS_ADDCODE"
    FPRINT Outfile,"HRESULT VBS_ADDCODE (char *Code)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  int CodeLen;"
    FPRINT Outfile,"  wchar_t* Buf;"
    FPRINT Outfile,"  BSTR Bbuf;"
    FPRINT Outfile,"  HRESULT hResult;"
    FPRINT Outfile,"  CodeLen=strlen(Code);"
    FPRINT Outfile,"  Buf=(wchar_t*)calloc(2*(CodeLen+1),sizeof(wchar_t));"
    FPRINT Outfile,"  mbstowcs(Buf,Code,CodeLen);"
    FPRINT Outfile,"  Bbuf=SysAllocString(Buf);"
    FPRINT Outfile,"  free((Buf));"
    FPRINT Outfile,"#ifndef __cplusplus"
    FPRINT Outfile,"  hResult=pSC->lpVtbl->AddCode(pSC,Bbuf);"
    FPRINT Outfile,"#else"
    FPRINT Outfile,"  hResult=pSC->AddCode(Bbuf);"
    FPRINT Outfile,"#endif"
    FPRINT Outfile,"  SysFreeString(Bbuf);"
    FPRINT Outfile,"  return SUCCEEDED(hResult);"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "

    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: VBS_EVAL_NUM"
    FPRINT Outfile,"double VBS_EVAL_NUM (char* VB_SCRIPT)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  BSTR  MyCode;"
    FPRINT Outfile,"  HRESULT HResult;"
    FPRINT Outfile,"  VARIANT vResult;"
    FPRINT Outfile,"  MyCode=SysAllocString(AnsiToWide(VB_SCRIPT));"
    FPRINT Outfile,"#ifndef __cplusplus"
    FPRINT Outfile,"  HResult=pSC->lpVtbl->Eval(pSC,MyCode,&vResult);"
    FPRINT Outfile,"#else"
    FPRINT Outfile,"  HResult=pSC->Eval(MyCode,&vResult);"
    FPRINT Outfile,"#endif"
    FPRINT Outfile,"  SysFreeString(MyCode);"
    FPRINT Outfile,"  if(SUCCEEDED(HResult))"
    FPRINT Outfile,"    {"
    FPRINT Outfile,"      HResult=VariantChangeType(&vResult,&vResult,0,VT_R8);"
    FPRINT Outfile,"      return vResult.dblVal;"
    FPRINT Outfile,"    }"
    FPRINT Outfile,"  return 0;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "

    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: VBS_ERROR"
    FPRINT Outfile,"char* VBS_ERROR(void)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  char *BCX_RetStr={0};"
    FPRINT Outfile,"  IScriptError* pScriptError;"
    FPRINT Outfile,"  HRESULT HResult;"
    FPRINT Outfile,"  long  ErrNumber;"
    FPRINT Outfile,"  BSTR  ErrDescription = NULL;"
    FPRINT Outfile,"  BSTR  ErrText = NULL;"
    FPRINT Outfile,"  long  ErrLine;"
    FPRINT Outfile,"  long  ErrColumn;"
    FPRINT Outfile,"  UINT  Errdesclen;"
    FPRINT Outfile,"#ifndef __cplusplus"
    FPRINT Outfile,"  HResult = pSC->lpVtbl->get_Error(pSC, &pScriptError);"
    FPRINT Outfile,"#else"
    FPRINT Outfile,"  HResult = pSC->get_Error( &pScriptError);"
    FPRINT Outfile,"#endif"
    FPRINT Outfile,"  if FAILED(HResult)"
    FPRINT Outfile,"    {"
    FPRINT Outfile,"      *BCX_RetStr=0;"
    FPRINT Outfile,"      return BCX_RetStr;"
    FPRINT Outfile,"    }"
    FPRINT Outfile,"  if (pScriptError)"
    FPRINT Outfile,"    {"
    FPRINT Outfile,"#ifndef __cplusplus"
    FPRINT Outfile,"      pScriptError->lpVtbl->Get_Number(pScriptError,&ErrNumber);"
    FPRINT Outfile,"      pScriptError->lpVtbl->Get_Description(pScriptError, &ErrDescription);"
    FPRINT Outfile,"      pScriptError->lpVtbl->Get_Text(pScriptError, &ErrText);"
    FPRINT Outfile,"      pScriptError->lpVtbl->Get_Line(pScriptError, &ErrLine);"
    FPRINT Outfile,"      pScriptError->lpVtbl->Get_Column(pScriptError, &ErrColumn);"
    FPRINT Outfile,"#else"
    FPRINT Outfile,"      pScriptError->Get_Number(&ErrNumber);"
    FPRINT Outfile,"      pScriptError->Get_Description(&ErrDescription);"
    FPRINT Outfile,"      pScriptError->Get_Text(&ErrText);"
    FPRINT Outfile,"      pScriptError->Get_Line(&ErrLine);"
    FPRINT Outfile,"      pScriptError->Get_Column(&ErrColumn);"
    FPRINT Outfile,"#endif"
    FPRINT Outfile,"      if (NULL == ErrDescription)"
    FPRINT Outfile,"        {"
    FPRINT Outfile,"          ErrDescription = SysAllocString(OLESTR(", ENC$("No description available."), "));"
    FPRINT Outfile,"        }"
    FPRINT Outfile,"      if (NULL == ErrText)"
    FPRINT Outfile,"        {"
    FPRINT Outfile,"          ErrText = SysAllocString(OLESTR(", ENC$("No extra error info available."), "));"
    FPRINT Outfile,"        }"
    FPRINT Outfile,"      Errdesclen =  SysStringLen(ErrDescription) + SysStringLen(ErrText) + 512;"
    FPRINT Outfile,"      BCX_RetStr=BCX_TmpStr(Errdesclen);"
    FPRINT Outfile,"      sprintf(BCX_RetStr," , ENC$("VBScript error 0x%lX\\nline:%d, column:%d\\nDescription: %s\\nError text: %s") , ", ErrNumber, ErrLine, ErrColumn,WideToAnsi(ErrDescription),WideToAnsi(ErrText));"
    FPRINT Outfile,"      SysFreeString(ErrDescription);"
    FPRINT Outfile,"      SysFreeString(ErrText);"
    FPRINT Outfile,"#ifndef __cplusplus"
    FPRINT Outfile,"      pScriptError->lpVtbl->Release(pScriptError);"
    FPRINT Outfile,"#else"
    FPRINT Outfile,"      pScriptError->Release();"
    FPRINT Outfile,"#endif"
    FPRINT Outfile,"      return BCX_RetStr;"
    FPRINT Outfile,"    }"
    FPRINT Outfile,"  *BCX_RetStr=0;"
    FPRINT Outfile,"  return BCX_RetStr;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "

    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: VBS_EVAL_STR"
    FPRINT Outfile,"char* VBS_EVAL_STR(char* VB_SCRIPT)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  char *BCX_RetStr={0};"
    FPRINT Outfile,"  BSTR  MyCode;"
    FPRINT Outfile,"  HRESULT HResult;"
    FPRINT Outfile,"  VARIANT vResult;"
    FPRINT Outfile,"  MyCode=SysAllocString(AnsiToWide(VB_SCRIPT));"
    FPRINT Outfile,"#ifndef __cplusplus"
    FPRINT Outfile,"  HResult=pSC->lpVtbl->Eval(pSC,MyCode,&vResult);"
    FPRINT Outfile,"#else"
    FPRINT Outfile,"  HResult=pSC->Eval(MyCode,&vResult);"
    FPRINT Outfile,"#endif"
    FPRINT Outfile,"  SysFreeString(MyCode);"
    FPRINT Outfile,"  if(SUCCEEDED(HResult))"
    FPRINT Outfile,"    {"
    FPRINT Outfile,"      HResult=VariantChangeType(&vResult,&vResult,0,VT_BSTR);"
    FPRINT Outfile,"      BCX_RetStr=BCX_TmpStr(strlen(WideToAnsi(vResult.bstrVal)));"
    FPRINT Outfile,"      strcpy(BCX_RetStr,(char*)WideToAnsi(vResult.bstrVal));"
    FPRINT Outfile,"      return BCX_RetStr;"
    FPRINT Outfile,"    }"
    FPRINT Outfile,"  *BCX_RetStr=0;"
    FPRINT Outfile,"  return BCX_RetStr;"
    FPRINT Outfile,"}"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF

  IF Use_FileLocked THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: FileLocked"
    FPRINT Outfile,"int FileLocked (char *Filename)"
    FPRINT Outfile,"{"
    FPRINT Outfile,"  FILE *FP=fopen(Filename,", ENC$("rb+"), ");"
    FPRINT Outfile,"  if(FP==0) return 1;"
    FPRINT Outfile,"  fclose(FP);"
    FPRINT Outfile,"  return 0;"
    FPRINT Outfile,"}\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF

  IF Use_ContainedIn THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: containedin"
    FPRINT Outfile,"int containedin(char * Token,char **Contain ,int c)"
    FPRINT Outfile,"  {"
    FPRINT Outfile,"    int i=0;"
    FPRINT Outfile,"    while(Contain[i][0])"
    FPRINT Outfile,"      {"
    FPRINT Outfile,"        if(0 == ((c == 0 || c == 2) ? strcmp(Contain[i],Token) : stricmp(Contain[i],Token)))"
    FPRINT Outfile,"          {"
    FPRINT Outfile,"            return ((c < 2) ? 0 : i);"
    FPRINT Outfile,"          }"
    FPRINT Outfile,"        i++;"
    FPRINT Outfile,"      }"
    FPRINT Outfile,"    return -1;"
    FPRINT Outfile,"  }\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF

  IF Use_FindInType THEN
    IF Use_Library THEN FPRINT Outfile,"// BCXRTLIB: FindInType"
    FPRINT Outfile,"int FindInType(char *Token,char *StOffset,int StSize,int start,int finish,int c,int *idx)"
    FPRINT Outfile,"  {"
    FPRINT Outfile,"    int j;"
    FPRINT Outfile,"    char *Srch;"
    FPRINT Outfile,"    int (*cmp)(const char*,const char*);"
    FPRINT Outfile,"    cmp = ((c == 0 || c == 2) ? strcmp : stricmp);"
    FPRINT Outfile,"    for(j=start; j<=finish; j++)"
    FPRINT Outfile,"      {"
    FPRINT Outfile,"        Srch = StOffset + ((idx==0) ? j*StSize : idx[j]*StSize);"
    FPRINT Outfile,"        if(cmp(Srch,Token)==0)"
    FPRINT Outfile,"          {"
    FPRINT Outfile,"            return ((c < 2) ? 0 : j);"
    FPRINT Outfile,"          }"
    FPRINT Outfile,"      }"
    FPRINT Outfile,"    return -1;"
    FPRINT Outfile,"  }\n\n"
    IF Use_Library THEN FPRINT Outfile,"// ENDBCXRTLIB "
  END IF

  IF Use_StartupCode THEN
    FPRINT Outfile,"int BCX_StartupCode_(void)"
    FPRINT Outfile,"{"
    FOR INTEGER i = 1 TO StartNdx
      FPRINT Outfile,"  " + StartSub$[i] + "();"
    NEXT
    FPRINT Outfile,"  return 1;"
    FPRINT Outfile,"}\n\n"
  END IF

  IF Use_ExitCode THEN
    FPRINT Outfile,"int BCX_ExitCode_(void)"
    FPRINT Outfile,"{"
    FOR INTEGER i = 1 TO ExitNdx
      FPRINT Outfile,"  atexit(" + ExitSub$[i] + ");"
    NEXT
    FPRINT Outfile,"  return 1;"
    FPRINT Outfile,"}\n\n"
  END IF

END SUB    'RunTimeFunctions


SUB UseAll( bCPP AS BOOLEAN )
  Use_SetDimension           = TRUE
  Use_GetDimension           = TRUE
  UseFlag                    = TRUE
  UseLCaseTbl                = TRUE
  Use_Abs                    = TRUE
  Use_Acosh                  = TRUE
  Use_AnsiToWide             = TRUE
  Use_AppActivate            = TRUE
  Use_AppExeName             = TRUE
  Use_AppExePath             = TRUE
  Use_Asc                    = TRUE
  Use_Asinh                  = TRUE
  Use_Atanh                  = TRUE
  Use_BEL                    = TRUE
  Use_BS                     = TRUE
  Use_Bff                    = TRUE
  Use_Bin                    = TRUE
  Use_Bin2dec                = TRUE
  Use_Bitmap                 = TRUE
  Use_Blackrect              = TRUE
  Use_BmpButton              = TRUE
  Use_Boolstr                = TRUE
  Use_Button                 = TRUE
  Use_CR                     = TRUE
  Use_Center                 = TRUE
  Use_Checkbox               = TRUE
  Use_Chr                    = TRUE
  Use_Cint                   = TRUE
  Use_Color                  = TRUE
  Use_ComboBoxLoadFile       = TRUE
  Use_Combobox               = TRUE
  Use_Console                = TRUE
  Use_ContainedIn            = TRUE
  Use_Crlf                   = TRUE
  Use_Csrlin                 = TRUE
  Use_Cvd                    = TRUE
  Use_Cvi                    = TRUE
  Use_Cvl                    = TRUE
  Use_Cvld                   = TRUE
  Use_Cvs                    = TRUE
  Use_DDQ                    = TRUE
  Use_DQ                     = TRUE
  Use_DSplit                 = TRUE
  Use_Date                   = TRUE
  Use_Datepick               = TRUE
  Use_Del                    = TRUE
  Use_Doevents               = TRUE
  Use_Download               = TRUE
  Use_Draw                   = TRUE
  Use_DrawTransBMP           = TRUE
  Use_DynStrqsorta           = TRUE
  Use_DynStrqsortd           = TRUE
  Use_Dynacall               = TRUE
  Use_DynamicA               = TRUE
  Use_EOF                    = TRUE
  Use_ESC                    = TRUE
  Use_Edit                   = TRUE
  Use_Elf                    = TRUE
  Use_Enclose                = TRUE
  Use_Environ                = TRUE
  Use_Exist                  = TRUE
  Use_Exp                    = TRUE
  Use_Extract                = TRUE
  Use_FF                     = TRUE
  Use_FileLocked             = TRUE
  Use_FillArray              = TRUE
  Use_FindInType             = TRUE
  Use_Findfirst              = TRUE
  Use_Findnext               = TRUE
  Use_FirstInstance          = TRUE
  Use_GUINoMain              = TRUE
  Use_GenFree                = TRUE
  Use_GetResource            = TRUE
  Use_GetSpecialFolder       = TRUE
  Use_GetTextSize            = TRUE
  Use_Getfilename            = TRUE
  Use_Gosub                  = TRUE
  Use_Grayrect               = TRUE
  Use_Group                  = TRUE
  Use_Hex                    = TRUE
  Use_Hex2Dec                = TRUE
  Use_Hook                   = TRUE
  Use_Hscroll                = TRUE
  Use_IRemove                = TRUE
  Use_Icon                   = TRUE
  Use_Idxqsort               = TRUE
  Use_IdxqsortSt             = TRUE
  Use_Iif                    = TRUE
  Use_Inchr                  = TRUE
  Use_Infobox                = TRUE
  Use_Inkey                  = TRUE
  Use_InkeyD                 = TRUE
  Use_Inputbox               = TRUE
  Use_Inputbuffer            = TRUE
  Use_Ins                    = TRUE
  Use_Instr                  = TRUE
  Use_Instrrev               = TRUE
  Use_Join                   = TRUE
  Use_LF                     = TRUE
  Use_Label                  = TRUE
  Use_Lcase                  = TRUE
  Use_Left                   = TRUE
  Use_Like                   = TRUE
  Use_ListBoxLoadFile        = TRUE
  Use_Listview               = TRUE
  Use_LoadFile               = TRUE
  Use_Loc                    = TRUE
  Use_Locate                 = TRUE
  Use_Lof                    = TRUE
  Use_Lpad                   = TRUE
  Use_Ltrim                  = TRUE
  Use_MDIGUINoMain           = TRUE
  Use_MainEvent              = TRUE
  Use_Max                    = TRUE
  Use_Mcase                  = TRUE
  Use_Mdigui                 = TRUE
  Use_Mid                    = TRUE
  Use_Midstr                 = TRUE
  Use_Min                    = TRUE
  Use_Mkd                    = TRUE
  Use_Mki                    = TRUE
  Use_Mkl                    = TRUE
  Use_Mkld                   = TRUE
  Use_Mks                    = TRUE
  Use_Modstyle               = TRUE
  Use_Msgbox                 = TRUE
  Use_NUL                    = TRUE
  Use_Now                    = TRUE
  Use_Numqsortadouble        = TRUE
  Use_Numqsortafloat         = TRUE
  Use_Numqsortaint           = TRUE
  Use_Numqsortddouble        = TRUE
  Use_Numqsortdfloat         = TRUE
  Use_Numqsortdint           = TRUE
  Use_Oct                    = TRUE
  Use_Panel                  = TRUE
  Use_PeekStr                = TRUE
  Use_Pos                    = TRUE
  Use_Printer                = TRUE
  Use_ProgressBar            = TRUE
  Use_Proto                  = TRUE
  Use_PtrqsortSt             = TRUE
  Use_QBColor                = TRUE
  Use_Radio                  = TRUE
  Use_Randomize              = TRUE
  Use_Rec                    = TRUE
  Use_RecCount               = TRUE
  Use_Remain                 = TRUE
  Use_Remove                 = TRUE
  Use_Repeat                 = TRUE
  Use_Replace                = TRUE
  Use_Retain                 = TRUE
  Use_Reverse                = TRUE
  Use_Right                  = TRUE
  Use_Rnd                    = TRUE
  Use_Round                  = TRUE
  Use_Rpad                   = TRUE
  Use_Rtrim                  = TRUE
  Use_SPC                    = TRUE
  Use_Scan                   = TRUE
  Use_SearchPath             = TRUE
  Use_SetFont                = TRUE
  Use_Sgn                    = TRUE
  Use_Space                  = TRUE
  Use_Split                  = TRUE
  Use_Str                    = TRUE
  Use_StrStr                 = TRUE
  Use_Str_Cmp                = TRUE
  Use_Strim                  = TRUE
  Use_String                 = TRUE
  Use_Stristr                = TRUE
  Use_Strl                   = TRUE
  Use_Strqsorta              = TRUE
  Use_Strqsortd              = TRUE
  Use_Strtoken               = TRUE
  Use_Swap                   = TRUE
  Use_SysStr                 = TRUE
  Use_Sysmacros              = TRUE
  Use_TAB                    = TRUE
  Use_Tally                  = TRUE
  Use_TempFileName           = TRUE
  Use_Textmode               = TRUE
  Use_Timer                  = TRUE
  Use_Treeview               = TRUE
  Use_Trim                   = TRUE
  Use_Ucase                  = TRUE
  Use_Using                  = TRUE
  Use_VBS                    = TRUE
  Use_VChr                   = TRUE
  Use_VT                     = TRUE
  Use_Verify                 = TRUE
  Use_Vscroll                = TRUE
  Use_Whiterect              = TRUE
  Use_WideToAnsi             = TRUE
  Use_Wingui                 = TRUE
  Use_iReplace               = TRUE
  Use_sziif                  = TRUE

  IF bCPP = TRUE THEN
    UseCpp                   = TRUE
  END IF

  ' Set Sysmacros

  Use_Cbool                  = TRUE
  Use_Isptr                  = TRUE
  Use_Band                   = TRUE
  Use_Bor                    = TRUE
  Use_Inp                    = TRUE
  Use_Inpw                   = TRUE
  Use_Outp                   = TRUE
  Use_Outpw                  = TRUE
  Use_Ubound                 = TRUE
  Use_Clear                  = TRUE
  Use_Imod                   = TRUE
  Use_Show                   = TRUE
  Use_Hide                   = TRUE
  Use_Get                    = TRUE
  Use_Put                    = TRUE
  Use_Strptr                 = TRUE
  Use_Val                    = TRUE
  Use_Vall                   = TRUE
  Use_Getattr                = TRUE
  Use_Fint                   = TRUE
  Use_Frac                   = TRUE
  Use_Fracl                  = TRUE
  Use_Fix                    = TRUE
  Use_Csng                   = TRUE
  Use_Cdbl                   = TRUE
  Use_Cldbl                  = TRUE
  Use_Threads                = TRUE

  GUIIcon$ = " LoadIcon(NULL,IDI_WINLOGO);"

  CALL AddGlobal("BcxFont"      ,vt_HFONT,  0,"",0,0,0,0)
  CALL AddGlobal("BCX_ScaleX",   vt_SINGLE, 0,"",0,0,0,0)
  CALL AddGlobal("BCX_ScaleY",   vt_SINGLE, 0,"",0,0,0,0)
  CALL AddGlobal("BCX_ClassName",vt_STRVAR, 0,"",0,0,0,0)


  SrcTmp$ = "GLOBAL BCX_hwndMDIClient AS HWND"       : Parse(SrcTmp$) : Emit()
  SrcTmp$ = "GLOBAL BCX_hInstance AS HINSTANCE"      : Parse(SrcTmp$) : Emit()
  SrcTmp$ = "GLOBAL BCX_WndClass  AS WNDCLASSEX"     : Parse(SrcTmp$) : Emit()
  SrcTmp$ = "GLOBAL BCX_GUI_Init  AS BOOL"           : Parse(SrcTmp$) : Emit()
  SrcTmp$ = "GLOBAL BcxPtr_hDC        AS HDC"        : Parse(SrcTmp$) : Emit()
  SrcTmp$ = "GLOBAL BcxPtr_FontMetrix AS LONG"       : Parse(SrcTmp$) : Emit()
  SrcTmp$ = "GLOBAL BcxPtr_LineCtr    AS LONG"       : Parse(SrcTmp$) : Emit()
  SrcTmp$ = "GLOBAL BcxPtr_PrinterOn  AS LONG"       : Parse(SrcTmp$) : Emit()
  SrcTmp$ = "GLOBAL BcxPtr_hFont      AS HFONT"      : Parse(SrcTmp$) : Emit()
  SrcTmp$ = "GLOBAL BcxPtr_hFontOld   AS HFONT"      : Parse(SrcTmp$) : Emit()
  SrcTmp$ = "GLOBAL BcxPtr_di         AS DOCINFO"    : Parse(SrcTmp$) : Emit()
  SrcTmp$ = "GLOBAL BcxPtr_Lf         AS LOGFONT"    : Parse(SrcTmp$) : Emit()
  SrcTmp$ = "GLOBAL BcxPtr_tm         AS TEXTMETRIC" : Parse(SrcTmp$) : Emit()
  SrcTmp$ = "GLOBAL BcxPtr_Text$"                    : Parse(SrcTmp$) : Emit()
  SrcTmp$ = "GLOBAL BcxPtr_Buffer$"                  : Parse(SrcTmp$) : Emit()
  SrcTmp$ = "GLOBAL BCX_siX AS SCROLLINFO"           : Parse(SrcTmp$) : Emit()
  SrcTmp$ = "GLOBAL BCX_siY AS SCROLLINFO"           : Parse(SrcTmp$) : Emit()
  SrcTmp$ = "GLOBAL BCX_DynaScroll AS INTEGER"       : Parse(SrcTmp$) : Emit()
  SrcTmp$ = "GLOBAL BCX_ViewWidth AS INTEGER"        : Parse(SrcTmp$) : Emit()
  SrcTmp$ = "GLOBAL BCX_ViewHeight AS INTEGER"       : Parse(SrcTmp$) : Emit()
  SrcTmp$ = "GLOBAL BCX_SmallChangeX AS INTEGER"     : Parse(SrcTmp$) : Emit()
  SrcTmp$ = "GLOBAL BCX_SmallChangeY AS INTEGER"     : Parse(SrcTmp$) : Emit()
  SrcTmp$ = "GLOBAL BCX_LargeChangeX AS INTEGER"     : Parse(SrcTmp$) : Emit()
  SrcTmp$ = "GLOBAL BCX_LargeChangeY AS INTEGER"     : Parse(SrcTmp$) : Emit()
  SrcTmp$ = "GLOBAL BCX_ScrollInit AS INTEGER"       : Parse(SrcTmp$) : Emit()
END SUB ' UseAll




SUB SetUsed
  DIM RAW i,x
  FOR i = 2 TO Ndx
    HFiles$[HFileCnt] = "#include " + DQ$ + EXTRACT$(Stk$[i],".") + ".h" + DQ$
    INCR HFileCnt
    OPEN Stk$[i] FOR INPUT AS fpUse
    WHILE NOT EOF(fpUse)
      LINE INPUT fpUse, Src$
      x = INSTR("ABCDEFGHIJKLMNOPQRSTUVWXYZ",UCASE$(MID$(Src$,5,1)))
      SELECT CASE x
        CASE 1
        IF Src$ = "Use_Abs" THEN Use_Abs = TRUE
        IF Src$ = "Use_Acosh" THEN Use_Acosh = TRUE
        IF Src$ = "Use_AnsiToWide" THEN Use_AnsiToWide = TRUE
        IF Src$ = "Use_AppActivate" THEN Use_AppActivate = TRUE
        IF Src$ = "Use_AppExeName" THEN Use_AppExeName = TRUE
        IF Src$ = "Use_AppExePath" THEN Use_AppExePath = TRUE
        IF Src$ = "Use_Asc" THEN Use_Asc = TRUE
        IF Src$ = "Use_Asinh" THEN Use_Asinh = TRUE
        IF Src$ = "Use_Atanh" THEN Use_Atanh = TRUE
        CASE  2
        IF Src$ = "Use_Bff" THEN Use_Bff = TRUE
        IF Src$ = "Use_Bin" THEN Use_Bin = TRUE
        IF Src$ = "Use_Bin2dec" THEN Use_Bin2dec = TRUE
        IF Src$ = "Use_Bitmap" THEN Use_Bitmap = TRUE
        IF Src$ = "Use_Blackrect" THEN Use_Blackrect = TRUE
        IF Src$ = "Use_BmpButton" THEN Use_BmpButton = TRUE
        IF Src$ = "Use_Boolstr" THEN Use_Boolstr = TRUE
        IF Src$ = "Use_Button" THEN Use_Button = TRUE
        CASE  3
        IF Src$ = "UseLCaseTbl" THEN UseLCaseTbl = TRUE
        IF Src$ = "Use_Center" THEN Use_Center = TRUE
        IF Src$ = "Use_Checkbox" THEN Use_Checkbox = TRUE
        IF Src$ = "Use_Chr" THEN Use_Chr = TRUE
        IF Src$ = "Use_Cint" THEN Use_Cint = TRUE
        IF Src$ = "Use_Clng" THEN Use_Clng = TRUE
        IF Src$ = "Use_Color" THEN Use_Color = TRUE
        IF Src$ = "Use_Combobox" THEN Use_Combobox = TRUE
        IF Src$ = "Use_ComboBoxLoadFile" THEN Use_ComboBoxLoadFile = TRUE
        IF Src$ = "Use_ContainedIn" THEN Use_ContainedIn = TRUE
        IF Src$ = "Use_Csrlin" THEN Use_Csrlin = TRUE
        IF Src$ = "Use_Cvd" THEN Use_Cvd = TRUE
        IF Src$ = "Use_Cvi" THEN Use_Cvi = TRUE
        IF Src$ = "Use_Cvl" THEN Use_Cvl = TRUE
        IF Src$ = "Use_Cvld" THEN Use_Cvld = TRUE
        IF Src$ = "Use_Cvs" THEN Use_Cvs = TRUE
        CASE  4
        IF Src$ = "Use_Datepick" THEN Use_Datepick = TRUE
        IF Src$ = "Use_Del" THEN Use_Del = TRUE
        IF Src$ = "Use_Doevents" THEN Use_Doevents = TRUE
        IF Src$ = "Use_Download" THEN Use_Download = TRUE
        IF Src$ = "Use_Draw" THEN Use_Draw = TRUE
        IF Src$ = "Use_DrawTransBMP" THEN Use_DrawTransBMP = TRUE
        IF Src$ = "Use_DSplit" THEN Use_DSplit = TRUE
        IF Src$ = "Use_Dynacall" THEN Use_Dynacall = TRUE
        IF Src$ = "Use_DynamicA" THEN Use_DynamicA = TRUE
        IF Src$ = "Use_DynStrqsorta" THEN Use_DynStrqsorta = TRUE
        IF Src$ = "Use_DynStrqsortd" THEN Use_DynStrqsortd = TRUE
        CASE  5
        IF Src$ = "Use_Edit" THEN Use_Edit = TRUE
        IF Src$ = "Use_Elf" THEN Use_Elf = TRUE
        IF Src$ = "Use_Enclose" THEN Use_Enclose = TRUE
        IF Src$ = "Use_Environ" THEN Use_Environ = TRUE
        IF Src$ = "Use_Exist" THEN Use_Exist = TRUE
        IF Src$ = "Use_Exp" THEN Use_Exp = TRUE
        IF Src$ = "Use_Extract" THEN Use_Extract = TRUE
        CASE  6
        IF Src$ = "Use_FileLocked" THEN Use_FileLocked = TRUE
        IF Src$ = "Use_FillArray" THEN Use_FillArray = TRUE
        IF Src$ = "Use_Findfirst" THEN Use_Findfirst = TRUE
        IF Src$ = "Use_Findnext" THEN Use_Findnext = TRUE
        IF Src$ = "Use_FirstInstance" THEN Use_FirstInstance = TRUE
        IF Src$ = "Use_FindInType" THEN Use_FindInType = TRUE
        CASE  7
        IF Src$ = "Use_GetDimension" THEN Use_GetDimension = TRUE
        IF Src$ = "Use_Getfilename" THEN Use_Getfilename = TRUE
        IF Src$ = "Use_GetSpecialFolder" THEN Use_GetSpecialFolder = TRUE
        IF Src$ = "Use_GetTextSize" THEN Use_GetTextSize = TRUE
        IF Src$ = "Use_Grayrect" THEN Use_Grayrect = TRUE
        IF Src$ = "Use_Group" THEN Use_Group = TRUE
        CASE  8
        IF Src$ = "Use_Hex" THEN Use_Hex = TRUE
        IF Src$ = "Use_Hex2Dec" THEN Use_Hex2Dec = TRUE
        IF Src$ = "Use_Hook" THEN Use_Hook = TRUE
        IF Src$ = "Use_Hscroll" THEN Use_Hscroll = TRUE
        CASE  9
        IF Src$ = "Use_Icon" THEN Use_Icon = TRUE
        IF Src$ = "Use_Idxqsort" THEN Use_Idxqsort = TRUE
        IF Src$ = "Use_IdxqsortSt" THEN Use_IdxqsortSt = TRUE
        IF Src$ = "Use_Iif" THEN Use_Iif = TRUE
        IF Src$ = "Use_Inchr" THEN Use_Inchr = TRUE
        IF Src$ = "Use_Infobox" THEN Use_Infobox = TRUE
        IF Src$ = "Use_Inkey" THEN Use_Inkey = TRUE
        IF Src$ = "Use_InkeyD" THEN Use_InkeyD = TRUE
        IF Src$ = "Use_Inputbox" THEN Use_Inputbox = TRUE
        IF Src$ = "Use_Ins" THEN Use_Ins = TRUE
        IF Src$ = "Use_Instr" THEN Use_Instr = TRUE
        IF Src$ = "Use_Instrrev" THEN Use_Instrrev = TRUE
        IF Src$ = "Use_IRemove" THEN Use_IRemove = TRUE
        IF Src$ = "Use_iReplace" THEN Use_iReplace = TRUE
        CASE  10
        IF Src$ = "Use_Join" THEN Use_Join = TRUE
        CASE  11
        CASE  12
        IF Src$ = "Use_Label" THEN Use_Label = TRUE
        IF Src$ = "UseFlag" THEN UseFlag = TRUE
        IF Src$ = "Use_Lcase" THEN Use_Lcase = TRUE
        IF Src$ = "Use_Left" THEN Use_Left = TRUE
        IF Src$ = "Use_Like" THEN Use_Like = TRUE
        IF Src$ = "Use_ListBoxLoadFile" THEN Use_ListBoxLoadFile = TRUE
        IF Src$ = "Use_Listview" THEN Use_Listview = TRUE
        IF Src$ = "Use_LoadFile" THEN Use_LoadFile = TRUE
        IF Src$ = "Use_Loc" THEN Use_Loc = TRUE
        IF Src$ = "Use_Locate" THEN Use_Locate = TRUE
        IF Src$ = "Use_Lof" THEN Use_Lof = TRUE
        IF Src$ = "Use_Lpad" THEN Use_Lpad = TRUE
        IF Src$ = "Use_Ltrim" THEN Use_Ltrim = TRUE
        CASE  13
        IF Src$ = "Use_Max" THEN Use_Max = TRUE
        IF Src$ = "Use_Mcase" THEN Use_Mcase = TRUE
        IF Src$ = "Use_Mid" THEN Use_Mid = TRUE
        IF Src$ = "Use_Midstr" THEN Use_Midstr = TRUE
        IF Src$ = "Use_Min" THEN Use_Min = TRUE
        IF Src$ = "Use_Mkd" THEN Use_Mkd = TRUE
        IF Src$ = "Use_Mki" THEN Use_Mki = TRUE
        IF Src$ = "Use_Mkl" THEN Use_Mkl = TRUE
        IF Src$ = "Use_Mkld" THEN Use_Mkld = TRUE
        IF Src$ = "Use_Mks" THEN Use_Mks = TRUE
        IF Src$ = "Use_Modstyle" THEN Use_Modstyle = TRUE
        IF Src$ = "Use_Msgbox" THEN Use_Msgbox = TRUE
        CASE  14
        IF Src$ = "Use_Now" THEN Use_Now = TRUE
        IF Src$ = "Use_Numqsortadouble" THEN Use_Numqsortadouble = TRUE
        IF Src$ = "Use_Numqsortafloat" THEN Use_Numqsortafloat = TRUE
        IF Src$ = "Use_Numqsortaint" THEN Use_Numqsortaint = TRUE
        IF Src$ = "Use_Numqsortddouble" THEN Use_Numqsortddouble = TRUE
        IF Src$ = "Use_Numqsortdfloat" THEN Use_Numqsortdfloat = TRUE
        IF Src$ = "Use_Numqsortdint" THEN Use_Numqsortdint = TRUE
        CASE  15
        IF Src$ = "Use_Oct" THEN Use_Oct = TRUE
        CASE  16
        IF Src$ = "Use_Panel" THEN Use_Panel = TRUE
        IF Src$ = "Use_PeekStr" THEN Use_PeekStr = TRUE
        IF Src$ = "Use_Pos" THEN Use_Pos = TRUE
        IF Src$ = "UseCpp" THEN UseCpp = TRUE
        IF Src$ = "Use_Printer" THEN Use_Printer = TRUE
        IF Src$ = "Use_ProgressBar" THEN Use_ProgressBar = TRUE
        IF Src$ = "Use_PtrqsortSt" THEN Use_PtrqsortSt = TRUE
        CASE  17
        IF Src$ = "Use_QBColor" THEN Use_QBColor = TRUE
        CASE  18
        IF Src$ = "Use_Radio" THEN Use_Radio = TRUE
        IF Src$ = "Use_Randomize" THEN Use_Randomize = TRUE
        IF Src$ = "Use_Rec" THEN Use_Rec = TRUE
        IF Src$ = "Use_RecCount" THEN Use_RecCount = TRUE
        IF Src$ = "Use_Remain" THEN Use_Remain = TRUE
        IF Src$ = "Use_Remove" THEN Use_Remove = TRUE
        IF Src$ = "Use_Repeat" THEN Use_Repeat = TRUE
        IF Src$ = "Use_Replace" THEN Use_Replace = TRUE
        IF Src$ = "Use_Retain" THEN Use_Retain = TRUE
        IF Src$ = "Use_Reverse" THEN Use_Reverse = TRUE
        IF Src$ = "Use_Right" THEN Use_Right = TRUE
        IF Src$ = "Use_Rnd" THEN Use_Rnd = TRUE
        IF Src$ = "Use_Round" THEN Use_Round = TRUE
        IF Src$ = "Use_Rpad" THEN Use_Rpad = TRUE
        IF Src$ = "Use_Rtrim" THEN Use_Rtrim = TRUE
        CASE  19
        IF Src$ = "Use_Scan" THEN Use_Scan = TRUE
        IF Src$ = "Use_SearchPath" THEN Use_SearchPath = TRUE
        IF Src$ = "Use_SetDimension" THEN Use_SetDimension = TRUE
        IF Src$ = "Use_SetFont" THEN Use_SetFont = TRUE
        IF Src$ = "Use_Sgn" THEN Use_Sgn = TRUE
        IF Src$ = "Use_Space" THEN Use_Space = TRUE
        IF Src$ = "Use_Split" THEN Use_Split = TRUE
        IF Src$ = "Use_Str" THEN Use_Str = TRUE
        IF Src$ = "Use_Strim" THEN Use_Strim = TRUE
        IF Src$ = "Use_String" THEN Use_String = TRUE
        IF Src$ = "Use_StrStr" THEN Use_StrStr = TRUE
        IF Src$ = "Use_Stristr" THEN Use_Stristr = TRUE
        IF Src$ = "Use_Strl" THEN Use_Strl = TRUE
        IF Src$ = "Use_Strqsorta" THEN Use_Strqsorta = TRUE
        IF Src$ = "Use_Strqsortd" THEN Use_Strqsortd = TRUE
        IF Src$ = "Use_Strtoken" THEN Use_Strtoken = TRUE
        IF Src$ = "Use_Str_Cmp" THEN Use_Str_Cmp = TRUE
        IF Src$ = "Use_Swap" THEN Use_Swap = TRUE
        IF Src$ = "Use_SysStr" THEN Use_SysStr = TRUE
        IF Src$ = "Use_sziif" THEN Use_sziif = TRUE
        CASE  20
        IF Src$ = "Use_Tally" THEN Use_Tally = TRUE
        IF Src$ = "Use_TempFileName" THEN Use_TempFileName = TRUE
        IF Src$ = "Use_Textmode" THEN Use_Textmode = TRUE
        IF Src$ = "Use_Timer" THEN Use_Timer = TRUE
        IF Src$ = "Use_Treeview" THEN Use_Treeview = TRUE
        IF Src$ = "Use_Trim" THEN Use_Trim = TRUE
        CASE  21
        IF Src$ = "Use_Ucase" THEN Use_Ucase = TRUE
        IF Src$ = "Use_Using" THEN Use_Using = TRUE
        CASE  22
        IF Src$ = "Use_VBS" THEN Use_VBS = TRUE
        IF Src$ = "Use_VChr" THEN Use_VChr = TRUE
        IF Src$ = "Use_Verify" THEN Use_Verify = TRUE
        CASE  23
        IF Src$ = "Use_Whiterect" THEN Use_Whiterect = TRUE
        IF Src$ = "Use_WideToAnsi" THEN Use_WideToAnsi = TRUE
      END SELECT
    WEND
    CLOSE fpUse
  NEXT
END SUB ' SetUsed


SUB SetFlags ' SetFlags
  OPEN Project$ FOR OUTPUT AS fpFlags
  IF Use_Abs THEN FPRINT fpFlags, "Use_Abs"
  IF Use_Acosh THEN FPRINT fpFlags, "Use_Acosh"
  IF Use_AnsiToWide THEN FPRINT fpFlags, "Use_AnsiToWide"
  IF Use_AppActivate THEN FPRINT fpFlags, "Use_AppActivate"
  IF Use_AppExeName THEN FPRINT fpFlags, "Use_AppExeName"
  IF Use_AppExePath THEN FPRINT fpFlags, "Use_AppExePath"
  IF Use_Asc THEN FPRINT fpFlags, "Use_Asc"
  IF Use_Asinh THEN FPRINT fpFlags, "Use_Asinh"
  IF Use_Atanh THEN FPRINT fpFlags, "Use_Atanh"
  IF Use_Bff THEN FPRINT fpFlags, "Use_Bff"
  IF Use_Bin THEN FPRINT fpFlags, "Use_Bin"
  IF Use_Bin2dec THEN FPRINT fpFlags, "Use_Bin2dec"
  IF Use_Bitmap THEN FPRINT fpFlags, "Use_Bitmap"
  IF Use_Blackrect THEN FPRINT fpFlags, "Use_Blackrect"
  IF Use_BmpButton THEN FPRINT fpFlags, "Use_BmpButton"
  IF Use_Boolstr THEN FPRINT fpFlags, "Use_Boolstr"
  IF Use_Button THEN FPRINT fpFlags, "Use_Button"
  IF Use_Center THEN FPRINT fpFlags, "Use_Center"
  IF Use_Checkbox THEN FPRINT fpFlags, "Use_Checkbox"
  IF Use_Chr THEN FPRINT fpFlags, "Use_Chr"
  IF Use_Cint THEN FPRINT fpFlags, "Use_Cint"
  IF Use_Clng THEN FPRINT fpFlags, "Use_Clng"
  IF Use_Color THEN FPRINT fpFlags, "Use_Color"
  IF Use_Combobox THEN FPRINT fpFlags, "Use_Combobox"
  IF Use_ComboBoxLoadFile THEN FPRINT fpFlags, "Use_ComboBoxLoadFile"
  IF Use_ContainedIn THEN FPRINT fpFlags, "Use_ContainedIn"
  IF Use_Csrlin THEN FPRINT fpFlags, "Use_Csrlin"
  IF Use_Cvd THEN FPRINT fpFlags, "Use_Cvd"
  IF Use_Cvi THEN FPRINT fpFlags, "Use_Cvi"
  IF Use_Cvl THEN FPRINT fpFlags, "Use_Cvl"
  IF Use_Cvld THEN FPRINT fpFlags, "Use_Cvld"
  IF Use_Cvs THEN FPRINT fpFlags, "Use_Cvs"
  IF Use_Datepick THEN FPRINT fpFlags, "Use_Datepick"
  IF Use_Del THEN FPRINT fpFlags, "Use_Del"
  IF Use_Doevents THEN FPRINT fpFlags, "Use_Doevents"
  IF Use_Download THEN FPRINT fpFlags, "Use_Download"
  IF Use_Draw THEN FPRINT fpFlags, "Use_Draw"
  IF Use_DrawTransBMP THEN FPRINT fpFlags, "Use_DrawTransBMP"
  IF Use_DSplit THEN FPRINT fpFlags, "Use_DSplit"
  IF Use_Dynacall AND NOT DllCnt THEN FPRINT fpFlags, "Use_Dynacall"
  IF Use_DynamicA THEN FPRINT fpFlags, "Use_DynamicA"
  IF Use_DynStrqsorta THEN FPRINT fpFlags, "Use_DynStrqsorta"
  IF Use_DynStrqsortd THEN FPRINT fpFlags, "Use_DynStrqsortd"
  IF Use_Edit THEN FPRINT fpFlags, "Use_Edit"
  IF Use_Elf THEN FPRINT fpFlags, "Use_Elf"
  IF Use_Enclose THEN FPRINT fpFlags, "Use_Enclose"
  IF Use_Environ THEN FPRINT fpFlags, "Use_Environ"
  IF Use_Exist THEN FPRINT fpFlags, "Use_Exist"
  IF Use_Exp THEN FPRINT fpFlags, "Use_Exp"
  IF Use_Extract THEN FPRINT fpFlags, "Use_Extract"
  IF Use_FileLocked THEN FPRINT fpFlags, "Use_FileLocked"
  IF Use_FillArray THEN FPRINT fpFlags, "Use_FillArray"
  IF Use_Findfirst THEN FPRINT fpFlags, "Use_Findfirst"
  IF Use_Findnext THEN FPRINT fpFlags, "Use_Findnext"
  IF Use_FirstInstance THEN FPRINT fpFlags, "Use_FirstInstance"
  IF Use_FindInType THEN FPRINT fpFlags, "Use_FindInType"
  IF Use_GetDimension THEN FPRINT fpFlags,"Use_GetDimension"
  IF Use_Getfilename THEN FPRINT fpFlags, "Use_Getfilename"
  IF Use_GetSpecialFolder THEN FPRINT fpFlags, "Use_GetSpecialFolder"
  IF Use_GetTextSize THEN FPRINT fpFlags, "Use_GetTextSize"
  IF Use_Grayrect THEN FPRINT fpFlags, "Use_Grayrect"
  IF Use_Group THEN FPRINT fpFlags, "Use_Group"
  IF Use_Hex THEN FPRINT fpFlags, "Use_Hex"
  IF Use_Hex2Dec THEN FPRINT fpFlags, "Use_Hex2Dec"
  IF Use_Hook THEN FPRINT fpFlags, "Use_Hook"
  IF Use_Hscroll OR Use_Vscroll THEN FPRINT fpFlags, "Use_Hscroll"
  IF Use_Icon THEN FPRINT fpFlags, "Use_Icon"
  IF Use_Idxqsort THEN FPRINT fpFlags, "Use_Idxqsort"
  IF Use_IdxqsortSt THEN FPRINT fpFlags, "Use_IdxqsortSt"
  IF Use_Iif THEN FPRINT fpFlags, "Use_Iif"
  IF Use_Inchr THEN FPRINT fpFlags, "Use_Inchr"
  IF Use_Infobox THEN FPRINT fpFlags, "Use_Infobox"
  IF Use_Inkey THEN FPRINT fpFlags, "Use_Inkey"
  IF Use_InkeyD THEN FPRINT fpFlags, "Use_InkeyD"
  IF Use_Inputbox OR Use_Infobox THEN FPRINT fpFlags, "Use_Inputbox"
  IF Use_Inputbox THEN FPRINT fpFlags, "Use_Inputbox"
  IF Use_Ins THEN FPRINT fpFlags, "Use_Ins"
  IF Use_Instr THEN FPRINT fpFlags, "Use_Instr"
  IF Use_Instrrev THEN FPRINT fpFlags, "Use_Instrrev"
  IF Use_IRemove THEN FPRINT fpFlags, "Use_IRemove"
  IF Use_iReplace THEN FPRINT fpFlags, "Use_iReplace"
  IF Use_Join THEN FPRINT fpFlags, "Use_Join"
  IF Use_Label THEN FPRINT fpFlags, "Use_Label"
  IF UseFlag THEN FPRINT fpFlags, "UseFlag"
  IF UseLCaseTbl THEN FPRINT fpFlags, "UseLCaseTbl"
  IF Use_Lcase THEN FPRINT fpFlags, "Use_Lcase"
  IF Use_Left THEN FPRINT fpFlags, "Use_Left"
  IF Use_Like THEN FPRINT fpFlags, "Use_Like"
  IF Use_ListBoxLoadFile THEN FPRINT fpFlags, "Use_ListBoxLoadFile"
  IF Use_Listview THEN FPRINT fpFlags, "Use_Listview"
  IF Use_LoadFile THEN FPRINT fpFlags, "Use_LoadFile"
  IF Use_Loc THEN FPRINT fpFlags, "Use_Loc"
  IF Use_Locate THEN FPRINT fpFlags, "Use_Locate"
  IF Use_Lof THEN FPRINT fpFlags, "Use_Lof"
  IF Use_Lpad THEN FPRINT fpFlags, "Use_Lpad"
  IF Use_Ltrim THEN FPRINT fpFlags, "Use_Ltrim"
  IF Use_Max THEN FPRINT fpFlags, "Use_Max"
  IF Use_Mcase THEN FPRINT fpFlags, "Use_Mcase"
  IF Use_Mid THEN FPRINT fpFlags, "Use_Mid"
  IF Use_Midstr THEN FPRINT fpFlags, "Use_Midstr"
  IF Use_Min THEN FPRINT fpFlags, "Use_Min"
  IF Use_Mkd THEN FPRINT fpFlags, "Use_Mkd"
  IF Use_Mki THEN FPRINT fpFlags, "Use_Mki"
  IF Use_Mkl THEN FPRINT fpFlags, "Use_Mkl"
  IF Use_Mkld THEN FPRINT fpFlags, "Use_Mkld"
  IF Use_Mks THEN FPRINT fpFlags, "Use_Mks"
  IF Use_Modstyle THEN FPRINT fpFlags, "Use_Modstyle"
  IF Use_Msgbox THEN FPRINT fpFlags, "Use_Msgbox"
  IF Use_Now THEN FPRINT fpFlags, "Use_Now"
  IF Use_Numqsortadouble THEN FPRINT fpFlags, "Use_Numqsortadouble"
  IF Use_Numqsortafloat THEN FPRINT fpFlags, "Use_Numqsortafloat"
  IF Use_Numqsortaint THEN FPRINT fpFlags, "Use_Numqsortaint"
  IF Use_Numqsortddouble THEN FPRINT fpFlags, "Use_Numqsortddouble"
  IF Use_Numqsortdfloat THEN FPRINT fpFlags, "Use_Numqsortdfloat"
  IF Use_Numqsortdint THEN FPRINT fpFlags, "Use_Numqsortdint"
  IF Use_Oct THEN FPRINT fpFlags, "Use_Oct"
  IF Use_Panel THEN FPRINT fpFlags, "Use_Panel"
  IF Use_PeekStr THEN FPRINT fpFlags, "Use_PeekStr"
  IF Use_Pos THEN FPRINT fpFlags, "Use_Pos"
  IF UseCpp THEN FPRINT fpFlags, "UseCpp"
  IF Use_Printer THEN FPRINT fpFlags, "Use_Printer"
  IF Use_ProgressBar THEN FPRINT fpFlags, "Use_ProgressBar"
  IF Use_PtrqsortSt THEN FPRINT fpFlags, "Use_PtrqsortSt"
  IF Use_QBColor THEN FPRINT fpFlags, "Use_QBColor"
  IF Use_Radio THEN FPRINT fpFlags, "Use_Radio"
  IF Use_Randomize THEN FPRINT fpFlags, "Use_Randomize"
  IF Use_Rec THEN FPRINT fpFlags, "Use_Rec"
  IF Use_RecCount THEN FPRINT fpFlags, "Use_RecCount"
  IF Use_Remain THEN FPRINT fpFlags, "Use_Remain"
  IF Use_Remove THEN FPRINT fpFlags, "Use_Remove"
  IF Use_Repeat THEN FPRINT fpFlags, "Use_Repeat"
  IF Use_Replace THEN FPRINT fpFlags, "Use_Replace"
  IF Use_Retain THEN FPRINT fpFlags, "Use_Retain"
  IF Use_Reverse THEN FPRINT fpFlags, "Use_Reverse"
  IF Use_Right THEN FPRINT fpFlags, "Use_Right"
  IF Use_Rnd THEN FPRINT fpFlags, "Use_Rnd"
  IF Use_Round THEN FPRINT fpFlags, "Use_Round"
  IF Use_Rpad THEN FPRINT fpFlags, "Use_Rpad"
  IF Use_Rtrim THEN FPRINT fpFlags, "Use_Rtrim"
  IF Use_Scan THEN FPRINT fpFlags, "Use_Scan"
  IF Use_SearchPath THEN FPRINT fpFlags, "Use_SearchPath"
  IF Use_SetDimension THEN FPRINT fpFlags,"Use_SetDimension"
  IF Use_SetFont THEN FPRINT fpFlags, "Use_SetFont"
  IF Use_Sgn THEN FPRINT fpFlags, "Use_Sgn"
  IF Use_Space THEN FPRINT fpFlags, "Use_Space"
  IF Use_Split THEN FPRINT fpFlags, "Use_Split"
  IF Use_Str THEN FPRINT fpFlags, "Use_Str"
  IF Use_Strim THEN FPRINT fpFlags, "Use_Strim"
  IF Use_String THEN FPRINT fpFlags, "Use_String"
  IF Use_Stristr THEN FPRINT fpFlags, "Use_Stristr"
  IF Use_StrStr THEN FPRINT fpFlags, "Use_StrStr"
  IF Use_Strl THEN FPRINT fpFlags, "Use_Strl"
  IF Use_Strqsorta THEN FPRINT fpFlags, "Use_Strqsorta"
  IF Use_Strqsortd THEN FPRINT fpFlags, "Use_Strqsortd"
  IF Use_Strtoken THEN FPRINT fpFlags, "Use_Strtoken"
  IF Use_Str_Cmp THEN FPRINT fpFlags, "Use_Str_Cmp"
  IF Use_Swap THEN FPRINT fpFlags, "Use_Swap"
  IF Use_SysStr THEN FPRINT fpFlags, "Use_SysStr"
  IF Use_sziif THEN FPRINT fpFlags, "Use_sziif"
  IF Use_Tally THEN FPRINT fpFlags, "Use_Tally"
  IF Use_TempFileName THEN FPRINT fpFlags, "Use_TempFileName"
  IF Use_Textmode THEN FPRINT fpFlags, "Use_Textmode"
  IF Use_Timer THEN FPRINT fpFlags, "Use_Timer"
  IF Use_Treeview THEN FPRINT fpFlags, "Use_Treeview"
  IF Use_Trim THEN FPRINT fpFlags, "Use_Trim"
  IF Use_Ucase THEN FPRINT fpFlags, "Use_Ucase"
  IF Use_Using THEN FPRINT fpFlags, "Use_Using"
  IF Use_VBS THEN FPRINT fpFlags, "Use_VBS"
  IF Use_VChr THEN FPRINT fpFlags, "Use_VChr"
  IF Use_Verify THEN FPRINT fpFlags, "Use_Verify"
  IF Use_Whiterect THEN FPRINT fpFlags, "Use_Whiterect"
  IF Use_WideToAnsi THEN FPRINT fpFlags, "Use_WideToAnsi"
  CLOSE fpFlags
END SUB ' SetFlags


'*******************************************************************
' Function to break up parameter string into parameter token blocks
' Note: Limited support for functions and array values as parameters
' 2009-01-26 - Wayne Halsdorf
'*******************************************************************
FUNCTION GetParameterTokens(sP$)
  RAW i AS Integer
  RAW j AS Integer
  RAW ParamTok$
  CALL FastLexer(sP$,"",",()[]")
  IF TALLY(sP$,"(") OR TALLY(sP$,"[") THEN
    FOR i = 1 TO Ndx
      Stk$[i] = TRIM$(Stk$[i])
    NEXT
    CALL RemEmptyTokens
    i = 1
    j = 0
    WHILE Stk[i][0]
      ParamTok$ = Stk$[i]
      IF ParamTok[0] <> 44 THEN
        IF Stk[i+1][0] <> 44 THEN
          DO
            i++
            IF i > Ndx THEN EXIT LOOP
            ParamTok$ = ParamTok$ + Stk$[i]
            WHILE (TALLY(ParamTok$,"[")-TALLY(ParamTok$,"]"))<>0 OR (TALLY(ParamTok$,"(")-TALLY(ParamTok$,")"))<>0
              i++
              ParamTok$ = ParamTok$ + Stk$[i]
            WEND
          LOOP WHILE Stk[i][0] <> 44 AND Stk[i][0]
        END IF
      END IF
      i++
      Stk$[++j] = ParamTok$
    WEND
    Ndx = j
    Stk$[Ndx + 1] = ""
  END IF
  FOR i = 1 TO Ndx+1
    ParamToken$[i] = Stk$[i]
  NEXT
  FUNCTION = Ndx
END FUNCTION  ' GetParameterTokens



' ************************************************************************************************************



FUNCTION JoinLines(Arg$)

  IF iMatchRgt(Arg$, " _") THEN
    Arg[LEN(Arg)-1] = 0
    CurLine$ = CurLine$ & Arg$
    FUNCTION = 1
  END IF

  IF *CurLine <> 0 THEN
    Arg$ = CurLine$ & Arg$
    CurLine$ = ""
  END IF
  UmQt = FALSE
  FUNCTION = 0
END FUNCTION



SUB StripCode( Arg$ )
  RAW p AS PCHAR
  RAW p2 = Arg AS PCHAR
  RAW asmFlag = 0
  RAW eStr = 0
  RAW sub_$

  WHILE (*p2 >8 AND *p2 < 13) OR *p2 = 32      'Trim leading space
    INCR p2
  WEND

  IF *p2 = ASC("!") THEN asmFlag = NOT UmQt    'Handle "!" Asm lines
  p = p2
  WHILE *p
    IF *p = 9 THEN *p = 32
    IF *p = 34 THEN ' ignore anything in string literal
      IF *(p-1) = 69 THEN ' we're in an extended string: E"\qABCD\n"
        *(p-1) = 1 ' chr$(1) will be deleted
        eStr = TRUE
      END IF
      WHILE *(++p) <> 34
        IF *p = 92 AND eStr THEN ' look for a \0, \t, \n, \r, \q, \\
          *p = 2
          SELECT CASE *(p+1)
            CASE 48  ' 0
            *(p+1) = 3
            CASE 116 ' t
            *(p+1) = 4
            CASE 110 ' n
            *(p+1) = 5
            CASE 114 ' r
            *(p+1) = 6
            CASE 113 ' q
            *(p+1) = 7
            CASE 92 ' \
            *(p+1) = 8
          END SELECT
          p++
        END IF
        IF *p = 0 THEN UmQt = NOT UmQt : EXIT WHILE
      WEND
    END IF
    ' If we're in a quoted continuation line then ignore comments
    IF NOT UmQt AND NOT asmFlag THEN
      'Remove REM's
      IF (*p BOR 32) = ASC("r") THEN
        IF _
          (*(p+1) BOR 32) = ASC("e") AND _
          (*(p+2) BOR 32) = ASC("m") AND _
          (*(p+3) = 32 OR *(p+3) = 0) THEN
          IF p = p2 OR *(p-1) = ASC(":") OR *(p-1) = 32 THEN
            *p = 0 : EXIT WHILE
          END IF
        END IF
      END IF
      ' check for single quote comment marker and //C++ style comments
      IF *p = ASC("'") OR (*p = ASC("/") AND *(p+1) = ASC("/")) THEN
        *p = 0 : EXIT WHILE
      END IF
    END IF
    p++
  WEND

  WHILE p2 < p
    'Trim trailing space
    WHILE (*(p-1) >8 AND *(p-1) < 13) OR *(p-1) = 32
      *(--p) = 0
    WEND

    IF UmQt OR asmFlag THEN EXIT WHILE

    'Strip dangling colons
    IF *(p-1) = ASC(":") AND *(p-2) = 32 THEN
      DECR p
    ELSE
      EXIT WHILE
    END IF
  WEND
  IF eStr THEN
    REPLACE CHR$(1) WITH "" IN p2$  ' E
    REPLACE CHR$(2) WITH "" IN p2$ ' \ first backslash
    '---
    sub_$ = DQ$+"+CHR$(0)+"+DQ$
    REPLACE CHR$(3) WITH sub_$ IN p2$  ' 0
    sub_$ = DQ$+"+CHR$(9)+"+DQ$
    REPLACE CHR$(4) WITH sub_$ IN p2$  ' t
    sub_$ = DQ$+"+CHR$(10)+"+DQ$
    REPLACE CHR$(5) WITH sub_$ IN p2$ ' n
    sub_$ = DQ$+"+CHR$(13)+"+DQ$
    REPLACE CHR$(6) WITH sub_$ IN p2$ ' r
    sub_$ = DQ$+"+CHR$(34)+"+DQ$
    REPLACE CHR$(7) WITH sub_$ IN p2$ ' q
    sub_$ = DQ$+"+CHR$(92)+"+DQ$
    REPLACE CHR$(8) WITH sub_$ IN p2$ ' \
    '---
    REPLACE (CHR$(34)+CHR$(34)+CHR$(43)) WITH "" IN p2$
    REPLACE (CHR$(43)+CHR$(34)+CHR$(34)) WITH "" IN p2$
    '---
  END IF
  Arg$ = p2$
END SUB






SUB ProcSingleLineIf(BYREF ifFlag)
  DIM RAW Tmp$, ifp, NdIfs
  DIM STATIC EFlag
  IF ifFlag = 0 THEN EFlag = 0

  REDO:
  IF SplitCnt > 120 THEN Abort("Stack Overflow - Too many statements on one line")
  Tmp$ = SplitStk$[SplitCnt] & SPC$

  IF iMatchLft(Tmp$, "if ") THEN
    ifp = iMatchNQ(Tmp$, " then ")
    IF ifp THEN
      SplitStk$[SplitCnt++] = LEFT$(Tmp$,ifp+4)
      SplitStk$[SplitCnt] = LTRIM$(Tmp+ifp+4)
      EFlag = MAX(0,EFlag-1) : INCR (ifFlag)
      GOTO REDO
    END IF

  ELSEIF (ifFlag) THEN
    IF iMatchLft(Tmp$, "else ") THEN   '"else xxx"
      LftLse:
      IF ++EFlag > 1 THEN
        NdIfs = MAX(1,(ifFlag)-1) : (ifFlag) = 1 : EFlag = 0
        IF iMatchWrd(SplitStk$[SplitCnt-1],"else") THEN DECR SplitCnt
        REPEAT NdIfs : SplitStk$[SplitCnt++] = "END IF" : END REPEAT
      END IF

      SplitStk$[SplitCnt++] = "ELSE"
      SplitStk$[SplitCnt] = TRIM$(Tmp+4)
      GOTO REDO
    ELSE
      ifp = iMatchNQ(Tmp$, " else ")
      IF ifp THEN                      '"xxx else xxx"
        SplitStk$[SplitCnt++] = RTRIM$(LEFT$(Tmp$, ifp-1))
        Tmp$ = MID$(Tmp$, ifp+1)
        GOTO LftLse
      END IF
    END IF
  END IF         'process "if/then/else"
END SUB




FUNCTION SplitLines(Arg$)
  DIM RAW p  = Arg AS PCHAR
  DIM RAW st = Arg AS PCHAR
  DIM RAW i = 0, IfFlag = 0, SpcolonFlag = 0
  DIM RAW ParaCnt = 0
  IF *p = ASC("!") OR *p = ASC("$") THEN EXIT FUNCTION

  WHILE *p
    IF *p = 32 THEN SpcolonFlag = 1
    IF *p = 34 THEN ' ignore anything in string literal
      WHILE *(++p) <> 34
        IF *p = 0 THEN FUNCTION = SplitCnt
      WEND
    END IF

    IF *p = 40 THEN ParaCnt++
    IF *p = 41 THEN ParaCnt--

    IF *p = ASC(":") THEN
      IF *(p+1) <> 0 OR SpcolonFlag THEN

        WHILE *st = 32
          st++
        WEND         'Forward past leading spaces

        SplitCnt++
        WHILE st < p                         'Copy new string
          SplitStk[SplitCnt][i++] = *(st++)
        WEND

        WHILE SplitStk[SplitCnt][i-1] = 32   'Trim trailing spaces
          i--
        WEND
        SplitStk[SplitCnt][i] = 0            'Add a string terminator
        IF ParaCnt = 0 THEN
          i=0
          st++   'advance to next start position
          ProcSingleLineIf(&IfFlag)
        ELSE
          SplitCnt--
        END IF
      END IF         'if NOT End of line
    END IF           'if :
    p++
  WEND

  'Add the last string
  IF SplitCnt > 0 THEN
    WHILE *st = 32
      st++
    WEND  'Forward past leading spaces
    SplitCnt++
    WHILE *st
      SplitStk[SplitCnt][i++] = *(st++)
    WEND
    SplitStk[SplitCnt][i] = 0
    ProcSingleLineIf(&IfFlag)
    'Process single line if/thens that don't contain colon separated statements
  ELSEIF iMatchLft(Arg$,"if ") AND NOT iMatchRgt(Arg$," then") THEN
    SplitStk$[++SplitCnt] = Arg$
    ProcSingleLineIf(&IfFlag)
  END IF

  'If we processed single line "if/then" then close it up
  IF IfFlag THEN
    WHILE IfFlag
      SplitStk$[++SplitCnt] = "END IF"
      IfFlag--
    WEND
  END IF

  FUNCTION = SplitCnt
END FUNCTION


'----------------------------------------------
'Case insensitive comparison - MatchStr$ to Arg$
' mt = 0, 1 or 2 Match left, whole word, right
'----------------------------------------------
CONST iMatchLft(A,B) = iMatch(A,B,0)
CONST iMatchWrd(A,B) = iMatch(A,B,1)
CONST iMatchRgt(A,B) = iMatch(A,B,2)

FUNCTION iMatch(Arg$, MatchStr$, mt)

  IF mt = 2 THEN
    DIM RAW L1, L2
    L1 = LEN(Arg$) : L2 = LEN(MatchStr$)
    IF L1 < L2 THEN EXIT FUNCTION
    Arg = (Arg + L1) - L2
  END IF

  WHILE *MatchStr
    'If we run out string to match against then return no match
    IF *Arg = 0 THEN EXIT FUNCTION
    'bit ORing a character with 0x20 produces the lower case of it
    IF (*Arg BOR 32) <> (*MatchStr BOR 32) THEN EXIT FUNCTION
    INCR Arg
    INCR MatchStr
  WEND
  IF mt AND *Arg <> 0 THEN EXIT FUNCTION
  FUNCTION = 1
END FUNCTION


'----------------------------------------------
'Returns the position of the first occurrence
'of MatchStr$ in Arg$ that isn't in quotes.
'----------------------------------------------
FUNCTION iMatchNQ(Arg$, MatchStr$)
  DIM RAW mi=0
  DIM RAW a = Arg AS PCHAR

  WHILE MatchStr[mi]
    IF *a = 34 THEN
      mi=0
      WHILE *(++a) <> 34
        IF *a = 0 THEN EXIT FUNCTION
      WEND
    END IF

    IF a[mi] = 0 THEN EXIT FUNCTION
    'If we run out string to match against then return no match
    'bit ORing a character with 0x20 produces the lower case of it
    IF (a[mi] BOR 32) <> (MatchStr[mi] BOR 32) THEN
      INCR a : mi= -1
    END IF
    INCR mi
  WEND
  FUNCTION = (a-Arg) + 1  ' We have a match
END FUNCTION




FUNCTION SpecialCaseHandler(Arg$)
  DIM RAW i,j
  DIM RAW lsz$

  IF iMatchNQ(Arg$," sub ") OR iMatchNQ(Arg$," function ") THEN EXIT FUNCTION

  '**************************************************
  ' Handle Multiple Dim's, Locals, Globals, Shared's
  ' Example: DIM a, b!, c$, d$*1000, q[100] AS DWORD
  '**************************************************
  lsz$ =  SPC$ & EXTRACT$(Arg$," ") & SPC$

  IF iMatchNQ(" dim , local , global , raw , static , shared , dynamic , auto , register , extern ", lsz$) THEN

    CALL FastLexer(Arg$," ",",(){}")

    ' tolerate nonsense like DIM A% as double
    FOR i = 1 TO Ndx
      IF iMatchWrd(Stk$[i],"as") THEN
        Stk$[i-1] = Clean$(Stk$[i-1])
      END IF
    NEXT

    Stk$[2] = SPC$ & Stk$[2] & SPC$
    IF iMatchNQ(" raw local dynamic register static shared auto ",Stk$[2]) THEN
      Stk$[1] = Stk$[1] & Stk$[2]
      Stk$[2] = ""
    END IF
    INCR SrcCnt
    j=0
    FOR i = 1 TO Ndx
      IF Stk[i][0] = ASC("(") THEN INCR j
      IF Stk[i][0] = ASC("{") THEN INCR j
      IF Stk[i][0] = ASC(")") THEN DECR j
      IF Stk[i][0] = ASC("}") THEN DECR j
      IF Stk[i][0] = ASC(",") AND NOT j THEN
        Stk$[i]  = Stk$[1]
        INCR SrcCnt
      END IF
      SrcStk$[SrcCnt] = SrcStk$[SrcCnt] + Stk$[i] + " "
    NEXT
    GOTO ProcessNew
  END IF


  IF InDialogEvt OR ModDialogEvt THEN
    IF iMatchNQ(Arg$,"WM_INITDIALOG") THEN
      SrcStk$[++SrcCnt]=Arg$
      SrcStk$[++SrcCnt]="SetDialogScale(hWnd,0)"
      GOTO ProcessNew
    END IF
  END IF


  SELECT CASE TRUE

    '******************************
    CASE iMatchLft(Arg$,"on ")     ' on expression gosub | goto | call  label1,label2,Sub...
    '******************************
    DIM RAW Target
    j = 0
    CALL FastLexer(Arg$," ",",")

    FOR i = 1 TO Ndx
      IF iMatchLft(Stk$[i],"gosub") OR _
        iMatchLft(Stk$[i],"goto")  OR _
        iMatchLft(Stk$[i],"call")  THEN
        Target = i+1
        EXIT FOR
      END IF
    NEXT

    SrcStk$[++SrcCnt] = "select case "        'Assemble our expression
    FOR i = 2 TO Target - 2
      SrcStk$[SrcCnt] = SrcStk$[SrcCnt]+" "+ Stk$[i]
    NEXT

    FOR i = Target TO Ndx
      IF Stk$[i] = "," THEN ITERATE
      INCR j
      SrcStk$[++SrcCnt] = "case"  +  STR$(j)
      SrcStk$[++SrcCnt] = Stk$[Target-1]  +  " "  +  Stk$[i]
    NEXT
    SrcStk$[++SrcCnt] = "end select"

    GOTO ProcessNew

    '******************************
    CASE iMatchLft(Arg$,"loop ")
    '******************************
    CALL FastLexer(Arg$," ",",()")

    IF iMatchLft(Stk$[2],"until") THEN
      SrcStk$[++SrcCnt] = "if "
      FOR i = 3 TO Ndx
        SrcStk$[SrcCnt] = SrcStk$[SrcCnt] + Stk$[i] + " "
      NEXT
      SrcStk$[SrcCnt] = SrcStk$[SrcCnt] + " then"
      SrcStk$[++SrcCnt] = "exit loop"
      SrcStk$[++SrcCnt] = "end if"
      SrcStk$[++SrcCnt] = "loop"
      GOTO ProcessNew

    ELSEIF iMatchLft(Stk$[2],"while") THEN
      SrcStk$[++SrcCnt] = "if NOT ("
      FOR i = 3 TO Ndx
        SrcStk$[SrcCnt] = SrcStk$[SrcCnt] + Stk$[i] + " "
      NEXT
      SrcStk$[SrcCnt] = SrcStk$[SrcCnt] + ") then"
      SrcStk$[++SrcCnt] = "exit loop"
      SrcStk$[++SrcCnt] = "end if"
      SrcStk$[++SrcCnt] = "loop"
      GOTO ProcessNew
    ELSE
      IF Ndx > 1 THEN
        Abort("UNKNOWN Word " + Stk$[2] + " After LOOP")
      END IF
    END IF

    '******************************
    CASE iMatchLft(Arg$,"do ")
    '******************************
    CALL FastLexer(Arg$," ",",()")

    IF iMatchLft(Stk$[2],"until") THEN
      SrcStk$[++SrcCnt] = "do"
      SrcStk$[++SrcCnt] = "if "
      FOR i = 3 TO Ndx
        SrcStk$[SrcCnt] = SrcStk$[SrcCnt] + Stk$[i] + " "
      NEXT
      SrcStk$[SrcCnt] = SrcStk$[SrcCnt] + "then"
      SrcStk$[++SrcCnt] = "exit loop"
      SrcStk$[++SrcCnt] = "end if"
      GOTO ProcessNew

    ELSEIF iMatchLft(Stk$[2],"while") THEN
      SrcStk$[++SrcCnt] = "while "
      FOR i = 3 TO Ndx
        SrcStk$[SrcCnt] = SrcStk$[SrcCnt] + Stk$[i] + " "
      NEXT
      GOTO ProcessNew

    ELSE
      IF Ndx > 1 THEN
        Abort("UNKNOWN Word " + Stk$[2] + " After DO")
      END IF
    END IF
  END SELECT

  EXIT FUNCTION

  ProcessNew:

  Ndx = i = 0
  WHILE SrcCnt
    Arg$ = SrcStk$[++i]
    SrcStk$[i] = ""
    DECR SrcCnt
    CALL Parse(Arg$)
    IF Ndx THEN CALL Emit
  WEND
  FUNCTION = TRUE
END FUNCTION



'*************************************************************
'delim1$ = delimiters to be removed
'delim2$ = delimiters to keep
'Stk$ and Ndx are Global
'As long as Ndx is honored Stk does not need to be initialized
'*************************************************************
SUB FastLexer OPTIONAL(Arg$, delim1$, delim2$, TokQuote = 1)
  DIM RAW cnt1=0, cnt2=0
  DIM RAW pd1 AS PCHAR, pd2 AS PCHAR
  Ndx=1

  WHILE Arg[cnt1]

    IF Arg[cnt1] = 34 THEN      'quotes - string literals
      IF cnt2 AND TokQuote THEN Stk[Ndx++][cnt2]=0 : cnt2=0
      Stk[Ndx][cnt2] = 34
      WHILE Arg[++cnt1] <> 34
        Stk[Ndx][++cnt2] = Arg[cnt1]
        '        IF Arg[cnt1] = 92 AND Arg[cnt1+1] = 34 AND Arg[cnt1+2] = 34 THEN
        '          Stk[Ndx][++cnt2] = Arg[++cnt1]
        '        END IF
        IF Arg[cnt1] = 0 THEN EXIT SUB
      WEND
      Stk[Ndx][++cnt2] = Arg[cnt1]
      IF TokQuote THEN
        Stk[Ndx++][++cnt2]=0
        cnt2=0
        GOTO again
      END IF
    END IF

    pd1 = delim1
    WHILE *pd1
      IF *(pd1++) = Arg[cnt1] THEN
        IF cnt2 THEN Stk[Ndx++][cnt2]=0 : cnt2=0
        GOTO again
      END IF
    WEND

    pd2 = delim2
    WHILE *pd2
      IF *(pd2++) = Arg[cnt1] THEN
        IF cnt2 THEN Stk[Ndx++][cnt2]=0
        Stk[Ndx][0] = Arg[cnt1]
        Stk[Ndx++][1]=0 : cnt2 = 0
        GOTO again
      END IF
    WEND

    Stk[Ndx][cnt2++]=Arg[cnt1]
    again:
    INCR cnt1
  WEND
  Stk[Ndx][cnt2]=0
  IF cnt2 = 0 THEN DECR Ndx
END SUB




SUB InsertTokens(PosAfter, NumTokens, ...)
  DIM RAW ap AS va_list, i

  FOR i = Ndx TO PosAfter+1 STEP -1
    Stk$[i+NumTokens] = Stk$[i]
  NEXT i

  va_start(ap,NumTokens)
  FOR i = PosAfter+1 TO PosAfter+NumTokens
    Stk$[i] = va_arg(ap, char*)
  NEXT i
  va_end(ap)
  INCR Ndx,NumTokens
END SUB




SUB EmitExportDef(fs$)
  STATIC beenhere
  DIM RAW fname$, funcname$
  DIM RAW i, st=1, sz=0
  fname$ = EXTRACT$(FileIn$,".") + ".def"

  IF NOT beenhere THEN
    OPEN fname$ FOR OUTPUT AS fpdef
    _splitpath(FileIn$, NULL, NULL, fname$, NULL)
    FPRINT fpdef,"LIBRARY ", ENC$(fname$)
    FPRINT fpdef, "EXPORTS"
    beenhere = TRUE
  END IF

  FastLexer(fs$, "", "(,)")
  WHILE *Stk$[st] <> ASC("(")
    INCR st
  WEND

  FOR i = st+1 TO Ndx
    IF *Stk$[i] = ASC(")") THEN EXIT
    IF *Stk$[i] <> ASC(",") THEN
      IF INCHR(Stk$[i],"*") THEN INCR sz,4 : ITERATE

      IF INSTR(Stk$[i],"longlong",1,1) OR _
        INSTR(Stk$[i],"double",1,1)    OR _
        INSTR(Stk$[i],"long long") THEN
        INCR sz,8
        ITERATE
      END IF
      IF NOT INCHR(Stk$[i],"void") THEN INCR sz,4
    END IF
  NEXT
  Stk$[1] = TRIM$(Stk$[1])
  funcname$ = MID$(Stk$[1],INSTRREV(Stk$[1]," ") + 1)
  FPRINT fpdef,funcname$," = _",funcname$,"@",LTRIM$(STR$(sz))
  'CloseAll is called at the end of AddProtos
END SUB




FUNCTION GetArg$(ArgNum, fp AS functionParse PTR)

  DIM RAW RetArg$
  DIM RAW ArgEnd   = fp->CommaPos[ArgNum] - 1
  DIM RAW ArgStart = fp->CommaPos[ArgNum - 1] + 1
  RetArg$ = ""

  IF ArgNum >= fp->NumArgs THEN ArgEnd = Ndx

  FOR ArgStart = ArgStart TO ArgEnd
    CONCAT(RetArg$, Stk$[ArgStart])
  NEXT ArgStart

  FUNCTION = RetArg$
END FUNCTION


FUNCTION SepFuncArgs(Strt, fp AS functionParse PTR, functionflag AS INTEGER)
  DIM RAW CountR = 0 '()[] counter
  DIM RAW i = Strt 'loop counter

  IF functionflag THEN
    WHILE i <= Ndx
      IF Stk[i][0] = ASC("(") THEN EXIT WHILE
      INCR i
    WEND
    Strt = i + 1

    fp->NumArgs = 0 'comma counter
    fp->CommaPos[0] = i 'Strt-1
    IF Strt > Ndx THEN
      FUNCTION = 0
    END IF
  ELSE
    Strt = 2
    fp->CommaPos[0] = 1
  END IF

  IF *Stk$[Strt] = ASC(")") THEN
    fp->CommaPos[1] = Strt
    FUNCTION = 0
  END IF
  fp->NumArgs = 1

  FOR i = Strt TO Ndx
    IF *Stk$[i] = ASC("(") OR *Stk$[i] = ASC("[") THEN
      CountR++
    ELSEIF *Stk$[i] = ASC(")") OR *Stk$[i] = ASC("]") THEN
      IF CountR = 0 THEN
        fp->CommaPos[fp->NumArgs] = i
        EXIT FOR
      END IF
      CountR--
    ELSEIF *Stk$[i] = ASC(",") AND CountR = 0 THEN
      fp->CommaPos[fp->NumArgs] = i
      INCR fp->NumArgs
    END IF
  NEXT
  IF functionflag = 0 THEN fp->CommaPos[fp->NumArgs] = Ndx

  FUNCTION = fp->NumArgs 'Number of commas + 1 = Number of arguments
END FUNCTION ' SepFuncArgs


FUNCTION MakeDecProto(fp AS functionParse PTR) AS LPSTR

  DIM RAW fpp AS functionParse
  DIM RAW FunType$
  DIM RAW AsType$
  DIM RAW AsArrys$
  DIM RAW FoundAs
  DIM RAW pointer   = 0
  DIM RAW i,ii
  DIM RAW OptValue$
  DIM RAW OptFlag   = 0
  STATIC Proto$
  STATIC SubFunPtr

  IF SubFunPtr THEN GOTO argparse

  Proto$   = ""
  FunType$ = ""

  'Determine function type
  '-----------------------------------------------------

  IF iMatchWrd(Stk$[2], "sub") THEN
    FunType$ = "void"
  ELSEIF *Stk$[Ndx] = ASC(")") THEN
    'check for type identifier suffix
    'if unknown, then integer will default
    FunType$ = VarTypeLookup$[ INCHR(VarTypes$, RIGHT$(Stk$[3],1)) ]
  ELSE
    FOR i = Ndx TO fp->CommaPos[fp->NumArgs]+1 STEP -1
      IF iMatchWrd(Stk$[i], "ptr") THEN
        INCR pointer
      ELSEIF iMatchWrd(Stk$[i], "as") THEN
        EXIT FOR
      ELSE
        FunType$ = Stk$[i] + SPC$ + FunType$
      END IF
    NEXT
  END IF

  'INCR pointer, TALLY(FunType$, "*")
  'RemoveAll(FunType$, "*", 1)

  IF InTypeDef THEN
    Proto$ = FunType$ + "  " + STRING$(pointer, ASC("*")) + " (" + CallType$ + "*" + Clean$(Stk$[3]) + ")("
    DIM RAW Var$, w, id, vt
    Var$ = FunType$ + STRING$(pointer, ASC("*"))
    GetTypeInfo(Var$, &w, &id, &vt)
    AddTypedefElement(BaseTypeDefsCnt[InTypeDef],vt, Clean$(Stk$[3]), FunType$, 0)
  ELSEIF SFPOINTER THEN
    Proto$ = "typedef " + FunType$ + " (" + CallType$ + "*" + Clean$(Stk$[3]) + "_TYPE)("
  ELSEIF NOT NoTypeDeclare THEN
    Proto$ = "typedef " + FunType$ + " (" + CallType$ + "*BCXFPROT" + LTRIM$(STR$(DllCnt)) + ")("
  ELSE
    IF UseCProto THEN
      UseCProto = FALSE
      Proto$ = FunType$ + "  " + STRING$(pointer, ASC("*")) + SPC$ + CallType$ + Clean$(Stk$[3]) + "("
    ELSE
      Proto$ = "C_IMPORT " + FunType$ + "  " + STRING$(pointer, ASC("*")) + SPC$ + CallType$ + Clean$(Stk$[3]) + "("
    END IF
  END IF
  '-----------------------------------------------------

  argparse:
  '-----------------------------------------------------
  'Determine argument types
  '-----------------------------------------------------
  IF fp->NumArgs = 0 THEN
    Proto$ = Proto$ + "void)"

  ELSE

    FOR ii = 0 TO fp->NumArgs - 1

      OptValue$ = ""
      AsType$   = ""
      AsArrys$  = ""
      pointer   = 0
      FoundAs   = 0

      DIM RAW FirstToken  = fp->CommaPos[ii] + 1
      DIM RAW LastToken   = fp->CommaPos[ii+1] - 1
      DIM RAW NumOfTokens = (LastToken - FirstToken) + 1

      i = INCHR(Stk$[FirstToken], "[")
      IF i THEN
        AsArrys$ = MID$(Stk$[FirstToken], i)
        Stk[FirstToken][i-1] = 0
      END IF

      IF NumOfTokens = 1 THEN
        '--------------------------------------------------------
        ' The bracket handling should be handled better.
        ' currently using the preprocessing of FunSubDecs1
        ' which converts A![] to *A! and A$[] to *A$[][2048]
        ' and A[] as xxx to A as xxx*
        '--------------------------------------------------------
        AsType$ = VarTypeLookup$[ INCHR(VarTypes$, RIGHT$(Stk$[FirstToken],1)) ]
        IF *AsArrys$ THEN
          REMOVE "*" FROM AsType$
        ELSE
          pointer = TALLY(Stk$[FirstToken], "*")
        END IF
        '--------------------------------------------------------
        FoundAs = TRUE
      ELSE

        FOR i = LastToken TO FirstToken STEP -1
          IF iMatchWrd(Stk$[i], "ptr") OR *Stk$[i] = ASC("*") THEN
            INCR pointer

          ELSEIF iMatchWrd(Stk$[i], "sub") THEN
            SepFuncArgs(fp->CommaPos[ii]+2, &fpp, TRUE)
            Proto$ = Proto$ + "void (*)("
            SubFunPtr = FoundAs = TRUE
            MakeDecProto(&fpp)
            SubFunPtr = FALSE
            EXIT FOR

          ELSEIF iMatchWrd(Stk$[i], "function") THEN
            SepFuncArgs(fp->CommaPos[ii]+2, &fpp, TRUE)
            IF AsType$ = "" THEN
              AsType$ = VarTypeLookup$[ INCHR( VarTypes$, RIGHT$(Stk$[FirstToken],1)) ]
            END IF
            Proto$ = Proto$ + RTRIM$(AsType$) + STRING$(pointer,ASC("*")) + " (*)("
            pointer = 0
            AsType$ = ""
            SubFunPtr = FoundAs = TRUE
            MakeDecProto(&fpp)
            SubFunPtr = FALSE
            EXIT FOR

          ELSEIF iMatchWrd(Stk$[i], "as") THEN
            IF AsType$ = "" THEN Abort("No type specified for argument" + STR$(ii+1))
            FoundAs = TRUE
            EXIT FOR

          ELSEIF *Stk$[i] = ASC("=") THEN
            OptFlag = FoundAs = TRUE
            OptValue$ = " =" + AsType$
            AsType$ = ""
            IF i = FirstToken + 1 THEN
              AsType$ = VarTypeLookup$[ INCHR( VarTypes$, RIGHT$(Stk$[FirstToken],1)) ]
              IF *AsArrys$ THEN
                REMOVE "*" FROM AsType$
              ELSE
                pointer = TALLY(Stk$[FirstToken], "*")
              END IF
              EXIT FOR
            END IF

          ELSE
            IF *Stk$[i] <> ASC(".") THEN
              AsType$ = Stk$[i] + SPC$ + AsType$
            ELSE
              IF *Stk$[i-1] = ASC(".") THEN
                IF OptFlag THEN Abort("Default value not allowed when using variable arguments")
                IF ii <> (fp->NumArgs-1) THEN Abort("Variable argument must be the last parameter")
                IF fp->NumArgs = 1 THEN Abort("Variable argument must be preceded by at least one other parameter")
                FoundAs = TRUE
              END IF
              AsType$ = Stk$[i] + AsType$
            END IF
          END IF
        NEXT i
      END IF
      IF NOT FoundAs THEN Abort("Malformed argument type in parameter" + STR$(ii + 1))
      IF ii <> fp->NumArgs AND OptFlag AND OptValue$ = "" THEN Warning("No default value specified for parameter" + STR$(ii + 1), 1)
      Proto$ = Proto$ + RTRIM$(AsType$) + AsArrys$ + STRING$(pointer,ASC("*")) + OptValue$ + Stk$[fp->CommaPos[ii+1]]
    NEXT ii
    '-----------------------------------------------------
  END IF

  FUNCTION = Proto
END SUB




SUB AddGUIGlobals
  STATIC nTimes = 0
  IF nTimes > 0 THEN EXIT SUB
  CALL AddGlobal("BcxFont"          ,vt_HFONT     ,0,"",0,0,0,0)
  CALL AddGlobal("BCX_ScaleX"       ,vt_SINGLE    ,0,"",0,0,0,0)
  CALL AddGlobal("BCX_ScaleY"       ,vt_SINGLE    ,0,"",0,0,0,0)
  CALL AddGlobal("BCX_hInstance"    ,vt_HINSTANCE ,0,"",0,0,0,0)
  CALL AddGlobal("BCX_hwndMDIClient",vt_HWND      ,0,"",0,0,0,0)
  CALL AddGlobal("BCX_WndClass"     ,vt_WNDCLASSEX,0,"",0,0,0,0)
  CALL AddGlobal("BCX_GUI_Init"     ,vt_BOOL      ,0,"",0,0,0,0)
  CALL AddGlobal("BCX_ClassName"    ,vt_STRVAR    ,0,"",0,0,0,0)
  nTimes++
END SUB



SUB AsmUnknownStructs(CompArrays)

  DIM RAW InBrace  = 0
  DIM RAW InStruct = 0, i
  DIM RAW sztemp$

  FOR i = 2 TO Ndx

    ' --------------------------------
    ' Complete arrays
    ' --------------------------------

    IF CompArrays THEN
      IF Stk$[i] = "[" THEN
        sztemp$ = Stk$[i-1] : Stk$[i-1] = ""
        DO
          sztemp$ = sztemp$ + Stk[i]
          IF Stk$[i] = "]" THEN DECR InBrace
          IF Stk$[i] = "[" THEN INCR InBrace
          Stk$[i] = ""
          INCR i
        LOOP WHILE InBrace AND i <= Ndx
        Stk$[--i] = sztemp$
      END IF
    END IF

    ' --------------------------------
    ' Complete unknown struct members
    ' --------------------------------
    IF LEN(Stk$[i]) > 1 AND NOT IsNumber(Stk$[i]+1) THEN
      IF *Stk$[i] = ASC(".") OR iMatchLft(Stk$[i], "->") THEN
        IF InStruct = 0 THEN
          Stk$[i] = Stk$[i-1] + Stk$[i]
          Stk$[i-1] = ""
          InStruct = i
        ELSE
          CONCAT(Stk$[InStruct], Stk$[i])
          Stk$[i] = ""
        END IF
        ITERATE
      END IF
    END IF

    IF *Stk$[i] AND InStruct > 0 THEN
      '? STR$(ModuleLineNos[ModuleNdx]), Stk$[InStruct] , STR$(CompArrays)
      InStruct = 0
    END IF
  NEXT i

  CALL RemEmptyTokens
END SUB




SUB EmitIfCond(CondType$)
  '*********************************************************************
  ' Speedup/Optimize for statements like --->  if a$    = ""  THEN
  '               AND                    --->  if a$[1] = ""  THEN
  '*********************************************************************
  DIM RAW TestString, A, B, ParCnt, Tmp
  DIM RAW IsWhile = FALSE
  DIM RAW szTest$

  TestString = DataType(Stk$[2])

  IF TestString = vt_STRVAR THEN
    IF Stk$[4] = DDQ$ THEN
      Stk$[2] = Clean$(Stk$[2]) + "[0]"
      Stk$[4] = "0"
    ELSEIF Stk$[3] = "[" AND Stk$[7] = DDQ$ THEN
      Stk$[2] = Clean$(Stk$[2])
      CONCAT (Stk$[5],"[0]")
      Stk$[7] = "0"
    END IF
  END IF

  IF CondType$ = "while" THEN IsWhile = TRUE

  '********************   If, ElseIf, & While Handler   *********************

  FPRINT Outfile, Scoot$, CondType$, "(";

  Tmp = 2
  WHILE Stk$[Tmp] = "(" OR Stk$[Tmp] = "!"
    FPRINT Outfile, Stk$[Tmp];
    Tmp++
  WEND

  TestString = FALSE

  A = DataType(Stk$[Tmp])
  IF A = vt_STRLIT OR A = vt_STRVAR THEN
    IF Stk$[Tmp + 1] <> ")" AND NOT iMatchWrd(Stk$[Tmp+1], "then") THEN
      TestString  = TRUE
      Use_Str_Cmp = TRUE
      FPRINT Outfile, "str_cmp(";
    END IF
  END IF

  szTest$ = ""
  ParCnt  = 0

  DO
    IF TestString THEN
      IF Stk$[Tmp] = "=" THEN
        Stk$[Tmp] = ","
        szTest$   = ")==0"
        ParCnt    =  0
      ELSEIF Stk$[Tmp] = "!=" THEN
        Stk$[Tmp] = ","
        szTest$   = ")!=0"
        ParCnt    = 0
      ELSEIF Stk$[Tmp] = ">" THEN
        IF Stk$[Tmp + 1] = "=" THEN
          Stk$[Tmp] = ","
          szTest$   = ")>=0"
          Stk$[Tmp + 1] = ""
        ELSE
          Stk$[Tmp] = ","
          szTest$   = ")==1"
        END IF
        ParCnt = 0
      ELSEIF Stk$[Tmp] = "<" THEN
        IF Stk$[Tmp + 1] = "=" THEN
          Stk$[Tmp] = ","
          szTest$   = ")<=0"
          Stk$[Tmp + 1] = ""
        ELSE
          Stk$[Tmp] = ","
          szTest$   = ")==-1"
        END IF
        ParCnt = 0
      ELSEIF Stk$[Tmp] = "(" THEN
        ParCnt++
      ELSEIF Stk$[Tmp] = ")" THEN
        ParCnt--
      END IF

      IF Stk$[Tmp] = ")" AND szTest$ <> "" AND ParCnt < 0 THEN
        FPRINT Outfile, szTest$, Stk$[Tmp];
        szTest$ = ""
      ELSE
        IF Stk$[Tmp] = "||" OR Stk$[Tmp] = "&&" THEN
          Stk$[Tmp] = szTest$ + " " + Stk$[Tmp] + " "
          szTest$ = ""
          B = 1
          WHILE Stk$[Tmp + B] = "("
            CONCAT (Stk$[Tmp],"(")
            Stk$[Tmp + B] = ""
            B++
          WEND
          A = DataType(Stk$[Tmp+B])      ' look ahead
          IF (A = vt_STRLIT OR A = vt_STRVAR) AND Stk$[Tmp+B+1] <> ")" THEN
            CONCAT (Stk$[Tmp]," str_cmp(")
            Use_Str_Cmp = TRUE
          ELSE
            FPRINT Outfile,Clean$(Stk$[Tmp]);
            TestString = FALSE
            GOTO NxtToken
          END IF
        END IF
        FPRINT Outfile, Clean$(Stk$[Tmp]);
      END IF
    ELSE  'Not TestString
      IF Stk$[Tmp] = "||" OR Stk$[Tmp] = "&&" THEN
        B = 1
        WHILE Stk$[Tmp + B] = "("
          CONCAT (Stk$[Tmp], "(")
          Stk$[Tmp + B] = ""
          B++
        WEND
        A = DataType(Stk$[Tmp+B])     ' look ahead
        IF (A = vt_STRLIT OR A = vt_STRVAR) AND Stk$[Tmp+B+1] <> ")" THEN
          CONCAT (Stk$[Tmp],"str_cmp(" )
          TestString  = TRUE
          Use_Str_Cmp = TRUE
          szTest$     = ""
          ParCnt      = 0
          FPRINT Outfile, Clean$(Stk$[Tmp]);
          GOTO NxtToken
        END IF
      END IF

      IF Stk$[Tmp]= "!" THEN
        FPRINT Outfile,Stk$[Tmp];
      ELSE
        FPRINT Outfile,Clean$(Stk$[Tmp]);
      END IF

      IF Stk$[Tmp] = "=" THEN
        IF Stk$[Tmp-1] <> "<" AND Stk$[Tmp-1] <> ">" THEN
          IF Stk$[Tmp+1] <> ">" AND Stk$[Tmp+1] <> "<" THEN
            FPRINT Outfile,"=";
          END IF
        END IF
      END IF

    END IF

    NxtToken:

    INCR Tmp

    IF NOT IsWhile THEN
      IF iMatchWrd(Stk$[Tmp], "then") THEN
        EXIT LOOP
      ELSEIF Tmp > Ndx THEN
        Abort("If Without THEN")
      END IF
    END IF

  LOOP UNTIL Tmp > Ndx

  FPRINT Outfile, szTest$, ")"
  CALL BumpUp
  FPRINT Outfile, Scoot$, "{"
  CALL BumpUp

END SUB






SUB PrintGlobal(A, idx, Storage$, P$, VarName$, VarDim$)
  DIM RAW VAR$

  SELECT CASE A
    ' handle exceptions
    CASE vt_FILEPTR
    REMOVE "@" FROM VarName$
    FPRINT Outfile,Storage$;"FILE   *";P$;VarName$;VarDim$;";"

    CASE vt_UDT, vt_STRUCT, vt_UNION
    VAR$ = TypeDefs[GlobalVars[idx].VarDef].VarName$
    VAR$ = RPAD$(VAR$, 7)
    FPRINT Outfile,Storage$;VAR$;" ";P$;VarName$;VarDim$;";"

    CASE vt_LPSTRPTR
    FPRINT Outfile,Storage$;"LPSTR  *";VarName$;VarDim$;";"

    CASE vt_LPSTR
    FPRINT Outfile,Storage$;"LPSTR  ";P$;VarName$;VarDim$;";"

    CASE vt_BOOL
    FPRINT Outfile,Storage$;"BOOL    ";VarName$;VarDim$;";"

    CASE vt_STRVAR
    IF VarDim$ = "" THEN VarDim$ = "[2048]"
    FPRINT Outfile,Storage$;"char    ";P$;VarName$;VarDim$;";"

    CASE vt_WNDCLASSEX
    FPRINT Outfile,Storage$;"WNDCLASSEX   ";P$;VarName$;VarDim$;";"

    CASE vt_HFONT
    FPRINT Outfile,Storage$;"HFONT   ";P$;VarName$;VarDim$;";"

    ' handle normal

    CASE vt_VarMin TO vt_VarMax
    VAR$ = GetVarTypeName$(GlobalVars[idx].VarType)
    VAR$ = RPAD$(VAR$, 7)
    FPRINT Outfile,Storage$;VAR$;" ";P$;VarName$;VarDim$;";"

  END SELECT
END SUB





SUB ReDirectFPrint(TgtFile@, pat$, ...)  'Used primarily to bump gLinesWritten
  DIM RAW ap AS va_list

  IF DoCountLines AND TgtFile = FP3 THEN
    INCR gLinesWritten
  END IF

$COMMENT   ' -------- For debugging and testing -----------
STATIC F2InIf$
DIM RAW temp AS PCHAR

   IF TgtFile = FP2 THEN
      IF iMatchLft(pat$, "%s") THEN
         va_start(ap, pat$)
         temp = va_arg(ap, PCHAR)
         va_end(ap)
         IF iMatchLft(temp$, "#if") THEN
            F2InIf$ = temp$
         END IF
      END IF
   END IF
$COMMENT '-------------------------------------------------

  va_start(ap, pat$)
  vfprintf(TgtFile, pat$, ap)
  va_end(ap)
END SUB






SET ReservedWord[] AS CHAR PTR
  "IF",
  "ELSEIF",
  "THEN",
  "ELSE",
  "AND",
  "OR",
  "NOT",
  "BOR",
  "BAND",
  "XOR",
  "PRINT",
  ""
END SET




FUNCTION IsReservedWord(match$)
  DIM mat$
  mat$ = UCASE$(match$)
  IF CONTAINEDIN(mat$,ReservedWord) = 0 THEN FUNCTION = 1
  FUNCTION = 0
END FUNCTION

SUB InitReservedWordsLookup()
  RAW MaxReservedWords AS Integer
  RAW sL$
  RAW iC AS Integer
  RAW iD AS Integer
  GLOBAL DYNAMIC iBCXWORDCNT[1] AS Integer
  GLOBAL DYNAMIC iBCXWORDCNTNDX[1] AS Integer

  MaxReservedWords = SIZEOF(BCXWords)/SIZEOF(tagTokenSuFunctions)    ' How many reserved words
  REDIM iBCXWORDCNT[MaxReservedWords]
  REDIM iBCXWORDCNTNDX[MaxReservedWords]

  sL$ = ""
  FOR iC = 0 TO 96
    iRIndex[iC][0] = MaxReservedWords-1
    iRIndex[iC][1] = 0
  NEXT
  FOR iC = 0 TO MaxReservedWords-1
    IF sL$ > BCXWords[iC].spFunctionName$ THEN
      CALL Abort("Error in BCXWords[], Names out of order"+CRLF$+sL$+" comes after "+BCXWords[iC].spFunctionName$+CRLF$+"Correct and recompile")
    END IF

    'IF BCXWords[iC].fpTranslate = NULL AND BCXWords[iC].spFunctionXName[0] = 0  THEN
    '  CALL Abort("Error in BCXWords[], Missing either .spFunctionXName OR .fpTranslate FOR "+BCXWords[iC].spFunctionName$+CRLF$+STR$(iC)+" Lines from BCXWords[]")
    'END IF

    'IF BCXWords[iC].fpTranslate AND BCXWords[iC].spFunctionXName[0]  THEN
    '  CALL Abort("Error in BCXWords[], Only direct substitution when both .spFunctionXName AND .fpTranslate are not NULL/EMPTY FOR "+BCXWords[iC].spFunctionName$+CRLF$+STR$(iC)+" Lines from BCXWords[]")
    'END IF

    sL$ = BCXWords[iC].spFunctionName$
    iD = ASC(sL$)-32
    IF iD < 0 THEN iD = 0
    IF iD > 96 THEN iD = 96
    IF iRIndex[iD][0] > iC THEN iRIndex[iD][0] = iC
    IF iRIndex[iD][1] < iC THEN iRIndex[iD][1] = iC
  NEXT
  FOR iC = 0 TO 96
    IF iRIndex[iC][0] > iRIndex[iC][1] THEN iRIndex[iC][0] = iRIndex[iC][1]
    iRIndex[iC][1]++
  NEXT
END SUB

FUNCTION GetWordInfo(sWord$) AS tagTokenSuFunctions PTR
  RAW iH AS Integer
  RAW iL AS Integer
  RAW iM AS Integer
  RAW iV AS Integer
  iM = ASC(sWord$)-32
  IF iM < 0 THEN iM = 0
  IF iM > 96 THEN iM = 96
  iL = iRIndex[iM][0]
  iH = iRIndex[iM][1]

  DO
    iM = (iH + iL)>>1
    iV = strcmp(BCXWords[iM].spFunctionName, sWord)
    SELECT CASE iV
      CASE -1
      IF iL <> iH THEN
        IF iL = iM THEN
          iL++
        ELSE
          iL = iM
        END IF
      END IF
      CASE 0
      iBCXWORDCNT[iM]++
      FUNCTION = &BCXWords[iM]
      CASE 1
      IF iL <> iH THEN
        iH = iM
      END IF
    END SELECT
  LOOP UNTIL iL = iH
  FUNCTION = NULL
END FUNCTION


' Must be in lower case and in alphabetical order
SET tBcxWords[] AS tagWords
  {"abs",vt_DOUBLE},
  {"absl",vt_LDOUBLE},
  {"acos",vt_DOUBLE},
  {"acosh",vt_DOUBLE},
  {"acosl",vt_LDOUBLE},
  {"asin",vt_DOUBLE},
  {"asinh",vt_DOUBLE},
  {"asinl",vt_LDOUBLE},
  {"atan",vt_DOUBLE},
  {"atanh",vt_DOUBLE},
  {"atanl",vt_DOUBLE},
  {"band",vt_DECFUNC},
  {"bin2dec",vt_INTEGER},
  {"bor",vt_DECFUNC},
  {"cos",vt_DOUBLE},
  {"cosh",vt_DOUBLE},
  {"cosl",vt_LDOUBLE},
  {"csrlin",vt_DECFUNC},
  {"cursorx",vt_DECFUNC},
  {"cursory",vt_DECFUNC},
  {"dsplit",vt_DECFUNC},
  {"exist",vt_DECFUNC},
  {"exp",vt_DOUBLE},
  {"expl",vt_LDOUBLE},
  {"FindFirstInstance",vt_DECFUNC},
  {"fint",vt_INTEGER},
  {"fix",vt_DECFUNC},
  {"frac",vt_DOUBLE},
  {"fracl",vt_LDOUBLE},
  {"getattr",vt_DECFUNC},
  {"hex2dec",vt_INTEGER},
  {"hypot",vt_DOUBLE},
  {"hypotl",vt_LDOUBLE},
  {"iif",vt_DOUBLE},
  {"inchr",vt_DECFUNC},
  {"instr",vt_DECFUNC},
  {"instrrev",vt_DECFUNC},
  {"kbhit",vt_DECFUNC},
  {"lof",vt_DOUBLE},
  {"log",vt_DOUBLE},
  {"log10",vt_DOUBLE},
  {"log10l",vt_LDOUBLE},
  {"logl",vt_LDOUBLE},
  {"max",vt_DOUBLE},
  {"min",vt_DOUBLE},
  {"msgbox",vt_DECFUNC},
  {"pos",vt_DECFUNC},
  {"pow",vt_DOUBLE},
  {"powl",vt_LDOUBLE},
  {"qbcolor",vt_DECFUNC},
  {"rnd",vt_SINGLE},
  {"round",vt_DOUBLE},
  {"screen",vt_DECFUNC},
  {"sgn",vt_DECFUNC},
  {"sin",vt_DOUBLE},
  {"sinh",vt_DOUBLE},
  {"sinl",vt_LDOUBLE},
  {"sizeof",vt_DECFUNC},
  {"split",vt_DECFUNC},
  {"sqrt",vt_DOUBLE},
  {"sqrtl",vt_LDOUBLE},
  {"strlen",vt_DECFUNC},
  {"tally",vt_DECFUNC},
  {"tan",vt_DOUBLE},
  {"tanh",vt_DOUBLE},
  {"tanl",vt_LDOUBLE},
  {"textmode",vt_DOUBLE},
  {"timer",vt_SINGLE},
  {"val",vt_DOUBLE},
  {"vall",vt_LDOUBLE}
END SET

SET tTypes[] AS tagWords
  {"bool",vt_BOOL},
  {"boolean",vt_BOOL},
  {"byte",vt_BYTE},
  {"char",vt_CHAR},
  {"colorref",vt_COLORREF},
  {"double",vt_DOUBLE},
  {"dword",vt_DWORD},
  {"farproc",vt_FARPROC},
  {"file",vt_FILEPTR},
  {"float",vt_SINGLE},
  {"handle",vt_HANDLE},
  {"hdc",vt_HDC},
  {"hfont",vt_HFONT},
  {"hwnd",vt_HWND},
  {"int",vt_INTEGER},
  {"ldouble",vt_LDOUBLE},
  {"long",vt_LONG},
  {"longlong",vt_LLONG},
  {"lpbyte",vt_LPBYTE},
  {"lpstr",vt_LPSTR},
  {"lresult",vt_LRESULT},
  {"pchar",vt_PCHAR},
  {"short",vt_SHORT},
  {"string",vt_STRVAR},
  {"uint",vt_UINT},
  {"ulong",vt_ULONG},
  {"ulonglong",vt_ULONG},
  {"ushort",vt_USHORT},
  {"variant",vt_VARIANT},
  {"void",vt_VOID},
  {"wndclassex",vt_WNDCLASSEX}
END SET

FUNCTION FindWord(sWord$, tWordList  AS tagWords PTR,iWordsInTable AS Integer) AS Integer
  RAW iH AS Integer
  RAW iL AS Integer
  RAW iM AS Integer
  RAW iV AS Integer
  iL = 0
  iH = iWordsInTable 'SIZEOF(tBcxWords)/SIZEOF(tagWords)    ' How many reserved words

  WHILE iL <> iH
    iM = (iH + iL)>>1
    iV = strcmp(tWordList[iM].pszWord, sWord)
    SELECT CASE iV
      CASE -1
      IF iL = iM THEN FUNCTION = -1
      iL = iM
      CASE 0
      FUNCTION = iM
      CASE 1
      IF iL = iM THEN FUNCTION = -1
      iH = iM
    END SELECT
  WEND
  FUNCTION = -1
END FUNCTION

