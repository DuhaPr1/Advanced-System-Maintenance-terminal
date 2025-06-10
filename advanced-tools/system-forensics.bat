@echo off
REM System Forensics & Analysis - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SCAN_ANIMATION
cls
color 0B

echo =====================================================================
echo                  SYSTEM FORENSICS & ANALYSIS - PRO EDITION
echo =====================================================================
echo.
call ..\animation-utils.bat :LOADING_BAR

echo [1/7] Analyse des programmes de démarrage...
powershell -Command "Get-CimInstance Win32_StartupCommand | Select-Object Name, Command, Location | Format-Table -AutoSize"

call ..\animation-utils.bat :SPINNER

echo [2/7] Recherche de processus suspects...
powershell -Command "Get-Process | Where-Object { $_.ProcessName -notmatch '^(System|Idle|csrss|winlogon|services|lsass|svchost|explorer|dwm)$' -and $_.CPU -gt 10 } | Select-Object ProcessName, Id, CPU, WorkingSet, Path | Format-Table -AutoSize"

call ..\animation-utils.bat :SPINNER

echo [3/7] Analyse des connexions réseau actives...
powershell -Command "Get-NetTCPConnection | Where-Object { $_.State -eq 'Established' } | Select-Object LocalAddress, LocalPort, RemoteAddress, RemotePort, OwningProcess | Format-Table -AutoSize"

call ..\animation-utils.bat :SPINNER

echo [4/7] Vérification des modifications récentes dans System32...
powershell -Command "Get-ChildItem -Path C:\Windows\System32 -Filter '*.exe' | Where-Object { $_.LastWriteTime -gt (Get-Date).AddDays(-7) } | Select-Object Name, LastWriteTime | Format-Table -AutoSize"

call ..\animation-utils.bat :SPINNER

echo [5/7] Analyse des événements de connexion utilisateur...
powershell -Command "Get-WinEvent -LogName Security | Where-Object { $_.Id -eq 4624 -and $_.TimeCreated -gt (Get-Date).AddDays(-1) } | Select-Object TimeCreated, @{Name='User';Expression={$_.Properties[5].Value}} | Format-Table -AutoSize"

call ..\animation-utils.bat :SPINNER

echo [6/7] Vérification des pilotes non signés...
powershell -Command "Get-WindowsDriver -Online | Where-Object { $_.DigitalSigner -eq '' } | Select-Object Driver, Version, Date | Format-Table -AutoSize"

call ..\animation-utils.bat :SPINNER

echo [7/7] Scan rapide de rootkits (processus cachés)...
powershell -Command "Get-Process | Where-Object { $_.ProcessName -eq '' -or $_.MainModule -eq $null } | Select-Object Id, ProcessName, Path"

echo.
echo Analyse forensique terminée ! Consulte les résultats ci-dessus pour détecter toute anomalie.
echo.
pause
exit /b
