@echo off
REM System Repair & Diagnostics Suite
color 0F
mode con: cols=100 lines=35
:REPAIR_MENU
cls
echo.
echo  ╔════════════════════════════════════════════════════════════════════════════════════════╗
echo  ║                          SYSTEM REPAIR & DIAGNOSTICS                                ║
echo  ║                              Advanced Recovery Tools                                ║
echo  ╚════════════════════════════════════════════════════════════════════════════════════════╝
echo.
echo  ┌───────────────────────────────────────────────────────────────────────────────────────┐
echo  │  [1] System File Checker (SFC Scan)                                                 │
echo  │  [2] DISM Image Repair                                                              │
echo  │  [3] Memory Diagnostic                                                              │
echo  │  [4] Disk Check & Repair                                                            │
echo  │  [5] System Restore Point                                                           │
echo  │  [6] Network Reset & Repair                                                         │
echo  │  [7] Complete System Health Check                                                   │
echo  │  [8] Emergency System Recovery                                                      │
echo  │  [9] Generate Diagnostic Report                                                     │
echo  │  [0] Back to Main Menu                                                              │
echo  └───────────────────────────────────────────────────────────────────────────────────────┘
echo.
set /p choice=Votre choix : 
set "target="
if /i "%choice%"=="1" set "target=sfc-scan.bat"
if /i "%choice%"=="2" set "target=dism-repair.bat"
if /i "%choice%"=="3" set "target=memory-diagnostic.bat"
if /i "%choice%"=="4" set "target=disk-repair.bat"
if /i "%choice%"=="5" set "target=restore-point.bat"
if /i "%choice%"=="6" set "target=network-reset.bat"
if /i "%choice%"=="7" set "target=health-check.bat"
if /i "%choice%"=="8" set "target=emergency-recovery.bat"
if /i "%choice%"=="9" set "target=diagnostic-report.bat"
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

goto REPAIR_MENU
