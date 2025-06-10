@echo off
title Custom Commands Center
color 0F
mode con: cols=100 lines=35
setlocal enabledelayedexpansion

call animation-utils.bat :SHOW_DEVELOPER_INFO
call animation-utils.bat :MATRIX_ANIMATION

:CUSTOM_MENU
cls
color 0F
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

if /i "%choice%"=="1" goto COMMAND_HISTORY
if /i "%choice%"=="2" goto PS_CREATOR
if /i "%choice%"=="3" goto TASK_MANAGER
if /i "%choice%"=="4" goto SYSINFO_EXPORT
if /i "%choice%"=="5" goto REGISTRY_SHORTCUTS
if /i "%choice%"=="6" goto FEATURE_MANAGER
if /i "%choice%"=="7" goto SERVICE_CONTROLLER
if /i "%choice%"=="8" goto ENV_MANAGER
if /i "%choice%"=="9" goto CMD_CUSTOMIZER
if /i "%choice%"=="A" goto PS_PROFILE
if /i "%choice%"=="B" goto BATCH_CREATOR
if /i "%choice%"=="C" goto COMMAND_LIBRARY
if /i "%choice%"=="D" goto COMMAND_EXECUTOR
if /i "%choice%"=="E" goto MACRO_RECORDER
if /i "%choice%"=="F" goto FAVORITES_MANAGER
if /i "%choice%"=="0" exit /b

goto CUSTOM_MENU

:COMMAND_EXECUTOR
cls
call animation-utils.bat :TYPING_EFFECT "Custom Command Executor"
echo.
echo Custom Command Executor
echo --------------------
echo.
echo This tool allows you to execute custom commands with elevated privileges.
echo.
echo Enter command to execute:
set /p custom_cmd=""
echo.
echo Executing command: %custom_cmd%
echo.
powershell -Command "Start-Process cmd -ArgumentList '/c %custom_cmd% & pause' -Verb RunAs"
echo.
echo Command executed!
pause
goto CUSTOM_MENU

:BATCH_CREATOR
cls
call animation-utils.bat :COUNTDOWN 3
echo.
echo Batch File Creator
echo ----------------
echo.
echo This tool helps you create custom batch files.
echo.
echo Enter batch file name (without .bat extension):
set /p batch_name=""
echo.
echo Enter commands for your batch file (type 'END' on a new line when finished):
echo @echo off > "%USERPROFILE%\Desktop\%batch_name%.bat"
echo title %batch_name% >> "%USERPROFILE%\Desktop\%batch_name%.bat"
echo color 0A >> "%USERPROFILE%\Desktop\%batch_name%.bat"
echo. >> "%USERPROFILE%\Desktop\%batch_name%.bat"

:BATCH_INPUT_LOOP
set /p batch_line=""
if /i "%batch_line%"=="END" goto BATCH_DONE
echo %batch_line% >> "%USERPROFILE%\Desktop\%batch_name%.bat"
goto BATCH_INPUT_LOOP

:BATCH_DONE
echo pause >> "%USERPROFILE%\Desktop\%batch_name%.bat"
echo.
echo Batch file created on your Desktop: %batch_name%.bat
echo.
echo Would you like to test the batch file now? (Y/N)
set /p test_choice=""
if /i "%test_choice%"=="Y" (
    start "%USERPROFILE%\Desktop\%batch_name%.bat"
)
pause
goto CUSTOM_MENU

:PS_CREATOR
cls
call animation-utils.bat :SPINNER_ANIMATION "Creating PowerShell Script"
echo.
echo PowerShell Script Creator
echo -----------------------
echo.
echo Enter script name (without .ps1 extension):
set /p ps_name=""
echo.
echo Select script template:
echo [1] Basic System Information
echo [2] File Management Script
echo [3] Network Diagnostics
echo [4] Performance Monitoring
echo [5] Custom Empty Script
echo.
set /p template_choice=""

if "%template_choice%"=="1" (
    echo # System Information Script > "%USERPROFILE%\Desktop\%ps_name%.ps1"
    echo # Created by: Abdelhakim Baalla >> "%USERPROFILE%\Desktop\%ps_name%.ps1"
    echo Write-Host "System Information Report" -ForegroundColor Green >> "%USERPROFILE%\Desktop\%ps_name%.ps1"
    echo Get-ComputerInfo ^| Select-Object WindowsProductName, WindowsVersion, TotalPhysicalMemory >> "%USERPROFILE%\Desktop\%ps_name%.ps1"
    echo Get-Disk ^| Select-Object Number, FriendlyName, Size, HealthStatus >> "%USERPROFILE%\Desktop\%ps_name%.ps1"
)

if "%template_choice%"=="2" (
    echo # File Management Script > "%USERPROFILE%\Desktop\%ps_name%.ps1"
    echo # Created by: Abdelhakim Baalla >> "%USERPROFILE%\Desktop\%ps_name%.ps1"
    echo param^([string]$Path^) >> "%USERPROFILE%\Desktop\%ps_name%.ps1"
    echo if ^(-not $Path^) { $Path = Read-Host "Enter directory path" } >> "%USERPROFILE%\Desktop\%ps_name%.ps1"
    echo Get-ChildItem -Path $Path -Recurse ^| Measure-Object -Property Length -Sum >> "%USERPROFILE%\Desktop\%ps_name%.ps1"
)

echo.
echo PowerShell script created: %ps_name%.ps1
echo.
echo Would you like to edit the script now? (Y/N)
set /p edit_choice=""
if /i "%edit_choice%"=="Y" (
    notepad "%USERPROFILE%\Desktop\%ps_name%.ps1"
)
pause
goto CUSTOM_MENU

:COMMAND_HISTORY
cls
call animation-utils.bat :SCAN_ANIMATION
echo.
echo Command History Browser
echo ---------------------
echo.
echo Displaying recent PowerShell command history:
echo.
powershell -Command "Get-History | Select-Object Id, CommandLine, StartExecutionTime | Format-Table -AutoSize"
echo.
echo Displaying recent Command Prompt history:
echo.
doskey /history
echo.
echo Would you like to export command history to a file? (Y/N)
set /p export_choice=""
if /i "%export_choice%"=="Y" (
    powershell -Command "Get-History | Out-File -FilePath '$env:USERPROFILE\Desktop\PowerShell_History.txt'"
    doskey /history > "%USERPROFILE%\Desktop\CMD_History.txt"
    echo Command history exported to your Desktop!
)
pause
goto CUSTOM_MENU

:SERVICE_CONTROLLER
cls
call animation-utils.bat :LOADING_BAR
echo.
echo Service Controller
echo ----------------
echo.
echo [1] List All Services
echo [2] Start Service
echo [3] Stop Service
echo [4] Restart Service
echo [5] Set Service Startup Type
echo [6] Service Dependencies
echo [7] Service Performance Impact
echo [8] Export Service List
echo.
set /p service_choice=""

if "%service_choice%"=="1" (
    echo.
    echo Listing all services:
    powershell -Command "Get-Service | Sort-Object Status, Name | Format-Table Name, Status, StartType -AutoSize"
)

if "%service_choice%"=="2" (
    echo.
    echo Enter service name to start:
    set /p service_name=""
    powershell -Command "Start-Service -Name '%service_name%' -ErrorAction SilentlyContinue"
    echo Service start command executed.
)

if "%service_choice%"=="3" (
    echo.
    echo Enter service name to stop:
    set /p service_name=""
    powershell -Command "Stop-Service -Name '%service_name%' -Force -ErrorAction SilentlyContinue"
    echo Service stop command executed.
)

if "%service_choice%"=="7" (
    echo.
    echo Analyzing service performance impact:
    powershell -Command "Get-WmiObject -Class Win32_Service | Where-Object { $_.State -eq 'Running' } | ForEach-Object { $proc = Get-Process -Name $_.ProcessId -ErrorAction SilentlyContinue; if ($proc) { [PSCustomObject]@{ServiceName=$_.Name; ProcessName=$proc.ProcessName; CPU=$proc.CPU; WorkingSet=[math]::Round($proc.WorkingSet/1MB,2)} } } | Sort-Object CPU -Descending | Select-Object -First 20 | Format-Table -AutoSize"
)

pause
goto CUSTOM_MENU

:ENV_MANAGER
cls
call animation-utils.bat :TYPING_EFFECT "Environment Variable Manager"
echo.
echo Environment Variable Manager
echo --------------------------
echo.
echo [1] List All Environment Variables
echo [2] Add New Environment Variable
echo [3] Modify Environment Variable
echo [4] Delete Environment Variable
echo [5] Export Environment Variables
echo [6] Import Environment Variables
echo [7] PATH Variable Manager
echo.
set /p env_choice=""

if "%env_choice%"=="1" (
    echo.
    echo Current Environment Variables:
    powershell -Command "Get-ChildItem Env: | Sort-Object Name | Format-Table Name, Value -AutoSize"
)

if "%env_choice%"=="2" (
    echo.
    echo Enter variable name:
    set /p var_name=""
    echo Enter variable value:
    set /p var_value=""
    echo Select scope [1] User [2] Machine:
    set /p scope_choice=""
    if "%scope_choice%"=="1" (
        powershell -Command "[Environment]::SetEnvironmentVariable('%var_name%', '%var_value%', 'User')"
    ) else (
        powershell -Command "[Environment]::SetEnvironmentVariable('%var_name%', '%var_value%', 'Machine')"
    )
    echo Environment variable added!
)

if "%env_choice%"=="7" (
    echo.
    echo PATH Variable Manager
    echo -------------------
    echo Current PATH entries:
    powershell -Command "$env:PATH -split ';' | ForEach-Object { $i = 0 } { Write-Host ('{0:D2}: {1}' -f ++$i, $_) }"
    echo.
    echo [1] Add to PATH [2] Remove from PATH [3] Clean PATH
    set /p path_choice=""
    
    if "%path_choice%"=="1" (
        echo Enter path to add:
        set /p new_path=""
        powershell -Command "$currentPath = [Environment]::GetEnvironmentVariable('PATH', 'User'); [Environment]::SetEnvironmentVariable('PATH', $currentPath + ';%new_path%', 'User')"
        echo Path added to user PATH!
    )
)

pause
goto CUSTOM_MENU

:COMMAND_LIBRARY
cls
call animation-utils.bat :COLOR_CYCLE "System Command Library"
echo.
echo System Command Library
echo --------------------
echo.
echo Select command category:
echo [1] System Information Commands
echo [2] Network Commands
echo [3] File System Commands
echo [4] Process Management Commands
echo [5] Registry Commands
echo [6] Performance Commands
echo [7] Security Commands
echo [8] Hardware Commands
echo.
set /p lib_choice=""

if "%lib_choice%"=="1" (
    echo.
    echo System Information Commands:
    echo -------------------------
    echo systeminfo                    - Complete system information
    echo msinfo32                      - System Information GUI
    echo dxdiag                        - DirectX diagnostics
    echo winver                        - Windows version
    echo hostname                      - Computer name
    echo whoami                        - Current user
    echo echo %COMPUTERNAME%            - Computer name variable
    echo wmic computersystem get model - Computer model
    echo wmic bios get serialnumber    - BIOS serial number
    echo.
    echo Enter command number to execute (1-9) or 0 to return:
    set /p cmd_choice=""
    if "%cmd_choice%"=="1" systeminfo
    if "%cmd_choice%"=="2" msinfo32
    if "%cmd_choice%"=="3" dxdiag
)

if "%lib_choice%"=="2" (
    echo.
    echo Network Commands:
    echo ---------------
    echo ipconfig /all                 - Network configuration
    echo ping google.com               - Test connectivity
    echo tracert google.com            - Trace route
    echo netstat -an                   - Network connections
    echo arp -a                        - ARP table
    echo nslookup google.com           - DNS lookup
    echo netsh wlan show profiles      - WiFi profiles
    echo netsh int ip show config      - IP configuration
    echo.
    echo Enter command number to execute (1-8) or 0 to return:
    set /p cmd_choice=""
    if "%cmd_choice%"=="1" ipconfig /all
    if "%cmd_choice%"=="2" ping google.com
    if "%cmd_choice%"=="3" tracert google.com
)

pause
goto CUSTOM_MENU

:MACRO_RECORDER
cls
call animation-utils.bat :COUNTDOWN 5
echo.
echo Command Macro Recorder
echo --------------------
echo.
echo This tool records a sequence of commands for later execution.
echo.
echo Enter macro name:
set /p macro_name=""
echo.
echo Enter commands for your macro (type 'RECORD_END' when finished):
echo # Macro: %macro_name% > "%USERPROFILE%\Desktop\%macro_name%_macro.bat"
echo # Created by: Abdelhakim Baalla >> "%USERPROFILE%\Desktop\%macro_name%_macro.bat"
echo # Created on: %date% %time% >> "%USERPROFILE%\Desktop\%macro_name%_macro.bat"
echo @echo off >> "%USERPROFILE%\Desktop\%macro_name%_macro.bat"
echo title %macro_name% Macro >> "%USERPROFILE%\Desktop\%macro_name%_macro.bat"
echo color 0E >> "%USERPROFILE%\Desktop\%macro_name%_macro.bat"
echo. >> "%USERPROFILE%\Desktop\%macro_name%_macro.bat"

:MACRO_INPUT_LOOP
echo Command %macro_step%:
set /p macro_cmd=""
if /i "%macro_cmd%"=="RECORD_END" goto MACRO_DONE
echo echo Executing: %macro_cmd% >> "%USERPROFILE%\Desktop\%macro_name%_macro.bat"
echo %macro_cmd% >> "%USERPROFILE%\Desktop\%macro_name%_macro.bat"
echo timeout /t 1 /nobreak ^>nul >> "%USERPROFILE%\Desktop\%macro_name%_macro.bat"
goto MACRO_INPUT_LOOP

:MACRO_DONE
echo echo. >> "%USERPROFILE%\Desktop\%macro_name%_macro.bat"
echo echo Macro execution completed! >> "%USERPROFILE%\Desktop\%macro_name%_macro.bat"
echo pause >> "%USERPROFILE%\Desktop\%macro_name%_macro.bat"
echo.
echo Macro recorded successfully: %macro_name%_macro.bat
echo.
echo Would you like to test the macro now? (Y/N)
set /p test_macro=""
if /i "%test_macro%"=="Y" (
    start "%USERPROFILE%\Desktop\%macro_name%_macro.bat"
)
pause
goto CUSTOM_MENU

:FAVORITES_MANAGER
cls
call animation-utils.bat :MATRIX_ANIMATION
echo.
echo Command Favorites Manager
echo -----------------------
echo.
echo [1] View Saved Favorites
echo [2] Add New Favorite
echo [3] Execute Favorite
echo [4] Delete Favorite
echo [5] Export Favorites
echo [6] Import Favorites
echo.
set /p fav_choice=""

if not exist "%USERPROFILE%\Desktop\command_favorites.txt" (
    echo # Command Favorites > "%USERPROFILE%\Desktop\command_favorites.txt"
    echo # Created by: Abdelhakim Baalla >> "%USERPROFILE%\Desktop\command_favorites.txt"
)

if "%fav_choice%"=="1" (
    echo.
    echo Current Favorites:
    type "%USERPROFILE%\Desktop\command_favorites.txt"
)

if "%fav_choice%"=="2" (
    echo.
    echo Enter favorite name:
    set /p fav_name=""
    echo Enter command:
    set /p fav_cmd=""
    echo %fav_name%=%fav_cmd% >> "%USERPROFILE%\Desktop\command_favorites.txt"
    echo Favorite added!
)

if "%fav_choice%"=="3" (
    echo.
    echo Available Favorites:
    type "%USERPROFILE%\Desktop\command_favorites.txt"
    echo.
    echo Enter favorite name to execute:
    set /p exec_fav=""
    for /f "tokens=1,2 delims==" %%a in ('type "%USERPROFILE%\Desktop\command_favorites.txt" ^| findstr /i "%exec_fav%"') do (
        echo Executing: %%b
        %%b
    )
)

pause
goto CUSTOM_MENU

:TASK_MANAGER
cls
call animation-utils.bat :LOADING_BAR
echo.
echo Scheduled Task Manager
echo --------------------
echo.
echo [1] List All Scheduled Tasks
echo [2] Create New Task
echo [3] Delete Task
echo [4] Enable/Disable Task
echo [5] Run Task Now
echo [6] Task History
echo [7] Export Task List
echo.
set /p task_choice=""

if "%task_choice%"=="1" (
    echo.
    echo Current Scheduled Tasks:
    powershell -Command "Get-ScheduledTask | Where-Object { $_.State -ne 'Disabled' } | Select-Object TaskName, State, LastRunTime, NextRunTime | Format-Table -AutoSize"
)

if "%task_choice%"=="2" (
    echo.
    echo Create New Scheduled Task
    echo -----------------------
    echo Enter task name:
    set /p task_name=""
    echo Enter command to execute:
    set /p task_cmd=""
    echo Select trigger type:
    echo [1] Daily [2] Weekly [3] At startup [4] At logon
    set /p trigger_type=""
    
    if "%trigger_type%"=="1" (
        echo Enter time (HH:MM format):
        set /p task_time=""
        powershell -Command "$Action = New-ScheduledTaskAction -Execute '%task_cmd%'; $Trigger = New-ScheduledTaskTrigger -Daily -At '%task_time%'; Register-ScheduledTask -TaskName '%task_name%' -Action $Action -Trigger $Trigger -RunLevel Highest"
    )
    
    if "%trigger_type%"=="3" (
        powershell -Command "$Action = New-ScheduledTaskAction -Execute '%task_cmd%'; $Trigger = New-ScheduledTaskTrigger -AtStartup; Register-ScheduledTask -TaskName '%task_name%' -Action $Action -Trigger $Trigger -RunLevel Highest"
    )
    
    echo Task created successfully!
)

if "%task_choice%"=="5" (
    echo.
    echo Enter task name to run:
    set /p run_task=""
    powershell -Command "Start-ScheduledTask -TaskName '%run_task%'"
    echo Task execution initiated!
)

pause
goto CUSTOM_MENU

:SYSINFO_EXPORT
cls
call animation-utils.bat :SPINNER_ANIMATION "Exporting System Information"
echo.
echo System Information Export
echo -----------------------
echo.
echo Creating comprehensive system report...
echo.

echo [1/5] Gathering basic system information...
systeminfo > "%USERPROFILE%\Desktop\SystemInfo_Report.txt"

echo [2/5] Gathering hardware information...
echo. >> "%USERPROFILE%\Desktop\SystemInfo_Report.txt"
echo ========== HARDWARE INFORMATION ========== >> "%USERPROFILE%\Desktop\SystemInfo_Report.txt"
powershell -Command "Get-ComputerInfo | Select-Object WindowsProductName, WindowsVersion, TotalPhysicalMemory, CsProcessors | Format-List" >> "%USERPROFILE%\Desktop\SystemInfo_Report.txt"

echo [3/5] Gathering disk information...
echo. >> "%USERPROFILE%\Desktop\SystemInfo_Report.txt"
echo ========== DISK INFORMATION ========== >> "%USERPROFILE%\Desktop\SystemInfo_Report.txt"
powershell -Command "Get-Disk | Select-Object Number, FriendlyName, Size, HealthStatus | Format-Table -AutoSize" >> "%USERPROFILE%\Desktop\SystemInfo_Report.txt"

echo [4/5] Gathering network information...
echo. >> "%USERPROFILE%\Desktop\SystemInfo_Report.txt"
echo ========== NETWORK INFORMATION ========== >> "%USERPROFILE%\Desktop\SystemInfo_Report.txt"
ipconfig /all >> "%USERPROFILE%\Desktop\SystemInfo_Report.txt"

echo [5/5] Gathering installed software...
echo. >> "%USERPROFILE%\Desktop\SystemInfo_Report.txt"
echo ========== INSTALLED SOFTWARE ========== >> "%USERPROFILE%\Desktop\SystemInfo_Report.txt"
powershell -Command "Get-Package | Select-Object Name, Version, Source | Format-Table -AutoSize" >> "%USERPROFILE%\Desktop\SystemInfo_Report.txt"

echo.
echo System information report created: SystemInfo_Report.txt
echo Report saved to your Desktop.
echo.
echo Would you like to open the report now? (Y/N)
set /p open_report=""
if /i "%open_report%"=="Y" (
    notepad "%USERPROFILE%\Desktop\SystemInfo_Report.txt"
)
pause
goto CUSTOM_MENU
