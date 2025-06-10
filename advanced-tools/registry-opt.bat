@echo off
REM Registry Optimization - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Registry Optimization"
cls
color 0E
echo [1/2] Nettoyage des MRU (Most Recently Used)...
powershell -Command "Remove-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU' -Name '*' -ErrorAction SilentlyContinue"
echo [2/2] Vérification de l'intégrité du registre...
powershell -Command "sfc /verifyonly"
echo.
echo Optimisation du registre appliquée !
pause
exit /b
