@echo off
REM File System Security - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "File System Security"
cls
color 0D
echo [1/2] Vérification des permissions sur Documents...
icacls "%USERPROFILE%\Documents"
echo [2/2] Recherche de fichiers non sécurisés...
powershell -Command "Get-ChildItem -Path $env:USERPROFILE -Recurse -ErrorAction SilentlyContinue | Where-Object { $_.Attributes -match 'Archive' } | Select-Object FullName,Attributes | Format-Table -AutoSize"
echo.
echo Sécurité du système de fichiers vérifiée !
pause
exit /b
