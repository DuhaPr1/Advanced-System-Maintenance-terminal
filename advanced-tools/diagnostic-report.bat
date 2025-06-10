@echo off
REM Generate Diagnostic Report - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Diagnostic Report"
cls
color 0C
echo [1/2] Génération du rapport de diagnostic système...
msinfo32 /report "%USERPROFILE%\Desktop\SystemDiagnosticReport.txt"
echo [2/2] Rapport enregistré sur le Bureau.
echo.
pause
exit /b
