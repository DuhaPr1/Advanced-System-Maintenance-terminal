@echo off
REM GPU Optimization - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "GPU Optimization"
cls
color 09
echo [1/3] Optimisation de la priorité GPU...
powershell -Command "Set-ItemProperty -Path 'HKCU\Software\Microsoft\DirectX' -Name 'GpuPriority' -Value 8 -Force"
echo [2/3] Nettoyage du cache shader...
del /q /f "%LOCALAPPDATA%\NVIDIA\GLCache\*.*"
del /q /f "%LOCALAPPDATA%\AMD\DxCache\*.*"
echo [3/3] Vérification des pilotes GPU...
powershell -Command "Get-WmiObject Win32_VideoController | Select-Object Name, DriverVersion, DriverDate | Format-Table -AutoSize"
echo.
echo Optimisation GPU appliquée !
pause
exit /b
