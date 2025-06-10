@echo off
REM Memory Diagnostic - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Memory Diagnostic"
cls
color 0C
echo [1/1] Lancement du diagnostic mémoire Windows...
mdsched.exe
echo.
pause
exit /b
