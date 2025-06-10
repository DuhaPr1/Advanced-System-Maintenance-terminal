@echo off
REM Power Management Optimization - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Power Management Optimization"
cls
color 0E
echo [1/2] Activation du plan d'alimentation équilibré...
powercfg /setactive SCHEME_BALANCED
echo [2/2] Désactivation de la mise en veille prolongée...
powercfg -h off
echo.
echo Optimisation de l'alimentation appliquée !
pause
exit /b
