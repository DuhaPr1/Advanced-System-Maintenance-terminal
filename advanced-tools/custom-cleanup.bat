@echo off
REM Custom Cleanup - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Custom Cleanup"
cls
color 0C
echo [1/2] Nettoyage personnalisé (à configurer)...
REM Ajoutez ici vos commandes personnalisées de nettoyage
echo [2/2] Nettoyage personnalisé terminé !
pause
exit /b
