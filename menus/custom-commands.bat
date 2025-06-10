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
set /p choice=Votre choix : 
set "target="
if /i "%choice%"=="1" set "target=command-history.bat"
if /i "%choice%"=="2" set "target=ps-creator.bat"
if /i "%choice%"=="3" set "target=task-manager.bat"
if /i "%choice%"=="4" set "target=sysinfo-export.bat"
if /i "%choice%"=="5" set "target=registry-shortcuts.bat"
if /i "%choice%"=="6" set "target=feature-manager.bat"
if /i "%choice%"=="7" set "target=service-controller.bat"
if /i "%choice%"=="8" set "target=env-manager.bat"
if /i "%choice%"=="9" set "target=cmd-customizer.bat"
if /i "%choice%"=="A" set "target=ps-profile.bat"
if /i "%choice%"=="B" set "target=batch-creator.bat"
if /i "%choice%"=="C" set "target=command-library.bat"
if /i "%choice%"=="D" set "target=command-executor.bat"
if /i "%choice%"=="E" set "target=macro-recorder.bat"
if /i "%choice%"=="F" set "target=favorites-manager.bat"
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

goto CUSTOM_MENU
