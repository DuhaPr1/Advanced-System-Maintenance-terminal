@echo off
REM Advanced Troubleshooting - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Advanced Troubleshooting"
cls
color 0C

echo =====================================================================
echo                  ADVANCED TROUBLESHOOTING - PRO EDITION
echo =====================================================================
echo.
call ..\animation-utils.bat :LOADING_BAR

echo [1/4] Diagnostic réseau automatique...
powershell -Command "Test-NetConnection www.google.com"

echo [2/4] Diagnostic disque...
powershell -Command "Get-PhysicalDisk | Select-Object FriendlyName, OperationalStatus, HealthStatus, Size | Format-Table -AutoSize"

echo [3/4] Diagnostic mémoire...
powershell -Command "Get-WmiObject Win32_PhysicalMemory | Select-Object Manufacturer, Capacity, Speed | Format-Table -AutoSize"

echo [4/4] Diagnostic des services critiques...
powershell -Command "Get-Service | Where-Object { $_.Status -ne 'Running' -and $_.StartType -eq 'Automatic' } | Select-Object Name, Status, StartType | Format-Table -AutoSize"

echo.
echo Dépannage avancé terminé !
pause
exit /b
