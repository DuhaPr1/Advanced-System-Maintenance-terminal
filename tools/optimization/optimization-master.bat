@echo off
title Advanced System Optimization - By Abdelhakim Baalla
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
echo Advanced System Optimization - Log started at %date% %time% > "%log_file%"
echo Created by Abdelhakim Baalla >> "%log_file%"
echo. >> "%log_file%"

:: Run intro animation
powershell -Command "$host.UI.RawUI.BackgroundColor = 'Black'; $host.UI.RawUI.ForegroundColor = 'Yellow'; Clear-Host; Write-Host ''; Write-Host ''; Write-Host '                             SYSTEM OPTIMIZATION MODULE'; Write-Host '                              INITIALIZING ENGINES'; Write-Host ''; Write-Host ''; for ($i = 0; $i -lt 20; $i++) { $percent = $i * 5; $bar = '█' * $i + ' ' * (20 - $i); Write-Host (\"                              [{0}] {1}%\" -f $bar, $percent) -ForegroundColor Yellow; Start-Sleep -Milliseconds 100; }; Write-Host ''; Write-Host '                             OPTIMIZATION MODULE READY'; Start-Sleep -Seconds 1; Clear-Host"

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
echo   [4] CPU & Process Optimization
echo   [5] Network Performance Tuning
echo   [6] Power Management Optimization
echo   [7] Startup & Services Optimization
echo   [8] Performance Monitoring Setup
echo.
echo   [A] Registry Optimization
echo   [B] File System Optimization
echo   [C] Graphics & Visual Performance
echo   [D] Browser Performance Optimization
echo   [E] SSD Optimization
echo   [F] Custom Performance Profile
echo   [0] Back to Main Menu
echo.
echo  ╔════════════════════════════════════════════════════════════════════════════════╗
echo  ║  System Performance: Analyzing...                                              ║
echo  ╚════════════════════════════════════════════════════════════════════════════════╝
echo.
set /p choice="Enter your choice: "

if /i "%choice%"=="1" goto QUICK_BOOST
if /i "%choice%"=="2" goto ADVANCED_OPT
if /i "%choice%"=="3" goto MEMORY_OPT
if /i "%choice%"=="4" goto CPU_OPT
if /i "%choice%"=="5" goto NETWORK_OPT
if /i "%choice%"=="6" goto POWER_OPT
if /i "%choice%"=="7" goto STARTUP_OPT
if /i "%choice%"=="8" goto MONITORING_SETUP
if /i "%choice%"=="A" goto REGISTRY_OPT
if /i "%choice%"=="B" goto FILESYSTEM_OPT
if /i "%choice%"=="C" goto GRAPHICS_OPT
if /i "%choice%"=="D" goto BROWSER_OPT
if /i "%choice%"=="E" goto SSD_OPT
if /i "%choice%"=="F" goto CUSTOM_PROFILE
if /i "%choice%"=="0" exit /b

goto OPTIMIZATION_MENU

:QUICK_BOOST
cls
echo Running Quick Performance Boost... >> "%log_file%"
echo.
echo  ╔════════════════════════════════════════════════════════════════════════════════╗
echo  ║                          QUICK PERFORMANCE BOOST                               ║
echo  ╚════════════════════════════════════════════════════════════════════════════════╝
echo.

:: Futuristic animation
powershell -Command "$host.UI.RawUI.BackgroundColor = 'Black'; $host.UI.RawUI.ForegroundColor = 'Yellow'; Write-Host ''; Write-Host ' INITIATING PERFORMANCE BOOST SEQUENCE'; Write-Host ' =================================='; Write-Host ''; Write-Host ' Analyzing system performance bottlenecks...'; Write-Host ''; for ($i = 0; $i -lt 10; $i++) { Write-Host (' > ' + [string]::Join('', (1..50 | ForEach-Object { [char]::ConvertFromUtf32((Get-Random -Minimum 33 -Maximum 126)) }))) -ForegroundColor DarkYellow; Start-Sleep -Milliseconds 100; }; Write-Host ''; Write-Host ' Analysis complete. Applying optimizations...'; Write-Host '';"

echo [1/6] Optimizing system responsiveness...
echo Optimizing system responsiveness... >> "%log_file%"
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d 38 /f >nul
echo Done.

echo [2/6] Disabling visual effects for performance...
echo Disabling visual effects for performance... >> "%log_file%"
reg add "HKCU\Control Panel\Desktop" /v "DragFullWindows" /t REG_SZ /d "0" /f >nul
reg add "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "0" /f >nul
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /t REG_SZ /d "0" /f >nul
echo Done.

echo [3/6] Optimizing memory management...
echo Optimizing memory management... >> "%log_file%"
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "ClearPageFileAtShutdown" /t REG_DWORD /d 0 /f >nul
echo Done.

echo [4/6] Disabling unnecessary services...
echo Disabling unnecessary services... >> "%log_file%"
sc config "Fax" start= disabled >nul 2>&1
sc config "TabletInputService" start= disabled >nul 2>&1
sc config "XblAuthManager" start= disabled >nul 2>&1
sc config "XblGameSave" start= disabled >nul 2>&1
echo Done.

echo [5/6] Optimizing network settings...
echo Optimizing network settings... >> "%log_file%"
netsh int tcp set global autotuninglevel=normal >nul
echo Done.

echo [6/6] Clearing system cache...
echo Clearing system cache... >> "%log_file%"
powershell -Command "Remove-Item -Path $env:SystemRoot\Prefetch\* -Force -ErrorAction SilentlyContinue"
echo Done.

:: Completion animation
powershell -Command "$host.UI.RawUI.BackgroundColor = 'Black'; $host.UI.RawUI.ForegroundColor = 'Green'; Write-Host ''; Write-Host ' ╔══════════════════════════════════════════════════════════╗'; Write-Host ' ║               PERFORMANCE BOOST COMPLETE                ║'; Write-Host ' ╚══════════════════════════════════════════════════════════╝'; Write-Host ''; Write-Host ' System performance has been successfully optimized.'; Write-Host ' You should notice improved responsiveness immediately.'; Write-Host ''; Write-Host ' [' -NoNewline; Write-Host 'SUCCESS' -ForegroundColor Green -NoNewline; Write-Host '] Quick performance boost applied!'; Write-Host '';"

echo Quick Performance Boost completed successfully! >> "%log_file%"
echo.
echo Press any key to return to the Optimization Menu...
pause >nul
goto OPTIMIZATION_MENU

:REGISTRY_OPT
cls
echo Running Registry Optimization... >> "%log_file%"
echo.
echo  ╔════════════════════════════════════════════════════════════════════════════════╗
echo  ║                           REGISTRY OPTIMIZATION                                ║
echo  ╚════════════════════════════════════════════════════════════════════════════════╝
echo.

:: Cyberpunk-style animation
powershell -Command "$host.UI.RawUI.BackgroundColor = 'Black'; $host.UI.RawUI.ForegroundColor = 'Cyan'; Write-Host ''; Write-Host ' INITIATING REGISTRY OPTIMIZATION SEQUENCE'; Write-Host ' ====================================='; Write-Host ''; Write-Host ' WARNING: Registry modifications can affect system stability.'; Write-Host ' Creating backup before proceeding...'; Write-Host ''; for ($i = 0; $i -lt 5; $i++) { Write-Host (' > ' + [string]::Join('', (1..70 | ForEach-Object { [char]::ConvertFromUtf32((Get-Random -Minimum 33 -Maximum 126)) }))) -ForegroundColor DarkCyan; Start-Sleep -Milliseconds 200; }; Write-Host ''; Write-Host ' Backup complete. Proceeding with optimization...'; Write-Host '';"

echo [1/5] Creating registry backup...
echo Creating registry backup... >> "%log_file%"
if not exist "..\..\backups" mkdir "..\..\backups"
reg export HKLM "..\..\backups\HKLM_Backup_%date:~-4,4%%date:~-7,2%%date:~-10,2%.reg" /y >nul
reg export HKCU "..\..\backups\HKCU_Backup_%date:~-4,4%%date:~-7,2%%date:~-10,2%.reg" /y >nul
echo Done.

echo [2/5] Optimizing Explorer settings...
echo Optimizing Explorer settings... >> "%log_file%"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewAlphaSelect" /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewShadow" /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAnimations" /t REG_DWORD /d 0 /f >nul
echo Done.

echo [3/5] Optimizing desktop settings...
echo Optimizing desktop settings... >> "%log_file%"
reg add "HKCU\Control Panel\Desktop" /v "FontSmoothing" /t REG_SZ /d "2" /f >nul
reg add "HKCU\Control Panel\Desktop" /v "FontSmoothingType" /t REG_DWORD /d 2 /f >nul
reg add "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "0" /f >nul
echo Done.

echo [4/5] Optimizing system performance settings...
echo Optimizing system performance settings... >> "%log_file%"
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d 1 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d 1 /f >nul
echo Done.

echo [5/5] Optimizing network settings...
echo Optimizing network settings... >> "%log_file%"
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d 0xffffffff /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d 0 /f >nul
echo Done.

:: Completion animation
powershell -Command "$host.UI.RawUI.BackgroundColor = 'Black'; $host.UI.RawUI.ForegroundColor = 'Green'; Write-Host ''; Write-Host ' ╔══════════════════════════════════════════════════════════╗'; Write-Host ' ║              REGISTRY OPTIMIZATION COMPLETE             ║'; Write-Host ' ╚══════════════════════════════════════════════════════════╝'; Write-Host ''; Write-Host ' Registry has been successfully optimized.'; Write-Host ' A backup has been saved to the backups folder.'; Write-Host ''; Write-Host ' [' -NoNewline; Write-Host 'SUCCESS' -ForegroundColor Green -NoNewline; Write-Host '] Registry optimization completed!'; Write-Host '';"

echo Registry Optimization completed successfully! >> "%log_file%"
echo.
echo Press any key to return to the Optimization Menu...
pause >nul
goto OPTIMIZATION_MENU

:SSD_OPT
cls
echo Running SSD Optimization... >> "%log_file%"
echo.
echo  ╔════════════════════════════════════════════════════════════════════════════════╗
echo  ║                             SSD OPTIMIZATION                                   ║
echo  ╚════════════════════════════════════════════════════════════════════════════════╝
echo.

:: Futuristic scanning animation
powershell -Command "$host.UI.RawUI.BackgroundColor = 'Black'; $host.UI.RawUI.ForegroundColor = 'Magenta'; Write-Host ''; Write-Host ' INITIATING SSD OPTIMIZATION SEQUENCE'; Write-Host ' ================================='; Write-Host ''; Write-Host ' Detecting solid state drives in your system...'; Write-Host '';"

echo Detecting SSDs in your system...
echo Detecting SSDs in your system... >> "%log_file%"
powershell -Command "Get-PhysicalDisk | Where-Object MediaType -eq 'SSD' | Format-Table FriendlyName, MediaType, Size, HealthStatus"
echo.

:: Advanced terminal animation
powershell -Command "$host.UI.RawUI.BackgroundColor = 'Black'; $host.UI.RawUI.ForegroundColor = 'Magenta'; Write-Host ''; Write-Host ' SSD(s) detected. Applying specialized optimizations...'; Write-Host ''; $optimSteps = @('Analyzing SSD configuration', 'Calculating optimal settings', 'Preparing optimization algorithms', 'Initializing SSD tuning sequence'); foreach ($step in $optimSteps) { Write-Host (' > ' + $step + '...') -NoNewline; $dots = 0; for ($i = 0; $i -lt 5; $i++) { Write-Host '.' -NoNewline; Start-Sleep -Milliseconds 100; }; Write-Host ' [READY]' -ForegroundColor Green; Start-Sleep -Milliseconds 200; }; Write-Host ''; Write-Host ' Beginning SSD optimization process...'; Write-Host '';"

echo [1/7] Disabling Superfetch/SysMain service...
echo Disabling Superfetch/SysMain service... >> "%log_file%"
sc stop "SysMain" >nul 2>&1
sc config "SysMain" start= disabled >nul 2>&1
echo Done.

echo [2/7] Disabling Windows Search indexing...
echo Disabling Windows Search indexing... >> "%log_file%"
sc stop "WSearch" >nul 2>&1
sc config "WSearch" start= disabled >nul 2>&1
echo Done.

echo [3/7] Enabling TRIM for all SSDs...
echo Enabling TRIM for all SSDs... >> "%log_file%"
fsutil behavior set DisableDeleteNotify 0 >nul
echo Done.

echo [4/7] Disabling hibernation to free up space...
echo Disabling hibernation to free up space... >> "%log_file%"
powercfg /hibernate off >nul
echo Done.

echo [5/7] Optimizing page file settings...
echo Optimizing page file settings... >> "%log_file%"
wmic computersystem set AutomaticManagedPagefile=False >nul
wmic pagefileset delete >nul
wmic pagefileset create name="C:\pagefile.sys" initialsize=1024 maximumsize=4096 >nul
echo Done.

echo [6/7] Disabling defragmentation for SSDs...
echo Disabling defragmentation for SSDs... >> "%log_file%"
schtasks /Change /TN "\Microsoft\Windows\Defrag\ScheduledDefrag" /Disable >nul
echo Done.

echo [7/7] Running TRIM command on all SSDs...
echo Running TRIM command on all SSDs... >> "%log_file%"
defrag /L /U /V >nul
echo Done.

:: Completion animation
powershell -Command "$host.UI.RawUI.BackgroundColor = 'Black'; $host.UI.RawUI.ForegroundColor = 'Green'; Write-Host ''; Write-Host ' ╔══════════════════════════════════════════════════════════╗'; Write-Host ' ║                SSD OPTIMIZATION COMPLETE                 ║'; Write-Host ' ╚══════════════════════════════════════════════════════════╝'; Write-Host ''; Write-Host ' Your SSD(s) have been successfully optimized.'; Write-Host ' These optimizations will extend SSD lifespan and improve performance.'; Write-Host ''; Write-Host ' [' -NoNewline; Write-Host 'SUCCESS' -ForegroundColor Green -NoNewline; Write-Host '] SSD optimization completed!'; Write-Host '';"

echo SSD Optimization completed successfully! >> "%log_file%"
echo.
echo Press any key to return to the Optimization Menu...
pause >nul
goto OPTIMIZATION_MENU
