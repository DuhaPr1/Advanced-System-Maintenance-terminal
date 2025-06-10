@echo off
REM Hardware Information - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Hardware Information"
cls
color 0B
echo [1/1] Affichage des informations matérielles...
wmic computersystem get model,name,manufacturer,systemtype
wmic cpu get name,NumberOfCores,NumberOfLogicalProcessors
wmic memorychip get capacity,speed
echo.
pause
exit /b
