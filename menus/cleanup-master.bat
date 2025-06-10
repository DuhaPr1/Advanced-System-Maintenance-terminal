@echo off
REM Deep System Cleanup - Advanced Mode
pushd "%~dp0"
color 0C
mode con: cols=100 lines=35
setlocal enabledelayedexpansion
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SCAN_ANIMATION
:CLEANUP_MENU
cls
color 0C
echo.
echo  ========================================================================
echo                         DEEP SYSTEM CLEANUP
echo                        Advanced Cleaning Suite
echo  ========================================================================
echo.
echo  ----------------------------------------------------------------
echo   [1] Quick Cleanup (Temp files, Cache, Recycle Bin)
echo   [2] Deep Cleanup (System files, Logs, Update cache)
echo   [3] Nuclear Cleanup (Everything + Registry cleanup)
echo   [4] Browser Cleanup (All browsers cache/cookies)
echo   [5] Windows Store & Apps Cleanup
echo   [6] Windows Update Cleanup
echo   [7] Event Logs Cleanup
echo   [8] Custom Cleanup (Select specific items)
echo   [9] Cleanup Analysis (Show what can be cleaned)
echo   [A] Advanced Junk File Scanner
echo   [B] Duplicate File Finder
echo   [C] Large File Locator
echo   [D] Old File Cleanup (By date)
echo   [E] Scheduled Cleanup Configuration
echo   [F] System Restore Point Cleanup
echo   [0] Back to Main Menu
echo  ----------------------------------------------------------------
echo.
set /p choice="Select cleanup option: "
set "target="
if /i "%choice%"=="1" set "target=quick-cleanup.bat"
if /i "%choice%"=="2" set "target=deep-cleanup.bat"
if /i "%choice%"=="3" set "target=nuclear-cleanup.bat"
if /i "%choice%"=="4" set "target=browser-cleanup.bat"
if /i "%choice%"=="5" set "target=store-cleanup.bat"
if /i "%choice%"=="6" set "target=update-cleanup.bat"
if /i "%choice%"=="7" set "target=logs-cleanup.bat"
if /i "%choice%"=="8" set "target=custom-cleanup.bat"
if /i "%choice%"=="9" set "target=cleanup-analysis.bat"
if /i "%choice%"=="A" set "target=advanced-junk-scanner.bat"
if /i "%choice%"=="B" set "target=duplicate-finder.bat"
if /i "%choice%"=="C" set "target=large-file-locator.bat"
if /i "%choice%"=="D" set "target=old-file-cleanup.bat"
if /i "%choice%"=="E" set "target=scheduled-cleanup.bat"
if /i "%choice%"=="F" set "target=restore-point-cleanup.bat"
if /i "%choice%"=="0" exit

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
REM Animation fun avant de réafficher le menu
call ..\animation-utils.bat :MATRIX_ANIMATION

goto CLEANUP_MENU
