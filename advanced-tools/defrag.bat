@echo off
REM Disk Defragmentation - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Disk Defragmentation"
cls
color 0D
echo [1/1] Défragmentation du disque (HDD)...
powershell -Command "Optimize-Volume -DriveLetter C -Defrag -Verbose"
echo.
echo Défragmentation terminée !
pause
exit /b
