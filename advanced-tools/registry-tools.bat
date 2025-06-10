@echo off
REM Advanced Registry Tools - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Registry Tools"
cls
color 0E

echo =====================================================================
echo                  ADVANCED REGISTRY TOOLS - PRO EDITION
echo =====================================================================
echo.
call ..\animation-utils.bat :LOADING_BAR

echo [1/5] Exportation complète du registre...
reg export HKLM "%USERPROFILE%\Desktop\Full_HKLM_Backup.reg" /y
reg export HKCU "%USERPROFILE%\Desktop\Full_HKCU_Backup.reg" /y

echo [2/5] Recherche de clés suspectes...
powershell -Command "Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run | Select-Object Name,Property"

echo [3/5] Nettoyage des MRU (Most Recently Used)...
powershell -Command "Remove-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU' -Name '*' -ErrorAction SilentlyContinue"

echo [4/5] Optimisation du registre...
powershell -Command "reg.exe unload HKLM\TempHive 2>$null"

echo [5/5] Vérification de l'intégrité du registre...
powershell -Command "sfc /verifyonly"

echo.
echo Outils avancés du registre terminés !
pause
exit /b
