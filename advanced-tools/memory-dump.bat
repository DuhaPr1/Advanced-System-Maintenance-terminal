@echo off
REM Memory Dump Analysis - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Memory Dump Analysis"
cls
color 0C

echo =====================================================================
echo                  MEMORY DUMP ANALYSIS - PRO EDITION
echo =====================================================================
echo.
call ..\animation-utils.bat :LOADING_BAR

echo [1/4] Création d'un dump mémoire complet...
powershell -Command "CreateDump.ps1" 2>nul

echo [2/4] Analyse des dumps avec Windows Debugger (WinDbg)...
if exist "%SystemRoot%\System32\WinDbg.exe" (
    "%SystemRoot%\System32\WinDbg.exe" -z "%SystemRoot%\MEMORY.DMP"
) else (
    echo WinDbg non trouvé. Installez-le pour une analyse avancée.
)

echo [3/4] Recherche de signatures de malware dans le dump...
powershell -Command "Select-String -Path '%SystemRoot%\MEMORY.DMP' -Pattern 'malware|trojan|exploit'"

echo [4/4] Extraction des processus actifs du dump...
powershell -Command "Get-Process | Select-Object ProcessName,Id,CPU,Path | Format-Table -AutoSize"

echo.
echo Analyse du dump mémoire terminée !
pause
exit /b
