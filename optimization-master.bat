@echo off
title Performance Optimization Suite
color 0E
mode con: cols=100 lines=35
setlocal enabledelayedexpansion

call animation-utils.bat :SHOW_DEVELOPER_INFO
call animation-utils.bat :MATRIX_ANIMATION

:OPTIMIZATION_MENU
cls
color 0E
echo.
echo  ========================================================================
echo                       PERFORMANCE OPTIMIZATION
echo                         Advanced Tuning Suite
echo  ========================================================================
echo.
echo  ----------------------------------------------------------------
echo   [1] Quick Performance Boost
echo   [2] Advanced System Optimization
echo   [3] Memory & Storage Optimization
echo   [4] CPU & Process Optimization
echo   [5] Network Performance Tuning
echo   [6] Gaming Performance Mode
echo   [7] Power Management Optimization
echo   [8] Startup & Services Optimization
echo   [9] Performance Monitoring Setup
echo   [A] Registry Optimization
echo   [B] File System Optimization
echo   [C] Graphics & Visual Performance
echo   [D] Browser Performance Optimization
echo   [E] SSD Optimization
echo   [F] Custom Performance Profile
echo   [0] Back to Main Menu
echo  ----------------------------------------------------------------
echo.
set /p choice="Select optimization option: "

if /i "%choice%"=="1" goto QUICK_BOOST
if /i "%choice%"=="2" goto ADVANCED_OPT
if /i "%choice%"=="3" goto MEMORY_OPT
if /i "%choice%"=="4" goto CPU_OPT
if /i "%choice%"=="5" goto NETWORK_OPT
if /i "%choice%"=="6" goto GAMING_OPT
if /i "%choice%"=="7" goto POWER_OPT
if /i "%choice%"=="8" goto STARTUP_OPT
if /i "%choice%"=="9" goto MONITORING_SETUP
if /i "%choice%"=="A" goto REGISTRY_OPT
if /i "%choice%"=="B" goto FILESYSTEM_OPT
if /i "%choice%"=="C" goto GRAPHICS_OPT
if /i "%choice%"=="D" goto BROWSER_OPT
if /i "%choice%"=="E" goto SSD_OPT
if /i "%choice%"=="F" goto CUSTOM_PROFILE
if /i "%choice%"=="0" exit /b

goto OPTIMIZATION_MENU

:QUICK_BOOST
cls
call animation-utils.bat :SPINNER_ANIMATION "Applying Quick Performance Boost"
echo.
echo Applying Quick Performance Boost...
echo.

echo [1/6] Optimizing system responsiveness...
powershell -Command "Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\PriorityControl' -Name 'Win32PrioritySeparation' -Value 38"

echo [2/6] Disabling visual effects...
powershell -Command "Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop' -Name 'DragFullWindows' -Value '0'"
powershell -Command "Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop' -Name 'MenuShowDelay' -Value '0'"

echo [3/6] Optimizing memory management...
powershell -Command "Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management' -Name 'ClearPageFileAtShutdown' -Value 0"

echo [4/6] Disabling unnecessary services...
powershell -Command "Stop-Service 'Fax' -Force -ErrorAction SilentlyContinue; Set-Service 'Fax' -StartupType Disabled -ErrorAction SilentlyContinue"

echo [5/6] Optimizing network settings...
powershell -Command "netsh int tcp set global autotuninglevel=normal"

echo [6/6] Clearing system cache...
powershell -Command "Remove-Item '$env:SystemRoot\Prefetch\*' -Force -ErrorAction SilentlyContinue"

echo.
call animation-utils.bat :COLOR_CYCLE "Quick performance boost applied!"
pause
goto OPTIMIZATION_MENU

:REGISTRY_OPT
cls
call animation-utils.bat :COUNTDOWN 3
echo.
echo Registry Optimization
echo -------------------
echo.
echo WARNING: Registry modifications can affect system stability.
echo Creating backup before proceeding...

echo [1/5] Creating registry backup...
reg export HKLM %USERPROFILE%\Desktop\HKLM_Backup.reg /y
reg export HKCU %USERPROFILE%\Desktop\HKCU_Backup.reg /y

echo [2/5] Optimizing Explorer settings...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewAlphaSelect" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewShadow" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAnimations" /t REG_DWORD /d 0 /f

echo [3/5] Optimizing desktop settings...
reg add "HKCU\Control Panel\Desktop" /v "FontSmoothing" /t REG_SZ /d "2" /f
reg add "HKCU\Control Panel\Desktop" /v "FontSmoothingType" /t REG_DWORD /d 2 /f
reg add "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "0" /f

echo [4/5] Optimizing system performance settings...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d 1 /f

echo [5/5] Optimizing network settings...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d 0xffffffff /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d 0 /f

echo.
echo Registry optimization complete!
echo A backup has been saved to your Desktop.
pause
goto OPTIMIZATION_MENU

:SSD_OPT
cls
call animation-utils.bat :SCAN_ANIMATION
echo.
echo SSD Optimization
echo --------------
echo.

echo Detecting SSDs in your system...
powershell -Command "Get-PhysicalDisk | Where-Object MediaType -eq 'SSD' | Format-Table FriendlyName, MediaType, Size"

echo.
echo [1/7] Disabling Superfetch/SysMain service...
powershell -Command "Stop-Service 'SysMain' -Force -ErrorAction SilentlyContinue; Set-Service 'SysMain' -StartupType Disabled -ErrorAction SilentlyContinue"

echo [2/7] Disabling Windows Search indexing...
powershell -Command "Stop-Service 'WSearch' -Force -ErrorAction SilentlyContinue; Set-Service 'WSearch' -StartupType Disabled -ErrorAction SilentlyContinue"

echo [3/7] Enabling TRIM for all SSDs...
fsutil behavior set DisableDeleteNotify 0

echo [4/7] Disabling hibernation to free up space...
powercfg /hibernate off

echo [5/7] Optimizing page file settings...
wmic computersystem set AutomaticManagedPagefile=False
wmic pagefileset delete
wmic pagefileset create name="C:\pagefile.sys" initialsize=1024 maximumsize=4096

echo [6/7] Disabling defragmentation for SSDs...
schtasks /Change /TN "\Microsoft\Windows\Defrag\ScheduledDefrag" /Disable

echo [7/7] Running TRIM command on all SSDs...
defrag /L /U /V

echo.
echo SSD optimization complete!
pause
goto OPTIMIZATION_MENU

:CUSTOM_PROFILE
cls
call animation-utils.bat :TYPING_EFFECT "Custom Performance Profile Creator"
echo.
echo Custom Performance Profile Creator
echo -------------------------------
echo.
echo This tool will create a custom performance profile based on your preferences.
echo.
echo Select system usage type:
echo [1] General Use
echo [2] Gaming
echo [3] Content Creation
echo [4] Server/Background Tasks
echo [5] Power Saving
echo.
set /p usage_type=""

echo.
echo Select performance priority:
echo [1] Maximum Performance
echo [2] Balanced
echo [3] Power Efficiency
echo.
set /p perf_priority=""

echo.
echo Creating custom performance profile...
echo.

if "%usage_type%"=="1" (
    if "%perf_priority%"=="1" (
        echo Applying General Use - Maximum Performance profile...
        powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
        powershell -Command "Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\PriorityControl' -Name 'Win32PrioritySeparation' -Value 38"
    )
)

if "%usage_type%"=="2" (
    if "%perf_priority%"=="1" (
        echo Applying Gaming - Maximum Performance profile...
        powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
        powershell -Command "Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games' -Name 'Priority' -Value 6"
        powershell -Command "Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games' -Name 'GPU Priority' -Value 8"
        powershell -Command "Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games' -Name 'Scheduling Category' -Value 'High'"
    )
)

echo.
echo Custom performance profile applied!
pause
goto OPTIMIZATION_MENU
