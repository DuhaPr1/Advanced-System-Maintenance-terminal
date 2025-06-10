@echo off
REM User Account Security - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "User Account Security"
cls
color 0D
echo [1/2] Vérification des comptes utilisateurs actifs...
powershell -Command "Get-LocalUser | Select-Object Name,Enabled,PasswordRequired | Format-Table -AutoSize"
echo [2/2] Désactivation des comptes invités...
net user Invité /active:no
echo.
echo Sécurité des comptes utilisateurs appliquée !
pause
exit /b
