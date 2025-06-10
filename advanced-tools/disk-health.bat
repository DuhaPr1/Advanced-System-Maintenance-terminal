@echo off
REM Disk Health Check - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Disk Health Check"
cls
color 0D
echo [1/2] Vérification de la santé du disque...
powershell -Command "Get-PhysicalDisk | Select-Object FriendlyName, OperationalStatus, HealthStatus, Size | Format-Table -AutoSize"
echo [2/2] Vérification SMART...
wmic diskdrive get status
echo.
echo Vérification de la santé du disque terminée !
pause
exit /b
