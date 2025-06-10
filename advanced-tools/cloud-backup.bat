@echo off
REM Cloud Backup (OneDrive) - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Cloud Backup (OneDrive)"
cls
color 0B
echo [1/2] Synchronisation avec OneDrive...
start onedrive.exe
echo [2/2] Veuillez vérifier la synchronisation dans l'interface OneDrive.
echo.
pause
exit /b
