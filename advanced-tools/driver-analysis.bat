@echo off
REM Driver Analysis Tools - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Driver Analysis Tools"
cls
color 0B

echo =====================================================================
echo                  DRIVER ANALYSIS TOOLS - PRO EDITION
echo =====================================================================
echo.
call ..\animation-utils.bat :LOADING_BAR

echo [1/4] Liste des pilotes installés...
powershell -Command "Get-WindowsDriver -Online | Select-Object Driver, OriginalFileName, ProviderName, Date, Version | Format-Table -AutoSize"

echo [2/4] Recherche de pilotes non signés...
powershell -Command "Get-WindowsDriver -Online | Where-Object { $_.DigitalSigner -eq '' } | Select-Object Driver, Version, Date | Format-Table -AutoSize"

echo [3/4] Analyse des pilotes obsolètes...
powershell -Command "Get-WmiObject Win32_PnPSignedDriver | Where-Object { $_.DriverDate -lt (Get-Date).AddYears(-2) } | Select-Object DeviceName, DriverVersion, DriverDate | Format-Table -AutoSize"

echo [4/4] Export des pilotes...
powershell -Command "Export-WindowsDriver -Online -Destination '%USERPROFILE%\Desktop\DriversExport'"

echo.
echo Analyse des pilotes terminée !
pause
exit /b
