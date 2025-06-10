@echo off
REM Windows Event Log Analysis - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Event Log Analysis"
cls
color 0D

echo =====================================================================
echo                  WINDOWS EVENT LOG ANALYSIS - PRO EDITION
echo =====================================================================
echo.
call ..\animation-utils.bat :LOADING_BAR

echo [1/4] Analyse des erreurs système...
powershell -Command "Get-EventLog -LogName System -EntryType Error -Newest 10 | Format-Table TimeGenerated, Source, EventID, Message -AutoSize"

echo [2/4] Analyse des avertissements système...
powershell -Command "Get-EventLog -LogName System -EntryType Warning -Newest 10 | Format-Table TimeGenerated, Source, EventID, Message -AutoSize"

echo [3/4] Analyse des erreurs d'application...
powershell -Command "Get-EventLog -LogName Application -EntryType Error -Newest 10 | Format-Table TimeGenerated, Source, EventID, Message -AutoSize"

echo [4/4] Analyse des événements de sécurité...
powershell -Command "Get-EventLog -LogName Security -Newest 10 | Format-Table TimeGenerated, EntryType, EventID, Message -AutoSize"

echo.
echo Analyse des journaux d'événements terminée !
pause
exit /b
