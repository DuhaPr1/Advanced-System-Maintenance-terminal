@echo off
REM Custom Commands Center
color 0F
mode con: cols=100 lines=35
:CUSTOM_MENU
cls
echo.
echo  ========================================================================
echo                         CUSTOM COMMANDS CENTER
echo                       Advanced Command Execution
echo  ========================================================================
echo.
echo  ----------------------------------------------------------------
echo   [1] Command History Browser
echo   [2] Custom PowerShell Script Creator
echo   [3] Scheduled Task Manager
echo   [4] System Information Export
echo   [5] Registry Editor Shortcuts
echo   [6] Windows Feature Manager
echo   [7] Service Controller
echo   [8] Environment Variable Manager
echo   [9] Command Prompt Customizer
echo   [A] PowerShell Profile Editor
echo   [B] Batch File Creator
echo   [C] System Command Library
echo   [D] Custom Command Executor
echo   [E] Command Macro Recorder
echo   [F] Command Favorites Manager
echo   [0] Back to Main Menu
echo  ----------------------------------------------------------------
echo.
set /p choice="Select option: "
if /i "%choice%"=="1" call ..\advanced-tools\command-history.bat
if /i "%choice%"=="2" call ..\advanced-tools\ps-creator.bat
if /i "%choice%"=="3" call ..\advanced-tools\task-manager.bat
if /i "%choice%"=="4" call ..\advanced-tools\sysinfo-export.bat
if /i "%choice%"=="5" call ..\advanced-tools\registry-shortcuts.bat
if /i "%choice%"=="6" call ..\advanced-tools\feature-manager.bat
if /i "%choice%"=="7" call ..\advanced-tools\service-controller.bat
if /i "%choice%"=="8" call ..\advanced-tools\env-manager.bat
if /i "%choice%"=="9" call ..\advanced-tools\cmd-customizer.bat
if /i "%choice%"=="A" call ..\advanced-tools\ps-profile.bat
if /i "%choice%"=="B" call ..\advanced-tools\batch-creator.bat
if /i "%choice%"=="C" call ..\advanced-tools\command-library.bat
if /i "%choice%"=="D" call ..\advanced-tools\command-executor.bat
if /i "%choice%"=="E" call ..\advanced-tools\macro-recorder.bat
if /i "%choice%"=="F" call ..\advanced-tools\favorites-manager.bat
if /i "%choice%"=="0" exit /b
REM ...ajoute ici les goto/call pour chaque option si besoin...
goto CUSTOM_MENU
