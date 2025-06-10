@echo off
title Advanced System Maintenance Suite - By Abdelhakim Baalla
mode con: cols=100 lines=35
color 0A
setlocal enabledelayedexpansion

:: Check for admin privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Administrator privileges required!
    echo Right-click and select "Run as administrator"
    pause
    exit /b
)

:: Create folder structure if it doesn't exist
if not exist ".\animations" mkdir ".\animations"
if not exist ".\tools" mkdir ".\tools"
if not exist ".\tools\cleanup" mkdir ".\tools\cleanup"
if not exist ".\tools\optimization" mkdir ".\tools\optimization"
if not exist ".\tools\security" mkdir ".\tools\security"
if not exist ".\tools\network" mkdir ".\tools\network"
if not exist ".\tools\storage" mkdir ".\tools\storage"
if not exist ".\tools\developer" mkdir ".\tools\developer"
if not exist ".\tools\advanced" mkdir ".\tools\advanced"
if not exist ".\tools\custom" mkdir ".\tools\custom"
if not exist ".\logs" mkdir ".\logs"
if not exist ".\config" mkdir ".\config"

:: Set path to include our tools
set "PATH=%PATH%;%~dp0;%~dp0\tools"

:: Lancer l'animation d'accueil avancée
call .\core\animation-utils.bat :ADVANCED_INTRO

:MAIN_MENU
cls
color 0A
set "session_log=logs\session_%date:~-4,4%%date:~-7,2%%date:~-10,2%_%time:~0,2%%time:~3,2%%time:~6,2%.log"
set "session_log=%session_log: =0%"
echo Session started at %date% %time% > "%session_log%"
echo.
echo  ========================================================================
echo                  ADVANCED SYSTEM MAINTENANCE SUITE v2.5
echo                        By Abdelhakim Baalla
echo  ========================================================================
echo.
echo  [1] Nettoyage Système
echo  [2] Optimisation Performance
echo  [3] Sécurité & Vie Privée
echo  [4] Réparation & Diagnostics
echo  [5] Gestion Stockage
echo  [6] Outils Développeur
echo  [7] Réseau & Internet
echo  [8] Commandes Personnalisées
echo  [9] Outils Avancés
echo  [H] Aide & Documentation
echo  [C] Astuce du jour
echo  [Q] Quitter
echo  ----------------------------------------------------------------
echo  (Appuyez sur H pour l'aide rapide, C pour une astuce, Q pour quitter)
set /p main_choice="Sélectionnez une option : "

if /i "%main_choice%"=="1" call tools\cleanup\cleanup-master.bat
if /i "%main_choice%"=="2" call tools\optimization\optimization-master.bat
if /i "%main_choice%"=="3" call tools\security\security-master.bat
if /i "%main_choice%"=="4" call repair-master.bat
if /i "%main_choice%"=="5" call storage-management.bat
if /i "%main_choice%"=="6" call tools\developer\developer-tools.bat
if /i "%main_choice%"=="7" call tools\network\network-master.bat
if /i "%main_choice%"=="8" call custom-commands.bat
if /i "%main_choice%"=="9" call advanced-tools.bat
if /i "%main_choice%"=="H" call tools\help-system.bat
if /i "%main_choice%"=="C" (
    echo.
    echo  Astuce du jour : Sauvegardez régulièrement votre registre Windows avant toute modification système !
    timeout /t 3 >nul
    goto MAIN_MENU
)
if /i "%main_choice%"=="Q" exit /b

goto MAIN_MENU
