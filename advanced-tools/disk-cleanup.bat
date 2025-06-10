@echo off
REM Disk Cleanup & Optimization - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Disk Cleanup & Optimization"
cls
color 0D
echo [1/2] Nettoyage du disque (cleanmgr)...
cleanmgr /sagerun:1
echo [2/2] Optimisation du disque...
powershell -Command "Optimize-Volume -DriveLetter C -Defrag -Verbose"
echo.
echo Nettoyage et optimisation du disque terminés !
pause
exit /b
