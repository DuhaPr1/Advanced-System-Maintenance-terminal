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
set /p choice=Votre choix : 
set "target="
if /i "%choice%"=="1" set "target=disk-analysis.bat"
if /i "%choice%"=="2" set "target=disk-cleanup.bat"
if /i "%choice%"=="3" set "target=disk-health.bat"
if /i "%choice%"=="4" set "target=partition-mgmt.bat"
if /i "%choice%"=="5" set "target=drive-format.bat"
if /i "%choice%"=="6" set "target=filesystem-opt.bat"
if /i "%choice%"=="7" set "target=large-file-finder.bat"
if /i "%choice%"=="8" set "target=duplicate-finder.bat"
if /i "%choice%"=="9" set "target=defrag.bat"
if /i "%choice%"=="A" set "target=ssd-opt.bat"
if /i "%choice%"=="B" set "target=disk-benchmark.bat"
if /i "%choice%"=="C" set "target=storage-spaces.bat"
if /i "%choice%"=="D" set "target=backup-config.bat"
if /i "%choice%"=="E" set "target=disk-encryption.bat"
if /i "%choice%"=="F" set "target=advanced-storage.bat"
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

goto STORAGE_MENU
