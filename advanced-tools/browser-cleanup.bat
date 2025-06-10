@echo off
REM Browser Cleanup - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Browser Cleanup"
cls
color 0C
echo [1/3] Nettoyage du cache Chrome...
powershell -Command "Remove-Item -Path $env:LOCALAPPDATA\Google\Chrome\User Data\Default\Cache\* -Recurse -Force -ErrorAction SilentlyContinue"
echo [2/3] Nettoyage du cache Edge...
powershell -Command "Remove-Item -Path $env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Cache\* -Recurse -Force -ErrorAction SilentlyContinue"
echo [3/3] Nettoyage du cache Firefox...
powershell -Command "Remove-Item -Path $env:APPDATA\Mozilla\Firefox\Profiles\*\cache2\* -Recurse -Force -ErrorAction SilentlyContinue"
echo.
echo Nettoyage des navigateurs terminé !
pause
exit /b
