@echo off
REM System File Checker (SFC Scan) - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "SFC Scan"
cls
color 0C
echo [1/1] Analyse et réparation des fichiers système...
sfc /scannow
echo.
pause
exit /b
