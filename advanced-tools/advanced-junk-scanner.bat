@echo off
REM Advanced Junk File Scanner - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Advanced Junk File Scanner"
cls
color 0C
echo [1/2] Scan des fichiers inutiles sur le disque C: ...
powershell -Command "Get-ChildItem -Path C:\ -Recurse -ErrorAction SilentlyContinue | Where-Object { !$_.PSIsContainer -and $_.Length -lt 10KB } | Select-Object FullName, Length | Sort-Object Length -Descending | Format-Table -AutoSize"
echo [2/2] Scan terminé. Vérifiez la liste ci-dessus.
echo.
pause
exit /b
