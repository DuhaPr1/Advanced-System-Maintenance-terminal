@echo off
REM Windows Feature Manager - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Windows Feature Manager"
cls
color 0A
echo [1/1] Affichage des fonctionnalités Windows activées/désactivées...
dism /Online /Get-Features /Format:Table
echo.
pause
exit /b
