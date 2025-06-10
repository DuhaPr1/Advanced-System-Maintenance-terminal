@echo off
REM Windows Defender Optimization - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Windows Defender Optimization"
cls
color 0D
echo [1/2] Mise à jour de Windows Defender...
powershell -Command "Update-MpSignature"
echo [2/2] Scan rapide du système...
powershell -Command "Start-MpScan -ScanType QuickScan"
echo.
echo Optimisation de Defender appliquée !
pause
exit /b
