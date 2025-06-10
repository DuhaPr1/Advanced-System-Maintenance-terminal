@echo off
REM Disk Encryption - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Disk Encryption"
cls
color 0D
echo [1/2] Lancement de BitLocker...
start control.exe /name Microsoft.BitLockerDriveEncryption
echo [2/2] Utilisez l'interface graphique pour gérer le chiffrement.
echo.
pause
exit /b
