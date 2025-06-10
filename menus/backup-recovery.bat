@echo off
REM Backup & Recovery Suite
color 0B
mode con: cols=100 lines=35
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :LOADING_BAR
:BACKUP_MENU
cls
color 0B
echo.
echo  ========================================================================
echo                        BACKUP & RECOVERY SUITE
echo                      Advanced Backup & Restore
echo  ========================================================================
echo.
echo  ----------------------------------------------------------------
echo   [1] System Configuration Backup
echo   [2] Create Restore Point
echo   [3] Restore from Backup
echo   [4] Backup Scheduling
echo   [5] Backup Analysis
echo   [6] Disk/Partition Backup
echo   [7] Cloud Backup (OneDrive)
echo   [8] File/Folder Backup
echo   [9] Emergency Recovery
echo   [0] Back to Main Menu
echo  ----------------------------------------------------------------
echo.
set /p choice="Select backup/recovery option: "
if /i "%choice%"=="1" call ..\advanced-tools\backup-config.bat
if /i "%choice%"=="2" call ..\advanced-tools\restore-point.bat
if /i "%choice%"=="3" call ..\advanced-tools\config-backup.bat
if /i "%choice%"=="4" call ..\advanced-tools\scheduled-cleanup.bat
if /i "%choice%"=="5" call ..\advanced-tools\cleanup-analysis.bat
if /i "%choice%"=="6" call ..\advanced-tools\advanced-disk.bat
if /i "%choice%"=="7" call ..\advanced-tools\cloud-backup.bat
if /i "%choice%"=="8" call ..\advanced-tools\file-backup.bat
if /i "%choice%"=="9" call ..\advanced-tools\emergency-recovery.bat
if /i "%choice%"=="0" exit /b
call ..\animation-utils.bat :MATRIX_ANIMATION
goto BACKUP_MENU
