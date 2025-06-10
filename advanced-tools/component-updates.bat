@echo off
REM System Component Updates - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "System Component Updates"
cls
color 0A
echo [1/2] Recherche des mises à jour des composants système...
dism /Online /Cleanup-Image /ScanHealth
echo [2/2] Réparation des composants système...
dism /Online /Cleanup-Image /RestoreHealth
echo.
pause
exit /b
