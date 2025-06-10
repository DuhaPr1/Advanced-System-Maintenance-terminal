@echo off
REM Configure Auto-Updates - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Configure Auto-Updates"
cls
color 0A
echo [1/2] Configuration de la mise à jour automatique...
powershell -Command "Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' -Name 'NoAutoUpdate' -Value 0 -Force"
echo [2/2] Configuration de l'heure d'installation automatique...
powershell -Command "Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' -Name 'ScheduledInstallTime' -Value 3 -Force"
echo.
pause
exit /b
