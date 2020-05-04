@echo on
setlocal EnableDelayedExpansion

rem set ORDNER=H:\Customer
rem set QUELLE=v10\Hermle_Gosheim
rem set ZIEL=v12\Hermle_Gosheim_DEV

IF "%~1" == "" GOTO :EOF
IF "%~2" == "" GOTO :EOF
IF "%~3" == "" GOTO :EOF

set ORDNER=%~1
set QUELLE=%~2
set ZIEL=%~3

set OUTPUT=Duplicate.ps1
set STOPPATH=%TEMP%

rem Backslash am Ende bereinigen
if "!STOPPATH:~-1!"=="\" (
	set STOPPATH=!STOPPATH:~0,-1!
)

set STOP=%STOPPATH%\Duplicate.stop

cd /d %ORDNER%
mkdir %ORDNER%\%ZIEL%\
xcopy %ORDNER%\%QUELLE%\*.* %ORDNER%\%ZIEL%\*.* /t /e /y

robocopy %ORDNER%\%QUELLE%\ %ORDNER%\%ZIEL%\ *.prt /IS /E /COPY:DT /ETA /X /V /R:1 /W:2

PowerShell.exe -ExecutionPolicy Bypass -Command "& '%~dpn0.ps1' '%ORDNER%\%QUELLE%' '%ORDNER%\%ZIEL%' '%STOP%' -verb RunAs"

:waitloop
IF EXIST %STOP% GOTO waitloopend
timeout /t 1
goto waitloop
:waitloopend

del /q %STOP%
exit
