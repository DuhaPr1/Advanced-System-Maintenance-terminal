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
set /p choice=Votre choix : 
set "target="
if /i "%choice%"=="1" set "target=backup-config.bat"
if /i "%choice%"=="2" set "target=restore-point.bat"
if /i "%choice%"=="3" set "target=config-backup.bat"
if /i "%choice%"=="4" set "target=scheduled-cleanup.bat"
if /i "%choice%"=="5" set "target=cleanup-analysis.bat"
if /i "%choice%"=="6" set "target=advanced-disk.bat"
if /i "%choice%"=="7" set "target=cloud-backup.bat"
if /i "%choice%"=="8" set "target=file-backup.bat"
if /i "%choice%"=="9" set "target=emergency-recovery.bat"
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

goto BACKUP_MENU
