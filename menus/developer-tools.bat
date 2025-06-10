@echo off
REM Developer Tools Suite
color 0A
mode con: cols=100 lines=35
:DEVELOPER_MENU
cls
echo.
echo  ========================================================================
echo                          DEVELOPER TOOLS SUITE
echo                        Created by: Abdelhakim Baalla
echo  ========================================================================
echo.
echo  ----------------------------------------------------------------
echo   [1] Git Repository Manager
echo   [2] Node.js Environment Setup
echo   [3] Python Environment Manager
echo   [4] Docker Container Tools
echo   [5] Database Connection Tools
echo   [6] API Testing Tools
echo   [7] Code Quality Analyzer
echo   [8] Build Automation Tools
echo   [9] Environment Variable Manager
echo   [A] Package Manager Tools
echo   [B] Development Server Launcher
echo   [C] Code Backup & Sync
echo   [D] Performance Profiling
echo   [E] Log Analysis Tools
echo   [F] Development Utilities
echo   [0] Back to Main Menu
echo  ----------------------------------------------------------------
echo.
set /p choice=Votre choix : 
set "target="
if /i "%choice%"=="1" set "target=git-manager.bat"
if /i "%choice%"=="2" set "target=nodejs-setup.bat"
if /i "%choice%"=="3" set "target=python-manager.bat"
if /i "%choice%"=="4" set "target=docker-tools.bat"
if /i "%choice%"=="5" set "target=database-tools.bat"
if /i "%choice%"=="6" set "target=api-testing.bat"
if /i "%choice%"=="7" set "target=code-quality.bat"
if /i "%choice%"=="8" set "target=build-automation.bat"
if /i "%choice%"=="9" set "target=env-manager-dev.bat"
if /i "%choice%"=="A" set "target=package-manager.bat"
if /i "%choice%"=="B" set "target=dev-server.bat"
if /i "%choice%"=="C" set "target=code-backup.bat"
if /i "%choice%"=="D" set "target=performance-profiling.bat"
if /i "%choice%"=="E" set "target=log-analysis.bat"
if /i "%choice%"=="F" set "target=dev-utilities.bat"
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

goto DEVELOPER_MENU
