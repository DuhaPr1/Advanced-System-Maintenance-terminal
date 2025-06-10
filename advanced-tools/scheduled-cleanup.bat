@echo off
REM Scheduled Cleanup Configuration - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Scheduled Cleanup"
cls
color 0C
echo [1/2] Création d'une tâche planifiée pour le nettoyage rapide chaque semaine...
schtasks /Create /SC WEEKLY /TN "QuickCleanup" /TR "%CD%\quick-cleanup.bat" /D SUN /ST 12:00
echo [2/2] Configuration terminée. Vous pouvez gérer la tâche via le Planificateur de tâches Windows.
echo.
pause
exit /b
