@echo off
REM Audio Latency Reduction - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Audio Latency Reduction"
cls
color 09
echo [1/2] Optimisation du pilote audio...
powershell -Command "Get-PnpDevice -Class Sound | Enable-PnpDevice -Confirm:$false"
echo [2/2] Désactivation des effets audio Windows...
powershell -Command "Set-ItemProperty -Path 'HKCU\Software\Microsoft\Multimedia\Audio' -Name 'DisableAudioEnhancements' -Value 1 -Force"
echo.
echo Réduction de la latence audio appliquée !
pause
exit /b
