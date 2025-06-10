@echo off
REM Gaming Performance Mode - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Gaming Performance Mode"
cls
color 0E
echo [1/2] Activation du mode jeu...
powershell -Command "Set-ItemProperty -Path 'HKCU:\System\GameConfigStore' -Name 'GameDVR_Enabled' -Value 0 -ErrorAction SilentlyContinue"
echo [2/2] Optimisation du plan d'alimentation...
powercfg /setactive SCHEME_MIN
echo.
echo Mode jeu appliqué !
pause
exit /b
