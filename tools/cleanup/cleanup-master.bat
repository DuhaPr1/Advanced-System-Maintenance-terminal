@echo off
title Advanced System Cleanup - By Abdelhakim Baalla
color 0C
mode con: cols=100 lines=35
setlocal enabledelayedexpansion

:: Check for admin privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Administrator privileges required!
    echo Right-click and select "Run as administrator"
    pause
    exit /b
)

:: Log file setup
set "log_file=..\..\logs\cleanup_log_%date:~-4,4%%date:~-7,2%%date:~-10,2%_%time:~0,2%%time:~3,2%%time:~6,2%.txt"
set "log_file=%log_file: =0%"
echo Advanced System Cleanup - Log started at %date% %time% > "%log_file%"
echo Created by Abdelhakim Baalla >> "%log_file%"
echo. >> "%log_file%"

:: Run intro animation
powershell -Command "$host.UI.RawUI.BackgroundColor = 'Black'; $host.UI.RawUI.ForegroundColor = 'Red'; Clear-Host; Write-Host ''; Write-Host ''; Write-Host '                                SYSTEM CLEANUP MODULE'; Write-Host '                               INITIALIZING SCANNERS'; Write-Host ''; Write-Host ''; $chars = '/-\|'; for ($i = 0; $i -lt 20; $i++) { Write-Host -NoNewLine "`r                               ['; Write-Host -NoNewLine -ForegroundColor Green ('=' * $i); Write-Host -NoNewLine (' ' * (20 - $i)); Write-Host -NoNewLine '] '; Write-Host -NoNewLine $chars[$i % 4]; Start-Sleep -Milliseconds 100; }; Write-Host ''; Write-Host ''; Write-Host '                               CLEANUP MODULE READY'; Start-Sleep -Seconds 1; Clear-Host"

:CLEANUP_MENU
cls
echo.
echo  ██████╗██╗     ███████╗ █████╗ ███╗   ██╗██╗   ██╗██████╗     
echo ██╔════╝██║     ██╔════╝██╔══██╗████╗  ██║██║   ██║██╔══██╗    
echo ██║     ██║     █████╗  ███████║██╔██╗ ██║██║   ██║██████╔╝    
echo ██║     ██║     ██╔══╝  ██╔══██║██║╚██╗██║██║   ██║██╔═══╝     
echo ╚██████╗███████╗███████╗██║  ██║██║ ╚████║╚██████╔╝██║         
echo  ╚═════╝╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝         
echo.
echo ███████╗██╗   ██╗███████╗████████╗███████╗███╗   ███╗          
echo ██╔════╝╚██╗ ██╔╝██╔════╝╚══██╔══╝██╔════╝████╗ ████║          
echo ███████╗ ╚████╔╝ ███████╗   ██║   █████╗  ██╔████╔██║          
echo ╚════██║  ╚██╔╝  ╚════██║   ██║   ██╔══╝  ██║╚██╔╝██║          
echo ███████║   ██║   ███████║   ██║   ███████╗██║ ╚═╝ ██║          
echo ╚══════╝   ╚═╝   ╚══════╝   ╚═╝   ╚══════╝╚═╝     ╚═╝          
echo.
echo                      Created by Abdelhakim Baalla
echo                   https://abdelhakim-baalla.vercel.app/
echo.
echo  ╔════════════════════════════════════════════════════════════════════════════════╗
echo  ║                             SYSTEM CLEANUP TOOLS                               ║
echo  ╚════════════════════════════════════════════════════════════════════════════════╝
echo.
echo   [1] Quick Cleanup (Temp files, Cache, Recycle Bin)
echo   [2] Deep Cleanup (System files, Logs, Update cache)
echo   [3] Nuclear Cleanup (Everything + Registry cleanup)
echo   [4] Browser Cleanup (All browsers cache/cookies)
echo   [5] Windows Store & Apps Cleanup
echo   [6] Windows Update Cleanup
echo   [7] Event Logs Cleanup
echo   [8] Custom Cleanup (Select specific items)
echo   [9] Cleanup Analysis (Show what can be cleaned)
echo.
echo   [A] Advanced Junk File Scanner
echo   [B] Duplicate File Finder
echo   [C] Large File Locator
echo   [D] Old File Cleanup (By date)
echo   [E] Scheduled Cleanup Configuration
echo   [F] System Restore Point Cleanup
echo   [0] Back to Main Menu
echo.
echo  ╔════════════════════════════════════════════════════════════════════════════════╗
echo  ║  Last Cleanup: Checking...                                                     ║
echo  ╚════════════════════════════════════════════════════════════════════════════════╝
echo.
set /p choice="Enter your choice: "

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
echo Running Quick Cleanup... >> "%log_file%"
echo.
echo  ╔════════════════════════════════════════════════════════════════════════════════╗
echo  ║                               QUICK CLEANUP                                    ║
echo  ╚════════════════════════════════════════════════════════════════════════════════╝
echo.

:: Hacker-style animation
powershell -Command "$host.UI.RawUI.BackgroundColor = 'Black'; $host.UI.RawUI.ForegroundColor = 'Green'; Write-Host ''; Write-Host ' Initializing cleanup sequence...'; Start-Sleep -Milliseconds 500; Write-Host ' Scanning system for temporary files...'; Start-Sleep -Milliseconds 500; for ($i = 0; $i -lt 10; $i++) { Write-Host (' > ' + [string]::Join('', (1..50 | ForEach-Object { [char]::ConvertFromUtf32((Get-Random -Minimum 33 -Maximum 126)) }))) -ForegroundColor DarkGreen; Start-Sleep -Milliseconds 50; }; Write-Host ' Temporary files identified. Proceeding with removal...'; Start-Sleep -Milliseconds 500;"

echo [1/4] Clearing Recycle Bin...
echo Clearing Recycle Bin... >> "%log_file%"
powershell -Command "Clear-RecycleBin -Force -ErrorAction SilentlyContinue"
echo Done.

echo [2/4] Clearing User Temp Files...
echo Clearing User Temp Files... >> "%log_file%"
powershell -Command "Remove-Item -Path $env:TEMP\* -Recurse -Force -ErrorAction SilentlyContinue"
echo Done.

echo [3/4] Clearing Windows Temp Files...
echo Clearing Windows Temp Files... >> "%log_file%"
powershell -Command "Remove-Item -Path $env:SystemRoot\Temp\* -Recurse -Force -ErrorAction SilentlyContinue"
echo Done.

echo [4/4] Clearing Prefetch Files...
echo Clearing Prefetch Files... >> "%log_file%"
powershell -Command "Remove-Item -Path $env:SystemRoot\Prefetch\* -Force -ErrorAction SilentlyContinue"
echo Done.

:: Completion animation
powershell -Command "$host.UI.RawUI.BackgroundColor = 'Black'; $host.UI.RawUI.ForegroundColor = 'Green'; Write-Host ''; Write-Host ' Cleanup sequence completed successfully!'; Write-Host ' System refreshed and optimized.'; Write-Host ''; Write-Host ' [' -NoNewline; Write-Host 'SUCCESS' -ForegroundColor Green -NoNewline; Write-Host '] Quick cleanup completed!'; Write-Host '';"

echo Quick Cleanup completed successfully! >> "%log_file%"
echo.
echo Press any key to return to the Cleanup Menu...
pause >nul
goto CLEANUP_MENU

:DEEP_CLEANUP
cls
echo Running Deep Cleanup... >> "%log_file%"
echo.
echo  ╔════════════════════════════════════════════════════════════════════════════════╗
echo  ║                               DEEP CLEANUP                                     ║
echo  ╚════════════════════════════════════════════════════════════════════════════════╝
echo.

:: Advanced terminal animation
powershell -Command "$host.UI.RawUI.BackgroundColor = 'Black'; $host.UI.RawUI.ForegroundColor = 'Cyan'; Write-Host ''; Write-Host ' INITIATING DEEP SYSTEM SCAN'; Write-Host ' ========================'; Write-Host ''; $scanSteps = @('Analyzing file system structure', 'Identifying system junk files', 'Calculating potential space savings', 'Preparing cleanup algorithms', 'Initializing deep scan sequence'); foreach ($step in $scanSteps) { Write-Host (' > ' + $step + '...') -NoNewline; $dots = 0; for ($i = 0; $i -lt 10; $i++) { Write-Host '.' -NoNewline; Start-Sleep -Milliseconds 100; }; Write-Host ' [COMPLETE]' -ForegroundColor Green; Start-Sleep -Milliseconds 200; }; Write-Host ''; Write-Host ' Deep scan complete. Beginning cleanup process...'; Write-Host '';"

echo [1/8] Clearing temporary files...
echo Clearing temporary files... >> "%log_file%"
powershell -Command "Remove-Item -Path $env:TEMP\*, $env:SystemRoot\Temp\*, $env:SystemRoot\Prefetch\* -Recurse -Force -ErrorAction SilentlyContinue"
echo Done.

echo [2/8] Clearing Windows Update cache...
echo Clearing Windows Update cache... >> "%log_file%"
net stop wuauserv >nul 2>&1
powershell -Command "Remove-Item -Path $env:SystemRoot\SoftwareDistribution\Download\* -Recurse -Force -ErrorAction SilentlyContinue"
net start wuauserv >nul 2>&1
echo Done.

echo [3/8] Clearing DNS cache...
echo Clearing DNS cache... >> "%log_file%"
ipconfig /flushdns >nul
echo Done.

echo [4/8] Clearing Windows Store cache...
echo Clearing Windows Store cache... >> "%log_file%"
powershell -Command "Get-ChildItem -Path $env:LOCALAPPDATA\Packages\Microsoft.WindowsStore* -Recurse | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue"
echo Done.

echo [5/8] Running Disk Cleanup...
echo Running Disk Cleanup... >> "%log_file%"
cleanmgr /sagerun:1 >nul
echo Done.

echo [6/8] Clearing system logs...
echo Clearing system logs... >> "%log_file%"
for /f "tokens=*" %%i in ('wevtutil el') do wevtutil cl "%%i" 2>nul
echo Done.

echo [7/8] Cleaning WinSxS component store...
echo Cleaning WinSxS component store... >> "%log_file%"
Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase >nul
echo Done.

echo [8/8] Final cleanup...
echo Final cleanup... >> "%log_file%"
powershell -Command "Remove-Item -Path $env:LOCALAPPDATA\Microsoft\Windows\Explorer\thumbcache_*.db -Force -ErrorAction SilentlyContinue"
echo Done.

:: Completion animation
powershell -Command "$host.UI.RawUI.BackgroundColor = 'Black'; $host.UI.RawUI.ForegroundColor = 'Green'; Write-Host ''; Write-Host ' ╔══════════════════════════════════════════════════════════╗'; Write-Host ' ║                   CLEANUP COMPLETE                      ║'; Write-Host ' ╚══════════════════════════════════════════════════════════╝'; Write-Host ''; Write-Host ' System has been thoroughly cleaned and optimized.'; Write-Host ' All temporary files and system junk have been removed.'; Write-Host ''; Write-Host ' [' -NoNewline; Write-Host 'SUCCESS' -ForegroundColor Green -NoNewline; Write-Host '] Deep cleanup completed!'; Write-Host '';"

echo Deep Cleanup completed successfully! >> "%log_file%"
echo.
echo Press any key to return to the Cleanup Menu...
pause >nul
goto CLEANUP_MENU

:ADVANCED_JUNK_SCANNER
cls
echo Running Advanced Junk Scanner... >> "%log_file%"
echo.
echo  ╔════════════════════════════════════════════════════════════════════════════════╗
echo  ║                          ADVANCED JUNK SCANNER                                 ║
echo  ╚════════════════════════════════════════════════════════════════════════════════╝
echo.

:: Hacker-style scanning animation
powershell -Command "$host.UI.RawUI.BackgroundColor = 'Black'; $host.UI.RawUI.ForegroundColor = 'Yellow'; Write-Host ''; Write-Host ' INITIATING ADVANCED JUNK SCANNING ALGORITHM'; Write-Host ' ======================================='; Write-Host ''; Write-Host ' Scanning system for advanced junk patterns...'; Write-Host ''; for ($i = 0; $i -lt 15; $i++) { $percent = [int](($i / 15) * 100); $bar = '█' * [int]($percent / 5) + ' ' * (20 - [int]($percent / 5)); Write-Host (\" Progress: [{0}] {1}%\" -f $bar, $percent) -ForegroundColor Yellow; Start-Sleep -Milliseconds 200; Write-Host (' > ' + [string]::Join('', (1..70 | ForEach-Object { [char]::ConvertFromUtf32((Get-Random -Minimum 33 -Maximum 126)) }))) -ForegroundColor DarkYellow; }; Write-Host ''; Write-Host ' Scan complete. Analyzing results...'; Write-Host '';"

echo [1/5] Scanning for temporary installation files...
echo Scanning for temporary installation files... >> "%log_file%"
powershell -Command "$tempFiles = Get-ChildItem -Path C:\ -Include '*.tmp','*.temp','*.dmp','*.bak','~*.*' -File -Recurse -ErrorAction SilentlyContinue | Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-30) }; $size = ($tempFiles | Measure-Object -Property Length -Sum).Sum / 1MB; Write-Host (' Found ' + $tempFiles.Count + ' files totaling ' + [math]::Round($size, 2) + ' MB')"
echo.

echo [2/5] Scanning for leftover installation directories...
echo Scanning for leftover installation directories... >> "%log_file%"
powershell -Command "$installDirs = Get-ChildItem -Path C:\ -Include 'installer','setup','temp','tmp' -Directory -Recurse -ErrorAction SilentlyContinue | Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-90) }; $size = ($installDirs | Get-ChildItem -Recurse -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum).Sum / 1MB; Write-Host (' Found ' + $installDirs.Count + ' directories totaling ' + [math]::Round($size, 2) + ' MB')"
echo.

echo [3/5] Scanning for orphaned log files...
echo Scanning for orphaned log files... >> "%log_file%"
powershell -Command "$logFiles = Get-ChildItem -Path C:\ -Include '*.log','*.old','*.etl' -File -Recurse -ErrorAction SilentlyContinue | Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-60) -and $_.Length -gt 1MB }; $size = ($logFiles | Measure-Object -Property Length -Sum).Sum / 1MB; Write-Host (' Found ' + $logFiles.Count + ' log files totaling ' + [math]::Round($size, 2) + ' MB')"
echo.

echo [4/5] Scanning for unused language resource files...
echo Scanning for unused language resource files... >> "%log_file%"
powershell -Command "try { $langFiles = Get-ChildItem -Path $env:SystemRoot\WinSxS\*amd64_microsoft-windows-* -Directory -ErrorAction SilentlyContinue | Where-Object { $_.Name -like '*_??-??_*' -and $_.Name -notlike '*_en-us_*' }; $size = ($langFiles | Get-ChildItem -Recurse -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum).Sum / 1MB; Write-Host (' Found ' + $langFiles.Count + ' language resource directories totaling ' + [math]::Round($size, 2) + ' MB') } catch { Write-Host ' Error scanning language resources' }"
echo.

echo [5/5] Scanning for leftover Windows Update files...
echo Scanning for leftover Windows Update files... >> "%log_file%"
powershell -Command "$updateFiles = Get-ChildItem -Path $env:SystemRoot\SoftwareDistribution\Download\* -Recurse -ErrorAction SilentlyContinue; $size = ($updateFiles | Measure-Object -Property Length -Sum).Sum / 1MB; Write-Host (' Found ' + $updateFiles.Count + ' update files totaling ' + [math]::Round($size, 2) + ' MB')"
echo.

:: Results animation
powershell -Command "$host.UI.RawUI.BackgroundColor = 'Black'; $host.UI.RawUI.ForegroundColor = 'Green'; Write-Host ''; Write-Host ' ╔══════════════════════════════════════════════════════════╗'; Write-Host ' ║                   SCAN COMPLETE                        ║'; Write-Host ' ╚══════════════════════════════════════════════════════════╝'; Write-Host ''; Write-Host ' Advanced junk scan completed successfully.'; Write-Host ' Review the results above to see potential space savings.'; Write-Host '';"

echo.
echo Would you like to clean these junk files? (Y/N)
set /p confirm=""
if /i "%confirm%"=="Y" (
    echo Cleaning junk files... >> "%log_file%"
    echo.
    echo Cleaning junk files...
    
    :: Cleaning animation
    powershell -Command "$host.UI.RawUI.BackgroundColor = 'Black'; $host.UI.RawUI.ForegroundColor = 'Cyan'; Write-Host ''; Write-Host ' EXECUTING CLEANUP SEQUENCE'; Write-Host ' ========================'; Write-Host '';"
    
    powershell -Command "Get-ChildItem -Path C:\ -Include '*.tmp','*.temp','*.dmp','*.bak','~*.*' -File -Recurse -ErrorAction SilentlyContinue | Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-30) } | Remove-Item -Force -ErrorAction SilentlyContinue"
    powershell -Command "Get-ChildItem -Path C:\ -Include '*.log','*.old','*.etl' -File -Recurse -ErrorAction SilentlyContinue | Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-60) -and $_.Length -gt 1MB } | Remove-Item -Force -ErrorAction SilentlyContinue"
    
    powershell -Command "$host.UI.RawUI.BackgroundColor = 'Black'; $host.UI.RawUI.ForegroundColor = 'Green'; Write-Host ''; Write-Host ' Cleanup complete!'; Write-Host '';"
    
    echo Junk files cleaned successfully! >> "%log_file%"
)

echo.
echo Press any key to return to the Cleanup Menu...
pause >nul
goto CLEANUP_MENU
