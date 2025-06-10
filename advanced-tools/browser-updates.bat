@echo off
REM Browser Updates (All Browsers) - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Browser Updates"
cls
color 0A
echo [1/2] Mise à jour de Microsoft Edge...
start msedge://settings/help
echo [2/2] Mise à jour de Google Chrome...
start chrome://settings/help
echo.
pause
exit /b
