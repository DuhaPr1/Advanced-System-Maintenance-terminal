@echo off
REM Network Performance Tuning - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Network Performance Tuning"
cls
color 0E
echo [1/2] Optimisation TCP/IP...
netsh int tcp set global autotuninglevel=restricted
echo [2/2] Flush DNS...
ipconfig /flushdns
echo.
echo Optimisation réseau appliquée !
pause
exit /b
