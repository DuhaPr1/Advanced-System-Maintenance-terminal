@echo off
REM Memory & Storage Optimization - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Memory & Storage Optimization"
cls
color 0E
echo [1/2] Libération de la mémoire RAM...
powershell -Command "[System.GC]::Collect()"
echo [2/2] Nettoyage du cache de la mémoire virtuelle...
powershell -Command "Clear-Content -Path $env:SystemDrive\pagefile.sys -Force -ErrorAction SilentlyContinue"
echo.
echo Optimisation mémoire/stockage appliquée !
pause
exit /b
