@echo off
REM Software Updates (Winget) - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Software Updates (Winget)"
cls
color 0A
echo [1/2] Recherche des mises à jour logicielles...
winget upgrade --all
echo [2/2] Installation des mises à jour...
winget upgrade --all --silent
echo.
pause
exit /b
