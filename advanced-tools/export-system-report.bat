@echo off
REM Export System Report - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Export System Report"
cls
color 0B
echo [1/1] Export du rapport système...
systeminfo > "%USERPROFILE%\Desktop\SystemReport.txt"
echo Rapport exporté sur le Bureau.
pause
exit /b
