@echo off
REM System Configuration Backup - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "System Configuration Backup"
cls
color 0A

echo =====================================================================
echo                  SYSTEM CONFIGURATION BACKUP - PRO EDITION
echo =====================================================================
echo.
call ..\animation-utils.bat :LOADING_BAR

echo [1/4] Sauvegarde du registre...
reg export HKLM "%USERPROFILE%\Desktop\Config_HKLM_Backup.reg" /y
reg export HKCU "%USERPROFILE%\Desktop\Config_HKCU_Backup.reg" /y

echo [2/4] Sauvegarde des pilotes...
powershell -Command "Export-WindowsDriver -Online -Destination '%USERPROFILE%\Desktop\DriversBackup'"

echo [3/4] Sauvegarde des tâches planifiées...
powershell -Command "Get-ScheduledTask | Export-Clixml -Path '%USERPROFILE%\Desktop\ScheduledTasksBackup.xml'"

echo [4/4] Sauvegarde des services...
powershell -Command "Get-Service | Export-Clixml -Path '%USERPROFILE%\Desktop\ServicesBackup.xml'"

echo.
echo Sauvegarde de la configuration système terminée !
pause
exit /b
