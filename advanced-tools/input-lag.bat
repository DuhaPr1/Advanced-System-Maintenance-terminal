@echo off
REM Input Lag Reduction - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Input Lag Reduction"
cls
color 09
echo [1/2] Optimisation du polling USB...
powershell -Command "Set-ItemProperty -Path 'HKLM\SYSTEM\CurrentControlSet\Services\mouclass' -Name 'PollingRate' -Value 1000 -Type DWord -Force"
echo [2/2] Désactivation du filtrage clavier...
powershell -Command "Set-ItemProperty -Path 'HKCU\Control Panel\Accessibility\Keyboard Response' -Name 'AutoRepeatDelay' -Value 0 -Force"
echo.
echo Réduction de l'input lag appliquée !
pause
exit /b
