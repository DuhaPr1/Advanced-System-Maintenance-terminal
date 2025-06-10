@echo off
REM Nuclear Cleanup - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Nuclear Cleanup"
cls
color 0C
echo [1/5] Suppression de tous les fichiers temporaires...
del /q /f "%TEMP%\*.*"
del /q /f "%SystemRoot%\Temp\*.*"
echo [2/5] Nettoyage du cache Windows Update...
del /q /f "%SystemRoot%\SoftwareDistribution\Download\*.*"
echo [3/5] Suppression des logs système...
del /q /f "%SystemRoot%\System32\LogFiles\*.*"
echo [4/5] Nettoyage du cache navigateur (Edge)...
powershell -Command "Remove-Item -Path $env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Cache\* -Recurse -Force -ErrorAction SilentlyContinue"
echo [5/5] Nettoyage du registre (MRU)...
powershell -Command "Remove-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU' -Name '*' -ErrorAction SilentlyContinue"
echo.
echo Nettoyage nucléaire terminé !
pause
exit /b
