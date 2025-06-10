@echo off
REM Gaming Performance Optimization
color 09
mode con: cols=100 lines=35
setlocal enabledelayedexpansion
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :MATRIX_ANIMATION
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
if /i "%choice%"=="1" call ..\advanced-tools\quick-gaming.bat
if /i "%choice%"=="2" call ..\advanced-tools\ultimate-gaming.bat
if /i "%choice%"=="3" call ..\advanced-tools\fps-opt.bat
if /i "%choice%"=="4" call ..\advanced-tools\input-lag.bat
if /i "%choice%"=="5" call ..\advanced-tools\gpu-opt.bat
if /i "%choice%"=="6" call ..\advanced-tools\cpu-priority.bat
if /i "%choice%"=="7" call ..\advanced-tools\network-latency.bat
if /i "%choice%"=="8" call ..\advanced-tools\game-specific.bat
if /i "%choice%"=="9" call ..\advanced-tools\directx-opt.bat
if /i "%choice%"=="A" call ..\advanced-tools\audio-latency.bat
if /i "%choice%"=="B" call ..\advanced-tools\launcher-opt.bat
if /i "%choice%"=="C" call ..\advanced-tools\vr-gaming.bat
if /i "%choice%"=="D" call ..\advanced-tools\streaming-setup.bat
if /i "%choice%"=="E" call ..\advanced-tools\gaming-monitor.bat
if /i "%choice%"=="F" call ..\advanced-tools\restore-defaults.bat
if /i "%choice%"=="0" exit /b
call ..\animation-utils.bat :MATRIX_ANIMATION
goto GAMING_MENU
