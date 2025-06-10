@echo off
REM Network Packet Analysis - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Network Packet Analysis"
cls
color 0B

echo =====================================================================
echo                  NETWORK PACKET ANALYSIS - PRO EDITION
echo =====================================================================
echo.
call ..\animation-utils.bat :LOADING_BAR

echo [1/4] Capture des paquets réseau (netsh)...
netsh trace start capture=yes tracefile="%USERPROFILE%\Desktop\network_trace.etl"

echo [2/4] Analyse des connexions actives...
powershell -Command "Get-NetTCPConnection | Select-Object LocalAddress, LocalPort, RemoteAddress, RemotePort, State, OwningProcess | Format-Table -AutoSize"

echo [3/4] Analyse des ports ouverts...
powershell -Command "Get-NetUDPEndpoint | Select-Object LocalAddress, LocalPort, OwningProcess | Format-Table -AutoSize"

echo [4/4] Arrêt de la capture et conversion...
netsh trace stop
powershell -Command "Get-Content '%USERPROFILE%\Desktop\network_trace.etl' | Out-File '%USERPROFILE%\Desktop\network_trace.txt'"

echo.
echo Analyse des paquets réseau terminée !
pause
exit /b
