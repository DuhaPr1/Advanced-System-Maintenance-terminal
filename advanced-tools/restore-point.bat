@echo off
REM System Restore Point - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "System Restore Point"
cls
color 0C
echo [1/1] Création d'un point de restauration système...
powershell -Command "Checkpoint-Computer -Description 'Manual Restore Point' -RestorePointType 'MODIFY_SETTINGS'"
echo.
pause
exit /b
