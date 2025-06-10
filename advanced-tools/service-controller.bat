@echo off
REM Service Controller - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Service Controller"
cls
color 0A
echo [1/1] Affichage de la liste des services Windows...
powershell -Command "Get-Service | Select-Object Name,Status,StartType | Format-Table -AutoSize"
echo.
pause
exit /b
