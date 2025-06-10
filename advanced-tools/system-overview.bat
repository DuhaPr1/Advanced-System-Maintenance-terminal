@echo off
REM System Overview - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "System Overview"
cls
color 0B
echo [1/1] Affichage du résumé système...
systeminfo | more
echo.
pause
exit /b
