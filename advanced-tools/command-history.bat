@echo off
REM Command History Browser - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Command History Browser"
cls
color 0A
echo [1/1] Affichage de l'historique des commandes PowerShell...
powershell -Command "Get-History | Format-Table -AutoSize"
echo.
pause
exit /b
