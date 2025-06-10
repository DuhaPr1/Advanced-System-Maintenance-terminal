@echo off
REM Complete System Health Check - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "System Health Check"
cls
color 0C
echo [1/2] Vérification de l'intégrité système...
sfc /verifyonly
echo [2/2] Vérification de la santé du disque...
wmic diskdrive get status
echo.
pause
exit /b
