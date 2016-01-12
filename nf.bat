:: New Folder Menu Script

SET version=1.0
TITLE New Folder Menu %version%
ECHO OFF
CLS
color 3f

:: Version Check Start
@echo off
 >"%temp%\geturl.vbs" echo Set objArgs = WScript.Arguments
>>"%temp%\geturl.vbs" echo url = objArgs(0)
>>"%temp%\geturl.vbs" echo pix = objArgs(1)
>>"%temp%\geturl.vbs" echo With CreateObject("MSXML2.XMLHTTP")
>>"%temp%\geturl.vbs" echo .open "GET", url, False
>>"%temp%\geturl.vbs" echo .send
>>"%temp%\geturl.vbs" echo a = .ResponseBody
>>"%temp%\geturl.vbs" echo End With
>>"%temp%\geturl.vbs" echo With CreateObject("ADODB.Stream")
>>"%temp%\geturl.vbs" echo .Type = 1 'adTypeBinary
>>"%temp%\geturl.vbs" echo .Mode = 3 'adModeReadWrite
>>"%temp%\geturl.vbs" echo .Open
>>"%temp%\geturl.vbs" echo .Write a
>>"%temp%\geturl.vbs" echo .SaveToFile pix, 2 'adSaveCreateOverwrite
>>"%temp%\geturl.vbs" echo .Close
>>"%temp%\geturl.vbs" echo End With

cscript /nologo "%temp%\geturl.vbs" https://raw.githubusercontent.com/gcsdnewfolder/newfolder/master/version.html newestversion.adv 2>nul 
del "%temp%\geturl.vbs"
:: Version Check End

set /p newestversion= <newestversion.adv
ECHO.
echo newestversion=%newestversion% and version=%version%

:: Menu Start
:MENU
ECHO.
ECHO ...............................................
ECHO PRESS 1, 2, 3, 4 OR 5 to select your task, or 6 to EXIT.
ECHO ...............................................
ECHO.
ECHO 1 - Open Notepad
ECHO 2 - Open Calculator
ECHO 3 - Open Internet Explorer
ECHO 4 - Open Music
ECHO 5 - Open CMD
ECHO 6 - EXIT
ECHO.
SET /P M=Type 1, 2, 3, 4, 5, or 6 then press ENTER:
IF %M%==1 GOTO NOTE
IF %M%==2 GOTO CALC
IF %M%==3 GOTO IE
IF %M%==4 GOTO MUSIC
IF %M%==5 GOTO CMD
IF %M%==6 GOTO EOF
:: Menu End

:: Execute Menu Options Start
:NOTE
cd %windir%\system32\notepad.exe
start notepad.exe
GOTO MENU
CLS

:CALC
cd %windir%\system32\calc.exe
start calc.exe
GOTO MENU
CLS

:IE
cd "C:\Program Files\Internet Explorer\iexplore.exe"
start iexplore.exe
GOTO MENU
CLS

:CMD
cd %windir%\system32\cmd.exe
start cmd.exe
GOTO MENU
CLS

:MUSIC
cd M:\Olympia\Student\New folder\New folder
start Music.vbs
GOTO MENU
CLS
:: Execute Menu Options End
