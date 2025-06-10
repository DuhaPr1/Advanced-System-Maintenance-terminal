@echo off
title Advanced System Maintenance Suite v3.0 - By Abdelhakim Baalla
mode con: cols=120 lines=40
color 0A
setlocal enabledelayedexpansion

:: Check for admin privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo.
    echo ╔══════════════════════════════════════════════════════════════════════════════════════╗
    echo ║                              ADMINISTRATOR REQUIRED                                 ║
    echo ╚══════════════════════════════════════════════════════════════════════════════════════╝
    echo.
    echo This suite requires Administrator privileges to function properly.
    echo Please right-click on the file and select "Run as administrator"
    echo.
    pause
    exit /b
)

:: Create folder structure if it doesn't exist
if not exist ".\tools" mkdir ".\tools"
if not exist ".\tools\cleanup" mkdir ".\tools\cleanup"
if not exist ".\tools\optimization" mkdir ".\tools\optimization"
if not exist ".\tools\security" mkdir ".\tools\security"
if not exist ".\tools\network" mkdir ".\tools\network"
if not exist ".\tools\storage" mkdir ".\tools\storage"
if not exist ".\tools\developer" mkdir ".\tools\developer"
if not exist ".\tools\advanced" mkdir ".\tools\advanced"
if not exist ".\tools\custom" mkdir ".\tools\custom"
if not exist ".\tools\gaming" mkdir ".\tools\gaming"
if not exist ".\tools\repair" mkdir ".\tools\repair"
if not exist ".\tools\monitoring" mkdir ".\tools\monitoring"
if not exist ".\tools\updates" mkdir ".\tools\updates"
if not exist ".\logs" mkdir ".\logs"
if not exist ".\config" mkdir ".\config"
if not exist ".\backups" mkdir ".\backups"

:: Set path to include our tools
set "PATH=%PATH%;%~dp0;%~dp0\tools"

:: Set up logging
set "log_file=logs\maintenance_log_%date:~-4,4%%date:~-7,2%%date:~-10,2%_%time:~0,2%%time:~3,2%%time:~6,2%.txt"
set "log_file=%log_file: =0%"

:: Initialize log
echo Advanced System Maintenance Suite v3.0 - Session started at %date% %time% > "%log_file%"
echo Created by Abdelhakim Baalla >> "%log_file%"
echo Website: https://abdelhakim-baalla.vercel.app/ >> "%log_file%"
echo ============================================================================ >> "%log_file%"
echo. >> "%log_file%"

:: Animation functions
:MATRIX_ANIMATION
cls
color 0A
setlocal enabledelayedexpansion
set "chars=0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!@#$%%^&*()"
for /l %%a in (1,1,8) do (
    cls
    for /l %%b in (1,1,20) do (
        set "line="
        for /l %%c in (1,1,100) do (
            set /a "rnd=!random! %% 70"
            for %%d in (!rnd!) do set "line=!line!!chars:~%%d,1!"
        )
        echo !line!
    )
    timeout /t 0 /nobreak >nul
)
endlocal
goto :eof

:LOADING_ANIMATION
cls
echo.
echo.
echo.
echo.
echo.
echo                    ╔══════════════════════════════════════════════════════════════╗
echo                    ║              ADVANCED SYSTEM MAINTENANCE SUITE              ║
echo                    ║                        Version 3.0                          ║
echo                    ║                                                              ║
echo                    ║                Created by Abdelhakim Baalla                 ║
echo                    ║            https://abdelhakim-baalla.vercel.app/            ║
echo                    ╚══════════════════════════════════════════════════════════════╝
echo.
echo.
echo                              Initializing system components...
echo.
set "bar="
for /l %%i in (1,1,50) do (
    set "bar=!bar!█"
    cls
    echo.
    echo.
    echo.
    echo.
    echo.
    echo                    ╔══════════════════════════════════════════════════════════════╗
    echo                    ║              ADVANCED SYSTEM MAINTENANCE SUITE              ║
    echo                    ║                        Version 3.0                          ║
    echo                    ║                                                              ║
    echo                    ║                Created by Abdelhakim Baalla                 ║
    echo                    ║            https://abdelhakim-baalla.vercel.app/            ║
    echo                    ╚══════════════════════════════════════════════════════════════╝
    echo.
    echo.
    echo                              Initializing system components...
    echo.
    echo                         [!bar!%string:~%%i,50%] %%i%%
    echo.
    timeout /t 0 /nobreak >nul
)
echo.
echo                              System initialized successfully!
timeout /t 2 /nobreak >nul
goto :eof

:: Run intro animation
call :MATRIX_ANIMATION
call :LOADING_ANIMATION

:MAIN_MENU
cls
color 0A
echo.
echo  ██████╗ ██████╗ ██╗   ██╗ █████╗ ███╗   ██╗ ██████╗███████╗██████╗     
echo  ██╔══██╗██╔══██╗██║   ██║██╔══██╗████╗  ██║██╔════╝██╔════╝██╔══██╗    
echo  ██████╔╝██║  ██║██║   ██║███████║██╔██╗ ██║██║     █████╗  ██║  ██║    
echo  ██╔══██╗██║  ██║╚██╗ ██╔╝██╔══██║██║╚██╗██║██║     ██╔══╝  ██║  ██║    
echo  ██████╔╝██████╔╝ ╚████╔╝ ██║  ██║██║ ╚████║╚██████╗███████╗██████╔╝    
echo  ╚═════╝ ╚═════╝   ╚═══╝  ╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝╚══════╝╚═════╝     
echo.
echo  ███████╗██╗   ██╗███████╗████████╗███████╗███╗   ███╗                  
echo  ██╔════╝╚██╗ ██╔╝██╔════╝╚══██╔══╝██╔════╝████╗ ████║                  
echo  ███████╗ ╚████╔╝ ███████╗   ██║   █████╗  ██╔████╔██║                  
echo  ╚════██║  ╚██╔╝  ╚════██║   ██║   ██╔══╝  ██║╚██╔╝██║                  
echo  ███████║   ██║   ███████║   ██║   ███████╗██║ ╚═╝ ██║                  
echo  ╚══════╝   ╚═╝   ╚══════╝   ╚═╝   ╚══════╝╚═╝     ╚═╝                  
echo.
echo  ███╗   ███╗ █████╗ ██╗███╗   ██╗████████╗███████╗███╗   ██╗ █████╗ ███╗   ██╗ ██████╗███████╗
echo  ████╗ ████║██╔══██╗██║████╗  ██║╚══██╔══╝██╔════╝████╗  ██║██╔══██╗████╗  ██║██╔════╝██╔════╝
echo  ██╔████╔██║███████║██║██╔██╗ ██║   ██║   █████╗  ██╔██╗ ██║███████║██╔██╗ ██║██║     █████╗  
echo  ██║╚██╔╝██║██╔══██║██║██║╚██╗██║   ██║   ██╔══╝  ██║╚██╗██║██╔══██║██║╚██╗██║██║     ██╔══╝  
echo  ██║ ╚═╝ ██║██║  ██║██║██║ ╚████║   ██║   ███████╗██║ ╚████║██║  ██║██║ ╚████║╚██████╗███████╗
echo  ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝   ╚═╝   ╚══════╝╚═╝  ╚═══╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝╚══════╝
echo.
echo                                   Created by Abdelhakim Baalla
echo                                https://abdelhakim-baalla.vercel.app/
echo.
echo  ╔════════════════════════════════════════════════════════════════════════════════════════════════╗
echo  ║                                    MAIN CONTROL PANEL                                         ║
echo  ╚════════════════════════════════════════════════════════════════════════════════════════════════╝
echo.
echo   [1] 🧹 System Cleanup Tools              [8] 🌐 Network Optimization
echo   [2] ⚡ Performance Optimization          [9] 💾 Storage Management  
echo   [3] 🔄 System Updates Manager            [A] 🔧 Advanced System Tools
echo   [4] 🛡️ Security & Privacy Tools          [B] 💻 Developer Tools
echo   [5] 🔍 System Diagnostics                [C] 🎮 Gaming Optimization
echo   [6] 📊 System Monitoring                 [D] 🔮 Custom Commands
echo   [7] 🔧 System Repair Tools               [E] ⚙️ Configuration
echo.
echo   [L] 📋 View Logs                         [H] ❓ Help & About
echo   [X] 🚪 Exit Suite
echo.
echo  ╔════════════════════════════════════════════════════════════════════════════════════════════════╗
echo  ║  System Status: %date% %time%                                                          ║
echo  ╚════════════════════════════════════════════════════════════════════════════════════════════════╝
echo.
set /p choice="Enter your choice: "

if /i "%choice%"=="1" call .\tools\cleanup\cleanup-master.bat
if /i "%choice%"=="2" call .\tools\optimization\optimization-master.bat
if /i "%choice%"=="3" call .\tools\updates\update-master.bat
if /i "%choice%"=="4" call .\tools\security\security-master.bat
if /i "%choice%"=="5" call .\tools\repair\diagnostics-master.bat
if /i "%choice%"=="6" call .\tools\monitoring\monitoring-master.bat
if /i "%choice%"=="7" call .\tools\repair\repair-master.bat
if /i "%choice%"=="8" call .\tools\network\network-master.bat
if /i "%choice%"=="9" call .\tools\storage\storage-master.bat
if /i "%choice%"=="A" call .\tools\advanced\advanced-tools.bat
if /i "%choice%"=="B" call .\tools\developer\developer-tools.bat
if /i "%choice%"=="C" call .\tools\gaming\gaming-optimization.bat
if /i "%choice%"=="D" call .\tools\custom\custom-commands.bat
if /i "%choice%"=="E" call .\config\config-manager.bat
if /i "%choice%"=="L" goto VIEW_LOGS
if /i "%choice%"=="H" goto HELP_ABOUT
if /i "%choice%"=="X" goto EXIT_SUITE

goto MAIN_MENU

:VIEW_LOGS
cls
color 0F
echo.
echo  ╔════════════════════════════════════════════════════════════════════════════════╗
echo  ║                               VIEW LOGS                                        ║
echo  ╚════════════════════════════════════════════════════════════════════════════════╝
echo.
echo Available log files:
echo.
dir logs\*.txt /b 2>nul
echo.
echo [1] View Current Session Log
echo [2] View All Logs
echo [3] Clear All Logs
echo [4] Export Logs
echo [0] Back to Main Menu
echo.
set /p log_choice="Enter your choice: "

if "%log_choice%"=="1" (
    echo.
    echo Current Session Log:
    echo ===================
    type "%log_file%" 2>nul || echo No log file found for current session.
)

if "%log_choice%"=="2" (
    echo.
    echo All Log Files:
    echo =============
    for %%f in (logs\*.txt) do (
        echo.
        echo ---- %%f ----
        type "%%f"
        echo.
    )
)

if "%log_choice%"=="3" (
    echo.
    echo Are you sure you want to clear all logs? (Y/N):
    set /p confirm=""
    if /i "%confirm%"=="Y" (
        del logs\*.txt >nul 2>&1
        echo All logs cleared successfully!
    )
)

echo.
pause
goto MAIN_MENU

:HELP_ABOUT
cls
color 0E
echo.
echo  ██╗  ██╗███████╗██╗     ██████╗     ███████╗██╗   ██╗███████╗████████╗███████╗███╗   ███╗
echo  ██║  ██║██╔════╝██║     ██╔══██╗    ██╔════╝╚██╗ ██╔╝██╔════╝╚══██╔══╝██╔════╝████╗ ████║
echo  ███████║█████╗  ██║     ██████╔╝    ███████╗ ╚████╔╝ ███████╗   ██║   █████╗  ██╔████╔██║
echo  ██╔══██║██╔══╝  ██║     ██╔═══╝     ╚════██║  ╚██╔╝  ╚════██║   ██║   ██╔══╝  ██║╚██╔╝██║
echo  ██║  ██║███████╗███████╗██║         ███████║   ██║   ███████║   ██║   ███████╗██║ ╚═╝ ██║
echo  ╚═╝  ╚═╝╚══════╝╚══════╝╚═╝         ╚══════╝   ╚═╝   ╚══════╝   ╚═╝   ╚══════╝╚═╝     ╚═╝
echo.
echo                             Created by Abdelhakim Baalla
echo                          https://abdelhakim-baalla.vercel.app/
echo.
echo  ╔════════════════════════════════════════════════════════════════════════════════╗
echo  ║                           HELP & ABOUT                                         ║
echo  ╚════════════════════════════════════════════════════════════════════════════════╝
echo.
echo Advanced System Maintenance Suite v3.0
echo =====================================
echo.
echo This comprehensive toolkit provides advanced system optimization,
echo cleanup, security, and maintenance tools for Windows systems.
echo.
echo Features:
echo --------
echo • System Cleanup Tools - Remove junk files and optimize storage
echo • Performance Optimization - Boost system speed and responsiveness  
echo • Gaming Optimization - Enhance gaming performance and reduce lag
echo • Network Optimization - Improve internet speed and connectivity
echo • Developer Tools - Git, Node.js, Python, and utility tools
echo • System Monitoring - Real-time performance tracking
echo • Security Tools - Privacy and security enhancements
echo • Comprehensive Logging - Track all operations and changes
echo.
echo System Requirements:
echo ------------------
echo • Windows 10/11 (Administrator privileges required)
echo • PowerShell 5.1 or later
echo • .NET Framework 4.7.2 or later
echo • 100 MB free disk space
echo.
echo Developer Information:
echo ====================
echo Name: Abdelhakim Baalla
echo Title: Full-Stack Developer
echo Location: Agadir, Morocco
echo Portfolio: https://abdelhakim-baalla.vercel.app/
echo.
echo Expertise:
echo • Full-Stack Web Development (React, Next.js, Node.js)
echo • System Administration & Optimization
echo • Performance Tuning & Security Implementation
echo • Automation & Scripting (PowerShell, Batch, Python)
echo • DevOps & Cloud Technologies
echo.
echo Version History:
echo ==============
echo v3.0 - Complete restructure with enhanced features
echo v2.5 - Added gaming and network optimization
echo v2.0 - Deep cleanup and performance tools
echo v1.0 - Initial release
echo.
echo License: MIT License
echo.
echo For support and updates, visit:
echo https://abdelhakim-baalla.vercel.app/
echo.
echo Thank you for using Advanced System Maintenance Suite!
echo.
pause
goto MAIN_MENU

:EXIT_SUITE
cls
color 0C
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                      Shutting down Advanced System Maintenance Suite...
echo.
echo                                 Created by Abdelhakim Baalla
echo.
echo                      Thank you for using our professional tools!
echo.
echo                      https://abdelhakim-baalla.vercel.app/
timeout /t 2 /nobreak >nul

:: Final exit animation
for /l %%i in (3,-1,1) do (
    cls
    echo.
    echo.
    echo.
    echo.
    echo.
    echo.
    echo.
    echo.
    echo.
    echo.
    echo                      Shutting down Advanced System Maintenance Suite...
    echo.
    echo                                 Created by Abdelhakim Baalla
    echo.
    echo                      System will exit in %%i seconds...
    echo.
    echo                      https://abdelhakim-baalla.vercel.app/
    timeout /t 1 /nobreak >nul
)

cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                      ╔══════════════════════════════════════════════════════════════╗
echo                      ║              SYSTEM SHUTDOWN COMPLETE                       ║
echo                      ║                                                              ║
echo                      ║                Created by Abdelhakim Baalla                 ║
echo                      ║            https://abdelhakim-baalla.vercel.app/            ║
echo                      ║                                                              ║
echo                      ║                    Goodbye and thank you!                   ║
echo                      ╚══════════════════════════════════════════════════════════════╝
echo.
echo Session ended at %date% %time% >> "%log_file%"
echo ============================================================================ >> "%log_file%"
timeout /t 3 /nobreak >nul
color 07
exit /b
