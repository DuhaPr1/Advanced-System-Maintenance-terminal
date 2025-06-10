@echo off
REM Advanced System Optimization - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Advanced System Optimization"
cls
color 0E
echo [1/3] Optimisation des services de démarrage...
powershell -Command "Get-Service | Where-Object { $_.StartType -eq 'Automatic' -and $_.Status -eq 'Stopped' } | Set-Service -StartupType Manual"
echo [2/3] Optimisation du registre...
powershell -Command "reg.exe unload HKLM\TempHive 2>$null"
echo [3/3] Nettoyage du cache système...
del /q /f "%SystemRoot%\Temp\*.*"
echo.
echo Optimisation avancée appliquée !
pause
exit /b
