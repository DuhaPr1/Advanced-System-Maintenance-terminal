@echo off
REM File/Folder Backup - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "File/Folder Backup"
cls
color 0B
echo [1/2] Sauvegarde d'un dossier utilisateur...
xcopy "%USERPROFILE%\Documents" "%USERPROFILE%\Desktop\Backup_Documents" /E /I /Y
echo [2/2] Sauvegarde terminée sur le Bureau.
echo.
pause
exit /b
