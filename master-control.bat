@echo off
title Advanced System Maintenance Suite - By Abdelhakim Baalla
mode con: cols=100 lines=35
color 0A
setlocal enabledelayedexpansion

:: Check for admin privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Administrator privileges required!
    echo Right-click and select "Run as administrator"
    pause
    exit /b
)

:: Create folder structure if it doesn't exist
if not exist ".\animations" mkdir ".\animations"
if not exist ".\tools" mkdir ".\tools"
if not exist ".\tools\cleanup" mkdir ".\tools\cleanup"
if not exist ".\tools\optimization" mkdir ".\tools\optimization"
if not exist ".\tools\security" mkdir ".\tools\security"
if not exist ".\tools\network" mkdir ".\tools\network"
if not exist ".\tools\storage" mkdir ".\tools\storage"
if not exist ".\tools\developer" mkdir ".\tools\developer"
if not exist ".\tools\advanced" mkdir ".\tools\advanced"
if not exist ".\tools\custom" mkdir ".\tools\custom"
if not exist ".\logs" mkdir ".\logs"
if not exist ".\config" mkdir ".\config"

:: Set path to include our tools
set "PATH=%PATH%;%~dp0;%~dp0\tools"

:: Run intro animation
call .\animations\intro.bat

:MAIN_MENU
cls
call .\animations\matrix.vbs
cls
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
echo                                 Created by Abdelhakim Baalla
echo                          https://abdelhakim-baalla.vercel.app/
echo.
echo  ╔════════════════════════════════════════════════════════════════════════════════╗
echo  ║                             MAIN CONTROL PANEL                                 ║
echo  ╚════════════════════════════════════════════════════════════════════════════════╝
echo.
echo   [1] 🧹 System Cleanup Tools          [7] 🎮 Gaming Optimization
echo   [2] ⚡ Performance Optimization      [8] 🌐 Network Tools
echo   [3] 🔄 System Updates Manager        [9] 💾 Storage Management
echo   [4] 🛡️ Security & Privacy Tools      [A] 🔧 Advanced System Tools
echo   [5] 🔍 System Diagnostics            [B] 💻 Developer Tools
echo   [6] 📊 System Monitoring             [C] 🔮 Custom Commands
echo.
echo   [D] ⚙️ Configuration                 [U] 📱 Check for Updates
echo   [L] 📋 View Logs                     [H] ❓ Help & Documentation
echo   [X] 🚪 Exit
echo.
echo  ╔════════════════════════════════════════════════════════════════════════════════╗
echo  ║  System Status: %date% %time%                                          ║
echo  ╚════════════════════════════════════════════════════════════════════════════════╝
echo.
set /p choice="Enter your choice: "

if /i "%choice%"=="1" call .\tools\cleanup\cleanup-master.bat
if /i "%choice%"=="2" call .\tools\optimization\optimization-master.bat
if /i "%choice%"=="3" call .\tools\update-master.bat
if /i "%choice%"=="4" call .\tools\security\security-master.bat
if /i "%choice%"=="5" call .\tools\diagnostics-master.bat
if /i "%choice%"=="6" call .\tools\monitoring-master.bat
if /i "%choice%"=="7" call .\tools\optimization\gaming-optimization.bat
if /i "%choice%"=="8" call .\tools\network\network-master.bat
if /i "%choice%"=="9" call .\tools\storage\storage-master.bat
if /i "%choice%"=="A" call .\tools\advanced\advanced-tools.bat
if /i "%choice%"=="B" call .\tools\developer\developer-tools.bat
if /i "%choice%"=="C" call .\tools\custom\custom-commands.bat
if /i "%choice%"=="D" call .\config\config-manager.bat
if /i "%choice%"=="U" call .\tools\update-checker.bat
if /i "%choice%"=="L" call .\tools\log-viewer.bat
if /i "%choice%"=="H" call .\tools\help-system.bat
if /i "%choice%"=="X" goto EXIT

goto MAIN_MENU

:EXIT
cls
call .\animations\exit.bat
exit /b
