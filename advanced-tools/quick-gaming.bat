@echo off
REM Quick Gaming Boost - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Quick Gaming Boost"
cls
color 09
echo [1/5] Activation du plan d'alimentation haute performance...
powercfg /setactive SCHEME_MIN
echo [2/5] Désactivation de la Game Bar et DVR...
powershell -Command "Set-ItemProperty -Path 'HKCU\System\GameConfigStore' -Name 'GameDVR_Enabled' -Value 0 -ErrorAction SilentlyContinue"
powershell -Command "Set-ItemProperty -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR' -Name 'AllowGameDVR' -Value 0 -ErrorAction SilentlyContinue"
echo [3/5] Optimisation de la priorité CPU pour les jeux...
powershell -Command "Set-ItemProperty -Path 'HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games' -Name 'Priority' -Value 6"
echo [4/5] Désactivation des services inutiles...
powershell -Command "Stop-Service SysMain -Force; Set-Service SysMain -StartupType Disabled"
echo [5/5] Nettoyage du cache temporaire...
powershell -Command "Remove-Item '$env:TEMP\*' -Recurse -Force -ErrorAction SilentlyContinue"
echo.
echo Quick Gaming Boost appliqué !
pause
exit /b
