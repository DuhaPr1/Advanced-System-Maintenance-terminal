@echo off
title Storage Management Suite
color 0D
mode con: cols=100 lines=35
setlocal enabledelayedexpansion

call core\animation-utils.bat :INTRO_ANIMATION
set "log_file=logs\storage_%date:~-4,4%%date:~-7,2%%date:~-10,2%_%time:~0,2%%time:~3,2%%time:~6,2%.log"
set "log_file=%log_file: =0%"
echo Storage Management - Log started at %date% %time% > "%log_file%"

call animation-utils.bat :SHOW_DEVELOPER_INFO
call animation-utils.bat :LOADING_BAR

:STORAGE_MENU
cls
color 0D
echo.
echo  ========================================================================
echo                        STORAGE MANAGEMENT SUITE
echo                      Advanced Disk Optimization
echo  ========================================================================
echo.
echo  ----------------------------------------------------------------
echo   [1] Disk Space Analysis
echo   [2] Disk Cleanup & Optimization
echo   [3] Disk Health Check
echo   [4] Partition Management
echo   [5] Drive Format & Conversion
echo   [6] File System Optimization
echo   [7] Large File Finder
echo   [8] Duplicate File Finder
echo   [9] Disk Defragmentation
echo   [A] SSD Optimization
echo   [B] Disk Benchmark
echo   [C] Storage Spaces Management
echo   [D] Backup Configuration
echo   [E] Disk Encryption
echo   [F] Advanced Storage Settings
echo   [0] Back to Main Menu
echo  ----------------------------------------------------------------
echo.
set /p choice="Select storage option: "

if /i "%choice%"=="1" goto DISK_ANALYSIS
if /i "%choice%"=="2" goto DISK_CLEANUP
if /i "%choice%"=="3" goto DISK_HEALTH
if /i "%choice%"=="4" goto PARTITION_MGMT
if /i "%choice%"=="5" goto DRIVE_FORMAT
if /i "%choice%"=="6" goto FILESYSTEM_OPT
if /i "%choice%"=="7" goto LARGE_FILE_FINDER
if /i "%choice%"=="8" goto DUPLICATE_FINDER
if /i "%choice%"=="9" goto DEFRAG
if /i "%choice%"=="A" goto SSD_OPT
if /i "%choice%"=="B" goto DISK_BENCHMARK
if /i "%choice%"=="C" goto STORAGE_SPACES
if /i "%choice%"=="D" goto BACKUP_CONFIG
if /i "%choice%"=="E" goto DISK_ENCRYPTION
if /i "%choice%"=="F" goto ADVANCED_STORAGE
if /i "%choice%"=="0" exit /b

goto STORAGE_MENU

:DISK_ANALYSIS
cls
call animation-utils.bat :SPINNER_ANIMATION "Analyzing Disk Space"
echo.
echo Disk Space Analysis
echo -----------------
echo.

echo [1/4] Analyzing disk space by drive...
powershell -Command "Get-Volume | Where-Object { $_.DriveLetter -ne $null } | Select-Object DriveLetter, FileSystemLabel, FileSystem, @{Name='Size(GB)';Expression={[math]::Round($_.Size/1GB,2)}}, @{Name='FreeSpace(GB)';Expression={[math]::Round($_.SizeRemaining/1GB,2)}}, @{Name='FreePercent';Expression={[math]::Round(($_.SizeRemaining/$_.Size)*100,2)}} | Format-Table -AutoSize"

echo [2/4] Analyzing largest folders on C: drive...
powershell -Command "Get-ChildItem -Path C:\ -Directory -ErrorAction SilentlyContinue | ForEach-Object { $size = (Get-ChildItem -Path $_.FullName -Recurse -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum).Sum; [PSCustomObject]@{Name=$_.FullName; 'Size(GB)'=[math]::Round($size/1GB,2)} } | Sort-Object -Property 'Size(GB)' -Descending | Select-Object -First 10 | Format-Table -AutoSize"

echo [3/4] Analyzing Windows component store...
powershell -Command "DISM /Online /Cleanup-Image /AnalyzeComponentStore"

echo [4/4] Analyzing user profiles storage...
powershell -Command "Get-ChildItem -Path 'C:\Users' -Directory -ErrorAction SilentlyContinue | ForEach-Object { $size = (Get-ChildItem -Path $_.FullName -Recurse -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum).Sum; [PSCustomObject]@{Name=$_.Name; 'Size(GB)'=[math]::Round($size/1GB,2)} } | Sort-Object -Property 'Size(GB)' -Descending | Format-Table -AutoSize"

echo.
echo Disk space analysis complete!
pause
goto STORAGE_MENU

:LARGE_FILE_FINDER
cls
call animation-utils.bat :SCAN_ANIMATION
echo.
echo Large File Finder
echo ---------------
echo.

echo This tool will find the largest files on your system.
echo.
echo Enter minimum file size in MB (e.g., 100):
set /p min_size=""
echo.
echo Select drive to scan (e.g., C):
set /p drive_letter=""
echo.
echo Scanning for files larger than %min_size% MB on drive %drive_letter%:...
echo.
powershell -Command "$size = %min_size% * 1MB; Get-ChildItem -Path '%drive_letter%:\' -Recurse -ErrorAction SilentlyContinue | Where-Object { !$_.PSIsContainer -and $_.Length -gt $size } | Sort-Object -Property Length -Descending | Select-Object -First 20 FullName,@{Name='Size(MB)';Expression={[math]::Round($_.Length/1MB,2)}},LastWriteTime | Format-Table -AutoSize"
echo.
echo Would you like to export this list to a text file? (Y/N)
set /p export_choice=""
if /i "%export_choice%"=="Y" (
    powershell -Command "$size = %min_size% * 1MB; Get-ChildItem -Path '%drive_letter%:\' -Recurse -ErrorAction SilentlyContinue | Where-Object { !$_.PSIsContainer -and $_.Length -gt $size } | Sort-Object -Property Length -Descending | Select-Object -First 100 FullName,@{Name='Size(MB)';Expression={[math]::Round($_.Length/1MB,2)}},LastWriteTime | Format-Table -AutoSize | Out-File -FilePath '$env:USERPROFILE\Desktop\LargeFiles.txt'"
    echo List exported to your Desktop as LargeFiles.txt
)
echo.
echo Scan complete!
pause
goto STORAGE_MENU

:DUPLICATE_FINDER
cls
call animation-utils.bat :COUNTDOWN 3
echo.
echo Duplicate File Finder
echo -------------------
echo.

echo This tool will find duplicate files based on content.
echo WARNING: This process may take a long time for large directories.
echo.
echo Select directory to scan (e.g., C:\Users\Username\Documents):
set /p scan_dir=""
echo.
echo Scanning for duplicates in %scan_dir%...
echo.
powershell -Command "Get-ChildItem -Path '%scan_dir%' -Recurse -File -ErrorAction SilentlyContinue | Get-FileHash | Group-Object -Property Hash | Where-Object { $_.Count -gt 1 } | ForEach-Object { $_.Group | Select-Object Path, Hash } | Format-Table -AutoSize"
echo.
echo Would you like to export this list to a text file? (Y/N)
set /p export_choice=""
if /i "%export_choice%"=="Y" (
    powershell -Command "Get-ChildItem -Path '%scan_dir%' -Recurse -File -ErrorAction SilentlyContinue | Get-FileHash | Group-Object -Property Hash | Where-Object { $_.Count -gt 1 } | ForEach-Object { $_.Group | Select-Object Path, Hash } | Format-Table -AutoSize | Out-File -FilePath '$env:USERPROFILE\Desktop\DuplicateFiles.txt'"
    echo List exported to your Desktop as DuplicateFiles.txt
)
echo.
echo Scan complete!
pause
goto STORAGE_MENU

:DISK_BENCHMARK
cls
call animation-utils.bat :TYPING_EFFECT "Disk Benchmark Tool"
echo.
echo Disk Benchmark Tool
echo -----------------
echo.

echo Select drive to benchmark (e.g., C):
set /p bench_drive=""
echo.
echo Running disk benchmark on drive %bench_drive%:...
echo.
echo [1/3] Testing sequential read speed...
powershell -Command "$startTime = Get-Date; $testFile = '%bench_drive%:\temp_benchmark.dat'; fsutil file createnew $testFile (1024*1024*100); $endTime = Get-Date; $timeTaken = ($endTime - $startTime).TotalSeconds; Write-Host ('Write Speed: ' + [math]::Round((100/($timeTaken)),2) + ' MB/s')"

echo [2/3] Testing sequential read speed...
powershell -Command "$startTime = Get-Date; $testFile = '%bench_drive%:\temp_benchmark.dat'; $content = Get-Content -Path $testFile -Raw; $endTime = Get-Date; $timeTaken = ($endTime - $startTime).TotalSeconds; Write-Host ('Read Speed: ' + [math]::Round((100/($timeTaken)),2) + ' MB/s')"

echo [3/3] Testing random access...
powershell -Command "$startTime = Get-Date; $testFile = '%bench_drive%:\temp_benchmark.dat'; for ($i=0; $i -lt 1000; $i++) { $randomPos = Get-Random -Minimum 0 -Maximum (100*1024*1024); $fs = [System.IO.File]::OpenRead($testFile); $fs.Seek($randomPos, [System.IO.SeekOrigin]::Begin); $buffer = New-Object byte[] 4096; $fs.Read($buffer, 0, 4096); $fs.Close(); }; $endTime = Get-Date; $timeTaken = ($endTime - $startTime).TotalSeconds; Write-Host ('Random Access: ' + [math]::Round((1000/($timeTaken)),2) + ' IOPS')"

echo.
echo Cleaning up benchmark files...
powershell -Command "Remove-Item '%bench_drive%:\temp_benchmark.dat' -Force -ErrorAction SilentlyContinue"

echo.
echo Benchmark complete!
pause
goto STORAGE_MENU
