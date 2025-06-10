@echo off
REM System Information Export - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "System Information Export"
cls
color 0A
echo [1/1] Export des informations système...
systeminfo > "%USERPROFILE%\Desktop\SystemInfo.txt"
echo Export terminé : SystemInfo.txt sur le Bureau.
pause
exit /b
