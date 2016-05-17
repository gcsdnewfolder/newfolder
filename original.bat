ECHO OFF
CLS
:MENU
ECHO.
ECHO ...............................................
ECHO PRESS 1, 2, 3, 4 OR 5 to select your task, or 6 to EXIT.
ECHO ...............................................
ECHO.
ECHO 1 - Open Notepad
ECHO 2 - Open Calculator
ECHO 3 - Open Notepad AND Calculator
ECHO 4 - Open Music
ECHO 5 - Open CMD
ECHO 6 - EXIT
ECHO.
SET /P M=Type 1, 2, 3, 4, 5, or 6 then press ENTER:
IF %M%==1 GOTO NOTE
IF %M%==2 GOTO CALC
IF %M%==3 GOTO BOTH
IF %M%==4 GOTO MUSIC
IF %M%==5 GOTO CMD
IF %M%==6 GOTO EOF
:NOTE
cd %windir%\system32\notepad.exe
start notepad.exe
GOTO MENU
CLEAR
:CALC
cd %windir%\system32\calc.exe
start calc.exe
GOTO MENU
clear
:BOTH
cd %windir%\system32\notepad.exe
start notepad.exe
cd %windir%\system32\calc.exe
start calc.exe
GOTO MENU
clear
:CMD
cd %windir%\system32\cmd.exe
start cmd.exe
GOTO MENU
clear
:MUSIC
cd M:\Olympia\Student\New folder\New folder
start Music.vbs
GOTO MENU
clear
