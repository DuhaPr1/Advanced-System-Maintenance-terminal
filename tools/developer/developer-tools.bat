@echo off
title Developer Tools Suite - By Abdelhakim Baalla
color 0A
mode con: cols=100 lines=35
setlocal enabledelayedexpansion

:: Check for admin privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
echo Administrator privileges required!
echo Right-click and select "Run as administrator"
pause
exit /b
)

:: Log file setup
set "log_file=..\..\logs\developer_tools_log_%date:~-4,4%%date:~-7,2%%date:~-10,2%_%time:~0,2%%time:~3,2%%time:~6,2%.txt"
set "log_file=%log_file: =0%"
echo Developer Tools Suite - Log started at %date% %time% > "%log_file%"
echo Created by Abdelhakim Baalla >> "%log_file%"
echo. >> "%log_file%"

:DEVELOPER_MENU
cls
echo.
echo  ██████╗ ███████╗██╗   ██╗███████╗██╗      ██████╗ ██████╗ ███████╗██████╗ 
echo  ██╔══██╗██╔════╝██║   ██║██╔════╝██║     ██╔═══██╗██╔══██╗██╔════╝██╔══██╗
echo  ██║  ██║█████╗  ██║   ██║█████╗  ██║     ██║   ██║██████╔╝█████╗  ██████╔╝
echo  ██║  ██║██╔══╝  ╚██╗ ██╔╝██╔══╝  ██║     ██║   ██║██╔═══╝ ██╔══╝  ██╔══██╗
echo  ██████╔╝███████╗ ╚████╔╝ ███████╗███████╗╚██████╔╝██║     ███████╗██║  ██║
echo  ╚═════╝ ╚══════╝  ╚═══╝  ╚══════╝╚══════╝ ╚═════╝ ╚═╝     ╚══════╝╚═╝  ╚═╝
echo.
echo                             Created by Abdelhakim Baalla
echo                          https://abdelhakim-baalla.vercel.app/
echo.
echo  ╔════════════════════════════════════════════════════════════════════════════════╗
echo  ║                           DEVELOPER TOOLS SUITE                                ║
echo  ╚════════════════════════════════════════════════════════════════════════════════╝
echo.
echo   [1] Git Repository Manager
echo   [2] Node.js Environment Setup
echo   [3] Python Environment Manager
echo   [4] Development Utilities
echo   [5] Code Quality Tools
echo   [6] Environment Variable Manager
echo   [7] Package Manager Tools
echo   [8] Performance Profiling
echo   [0] Back to Main Menu
echo.
set /p choice="Enter your choice: "

if "%choice%"=="1" goto GIT_MANAGER
if "%choice%"=="2" goto NODEJS_SETUP
if "%choice%"=="3" goto PYTHON_MANAGER
if "%choice%"=="4" goto DEV_UTILITIES
if "%choice%"=="5" goto CODE_QUALITY
if "%choice%"=="6" goto ENV_MANAGER
if "%choice%"=="7" goto PACKAGE_MANAGER
if "%choice%"=="8" goto PERFORMANCE_PROFILING
if "%choice%"=="0" exit /b

goto DEVELOPER_MENU

:GIT_MANAGER
cls
echo Git Manager started at %time% >> "%log_file%"
echo.
echo  ╔════════════════════════════════════════════════════════════════════════════════╗
echo  ║                           GIT REPOSITORY MANAGER                               ║
echo  ╚════════════════════════════════════════════════════════════════════════════════╝
echo.
echo [1] Initialize New Repository
echo [2] Clone Repository
echo [3] Check Repository Status
echo [4] Git Configuration
echo [5] Repository Statistics
echo [0] Back to Developer Tools
echo.
set /p git_choice="Enter your choice: "

if "%git_choice%"=="1" (
    echo.
    echo Initialize New Repository
    echo -----------------------
    echo Enter repository path:
    set /p repo_path=""
    
    if not exist "%repo_path%" (
        mkdir "%repo_path%"
        echo Directory created: %repo_path%
    )
    
    cd /d "%repo_path%"
    git init
    
    echo # %repo_path% > README.md
    echo This repository was initialized using Advanced System Maintenance Suite >> README.md
    echo Created by Abdelhakim Baalla >> README.md
    echo https://abdelhakim-baalla.vercel.app/ >> README.md
    
    git add README.md
    git commit -m "Initial commit - Created by Abdelhakim Baalla"
    
    echo.
    echo Repository initialized successfully!
    echo Git repository initialized at %repo_path% at %time% >> "%log_file%"
)

if "%git_choice%"=="4" (
    echo.
    echo Git Configuration Setup
    echo --------------------
    echo Current Git Configuration:
    git config --list | findstr user
    echo.
    echo Enter your name:
    set /p git_name=""
    echo Enter your email:
    set /p git_email=""
    
    git config --global user.name "%git_name%"
    git config --global user.email "%git_email%"
    git config --global init.defaultBranch main
    git config --global core.autocrlf true
    
    echo.
    echo Git configuration updated successfully!
    echo Git configured for %git_name% (%git_email%) at %time% >> "%log_file%"
)

echo.
pause
goto GIT_MANAGER

:DEV_UTILITIES
cls
echo Development Utilities started at %time% >> "%log_file%"
echo.
echo  ╔════════════════════════════════════════════════════════════════════════════════╗
echo  ║                          DEVELOPMENT UTILITIES                                 ║
echo  ╚════════════════════════════════════════════════════════════════════════════════╝
echo.
echo [1] Generate Random Data
echo [2] Hash Generator
echo [3] Password Generator
echo [4] UUID Generator
echo [5] File Hash Checker
echo [6] Base64 Encoder/Decoder
echo [7] JSON Formatter
echo [0] Back to Developer Tools
echo.
set /p util_choice="Enter your choice: "

if "%util_choice%"=="3" (
    echo.
    echo Password Generator
    echo ----------------
    echo Enter password length (8-128):
    set /p pass_length=""
    echo Include special characters? (Y/N):
    set /p include_special=""
    echo.
    
    if /i "%include_special%"=="Y" (
        powershell -Command "$chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%%^&*()_+-=[]{}|;:,.<>?'; $password = -join ((1..%pass_length%) | ForEach-Object { $chars[(Get-Random -Maximum $chars.Length)] }); Write-Host 'Generated Password:'; Write-Host $password"
    ) else (
        powershell -Command "$chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'; $password = -join ((1..%pass_length%) | ForEach-Object { $chars[(Get-Random -Maximum $chars.Length)] }); Write-Host 'Generated Password:'; Write-Host $password"
    )
    echo Password generated at %time% >> "%log_file%"
)

if "%util_choice%"=="4" (
    echo.
    echo UUID Generator
    echo ------------
    echo Enter count:
    set /p count=""
    echo.
    echo Generated UUIDs:
    powershell -Command "1..%count% | ForEach-Object { [System.Guid]::NewGuid().ToString() }"
    echo %count% UUIDs generated at %time% >> "%log_file%"
)

echo.
pause
goto DEV_UTILITIES
