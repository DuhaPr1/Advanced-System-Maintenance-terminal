@echo off
REM Cleanup Analysis - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Cleanup Analysis"
cls
color 0C
echo [1/2] Analyse de l'espace disque...
powershell -Command "Get-PSDrive | Where-Object {$_.Free -gt 0} | Select-Object Name,Free,Used, @{Name='Free(GB)';Expression={[math]::Round($_.Free/1GB,2)}}, @{Name='Used(GB)';Expression={[math]::Round($_.Used/1GB,2)}} | Format-Table -AutoSize"
echo [2/2] Analyse des fichiers temporaires...
powershell -Command "Get-ChildItem -Path $env:TEMP -Recurse | Measure-Object -Property Length -Sum | Select-Object Count,Sum"
echo.
echo Analyse du nettoyage terminée !
pause
exit /b
