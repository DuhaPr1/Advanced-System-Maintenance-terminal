@echo off
REM CPU Priority for Games - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "CPU Priority for Games"
cls
color 09
echo [1/2] Priorité CPU élevée pour les jeux...
powershell -Command "Set-ItemProperty -Path 'HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games' -Name 'Scheduling Category' -Value 'High'"
echo [2/2] Désactivation de l'économie d'énergie CPU...
powershell -Command "powercfg /setacvalueindex SCHEME_MIN SUB_PROCESSOR PROCTHROTTLEMAX 100"
echo.
echo Priorité CPU pour les jeux appliquée !
pause
exit /b
