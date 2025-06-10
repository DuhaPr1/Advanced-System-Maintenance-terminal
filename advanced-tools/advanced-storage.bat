@echo off
REM Advanced Storage Settings - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Advanced Storage Settings"
cls
color 0D
echo [1/2] Analyse avancée de l'espace disque...
powershell -Command "Get-Volume | Select-Object DriveLetter, FileSystemLabel, FileSystem, @{Name='Size(GB)';Expression={[math]::Round($_.Size/1GB,2)}}, @{Name='FreeSpace(GB)';Expression={[math]::Round($_.SizeRemaining/1GB,2)}} | Format-Table -AutoSize"
echo [2/2] (À compléter : autres outils avancés de stockage)
echo.
pause
exit /b
