@echo off
REM VR Gaming Optimization - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "VR Gaming Optimization"
cls
color 09
echo [1/2] Optimisation des services VR...
powershell -Command "Get-Service | Where-Object { $_.DisplayName -like '*VR*' } | Set-Service -StartupType Automatic"
echo [2/2] Vérification des pilotes VR...
powershell -Command "Get-WmiObject Win32_PnPSignedDriver | Where-Object { $_.DeviceName -like '*VR*' } | Select-Object DeviceName, DriverVersion, DriverDate | Format-Table -AutoSize"
echo.
echo Optimisation VR appliquée !
pause
exit /b
