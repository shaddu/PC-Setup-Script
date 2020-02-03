@echo off
CLS
set currentpath=%cd%
echo "Starting automatic file installation by chocolatey"
echo "Script created by Shadab"
echo "Run in admin mode"
echo "current path is "
echo %~dp0
ECHO.
:MENU
ECHO ...............................................
ECHO PRESS 1, 2 OR 3 to Start installion, or 4 to EXIT.
ECHO FIRST TIME press 3!
ECHO ...............................................
ECHO.
ECHO 1 - Basic apps
ECHO 2 - Developer apps
ECHO 3 - Install Chocolatey
ECHO 4 - Upgrade apps
ECHO 5 - EXIT
ECHO.


SET /P M=Type 1, 2, 3, or 4 then press ENTER:
IF %M%==1 GOTO GEN
IF %M%==2 GOTO GEN
IF %M%==3 GOTO FIR
IF %M%==4 GOTO UPG
IF %M%==5 GOTO EOF


REM developer tools
:FIR
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
choco feature enable -n allowGlobalConfirmation
choco upgrade chocolatey
ECHO ...............................................
ECHO A RESTART OF THE BATCH FILE IS MAYBE NECESSARY!!
ECHO ...............................................
ECHO ...............................................
GOTO MENU

:UPG
choco upgrade all
GOTO MENU

:GEN
REM basic apps
choco install %~dp0\defaultapps.config   
IF %M%==2 GOTO DEV
GOTO MENU

:DEV
REM developer tools
choco install %~dp0\devapps.config   
GOTO MENU

:EOF