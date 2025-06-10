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
set "target="
if /i "%choice%"=="1" set "target=windows-updates.bat"
if /i "%choice%"=="2" set "target=driver-updates.bat"
if /i "%choice%"=="3" set "target=store-updates.bat"
if /i "%choice%"=="4" set "target=browser-updates.bat"
if /i "%choice%"=="5" set "target=software-updates.bat"
if /i "%choice%"=="6" set "target=security-updates.bat"
if /i "%choice%"=="7" set "target=component-updates.bat"
if /i "%choice%"=="8" set "target=update-status.bat"
if /i "%choice%"=="9" set "target=auto-update-config.bat"
if /i "%choice%"=="0" exit /b

if defined target (
    if exist "..\advanced-tools\%target%" (
        findstr /C:"À compléter" "..\advanced-tools\%target%" >nul
        if errorlevel 1 (
            call ..\advanced-tools\%target%
        ) else (
            echo.
            echo [ERREUR] Cette fonctionnalité n'est pas encore implémentée.
            pause
        )
    ) else (
        echo.
        echo [ERREUR] Le script cible n'existe pas : ..\advanced-tools\%target%
        pause
    )
)
call ..\animation-utils.bat :MATRIX_ANIMATION

goto UPDATE_MENU
