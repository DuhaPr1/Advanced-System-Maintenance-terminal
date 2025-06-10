@echo off
REM Drive Format & Conversion - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Drive Format & Conversion"
cls
color 0D
echo [1/2] Lancement de l'outil de formatage de disque...
start diskpart
echo [2/2] Utilisez l'interface diskpart pour formater ou convertir un disque.
echo.
pause
exit /b
