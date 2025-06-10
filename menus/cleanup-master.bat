@echo off
REM Deep System Cleanup - Advanced Mode
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
if /i "%choice%"=="1" call ..\advanced-tools\quick-cleanup.bat
if /i "%choice%"=="2" call ..\advanced-tools\deep-cleanup.bat
if /i "%choice%"=="3" call ..\advanced-tools\nuclear-cleanup.bat
if /i "%choice%"=="4" call ..\advanced-tools\browser-cleanup.bat
if /i "%choice%"=="5" call ..\advanced-tools\store-cleanup.bat
if /i "%choice%"=="6" call ..\advanced-tools\update-cleanup.bat
if /i "%choice%"=="7" call ..\advanced-tools\logs-cleanup.bat
if /i "%choice%"=="8" call ..\advanced-tools\custom-cleanup.bat
if /i "%choice%"=="9" call ..\advanced-tools\cleanup-analysis.bat
if /i "%choice%"=="A" call ..\advanced-tools\advanced-junk-scanner.bat
if /i "%choice%"=="B" call ..\advanced-tools\duplicate-finder.bat
if /i "%choice%"=="C" call ..\advanced-tools\large-file-locator.bat
if /i "%choice%"=="D" call ..\advanced-tools\old-file-cleanup.bat
if /i "%choice%"=="E" call ..\advanced-tools\scheduled-cleanup.bat
if /i "%choice%"=="F" call ..\advanced-tools\restore-point-cleanup.bat
if /i "%choice%"=="0" exit /b
REM ...existing code...
goto CLEANUP_MENU
