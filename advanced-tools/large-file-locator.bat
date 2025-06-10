@echo off
REM Large File Locator - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Large File Locator"
cls
color 0C
echo [1/2] Recherche de fichiers volumineux (>500MB) sur C: ...
powershell -Command "Get-ChildItem -Path C:\ -Recurse -ErrorAction SilentlyContinue | Where-Object { !$_.PSIsContainer -and $_.Length -gt 500MB } | Select-Object FullName, Length | Sort-Object Length -Descending | Format-Table -AutoSize"
echo [2/2] Recherche terminée. Vérifiez la liste ci-dessus.
echo.
pause
exit /b
