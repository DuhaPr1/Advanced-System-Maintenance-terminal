@echo off
REM Deep Cleanup - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Deep Cleanup"
cls
color 0C
echo [1/4] Suppression des fichiers système temporaires...
del /q /f "%SystemRoot%\Temp\*.*"
echo [2/4] Nettoyage du cache Windows Update...
del /q /f "%SystemRoot%\SoftwareDistribution\Download\*.*"
echo [3/4] Suppression des logs système...
del /q /f "%SystemRoot%\System32\LogFiles\*.*"
echo [4/4] Nettoyage du cache navigateur (Edge)...
powershell -Command "Remove-Item -Path $env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Cache\* -Recurse -Force -ErrorAction SilentlyContinue"
echo.
echo Nettoyage approfondi terminé !
pause
exit /b
