:: New Folder Menu Script

SET page=1
SET version=1.0
TITLE New Folder Menu %version%
ECHO OFF
CLS
color 3f

::Password Check 1 Start
:PASSCHECK1
CLS
ECHO.
ECHO ...............................................
ECHO About 70 degress shwelshius? 
ECHO ...............................................
ECHO.
SET /P M=Type answer then press ENTER: 
IF NOT %M%==woot_woot GOTO PASSCHECK1
::Password Check 1 End

:: Version Check Start
:VERCHECK
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

GOTO PAGE%page%

:: Menu Start
:MENU
CLS
ECHO.
ECHO ERROR 404 Page Not Found.
ECHO.
ECHO ERROR INVALID PAGE
ECHO ERROR INVALID PAGE
ECHO ERROR INVALID PAGE
ECHO ERROR INVALID PAGE
ECHO ERROR INVALID PAGE
ECHO ERROR INVALID PAGE
ECHO.
SET /P M=Type 1 then press ENTER:
IF %M%==1 GOTO PAGE%page%
IF ELSE (
	GOTO MENU
	)
:: Menu End

:: Page 1 Start
:PAGE1
SET page=1
CLS
ECHO Page 1
ECHO.
ECHO ...............................................
ECHO PRESS 1, 2, 3, 4, 5 OR 6 to select your task.
ECHO ...............................................
ECHO.
ECHO 1 - Open Notepad
ECHO 2 - Open Calculator
ECHO 3 - Open Internet Explorer
ECHO 4 - Open Music
ECHO 5 - Open CMD
ECHO 6 - Next Page
ECHO.
SET /P M=Type 1, 2, 3, 4, 5, or 6 then press ENTER:
IF %M%==1 GOTO NOTE
IF %M%==2 GOTO CALC
IF %M%==3 GOTO IE
IF %M%==4 GOTO MUSIC
IF %M%==5 GOTO CMD
IF %M%==6 GOTO PAGE2
IF ELSE (
	GOTO PAGE1
	)
:: Page 1 End

:: Page 2 Start
:PAGE2
SET page=2
CLS
ECHO Page 2
ECHO.
ECHO ...............................................
ECHO PRESS 1, 2, 3, 4, 5 OR 6 to select your task, or 7 to Exit.
ECHO ...............................................
ECHO.
ECHO 1 - Open Chrome
ECHO 2 - Open Paint
ECHO 3 - Open Internet Explorer(In Private)
ECHO 4 - Open Chrome(Incognito)
ECHO 5 - Open New Folder(Coming Soon)
ECHO 6 - Previous Page
ECHO 7 - Exit
ECHO.
SET /P M=Type 1, 2, 3, 4, 5, or 6 then press ENTER:
IF %M%==1 GOTO CHROME
IF %M%==2 GOTO PAINT
IF %M%==3 GOTO IEIP
IF %M%==4 GOTO CHROMEI
IF %M%==5 GOTO PAGE2
IF %M%==6 GOTO PAGE1
IF %M%==7 GOTO EOF
IF ELSE (
	GOTO PAGE2
	)
:: Page 2 End

:: Execute Menu Options Start
:NOTE
cd %windir%\system32\notepad.exe
start notepad.exe
GOTO PAGE%page%
CLS

:CALC
cd %windir%\system32\calc.exe
start calc.exe
GOTO PAGE%page%
CLS

:IE
cd "C:\Program Files\Internet Explorer\iexplore.exe"
start iexplore.exe
GOTO PAGE%page%
CLS

:CMD
cd %windir%\system32\cmd.exe
start cmd.exe
GOTO PAGE%page%
CLS

:MUSIC
cd M:\Olympia\Student\New folder\New folder
start Music.vbs
GOTO PAGE%page%
CLS

:IEIP
cd "C:\Program Files\Internet Explorer\iexplore.exe"
start "" "iexplore.exe" -private
GOTO PAGE%page%
CLS

:CHROME
cd "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
start chrome.exe
GOTO PAGE%page%
CLS

:CHROMEI
cd "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
start "" "chrome.exe"  -incognito
GOTO PAGE%page%
CLS

:PAINT
cd %windir%\system32\mspaint.exe
start mspaint.exe
GOTO PAGE%page%
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
GOTO PAGE%page%
CLS
:: Execute Menu Options End
