@echo off
REM Disk Check & Repair - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Disk Check & Repair"
cls
color 0C
echo [1/1] Vérification et réparation du disque...
chkdsk C: /F /R
echo.
pause
exit /b
