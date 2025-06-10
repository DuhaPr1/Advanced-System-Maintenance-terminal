@echo off
REM System Restore Point Cleanup - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Restore Point Cleanup"
cls
color 0C
echo [1/2] Suppression de tous les points de restauration sauf le plus récent...
vssadmin delete shadows /for=C: /oldest
echo [2/2] Nettoyage terminé. Il reste le point de restauration le plus récent.
echo.
pause
exit /b
