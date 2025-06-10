@echo off
REM Resource Usage - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Resource Usage"
cls
color 0B
echo [1/1] Affichage de l'utilisation des ressources...
tasklist
echo.
pause
exit /b
