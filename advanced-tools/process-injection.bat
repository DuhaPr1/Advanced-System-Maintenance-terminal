@echo off
REM Process Injection Detection - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Process Injection Detection"
cls
color 0C

echo =====================================================================
echo                  PROCESS INJECTION DETECTION - PRO EDITION
echo =====================================================================
echo.
call ..\animation-utils.bat :LOADING_BAR

echo [1/4] Recherche de processus avec modules suspects...
powershell -Command "Get-Process | Where-Object { $_.Modules | Where-Object { $_.FileName -like '*temp*' -or $_.FileName -like '*inject*' } } | Select-Object ProcessName,Id,Path | Format-Table -AutoSize"

echo [2/4] Analyse des hooks API...
powershell -Command "Get-Process | ForEach-Object { $_.Modules } | Where-Object { $_.FileName -like '*hook*' } | Select-Object FileName,ModuleName"

echo [3/4] Vérification des injections DLL...
powershell -Command "Get-Process | ForEach-Object { $_.Modules } | Where-Object { $_.FileName -like '*.dll' -and $_.FileName -notlike '*Windows*' } | Select-Object FileName,ModuleName"

echo [4/4] Scan des processus cachés...
powershell -Command "Get-Process | Where-Object { $_.MainWindowHandle -eq 0 -and $_.ProcessName -ne 'System' } | Select-Object ProcessName,Id,Path"

echo.
echo Détection d'injection de processus terminée !
pause
exit /b
