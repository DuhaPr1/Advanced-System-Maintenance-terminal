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
set /p choice=Votre choix : 
set "target="
if /i "%choice%"=="1" set "target=quick-network.bat"
if /i "%choice%"=="2" set "target=tcp-ip-opt.bat"
if /i "%choice%"=="3" set "target=gaming-network.bat"
if /i "%choice%"=="4" set "target=wifi-opt.bat"
if /i "%choice%"=="5" set "target=dns-opt.bat"
if /i "%choice%"=="6" set "target=bandwidth-mgmt.bat"
if /i "%choice%"=="7" set "target=adapter-config.bat"
if /i "%choice%"=="8" set "target=network-diag.bat"
if /i "%choice%"=="9" set "target=firewall-opt.bat"
if /i "%choice%"=="A" set "target=vpn-opt.bat"
if /i "%choice%"=="B" set "target=network-monitor.bat"
if /i "%choice%"=="C" set "target=browser-network.bat"
if /i "%choice%"=="D" set "target=services-opt.bat"
if /i "%choice%"=="E" set "target=custom-network.bat"
if /i "%choice%"=="F" set "target=reset-network.bat"
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

goto NETWORK_MENU
