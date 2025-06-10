@echo off
title Security & Privacy Master Suite
color 0D
mode con: cols=100 lines=35

:SECURITY_MENU
cls
echo.
echo  ╔════════════════════════════════════════════════════════════════════════════════════════╗
echo  ║                            🛡️  SECURITY & PRIVACY SUITE 🛡️                           ║
echo  ║                              Advanced Protection Tools                                 ║
echo  ╚════════════════════════════════════════════════════════════════════════════════════════╝
echo.
echo  ┌───────────────────────────────────────────────────────────────────────────────────────┐
echo  │  [1] 🔒 Privacy Hardening (Disable Telemetry)                                        │
echo  │  [2] 🛡️  Windows Defender Optimization                                               │
echo  │  [3] 🔥 Firewall Configuration                                                       │
echo  │  [4] 🕵️  Remove Bloatware & Tracking                                                 │
echo  │  [5] 🔐 User Account Security                                                        │
echo  │  [6] 📡 Network Security Hardening                                                   │
echo  │  [7] 🗂️  File System Security                                                        │
echo  │  [8] 📊 Security Audit & Report                                                      │
echo  │  [9] 🚨 Emergency Security Lockdown                                                  │
echo  │  [0] ⬅️  Back to Main Menu                                                          │
echo  └───────────────────────────────────────────────────────────────────────────────────────┘
echo.
set /p choice="Select security option (0-9): "

if "%choice%"=="1" goto PRIVACY_HARDENING
if "%choice%"=="2" goto DEFENDER_OPT
if "%choice%"=="3" goto FIREWALL_CONFIG
if "%choice%"=="4" goto REMOVE_BLOATWARE
if "%choice%"=="5" goto USER_SECURITY
if "%choice%"=="6" goto NETWORK_SECURITY
if "%choice%"=="7" goto FILE_SECURITY
if "%choice%"=="8" goto SECURITY_AUDIT
if "%choice%"=="9" goto EMERGENCY_LOCKDOWN
if "%choice%"=="0" exit /b

goto SECURITY_MENU

:PRIVACY_HARDENING
echo.
echo 🔒 Applying Privacy Hardening...
echo.

echo [1/8] Disabling telemetry and data collection...
powershell -Command "Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection' -Name 'AllowTelemetry' -Value 0"
powershell -Command "Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection' -Name 'AllowTelemetry' -Value 0"

echo [2/8] Disabling Cortana...
powershell -Command "Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search' -Name 'AllowCortana' -Value 0"

echo [3/8] Disabling location tracking...
powershell -Command "Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors' -Name 'DisableLocation' -Value 1"

echo [4/8] Disabling advertising ID...
powershell -Command "Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo' -Name 'DisabledByGroupPolicy' -Value 1"

echo [5/8] Disabling feedback requests...
powershell -Command "Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection' -Name 'DoNotShowFeedbackNotifications' -Value 1"

echo [6/8] Disabling app access to camera/microphone...
powershell -Command "Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy' -Name 'LetAppsAccessCamera' -Value 2"
powershell -Command "Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy' -Name 'LetAppsAccessMicrophone' -Value 2"

echo [7/8] Disabling Windows tips and suggestions...
powershell -Command "Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SoftLandingEnabled' -Value 0"

echo [8/8] Configuring privacy settings...
powershell -Command "Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SystemPaneSuggestionsEnabled' -Value 0"

echo.
echo ✅ Privacy hardening completed!
pause
goto SECURITY_MENU

:DEFENDER_OPT
echo.
echo 🛡️ Optimizing Windows Defender...
echo.

echo [1/6] Enabling real-time protection...
powershell -Command "Set-MpPreference -DisableRealtimeMonitoring $false"

echo [2/6] Configuring scan settings...
powershell -Command "Set-MpPreference -ScanScheduleDay Everyday -ScanScheduleTime 02:00:00"

echo [3/6] Enabling cloud protection...
powershell -Command "Set-MpPreference -MAPSReporting Advanced"
powershell -Command "Set-MpPreference -SubmitSamplesConsent SendAllSamples"

echo [4/6] Configuring exploit protection...
powershell -Command "Set-ProcessMitigation -System -Enable DEP,SEHOP,ASLR"

echo [5/6] Running full system scan...
powershell -Command "Start-MpScan -ScanType FullScan"

echo [6/6] Updating virus definitions...
powershell -Command "Update-MpSignature"

echo.
echo ✅ Windows Defender optimization completed!
pause
goto SECURITY_MENU

:EMERGENCY_LOCKDOWN
echo.
echo 🚨 WARNING: Emergency Security Lockdown Mode!
echo This will apply maximum security settings and may affect usability.
echo.
set /p confirm="Continue with emergency lockdown? (Y/N): "
if /i not "%confirm%"=="Y" goto SECURITY_MENU

echo.
echo 🚨 Activating Emergency Security Lockdown...
echo.

echo [1/10] Disabling all unnecessary services...
powershell -Command "Get-Service | Where-Object { $_.Name -like '*telemetry*' -or $_.Name -like '*diagtrack*' } | Stop-Service -Force; Set-Service -Name $_.Name -StartupType Disabled"

echo [2/10] Enabling maximum firewall protection...
powershell -Command "Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True -DefaultInboundAction Block -DefaultOutboundAction Allow"

echo [3/10] Disabling remote access...
powershell -Command "Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server' -Name 'fDenyTSConnections' -Value 1"

echo [4/10] Enabling audit policies...
powershell -Command "auditpol /set /category:* /success:enable /failure:enable"

echo [5/10] Configuring account lockout policies...
powershell -Command "net accounts /lockoutthreshold:3 /lockoutduration:30 /lockoutwindow:30"

echo [6/10] Disabling unnecessary network protocols...
powershell -Command "Disable-WindowsOptionalFeature -Online -FeatureName SMB1Protocol -NoRestart"

echo [7/10] Enabling advanced threat protection...
powershell -Command "Set-MpPreference -EnableNetworkProtection Enabled -EnableControlledFolderAccess Enabled"

echo [8/10] Configuring secure boot...
powershell -Command "Confirm-SecureBootUEFI"

echo [9/10] Disabling autorun for all drives...
powershell -Command "Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Name 'NoDriveTypeAutoRun' -Value 255"

echo [10/10] Final security configurations...
powershell -Command "Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa' -Name 'RestrictAnonymous' -Value 1"

echo.
echo ✅ Emergency security lockdown activated!
echo System restart is highly recommended.
pause
goto SECURITY_MENU
