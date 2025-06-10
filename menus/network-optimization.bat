@echo off
REM Network Optimization Suite
color 0B
mode con: cols=100 lines=35
setlocal enabledelayedexpansion
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SCAN_ANIMATION
:NETWORK_MENU
cls
color 0B
echo.
echo  ========================================================================
echo                        NETWORK OPTIMIZATION SUITE
echo                       Advanced Connection Tuning
echo  ========================================================================
echo.
echo  ----------------------------------------------------------------
echo   [1] Quick Network Boost
echo   [2] Advanced TCP/IP Optimization
echo   [3] Gaming Network Latency Reduction
echo   [4] Wi-Fi Connection Optimization
echo   [5] DNS Optimization
echo   [6] Bandwidth Management
echo   [7] Network Adapter Configuration
echo   [8] Network Diagnostics & Repair
echo   [9] Firewall Optimization
echo   [A] VPN Connection Optimization
echo   [B] Network Monitoring Setup
echo   [C] Browser Network Settings
echo   [D] Network Services Optimization
echo   [E] Custom Network Profile
echo   [F] Reset Network Settings
echo   [0] Back to Main Menu
echo  ----------------------------------------------------------------
echo.
set /p choice="Select network option: "
if /i "%choice%"=="1" call ..\advanced-tools\quick-network.bat
if /i "%choice%"=="2" call ..\advanced-tools\tcp-ip-opt.bat
if /i "%choice%"=="3" call ..\advanced-tools\gaming-network.bat
if /i "%choice%"=="4" call ..\advanced-tools\wifi-opt.bat
if /i "%choice%"=="5" call ..\advanced-tools\dns-opt.bat
if /i "%choice%"=="6" call ..\advanced-tools\bandwidth-mgmt.bat
if /i "%choice%"=="7" call ..\advanced-tools\adapter-config.bat
if /i "%choice%"=="8" call ..\advanced-tools\network-diag.bat
if /i "%choice%"=="9" call ..\advanced-tools\firewall-opt.bat
if /i "%choice%"=="A" call ..\advanced-tools\vpn-opt.bat
if /i "%choice%"=="B" call ..\advanced-tools\network-monitor.bat
if /i "%choice%"=="C" call ..\advanced-tools\browser-network.bat
if /i "%choice%"=="D" call ..\advanced-tools\services-opt.bat
if /i "%choice%"=="E" call ..\advanced-tools\custom-network.bat
if /i "%choice%"=="F" call ..\advanced-tools\reset-network.bat
if /i "%choice%"=="0" exit /b
call ..\animation-utils.bat :MATRIX_ANIMATION
goto NETWORK_MENU
