@echo off
title Advanced System Maintenance Suite
mode con: cols=80 lines=30
setlocal enabledelayedexpansion

call animation-utils.bat :SHOW_DEVELOPER_INFO
call animation-utils.bat :MATRIX_ANIMATION
call animation-utils.bat :LOADING_BAR

:MAIN_MENU
cls
color 0A
echo.
echo  ========================================================================
echo                ADVANCED SYSTEM MAINTENANCE SUITE v2.5
echo  ========================================================================
echo.
echo  ----------------------------------------------------------------
echo   [1] Deep System Cleanup
echo   [2] Performance Optimization
echo   [3] System Updates Manager
echo   [4] Security & Privacy Tools
echo   [5] System Repair & Diagnostics
echo   [6] System Information & Monitoring
echo   [7] Gaming Optimization
echo   [8] Network Optimization
echo   [9] Storage Management
echo   [A] Advanced Tools Menu
echo   [B] Backup & Recovery
echo   [C] Custom Commands
echo   [D] Developer Tools
echo   [0] Exit
echo  ----------------------------------------------------------------
echo.
set /p choice="Select option: "

if /i "%choice%"=="1" call menus\cleanup-master.bat
if /i "%choice%"=="2" call menus\optimization-master.bat
if /i "%choice%"=="3" call menus\update-master.bat
if /i "%choice%"=="4" call menus\security-master.bat
if /i "%choice%"=="5" call menus\repair-master.bat
if /i "%choice%"=="6" call menus\monitoring-master.bat
if /i "%choice%"=="7" call menus\gaming-optimization.bat
if /i "%choice%"=="8" call menus\network-optimization.bat
if /i "%choice%"=="9" call menus\storage-management.bat
if /i "%choice%"=="A" call menus\advanced-tools.bat
if /i "%choice%"=="B" call menus\backup-recovery.bat
if /i "%choice%"=="C" call menus\custom-commands.bat
if /i "%choice%"=="D" call menus\developer-tools.bat
if /i "%choice%"=="0" goto EXIT

goto MAIN_MENU

:EXIT
cls
call animation-utils.bat :TYPING_EFFECT "Thank you for using Advanced System Maintenance Suite!"
call animation-utils.bat :TYPING_EFFECT "Developed by Abdelhakim Baalla"
timeout /t 3 >nul
exit
