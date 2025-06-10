@echo off
REM Performance Monitoring - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Performance Monitoring"
cls
color 0B
echo [1/1] Lancement du moniteur de ressources...
start perfmon.exe
echo.
pause
exit /b
