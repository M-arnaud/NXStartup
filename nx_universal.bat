@echo off
set CUSTOMER=Janus_Dev_FR_NX12
set CustomerName=Janus_Dev_FR_NX12
set UGII_CAM_POST_CONFIGURATOR_INSPECT_TOOL_PREVIEW=1
set UGII_CAM_POST_CONFIGURATOR_UF6SbNmFujeENr4CuZZ=nx_post_configurator_full
set UGII_LANG=english
set UGII_DISPLAY_DEBUG=0
set UGII_BASE_DIR=D:\Program Files\Siemens\NX12.0.2.MP08_64Bit\
set UGII_ROOT_DIR=D:\Program Files\Siemens\NX12.0.2.MP08_64Bit\UGII\
set UGII_UGMANAGER_DIR=D:\Program Files\Siemens\NX12.0.2.MP08_64Bit\NXBIN\
set UGII_VERSION_BIT=64Bit

set JE_POST_POOL_DIR=P:\PP\Pool\
set JE_POST_POOL_DIR_NG=D:\sources\MachineKits\NGMK\NGMK_Pool\
set JE_POOL_NGMK_CONTENT=D:\Sources\Machinekits\NGMK\NGMK_Content\

echo CUSTOMER : %CUSTOMER%
echo LANGUAGE : english
set JE_NX_VERSION=NX12.0.2.MP08_64BIT
set JE_BACKGROUND_URL=H:\Products\NXStartup\background\STGBackground.html
call H:\Products\NXStartup\nx_janus.bat


subst w: /d
subst w: %JE_CUSTOMER_PATH%/custom/library/machine/installed_machines


"%UGII_ROOT_DIR%\ugraf" %1 %2 %3 %4 %5 %6 %7 %8 %9


PING localhost -n 6 -w 50 >NUL
exit
