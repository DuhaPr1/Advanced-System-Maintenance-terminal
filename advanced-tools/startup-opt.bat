@echo off
REM Startup & Services Optimization - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Startup & Services Optimization"
cls
color 0E
echo [1/2] Désactivation des programmes de démarrage inutiles...
powershell -Command "Get-CimInstance Win32_StartupCommand | Where-Object { $_.Command -like '*temp*' -or $_.Command -like '*update*' } | ForEach-Object { Remove-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Run' -Name $_.Name -ErrorAction SilentlyContinue }"
echo [2/2] Arrêt des services inutiles...
powershell -Command "Get-Service | Where-Object { $_.StartType -eq 'Automatic' -and $_.Status -eq 'Stopped' } | Set-Service -StartupType Manual"
echo.
echo Optimisation du démarrage appliquée !
pause
exit /b
