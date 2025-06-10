@echo off
REM System Performance Profiling - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "System Performance Profiling"
cls
color 0E

echo =====================================================================
echo                  SYSTEM PERFORMANCE PROFILING - PRO EDITION
echo =====================================================================
echo.
call ..\animation-utils.bat :LOADING_BAR

echo [1/4] Analyse des performances CPU...
powershell -Command "Get-Counter '\Processor(_Total)\% Processor Time' -SampleInterval 1 -MaxSamples 5"

echo [2/4] Analyse de l'utilisation mémoire...
powershell -Command "Get-Counter '\Memory\Available MBytes' -SampleInterval 1 -MaxSamples 5"

echo [3/4] Analyse des accès disque...
powershell -Command "Get-Counter '\PhysicalDisk(_Total)\Disk Bytes/sec' -SampleInterval 1 -MaxSamples 5"

echo [4/4] Analyse réseau...
powershell -Command "Get-Counter '\Network Interface(*)\Bytes Total/sec' -SampleInterval 1 -MaxSamples 5"

echo.
echo Profilage des performances terminé !
pause
exit /b
