@echo off
REM Process Explorer - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Process Explorer"
cls
color 0B
echo [1/1] Lancement de l'explorateur de processus...
start taskmgr.exe
echo.
pause
exit /b
