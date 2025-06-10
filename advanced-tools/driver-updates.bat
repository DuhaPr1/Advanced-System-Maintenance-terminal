@echo off
REM Driver Updates - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Driver Updates"
cls
color 0A
echo [1/2] Recherche des mises à jour de pilotes...
powershell -Command "Get-WindowsDriver -Online | Select-Object Driver, OriginalFileName, ProviderName, Date, Version | Format-Table -AutoSize"
echo [2/2] (À compléter : installation automatique si besoin)
echo.
pause
exit /b
