@echo off
title Advanced System Tools
color 05
mode con: cols=100 lines=35
setlocal enabledelayedexpansion

call core\animation-utils.bat :INTRO_ANIMATION
call animation-utils.bat :SHOW_DEVELOPER_INFO
call animation-utils.bat :MATRIX_ANIMATION

set "log_file=logs\advanced_tools_%date:~-4,4%%date:~-7,2%%date:~-10,2%_%time:~0,2%%time:~3,2%%time:~6,2%.log"
set "log_file=%log_file: =0%"
echo Advanced Tools - Log started at %date% %time% > "%log_file%"

:ADVANCED_MENU
cls
color 05
echo.
echo  ========================================================================
echo                          ADVANCED SYSTEM TOOLS
echo                        Professional Grade Utilities
echo  ========================================================================
echo.
echo  ----------------------------------------------------------------
echo   [1] System Forensics & Analysis
echo   [2] Advanced Registry Tools
echo   [3] Memory Dump Analysis
echo   [4] Process Injection Detection
echo   [5] System Integrity Verification
echo   [6] Advanced Disk Tools
echo   [7] Network Packet Analysis
echo   [8] System Performance Profiling
echo   [9] Windows Event Log Analysis
echo   [A] System Configuration Backup
echo   [B] Driver Analysis Tools
echo   [C] System Vulnerability Scanner
echo   [D] Advanced Troubleshooting
echo   [E] System Optimization Profiles
echo   [F] Emergency Recovery Tools
echo   [0] Back to Main Menu
echo  ----------------------------------------------------------------
echo.
set /p choice="Select advanced tool: "

if /i "%choice%"=="1" goto SYSTEM_FORENSICS
if /i "%choice%"=="2" goto REGISTRY_TOOLS
if /i "%choice%"=="3" goto MEMORY_DUMP
if /i "%choice%"=="4" goto PROCESS_INJECTION
if /i "%choice%"=="5" goto INTEGRITY_CHECK
if /i "%choice%"=="6" goto ADVANCED_DISK
if /i "%choice%"=="7" goto PACKET_ANALYSIS
if /i "%choice%"=="8" goto PERFORMANCE_PROFILE
if /i "%choice%"=="9" goto EVENT_ANALYSIS
if /i "%choice%"=="A" goto CONFIG_BACKUP
if /i "%choice%"=="B" goto DRIVER_ANALYSIS
if /i "%choice%"=="C" goto VULNERABILITY_SCAN
if /i "%choice%"=="D" goto ADVANCED_TROUBLESHOOT
if /i "%choice%"=="E" goto OPTIMIZATION_PROFILES
if /i "%choice%"=="F" goto EMERGENCY_RECOVERY
if /i "%choice%"=="0" exit /b

goto ADVANCED_MENU

:SYSTEM_FORENSICS
cls
call animation-utils.bat :SCAN_ANIMATION
echo.
echo System Forensics & Analysis
echo -------------------------
echo.

echo [1/6] Analyzing system startup programs...
powershell -Command "Get-CimInstance Win32_StartupCommand | Select-Object Name, Command, Location | Format-Table -AutoSize"

echo [2/6] Checking for suspicious processes...
powershell -Command "Get-Process | Where-Object { $_.ProcessName -notmatch '^(System|Idle|csrss|winlogon|services|lsass|svchost|explorer|dwm)$' -and $_.CPU -gt 10 } | Select-Object ProcessName, Id, CPU, WorkingSet, Path | Format-Table -AutoSize"

echo [3/6] Analyzing network connections...
powershell -Command "Get-NetTCPConnection | Where-Object { $_.State -eq 'Established' } | Select-Object LocalAddress, LocalPort, RemoteAddress, RemotePort, OwningProcess | Format-Table -AutoSize"

echo [4/6] Checking system file modifications...
powershell -Command "Get-ChildItem -Path C:\Windows\System32 -Filter '*.exe' | Where-Object { $_.LastWriteTime -gt (Get-Date).AddDays(-7) } | Select-Object Name, LastWriteTime | Format-Table -AutoSize"

echo [5/6] Analyzing user login events...
powershell -Command "Get-WinEvent -LogName Security | Where-Object { $_.Id -eq 4624 -and $_.TimeCreated -gt (Get-Date).AddDays(-1) } | Select-Object TimeCreated, @{Name='User';Expression={$_.Properties[5].Value}} | Format-Table -AutoSize"

echo [6/6] Checking for unsigned drivers...
powershell -Command "Get-WindowsDriver -Online | Where-Object { $_.DigitalSigner -eq '' } | Select-Object Driver, Version, Date | Format-Table -AutoSize"

echo.
echo Forensics analysis complete! Review the results above for any anomalies.
pause
goto ADVANCED_MENU

:VULNERABILITY_SCAN
cls
call animation-utils.bat :COUNTDOWN 5
echo.
echo System Vulnerability Scanner
echo -------------------------
echo.

echo [1/8] Checking Windows Update status...
powershell -Command "Get-HotFix | Sort-Object InstalledOn -Descending | Select-Object -First 10 | Format-Table HotFixID, Description, InstalledOn -AutoSize"

echo [2/8] Checking for weak passwords...
powershell -Command "Get-LocalUser | Where-Object { $_.PasswordRequired -eq $false } | Select-Object Name, Enabled, PasswordRequired"

echo [3/8] Checking firewall status...
powershell -Command "Get-NetFirewallProfile | Select-Object Name, Enabled, DefaultInboundAction, DefaultOutboundAction | Format-Table -AutoSize"

echo [4/8] Checking for open ports...
powershell -Command "Get-NetTCPConnection | Where-Object { $_.State -eq 'Listen' } | Select-Object LocalAddress, LocalPort, OwningProcess | Sort-Object LocalPort | Format-Table -AutoSize"

echo [5/8] Checking antivirus status...
powershell -Command "Get-MpComputerStatus | Select-Object AntivirusEnabled, RealTimeProtectionEnabled, OnAccessProtectionEnabled, IoavProtectionEnabled | Format-List"

echo [6/8] Checking for suspicious scheduled tasks...
powershell -Command "Get-ScheduledTask | Where-Object { $_.Principal.UserId -eq 'SYSTEM' -and $_.Actions.Execute -notlike '*Windows*' } | Select-Object TaskName, State, @{Name='Command';Expression={$_.Actions.Execute}} | Format-Table -AutoSize"

echo [7/8] Checking system integrity...
sfc /verifyonly

echo [8/8] Checking for rootkit indicators...
powershell -Command "Get-Process | Where-Object { $_.ProcessName -eq '' -or $_.MainModule -eq $null } | Select-Object Id, ProcessName, Path"

echo.
echo Vulnerability scan complete! Address any issues found above.
pause
goto ADVANCED_MENU

:EMERGENCY_RECOVERY
cls
call animation-utils.bat :COLOR_CYCLE "Emergency Recovery Mode"
echo.
echo Emergency Recovery Tools
echo ----------------------
echo.
echo WARNING: These tools are for emergency situations only!
echo.
echo [1] Create Emergency Boot Disk
echo [2] System File Emergency Repair
echo [3] Registry Emergency Backup
echo [4] Emergency Safe Mode Boot
echo [5] System Restore Emergency
echo [6] Emergency Network Reset
echo [7] Emergency User Account Reset
echo [8] Emergency Malware Removal
echo.
set /p emergency_choice=""

if "%emergency_choice%"=="2" (
    echo.
    echo Emergency System File Repair
    echo --------------------------
    echo.
    echo [1/3] Running emergency SFC scan...
    sfc /scannow
    
    echo [2/3] Running emergency DISM repair...
    DISM /Online /Cleanup-Image /RestoreHealth
    
    echo [3/3] Checking boot configuration...
    bcdedit /enum
    
    echo.
    echo Emergency repair complete! Restart recommended.
)

if "%emergency_choice%"=="3" (
    echo.
    echo Emergency Registry Backup
    echo -----------------------
    echo.
    echo Creating emergency registry backup...
    reg export HKLM "%USERPROFILE%\Desktop\Emergency_HKLM_Backup.reg" /y
    reg export HKCU "%USERPROFILE%\Desktop\Emergency_HKCU_Backup.reg" /y
    reg export HKCR "%USERPROFILE%\Desktop\Emergency_HKCR_Backup.reg" /y
    reg export HKU "%USERPROFILE%\Desktop\Emergency_HKU_Backup.reg" /y
    reg export HKCC "%USERPROFILE%\Desktop\Emergency_HKCC_Backup.reg" /y
    
    echo Emergency registry backup complete!
    echo Backups saved to Desktop with Emergency_ prefix.
)

if "%emergency_choice%"=="8" (
    echo.
    echo Emergency Malware Removal
    echo ----------------------
    echo.
    echo [1/5] Stopping suspicious processes...
    powershell -Command "Get-Process | Where-Object { $_.ProcessName -like '*temp*' -or $_.ProcessName -like '*tmp*' } | Stop-Process -Force -ErrorAction SilentlyContinue"
    
    echo [2/5] Clearing temporary files...
    powershell -Command "Remove-Item '$env:TEMP\*' -Recurse -Force -ErrorAction SilentlyContinue"
    
    echo [3/5] Disabling suspicious startup items...
    powershell -Command "Get-CimInstance Win32_StartupCommand | Where-Object { $_.Command -like '*temp*' -or $_.Command -like '*tmp*' } | ForEach-Object { Remove-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Run' -Name $_.Name -ErrorAction SilentlyContinue }"
    
    echo [4/5] Running Windows Defender scan...
    powershell -Command "Start-MpScan -ScanType QuickScan"
    
    echo [5/5] Updating virus definitions...
    powershell -Command "Update-MpSignature"
    
    echo Emergency malware removal complete!
)

pause
goto ADVANCED_MENU
