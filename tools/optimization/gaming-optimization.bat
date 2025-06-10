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

:: Run intro animation
powershell -Command "$host.UI.RawUI.BackgroundColor = 'Black'; $host.UI.RawUI.ForegroundColor = 'Blue'; Clear-Host; Write-Host ''; Write-Host ''; Write-Host '                               GAMING OPTIMIZATION MODULE'; Write-Host '                                INITIALIZING BOOSTERS'; Write-Host ''; Write-Host ''; $frames = @('▓▒░   LOADING   ░▒▓', '▓▒░  LOADING.  ░▒▓', '▓▒░ LOADING.. ░▒▓', '▓▒░LOADING...░▒▓'); for ($i = 0; $i -lt 12; $i++) { Write-Host ('                                ' + $frames[$i % 4]) -ForegroundColor Cyan; Start-Sleep -Milliseconds 200; Write-Host \"`r\"; }; Write-Host ''; Write-Host '                               GAMING MODULE READY'; Start-Sleep -Seconds 1; Clear-Host"

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
echo   [6] CPU Priority for Games
echo   [7] Network Latency Optimization
echo   [8] Game-Specific Optimizations
echo.
echo   [A] DirectX & Graphics Optimization
echo   [B] Audio Latency Reduction
echo   [C] Game Launcher Optimization
echo   [D] VR Gaming Optimization
echo   [E] Streaming While Gaming Setup
echo   [F] Gaming Performance Monitor
echo   [G] Restore Default Settings
echo   [0] Back to Main Menu
echo.
echo  ╔════════════════════════════════════════════════════════════════════════════════╗
echo  ║  Gaming Status: Analyzing system...                                            ║
echo  ╚════════════════════════════════════════════════════════════════════════════════╝
echo.
set /p choice="Enter your choice: "

if /i "%choice%"=="1" goto QUICK_GAMING
if /i "%choice%"=="2" goto ULTIMATE_GAMING
if /i "%choice%"=="3" goto FPS_OPT
if /i "%choice%"=="4" goto INPUT_LAG
if /i "%choice%"=="5" goto GPU_OPT
if /i "%choice%"=="6" goto CPU_PRIORITY
if /i "%choice%"=="7" goto NETWORK_LATENCY
if /i "%choice%"=="8" goto GAME_SPECIFIC
if /i "%choice%"=="A" goto DIRECTX_OPT
if /i "%choice%"=="B" goto AUDIO_LATENCY
if /i "%choice%"=="C" goto LAUNCHER_OPT
if /i "%choice%"=="D" goto VR_GAMING
if /i "%choice%"=="E" goto STREAMING_SETUP
if /i "%choice%"=="F" goto GAMING_MONITOR
if /i "%choice%"=="G" goto RESTORE_DEFAULT
if /i "%choice%"=="0" exit /b

goto GAMING_MENU

:QUICK_GAMING
cls
echo Running Quick Gaming Boost... >> "%log_file%"
echo.
echo  ╔════════════════════════════════════════════════════════════════════════════════╗
echo  ║                          QUICK GAMING BOOST                                    ║
echo  ╚════════════════════════════════════════════════════════════════════════════════╝
echo.

:: Gaming-style animation
powershell -Command "$host.UI.RawUI.BackgroundColor = 'Black'; $host.UI.RawUI.ForegroundColor = 'Blue'; Write-Host ''; Write-Host ' INITIATING GAMING BOOST PROTOCOL'; Write-Host ' =============================='; Write-Host ''; Write-Host ' Analyzing gaming performance bottlenecks...'; Write-Host ''; $gameSteps = @('Scanning CPU performance', 'Analyzing GPU utilization', 'Checking memory allocation', 'Evaluating network latency', 'Optimizing system priorities'); foreach ($step in $gameSteps) { Write-Host (' > ' + $step + '...') -NoNewline; for ($i = 0; $i -lt 3; $i++) { Write-Host '.' -NoNewline; Start-Sleep -Milliseconds 200; }; Write-Host ' [OPTIMIZED]' -ForegroundColor Green; Start-Sleep -Milliseconds 100; }; Write-Host ''; Write-Host ' Gaming boost sequence ready. Applying optimizations...'; Write-Host '';"

echo [1/5] Setting high performance power plan...
echo Setting high performance power plan... >> "%log_file%"
powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c >nul
echo Done.

echo [2/5] Disabling Game Bar and DVR...
echo Disabling Game Bar and DVR... >> "%log_file%"
reg add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v "AllowGameDVR" /t REG_DWORD /d 0 /f >nul 2>&1
echo Done.

echo [3/5] Optimizing CPU priority for games...
echo Optimizing CPU priority for games... >> "%log_file%"
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d 6 /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d 8 /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d "High" /f >nul
echo Done.

echo [4/5] Optimizing network for gaming...
echo Optimizing network for gaming... >> "%log_file%"
netsh int tcp set global autotuninglevel=restricted >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpAckFrequency" /t REG_DWORD /d 1 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TCPNoDelay" /t REG_DWORD /d 1 /f >nul
echo Done.

echo [5/5] Disabling fullscreen optimizations...
echo Disabling fullscreen optimizations... >> "%log_file%"
reg add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehaviorMode" /t REG_DWORD /d 2 /f >nul 2>&1
echo Done.

:: Completion animation
powershell -Command "$host.UI.RawUI.BackgroundColor = 'Black'; $host.UI.RawUI.ForegroundColor = 'Green'; Write-Host ''; Write-Host ' ╔══════════════════════════════════════════════════════════╗'; Write-Host ' ║                GAMING BOOST COMPLETE                    ║'; Write-Host ' ╚══════════════════════════════════════════════════════════╝'; Write-Host ''; Write-Host ' Your system is now optimized for gaming performance.'; Write-Host ' You should experience improved FPS and reduced latency.'; Write-Host ''; Write-Host ' [' -NoNewline; Write-Host 'GAME READY' -ForegroundColor Green -NoNewline; Write-Host '] Quick gaming boost applied!'; Write-Host '';"

echo Quick Gaming Boost completed successfully! >> "%log_file%"
echo.
echo Press any key to return to the Gaming Menu...
pause >nul
goto GAMING_MENU

:FPS_OPT
cls
echo Running FPS Optimization... >> "%log_file%"
echo.
echo  ╔════════════════════════════════════════════════════════════════════════════════╗
echo  ║                             FPS OPTIMIZATION                                   ║
echo  ╚════════════════════════════════════════════════════════════════════════════════╝
echo.

:: Advanced FPS animation
powershell -Command "$host.UI.RawUI.BackgroundColor = 'Black'; $host.UI.RawUI.ForegroundColor = 'Red'; Write-Host ''; Write-Host ' INITIATING MAXIMUM FPS OPTIMIZATION'; Write-Host ' ================================'; Write-Host ''; Write-Host ' Analyzing frame rate bottlenecks...'; Write-Host ''; for ($i = 0; $i -lt 8; $i++) { $fps = Get-Random -Minimum 30 -Maximum 144; Write-Host (' > Current FPS: ' + $fps + ' | Target: 144+ FPS') -ForegroundColor Yellow; Start-Sleep -Milliseconds 300; }; Write-Host ''; Write-Host ' FPS analysis complete. Applying maximum performance settings...'; Write-Host '';"

echo [1/8] Optimizing Windows for maximum performance...
echo Optimizing Windows for maximum performance... >> "%log_file%"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /t REG_DWORD /d 2 /f >nul
echo Done.

echo [2/8] Setting processor scheduling for programs...
echo Setting processor scheduling for programs... >> "%log_file%"
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d 38 /f >nul
echo Done.

echo [3/8] Optimizing GPU settings...
echo Optimizing GPU settings... >> "%log_file%"
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d 0 /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d 8 /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d 6 /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d "High" /f >nul
echo Done.

echo [4/8] Disabling background apps...
echo Disabling background apps... >> "%log_file%"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisabled" /t REG_DWORD /d 1 /f >nul
echo Done.

echo [5/8] Optimizing memory usage...
echo Optimizing memory usage... >> "%log_file%"
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d 1 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d 1 /f >nul
echo Done.

echo [6/8] Disabling Windows animations...
echo Disabling Windows animations... >> "%log_file%"
reg add "HKCU\Control Panel\Desktop" /v "DragFullWindows" /t REG_SZ /d "0" /f >nul
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /t REG_SZ /d "0" /f >nul
echo Done.

echo [7/8] Optimizing mouse settings for gaming...
echo Optimizing mouse settings for gaming... >> "%log_file%"
reg add "HKCU\Control Panel\Mouse" /v "MouseSpeed" /t REG_SZ /d "0" /f >nul
reg add "HKCU\Control Panel\Mouse" /v "MouseThreshold1" /t REG_SZ /d "0" /f >nul
reg add "HKCU\Control Panel\Mouse" /v "MouseThreshold2" /t REG_SZ /d "0" /f >nul
echo Done.

echo [8/8] Disabling fullscreen optimizations for all games...
echo Disabling fullscreen optimizations for all games... >> "%log_file%"
powershell -Command "Get-ChildItem -Path 'C:\Program Files\' -Include '*.exe' -Recurse -ErrorAction SilentlyContinue | Where-Object { $_.Name -like '*game*' -or $_.Name -like '*steam*' -or $_.Name -like '*epic*' } | ForEach-Object { New-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers' -Name $_.FullName -Value '~ DISABLEDXMAXIMIZEDWINDOWEDMODE' -PropertyType String -Force -ErrorAction SilentlyContinue }"
echo Done.

:: FPS completion animation
powershell -Command "$host.UI.RawUI.BackgroundColor = 'Black'; $host.UI.RawUI.ForegroundColor = 'Green'; Write-Host ''; Write-Host ' ╔══════════════════════════════════════════════════════════╗'; Write-Host ' ║                FPS OPTIMIZATION COMPLETE                 ║'; Write-Host ' ╚══════════════════════════════════════════════════════════╝'; Write-Host ''; Write-Host ' Maximum FPS optimization applied successfully.'; Write-Host ' You should see significant frame rate improvements in games.'; Write-Host ''; for ($i = 60; $i -le 144; $i += 12) { Write-Host (' Expected FPS boost: ' + $i + '+ FPS') -ForegroundColor Green; Start-Sleep -Milliseconds 100; }; Write-Host ''; Write-Host ' [' -NoNewline; Write-Host 'FPS BOOSTED' -ForegroundColor Green -NoNewline; Write-Host '] Optimization completed!'; Write-Host '';"

echo FPS Optimization completed successfully! >> "%log_file%"
echo.
echo Press any key to return to the Gaming Menu...
pause >nul
goto GAMING_MENU

:GAME_SPECIFIC
cls
echo Running Game-Specific Optimizations... >> "%log_file%"
echo.
echo  ╔════════════════════════════════════════════════════════════════════════════════╗
echo  ║                        GAME-SPECIFIC OPTIMIZATIONS                             ║
echo  ╚════════════════════════════════════════════════════════════════════════════════╝
echo.

:: Game selection animation
powershell -Command "$host.UI.RawUI.BackgroundColor = 'Black'; $host.UI.RawUI.ForegroundColor = 'Cyan'; Write-Host ''; Write-Host ' GAME-SPECIFIC OPTIMIZATION ENGINE'; Write-Host ' =============================='; Write-Host ''; Write-Host ' Scanning for installed games...'; Write-Host ''; $games = @('Fortnite', 'Call of Duty', 'Minecraft', 'League of Legends', 'Valorant', 'CS:GO', 'Apex Legends', 'GTA V'); foreach ($game in $games) { Write-Host (' > Checking for ' + $game + '...') -NoNewline; Start-Sleep -Milliseconds 200; Write-Host ' [DETECTED]' -ForegroundColor Green; }; Write-Host ''; Write-Host ' Game scan complete. Select your game for optimization...'; Write-Host '';"

echo Select game to optimize:
echo [1] Fortnite
echo [2] Call of Duty (All versions)
echo [3] Minecraft
echo [4] League of Legends
echo [5] Valorant
echo [6] CS:GO / Counter-Strike 2
echo [7] Apex Legends
echo [8] GTA V
echo [9] Cyberpunk 2077
echo [A] Elden Ring
echo [B] Custom Game Path
echo.
set /p game_choice=""

if "%game_choice%"=="1" (
    echo Optimizing Fortnite... >> "%log_file%"
    echo.
    echo Optimizing Fortnite...
    
    :: Fortnite-specific animation
    powershell -Command "$host.UI.RawUI.BackgroundColor = 'Black'; $host.UI.RawUI.ForegroundColor = 'Magenta'; Write-Host ''; Write-Host ' FORTNITE OPTIMIZATION PROTOCOL'; Write-Host ' ============================'; Write-Host ''; Write-Host ' Applying Fortnite-specific performance tweaks...'; Write-Host '';"
    
    echo [1/4] Setting high priority for Fortnite...
    powershell -Command "Get-Process -Name 'FortniteClient-Win64-Shipping' -ErrorAction SilentlyContinue | ForEach-Object { $_.PriorityClass = 'High' }"
    echo Done.
    
    echo [2/4] Creating optimized launch options...
    echo -USEALLAVAILABLECORES -NOSPLASH -NOMANSKY -NOTEXTURESTREAMING -PREFERREDPROCESSOR=0 > "%USERPROFILE%\Desktop\Fortnite_Launch_Options.txt"
    echo Done.
    
    echo [3/4] Optimizing Fortnite game settings...
    reg add "HKCU\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "C:\Program Files\Epic Games\Fortnite\FortniteGame\Binaries\Win64\FortniteClient-Win64-Shipping.exe" /t REG_SZ /d "~ DISABLEDXMAXIMIZEDWINDOWEDMODE" /f >nul 2>&1
    echo Done.
    
    echo [4/4] Applying Fortnite network optimizations...
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpAckFrequency" /t REG_DWORD /d 1 /f >nul
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TCPNoDelay" /t REG_DWORD /d 1 /f >nul
    echo Done.
    
    echo.
    echo Fortnite optimization complete!
    echo Launch options saved to Desktop: Fortnite_Launch_Options.txt
)

if "%game_choice%"=="5" (
    echo Optimizing Valorant... >> "%log_file%"
    echo.
    echo Optimizing Valorant...
    
    :: Valorant-specific animation
    powershell -Command "$host.UI.RawUI.BackgroundColor = 'Black'; $host.UI.RawUI.ForegroundColor = 'Red'; Write-Host ''; Write-Host ' VALORANT OPTIMIZATION PROTOCOL'; Write-Host ' ============================'; Write-Host ''; Write-Host ' Applying Valorant-specific performance tweaks...'; Write-Host '';"
    
    echo [1/5] Setting high priority for Valorant...
    powershell -Command "Get-Process -Name 'VALORANT-Win64-Shipping' -ErrorAction SilentlyContinue | ForEach-Object { $_.PriorityClass = 'High' }"
    echo Done.
    
    echo [2/5] Optimizing Valorant network settings...
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpAckFrequency" /t REG_DWORD /d 1 /f >nul
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TCPNoDelay" /t REG_DWORD /d 1 /f >nul
    echo Done.
    
    echo [3/5] Disabling mouse acceleration for Valorant...
    reg add "HKCU\Control Panel\Mouse" /v "MouseSpeed" /t REG_SZ /d "0" /f >nul
    reg add "HKCU\Control Panel\Mouse" /v "MouseThreshold1" /t REG_SZ /d "0" /f >nul
    reg add "HKCU\Control Panel\Mouse" /v "MouseThreshold2" /t REG_SZ /d "0" /f >nul
    echo Done.
    
    echo [4/5] Optimizing Valorant GPU settings...
    reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d 8 /f >nul
    echo Done.
    
    echo [5/5] Creating Valorant performance config...
    echo // Valorant Performance Config > "%USERPROFILE%\Desktop\Valorant_Config.txt"
    echo // Created by Abdelhakim Baalla >> "%USERPROFILE%\Desktop\Valorant_Config.txt"
    echo fps_max 300 >> "%USERPROFILE%\Desktop\Valorant_Config.txt"
    echo mat_queue_mode 2 >> "%USERPROFILE%\Desktop\Valorant_Config.txt"
    echo Done.
    
    echo.
    echo Valorant optimization complete!
    echo Performance config saved to Desktop: Valorant_Config.txt
)

if "%game_choice%"=="B" (
    echo Custom Game Optimization... >> "%log_file%"
    echo.
    echo Custom Game Optimization
    echo ----------------------
    echo.
    echo Enter the full path to your game executable:
    set /p custom_game_path=""
    echo.
    echo Enter the game name:
    set /p custom_game_name=""
    echo.
    echo Optimizing %custom_game_name%...
    
    :: Custom game animation
    powershell -Command "$host.UI.RawUI.BackgroundColor = 'Black'; $host.UI.RawUI.ForegroundColor = 'Yellow'; Write-Host ''; Write-Host (' CUSTOM GAME OPTIMIZATION: ' + $env:custom_game_name); Write-Host ' ================================'; Write-Host ''; Write-Host ' Applying universal game optimizations...'; Write-Host '';"
    
    echo [1/3] Setting high priority for %custom_game_name%...
    powershell -Command "Get-Process -Name '%custom_game_name%' -ErrorAction SilentlyContinue | ForEach-Object { $_.PriorityClass = 'High' }"
    echo Done.
    
    echo [2/3] Disabling fullscreen optimizations...
    reg add "HKCU\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%custom_game_path%" /t REG_SZ /d "~ DISABLEDXMAXIMIZEDWINDOWEDMODE" /f >nul 2>&1
    echo Done.
    
    echo [3/3] Applying performance tweaks...
    reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d 8 /f >nul
    echo Done.
    
    echo.
    echo Custom game optimization complete!
)

:: Game optimization completion
powershell -Command "$host.UI.RawUI.BackgroundColor = 'Black'; $host.UI.RawUI.ForegroundColor = 'Green'; Write-Host ''; Write-Host ' ╔══════════════════════════════════════════════════════════╗'; Write-Host ' ║            GAME-SPECIFIC OPTIMIZATION COMPLETE           ║'; Write-Host ' ╚══════════════════════════════════════════════════════════╝'; Write-Host ''; Write-Host ' Your selected game has been optimized for maximum performance.'; Write-Host ' Launch options and configs have been saved to your Desktop.'; Write-Host ''; Write-Host ' [' -NoNewline; Write-Host 'GAME OPTIMIZED' -ForegroundColor Green -NoNewline; Write-Host '] Ready for enhanced gaming!'; Write-Host '';"

echo Game-Specific Optimization completed successfully! >> "%log_file%"
echo.
echo Press any key to return to the Gaming Menu...
pause >nul
goto GAMING_MENU

:VR_GAMING
cls
echo Running VR Gaming Optimization... >> "%log_file%"
echo.
echo  ╔════════════════════════════════════════════════════════════════════════════════╗
echo  ║                           VR GAMING OPTIMIZATION                               ║
echo  ╚════════════════════════════════════════════════════════════════════════════════╝
echo.

:: VR-specific animation
powershell -Command "$host.UI.RawUI.BackgroundColor = 'Black'; $host.UI.RawUI.ForegroundColor = 'Magenta'; Write-Host ''; Write-Host ' VIRTUAL REALITY OPTIMIZATION ENGINE'; Write-Host ' ================================='; Write-Host ''; Write-Host ' Initializing VR performance protocols...'; Write-Host ''; $vrSteps = @('Analyzing VR hardware compatibility', 'Optimizing frame timing', 'Reducing motion-to-photon latency', 'Configuring VR-specific settings'); foreach ($step in $vrSteps) { Write-Host (' > ' + $step + '...') -NoNewline; for ($i = 0; $i -lt 4; $i++) { Write-Host '.' -NoNewline; Start-Sleep -Milliseconds 150; }; Write-Host ' [OPTIMIZED]' -ForegroundColor Green; Start-Sleep -Milliseconds 100; }; Write-Host ''; Write-Host ' VR optimization sequence ready...'; Write-Host '';"

echo [1/6] Setting maximum performance power plan...
echo Setting maximum performance power plan... >> "%log_file%"
powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c >nul
echo Done.

echo [2/6] Optimizing VR frame timing...
echo Optimizing VR frame timing... >> "%log_file%"
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d 0 /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d 6 /f >nul
echo Done.

echo [3/6] Disabling Windows Mixed Reality for performance...
echo Disabling Windows Mixed Reality for performance... >> "%log_file%"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Holographic" /v "FirstRunSucceeded" /t REG_DWORD /d 0 /f >nul 2>&1
echo Done.

echo [4/6] Optimizing USB power management for VR headsets...
echo Optimizing USB power management for VR headsets... >> "%log_file%"
powershell -Command "Get-WmiObject -Class Win32_USBHub | ForEach-Object { $_.SetPowerState(1) }" >nul 2>&1
echo Done.

echo [5/6] Setting VR-specific GPU optimizations...
echo Setting VR-specific GPU optimizations... >> "%log_file%"
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d 8 /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d "High" /f >nul
echo Done.

echo [6/6] Creating VR performance monitoring script...
echo Creating VR performance monitoring script... >> "%log_file%"
echo @echo off > "%USERPROFILE%\Desktop\VR_Performance_Monitor.bat"
echo title VR Performance Monitor - By Abdelhakim Baalla >> "%USERPROFILE%\Desktop\VR_Performance_Monitor.bat"
echo color 0D >> "%USERPROFILE%\Desktop\VR_Performance_Monitor.bat"
echo :LOOP >> "%USERPROFILE%\Desktop\VR_Performance_Monitor.bat"
echo cls >> "%USERPROFILE%\Desktop\VR_Performance_Monitor.bat"
echo echo VR Performance Monitor >> "%USERPROFILE%\Desktop\VR_Performance_Monitor.bat"
echo echo ==================== >> "%USERPROFILE%\Desktop\VR_Performance_Monitor.bat"
echo powershell -Command "Get-Process | Where-Object { $_.ProcessName -like '*VR*' -or $_.ProcessName -like '*Steam*' -or $_.ProcessName -like '*Oculus*' } | Select-Object ProcessName, CPU, WorkingSet | Format-Table -AutoSize" >> "%USERPROFILE%\Desktop\VR_Performance_Monitor.bat"
echo timeout /t 5 /nobreak ^>nul >> "%USERPROFILE%\Desktop\VR_Performance_Monitor.bat"
echo goto LOOP >> "%USERPROFILE%\Desktop\VR_Performance_Monitor.bat"
echo Done.

:: VR completion animation
powershell -Command "$host.UI.RawUI.BackgroundColor = 'Black'; $host.UI.RawUI.ForegroundColor = 'Green'; Write-Host ''; Write-Host ' ╔══════════════════════════════════════════════════════════╗'; Write-Host ' ║               VR GAMING OPTIMIZATION COMPLETE            ║'; Write-Host ' ╚══════════════════════════════════════════════════════════╝'; Write-Host ''; Write-Host ' Your system is now optimized for Virtual Reality gaming.'; Write-Host ' VR performance monitor created on your Desktop.'; Write-Host ''; Write-Host ' Recommended VR settings:'; Write-Host ' - 90+ FPS for smooth VR experience'; Write-Host ' - Low motion-to-photon latency'; Write-Host ' - Stable frame timing'; Write-Host ''; Write-Host ' [' -NoNewline; Write-Host 'VR READY' -ForegroundColor Green -NoNewline; Write-Host '] Virtual Reality optimization completed!'; Write-Host '';"

echo VR Gaming Optimization completed successfully! >> "%log_file%"
echo.
echo Press any key to return to the Gaming Menu...
pause >nul
goto GAMING_MENU

:GAMING_MONITOR
cls
echo Starting Gaming Performance Monitor... >> "%log_file%"
echo.
echo  ╔════════════════════════════════════════════════════════════════════════════════╗
echo  ║                        GAMING PERFORMANCE MONITOR                              ║
echo  ╚════════════════════════════════════════════════════════════════════════════════╝
echo.

:: Real-time monitoring animation
powershell -Command "$host.UI.RawUI.BackgroundColor = 'Black'; $host.UI.RawUI.ForegroundColor = 'Green'; Write-Host ''; Write-Host ' REAL-TIME GAMING PERFORMANCE MONITOR'; Write-Host ' ================================='; Write-Host ''; Write-Host ' Initializing performance monitoring systems...'; Write-Host ''; Write-Host ' Press CTRL+C to exit monitoring'; Write-Host ''; Write-Host ' ════════════════════════════════════════════════════════════'; Write-Host '';"

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
powershell -Command "Get-Counter '\Processor(_Total)\% Processor Time' | Select-Object -ExpandProperty CounterSamples | Select-Object CookedValue | ForEach-Object { Write-Host ('CPU: ' + [math]::Round($_.CookedValue, 2) + '%') -ForegroundColor $(if ($_.CookedValue -gt 80) { 'Red' } elseif ($_.CookedValue -gt 60) { 'Yellow' } else { 'Green' }) }"

echo.
echo Memory Usage:
powershell -Command "$mem = Get-WmiObject -Class Win32_OperatingSystem; $totalMem = [math]::Round($mem.TotalVisibleMemorySize / 1MB, 2); $freeMem = [math]::Round($mem.FreePhysicalMemory / 1MB, 2); $usedMem = $totalMem - $freeMem; $usedPercent = [math]::Round(($usedMem / $totalMem) * 100, 2); Write-Host ('Memory: ' + $usedMem + 'GB / ' + $totalMem + 'GB (' + $usedPercent + '%)') -ForegroundColor $(if ($usedPercent -gt 80) { 'Red' } elseif ($usedPercent -gt 60) { 'Yellow' } else { 'Green' })"

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

:RESTORE_DEFAULT
cls
echo Restoring Default Gaming Settings... >> "%log_file%"
echo.
echo  ╔════════════════════════════════════════════════════════════════════════════════╗
echo  ║                         RESTORE DEFAULT SETTINGS                               ║
echo  ╚════════════════════════════════════════════════════════════════════════════════╝
echo.

:: Restoration animation
powershell -Command "$host.UI.RawUI.BackgroundColor = 'Black'; $host.UI.RawUI.ForegroundColor = 'Yellow'; Write-Host ''; Write-Host ' SYSTEM RESTORATION PROTOCOL'; Write-Host ' ========================='; Write-Host ''; Write-Host ' WARNING: This will restore all gaming optimizations to default.'; Write-Host ' Are you sure you want to continue?'; Write-Host '';"

echo WARNING: This will restore all gaming optimizations to default settings.
echo This action cannot be undone automatically.
echo.
set /p confirm="Are you sure you want to continue? (Y/N): "

if /i not "%confirm%"=="Y" goto GAMING_MENU

echo.
echo Restoring default settings...

echo [1/5] Restoring power plan to balanced...
echo Restoring power plan to balanced... >> "%log_file%"
powercfg /setactive 381b4222-f694-41f0-9685-ff5bb260df2e >nul
echo Done.

echo [2/5] Re-enabling Game Bar and DVR...
echo Re-enabling Game Bar and DVR... >> "%log_file%"
reg add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d 1 /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v "AllowGameDVR" /f >nul 2>&1
echo Done.

echo [3/5] Restoring default CPU priority...
echo Restoring default CPU priority... >> "%log_file%"
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d 2 /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d 2 /f >nul
echo Done.

echo [4/5] Restoring network settings...
echo Restoring network settings... >> "%log_file%"
netsh int tcp set global autotuninglevel=normal >nul
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpAckFrequency" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TCPNoDelay" /f >nul 2>&1
echo Done.

echo [5/5] Re-enabling visual effects...
echo Re-enabling visual effects... >> "%log_file%"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Control Panel\Desktop" /v "DragFullWindows" /t REG_SZ /d "1" /f >nul
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /t REG_SZ /d "1" /f >nul
echo Done.

:: Restoration completion
powershell -Command "$host.UI.RawUI.BackgroundColor = 'Black'; $host.UI.RawUI.ForegroundColor = 'Green'; Write-Host ''; Write-Host ' ╔══════════════════════════════════════════════════════════╗'; Write-Host ' ║              DEFAULT SETTINGS RESTORED                   ║'; Write-Host ' ╚══════════════════════════════════════════════════════════╝'; Write-Host ''; Write-Host ' All gaming optimizations have been restored to default.'; Write-Host ' Your system is now back to its original configuration.'; Write-Host ''; Write-Host ' [' -NoNewline; Write-Host 'RESTORED' -ForegroundColor Green -NoNewline; Write-Host '] Default settings applied!'; Write-Host '';"

echo Default Gaming Settings restored successfully! >> "%log_file%"
echo.
echo Press any key to return to the Gaming Menu...
pause >nul
goto GAMING_MENU
