@echo off
REM FPS Optimization - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "FPS Optimization"
cls
color 09
echo [1/3] Désactivation des effets visuels Windows...
powershell -Command "Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop' -Name 'DragFullWindows' -Value '0'"
powershell -Command "Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop' -Name 'MenuShowDelay' -Value '0'"
echo [2/3] Optimisation du rafraîchissement GPU...
powershell -Command "Set-ItemProperty -Path 'HKCU\Software\Microsoft\DirectX' -Name 'MaxFrameLatency' -Value 1 -Force"
echo [3/3] Nettoyage du cache DirectX...
del /q /f "%LOCALAPPDATA%\D3DSCache\*.*"
echo.
echo Optimisation FPS appliquée !
pause
exit /b
