@echo off
REM Performance Monitoring Setup - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Performance Monitoring Setup"
cls
color 0E
echo [1/2] Lancement du moniteur de ressources...
start perfmon.exe
echo [2/2] Lancement du gestionnaire des tâches...
start taskmgr.exe
echo.
echo Outils de monitoring lancés !
pause
exit /b
