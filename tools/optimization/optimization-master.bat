@echo off
title Performance Optimization Suite - By Abdelhakim Baalla
color 0E
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
set "log_file=..\..\logs\optimization_log_%date:~-4,4%%date:~-7,2%%date:~-10,2%_%time:~0,2%%time:~3,2%%time:~6,2%.txt"
set "log_file=%log_file: =0%"
echo Performance Optimization - Log started at %date% %time% > "%log_file%"
echo Created by Abdelhakim Baalla >> "%log_file%"
echo. >> "%log_file%"

:OPTIMIZATION_MENU
cls
echo.
echo   ██████╗ ██████╗ ████████╗██╗███╗   ███╗██╗███████╗ █████╗ ████████╗██╗ ██████╗ ███╗   ██╗
echo  ██╔═══██╗██╔══██╗╚══██╔══╝██║████╗ ████║██║╚══███╔╝██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║
echo  ██║   ██║██████╔╝   ██║   ██║██╔████╔██║██║  ███╔╝ ███████║   ██║   ██║██║   ██║██╔██╗ ██║
echo  ██║   ██║██╔═══╝    ██║   ██║██║╚██╔╝██║██║ ███╔╝  ██╔══██║   ██║   ██║██║   ██║██║╚██╗██║
echo  ╚██████╔╝██║        ██║   ██║██║ ╚═╝ ██║██║███████╗██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║
echo   ╚═════╝ ╚═╝        ╚═╝   ╚═╝╚═╝     ╚═╝╚═╝╚══════╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝
echo.
echo                             Created by Abdelhakim Baalla
echo                          https://abdelhakim-baalla.vercel.app/
echo.
echo  ╔════════════════════════════════════════════════════════════════════════════════╗
echo  ║                         SYSTEM OPTIMIZATION TOOLS                              ║
echo  ╚════════════════════════════════════════════════════════════════════════════════╝
echo.
echo   [1] Quick Performance Boost
echo   [2] Advanced System Optimization
echo   [3] Memory & Storage Optimization
echo   [4] Registry Optimization
echo   [5] SSD Optimization
echo   [6] Startup & Services Optimization
echo   [7] Visual Effects Optimization
echo   [8] Custom Performance Profile
echo   [0] Back to Main Menu
echo.
set /p choice="Enter your choice: "

if "%choice%"=="1" goto QUICK_BOOST
if "%choice%"=="2" goto ADVANCED_OPT
if "%choice%"=="3" goto MEMORY_OPT
if "%choice%"=="4" goto REGISTRY_OPT
if "%choice%"=="5" goto SSD_OPT
if "%choice%"=="6" goto STARTUP_OPT
if "%choice%"=="7" goto VISUAL_OPT
if "%choice%"=="8" goto CUSTOM_PROFILE
if "%choice%"=="0" exit /b

goto OPTIMIZATION_MENU

:QUICK_BOOST
cls
echo Quick Performance Boost started at %time% >> "%log_file%"
echo.
echo  ╔════════════════════════════════════════════════════════════════════════════════╗
echo  ║                          QUICK PERFORMANCE BOOST                               ║
echo  ╚════════════════════════════════════════════════════════════════════════════════╝
echo.
echo Applying Quick Performance Boost...
echo.

echo [1/6] Optimizing system responsiveness...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d 38 /f >nul
echo Done.

echo [2/6] Disabling visual effects for performance...
reg add "HKCU\Control Panel\Desktop" /v "DragFullWindows" /t REG_SZ /d "0" /f >nul
reg add "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "0" /f >nul
echo Done.

echo [3/6] Optimizing memory management...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "ClearPageFileAtShutdown" /t REG_DWORD /d 0 /f >nul
echo Done.

echo [4/6] Disabling unnecessary services...
sc config "Fax" start= disabled >nul 2>&1
sc config "TabletInputService" start= disabled >nul 2>&1
echo Done.

echo [5/6] Optimizing network settings...
netsh int tcp set global autotuninglevel=normal >nul
echo Done.

echo [6/6] Clearing system cache...
powershell -Command "Remove-Item -Path $env:SystemRoot\Prefetch\* -Force -ErrorAction SilentlyContinue"
echo Done.

echo.
echo ✅ Quick performance boost applied successfully!
echo Quick Performance Boost completed at %time% >> "%log_file%"
echo.
pause
goto OPTIMIZATION_MENU

:REGISTRY_OPT
cls
echo Registry Optimization started at %time% >> "%log_file%"
echo.
echo  ╔════════════════════════════════════════════════════════════════════════════════╗
echo  ║                           REGISTRY OPTIMIZATION                                ║
echo  ╚════════════════════════════════════════════════════════════════════════════════╝
echo.
echo WARNING: Registry modifications can affect system stability.
echo Creating backup before proceeding...

echo [1/5] Creating registry backup...
if not exist "..\..\backups" mkdir "..\..\backups"
reg export HKLM "..\..\backups\HKLM_Backup_%date:~-4,4%%date:~-7,2%%date:~-10,2%.reg" /y >nul
reg export HKCU "..\..\backups\HKCU_Backup_%date:~-4,4%%date:~-7,2%%date:~-10,2%.reg" /y >nul
echo Done.

echo [2/5] Optimizing Explorer settings...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewAlphaSelect" /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewShadow" /t REG_DWORD /d 0 /f >nul
echo Done.

echo [3/5] Optimizing desktop settings...
reg add "HKCU\Control Panel\Desktop" /v "FontSmoothing" /t REG_SZ /d "2" /f >nul
reg add "HKCU\Control Panel\Desktop" /v "FontSmoothingType" /t REG_DWORD /d 2 /f >nul
echo Done.

echo [4/5] Optimizing system performance settings...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d 1 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d 1 /f >nul
echo Done.

echo [5/5] Optimizing network settings...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d 0xffffffff /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d 0 /f >nul
echo Done.

echo.
echo ✅ Registry optimization completed successfully!
echo A backup has been saved to the backups folder.
echo Registry Optimization completed at %time% >> "%log_file%"
echo.
pause
goto OPTIMIZATION_MENU

:SSD_OPT
cls
echo SSD Optimization started at %time% >> "%log_file%"
echo.
echo  ╔════════════════════════════════════════════════════════════════════════════════╗
echo  ║                             SSD OPTIMIZATION                                   ║
echo  ╚════════════════════════════════════════════════════════════════════════════════╝
echo.

echo Detecting SSDs in your system...
powershell -Command "Get-PhysicalDisk | Where-Object MediaType -eq 'SSD' | Format-Table FriendlyName, MediaType, Size, HealthStatus"
echo.

echo [1/7] Disabling Superfetch/SysMain service...
sc stop "SysMain" >nul 2>&1
sc config "SysMain" start= disabled >nul 2>&1
echo Done.

echo [2/7] Disabling Windows Search indexing...
sc stop "WSearch" >nul 2>&1
sc config "WSearch" start= disabled >nul 2>&1
echo Done.

echo [3/7] Enabling TRIM for all SSDs...
fsutil behavior set DisableDeleteNotify 0 >nul
echo Done.

echo [4/7] Disabling hibernation to free up space...
powercfg /hibernate off >nul
echo Done.

echo [5/7] Optimizing page file settings...
wmic computersystem set AutomaticManagedPagefile=False >nul
wmic pagefileset delete >nul
wmic pagefileset create name="C:\pagefile.sys" initialsize=1024 maximumsize=4096 >nul
echo Done.

echo [6/7] Disabling defragmentation for SSDs...
schtasks /Change /TN "\Microsoft\Windows\Defrag\ScheduledDefrag" /Disable >nul
echo Done.

echo [7/7] Running TRIM command on all SSDs...
defrag /L /U /V >nul
echo Done.

echo.
echo ✅ SSD optimization completed successfully!
echo SSD Optimization completed at %time% >> "%log_file%"
echo.
pause
goto OPTIMIZATION_MENU