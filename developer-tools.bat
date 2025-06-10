@echo off
title Developer Tools Suite
color 0A
mode con: cols=100 lines=35
setlocal enabledelayedexpansion

call animation-utils.bat :SHOW_DEVELOPER_INFO
call animation-utils.bat :TYPING_EFFECT "Welcome to Developer Tools Suite"

:DEVELOPER_MENU
cls
color 0A
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

if /i "%choice%"=="1" goto GIT_MANAGER
if /i "%choice%"=="2" goto NODEJS_SETUP
if /i "%choice%"=="3" goto PYTHON_MANAGER
if /i "%choice%"=="4" goto DOCKER_TOOLS
if /i "%choice%"=="5" goto DATABASE_TOOLS
if /i "%choice%"=="6" goto API_TESTING
if /i "%choice%"=="7" goto CODE_QUALITY
if /i "%choice%"=="8" goto BUILD_AUTOMATION
if /i "%choice%"=="9" goto ENV_MANAGER_DEV
if /i "%choice%"=="A" goto PACKAGE_MANAGER
if /i "%choice%"=="B" goto DEV_SERVER
if /i "%choice%"=="C" goto CODE_BACKUP
if /i "%choice%"=="D" goto PERFORMANCE_PROFILING
if /i "%choice%"=="E" goto LOG_ANALYSIS
if /i "%choice%"=="F" goto DEV_UTILITIES
if /i "%choice%"=="0" exit /b

goto DEVELOPER_MENU

:GIT_MANAGER
cls
call animation-utils.bat :SPINNER_ANIMATION "Git Repository Manager"
echo.
echo Git Repository Manager
echo --------------------
echo.
echo [1] Initialize New Repository
echo [2] Clone Repository
echo [3] Check Repository Status
echo [4] Commit Changes
echo [5] Push to Remote
echo [6] Pull from Remote
echo [7] Branch Management
echo [8] Git Configuration
echo.
set /p git_choice=""

if "%git_choice%"=="1" (
    echo.
    echo Enter repository path:
    set /p repo_path=""
    cd /d "%repo_path%"
    git init
    echo Repository initialized!
)

if "%git_choice%"=="2" (
    echo.
    echo Enter repository URL:
    set /p repo_url=""
    echo Enter destination folder:
    set /p dest_folder=""
    git clone "%repo_url%" "%dest_folder%"
    echo Repository cloned!
)

if "%git_choice%"=="8" (
    echo.
    echo Git Configuration Setup
    echo --------------------
    echo Enter your name:
    set /p git_name=""
    echo Enter your email:
    set /p git_email=""
    git config --global user.name "%git_name%"
    git config --global user.email "%git_email%"
    echo Git configuration updated!
)

pause
goto DEVELOPER_MENU

:NODEJS_SETUP
cls
call animation-utils.bat :LOADING_BAR
echo.
echo Node.js Environment Setup
echo -----------------------
echo.
echo [1] Check Node.js Installation
echo [2] Install/Update npm packages
echo [3] Create new Node.js project
echo [4] Run npm audit
echo [5] Clear npm cache
echo [6] List global packages
echo [7] Update Node.js
echo.
set /p node_choice=""

if "%node_choice%"=="1" (
    echo.
    echo Checking Node.js installation...
    node --version
    npm --version
    echo.
    echo Node.js path:
    where node
)

if "%node_choice%"=="3" (
    echo.
    echo Creating new Node.js project...
    echo Enter project name:
    set /p project_name=""
    mkdir "%project_name%"
    cd "%project_name%"
    npm init -y
    echo Project created successfully!
)

if "%node_choice%"=="6" (
    echo.
    echo Global npm packages:
    npm list -g --depth=0
)

pause
goto DEVELOPER_MENU

:DEV_UTILITIES
cls
call animation-utils.bat :MATRIX_ANIMATION
echo.
echo Development Utilities
echo -------------------
echo.
echo [1] Generate Random Data
echo [2] Hash Generator
echo [3] Base64 Encoder/Decoder
echo [4] JSON Formatter
echo [5] URL Encoder/Decoder
echo [6] Color Code Converter
echo [7] Lorem Ipsum Generator
echo [8] Password Generator
echo.
set /p util_choice=""

if "%util_choice%"=="1" (
    echo.
    echo Random Data Generator
    echo -------------------
    echo [1] Random Numbers [2] Random Strings [3] Random UUIDs
    set /p data_type=""
    
    if "%data_type%"=="1" (
        echo Enter count:
        set /p count=""
        powershell -Command "1..%count% | ForEach-Object { Get-Random -Minimum 1 -Maximum 1000000 }"
    )
    
    if "%data_type%"=="3" (
        echo Enter count:
        set /p count=""
        powershell -Command "1..%count% | ForEach-Object { [System.Guid]::NewGuid().ToString() }"
    )
)

if "%util_choice%"=="8" (
    echo.
    echo Password Generator
    echo ----------------
    echo Enter password length:
    set /p pass_length=""
    powershell -Command "$chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%%^&*'; -join ((1..%pass_length%) | ForEach-Object { $chars[(Get-Random -Maximum $chars.Length)] })"
)

pause
goto DEVELOPER_MENU
