@echo off
REM Emergency Security Lockdown - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Emergency Security Lockdown"
cls
color 0D
echo [1/2] Activation du mode verrouillage d'urgence...
netsh advfirewall set allprofiles state on
echo [2/2] Désactivation de tous les partages réseau...
net share | findstr /v "C$" | for /f "tokens=1" %%i in ('more') do net share %%i /delete
echo.
echo Verrouillage d'urgence appliqué !
pause
exit /b
