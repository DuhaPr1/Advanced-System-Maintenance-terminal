@echo off
REM System Integrity Verification - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "System Integrity Verification"
cls
color 0A

echo =====================================================================
echo                  SYSTEM INTEGRITY VERIFICATION - PRO EDITION
echo =====================================================================
echo.
call ..\animation-utils.bat :LOADING_BAR

echo [1/4] Vérification de l'intégrité des fichiers système...
sfc /verifyonly

echo [2/4] Vérification de l'intégrité de l'image Windows...
DISM /Online /Cleanup-Image /CheckHealth

echo [3/4] Vérification des signatures de pilotes...
powershell -Command "Get-WindowsDriver -Online | Where-Object { $_.DigitalSigner -eq '' } | Select-Object Driver, Version, Date | Format-Table -AutoSize"

echo [4/4] Vérification des modifications du registre...
powershell -Command "Get-EventLog -LogName Security -Newest 20 | Where-Object { $_.EventID -eq 4657 } | Select-Object TimeGenerated, ReplacementStrings | Format-Table -AutoSize"

echo.
echo Vérification d'intégrité terminée !
pause
exit /b
