@echo off
REM Advanced Tools Menu
color 05
mode con: cols=100 lines=35
:ADVANCED_MENU
cls
echo.
echo  ========================================================================
echo                          ADVANCED SYSTEM TOOLS
echo                        Professional Grade Utilities
echo  ========================================================================
echo.
echo  ----------------------------------------------------------------
echo   [1] System Forensics & Analysis
echo   [2] Advanced Registry Tools
echo   [3] Memory Dump Analysis
echo   [4] Process Injection Detection
echo   [5] System Integrity Verification
echo   [6] Advanced Disk Tools
echo   [7] Network Packet Analysis
echo   [8] System Performance Profiling
echo   [9] Windows Event Log Analysis
echo   [A] System Configuration Backup
echo   [B] Driver Analysis Tools
echo   [C] System Vulnerability Scanner
echo   [D] Advanced Troubleshooting
echo   [E] System Optimization Profiles
echo   [F] Emergency Recovery Tools
echo   [0] Back to Main Menu
echo  ----------------------------------------------------------------
echo.
set /p choice="Select advanced tool: "
set "target="
if /i "%choice%"=="1" set "target=system-forensics.bat"
if /i "%choice%"=="2" set "target=registry-tools.bat"
if /i "%choice%"=="3" set "target=memory-dump.bat"
if /i "%choice%"=="4" set "target=process-injection.bat"
if /i "%choice%"=="5" set "target=integrity-check.bat"
if /i "%choice%"=="6" set "target=advanced-disk.bat"
if /i "%choice%"=="7" set "target=packet-analysis.bat"
if /i "%choice%"=="8" set "target=performance-profile.bat"
if /i "%choice%"=="9" set "target=event-analysis.bat"
if /i "%choice%"=="A" set "target=config-backup.bat"
if /i "%choice%"=="B" set "target=driver-analysis.bat"
if /i "%choice%"=="C" set "target=vulnerability-scan.bat"
if /i "%choice%"=="D" set "target=advanced-troubleshoot.bat"
if /i "%choice%"=="E" set "target=optimization-profiles.bat"
if /i "%choice%"=="F" set "target=emergency-recovery.bat"
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

goto ADVANCED_MENU
