@echo off
title Configuration Manager - By Abdelhakim Baalla
color 0F
mode con: cols=100 lines=35
setlocal enabledelayedexpansion

call ..\core\animation-utils.bat :INTRO_ANIMATION
set "log_file=..\logs\config_%date:~-4,4%%date:~-7,2%%date:~-10,2%_%time:~0,2%%time:~3,2%%time:~6,2%.log"
set "log_file=%log_file: =0%"
echo Config Manager - Log started at %date% %time% > "%log_file%"

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
echo  ╔════════════════════════════════════════════════════════════════════════════════╗
echo  ║  Configuration Status: Loaded                                                  ║
echo  ╚════════════════════════════════════════════════════════════════════════════════╝
echo.
set /p choice="Enter your choice: "

if /i "%choice%"=="1" goto VIEW_CONFIG
if /i "%choice%"=="2" goto ANIMATION_SETTINGS
if /i "%choice%"=="3" goto CLEANUP_SETTINGS
if /i "%choice%"=="4" goto SECURITY_SETTINGS
if /i "%choice%"=="5" goto LOGGING_SETTINGS
if /i "%choice%"=="6" goto PERFORMANCE_SETTINGS
if /i "%choice%"=="7" goto BACKUP_CONFIG
if /i "%choice%"=="8" goto RESET_DEFAULTS
if /i "%choice%"=="9" goto EXPORT_CONFIG
if /i "%choice%"=="A" goto IMPORT_CONFIG
if /i "%choice%"=="0" exit /b

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

:ANIMATION_SETTINGS
cls
echo.
echo  ╔════════════════════════════════════════════════════════════════════════════════╗
echo  ║                           ANIMATION SETTINGS                                   ║
echo  ╚════════════════════════════════════════════════════════════════════════════════╝
echo.
echo Current Animation Settings:
findstr /C:"EnableAnimations" suite_config.ini
findstr /C:"AnimationSpeed" suite_config.ini
echo.
echo [1] Enable/Disable Animations
echo [2] Change Animation Speed
echo [3] Test Animations
echo [0] Back to Configuration Menu
echo.
set /p anim_choice=""

if "%anim_choice%"=="1" (
    echo.
    echo Enable animations? (Y/N):
    set /p enable_anim=""
    if /i "%enable_anim%"=="Y" (
        powershell -Command "(Get-Content suite_config.ini) -replace 'EnableAnimations=.*', 'EnableAnimations=true' | Set-Content suite_config.ini"
        echo Animations enabled!
    ) else (
        powershell -Command "(Get-Content suite_config.ini) -replace 'EnableAnimations=.*', 'EnableAnimations=false' | Set-Content suite_config.ini"
        echo Animations disabled!
    )
)

if "%anim_choice%"=="3" (
    echo.
    echo Testing animations...
    powershell -Command "$host.UI.RawUI.BackgroundColor = 'Black'; $host.UI.RawUI.ForegroundColor = 'Green'; Write-Host ''; Write-Host ' ANIMATION TEST'; Write-Host ' ============'; Write-Host ''; for ($i = 0; $i -lt 10; $i++) { Write-Host (' > Test animation frame ' + $i) -ForegroundColor Green; Start-Sleep -Milliseconds 200; }; Write-Host ''; Write-Host ' Animation test complete!'; Write-Host '';"
)

echo.
echo Press any key to continue...
pause >nul
goto ANIMATION_SETTINGS

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
