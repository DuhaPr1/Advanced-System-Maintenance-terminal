@echo off
REM Quick Cleanup - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Quick Cleanup"
cls
color 0C
echo [1/3] Nettoyage du dossier Temp...
del /q /f "%TEMP%\*.*"
echo [2/3] Nettoyage de la corbeille...
powershell -Command "Clear-RecycleBin -Force"
echo [3/3] Suppression des fichiers cache...
REM (Ajouter d'autres commandes ici)
echo.
echo Nettoyage rapide terminé !
pause
exit /b
