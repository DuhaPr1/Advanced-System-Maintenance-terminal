@echo off
REM Network Reset & Repair - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Network Reset & Repair"
cls
color 0C
echo [1/2] Réinitialisation de la pile TCP/IP...
netsh int ip reset
echo [2/2] Réinitialisation du Winsock...
netsh winsock reset
echo.
pause
exit /b
