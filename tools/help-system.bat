@echo off
title Help & Documentation - By Abdelhakim Baalla
color 0E
mode con: cols=100 lines=35
setlocal enabledelayedexpansion

call core\animation-utils.bat :INTRO_ANIMATION
set "log_file=logs\help_%date:~-4,4%%date:~-7,2%%date:~-10,2%_%time:~0,2%%time:~3,2%%time:~6,2%.log"
set "log_file=%log_file: =0%"
echo Help System - Log started at %date% %time% > "%log_file%"

:HELP_MENU
cls
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
echo  ║                           HELP & DOCUMENTATION                                 ║
echo  ╚════════════════════════════════════════════════════════════════════════════════╝
echo.
echo   [1] Getting Started Guide
echo   [2] Tool Documentation
echo   [3] Troubleshooting
echo   [4] FAQ
echo   [5] System Requirements
echo   [6] Contact Information
echo   [7] About the Developer
echo   [8] Version History
echo   [9] License Information
echo   [0] Back to Main Menu
echo.
set /p choice="Enter your choice: "

if /i "%choice%"=="1" goto GETTING_STARTED
if /i "%choice%"=="2" goto TOOL_DOCS
if /i "%choice%"=="3" goto TROUBLESHOOTING
if /i "%choice%"=="4" goto FAQ
if /i "%choice%"=="5" goto SYSTEM_REQUIREMENTS
if /i "%choice%"=="6" goto CONTACT_INFO
if /i "%choice%"=="7" goto ABOUT_DEVELOPER
if /i "%choice%"=="8" goto VERSION_HISTORY
if /i "%choice%"=="9" goto LICENSE_INFO
if /i "%choice%"=="0" exit /b

goto HELP_MENU

:GETTING_STARTED
cls
echo.
echo  ╔════════════════════════════════════════════════════════════════════════════════╗
echo  ║                           GETTING STARTED GUIDE                                ║
echo  ╚════════════════════════════════════════════════════════════════════════════════╝
echo.
echo Welcome to the Advanced System Maintenance Suite!
echo ================================================
echo.
echo This comprehensive toolkit provides advanced system optimization,
echo cleanup, security, and maintenance tools for Windows systems.
echo.
echo Quick Start:
echo -----------
echo 1. Run master-control.bat as Administrator
echo 2. Select the tool category you need
echo 3. Follow the on-screen instructions
echo 4. Review logs in the logs folder
echo.
echo Important Notes:
echo ---------------
echo - Always run as Administrator for full functionality
echo - Create system restore points before major changes
echo - Review logs after each operation
echo - Keep backups of important configurations
echo.
echo Folder Structure:
echo ----------------
echo master-control.bat     - Main executable
echo tools/                 - All tool categories
echo animations/            - Animation scripts
echo logs/                  - Operation logs
echo config/                - Configuration files
echo backups/               - System backups
echo.
echo Press any key to return to the Help Menu...
pause >nul
goto HELP_MENU

:ABOUT_DEVELOPER
cls
echo.
echo  ╔════════════════════════════════════════════════════════════════════════════════╗
echo  ║                           ABOUT THE DEVELOPER                                  ║
echo  ╚════════════════════════════════════════════════════════════════════════════════╝
echo.
echo Developer Information:
echo =====================
echo.
echo Name: Abdelhakim Baalla
echo Title: Full-Stack Developer
echo Location: Agadir, Morocco
echo.
echo Portfolio: https://abdelhakim-baalla.vercel.app/
echo.
echo Expertise:
echo ---------
echo - Full-Stack Web Development
echo - System Administration
echo - Performance Optimization
echo - Security Implementation
echo - Automation & Scripting
echo.
echo Technologies:
echo ------------
echo - Frontend: React, Next.js, TypeScript, Tailwind CSS
echo - Backend: Node.js, Python, PHP
echo - Databases: MongoDB, MySQL, PostgreSQL
echo - DevOps: Docker, CI/CD, Cloud Platforms
echo - System Tools: PowerShell, Batch, Linux Shell
echo.
echo About This Project:
echo ==================
echo This Advanced System Maintenance Suite was created to provide
echo Windows users with professional-grade system optimization tools.
echo The suite combines years of system administration experience
echo with modern automation techniques.
echo.
echo Features include:
echo - Advanced system cleanup and optimization
echo - Gaming performance enhancements
echo - Network optimization tools
echo - Developer utilities
echo - Security hardening options
echo - Comprehensive monitoring and diagnostics
echo.
echo The project is continuously updated with new features and
echo improvements based on user feedback and emerging technologies.
echo.
echo Press any key to return to the Help Menu...
pause >nul
goto HELP_MENU

:SYSTEM_REQUIREMENTS
cls
echo.
echo  ╔════════════════════════════════════════════════════════════════════════════════╗
echo  ║                           SYSTEM REQUIREMENTS                                  ║
echo  ╚════════════════════════════════════════════════════════════════════════════════╝
echo.
echo Minimum System Requirements:
echo ===========================
echo.
echo Operating System:
echo - Windows 10 (version 1903 or later)
echo - Windows 11 (all versions)
echo - Windows Server 2019/2022
echo.
echo Hardware:
echo - CPU: Intel/AMD 64-bit processor
echo - RAM: 4 GB minimum, 8 GB recommended
echo - Storage: 100 MB free space for the suite
echo - Network: Internet connection for updates
echo.
echo Software Dependencies:
echo =====================
echo - PowerShell 5.1 or later (included in Windows)
echo - .NET Framework 4.7.2 or later
echo - Windows Management Framework
echo.
echo Permissions:
echo ===========
echo - Administrator privileges required
echo - UAC (User Account Control) enabled
echo - Windows Defender or antivirus exclusions may be needed
echo.
echo Optional Components:
echo ===================
echo For Developer Tools:
echo - Git for Windows
echo - Node.js (for JavaScript development)
echo - Python (for Python development)
echo - Docker Desktop (for container tools)
echo.
echo For Gaming Optimization:
echo - DirectX 12
echo - Visual C++ Redistributables
echo - Latest graphics drivers
echo.
echo Compatibility Notes:
echo ===================
echo - Some features require specific Windows versions
echo - Enterprise/Pro editions provide additional functionality
echo - Virtual machines may have limited functionality
echo - Antivirus software may interfere with some operations
echo.
echo Press any key to return to the Help Menu...
pause >nul
goto HELP_MENU

:VERSION_HISTORY
cls
echo.
echo  ╔════════════════════════════════════════════════════════════════════════════════╗
echo  ║                            VERSION HISTORY                                     ║
echo  ╚════════════════════════════════════════════════════════════════════════════════╝
echo.
echo Advanced System Maintenance Suite - Version History
echo ==================================================
echo.
echo Version 3.0 (Current) - December 2024
echo -------------------------------------
echo + Complete restructure with organized folder system
echo + Enhanced animations and visual effects
echo + Advanced gaming optimization tools
echo + Comprehensive network optimization
echo + Developer tools suite
echo + Real-time performance monitoring
echo + Configuration management system
echo + Improved logging and error handling
echo + Professional UI with ASCII art
echo + Backup and restore functionality
echo.
echo Version 2.5 - November 2024
echo ---------------------------
echo + Added gaming optimization module
echo + Network tools and diagnostics
echo + Storage management utilities
echo + Custom command center
echo + Advanced system tools
echo + Developer information integration
echo + Improved animations
echo.
echo Version 2.0 - October 2024
echo --------------------------
echo + Deep system cleanup tools
echo + Performance optimization suite
echo + Security and privacy tools
echo + System repair and diagnostics
echo + Registry optimization
echo + SSD-specific optimizations
echo.
echo Version 1.0 - September 2024
echo ----------------------------
echo + Initial release
echo + Basic cleanup functionality
echo + Simple optimization tools
echo + Command-line interface
echo.
echo Upcoming Features (Version 3.1):
echo ===============================
echo - Cloud backup integration
echo - Remote system management
echo - AI-powered optimization
echo - Mobile companion app
echo - Advanced security scanning
echo - Custom automation scripts
echo.
echo Press any key to return to the Help Menu...
pause >nul
goto HELP_MENU
