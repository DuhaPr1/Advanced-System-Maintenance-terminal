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

:: Run intro animation
powershell -Command "$host.UI.RawUI.BackgroundColor = 'Black'; $host.UI.RawUI.ForegroundColor = 'Green'; Clear-Host; Write-Host ''; Write-Host ''; Write-Host '                              DEVELOPER TOOLS MODULE'; Write-Host '                               INITIALIZING IDE'; Write-Host ''; Write-Host ''; $devFrames = @('{ } CODING', '{ } CODING.', '{ } CODING..', '{ } CODING...'); for ($i = 0; $i -lt 12; $i++) { Write-Host ('                                ' + $devFrames[$i % 4]) -ForegroundColor Green; Start-Sleep -Milliseconds 200; Write-Host \"`r\"; }; Write-Host ''; Write-Host '                              DEVELOPER MODULE READY'; Start-Sleep -Seconds 1; Clear-Host"

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
echo  ████████╗ ██████╗  ██████╗ ██╗     ███████╗
echo  ╚══██╔══╝██╔═══██╗██╔═══██╗██║     ██╔════╝
echo     ██║   ██║   ██║██║   ██║██║     ███████╗
echo     ██║   ██║   ██║██║   ██║██║     ╚════██║
echo     ██║   ╚██████╔╝╚██████╔╝███████╗███████║
echo     ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝╚══════╝
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
echo   [4] Docker Container Tools
echo   [5] Database Connection Tools
echo   [6] API Testing Tools
echo   [7] Code Quality Analyzer
echo   [8] Build Automation Tools
echo.
echo   [A] Environment Variable Manager
echo   [B] Package Manager Tools
echo   [C] Development Server Launcher
echo   [D] Code Backup & Sync
echo   [E] Performance Profiling
echo   [F] Log Analysis Tools
echo   [G] Development Utilities
echo   [0] Back to Main Menu
echo.
echo  ╔════════════════════════════════════════════════════════════════════════════════╗
echo  ║  Development Status: Ready for coding...                                       ║
echo  ╚════════════════════════════════════════════════════════════════════════════════╝
echo.
set /p choice="Enter your choice: "

if /i "%choice%"=="1" goto GIT_MANAGER
if /i "%choice%"=="2" goto NODEJS_SETUP
if /i "%choice%"=="3" goto PYTHON_MANAGER
if /i "%choice%"=="4" goto DOCKER_TOOLS
if /i "%choice%"=="5" goto DATABASE_TOOLS
if /i "%choice%"=="6" goto API_TESTING
if /i "%choice%"=="7" goto CODE_QUALITY
if /i "%choice%"=="8" goto BUILD_AUTOMATION
if /i "%choice%"=="A" goto ENV_MANAGER_DEV
if /i "%choice%"=="B" goto PACKAGE_MANAGER
if /i "%choice%"=="C" goto DEV_SERVER
if /i "%choice%"=="D" goto CODE_BACKUP
if /i "%choice%"=="E" goto PERFORMANCE_PROFILING
if /i "%choice%"=="F" goto LOG_ANALYSIS
if /i "%choice%"=="G" goto DEV_UTILITIES
if /i "%choice%"=="0" exit /b

goto DEVELOPER_MENU

:GIT_MANAGER
cls
echo Running Git Repository Manager... >> "%log_file%"
echo.
echo  ╔════════════════════════════════════════════════════════════════════════════════╗
echo  ║                           GIT REPOSITORY MANAGER                               ║
echo  ╚════════════════════════════════════════════════════════════════════════════════╝
echo.

:: Git animation
powershell -Command "$host.UI.RawUI.BackgroundColor = 'Black'; $host.UI.RawUI.ForegroundColor = 'Green'; Write-Host ''; Write-Host ' GIT REPOSITORY MANAGEMENT SYSTEM'; Write-Host ' =============================='; Write-Host ''; Write-Host ' Initializing Git operations...'; Write-Host '';"

echo [1] Initialize New Repository
echo [2] Clone Repository
echo [3] Check Repository Status
echo [4] Commit Changes
echo [5] Push to Remote
echo [6] Pull from Remote
echo [7] Branch Management
echo [8] Git Configuration
echo [9] Repository Statistics
echo [A] Advanced Git Operations
echo.
set /p git_choice=""

if "%git_choice%"=="1" (
    echo Initialize New Repository... >> "%log_file%"
    echo.
    echo Initialize New Repository
    echo -----------------------
    echo.
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
    echo README.md created with initial content.
)

if "%git_choice%"=="8" (
    echo Git Configuration Setup... >> "%log_file%"
    echo.
    echo Git Configuration Setup
    echo --------------------
    echo.
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
    echo Default branch set to 'main'
    echo Auto CRLF conversion enabled
)

if "%git_choice%"=="9" (
    echo Repository Statistics... >> "%log_file%"
    echo.
    echo Repository Statistics
    echo -------------------
    echo.
    echo Enter repository path:
    set /p stats_path=""
    
    if exist "%stats_path%" (
        cd /d "%stats_path%"
        
        echo Repository: %stats_path%
        echo.
        echo Commit Statistics:
        git log --oneline | find /c /v ""
        echo Total commits found.
        echo.
        echo Branch Information:
        git branch -a
        echo.
        echo Recent Commits:
        git log --oneline -10
        echo.
        echo Repository Size:
        powershell -Command "Get-ChildItem -Path '%stats_path%' -Recurse | Measure-Object -Property Length -Sum | Select-Object @{Name='Size(MB)';Expression={[math]::Round($_.Sum/1MB,2)}}"
    ) else (
        echo Error: Repository path does not exist!
    )
)

echo.
echo Press any key to return to the Developer Menu...
pause >nul
goto DEVELOPER_MENU

:NODEJS_SETUP
cls
echo Running Node.js Environment Setup... >> "%log_file%"
echo.
echo  ╔════════════════════════════════════════════════════════════════════════════════╗
echo  ║                         NODE.JS ENVIRONMENT SETUP                              ║
echo  ╚════════════════════════════════════════════════════════════════════════════════╝
echo.

:: Node.js animation
powershell -Command "$host.UI.RawUI.BackgroundColor = 'Black'; $host.UI.RawUI.ForegroundColor = 'Green'; Write-Host ''; Write-Host ' NODE.JS DEVELOPMENT ENVIRONMENT'; Write-Host ' ============================='; Write-Host ''; Write-Host ' Checking Node.js installation and configuration...'; Write-Host '';"

echo [1] Check Node.js Installation
echo [2] Install/Update npm packages
echo [3] Create new Node.js project
echo [4] Run npm audit
echo [5] Clear npm cache
echo [6] List global packages
echo [7] Node.js Performance Optimization
echo [8] Create Express.js Template
echo [9] Package.json Generator
echo.
set /p node_choice=""

if "%node_choice%"=="1" (
    echo Check Node.js Installation... >> "%log_file%"
    echo.
    echo Checking Node.js installation...
    echo.
    echo Node.js version:
    node --version 2>nul || echo Node.js not installed or not in PATH
    echo.
    echo npm version:
    npm --version 2>nul || echo npm not installed or not in PATH
    echo.
    echo Node.js installation path:
    where node 2>nul || echo Node.js not found in PATH
    echo.
    echo npm installation path:
    where npm 2>nul || echo npm not found in PATH
    echo.
    echo Global npm packages location:
    npm config get prefix 2>nul || echo npm not configured
)

if "%node_choice%"=="3" (
    echo Create new Node.js project... >> "%log_file%"
    echo.
    echo Create new Node.js project
    echo ------------------------
    echo.
    echo Enter project name:
    set /p project_name=""
    echo Enter project description:
    set /p project_desc=""
    echo Enter author name (default: Abdelhakim Baalla):
    set /p project_author=""
    if "%project_author%"=="" set "project_author=Abdelhakim Baalla"
    
    mkdir "%project_name%" 2>nul
    cd "%project_name%"
    
    echo Creating package.json...
    echo { > package.json
    echo   "name": "%project_name%", >> package.json
    echo   "version": "1.0.0", >> package.json
    echo   "description": "%project_desc%", >> package.json
    echo   "main": "index.js", >> package.json
    echo   "scripts": { >> package.json
    echo     "start": "node index.js", >> package.json
    echo     "dev": "nodemon index.js", >> package.json
    echo     "test": "echo \"Error: no test specified\" && exit 1" >> package.json
    echo   }, >> package.json
    echo   "author": "%project_author%", >> package.json
    echo   "license": "MIT", >> package.json
    echo   "dependencies": {}, >> package.json
    echo   "devDependencies": {} >> package.json
    echo } >> package.json
    
    echo Creating index.js...
    echo // %project_name% > index.js
    echo // Created by %project_author% >> index.js
    echo // https://abdelhakim-baalla.vercel.app/ >> index.js
    echo. >> index.js
    echo console.log('Hello from %project_name%!'); >> index.js
    echo console.log('Created by %project_author%'); >> index.js
    
    echo Creating .gitignore...
    echo node_modules/ > .gitignore
    echo .env >> .gitignore
    echo *.log >> .gitignore
    echo .DS_Store >> .gitignore
    
    echo.
    echo Project '%project_name%' created successfully!
    echo Files created: package.json, index.js, .gitignore
)

if "%node_choice%"=="8" (
    echo Create Express.js Template... >> "%log_file%"
    echo.
    echo Create Express.js Template
    echo ------------------------
    echo.
    echo Enter project name:
    set /p express_name=""
    
    mkdir "%express_name%" 2>nul
    cd "%express_name%"
    
    echo Creating Express.js application...
    npm init -y >nul
    npm install express cors helmet morgan dotenv >nul
    npm install --save-dev nodemon >nul
    
    echo Creating app.js...
    echo // Express.js Application > app.js
    echo // Created by Abdelhakim Baalla >> app.js
    echo // https://abdelhakim-baalla.vercel.app/ >> app.js
    echo. >> app.js
    echo const express = require('express'); >> app.js
    echo const cors = require('cors'); >> app.js
    echo const helmet = require('helmet'); >> app.js
    echo const morgan = require('morgan'); >> app.js
    echo require('dotenv').config(); >> app.js
    echo. >> app.js
    echo const app = express(); >> app.js
    echo const PORT = process.env.PORT ^|^| 3000; >> app.js
    echo. >> app.js
    echo // Middleware >> app.js
    echo app.use(helmet()); >> app.js
    echo app.use(cors()); >> app.js
    echo app.use(morgan('combined')); >> app.js
    echo app.use(express.json()); >> app.js
    echo app.use(express.urlencoded({ extended: true })); >> app.js
    echo. >> app.js
    echo // Routes >> app.js
    echo app.get('/', (req, res) =^> { >> app.js
    echo   res.json({ >> app.js
    echo     message: 'Welcome to %express_name%!', >> app.js
    echo     author: 'Abdelhakim Baalla', >> app.js
    echo     website: 'https://abdelhakim-baalla.vercel.app/' >> app.js
    echo   }); >> app.js
    echo }); >> app.js
    echo. >> app.js
    echo // Start server >> app.js
    echo app.listen(PORT, () =^> { >> app.js
    echo   console.log(`Server running on port ${PORT}`); >> app.js
    echo   console.log('Created by Abdelhakim Baalla'); >> app.js
    echo }); >> app.js
    
    echo Creating .env file...
    echo PORT=3000 > .env
    echo NODE_ENV=development >> .env
    
    echo.
    echo Express.js template '%express_name%' created successfully!
    echo Dependencies installed: express, cors, helmet, morgan, dotenv
    echo Dev dependencies: nodemon
)

echo.
echo Press any key to return to the Developer Menu...
pause >nul
goto DEVELOPER_MENU

:DEV_UTILITIES
cls
echo Running Development Utilities... >> "%log_file%"
echo.
echo  ╔════════════════════════════════════════════════════════════════════════════════╗
echo  ║                          DEVELOPMENT UTILITIES                                 ║
echo  ╚════════════════════════════════════════════════════════════════════════════════╝
echo.

:: Dev utilities animation
powershell -Command "$host.UI.RawUI.BackgroundColor = 'Black'; $host.UI.RawUI.ForegroundColor = 'Cyan'; Write-Host ''; Write-Host ' DEVELOPMENT UTILITIES TOOLKIT'; Write-Host ' ==========================='; Write-Host ''; Write-Host ' Loading developer tools and generators...'; Write-Host '';"

echo [1] Generate Random Data
echo [2] Hash Generator
echo [3] Base64 Encoder/Decoder
echo [4] JSON Formatter
echo [5] URL Encoder/Decoder
echo [6] Color Code Converter
echo [7] Lorem Ipsum Generator
echo [8] Password Generator
echo [9] UUID Generator
echo [A] QR Code Generator
echo [B] File Hash Checker
echo [C] Port Scanner
echo.
set /p util_choice=""

if "%util_choice%"=="1" (
    echo Generate Random Data... >> "%log_file%"
    echo.
    echo Random Data Generator
    echo -------------------
    echo [1] Random Numbers [2] Random Strings [3] Random UUIDs [4] Random Emails
    set /p data_type=""
    
    if "%data_type%"=="1" (
        echo Enter count:
        set /p count=""
        echo Enter minimum value:
        set /p min_val=""
        echo Enter maximum value:
        set /p max_val=""
        echo.
        echo Generated Random Numbers:
        powershell -Command "1..%count% | ForEach-Object { Get-Random -Minimum %min_val% -Maximum %max_val% }"
    )
    
    if "%data_type%"=="2" (
        echo Enter count:
        set /p count=""
        echo Enter string length:
        set /p str_length=""
        echo.
        echo Generated Random Strings:
        powershell -Command "$chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'; 1..%count% | ForEach-Object { -join ((1..%str_length%) | ForEach-Object { $chars[(Get-Random -Maximum $chars.Length)] }) }"
    )
    
    if "%data_type%"=="3" (
        echo Enter count:
        set /p count=""
        echo.
        echo Generated UUIDs:
        powershell -Command "1..%count% | ForEach-Object { [System.Guid]::NewGuid().ToString() }"
    )
    
    if "%data_type%"=="4" (
        echo Enter count:
        set /p count=""
        echo.
        echo Generated Random Emails:
        powershell -Command "$domains = @('gmail.com', 'yahoo.com', 'hotmail.com', 'outlook.com', 'example.com'); $chars = 'abcdefghijklmnopqrstuvwxyz0123456789'; 1..%count% | ForEach-Object { $username = -join ((1..8) | ForEach-Object { $chars[(Get-Random -Maximum $chars.Length)] }); $domain = $domains[(Get-Random -Maximum $domains.Length)]; Write-Output ($username + '@' + $domain) }"
    )
)

if "%util_choice%"=="8" (
    echo Password Generator... >> "%log_file%"
    echo.
    echo Password Generator
    echo ----------------
    echo Enter password length (8-128):
    set /p pass_length=""
    echo Include special characters? (Y/N):
    set /p include_special=""
    echo Include numbers? (Y/N):
    set /p include_numbers=""
    echo.
    
    if /i "%include_special%"=="Y" (
        if /i "%include_numbers%"=="Y" (
            powershell -Command "$chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%%^&*()_+-=[]{}|;:,.<>?'; $password = -join ((1..%pass_length%) | ForEach-Object { $chars[(Get-Random -Maximum $chars.Length)] }); Write-Host 'Generated Password:' -ForegroundColor Green; Write-Host $password -ForegroundColor Yellow"
        ) else (
            powershell -Command "$chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$%%^&*()_+-=[]{}|;:,.<>?'; $password = -join ((1..%pass_length%) | ForEach-Object { $chars[(Get-Random -Maximum $chars.Length)] }); Write-Host 'Generated Password:' -ForegroundColor Green; Write-Host $password -ForegroundColor Yellow"
        )
    ) else (
        if /i "%include_numbers%"=="Y" (
            powershell -Command "$chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'; $password = -join ((1..%pass_length%) | ForEach-Object { $chars[(Get-Random -Maximum $chars.Length)] }); Write-Host 'Generated Password:' -ForegroundColor Green; Write-Host $password -ForegroundColor Yellow"
        ) else (
            powershell -Command "$chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'; $password = -join ((1..%pass_length%) | ForEach-Object { $chars[(Get-Random -Maximum $chars.Length)] }); Write-Host 'Generated Password:' -ForegroundColor Green; Write-Host $password -ForegroundColor Yellow"
        )
    )
)

if "%util_choice%"=="B" (
    echo File Hash Checker... >> "%log_file%"
    echo.
    echo File Hash Checker
    echo ---------------
    echo Enter file path:
    set /p file_path=""
    echo.
    echo Select hash algorithm:
    echo [1] MD5 [2] SHA1 [3] SHA256 [4] All
    set /p hash_type=""
    echo.
    
    if "%hash_type%"=="1" (
        echo MD5 Hash:
        powershell -Command "Get-FileHash -Path '%file_path%' -Algorithm MD5 | Select-Object Hash | Format-Table -HideTableHeaders"
    )
    
    if "%hash_type%"=="4" (
        echo Calculating all hashes for: %file_path%
        echo.
        echo MD5:
        powershell -Command "Get-FileHash -Path '%file_path%' -Algorithm MD5 | Select-Object Hash | Format-Table -HideTableHeaders"
        echo SHA1:
        powershell -Command "Get-FileHash -Path '%file_path%' -Algorithm SHA1 | Select-Object Hash | Format-Table -HideTableHeaders"
        echo SHA256:
        powershell -Command "Get-FileHash -Path '%file_path%' -Algorithm SHA256 | Select-Object Hash | Format-Table -HideTableHeaders"
    )
)

echo.
echo Press any key to return to the Developer Menu...
pause >nul
goto DEVELOPER_MENU
