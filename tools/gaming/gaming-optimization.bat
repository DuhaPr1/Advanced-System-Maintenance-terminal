@echo off
title Gaming Performance Optimization - By Abdelhakim Baalla
color 09
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
set "log_file=..\..\logs\gaming_optimization_log_%date:~-4,4%%date:~-7,2%%date:~-10,2%_%time:~0,2%%time:~3,2%%time:~6,2%.txt"
set "log_file=%log_file: =0%"
echo Gaming Performance Optimization - Log started at %date% %time% > "%log_file%"
echo Created by Abdelhakim Baalla >> "%log_file%"
echo. >> "%log_file%"

:GAMING_MENU
cls
echo.
echo   ██████╗  █████╗ ███╗   ███╗██╗███╗   ██╗ ██████╗     ██████╗  ██████╗  ██████╗ ███████╗████████╗
echo  ██╔════╝ ██╔══██╗████╗ ████║██║████╗  ██║██╔════╝     ██╔══██╗██╔═══██╗██╔═══██╗██╔════╝╚══██╔══╝
echo  ██║  ███╗███████║██╔████╔██║██║██╔██╗ ██║██║  ███╗    ██████╔╝██║   ██║██║   ██║███████╗   ██║   
echo  ██║   ██║██╔══██║██║╚██╔╝██║██║██║╚██╗██║██║   ██║    ██╔══██╗██║   ██║██║   ██║╚════██║   ██║   
echo  ╚██████╔╝██║  ██║██║ ╚═╝ ██║██║██║ ╚████║╚██████╔╝    ██████╔╝╚██████╔╝╚██████╔╝███████║   ██║   
echo   ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝     ╚═════╝  ╚═════╝  ╚═════╝ ╚══════╝   ╚═╝   
echo.
echo                             Created by Abdelhakim Baalla
echo                          https://abdelhakim-baalla.vercel.app/
echo.
echo  ╔════════════════════════════════════════════════════════════════════════════════╗
echo  ║                         GAMING PERFORMANCE TOOLS                               ║
echo  ╚════════════════════════════════════════════════════════════════════════════════╝
echo.
echo   [1] Quick Gaming Boost
echo   [2] Ultimate Gaming Mode
echo   [3] FPS Optimization
echo   [4] Input Lag Reduction
echo   [5] GPU Optimization
echo   [6] Game-Specific Optimizations
echo   [7] Gaming Performance Monitor
echo   [8] Restore Default Settings
echo   [0] Back to Main Menu
echo.
set /p choice="Enter your choice: "

if "%choice%"=="1" goto QUICK_GAMING
if "%choice%"=="2" goto ULTIMATE_GAMING
if "%choice%"=="3" goto FPS_OPT
if "%choice%"=="4" goto INPUT_LAG
if "%choice%"=="5" goto GPU_OPT
if "%choice%"=="6" goto GAME_SPECIFIC
if "%choice%"=="7" goto GAMING_MONITOR
if "%choice%"=="8" goto RESTORE_GAMING
if "%choice%"=="0" exit /b

goto GAMING_MENU

:QUICK_GAMING
cls
echo Quick Gaming Boost started at %time% >> "%log_file%"
echo.
echo  ╔════════════════════════════════════════════════════════════════════════════════╗
echo  ║                          QUICK GAMING BOOST                                    ║
echo  ╚════════════════════════════════════════════════════════════════════════════════╝
echo.
echo Applying Quick Gaming Boost...
echo.

echo [1/5] Setting high performance power plan...
powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c >nul
echo Done.

echo [2/5] Disabling Game Bar and DVR...
reg add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v "AllowGameDVR" /t REG_DWORD /d 0 /f >nul 2>&1
echo Done.

echo [3/5] Optimizing CPU priority for games...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d 6 /f >nul
echo Done.

echo [4/5] Optimizing network for gaming...
netsh int tcp set global autotuninglevel=restricted >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpAckFrequency" /t REG_DWORD /d 1 /f >nul
echo Done.

echo [5/5] Disabling fullscreen optimizations...
reg add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehaviorMode" /t REG_DWORD /d 2 /f >nul 2>&1
echo Done.

echo.
echo ✅ Quick gaming boost applied successfully!
echo Quick Gaming Boost completed at %time% >> "%log_file%"
echo.
pause
goto GAMING_MENU

:FPS_OPT
cls
echo FPS Optimization started at %time% >> "%log_file%"
echo.
echo  ╔════════════════════════════════════════════════════════════════════════════════╗
echo  ║                             FPS OPTIMIZATION                                   ║
echo  ╚════════════════════════════════════════════════════════════════════════════════╝
echo.

echo [1/8] Optimizing Windows for maximum performance...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /t REG_DWORD /d 2 /f >nul
echo Done.

echo [2/8] Setting processor scheduling for programs...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d 38 /f >nul
echo Done.

echo [3/8] Optimizing GPU settings...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d 0 /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d 8 /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d 6 /f >nul
echo Done.

echo [4/8] Disabling background apps...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisabled" /t REG_DWORD /d 1 /f >nul
echo Done.

echo [5/8] Optimizing memory usage...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d 1 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d 1 /f >nul
echo Done.

echo [6/8] Disabling Windows animations...
reg add "HKCU\Control Panel\Desktop" /v "DragFullWindows" /t REG_SZ /d "0" /f >nul
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /t REG_SZ /d "0" /f >nul
echo Done.

echo [7/8] Optimizing mouse settings for gaming...
reg add "HKCU\Control Panel\Mouse" /v "MouseSpeed" /t REG_SZ /d "0" /f >nul
reg add "HKCU\Control Panel\Mouse" /v "MouseThreshold1" /t REG_SZ /d "0" /f >nul
reg add "HKCU\Control Panel\Mouse" /v "MouseThreshold2" /t REG_SZ /d "0" /f >nul
echo Done.

echo [8/8] Disabling fullscreen optimizations for all games...
powershell -Command "Get-ChildItem -Path 'C:\Program Files\' -Include '*.exe' -Recurse -ErrorAction SilentlyContinue | Where-Object { $_.Name -like '*game*' -or $_.Name -like '*steam*' -or $_.Name -like '*epic*' } | ForEach-Object { New-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers' -Name $_.FullName -Value '~ DISABLEDXMAXIMIZEDWINDOWEDMODE' -PropertyType String -Force -ErrorAction SilentlyContinue }"
echo Done.

echo.
echo ✅ FPS optimization completed! You should see improved frame rates in games.
echo FPS Optimization completed at %time% >> "%log_file%"
echo.
pause
goto GAMING_MENU

:GAMING_MONITOR
cls
echo Gaming Performance Monitor started at %time% >> "%log_file%"
echo.
echo  ╔════════════════════════════════════════════════════════════════════════════════╗
echo  ║                        GAMING PERFORMANCE MONITOR                              ║
echo  ╚════════════════════════════════════════════════════════════════════════════════╝
echo.
echo Press CTRL+C to exit monitoring
echo.

:MONITOR_LOOP
cls
echo.
echo  ╔════════════════════════════════════════════════════════════════════════════════╗
echo  ║                        GAMING PERFORMANCE MONITOR                              ║
echo  ║                           Real-time System Stats                               ║
echo  ╚════════════════════════════════════════════════════════════════════════════════╝
echo.
echo Current Time: %date% %time%
echo.

echo CPU Usage:
powershell -Command "Get-Counter '\Processor(_Total)\% Processor Time' | Select-Object -ExpandProperty CounterSamples | Select-Object CookedValue | ForEach-Object { Write-Host ('CPU: ' + [math]::Round($_.CookedValue, 2) + '%') }"

echo.
echo Memory Usage:
powershell -Command "$mem = Get-WmiObject -Class Win32_OperatingSystem; $totalMem = [math]::Round($mem.TotalVisibleMemorySize / 1MB, 2); $freeMem = [math]::Round($mem.FreePhysicalMemory / 1MB, 2); $usedMem = $totalMem - $freeMem; $usedPercent = [math]::Round(($usedMem / $totalMem) * 100, 2); Write-Host ('Memory: ' + $usedMem + 'GB / ' + $totalMem + 'GB (' + $usedPercent + '%)')"

echo.
echo Gaming Processes:
powershell -Command "Get-Process | Where-Object { $_.ProcessName -like '*game*' -or $_.ProcessName -like '*steam*' -or $_.ProcessName -like '*epic*' -or $_.ProcessName -like '*origin*' -or $_.ProcessName -like '*uplay*' } | Select-Object ProcessName, @{Name='CPU%';Expression={$_.CPU}}, @{Name='Memory(MB)';Expression={[math]::Round($_.WorkingSet/1MB,2)}} | Format-Table -AutoSize"

echo.
echo Network Latency:
ping google.com -n 1 | findstr "time="

echo.
echo ════════════════════════════════════════════════════════════════════════════════
echo Press CTRL+C to exit or any key to refresh...
echo ════════════════════════════════════════════════════════════════════════════════

timeout /t 5 /nobreak >nul
goto MONITOR_LOOP
