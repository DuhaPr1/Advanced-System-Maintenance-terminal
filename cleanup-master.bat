@echo off
title Deep System Cleanup - Advanced Mode
color 0C
mode con: cols=100 lines=35
setlocal enabledelayedexpansion

call animation-utils.bat :SHOW_DEVELOPER_INFO
call animation-utils.bat :SCAN_ANIMATION

:CLEANUP_MENU
cls
color 0C
echo.
echo  ========================================================================
echo                         DEEP SYSTEM CLEANUP
echo                        Advanced Cleaning Suite
echo  ========================================================================
echo.
echo  ----------------------------------------------------------------
echo   [1] Quick Cleanup (Temp files, Cache, Recycle Bin)
echo   [2] Deep Cleanup (System files, Logs, Update cache)
echo   [3] Nuclear Cleanup (Everything + Registry cleanup)
echo   [4] Browser Cleanup (All browsers cache/cookies)
echo   [5] Windows Store & Apps Cleanup
echo   [6] Windows Update Cleanup
echo   [7] Event Logs Cleanup
echo   [8] Custom Cleanup (Select specific items)
echo   [9] Cleanup Analysis (Show what can be cleaned)
echo   [A] Advanced Junk File Scanner
echo   [B] Duplicate File Finder
echo   [C] Large File Locator
echo   [D] Old File Cleanup (By date)
echo   [E] Scheduled Cleanup Configuration
echo   [F] System Restore Point Cleanup
echo   [0] Back to Main Menu
echo  ----------------------------------------------------------------
echo.
set /p choice="Select cleanup option: "

if /i "%choice%"=="1" goto QUICK_CLEANUP
if /i "%choice%"=="2" goto DEEP_CLEANUP
if /i "%choice%"=="3" goto NUCLEAR_CLEANUP
if /i "%choice%"=="4" goto BROWSER_CLEANUP
if /i "%choice%"=="5" goto STORE_CLEANUP
if /i "%choice%"=="6" goto UPDATE_CLEANUP
if /i "%choice%"=="7" goto LOGS_CLEANUP
if /i "%choice%"=="8" goto CUSTOM_CLEANUP
if /i "%choice%"=="9" goto CLEANUP_ANALYSIS
if /i "%choice%"=="A" goto ADVANCED_JUNK_SCANNER
if /i "%choice%"=="B" goto DUPLICATE_FINDER
if /i "%choice%"=="C" goto LARGE_FILE_LOCATOR
if /i "%choice%"=="D" goto OLD_FILE_CLEANUP
if /i "%choice%"=="E" goto SCHEDULED_CLEANUP
if /i "%choice%"=="F" goto RESTORE_POINT_CLEANUP
if /i "%choice%"=="0" exit /b

goto CLEANUP_MENU

:QUICK_CLEANUP
cls
call animation-utils.bat :SPINNER_ANIMATION "Starting Quick Cleanup"
echo.
echo Starting Quick Cleanup...
echo.
powershell -Command "Clear-RecycleBin -Force -ErrorAction SilentlyContinue"
powershell -Command "Remove-Item '$env:TEMP\*' -Recurse -Force -ErrorAction SilentlyContinue"
powershell -Command "Remove-Item '$env:SystemRoot\Temp\*' -Recurse -Force -ErrorAction SilentlyContinue"
powershell -Command "Remove-Item '$env:SystemRoot\Prefetch\*' -Force -ErrorAction SilentlyContinue"
echo Quick cleanup completed!
pause
goto CLEANUP_MENU

:DEEP_CLEANUP
cls
call animation-utils.bat :COUNTDOWN 3
echo.
echo Starting Deep System Cleanup...
echo.
echo [1/8] Clearing temporary files...
powershell -Command "Remove-Item '$env:TEMP\*', '$env:SystemRoot\Temp\*', '$env:SystemRoot\Prefetch\*' -Recurse -Force -ErrorAction SilentlyContinue"

echo [2/8] Clearing Windows Update cache...
powershell -Command "Stop-Service wuauserv -Force; Remove-Item '$env:SystemRoot\SoftwareDistribution\Download\*' -Recurse -Force -ErrorAction SilentlyContinue; Start-Service wuauserv"

echo [3/8] Clearing DNS cache...
powershell -Command "Clear-DnsClientCache"

echo [4/8] Clearing Windows Store cache...
powershell -Command "Get-ChildItem '$env:LOCALAPPDATA\Packages\Microsoft.WindowsStore*' -Recurse | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue"

echo [5/8] Running Disk Cleanup...
cleanmgr /sagerun:1

echo [6/8] Clearing system logs...
powershell -Command "wevtutil el | ForEach-Object { wevtutil cl '$_' -ErrorAction SilentlyContinue }"

echo [7/8] Cleaning WinSxS component store...
DISM /Online /Cleanup-Image /StartComponentCleanup /ResetBase

echo [8/8] Final cleanup...
powershell -Command "Remove-Item '$env:LOCALAPPDATA\Microsoft\Windows\Explorer\thumbcache_*.db' -Force -ErrorAction SilentlyContinue"

echo.
call animation-utils.bat :COLOR_CYCLE "Deep cleanup completed successfully!"
pause
goto CLEANUP_MENU

:ADVANCED_JUNK_SCANNER
cls
call animation-utils.bat :SCAN_ANIMATION
echo.
echo Advanced Junk File Scanner
echo -------------------------
echo.
echo Scanning for junk files across the system...
echo.

echo [1/5] Scanning for temporary installation files...
powershell -Command "Get-ChildItem -Path C:\ -Include '*.tmp','*.temp','*.dmp','*.bak','~*.*' -File -Recurse -ErrorAction SilentlyContinue | Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-30) } | Measure-Object -Property Length -Sum | Select-Object @{Name='Size(MB)';Expression={[math]::Round($_.Sum/1MB,2)}}"

echo [2/5] Scanning for leftover installation directories...
powershell -Command "Get-ChildItem -Path C:\ -Include 'installer','setup','temp','tmp' -Directory -Recurse -ErrorAction SilentlyContinue | Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-90) } | Measure-Object -Property Length -Sum | Select-Object @{Name='Size(MB)';Expression={[math]::Round($_.Sum/1MB,2)}}"

echo [3/5] Scanning for orphaned log files...
powershell -Command "Get-ChildItem -Path C:\ -Include '*.log','*.old','*.etl' -File -Recurse -ErrorAction SilentlyContinue | Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-60) -and $_.Length -gt 1MB } | Measure-Object -Property Length -Sum | Select-Object @{Name='Size(MB)';Expression={[math]::Round($_.Sum/1MB,2)}}"

echo [4/5] Scanning for unused language resource files...
powershell -Command "Get-ChildItem -Path '$env:SystemRoot\WinSxS\*amd64_microsoft-windows-*' -Directory -ErrorAction SilentlyContinue | Where-Object { $_.Name -like '*_??-??_*' -and $_.Name -notlike '*_en-us_*' } | Measure-Object -Property Length -Sum | Select-Object @{Name='Size(MB)';Expression={[math]::Round($_.Sum/1MB,2)}}"

echo [5/5] Scanning for leftover Windows Update files...
powershell -Command "Get-ChildItem -Path '$env:SystemRoot\SoftwareDistribution\Download\*' -Recurse -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum | Select-Object @{Name='Size(MB)';Expression={[math]::Round($_.Sum/1MB,2)}}"

echo.
echo Scan complete! Review the results above to see potential space savings.
echo.
echo Would you like to clean these junk files? (Y/N)
set /p confirm=""
if /i "%confirm%"=="Y" (
    echo Cleaning junk files...
    powershell -Command "Get-ChildItem -Path C:\ -Include '*.tmp','*.temp','*.dmp','*.bak','~*.*' -File -Recurse -ErrorAction SilentlyContinue | Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-30) } | Remove-Item -Force -ErrorAction SilentlyContinue"
    echo Cleanup complete!
)
pause
goto CLEANUP_MENU

:LARGE_FILE_LOCATOR
cls
call animation-utils.bat :SPINNER_ANIMATION "Scanning for large files"
echo.
echo Large File Locator
echo -----------------
echo.
echo This tool will find the largest files on your system.
echo.
echo Enter minimum file size in MB (e.g., 100):
set /p min_size=""
echo.
echo Scanning for files larger than %min_size% MB...
echo.
powershell -Command "$size = %min_size% * 1MB; Get-ChildItem -Path C:\ -Recurse -ErrorAction SilentlyContinue | Where-Object { !$_.PSIsContainer -and $_.Length -gt $size } | Sort-Object -Property Length -Descending | Select-Object -First 20 FullName,@{Name='Size(MB)';Expression={[math]::Round($_.Length/1MB,2)}} | Format-Table -AutoSize"
echo.
echo Scan complete! The largest files are listed above.
pause
goto CLEANUP_MENU

:SCHEDULED_CLEANUP
cls
call animation-utils.bat :TYPING_EFFECT "Setting up Scheduled Cleanup..."
echo.
echo Scheduled Cleanup Configuration
echo ------------------------------
echo.
echo This will create a scheduled task to automatically clean your system.
echo.
echo Select cleanup frequency:
echo [1] Daily
echo [2] Weekly
echo [3] Monthly
echo.
set /p freq=""

set schedule_cmd=""
if "%freq%"=="1" set "schedule_cmd=Daily"
if "%freq%"=="2" set "schedule_cmd=Weekly -DaysOfWeek Sunday"
if "%freq%"=="3" set "schedule_cmd=Monthly -DaysOfMonth 1"

echo.
echo Select cleanup time (24-hour format, e.g., 23:00):
set /p cleanup_time=""

echo.
echo Creating scheduled cleanup task...
powershell -Command "$Trigger = New-ScheduledTaskTrigger -%schedule_cmd% -At %cleanup_time%; $Action = New-ScheduledTaskAction -Execute 'powershell.exe' -Argument '-NoProfile -Command \"Remove-Item \$env:TEMP\* -Recurse -Force -ErrorAction SilentlyContinue; Clear-RecycleBin -Force -ErrorAction SilentlyContinue\"'; Register-ScheduledTask -TaskName 'Automated System Cleanup' -Trigger $Trigger -Action $Action -RunLevel Highest -Force"

echo.
echo Scheduled cleanup task created successfully!
pause
goto CLEANUP_MENU
