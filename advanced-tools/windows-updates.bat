@echo off
REM Windows Updates - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Windows Updates"
cls
color 0A
echo [1/2] Recherche des mises à jour Windows...
powershell -Command "Get-WindowsUpdate"
echo [2/2] Installation des mises à jour...
powershell -Command "Install-WindowsUpdate -AcceptAll -AutoReboot"
echo.
echo Mises à jour Windows terminées !
pause
exit /b
