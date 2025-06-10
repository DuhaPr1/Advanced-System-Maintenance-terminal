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
set "target="
if /i "%choice%"=="1" set "target=quick-gaming.bat"
if /i "%choice%"=="2" set "target=ultimate-gaming.bat"
if /i "%choice%"=="3" set "target=fps-opt.bat"
if /i "%choice%"=="4" set "target=input-lag.bat"
if /i "%choice%"=="5" set "target=gpu-opt.bat"
if /i "%choice%"=="6" set "target=cpu-priority.bat"
if /i "%choice%"=="7" set "target=network-latency.bat"
if /i "%choice%"=="8" set "target=game-specific.bat"
if /i "%choice%"=="9" set "target=directx-opt.bat"
if /i "%choice%"=="A" set "target=audio-latency.bat"
if /i "%choice%"=="B" set "target=launcher-opt.bat"
if /i "%choice%"=="C" set "target=vr-gaming.bat"
if /i "%choice%"=="D" set "target=streaming-setup.bat"
if /i "%choice%"=="E" set "target=gaming-monitor.bat"
if /i "%choice%"=="F" set "target=restore-defaults.bat"
if /i "%choice%"=="0" exit /b

if defined target (
    if exist "..\advanced-tools\%target%" (
        findstr /C:"À compléter" "..\advanced-tools\%target%" >nul
        if errorlevel 1 (
            call ..\advanced-tools\%target%
        ) else (
            echo.
            echo [ERREUR] Cette fonctionnalité n'est pas encore implémentée.
            pause
        )
    ) else (
        echo.
        echo [ERREUR] Le script cible n'existe pas : ..\advanced-tools\%target%
        pause
    )
)
call ..\animation-utils.bat :MATRIX_ANIMATION

goto GAMING_MENU
