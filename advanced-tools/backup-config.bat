@echo off
REM Backup Configuration - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Backup Configuration"
cls
color 0D
echo [1/2] Lancement de l'outil de sauvegarde Windows...
start sdclt.exe
echo [2/2] Utilisez l'interface graphique pour configurer la sauvegarde.
echo.
pause
exit /b
