@echo off
REM Store Updates - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Store Updates"
cls
color 0A
echo [1/2] Recherche des mises à jour du Microsoft Store...
start ms-windows-store://downloadsandupdates
echo [2/2] Veuillez mettre à jour les applications via l'interface Store.
echo.
pause
exit /b
