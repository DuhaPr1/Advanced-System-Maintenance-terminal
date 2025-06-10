@echo off
REM Graphics & Visual Performance - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Graphics & Visual Performance"
cls
color 0E
echo [1/2] Désactivation des effets visuels Windows...
powershell -Command "Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop' -Name 'DragFullWindows' -Value '0'"
echo [2/2] Optimisation du rafraîchissement GPU...
powershell -Command "Set-ItemProperty -Path 'HKCU\Software\Microsoft\DirectX' -Name 'MaxFrameLatency' -Value 1 -Force"
echo.
echo Optimisation graphique appliquée !
pause
exit /b
