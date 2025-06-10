@echo off
REM Windows Update Cleanup - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Update Cleanup"
cls
color 0C
echo [1/2] Nettoyage du cache Windows Update...
del /q /f "%SystemRoot%\SoftwareDistribution\Download\*.*"
echo [2/2] Nettoyage du dossier Catroot2...
del /q /f "%SystemRoot%\System32\catroot2\*.*"
echo.
echo Nettoyage des mises à jour terminé !
pause
exit /b
