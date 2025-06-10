@echo off
REM System Updates Manager
color 0B
mode con: cols=100 lines=35
:UPDATE_MENU
cls
echo.
echo  ╔════════════════════════════════════════════════════════════════════════════════════════╗
echo  ║                              SYSTEM UPDATES MANAGER                                 ║
echo  ║                               Comprehensive Update Suite                            ║
echo  ╚════════════════════════════════════════════════════════════════════════════════════════╝
echo.
echo  ┌───────────────────────────────────────────────────────────────────────────────────────┐
echo  │  [1] Windows Updates (Complete)                                                     │
echo  │  [2] Driver Updates (All Hardware)                                                  │
echo  │  [3] Microsoft Store Apps Update                                                    │
echo  │  [4] Browser Updates (All Browsers)                                                 │
echo  │  [5] Software Updates (Winget)                                                      │
echo  │  [6] Security Updates Priority                                                      │
echo  │  [7] System Component Updates                                                       │
echo  │  [8] Update Status & History                                                        │
echo  │  [9] Configure Auto-Updates                                                         │
echo  │  [0] Back to Main Menu                                                              │
echo  └───────────────────────────────────────────────────────────────────────────────────────┘
echo.
set /p choice="Select update option (0-9): "
if "%choice%"=="0" exit /b
if /i "%choice%"=="1" call ..\advanced-tools\windows-updates.bat
if /i "%choice%"=="2" call ..\advanced-tools\driver-updates.bat
if /i "%choice%"=="3" call ..\advanced-tools\store-updates.bat
if /i "%choice%"=="4" call ..\advanced-tools\browser-updates.bat
if /i "%choice%"=="5" call ..\advanced-tools\software-updates.bat
if /i "%choice%"=="6" call ..\advanced-tools\security-updates.bat
if /i "%choice%"=="7" call ..\advanced-tools\component-updates.bat
if /i "%choice%"=="8" call ..\advanced-tools\update-status.bat
if /i "%choice%"=="9" call ..\advanced-tools\auto-update-config.bat
call ..\animation-utils.bat :MATRIX_ANIMATION
goto UPDATE_MENU
