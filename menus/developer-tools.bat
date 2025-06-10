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
set /p choice="Select developer tool: "
if /i "%choice%"=="1" call ..\advanced-tools\git-manager.bat
if /i "%choice%"=="2" call ..\advanced-tools\nodejs-setup.bat
if /i "%choice%"=="3" call ..\advanced-tools\python-manager.bat
if /i "%choice%"=="4" call ..\advanced-tools\docker-tools.bat
if /i "%choice%"=="5" call ..\advanced-tools\database-tools.bat
if /i "%choice%"=="6" call ..\advanced-tools\api-testing.bat
if /i "%choice%"=="7" call ..\advanced-tools\code-quality.bat
if /i "%choice%"=="8" call ..\advanced-tools\build-automation.bat
if /i "%choice%"=="9" call ..\advanced-tools\env-manager-dev.bat
if /i "%choice%"=="A" call ..\advanced-tools\package-manager.bat
if /i "%choice%"=="B" call ..\advanced-tools\dev-server.bat
if /i "%choice%"=="C" call ..\advanced-tools\code-backup.bat
if /i "%choice%"=="D" call ..\advanced-tools\performance-profiling.bat
if /i "%choice%"=="E" call ..\advanced-tools\log-analysis.bat
if /i "%choice%"=="F" call ..\advanced-tools\dev-utilities.bat
if /i "%choice%"=="0" exit /b
REM ...ajoute ici les goto/call pour chaque option si besoin...
goto DEVELOPER_MENU
