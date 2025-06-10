@echo off
REM Service Status - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Service Status"
cls
color 0B
echo [1/1] Affichage du statut des services...
powershell -Command "Get-Service | Select-Object Name,Status,StartType | Format-Table -AutoSize"
echo.
pause
exit /b
