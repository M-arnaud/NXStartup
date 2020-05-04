@echo on

echo Administrative permissions required. Detecting permissions...

net session >nul 2>&1
if %errorLevel% == 0 (
echo Success: Administrative permissions confirmed.
) else (
echo Failure: Current permissions inadequate.
echo msgbox"Current permissions inadequate, runas administrator",vbInformation , "Permissions Check"> %temp%\msg.vbs 
start %Temp%\msg.vbs 
timeout /t 1
erase %temp%\msg.vbs
rem exit
)

cd /d %~dp0
rem powershell.exe -executionpolicy bypass -NoProfile -file "Rights.ps1"
PowerShell.exe -ExecutionPolicy Bypass -Command "& '%~dpn0.ps1' -verb RunAs"
