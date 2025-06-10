@echo off
REM Security & Privacy Master Suite
color 0D
mode con: cols=100 lines=35
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
:SECURITY_MENU
cls
echo.
echo  ╔════════════════════════════════════════════════════════════════════════════════════════╗
echo  ║                            SECURITY & PRIVACY SUITE                                 ║
echo  ║                              Advanced Protection Tools                              ║
echo  ╚════════════════════════════════════════════════════════════════════════════════════════╝
echo.
echo  ┌───────────────────────────────────────────────────────────────────────────────────────┐
echo  │  [1] Privacy Hardening (Disable Telemetry)                                          │
echo  │  [2] Windows Defender Optimization                                                  │
echo  │  [3] Firewall Configuration                                                         │
echo  │  [4] Remove Bloatware & Tracking                                                    │
echo  │  [5] User Account Security                                                          │
echo  │  [6] Network Security Hardening                                                     │
echo  │  [7] File System Security                                                           │
echo  │  [8] Security Audit & Report                                                        │
echo  │  [9] Emergency Security Lockdown                                                    │
echo  │  [0] Back to Main Menu                                                              │
echo  └───────────────────────────────────────────────────────────────────────────────────────┘
echo.
set /p choice=Votre choix : 
set "target="
if /i "%choice%"=="1" set "target=privacy-hardening.bat"
if /i "%choice%"=="2" set "target=defender-opt.bat"
if /i "%choice%"=="3" set "target=firewall-config.bat"
if /i "%choice%"=="4" set "target=remove-bloatware.bat"
if /i "%choice%"=="5" set "target=user-security.bat"
if /i "%choice%"=="6" set "target=network-security.bat"
if /i "%choice%"=="7" set "target=file-security.bat"
if /i "%choice%"=="8" set "target=security-audit.bat"
if /i "%choice%"=="9" set "target=emergency-lockdown.bat"
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

goto SECURITY_MENU
