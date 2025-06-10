@echo off
REM Duplicate File Finder - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Duplicate File Finder"
cls
color 0C
echo [1/2] Recherche de fichiers en double sur C: ...
powershell -Command "Get-ChildItem -Path C:\ -Recurse -ErrorAction SilentlyContinue | Group-Object -Property Length | Where-Object { $_.Count -gt 1 } | ForEach-Object { $_.Group | Select-Object FullName, Length } | Format-Table -AutoSize"
echo [2/2] Recherche terminée. Vérifiez la liste ci-dessus.
echo.
pause
exit /b
