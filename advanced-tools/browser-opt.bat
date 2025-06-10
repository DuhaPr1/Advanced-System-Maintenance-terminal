@echo off
REM Browser Performance Optimization - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Browser Performance Optimization"
cls
color 0E
echo [1/2] Nettoyage du cache navigateur (Edge)...
powershell -Command "Remove-Item -Path $env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Cache\* -Recurse -Force -ErrorAction SilentlyContinue"
echo [2/2] Désactivation des extensions inutiles (manuel)...
echo Ouvrez votre navigateur et désactivez les extensions non utilisées.
echo.
echo Optimisation du navigateur appliquée !
pause
exit /b
