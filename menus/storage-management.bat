@echo off
REM Storage Management Suite
color 0D
mode con: cols=100 lines=35
setlocal enabledelayedexpansion
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :LOADING_BAR
:STORAGE_MENU
cls
color 0D
echo.
echo  ========================================================================
echo                        STORAGE MANAGEMENT SUITE
echo                      Advanced Disk Optimization
echo  ========================================================================
echo.
echo  ----------------------------------------------------------------
echo   [1] Disk Space Analysis
echo   [2] Disk Cleanup & Optimization
echo   [3] Disk Health Check
echo   [4] Partition Management
echo   [5] Drive Format & Conversion
echo   [6] File System Optimization
echo   [7] Large File Finder
echo   [8] Duplicate File Finder
echo   [9] Disk Defragmentation
echo   [A] SSD Optimization
echo   [B] Disk Benchmark
echo   [C] Storage Spaces Management
echo   [D] Backup Configuration
echo   [E] Disk Encryption
echo   [F] Advanced Storage Settings
echo   [0] Back to Main Menu
echo  ----------------------------------------------------------------
echo.
set /p choice="Select storage option: "
if /i "%choice%"=="1" call ..\advanced-tools\disk-analysis.bat
if /i "%choice%"=="2" call ..\advanced-tools\disk-cleanup.bat
if /i "%choice%"=="3" call ..\advanced-tools\disk-health.bat
if /i "%choice%"=="4" call ..\advanced-tools\partition-mgmt.bat
if /i "%choice%"=="5" call ..\advanced-tools\drive-format.bat
if /i "%choice%"=="6" call ..\advanced-tools\filesystem-opt.bat
if /i "%choice%"=="7" call ..\advanced-tools\large-file-finder.bat
if /i "%choice%"=="8" call ..\advanced-tools\duplicate-finder.bat
if /i "%choice%"=="9" call ..\advanced-tools\defrag.bat
if /i "%choice%"=="A" call ..\advanced-tools\ssd-opt.bat
if /i "%choice%"=="B" call ..\advanced-tools\disk-benchmark.bat
if /i "%choice%"=="C" call ..\advanced-tools\storage-spaces.bat
if /i "%choice%"=="D" call ..\advanced-tools\backup-config.bat
if /i "%choice%"=="E" call ..\advanced-tools\disk-encryption.bat
if /i "%choice%"=="F" call ..\advanced-tools\advanced-storage.bat
if /i "%choice%"=="0" exit /b
call ..\animation-utils.bat :MATRIX_ANIMATION
goto STORAGE_MENU
