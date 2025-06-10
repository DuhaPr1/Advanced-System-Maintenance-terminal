@echo off
REM Custom Performance Profile - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Custom Performance Profile"
cls
color 0E
echo [1/2] Application d'un profil personnalisé (à configurer)...
REM Ajoutez ici vos commandes personnalisées de profil
echo [2/2] Profil personnalisé appliqué !
pause
exit /b
