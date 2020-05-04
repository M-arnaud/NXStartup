@echo off

rem Schulungsraum trennen
del /y %TEMP%\Unconnection.finish
if exist n:\ (net use n: /delete /yes)
if exist o:\ (net use o: /delete /yes)
echo > %TEMP%\Unconnection.finish
exit
