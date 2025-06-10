@echo off
title Gaming Performance Optimization
color 09
mode con: cols=100 lines=35
setlocal enabledelayedexpansion

call animation-utils.bat :SHOW_DEVELOPER_INFO
call animation-utils.bat :MATRIX_ANIMATION

:GAMING_MENU
cls
color 09
echo.
echo  ========================================================================
echo                        GAMING PERFORMANCE SUITE
echo                      Advanced Gaming Optimization
echo  ========================================================================
echo.
echo  ----------------------------------------------------------------
echo   [1] Quick Gaming Boost
echo   [2] Ultimate Gaming Mode
echo   [3] FPS Optimization
echo   [4] Input Lag Reduction
echo   [5] GPU Optimization
echo   [6] CPU Priority for Games
echo   [7] Network Latency Optimization
echo   [8] Game-Specific Optimizations
echo   [9] DirectX & Graphics Optimization
echo   [A] Audio Latency Reduction
echo   [B] Game Launcher Optimization
echo   [C] VR Gaming Optimization
echo   [D] Streaming While Gaming Setup
echo   [E] Gaming Performance Monitor
echo   [F] Restore Default Settings
echo   [0] Back to Main Menu
echo  ----------------------------------------------------------------
echo.
set /p choice="Select gaming optimization option: "

if /i "%choice%"=="1" goto QUICK_GAMING
if /i "%choice%"=="2" goto ULTIMATE_GAMING
if /i "%choice%"=="3" goto FPS_OPT
if /i "%choice%"=="4" goto INPUT_LAG
if /i "%choice%"=="5" goto GPU_OPT
if /i "%choice%"=="6" goto CPU_PRIORITY
if /i "%choice%"=="7" goto NETWORK_LATENCY
if /i "%choice%"=="8" goto GAME_SPECIFIC
if /i "%choice%"=="9" goto DIRECTX_OPT
if /i "%choice%"=="A" goto AUDIO_LATENCY
if /i "%choice%"=="B" goto LAUNCHER_OPT
if /i "%choice%"=="C" goto VR_GAMING
if /i "%choice%"=="D" goto STREAMING_SETUP
if /i "%choice%"=="E" goto GAMING_MONITOR
if /i "%choice%"=="F" goto RESTORE_DEFAULT
if /i "%choice%"=="0" exit /b

goto GAMING_MENU

:QUICK_GAMING
cls
call animation-utils.bat :SPINNER_ANIMATION "Applying Quick Gaming Boost"
echo.
echo Applying Quick Gaming Boost...
echo.

echo [1/5] Setting high performance power plan...
powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c

echo [2/5] Disabling Game Bar and DVR...
powershell -Command "Set-ItemProperty -Path 'HKCU\System\GameConfigStore' -Name 'GameDVR_Enabled' -Value 0 -ErrorAction SilentlyContinue"
powershell -Command "Set-ItemProperty -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR' -Name 'AllowGameDVR' -Value 0 -ErrorAction SilentlyContinue"

echo [3/5] Optimizing CPU priority for games...
powershell -Command "Set-ItemProperty -Path 'HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games' -Name 'Priority' -Value 6"

echo [4/5] Optimizing network for gaming...
powershell -Command "netsh int tcp set global autotuninglevel=restricted"
powershell -Command "Set-ItemProperty -Path 'HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters' -Name 'TcpAckFrequency' -Value 1"

echo [5/5] Disabling fullscreen optimizations...
powershell -Command "Set-ItemProperty -Path 'HKCU\System\GameConfigStore' -Name 'GameDVR_FSEBehaviorMode' -Value 2 -Type DWord -ErrorAction SilentlyContinue"

echo.
call animation-utils.bat :COLOR_CYCLE "Quick gaming boost applied!"
pause
goto GAMING_MENU

:FPS_OPT
cls
call animation-utils.bat :COUNTDOWN 3
echo.
echo FPS Optimization
echo --------------
echo.

echo [1/8] Optimizing Windows for maximum performance...
powershell -Command "Set-ItemProperty -Path 'HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects' -Name 'VisualFXSetting' -Value 2"

echo [2/8] Setting processor scheduling for programs...
powershell -Command "Set-ItemProperty -Path 'HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl' -Name 'Win32PrioritySeparation' -Value 38"

echo [3/8] Optimizing GPU settings...
powershell -Command "Set-ItemProperty -Path 'HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile' -Name 'SystemResponsiveness' -Value 0"
powershell -Command "Set-ItemProperty -Path 'HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games' -Name 'GPU Priority' -Value 8"
powershell -Command "Set-ItemProperty -Path 'HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games' -Name 'Priority' -Value 6"
powershell -Command "Set-ItemProperty -Path 'HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games' -Name 'Scheduling Category' -Value 'High'"

echo [4/8] Disabling background apps...
powershell -Command "Get-AppxPackage | Where-Object {$_.IsFramework -eq $false} | ForEach-Object {Add-AppxPackage -DisableDevelopmentMode -Register '$($_.InstallLocation)\AppxManifest.xml'}"

echo [5/8] Optimizing memory usage...
powershell -Command "Set-ItemProperty -Path 'HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management' -Name 'LargeSystemCache' -Value 1"
powershell -Command "Set-ItemProperty -Path 'HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management' -Name 'DisablePagingExecutive' -Value 1"

echo [6/8] Disabling Windows animations...
powershell -Command "Set-ItemProperty -Path 'HKCU\Control Panel\Desktop' -Name 'DragFullWindows' -Value '0'"
powershell -Command "Set-ItemProperty -Path 'HKCU\Control Panel\Desktop\WindowMetrics' -Name 'MinAnimate' -Value '0'"

echo [7/8] Optimizing mouse settings for gaming...
powershell -Command "Set-ItemProperty -Path 'HKCU\Control Panel\Mouse' -Name 'MouseSpeed' -Value '0'"
powershell -Command "Set-ItemProperty -Path 'HKCU\Control Panel\Mouse' -Name 'MouseThreshold1' -Value '0'"
powershell -Command "Set-ItemProperty -Path 'HKCU\Control Panel\Mouse' -Name 'MouseThreshold2' -Value '0'"

echo [8/8] Disabling fullscreen optimizations for all games...
powershell -Command "Get-ChildItem -Path 'C:\Program Files\' -Include '*.exe' -Recurse -ErrorAction SilentlyContinue | ForEach-Object { New-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers' -Name $_.FullName -Value '~ DISABLEDXMAXIMIZEDWINDOWEDMODE' -PropertyType String -Force -ErrorAction SilentlyContinue }"
powershell -Command "Get-ChildItem -Path 'C:\Program Files (x86)\' -Include '*.exe' -Recurse -ErrorAction SilentlyContinue | ForEach-Object { New-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers' -Name $_.FullName -Value '~ DISABLEDXMAXIMIZEDWINDOWEDMODE' -PropertyType String -Force -ErrorAction SilentlyContinue }"

echo.
echo FPS optimization complete! You should see improved frame rates in games.
pause
goto GAMING_MENU

:GAME_SPECIFIC
cls
call animation-utils.bat :TYPING_EFFECT "Game-Specific Optimizations"
echo.
echo Game-Specific Optimizations
echo ------------------------
echo.
echo Select game to optimize:
echo [1] Fortnite
echo [2] Call of Duty
echo [3] Minecraft
echo [4] League of Legends
echo [5] Valorant
echo [6] CS:GO / Counter-Strike 2
echo [7] Apex Legends
echo [8] GTA V
echo [9] Custom Game Path
echo.
set /p game_choice=""

if "%game_choice%"=="1" (
    echo Optimizing Fortnite...
    echo.
    echo [1/3] Setting high priority...
    powershell -Command "Get-Process -Name 'FortniteClient-Win64-Shipping' -ErrorAction SilentlyContinue | ForEach-Object { $_.PriorityClass = 'High' }"
    
    echo [2/3] Creating optimized launch options...
    echo -USEALLAVAILABLECORES -NOSPLASH -NOMANSKY -NOTEXTURESTREAMING > "%USERPROFILE%\Desktop\Fortnite_Launch_Options.txt"
    
    echo [3/3] Optimizing game settings...
    powershell -Command "New-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers' -Name 'C:\Program Files\Epic Games\Fortnite\FortniteGame\Binaries\Win64\FortniteClient-Win64-Shipping.exe' -Value '~ DISABLEDXMAXIMIZEDWINDOWEDMODE' -PropertyType String -Force -ErrorAction SilentlyContinue"
)

echo.
echo Game-specific optimizations applied!
echo Launch options have been saved to your Desktop.
pause
goto GAMING_MENU
