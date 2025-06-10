@echo off
title Network Optimization Suite
color 0B
mode con: cols=100 lines=35
setlocal enabledelayedexpansion

call core\animation-utils.bat :INTRO_ANIMATION
call animation-utils.bat :SHOW_DEVELOPER_INFO
call animation-utils.bat :SCAN_ANIMATION

set "log_file=logs\network_%date:~-4,4%%date:~-7,2%%date:~-10,2%_%time:~0,2%%time:~3,2%%time:~6,2%.log"
set "log_file=%log_file: =0%"
echo Network Optimization - Log started at %date% %time% > "%log_file%"

:NETWORK_MENU
cls
color 0B
echo.
echo  ========================================================================
echo                        NETWORK OPTIMIZATION SUITE
echo                       Advanced Connection Tuning
echo  ========================================================================
echo.
echo  ----------------------------------------------------------------
echo   [1] Quick Network Boost
echo   [2] Advanced TCP/IP Optimization
echo   [3] Gaming Network Latency Reduction
echo   [4] Wi-Fi Connection Optimization
echo   [5] DNS Optimization
echo   [6] Bandwidth Management
echo   [7] Network Adapter Configuration
echo   [8] Network Diagnostics & Repair
echo   [9] Firewall Optimization
echo   [A] VPN Connection Optimization
echo   [B] Network Monitoring Setup
echo   [C] Browser Network Settings
echo   [D] Network Services Optimization
echo   [E] Custom Network Profile
echo   [F] Reset Network Settings
echo   [0] Back to Main Menu
echo  ----------------------------------------------------------------
echo.
set /p choice="Select network option: "

if /i "%choice%"=="1" goto QUICK_NETWORK
if /i "%choice%"=="2" goto TCP_IP_OPT
if /i "%choice%"=="3" goto GAMING_NETWORK
if /i "%choice%"=="4" goto WIFI_OPT
if /i "%choice%"=="5" goto DNS_OPT
if /i "%choice%"=="6" goto BANDWIDTH_MGMT
if /i "%choice%"=="7" goto ADAPTER_CONFIG
if /i "%choice%"=="8" goto NETWORK_DIAG
if /i "%choice%"=="9" goto FIREWALL_OPT
if /i "%choice%"=="A" goto VPN_OPT
if /i "%choice%"=="B" goto NETWORK_MONITOR
if /i "%choice%"=="C" goto BROWSER_NETWORK
if /i "%choice%"=="D" goto SERVICES_OPT
if /i "%choice%"=="E" goto CUSTOM_NETWORK
if /i "%choice%"=="F" goto RESET_NETWORK
if /i "%choice%"=="0" exit /b

goto NETWORK_MENU

:QUICK_NETWORK
cls
call animation-utils.bat :SPINNER_ANIMATION "Applying Quick Network Boost"
echo.
echo Applying Quick Network Boost...
echo.

echo [1/5] Optimizing TCP/IP parameters...
netsh int tcp set global autotuninglevel=normal
netsh int tcp set global chimney=enabled
netsh int tcp set global ecncapability=enabled

echo [2/5] Flushing DNS cache...
ipconfig /flushdns

echo [3/5] Resetting Winsock catalog...
netsh winsock reset

echo [4/5] Optimizing network adapter settings...
powershell -Command "Get-NetAdapter | Where-Object Status -eq 'Up' | ForEach-Object { Disable-NetAdapterPowerManagement -Name $_.Name -ErrorAction SilentlyContinue }"

echo [5/5] Disabling background network usage...
powershell -Command "Set-ItemProperty -Path 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config' -Name 'DODownloadMode' -Value 0 -ErrorAction SilentlyContinue"

echo.
call animation-utils.bat :COLOR_CYCLE "Quick network boost applied!"
pause
goto NETWORK_MENU

:TCP_IP_OPT
cls
call animation-utils.bat :COUNTDOWN 3
echo.
echo Advanced TCP/IP Optimization
echo -------------------------
echo.

echo [1/10] Optimizing TCP global parameters...
netsh int tcp set global congestionprovider=ctcp
netsh int tcp set global autotuninglevel=normal
netsh int tcp set global chimney=enabled
netsh int tcp set global ecncapability=enabled
netsh int tcp set global rss=enabled
netsh int tcp set global fastopen=enabled
netsh int tcp set global timestamps=disabled
netsh int tcp set global initialRto=2000
netsh int tcp set global rsc=enabled

echo [2/10] Optimizing TCP heuristics...
netsh int tcp set heuristics disabled

echo [3/10] Optimizing TCP/IP registry settings...
powershell -Command "Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters' -Name 'TcpAckFrequency' -Value 1"
powershell -Command "Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters' -Name 'TCPNoDelay' -Value 1"
powershell -Command "Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters' -Name 'DefaultTTL' -Value 64"
powershell -Command "Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters' -Name 'SackOpts' -Value 1"

echo [4/10] Optimizing network adapter offloading...
powershell -Command "Get-NetAdapter | Where-Object Status -eq 'Up' | ForEach-Object { Enable-NetAdapterChecksumOffload -Name $_.Name -ErrorAction SilentlyContinue }"
powershell -Command "Get-NetAdapter | Where-Object Status -eq 'Up' | ForEach-Object { Enable-NetAdapterLso -Name $_.Name -ErrorAction SilentlyContinue }"
powershell -Command "Get-NetAdapter | Where-Object Status -eq 'Up' | ForEach-Object { Enable-NetAdapterRss -Name $_.Name -ErrorAction SilentlyContinue }"

echo [5/10] Optimizing QoS settings...
powershell -Command "Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Psched' -Name 'NonBestEffortLimit' -Value 0 -ErrorAction SilentlyContinue"

echo [6/10] Optimizing network throttling...
powershell -Command "Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile' -Name 'NetworkThrottlingIndex' -Value 0xffffffff"

echo [7/10] Optimizing network adapter power settings...
powershell -Command "Get-NetAdapter | Where-Object Status -eq 'Up' | ForEach-Object { Disable-NetAdapterPowerManagement -Name $_.Name -ErrorAction SilentlyContinue }"

echo [8/10] Optimizing IPv4 settings...
netsh int ipv4 set global taskoffload=enabled
netsh int ipv4 set global neighborcachelimit=4096

echo [9/10] Optimizing DNS settings...
netsh int ip set dns name="Ethernet" static 1.1.1.1
netsh int ip add dns name="Ethernet" 8.8.8.8 index=2

echo [10/10] Applying final network optimizations...
netsh int tcp set supplemental template=custom icw=10

echo.
echo Advanced TCP/IP optimization complete!
echo A system restart is recommended for all changes to take effect.
pause
goto NETWORK_MENU

:DNS_OPT
cls
call animation-utils.bat :SCAN_ANIMATION
echo.
echo DNS Optimization
echo --------------
echo.

echo Current DNS settings:
powershell -Command "Get-DnsClientServerAddress -AddressFamily IPv4 | Select-Object InterfaceAlias, ServerAddresses"

echo.
echo Select DNS provider:
echo [1] Cloudflare (1.1.1.1, 1.0.0.1) - Privacy focused, fast
echo [2] Google (8.8.8.8, 8.8.4.4) - Reliable, widely used
echo [3] Quad9 (9.9.9.9, 149.112.112.112) - Security focused
echo [4] OpenDNS (208.67.222.222, 208.67.220.220) - Content filtering
echo [5] AdGuard DNS (94.140.14.14, 94.140.15.15) - Ad blocking
echo [6] Custom DNS
echo.
set /p dns_choice=""

if "%dns_choice%"=="1" (
    echo Setting Cloudflare DNS...
    netsh interface ipv4 set dns name="Ethernet" static 1.1.1.1 primary
    netsh interface ipv4 add dns name="Ethernet" 1.0.0.1 index=2
    netsh interface ipv4 set dns name="Wi-Fi" static 1.1.1.1 primary
    netsh interface ipv4 add dns name="Wi-Fi" 1.0.0.1 index=2
)

if "%dns_choice%"=="2" (
    echo Setting Google DNS...
    netsh interface ipv4 set dns name="Ethernet" static 8.8.8.8 primary
    netsh interface ipv4 add dns name="Ethernet" 8.8.4.4 index=2
    netsh interface ipv4 set dns name="Wi-Fi" static 8.8.8.8 primary
    netsh interface ipv4 add dns name="Wi-Fi" 8.8.4.4 index=2
)

echo.
echo Flushing DNS cache...
ipconfig /flushdns

echo.
echo Testing DNS resolution speed...
powershell -Command "Measure-Command { nslookup google.com }"

echo.
echo DNS optimization complete!
pause
goto NETWORK_MENU
