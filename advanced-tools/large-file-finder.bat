@echo off
REM Large File Finder - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Large File Finder"
cls
color 0D
echo [1/1] Recherche de fichiers volumineux (>500MB)...
powershell -Command "Get-ChildItem -Path C:\ -Recurse -ErrorAction SilentlyContinue | Where-Object { !$_.PSIsContainer -and $_.Length -gt 500MB } | Select-Object FullName, Length | Sort-Object Length -Descending | Format-Table -AutoSize"
echo.
echo Recherche terminée !
pause
exit /b
