@echo off
REM System Information & Monitoring Suite
color 0B
mode con: cols=100 lines=35
:MONITORING_MENU
cls
echo.
echo  ========================================================================
echo                        SYSTEM INFORMATION & MONITORING SUITE
echo                      Advanced System Monitoring Tools
echo  ========================================================================
echo.
echo  ----------------------------------------------------------------
echo   [1] System Overview

echo   [2] Hardware Information

echo   [3] Performance Monitoring

echo   [4] Resource Usage

echo   [5] Event Log Viewer

echo   [6] Network Monitoring

echo   [7] Process Explorer

echo   [8] Service Status

echo   [9] Export System Report

echo   [0] Back to Main Menu
echo  ----------------------------------------------------------------
echo.
set /p choice="Select monitoring option: "
if /i "%choice%"=="1" call ..\advanced-tools\system-overview.bat
if /i "%choice%"=="2" call ..\advanced-tools\hardware-info.bat
if /i "%choice%"=="3" call ..\advanced-tools\performance-monitoring.bat
if /i "%choice%"=="4" call ..\advanced-tools\resource-usage.bat
if /i "%choice%"=="5" call ..\advanced-tools\event-log-viewer.bat
if /i "%choice%"=="6" call ..\advanced-tools\network-monitoring.bat
if /i "%choice%"=="7" call ..\advanced-tools\process-explorer.bat
if /i "%choice%"=="8" call ..\advanced-tools\service-status.bat
if /i "%choice%"=="9" call ..\advanced-tools\export-system-report.bat
if /i "%choice%"=="0" exit /b
REM ...ajoute ici les goto pour chaque option si besoin...
goto MONITORING_MENU
