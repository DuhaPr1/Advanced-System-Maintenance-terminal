@echo off
title System Updates Manager
color 0B
mode con: cols=100 lines=35

call core\animation-utils.bat :INTRO_ANIMATION
set "log_file=logs\update_%date:~-4,4%%date:~-7,2%%date:~-10,2%_%time:~0,2%%time:~3,2%%time:~6,2%.log"
set "log_file=%log_file: =0%"
echo Update Suite - Log started at %date% %time% > "%log_file%"

:UPDATE_MENU
cls
echo.
echo  ╔════════════════════════════════════════════════════════════════════════════════════════╗
echo  ║                              🔄 SYSTEM UPDATES MANAGER 🔄                             ║
echo  ║                               Comprehensive Update Suite                               ║
echo  ╚════════════════════════════════════════════════════════════════════════════════════════╝
echo.
echo  ┌───────────────────────────────────────────────────────────────────────────────────────┐
echo  │  [1] 🔄 Windows Updates (Complete)                                                   │
echo  │  [2] 🎯 Driver Updates (All Hardware)                                                │
echo  │  [3] 📱 Microsoft Store Apps Update                                                  │
echo  │  [4] 🌐 Browser Updates (All Browsers)                                               │
echo  │  [5] 💻 Software Updates (Winget)                                                    │
echo  │  [6] 🛡️  Security Updates Priority                                                   │
echo  │  [7] 🔧 System Component Updates                                                     │
echo  │  [8] 📊 Update Status & History                                                      │
echo  │  [9] ⚙️  Configure Auto-Updates                                                      │
echo  │  [0] ⬅️  Back to Main Menu                                                          │
echo  └───────────────────────────────────────────────────────────────────────────────────────┘
echo.
set /p choice="Select update option (0-9): "

if "%choice%"=="1" goto WINDOWS_UPDATES
if "%choice%"=="2" goto DRIVER_UPDATES
if "%choice%"=="3" goto STORE_UPDATES
if "%choice%"=="4" goto BROWSER_UPDATES
if "%choice%"=="5" goto SOFTWARE_UPDATES
if "%choice%"=="6" goto SECURITY_UPDATES
if "%choice%"=="7" goto COMPONENT_UPDATES
if "%choice%"=="8" goto UPDATE_STATUS
if "%choice%"=="9" goto AUTO_UPDATE_CONFIG
if "%choice%"=="0" exit /b

goto UPDATE_MENU

:WINDOWS_UPDATES
echo.
echo 🔄 Starting Complete Windows Update Process...
echo.

echo [1/5] Installing PSWindowsUpdate module...
powershell -Command "Install-Module PSWindowsUpdate -Force -Confirm:$false -ErrorAction SilentlyContinue"

echo [2/5] Checking for available updates...
powershell -Command "Import-Module PSWindowsUpdate; Get-WindowsUpdate"

echo [3/5] Downloading and installing all updates...
powershell -Command "Import-Module PSWindowsUpdate; Get-WindowsUpdate -AcceptAll -Download -Install -AutoReboot"

echo [4/5] Cleaning up update cache...
powershell -Command "Stop-Service wuauserv -Force; Remove-Item '$env:SystemRoot\SoftwareDistribution\Download\*' -Recurse -Force -ErrorAction SilentlyContinue; Start-Service wuauserv"

echo [5/5] Verifying update installation...
powershell -Command "Get-HotFix | Sort-Object InstalledOn -Descending | Select-Object -First 10"

echo.
echo ✅ Windows updates completed!
pause
goto UPDATE_MENU

:DRIVER_UPDATES
echo.
echo 🎯 Updating All Hardware Drivers...
echo.

echo [1/4] Scanning for hardware changes...
powershell -Command "pnputil /scan-devices"

echo [2/4] Installing driver updates from Windows Update...
powershell -Command "Import-Module PSWindowsUpdate; Get-WindowsUpdate -AcceptAll -Install -UpdateType Driver -AutoReboot"

echo [3/4] Updating GPU drivers...
powershell -Command "winget upgrade --name 'NVIDIA GeForce Experience' --accept-package-agreements --silent"
powershell -Command "winget upgrade --name 'AMD Software' --accept-package-agreements --silent"

echo [4/4] Checking for problematic devices...
powershell -Command "Get-PnpDevice | Where-Object { $_.Status -eq 'Error' } | Format-Table FriendlyName, Status, InstanceId"

echo.
echo ✅ Driver updates completed!
pause
goto UPDATE_MENU

:SOFTWARE_UPDATES
echo.
echo 💻 Updating All Software via Winget...
echo.

echo [1/3] Updating Winget sources...
powershell -Command "winget source update"

echo [2/3] Listing available updates...
powershell -Command "winget list --upgrade-available"

echo [3/3] Installing all available updates...
powershell -Command "winget upgrade --all --accept-package-agreements --accept-source-agreements --silent"

echo.
echo ✅ Software updates completed!
pause
goto UPDATE_MENU

:AUTO_UPDATE_CONFIG
echo.
echo ⚙️ Configuring Automatic Updates...
echo.

echo [1/3] Creating weekly update task...
powershell -Command "$Trigger = New-ScheduledTaskTrigger -Weekly -DaysOfWeek Sunday -At 3am; $Action = New-ScheduledTaskAction -Execute 'powershell.exe' -Argument '-NoProfile -Command \"Install-Module PSWindowsUpdate -Force; Get-WindowsUpdate -Install -AcceptAll -AutoReboot\"'; Register-ScheduledTask -TaskName 'Weekly Windows Update' -Trigger $Trigger -Action $Action -RunLevel Highest -Force"

echo [2/3] Configuring Windows Update settings...
powershell -Command "Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' -Name 'AUOptions' -Value 4"

echo [3/3] Setting up maintenance schedule...
powershell -Command "Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance' -Name 'MaintenanceDisabled' -Value 0"

echo.
echo ✅ Auto-update configuration completed!
pause
goto UPDATE_MENU
