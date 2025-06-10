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
set /p choice="Select security option (0-9): "
if "%choice%"=="0" exit /b
if /i "%choice%"=="1" call ..\advanced-tools\privacy-hardening.bat
if /i "%choice%"=="2" call ..\advanced-tools\defender-opt.bat
if /i "%choice%"=="3" call ..\advanced-tools\firewall-config.bat
if /i "%choice%"=="4" call ..\advanced-tools\remove-bloatware.bat
if /i "%choice%"=="5" call ..\advanced-tools\user-security.bat
if /i "%choice%"=="6" call ..\advanced-tools\network-security.bat
if /i "%choice%"=="7" call ..\advanced-tools\file-security.bat
if /i "%choice%"=="8" call ..\advanced-tools\security-audit.bat
if /i "%choice%"=="9" call ..\advanced-tools\emergency-lockdown.bat
goto SECURITY_MENU
