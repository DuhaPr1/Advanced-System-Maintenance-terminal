@echo off
REM Network Latency Optimization - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Network Latency Optimization"
cls
color 09
echo [1/3] Optimisation TCP/IP pour le jeu...
powershell -Command "netsh int tcp set global autotuninglevel=restricted"
echo [2/3] Flush DNS...
ipconfig /flushdns
echo [3/3] Désactivation de la QoS sur la carte réseau...
powershell -Command "Get-NetAdapter | Set-NetAdapterAdvancedProperty -DisplayName 'QoS Packet Scheduler' -DisplayValue 'Disabled' -ErrorAction SilentlyContinue"
echo.
echo Optimisation de la latence réseau appliquée !
pause
exit /b
