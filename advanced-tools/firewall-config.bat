@echo off
REM Firewall Configuration - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Firewall Configuration"
cls
color 0D
echo [1/2] Activation du pare-feu Windows...
netsh advfirewall set allprofiles state on
echo [2/2] Configuration des règles de base...
netsh advfirewall firewall add rule name="Block Inbound SMB" dir=in action=block protocol=TCP localport=445
echo.
echo Configuration du pare-feu appliquée !
pause
exit /b
