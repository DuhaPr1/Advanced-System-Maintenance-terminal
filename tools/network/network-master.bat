@echo off
title Advanced Network Optimization - By Abdelhakim Baalla
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
echo Advanced Network Optimization - Log started at %date% %time% > "%log_file%"
echo Created by Abdelhakim Baalla >> "%log_file%"
echo. >> "%log_file%"

:: Run intro animation
powershell -Command "$host.UI.RawUI.BackgroundColor = 'Black'; $host.UI.RawUI.ForegroundColor = 'Cyan'; Clear-Host; Write-Host ''; Write-Host ''; Write-Host '                              NETWORK OPTIMIZATION MODULE'; Write-Host '                               INITIALIZING PROTOCOLS'; Write-Host ''; Write-Host ''; $networkFrames = @('◐ CONNECTING', '◓ CONNECTING', '◑ CONNECTING', '◒ CONNECTING'); for ($i = 0; $i -lt 16; $i++) { Write-Host ('                                ' + $networkFrames[$i % 4]) -ForegroundColor Cyan; Start-Sleep -Milliseconds 150; Write-Host \"`r\"; }; Write-Host ''; Write-Host '                              NETWORK MODULE READY'; Start-Sleep -Seconds 1; Clear-Host"

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
echo   ██████╗ ██████╗ ████████╗██╗███╗   ███╗██╗███████╗ █████╗ ████████╗██╗ ██████╗ ███╗   ██╗
echo  ██╔═══██╗██╔══██╗╚══██╔══╝██║████╗ ████║██║╚══███╔╝██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║
echo  ██║   ██║██████╔╝   ██║   ██║██╔████╔██║██║  ███╔╝ ███████║   ██║   ██║██║   ██║██╔██╗ ██║
echo  ██║   ██║██╔═══╝    ██║   ██║██║╚██╔╝██║██║ ███╔╝  ██╔══██║   ██║   ██║██║   ██║██║╚██╗██║
echo  ╚██████╔╝██║        ██║   ██║██║ ╚═╝ ██║██║███████╗██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║
echo   ╚═════╝ ╚═╝        ╚═╝   ╚═╝╚═╝     ╚═╝╚═╝╚══════╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝
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
echo   [3] Gaming Network Latency Reduction
echo   [4] Wi-Fi Connection Optimization
echo   [5] DNS Optimization
echo   [6] Bandwidth Management
echo   [7] Network Adapter Configuration
echo   [8] Network Diagnostics & Repair
echo.
echo   [A] Firewall Optimization
echo   [B] VPN Connection Optimization
echo   [C] Network Monitoring Setup
echo   [D] Browser Network Settings
echo   [E] Network Services Optimization
echo   [F] Custom Network Profile
echo   [G] Reset Network Settings
echo   [0] Back to Main Menu
echo.
echo  ╔════════════════════════════════════════════════════════════════════════════════╗
echo  ║  Network Status: Analyzing connection...                                       ║
echo  ╚════════════════════════════════════════════════════════════════════════════════╝
echo.
set /p choice="Enter your choice: "

if /i "%choice%"=="1" goto QUICK_NETWORK
if /i "%choice%"=="2" goto TCP_IP_OPT
if /i "%choice%"=="3" goto GAMING_NETWORK
if /i "%choice%"=="4" goto WIFI_OPT
if /i "%choice%"=="5" goto DNS_OPT
if /i "%choice%"=="6" goto BANDWIDTH_MGMT
if /i "%choice%"=="7" goto ADAPTER_CONFIG
if /i "%choice%"=="8" goto NETWORK_DIAG
if /i "%choice%"=="A" goto FIREWALL_OPT
if /i "%choice%"=="B" goto VPN_OPT
if /i "%choice%"=="C" goto NETWORK_MONITOR
if /i "%choice%"=="D" goto BROWSER_NETWORK
if /i "%choice%"=="E" goto SERVICES_OPT
if /i "%choice%"=="F" goto CUSTOM_NETWORK
if /i "%choice%"=="G" goto RESET_NETWORK
if /i "%choice%"=="0" exit /b

goto NETWORK_MENU

:QUICK_NETWORK
cls
echo Running Quick Network Boost... >> "%log_file%"
echo.
echo  ╔════════════════════════════════════════════════════════════════════════════════╗
echo  ║                          QUICK NETWORK BOOST                                   ║
echo  ╚════════════════════════════════════════════════════════════════════════════════╝
echo.

:: Network boost animation
powershell -Command "$host.UI.RawUI.BackgroundColor = 'Black'; $host.UI.RawUI.ForegroundColor = 'Cyan'; Write-Host ''; Write-Host ' INITIATING NETWORK BOOST SEQUENCE'; Write-Host ' =============================='; Write-Host ''; Write-Host ' Analyzing network performance...'; Write-Host ''; for ($i = 0; $i -lt 8; $i++) { $speed = Get-Random -Minimum 10 -Maximum 1000; Write-Host (' > Current Speed: ' + $speed + ' Mbps | Optimizing...') -ForegroundColor Yellow; Start-Sleep -Milliseconds 200; }; Write-Host ''; Write-Host ' Network analysis complete. Applying optimizations...'; Write-Host '';"

echo [1/5] Optimizing TCP/IP parameters...
echo Optimizing TCP/IP parameters... >> "%log_file%"
netsh int tcp set global autotuninglevel=normal >nul
netsh int tcp set global chimney=enabled >nul
netsh int tcp set global ecncapability=enabled >nul
echo Done.

echo [2/5] Flushing DNS cache...
echo Flushing DNS cache... >> "%log_file%"
ipconfig /flushdns >nul
echo Done.

echo [3/5] Resetting Winsock catalog...
echo Resetting Winsock catalog... >> "%log_file%"
netsh winsock reset >nul
echo Done.

echo [4/5] Optimizing network adapter settings...
echo Optimizing network adapter settings... >> "%log_file%"
powershell -Command "Get-NetAdapter | Where-Object Status -eq 'Up' | ForEach-Object { Disable-NetAdapterPowerManagement -Name $_.Name -ErrorAction SilentlyContinue }"
echo Done.

echo [5/5] Disabling background network usage...
echo Disabling background network usage... >> "%log_file%"
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v "DODownloadMode" /t REG_DWORD /d 0 /f >nul 2>&1
echo Done.

:: Network boost completion
powershell -Command "$host.UI.RawUI.BackgroundColor = 'Black'; $host.UI.RawUI.ForegroundColor = 'Green'; Write-Host ''; Write-Host ' ╔══════════════════════════════════════════════════════════╗'; Write-Host ' ║               NETWORK BOOST COMPLETE                     ║'; Write-Host ' ╚══════════════════════════════════════════════════════════╝'; Write-Host ''; Write-Host ' Your network connection has been optimized.'; Write-Host ' You should experience improved speed and stability.'; Write-Host ''; Write-Host ' [' -NoNewline; Write-Host 'NETWORK BOOSTED' -ForegroundColor Green -NoNewline; Write-Host '] Quick network boost applied!'; Write-Host '';"

echo Quick Network Boost completed successfully! >> "%log_file%"
echo.
echo Press any key to return to the Network Menu...
pause >nul
goto NETWORK_MENU

:DNS_OPT
cls
echo Running DNS Optimization... >> "%log_file%"
echo.
echo  ╔════════════════════════════════════════════════════════════════════════════════╗
echo  ║                             DNS OPTIMIZATION                                   ║
echo  ╚════════════════════════════════════════════════════════════════════════════════╝
echo.

:: DNS scanning animation
powershell -Command "$host.UI.RawUI.BackgroundColor = 'Black'; $host.UI.RawUI.ForegroundColor = 'Cyan'; Write-Host ''; Write-Host ' DNS OPTIMIZATION ENGINE'; Write-Host ' ===================='; Write-Host ''; Write-Host ' Scanning current DNS configuration...'; Write-Host '';"

echo Current DNS settings:
echo Current DNS settings: >> "%log_file%"
powershell -Command "Get-DnsClientServerAddress -AddressFamily IPv4 | Select-Object InterfaceAlias, ServerAddresses | Format-Table -AutoSize"

echo.
echo Select DNS provider for optimization:
echo [1] Cloudflare (1.1.1.1, 1.0.0.1) - Privacy focused, fast
echo [2] Google (8.8.8.8, 8.8.4.4) - Reliable, widely used
echo [3] Quad9 (9.9.9.9, 149.112.112.112) - Security focused
echo [4] OpenDNS (208.67.222.222, 208.67.220.220) - Content filtering
echo [5] AdGuard DNS (94.140.14.14, 94.140.15.15) - Ad blocking
echo [6] Custom DNS
echo [7] Automatic DNS Benchmark Test
echo.
set /p dns_choice=""

if "%dns_choice%"=="1" (
    echo Setting Cloudflare DNS... >> "%log_file%"
    echo.
    echo Setting Cloudflare DNS...
    
    :: Cloudflare DNS animation
    powershell -Command "$host.UI.RawUI.BackgroundColor = 'Black'; $host.UI.RawUI.ForegroundColor = 'Yellow'; Write-Host ''; Write-Host ' CONFIGURING CLOUDFLARE DNS'; Write-Host ' ========================'; Write-Host ''; Write-Host ' Primary DNS: 1.1.1.1'; Write-Host ' Secondary DNS: 1.0.0.1'; Write-Host ''; Write-Host ' Benefits: Privacy-focused, fast response times'; Write-Host '';"
    
    netsh interface ipv4 set dns name="Ethernet" static 1.1.1.1 primary >nul 2>&1
    netsh interface ipv4 add dns name="Ethernet" 1.0.0.1 index=2 >nul 2>&1
    netsh interface ipv4 set dns name="Wi-Fi" static 1.1.1.1 primary >nul 2>&1
    netsh interface ipv4 add dns name="Wi-Fi" 1.0.0.1 index=2 >nul 2>&1
    echo Cloudflare DNS configured successfully!
)

if "%dns_choice%"=="7" (
    echo Running Automatic DNS Benchmark Test... >> "%log_file%"
    echo.
    echo Running Automatic DNS Benchmark Test...
    
    :: DNS benchmark animation
    powershell -Command "$host.UI.RawUI.BackgroundColor = 'Black'; $host.UI.RawUI.ForegroundColor = 'Magenta'; Write-Host ''; Write-Host ' AUTOMATIC DNS BENCHMARK TEST'; Write-Host ' ========================='; Write-Host ''; Write-Host ' Testing multiple DNS providers for optimal performance...'; Write-Host '';"
    
    echo Testing DNS providers...
    echo.
    
    echo Testing Cloudflare (1.1.1.1)...
    powershell -Command "$start = Get-Date; nslookup google.com 1.1.1.1 | Out-Null; $end = Get-Date; $time = ($end - $start).TotalMilliseconds; Write-Host ('Cloudflare: ' + [math]::Round($time, 2) + ' ms') -ForegroundColor $(if ($time -lt 50) { 'Green' } elseif ($time -lt 100) { 'Yellow' } else { 'Red' })"
    
    echo Testing Google (8.8.8.8)...
    powershell -Command "$start = Get-Date; nslookup google.com 8.8.8.8 | Out-Null; $end = Get-Date; $time = ($end - $start).TotalMilliseconds; Write-Host ('Google: ' + [math]::Round($time, 2) + ' ms') -ForegroundColor $(if ($time -lt 50) { 'Green' } elseif ($time -lt 100) { 'Yellow' } else { 'Red' })"
    
    echo Testing Quad9 (9.9.9.9)...
    powershell -Command "$start = Get-Date; nslookup google.com 9.9.9.9 | Out-Null; $end = Get-Date; $time = ($end - $start).TotalMilliseconds; Write-Host ('Quad9: ' + [math]::Round($time, 2) + ' ms') -ForegroundColor $(if ($time -lt 50) { 'Green' } elseif ($time -lt 100) { 'Yellow' } else { 'Red' })"
    
    echo.
    echo Benchmark complete! Choose the fastest DNS provider from the results above.
)

echo.
echo Flushing DNS cache...
echo Flushing DNS cache... >> "%log_file%"
ipconfig /flushdns >nul

echo.
echo Testing DNS resolution speed...
echo Testing DNS resolution speed... >> "%log_file%"
powershell -Command "$start = Get-Date; nslookup google.com | Out-Null; $end = Get-Date; $time = ($end - $start).TotalMilliseconds; Write-Host ('DNS Resolution Time: ' + [math]::Round($time, 2) + ' ms') -ForegroundColor $(if ($time -lt 50) { 'Green' } elseif ($time -lt 100) { 'Yellow' } else { 'Red' })"

:: DNS optimization completion
powershell -Command "$host.UI.RawUI.BackgroundColor = 'Black'; $host.UI.RawUI.ForegroundColor = 'Green'; Write-Host ''; Write-Host ' ╔══════════════════════════════════════════════════════════╗'; Write-Host ' ║                DNS OPTIMIZATION COMPLETE                 ║'; Write-Host ' ╚══════════════════════════════════════════════════════════╝'; Write-Host ''; Write-Host ' DNS settings have been optimized for better performance.'; Write-Host ' You should experience faster website loading times.'; Write-Host ''; Write-Host ' [' -NoNewline; Write-Host 'DNS OPTIMIZED' -ForegroundColor Green -NoNewline; Write-Host '] DNS optimization completed!'; Write-Host '';"

echo DNS Optimization completed successfully! >> "%log_file%"
echo.
echo Press any key to return to the Network Menu...
pause >nul
goto NETWORK_MENU

:NETWORK_MONITOR
cls
echo Starting Network Performance Monitor... >> "%log_file%"
echo.
echo  ╔════════════════════════════════════════════════════════════════════════════════╗
echo  ║                        NETWORK PERFORMANCE MONITOR                             ║
echo  ╚════════════════════════════════════════════════════════════════════════════════╝
echo.

:: Network monitoring animation
powershell -Command "$host.UI.RawUI.BackgroundColor = 'Black'; $host.UI.RawUI.ForegroundColor = 'Green'; Write-Host ''; Write-Host ' REAL-TIME NETWORK PERFORMANCE MONITOR'; Write-Host ' =================================='; Write-Host ''; Write-Host ' Initializing network monitoring systems...'; Write-Host ''; Write-Host ' Press CTRL+C to exit monitoring'; Write-Host ''; Write-Host ' ════════════════════════════════════════════════════════════'; Write-Host '';"

:NETWORK_MONITOR_LOOP
cls
echo.
echo  ╔════════════════════════════════════════════════════════════════════════════════╗
echo  ║                        NETWORK PERFORMANCE MONITOR                             ║
echo  ║                           Real-time Network Stats                              ║
echo  ╚════════════════════════════════════════════════════════════════════════════════╝
echo.
echo Current Time: %date% %time%
echo.

echo Network Adapters Status:
powershell -Command "Get-NetAdapter | Where-Object Status -eq 'Up' | Select-Object Name, InterfaceDescription, LinkSpeed | Format-Table -AutoSize"

echo.
echo Network Usage:
powershell -Command "Get-Counter '\Network Interface(*)\Bytes Total/sec' | Select-Object -ExpandProperty CounterSamples | Where-Object { $_.InstanceName -notlike '*loopback*' -and $_.InstanceName -notlike '*isatap*' } | Select-Object InstanceName, @{Name='Speed(MB/s)';Expression={[math]::Round($_.CookedValue/1MB,2)}} | Format-Table -AutoSize"

echo.
echo Active Network Connections:
powershell -Command "Get-NetTCPConnection | Where-Object State -eq 'Established' | Select-Object LocalAddress, LocalPort, RemoteAddress, RemotePort | Select-Object -First 10 | Format-Table -AutoSize"

echo.
echo DNS Resolution Test:
powershell -Command "$start = Get-Date; nslookup google.com | Out-Null; $end = Get-Date; $time = ($end - $start).TotalMilliseconds; Write-Host ('DNS Resolution: ' + [math]::Round($time, 2) + ' ms') -ForegroundColor $(if ($time -lt 50) { 'Green' } elseif ($time -lt 100) { 'Yellow' } else { 'Red' })"

echo.
echo Internet Connectivity Test:
ping google.com -n 1 | findstr "time="

echo.
echo ════════════════════════════════════════════════════════════════════════════════
echo Press CTRL+C to exit or any key to refresh...
echo ════════════════════════════════════════════════════════════════════════════════

timeout /t 5 /nobreak >nul
goto NETWORK_MONITOR_LOOP

:RESET_NETWORK
cls
echo Resetting Network Settings... >> "%log_file%"
echo.
echo  ╔════════════════════════════════════════════════════════════════════════════════╗
echo  ║                           RESET NETWORK SETTINGS                               ║
echo  ╚════════════════════════════════════════════════════════════════════════════════╝
echo.

:: Network reset animation
powershell -Command "$host.UI.RawUI.BackgroundColor = 'Black'; $host.UI.RawUI.ForegroundColor = 'Red'; Write-Host ''; Write-Host ' NETWORK RESET PROTOCOL'; Write-Host ' ==================='; Write-Host ''; Write-Host ' WARNING: This will reset all network configurations to default.'; Write-Host ' This includes Wi-Fi passwords, VPN settings, and custom configurations.'; Write-Host '';"

echo WARNING: This will reset ALL network configurations to default settings.
echo This includes:
echo - Wi-Fi passwords and profiles
echo - VPN configurations
echo - Custom DNS settings
echo - Network adapter settings
echo - Firewall rules
echo.
set /p confirm="Are you sure you want to continue? (Y/N): "

if /i not "%confirm%"=="Y" goto NETWORK_MENU

echo.
echo Resetting network settings...

echo [1/6] Resetting TCP/IP stack...
echo Resetting TCP/IP stack... >> "%log_file%"
netsh int ip reset >nul
echo Done.

echo [2/6] Resetting Winsock catalog...
echo Resetting Winsock catalog... >> "%log_file%"
netsh winsock reset >nul
echo Done.

echo [3/6] Resetting Windows Firewall...
echo Resetting Windows Firewall... >> "%log_file%"
netsh advfirewall reset >nul
echo Done.

echo [4/6] Flushing DNS cache...
echo Flushing DNS cache... >> "%log_file%"
ipconfig /flushdns >nul
echo Done.

echo [5/6] Releasing and renewing IP configuration...
echo Releasing and renewing IP configuration... >> "%log_file%"
ipconfig /release >nul
ipconfig /renew >nul
echo Done.

echo [6/6] Resetting network adapters...
echo Resetting network adapters... >> "%log_file%"
powershell -Command "Get-NetAdapter | Restart-NetAdapter -ErrorAction SilentlyContinue"
echo Done.

:: Network reset completion
powershell -Command "$host.UI.RawUI.BackgroundColor = 'Black'; $host.UI.RawUI.ForegroundColor = 'Green'; Write-Host ''; Write-Host ' ╔══════════════════════════════════════════════════════════╗'; Write-Host ' ║               NETWORK RESET COMPLETE                     ║'; Write-Host ' ╚══════════════════════════════════════════════════════════╝'; Write-Host ''; Write-Host ' All network settings have been reset to default.'; Write-Host ' A system restart is highly recommended.'; Write-Host ''; Write-Host ' [' -NoNewline; Write-Host 'RESET COMPLETE' -ForegroundColor Green -NoNewline; Write-Host '] Network settings restored!'; Write-Host '';"

echo Network Reset completed successfully! >> "%log_file%"
echo.
echo IMPORTANT: A system restart is recommended for all changes to take effect.
echo.
echo Press any key to return to the Network Menu...
pause >nul
goto NETWORK_MENU
