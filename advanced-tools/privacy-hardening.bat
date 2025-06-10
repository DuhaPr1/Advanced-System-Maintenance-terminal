@echo off
REM Privacy Hardening - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Privacy Hardening"
cls
color 0D
echo [1/2] Désactivation de la télémétrie Windows...
powershell -Command "Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection' -Name 'AllowTelemetry' -Value 0 -Force"
echo [2/2] Désactivation de la publicité ciblée...
powershell -Command "Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo' -Name 'Enabled' -Value 0 -Force"
echo.
echo Renforcement de la vie privée appliqué !
pause
exit /b
