@echo on

set ORDNER=H:\Customer
set QUELLE=v10\Hermle_Gosheim
set ZIEL=v12\Hermle_Gosheim_DEV
set STOP=%TEMP%\Duplicate.stop

Duplicate.bat "%ORDNER%\%QUELLE%" "%ORDNER%\%ZIEL%" "%STOP%"
pause
exit
