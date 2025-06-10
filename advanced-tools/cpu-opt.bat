@echo off
REM CPU & Process Optimization - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "CPU & Process Optimization"
cls
color 0E
echo [1/2] Optimisation de la priorité CPU pour les applications actives...
powershell -Command "Get-Process | Where-Object { $_.CPU -gt 10 } | ForEach-Object { $_.PriorityClass = 'High' }"
echo [2/2] Arrêt des processus inutiles...
powershell -Command "Get-Process | Where-Object { $_.CPU -lt 1 -and $_.ProcessName -notin 'explorer','System','Idle' } | Stop-Process -Force -ErrorAction SilentlyContinue"
echo.
echo Optimisation CPU/proc appliquée !
pause
exit /b
