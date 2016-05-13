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

IF %version%==%newestversion% (
  ::If the current installed version mathces the latest version
  echo Your version is up to date!
  )

IF %version% LSS %newestversion% (
  ::If the current installed version is older than the latest version
  goto UPDATE
  )

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

:UPDATE
  echo Your version is out of date!
  echo Updating now!
  rem Windows has no built-in wget or curl, so generate a VBS script to do it:
  rem -------------------------------------------------------------------------
  set DLOAD_SCRIPT=%temp%\download.vbs
  echo Option Explicit                                                    >  %DLOAD_SCRIPT%
  echo Dim args, http, fileSystem, adoStream, url, target, status         >> %DLOAD_SCRIPT%
  echo.                                                                   >> %DLOAD_SCRIPT%
  echo Set args = Wscript.Arguments                                       >> %DLOAD_SCRIPT%
  echo Set http = CreateObject("WinHttp.WinHttpRequest.5.1")              >> %DLOAD_SCRIPT%
  echo url = args(0)                                                      >> %DLOAD_SCRIPT%
  echo target = args(1)                                                   >> %DLOAD_SCRIPT%
  echo WScript.Echo "Getting '" ^& target ^& "' from '" ^& url ^& "'..."  >> %DLOAD_SCRIPT%
  echo.                                                                   >> %DLOAD_SCRIPT%
  echo http.Open "GET", url, False                                        >> %DLOAD_SCRIPT%
  echo http.Send                                                          >> %DLOAD_SCRIPT%
  echo status = http.Status                                               >> %DLOAD_SCRIPT%
  echo.                                                                   >> %DLOAD_SCRIPT%
  echo If status ^<^> 200 Then                                            >> %DLOAD_SCRIPT%
  echo    WScript.Echo "FAILED to download: HTTP Status " ^& status       >> %DLOAD_SCRIPT%
  echo    WScript.Quit 1                                                  >> %DLOAD_SCRIPT%
  echo End If                                                             >> %DLOAD_SCRIPT%
  echo.                                                                   >> %DLOAD_SCRIPT%
  echo Set adoStream = CreateObject("ADODB.Stream")                       >> %DLOAD_SCRIPT%
  echo adoStream.Open                                                     >> %DLOAD_SCRIPT%
  echo adoStream.Type = 1                                                 >> %DLOAD_SCRIPT%
  echo adoStream.Write http.ResponseBody                                  >> %DLOAD_SCRIPT%
  echo adoStream.Position = 0                                             >> %DLOAD_SCRIPT%
  echo.                                                                   >> %DLOAD_SCRIPT%
  echo Set fileSystem = CreateObject("Scripting.FileSystemObject")        >> %DLOAD_SCRIPT%
  echo If fileSystem.FileExists(target) Then fileSystem.DeleteFile target >> %DLOAD_SCRIPT%
  echo adoStream.SaveToFile target                                        >> %DLOAD_SCRIPT%
  echo adoStream.Close                                                    >> %DLOAD_SCRIPT%
  echo.                                                                   >> %DLOAD_SCRIPT%
  rem -------------------------------------------------------------------------
  cscript //Nologo %DLOAD_SCRIPT% https://raw.githubusercontent.com/gcsdnewfolder/newfolder/master/nf.bat "Menu - %newestversion%.bat"
  del "%temp%\download.vbs"
GOTO MENU
CLS
:: Execute Menu Options End
