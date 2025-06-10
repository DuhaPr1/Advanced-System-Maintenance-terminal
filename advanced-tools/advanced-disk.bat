@echo off
REM Advanced Disk Tools - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Advanced Disk Tools"
cls
color 0E

echo =====================================================================
echo                  ADVANCED DISK TOOLS - PRO EDITION
echo =====================================================================
echo.
call ..\animation-utils.bat :LOADING_BAR

echo [1/5] Analyse de l'espace disque...
powershell -Command "Get-Volume | Select-Object DriveLetter, FileSystemLabel, FileSystem, @{Name='Size(GB)';Expression={[math]::Round($_.Size/1GB,2)}}, @{Name='FreeSpace(GB)';Expression={[math]::Round($_.SizeRemaining/1GB,2)}} | Format-Table -AutoSize"

echo [2/5] Vérification de la santé du disque...
powershell -Command "Get-PhysicalDisk | Select-Object FriendlyName, OperationalStatus, HealthStatus, Size | Format-Table -AutoSize"

echo [3/5] Défragmentation du disque (HDD)...
powershell -Command "Optimize-Volume -DriveLetter C -Defrag -Verbose"

echo [4/5] Optimisation SSD (TRIM)...
powershell -Command "Optimize-Volume -DriveLetter C -ReTrim -Verbose"

echo [5/5] Recherche de fichiers volumineux...
powershell -Command "Get-ChildItem -Path C:\ -Recurse -ErrorAction SilentlyContinue | Where-Object { !$_.PSIsContainer -and $_.Length -gt 500MB } | Select-Object FullName, Length | Sort-Object Length -Descending | Format-Table -AutoSize"

echo.
echo Outils avancés du disque terminés !
pause
exit /b
