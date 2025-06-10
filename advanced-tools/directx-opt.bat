@echo off
REM DirectX & Graphics Optimization - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "DirectX & Graphics Optimization"
cls
color 09
echo [1/2] Mise à jour de DirectX...
powershell -Command "Start-Process 'https://www.microsoft.com/en-us/download/details.aspx?id=35'"
echo [2/2] Nettoyage du cache graphique...
del /q /f "%LOCALAPPDATA%\D3DSCache\*.*"
echo.
echo Optimisation DirectX & Graphiques appliquée !
pause
exit /b
