@echo off
REM Event Logs Cleanup - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Event Logs Cleanup"
cls
color 0C
echo [1/2] Suppression des journaux d'événements système...
wevtutil cl System
echo [2/2] Suppression des journaux d'événements application...
wevtutil cl Application
echo.
echo Nettoyage des journaux d'événements terminé !
pause
exit /b
