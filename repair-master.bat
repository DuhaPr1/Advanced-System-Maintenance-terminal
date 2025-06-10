@echo off
title System Repair & Diagnostics Suite
color 0F
mode con: cols=100 lines=35

:REPAIR_MENU
cls
echo.
echo  ╔════════════════════════════════════════════════════════════════════════════════════════╗
echo  ║                          🔧 SYSTEM REPAIR & DIAGNOSTICS 🔧                           ║
echo  ║                              Advanced Recovery Tools                                   ║
echo  ╚════════════════════════════════════════════════════════════════════════════════════════╝
echo.
echo  ┌───────────────────────────────────────────────────────────────────────────────────────┐
echo  │  [1] 🔍 System File Checker (SFC Scan)                                               │
echo  │  [2] 🛠️  DISM Image Repair                                                           │
echo  │  [3] 💾 Memory Diagnostic                                                            │
echo  │  [4] 🗂️  Disk Check & Repair                                                         │
echo  │  [5] 🔄 System Restore Point                                                         │
echo  │  [6] 🌐 Network Reset & Repair                                                       │
echo  │  [7] 📊 Complete System Health Check                                                 │
echo  │  [8] 🚑 Emergency System Recovery                                                    │
echo  │  [9] 📋 Generate Diagnostic Report                                                   │
echo  │  [0] ⬅️  Back to Main Menu                                                          │
echo  └───────────────────────────────────────────────────────────────────────────────────────┘
echo.
set /p choice="Select repair option (0-9): "

if "%choice%"=="1" goto SFC_SCAN
if "%choice%"=="2" goto DISM_REPAIR
if "%choice%"=="3" goto MEMORY_DIAGNOSTIC
if "%choice%"=="4" goto DISK_REPAIR
if "%choice%"=="5" goto RESTORE_POINT
if "%choice%"=="6" goto NETWORK_RESET
if "%choice%"=="7" goto HEALTH_CHECK
if "%choice%"=="8" goto EMERGENCY_RECOVERY
if "%choice%"=="9" goto DIAGNOSTIC_REPORT
if "%choice%"=="0" exit /b

goto REPAIR_MENU

:SFC_SCAN
echo.
echo 🔍 Running System File Checker...
echo.
echo This may take several minutes...
sfc /scannow
echo.
echo ✅ SFC scan completed! Check results above.
pause
goto REPAIR_MENU

:DISM_REPAIR
echo.
echo 🛠️ Running DISM Image Repair...
echo.

echo [1/3] Checking image health...
DISM /Online /Cleanup-Image /CheckHealth

echo [2/3] Scanning image health...
DISM /Online /Cleanup-Image /ScanHealth

echo [3/3] Restoring image health...
DISM /Online /Cleanup-Image /RestoreHealth

echo.
echo ✅ DISM repair completed!
pause
goto REPAIR_MENU

:COMPLETE_REPAIR
echo.
echo 🚑 Running Complete System Repair...
echo.

echo [1/5] System File Checker...
sfc /scannow

echo [2/5] DISM Image Repair...
DISM /Online /Cleanup-Image /RestoreHealth

echo [3/5] Disk Check...
chkdsk C: /f /r /x

echo [4/5] Registry Repair...
powershell -Command "Get-ChildItem 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall' | ForEach-Object { if (-not (Test-Path '$($_.PSPath)\DisplayName')) { Remove-Item -Path $_.PSPath -Force -ErrorAction SilentlyContinue } }"

echo [5/5] Network Reset...
netsh winsock reset
netsh int ip reset

echo.
echo ✅ Complete system repair finished! Restart recommended.
pause
goto REPAIR_MENU

:HEALTH_CHECK
echo.
echo 📊 Running Complete System Health Check...
echo.

echo [1/8] Checking system files...
sfc /verifyonly

echo [2/8] Checking Windows image...
DISM /Online /Cleanup-Image /CheckHealth

echo [3/8] Checking disk health...
powershell -Command "Get-PhysicalDisk | Select-Object FriendlyName, HealthStatus, OperationalStatus"

echo [4/8] Checking memory...
powershell -Command "Get-WmiObject -Class Win32_PhysicalMemory | Select-Object Capacity, Speed, Manufacturer"

echo [5/8] Checking system temperature...
powershell -Command "Get-WmiObject -Namespace root/wmi -Class MSAcpi_ThermalZoneTemperature | Select-Object InstanceName, CurrentTemperature"

echo [6/8] Checking running processes...
powershell -Command "Get-Process | Sort-Object CPU -Descending | Select-Object -First 10 Name, CPU, WorkingSet"

echo [7/8] Checking system uptime...
powershell -Command "Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object LastBootUpTime, @{Name='Uptime';Expression={(Get-Date) - $_.LastBootUpTime}}"

echo [8/8] Checking event logs for errors...
powershell -Command "Get-WinEvent -LogName System -MaxEvents 10 | Where-Object { $_.LevelDisplayName -eq 'Error' } | Select-Object TimeCreated, Id, LevelDisplayName, Message"

echo.
echo ✅ System health check completed!
pause
goto REPAIR_MENU
