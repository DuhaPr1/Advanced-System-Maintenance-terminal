@echo off
REM Quick Performance Boost - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Quick Performance Boost"
cls
color 0E
echo [1/3] Activation du plan d'alimentation haute performance...
powercfg /setactive SCHEME_MIN
echo [2/3] Arrêt des services inutiles...
powershell -Command "Stop-Service SysMain -Force; Set-Service SysMain -StartupType Disabled"
echo [3/3] Nettoyage du cache temporaire...
powershell -Command "Remove-Item '$env:TEMP\*' -Recurse -Force -ErrorAction SilentlyContinue"
echo.
echo Boost rapide appliqué !
pause
exit /b
