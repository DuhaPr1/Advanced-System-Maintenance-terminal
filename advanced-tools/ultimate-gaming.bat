@echo off
REM Ultimate Gaming Mode - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Ultimate Gaming Mode"
cls
color 09
echo [1/4] Activation du mode jeu ultime...
powershell -Command "Set-ItemProperty -Path 'HKCU\Software\Microsoft\GameBar' -Name 'AllowAutoGameMode' -Value 1"
echo [2/4] Désactivation des notifications...
powershell -Command "New-ItemProperty -Path 'HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings' -Name 'NOC_GLOBAL_SETTING_TOASTS_ENABLED' -Value 0 -PropertyType DWord -Force"
echo [3/4] Optimisation du réseau pour le jeu...
powershell -Command "netsh int tcp set global autotuninglevel=restricted"
echo [4/4] Fermeture des applications en arrière-plan...
powershell -Command "Get-Process | Where-Object { $_.MainWindowTitle -ne '' -and $_.ProcessName -notlike '*explorer*' -and $_.ProcessName -notlike '*game*' } | Stop-Process -Force -ErrorAction SilentlyContinue"
echo.
echo Ultimate Gaming Mode activé !
pause
exit /b
