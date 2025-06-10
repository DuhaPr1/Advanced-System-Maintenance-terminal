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
set "target="
if /i "%choice%"=="1" set "target=system-overview.bat"
if /i "%choice%"=="2" set "target=hardware-info.bat"
if /i "%choice%"=="3" set "target=performance-monitoring.bat"
if /i "%choice%"=="4" set "target=resource-usage.bat"
if /i "%choice%"=="5" set "target=event-log-viewer.bat"
if /i "%choice%"=="6" set "target=network-monitoring.bat"
if /i "%choice%"=="7" set "target=process-explorer.bat"
if /i "%choice%"=="8" set "target=service-status.bat"
if /i "%choice%"=="9" set "target=export-system-report.bat"
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

goto MONITORING_MENU
