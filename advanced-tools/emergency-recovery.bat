@echo off
REM Emergency Recovery Tools - Advanced Tool
call ..\animation-utils.bat :COLOR_CYCLE "Emergency Recovery Mode"
cls
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
exit /b
