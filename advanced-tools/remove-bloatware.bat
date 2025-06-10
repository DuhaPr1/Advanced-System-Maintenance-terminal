@echo off
REM Remove Bloatware & Tracking - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Remove Bloatware & Tracking"
cls
color 0D
echo [1/2] Suppression des applications préinstallées inutiles...
powershell -Command "Get-AppxPackage *xbox* | Remove-AppxPackage"
echo [2/2] Désactivation de la collecte de données...
powershell -Command "Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection' -Name 'AllowTelemetry' -Value 0 -Force"
echo.
echo Suppression des bloatwares terminée !
pause
exit /b
