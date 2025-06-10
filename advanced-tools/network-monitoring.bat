@echo off
REM Network Monitoring - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Network Monitoring"
cls
color 0B
echo [1/1] Affichage des connexions réseau actives...
netstat -ano
echo.
pause
exit /b
