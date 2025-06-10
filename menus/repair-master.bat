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
set /p choice="Select repair option (0-9): "
if /i "%choice%"=="1" call ..\advanced-tools\sfc-scan.bat
if /i "%choice%"=="2" call ..\advanced-tools\dism-repair.bat
if /i "%choice%"=="3" call ..\advanced-tools\memory-diagnostic.bat
if /i "%choice%"=="4" call ..\advanced-tools\disk-repair.bat
if /i "%choice%"=="5" call ..\advanced-tools\restore-point.bat
if /i "%choice%"=="6" call ..\advanced-tools\network-reset.bat
if /i "%choice%"=="7" call ..\advanced-tools\health-check.bat
if /i "%choice%"=="8" call ..\advanced-tools\emergency-recovery.bat
if /i "%choice%"=="9" call ..\advanced-tools\diagnostic-report.bat
if "%choice%"=="0" exit /b
REM ...ajoute ici les goto pour chaque option si besoin...
call ..\animation-utils.bat :MATRIX_ANIMATION
goto REPAIR_MENU
