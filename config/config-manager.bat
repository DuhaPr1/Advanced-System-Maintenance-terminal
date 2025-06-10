@echo off
title Configuration Manager - By Abdelhakim Baalla
color 0F
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

:: Create config file if it doesn't exist
if not exist "suite_config.ini" (
echo [General] > suite_config.ini
echo Version=3.0 >> suite_config.ini
echo Author=Abdelhakim Baalla >> suite_config.ini
echo Website=https://abdelhakim-baalla.vercel.app/ >> suite_config.ini
echo AutoUpdate=true >> suite_config.ini
echo LogLevel=INFO >> suite_config.ini
echo. >> suite_config.ini
echo [Animations] >> suite_config.ini
echo EnableAnimations=true >> suite_config.ini
echo AnimationSpeed=normal >> suite_config.ini
echo. >> suite_config.ini
echo [Cleanup] >> suite_config.ini
echo AutoCleanup=false >> suite_config.ini
echo CleanupSchedule=weekly >> suite_config.ini
echo. >> suite_config.ini
echo [Security] >> suite_config.ini
echo CreateBackups=true >> suite_config.ini
echo BackupLocation=..\backups >> suite_config.ini
)

:CONFIG_MENU
cls
echo.
echo   ██████╗ ██████╗ ███╗   ██╗███████╗██╗ ██████╗ 
echo  ██╔════╝██╔═══██╗████╗  ██║██╔════╝██║██╔════╝ 
echo  ██║     ██║   ██║██╔██╗ ██║█████╗  ██║██║  ███╗
echo  ██║     ██║   ██║██║╚██╗██║██╔══╝  ██║██║   ██║
echo  ╚██████╗╚██████╔╝██║ ╚████║██║     ██║╚██████╔╝
echo   ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝     ╚═╝ ╚═════╝ 
echo.
echo                             Created by Abdelhakim Baalla
echo                          https://abdelhakim-baalla.vercel.app/
echo.
echo  ╔════════════════════════════════════════════════════════════════════════════════╗
echo  ║                           CONFIGURATION MANAGER                                ║
echo  ╚════════════════════════════════════════════════════════════════════════════════╝
echo.
echo   [1] View Current Configuration
echo   [2] Animation Settings
echo   [3] Cleanup Settings
echo   [4] Security Settings
echo   [5] Logging Settings
echo   [6] Performance Settings
echo   [7] Backup Configuration
echo   [8] Reset to Defaults
echo   [9] Export Configuration
echo   [A] Import Configuration
echo   [0] Back to Main Menu
echo.
set /p choice="Enter your choice: "

if "%choice%"=="1" goto VIEW_CONFIG
if "%choice%"=="2" goto ANIMATION_SETTINGS
if "%choice%"=="3" goto CLEANUP_SETTINGS
if "%choice%"=="4" goto SECURITY_SETTINGS
if "%choice%"=="5" goto LOGGING_SETTINGS
if "%choice%"=="6" goto PERFORMANCE_SETTINGS
if "%choice%"=="7" goto BACKUP_CONFIG
if "%choice%"=="8" goto RESET_DEFAULTS
if "%choice%"=="9" goto EXPORT_CONFIG
if /i "%choice%"=="A" goto IMPORT_CONFIG
if "%choice%"=="0" exit /b

goto CONFIG_MENU

:VIEW_CONFIG
cls
echo.
echo  ╔════════════════════════════════════════════════════════════════════════════════╗
echo  ║                          CURRENT CONFIGURATION                                 ║
echo  ╚════════════════════════════════════════════════════════════════════════════════╝
echo.
echo Current Configuration Settings:
echo ==============================
echo.
type suite_config.ini
echo.
echo Press any key to return to the Configuration Menu...
pause >nul
goto CONFIG_MENU

:RESET_DEFAULTS
cls
echo.
echo  ╔════════════════════════════════════════════════════════════════════════════════╗
echo  ║                           RESET TO DEFAULTS                                    ║
echo  ╚════════════════════════════════════════════════════════════════════════════════╝
echo.
echo WARNING: This will reset ALL configuration settings to default values.
echo This action cannot be undone.
echo.
set /p confirm="Are you sure you want to reset to defaults? (Y/N): "

if /i "%confirm%"=="Y" (
echo.
echo Resetting configuration to defaults...

echo [General] > suite_config.ini
echo Version=3.0 >> suite_config.ini
echo Author=Abdelhakim Baalla >> suite_config.ini
echo Website=https://abdelhakim-baalla.vercel.app/ >> suite_config.ini
echo AutoUpdate=true >> suite_config.ini
echo LogLevel=INFO >> suite_config.ini
echo. >> suite_config.ini
echo [Animations] >> suite_config.ini
echo EnableAnimations=true >> suite_config.ini
echo AnimationSpeed=normal >> suite_config.ini
echo. >> suite_config.ini
echo [Cleanup] >> suite_config.ini
echo AutoCleanup=false >> suite_config.ini
echo CleanupSchedule=weekly >> suite_config.ini
echo. >> suite_config.ini
echo [Security] >> suite_config.ini
echo CreateBackups=true >> suite_config.ini
echo BackupLocation=..\backups >> suite_config.ini

echo Configuration reset to defaults successfully!
)

echo.
echo Press any key to return to the Configuration Menu...
pause >nul
goto CONFIG_MENU
