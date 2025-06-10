@echo off
REM DISM Image Repair - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "DISM Image Repair"
cls
color 0C
echo [1/1] Réparation de l'image Windows...
dism /Online /Cleanup-Image /RestoreHealth
echo.
pause
exit /b
