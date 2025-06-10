@echo off
REM PowerShell Profile Editor - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "PowerShell Profile Editor"
cls
color 0A
echo [1/1] Ouverture du profil PowerShell pour édition...
notepad "%USERPROFILE%\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
echo.
pause
exit /b
