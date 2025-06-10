@echo off
REM Disk Space Analysis - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Disk Space Analysis"
cls
color 0D
echo [1/2] Analyse de l'espace disque...
powershell -Command "Get-Volume | Select-Object DriveLetter, FileSystemLabel, FileSystem, @{Name='Size(GB)';Expression={[math]::Round($_.Size/1GB,2)}}, @{Name='FreeSpace(GB)';Expression={[math]::Round($_.SizeRemaining/1GB,2)}} | Format-Table -AutoSize"
echo [2/2] Analyse des fichiers volumineux...
powershell -Command "Get-ChildItem -Path C:\ -Recurse -ErrorAction SilentlyContinue | Where-Object { !$_.PSIsContainer -and $_.Length -gt 500MB } | Select-Object FullName, Length | Sort-Object Length -Descending | Format-Table -AutoSize"
echo.
echo Analyse disque terminée !
pause
exit /b
