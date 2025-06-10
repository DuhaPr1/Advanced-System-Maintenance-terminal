@echo off
REM SSD Optimization - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "SSD Optimization"
cls
color 0E
echo [1/2] Optimisation TRIM du SSD...
powershell -Command "Optimize-Volume -DriveLetter C -ReTrim -Verbose"
echo [2/2] Désactivation de la défragmentation planifiée...
schtasks /Change /TN "Microsoft\Windows\Defrag\ScheduledDefrag" /Disable
echo.
echo Optimisation SSD appliquée !
pause
exit /b
