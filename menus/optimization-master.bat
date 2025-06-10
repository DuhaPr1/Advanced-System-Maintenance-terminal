@echo off
REM Performance Optimization Suite
color 0E
mode con: cols=100 lines=35
setlocal enabledelayedexpansion
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :MATRIX_ANIMATION
:OPTIMIZATION_MENU
cls
color 0E
echo.
echo  ========================================================================
echo                       PERFORMANCE OPTIMIZATION
echo                         Advanced Tuning Suite
echo  ========================================================================
echo.
echo  ----------------------------------------------------------------
echo   [1] Quick Performance Boost
echo   [2] Advanced System Optimization
echo   [3] Memory & Storage Optimization
echo   [4] CPU & Process Optimization
echo   [5] Network Performance Tuning
echo   [6] Gaming Performance Mode
echo   [7] Power Management Optimization
echo   [8] Startup & Services Optimization
echo   [9] Performance Monitoring Setup
echo   [A] Registry Optimization
echo   [B] File System Optimization
echo   [C] Graphics & Visual Performance
echo   [D] Browser Performance Optimization
echo   [E] SSD Optimization
echo   [F] Custom Performance Profile
echo   [0] Back to Main Menu
echo  ----------------------------------------------------------------
echo.
set /p choice="Select optimization option: "
if /i "%choice%"=="1" call ..\advanced-tools\quick-boost.bat
if /i "%choice%"=="2" call ..\advanced-tools\advanced-opt.bat
if /i "%choice%"=="3" call ..\advanced-tools\memory-opt.bat
if /i "%choice%"=="4" call ..\advanced-tools\cpu-opt.bat
if /i "%choice%"=="5" call ..\advanced-tools\network-opt.bat
if /i "%choice%"=="6" call ..\advanced-tools\gaming-opt.bat
if /i "%choice%"=="7" call ..\advanced-tools\power-opt.bat
if /i "%choice%"=="8" call ..\advanced-tools\startup-opt.bat
if /i "%choice%"=="9" call ..\advanced-tools\monitoring-setup.bat
if /i "%choice%"=="A" call ..\advanced-tools\registry-opt.bat
if /i "%choice%"=="B" call ..\advanced-tools\filesystem-opt.bat
if /i "%choice%"=="C" call ..\advanced-tools\graphics-opt.bat
if /i "%choice%"=="D" call ..\advanced-tools\browser-opt.bat
if /i "%choice%"=="E" call ..\advanced-tools\ssd-opt.bat
if /i "%choice%"=="F" call ..\advanced-tools\custom-profile.bat
if /i "%choice%"=="0" exit /b

REM Animation fun avant de réafficher le menu
call ..\animation-utils.bat :MATRIX_ANIMATION

goto OPTIMIZATION_MENU
