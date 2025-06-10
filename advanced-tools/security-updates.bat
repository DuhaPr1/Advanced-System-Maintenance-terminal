@echo off
REM Security Updates Priority - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Security Updates Priority"
cls
color 0A
echo [1/2] Recherche des mises à jour de sécurité...
powershell -Command "Get-WindowsUpdate -Category SecurityUpdates"
echo [2/2] Installation des mises à jour de sécurité...
powershell -Command "Install-WindowsUpdate -Category SecurityUpdates -AcceptAll -AutoReboot"
echo.
pause
exit /b
