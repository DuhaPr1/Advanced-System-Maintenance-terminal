@echo off
REM Security Audit & Report - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Security Audit & Report"
cls
color 0D
echo [1/2] Audit des comptes utilisateurs...
powershell -Command "Get-LocalUser | Select-Object Name,Enabled,PasswordRequired | Format-Table -AutoSize"
echo [2/2] Audit des règles de pare-feu...
netsh advfirewall firewall show rule name=all
echo.
echo Audit de sécurité terminé !
pause
exit /b
