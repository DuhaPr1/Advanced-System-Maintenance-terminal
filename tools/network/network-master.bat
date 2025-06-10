@echo off
title Network Optimization Suite - By Abdelhakim Baalla
color 0B
mode con: cols=100 lines=35
setlocal enabledelayedexpansion

:: Check for admin privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
echo Administrator privileges required!
echo Right-click and select "Run as administrator"
pause
exit /b
)

:: Log file setup
set "log_file=..\..\logs\network_optimization_log_%date:~-4,4%%date:~-7,2%%date:~-10,2%_%time:~0,2%%time:~3,2%%time:~6,2%.txt"
set "log_file=%log_file: =0%"
echo Network Optimization - Log started at %date% %time% > "%log_file%"
echo Created by Abdelhakim Baalla >> "%log_file%"
echo. >> "%log_file%"

:NETWORK_MENU
cls
echo.
echo  ███╗   ██╗███████╗████████╗██╗    ██╗ ██████╗ ██████╗ ██╗  ██╗
echo  ████╗  ██║██╔════╝╚══██╔══╝██║    ██║██╔═══██╗██╔══██╗██║ ██╔╝
echo  ██╔██╗ ██║█████╗     ██║   ██║ █╗ ██║██║   ██║██████╔╝█████╔╝ 
echo  ██║╚██╗██║██╔══╝     ██║   ██║███╗██║██║   ██║██╔══██╗██╔═██╗ 
echo  ██║ ╚████║███████╗   ██║   ╚███╔███╔╝╚██████╔╝██║  ██║██║  ██╗
echo  ╚═╝  ╚═══╝╚══════╝   ╚═╝    ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝
echo.
echo                             Created by Abdelhakim Baalla
echo                          https://abdelhakim-baalla.vercel.app/
echo.
echo  ╔════════════════════════════════════════════════════════════════════════════════╗
echo  ║                         NETWORK OPTIMIZATION TOOLS                             ║
echo  ╚════════════════════════════════════════════════════════════════════════════════╝
echo.
echo   [1] Quick Network Boost
echo   [2] Advanced TCP/IP Optimization
echo   [3] DNS Optimization
echo   [4] Gaming Network Latency Reduction
echo   [5] Wi-Fi Connection Optimization
echo   [6] Network Diagnostics & Repair
echo   [7] Network Performance Monitor
echo   [8] Reset Network Settings
echo   [0] Back to Main Menu
echo.
set /p choice="Enter your choice: "

if "%choice%"=="1" goto QUICK_NETWORK
if "%choice%"=="2" goto TCP_IP_OPT
if "%choice%"=="3" goto DNS_OPT
if "%choice%"=="4" goto GAMING_NETWORK
if "%choice%"=="5" goto WIFI_OPT
if "%choice%"=="6" goto NETWORK_DIAG
if "%choice%"=="7" goto NETWORK_MONITOR
if "%choice%"=="8" goto RESET_NETWORK
if "%choice%"=="0" exit /b

goto NETWORK_MENU

:QUICK_NETWORK
cls
echo Quick Network Boost started at %time% >> "%log_file%"
echo.
echo  ╔════════════════════════════════════════════════════════════════════════════════╗
echo  ║                          QUICK NETWORK BOOST                                   ║
echo  ╚════════════════════════════════════════════════════════════════════════════════╝
echo.
echo Applying Quick Network Boost...
echo.

echo [1/5] Optimizing TCP/IP parameters...
netsh int tcp set global autotuninglevel=normal >nul
netsh int tcp set global chimney=enabled >nul
netsh int tcp set global ecncapability=enabled >nul
echo Done.

echo [2/5] Flushing DNS cache...
ipconfig /flushdns >nul
echo Done.

echo [3/5] Resetting Winsock catalog...
netsh winsock reset >nul
echo Done.

echo [4/5] Optimizing network adapter settings...
powershell -Command "Get-NetAdapter | Where-Object Status -eq 'Up' | ForEach-Object { Disable-NetAdapterPowerManagement -Name $_.Name -ErrorAction SilentlyContinue }"
echo Done.

echo [5/5] Disabling background network usage...
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v "DODownloadMode" /t REG_DWORD /d 0 /f >nul 2>&1
echo Done.

echo.
echo ✅ Quick network boost applied successfully!
echo Quick Network Boost completed at %time% >> "%log_file%"
echo.
pause
goto NETWORK_MENU

:DNS_OPT
cls
echo DNS Optimization started at %time% >> "%log_file%"
echo.
echo  ╔════════════════════════════════════════════════════════════════════════════════╗
echo  ║                             DNS OPTIMIZATION                                   ║
echo  ╚════════════════════════════════════════════════════════════════════════════════╝
echo.
echo Current DNS settings:
powershell -Command "Get-DnsClientServerAddress -AddressFamily IPv4 | Select-Object InterfaceAlias, ServerAddresses | Format-Table -AutoSize"
echo.
echo Select DNS provider for optimization:
echo [1] Cloudflare (1.1.1.1, 1.0.0.1) - Privacy focused, fast
echo [2] Google (8.8.8.8, 8.8.4.4) - Reliable, widely used
echo [3] Quad9 (9.9.9.9, 149.112.112.112) - Security focused
echo [4] OpenDNS (208.67.222.222, 208.67.220.220) - Content filtering
echo [5] AdGuard DNS (94.140.14.14, 94.140.15.15) - Ad blocking
echo [6] Automatic DNS Benchmark Test
echo.
set /p dns_choice="Enter your choice: "

if "%dns_choice%"=="1" (
    echo Setting Cloudflare DNS...
    netsh interface ipv4 set dns name="Ethernet" static 1.1.1.1 primary >nul 2>&1
    netsh interface ipv4 add dns name="Ethernet" 1.0.0.1 index=2 >nul 2>&1
    netsh interface ipv4 set dns name="Wi-Fi" static 1.1.1.1 primary >nul 2>&1
    netsh interface ipv4 add dns name="Wi-Fi" 1.0.0.1 index=2 >nul 2>&1
    echo Cloudflare DNS configured successfully!
    echo Cloudflare DNS configured at %time% >> "%log_file%"
)

if "%dns_choice%"=="6" (
    echo Running DNS Benchmark Test...
    echo.
    echo Testing Cloudflare (1.1.1.1)...
    powershell -Command "$start = Get-Date; nslookup google.com 1.1.1.1 | Out-Null; $end = Get-Date; $time = ($end - $start).TotalMilliseconds; Write-Host ('Cloudflare: ' + [math]::Round($time, 2) + ' ms')"
    
    echo Testing Google (8.8.8.8)...
    powershell -Command "$start = Get-Date; nslookup google.com 8.8.8.8 | Out-Null; $end = Get-Date; $time = ($end - $start).TotalMilliseconds; Write-Host ('Google: ' + [math]::Round($time, 2) + ' ms')"
    
    echo Testing Quad9 (9.9.9.9)...
    powershell -Command "$start = Get-Date; nslookup google.com 9.9.9.9 | Out-Null; $end = Get-Date; $time = ($end - $start).TotalMilliseconds; Write-Host ('Quad9: ' + [math]::Round($time, 2) + ' ms')"
    
    echo.
    echo Benchmark complete! Choose the fastest DNS provider from the results above.
    echo DNS Benchmark completed at %time% >> "%log_file%"
)

echo.
echo Flushing DNS cache...
ipconfig /flushdns >nul
echo.
echo ✅ DNS optimization completed!
echo.
pause
goto NETWORK_MENU
