@echo off
REM Old File Cleanup - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Old File Cleanup"
cls
color 0C
echo [1/2] Suppression des fichiers non modifiés depuis 1 an dans Documents...
forfiles /p "%USERPROFILE%\Documents" /s /m *.* /D -365 /C "cmd /c del /q @path"
echo [2/2] Suppression des fichiers non modifiés depuis 1 an dans Téléchargements...
forfiles /p "%USERPROFILE%\Downloads" /s /m *.* /D -365 /C "cmd /c del /q @path"
echo.
echo Nettoyage des anciens fichiers terminé !
pause
exit /b
