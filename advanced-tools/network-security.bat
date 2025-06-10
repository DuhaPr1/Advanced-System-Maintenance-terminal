@echo off
REM Network Security Hardening - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Network Security Hardening"
cls
color 0D
echo [1/2] Désactivation du partage de fichiers public...
netsh advfirewall firewall set rule group="File and Printer Sharing" new enable=No
echo [2/2] Désactivation du protocole SMBv1...
powershell -Command "Set-SmbServerConfiguration -EnableSMB1Protocol $false -Force"
echo.
echo Renforcement de la sécurité réseau appliqué !
pause
exit /b
