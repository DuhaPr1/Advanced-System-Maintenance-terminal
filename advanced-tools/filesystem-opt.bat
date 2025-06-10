@echo off
REM File System Optimization - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "File System Optimization"
cls
color 0E
echo [1/2] Vérification et réparation du système de fichiers...
chkdsk C: /F /R
echo [2/2] Nettoyage des fichiers système...
dism /Online /Cleanup-Image /StartComponentCleanup
echo.
echo Optimisation du système de fichiers appliquée !
pause
exit /b
