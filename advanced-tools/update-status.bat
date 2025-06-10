@echo off
REM Update Status & History - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Update Status & History"
cls
color 0A
echo [1/2] Affichage de l'historique des mises à jour...
powershell -Command "Get-HotFix | Sort-Object InstalledOn -Descending | Select-Object -First 20 | Format-Table HotFixID, Description, InstalledOn -AutoSize"
echo [2/2] Vérification de l'état des mises à jour...
powershell -Command "Get-WindowsUpdateLog"
echo.
pause
exit /b
