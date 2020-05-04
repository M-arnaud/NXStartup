@echo off

rem Schulungsraum verbinden
del /y %TEMP%\Connection.finish
if not exist n:\ (net use n: \\172.10.10.10\Schulung janus2882 /PERSISTENT:NO /USER:JEX-Training\Gast /yes)
if not exist o:\ (net use o: \\172.10.10.10\Datashare janus2882 /PERSISTENT:NO /USER:JEX-Training\Gast /yes)
echo > %TEMP%\Connection.finish
exit
