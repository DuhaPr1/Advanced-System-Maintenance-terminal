@echo off
REM Registry Editor Shortcuts - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Registry Editor Shortcuts"
cls
color 0A
echo [1/1] Lancement de l'éditeur du registre...
start regedit.exe
echo.
pause
exit /b
