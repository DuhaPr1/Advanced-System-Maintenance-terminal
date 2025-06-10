@echo off
REM Event Log Viewer - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Event Log Viewer"
cls
color 0B
echo [1/1] Lancement de l'observateur d'événements...
start eventvwr.msc
echo.
pause
exit /b
