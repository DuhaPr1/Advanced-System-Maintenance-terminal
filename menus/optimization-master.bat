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
set "target="
if /i "%choice%"=="1" set "target=quick-boost.bat"
if /i "%choice%"=="2" set "target=advanced-opt.bat"
if /i "%choice%"=="3" set "target=memory-opt.bat"
if /i "%choice%"=="4" set "target=cpu-opt.bat"
if /i "%choice%"=="5" set "target=network-opt.bat"
if /i "%choice%"=="6" set "target=gaming-opt.bat"
if /i "%choice%"=="7" set "target=power-opt.bat"
if /i "%choice%"=="8" set "target=startup-opt.bat"
if /i "%choice%"=="9" set "target=monitoring-setup.bat"
if /i "%choice%"=="A" set "target=registry-opt.bat"
if /i "%choice%"=="B" set "target=filesystem-opt.bat"
if /i "%choice%"=="C" set "target=graphics-opt.bat"
if /i "%choice%"=="D" set "target=browser-opt.bat"
if /i "%choice%"=="E" set "target=ssd-opt.bat"
if /i "%choice%"=="F" set "target=custom-profile.bat"
if /i "%choice%"=="0" exit /b

if defined target (
    if exist "../advanced-tools/%target%" (
        findstr /C:"À compléter" "../advanced-tools/%target%" >nul
        if errorlevel 1 (
            call ../advanced-tools/%target%
        ) else (
            echo.
            echo [ERREUR] Cette fonctionnalité n'est pas encore implémentée.
            pause
        )
    ) else (
        echo.
        echo [ERREUR] Le script cible n'existe pas : ../advanced-tools/%target%
        pause
    )
)
REM Animation fun avant de réafficher le menu
call ../animation-utils.bat :MATRIX_ANIMATION

goto OPTIMIZATION_MENU
