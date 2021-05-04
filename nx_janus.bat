set KUNDEN_PP_DIR=H:\Customer
set CUSTOMER_PP_DIR=%KUNDEN_PP_DIR%
set JE_BASE_RELEASE_VERSION=v1872
set JE_RELEASE_VERSION=v1872
set CustomerName=_default
set UGII_CAM_POST_CONFIGURATOR_INSPECT_TOOL_PREVIEW=1
set UGII_CAM_POST_CONFIGURATOR_UF6SbNmFujeENr4CuZZ=nx_post_configurator_full

set CUSTOMER_LIST_DIR=D:\Sources\Machinekits\Products\NXStartup\
 
echo CUSTOMER_LIST_DIR: %CUSTOMER_LIST_DIR%
 
echo UGII_BASE_DIR  : %UGII_BASE_DIR%
echo UGII_ROOT_DIR  : %UGII_ROOT_DIR%
echo UGII_VERSION   : %UGII_VERSION%
 
DATE /T > D:\Sources\Machinekits\Products\NXStartup\NXStartup.log
TIME /T >> D:\Sources\Machinekits\Products\NXStartup\NXStartup.log
echo CUSTOMER %CUSTOMER% >> D:\Sources\Machinekits\Products\NXStartup\NXStartup.log 
D:\Sources\Machinekits\Products\NXStartup\startup\modify.men >> D:\Sources\Machinekits\Products\NXStartup\NXStartup.log
 
set JE_CUSTOMER_PATH=%CUSTOMER_PP_DIR%\%JE_BASE_RELEASE_VERSION%\%CUSTOMER%
set JE_LICENSE_FILE_JEL=%JE_CUSTOMER_PATH%\admin\je_license.jel
set JE_LICENSE_FILE_TXT=%JE_CUSTOMER_PATH%\admin\je_license.txt
 
IF EXIST %JE_CUSTOMER_PATH%/nul GOTO DO
set JE_SCRIPT=%TEMP%NXStartup.vbs
echo MsgBox "Kunde nicht vorhanden %JE_CUSTOMER_PATH%", 16, "JANUS NX-Startup" > %JE_SCRIPT%
GOTO MESSAGE
 
:DO
IF 1872 LEQ 4 (
  set UGII_LICENSE_FILE=27000@%COMPUTERNAME%
echo UGII_LICENSE_FILE %UGII_LICENSE_FILE% >> D:\Sources\Machinekits\Products\NXStartup\NXStartup.log 
) ELSE (
echo SPLM_LICENSE_SERVER %SPLM_LICENSE_SERVER% >> D:\Sources\Machinekits\Products\NXStartup\NXStartup.log 
)
 
set UGII_ENV_FILE=%CUSTOMER_PP_DIR%\%JE_BASE_RELEASE_VERSION%\_default\ugii_env.dat
 
IF EXIST %JE_LICENSE_FILE_JEL% (
  set JE_LICENSE_FILE=%JE_LICENSE_FILE_JEL%
) ELSE (
  IF EXIST %JE_LICENSE_FILE_TXT% (
	set JE_LICENSE_FILE=%JE_LICENSE_FILE_TXT%
  ) ELSE (
	set JE_LICENSE_FILE=%JE_LICENSE_FILE_JEL%
  )
)
 
echo JE_LICENSE_FILE %JE_LICENSE_FILE% >> D:\Sources\Machinekits\Products\NXStartup\NXStartup.log
GOTO ENDE
 
:MESSAGE
IF EXIST %JE_SCRIPT% (
  %JE_SCRIPT%
)
IF EXIST %JE_SCRIPT% DEL /Q %JE_SCRIPT%
GOTO ENDE
 
:ENDE
echo "									   "
echo "   -->> JANUS UG ENVIRONMENT <<--"
echo	 %CUSTOMER_PP_DIR%
echo	 %UGII_ENV_FILE%
echo "									   "
echo "---------------------------------------"
echo "									   "
echo	 %UGII_LICENSE_FILE%
