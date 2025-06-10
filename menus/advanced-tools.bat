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
if /i "%choice%"=="1" call ..\advanced-tools\system-forensics.bat
if /i "%choice%"=="2" call ..\advanced-tools\registry-tools.bat
if /i "%choice%"=="3" call ..\advanced-tools\memory-dump.bat
if /i "%choice%"=="4" call ..\advanced-tools\process-injection.bat
if /i "%choice%"=="5" call ..\advanced-tools\integrity-check.bat
if /i "%choice%"=="6" call ..\advanced-tools\advanced-disk.bat
if /i "%choice%"=="7" call ..\advanced-tools\packet-analysis.bat
if /i "%choice%"=="8" call ..\advanced-tools\performance-profile.bat
if /i "%choice%"=="9" call ..\advanced-tools\event-analysis.bat
if /i "%choice%"=="A" call ..\advanced-tools\config-backup.bat
if /i "%choice%"=="B" call ..\advanced-tools\driver-analysis.bat
if /i "%choice%"=="C" call ..\advanced-tools\vulnerability-scan.bat
if /i "%choice%"=="D" call ..\advanced-tools\advanced-troubleshoot.bat
if /i "%choice%"=="E" call ..\advanced-tools\optimization-profiles.bat
if /i "%choice%"=="F" call ..\advanced-tools\emergency-recovery.bat
if /i "%choice%"=="0" exit /b
call ..\animation-utils.bat :MATRIX_ANIMATION
goto ADVANCED_MENU
