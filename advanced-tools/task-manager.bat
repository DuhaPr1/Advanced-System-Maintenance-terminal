@echo off
REM Scheduled Task Manager - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Scheduled Task Manager"
cls
color 0A
echo [1/1] Lancement du Planificateur de tâches Windows...
start taskschd.msc
echo.
pause
exit /b
