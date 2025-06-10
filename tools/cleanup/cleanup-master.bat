@echo off
title System Cleanup Tools - By Abdelhakim Baalla
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
echo System Cleanup Tools - Log started at %date% %time% > "%log_file%"
echo Created by Abdelhakim Baalla >> "%log_file%"
echo. >> "%log_file%"

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
echo   [6] Advanced Junk File Scanner
echo   [7] Duplicate File Finder
echo   [8] Large File Locator
echo   [9] Scheduled Cleanup Configuration
echo   [0] Back to Main Menu
echo.
set /p choice="Enter your choice: "

if "%choice%"=="1" goto QUICK_CLEANUP
if "%choice%"=="2" goto DEEP_CLEANUP
if "%choice%"=="3" goto NUCLEAR_CLEANUP
if "%choice%"=="4" goto BROWSER_CLEANUP
if "%choice%"=="5" goto STORE_CLEANUP
if "%choice%"=="6" goto JUNK_SCANNER
if "%choice%"=="7" goto DUPLICATE_FINDER
if "%choice%"=="8" goto LARGE_FILE_FINDER
if "%choice%"=="9" goto SCHEDULED_CLEANUP
if "%choice%"=="0" exit /b

goto CLEANUP_MENU

:QUICK_CLEANUP
cls
echo Quick Cleanup started at %time% >> "%log_file%"
echo.
echo  ╔════════════════════════════════════════════════════════════════════════════════╗
echo  ║                               QUICK CLEANUP                                    ║
echo  ╚════════════════════════════════════════════════════════════════════════════════╝
echo.
echo Starting Quick Cleanup...
echo.

echo [1/4] Clearing Recycle Bin...
powershell -Command "Clear-RecycleBin -Force -ErrorAction SilentlyContinue"
echo Recycle Bin cleared >> "%log_file%"
echo Done.

echo [2/4] Clearing User Temp Files...
powershell -Command "Remove-Item -Path $env:TEMP\* -Recurse -Force -ErrorAction SilentlyContinue"
echo User temp files cleared >> "%log_file%"
echo Done.

echo [3/4] Clearing Windows Temp Files...
powershell -Command "Remove-Item -Path $env:SystemRoot\Temp\* -Recurse -Force -ErrorAction SilentlyContinue"
echo Windows temp files cleared >> "%log_file%"
echo Done.

echo [4/4] Clearing Prefetch Files...
powershell -Command "Remove-Item -Path $env:SystemRoot\Prefetch\* -Force -ErrorAction SilentlyContinue"
echo Prefetch files cleared >> "%log_file%"
echo Done.

echo.
echo ✅ Quick cleanup completed successfully!
echo Quick Cleanup completed at %time% >> "%log_file%"
echo.
pause
goto CLEANUP_MENU

:DEEP_CLEANUP
cls
echo Deep Cleanup started at %time% >> "%log_file%"
echo.
echo  ╔════════════════════════════════════════════════════════════════════════════════╗
echo  ║                               DEEP CLEANUP                                     ║
echo  ╚════════════════════════════════════════════════════════════════════════════════╝
echo.
echo Starting Deep System Cleanup...
echo.

echo [1/8] Clearing temporary files...
powershell -Command "Remove-Item -Path $env:TEMP\*, $env:SystemRoot\Temp\*, $env:SystemRoot\Prefetch\* -Recurse -Force -ErrorAction SilentlyContinue"
echo Done.

echo [2/8] Clearing Windows Update cache...
net stop wuauserv >nul 2>&1
powershell -Command "Remove-Item -Path $env:SystemRoot\SoftwareDistribution\Download\* -Recurse -Force -ErrorAction SilentlyContinue"
net start wuauserv >nul 2>&1
echo Done.

echo [3/8] Clearing DNS cache...
ipconfig /flushdns >nul
echo Done.

echo [4/8] Clearing Windows Store cache...
powershell -Command "Get-ChildItem -Path $env:LOCALAPPDATA\Packages\Microsoft.WindowsStore* -Recurse | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue"
echo Done.

echo [5/8] Running Disk Cleanup...
cleanmgr /sagerun:1 >nul
echo Done.

echo [6/8] Clearing system logs...
for /f "tokens=*" %%i in ('wevtutil el') do wevtutil cl "%%i" 2>nul
echo Done.

echo [7/8] Cleaning WinSxS component store...
Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase >nul
echo Done.

echo [8/8] Final cleanup...
powershell -Command "Remove-Item -Path $env:LOCALAPPDATA\Microsoft\Windows\Explorer\thumbcache_*.db -Force -ErrorAction SilentlyContinue"
echo Done.

echo.
echo ✅ Deep cleanup completed successfully!
echo Deep Cleanup completed at %time% >> "%log_file%"
echo.
pause
goto CLEANUP_MENU

:JUNK_SCANNER
cls
echo Advanced Junk Scanner started at %time% >> "%log_file%"
echo.
echo  ╔════════════════════════════════════════════════════════════════════════════════╗
echo  ║                          ADVANCED JUNK SCANNER                                 ║
echo  ╚════════════════════════════════════════════════════════════════════════════════╝
echo.

echo [1/5] Scanning for temporary installation files...
powershell -Command "$tempFiles = Get-ChildItem -Path C:\ -Include '*.tmp','*.temp','*.dmp','*.bak','~*.*' -File -Recurse -ErrorAction SilentlyContinue | Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-30) }; $size = ($tempFiles | Measure-Object -Property Length -Sum).Sum / 1MB; Write-Host ('Found ' + $tempFiles.Count + ' files totaling ' + [math]::Round($size, 2) + ' MB')"
echo.

echo [2/5] Scanning for leftover installation directories...
powershell -Command "$installDirs = Get-ChildItem -Path C:\ -Include 'installer','setup','temp','tmp' -Directory -Recurse -ErrorAction SilentlyContinue | Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-90) }; $size = ($installDirs | Get-ChildItem -Recurse -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum).Sum / 1MB; Write-Host ('Found ' + $installDirs.Count + ' directories totaling ' + [math]::Round($size, 2) + ' MB')"
echo.

echo [3/5] Scanning for orphaned log files...
powershell -Command "$logFiles = Get-ChildItem -Path C:\ -Include '*.log','*.old','*.etl' -File -Recurse -ErrorAction SilentlyContinue | Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-60) -and $_.Length -gt 1MB }; $size = ($logFiles | Measure-Object -Property Length -Sum).Sum / 1MB; Write-Host ('Found ' + $logFiles.Count + ' log files totaling ' + [math]::Round($size, 2) + ' MB')"
echo.

echo [4/5] Scanning for unused language resource files...
powershell -Command "try { $langFiles = Get-ChildItem -Path $env:SystemRoot\WinSxS\*amd64_microsoft-windows-* -Directory -ErrorAction SilentlyContinue | Where-Object { $_.Name -like '*_??-??_*' -and $_.Name -notlike '*_en-us_*' }; $size = ($langFiles | Get-ChildItem -Recurse -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum).Sum / 1MB; Write-Host ('Found ' + $langFiles.Count + ' language resource directories totaling ' + [math]::Round($size, 2) + ' MB') } catch { Write-Host 'Error scanning language resources' }"
echo.

echo [5/5] Scanning for leftover Windows Update files...
powershell -Command "$updateFiles = Get-ChildItem -Path $env:SystemRoot\SoftwareDistribution\Download\* -Recurse -ErrorAction SilentlyContinue; $size = ($updateFiles | Measure-Object -Property Length -Sum).Sum / 1MB; Write-Host ('Found ' + $updateFiles.Count + ' update files totaling ' + [math]::Round($size, 2) + ' MB')"
echo.

echo Scan complete! Review the results above to see potential space savings.
echo.
echo Would you like to clean these junk files? (Y/N)
set /p confirm=""
if /i "%confirm%"=="Y" (
echo Cleaning junk files...
powershell -Command "Get-ChildItem -Path C:\ -Include '*.tmp','*.temp','*.dmp','*.bak','~*.*' -File -Recurse -ErrorAction SilentlyContinue | Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-30) } | Remove-Item -Force -ErrorAction SilentlyContinue"
echo Cleanup complete!
echo Junk files cleaned at %time% >> "%log_file%"
)
pause
goto CLEANUP_MENU
