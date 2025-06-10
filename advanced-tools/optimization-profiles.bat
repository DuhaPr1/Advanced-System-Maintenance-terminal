@echo off
REM System Optimization Profiles - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "System Optimization Profiles"
cls
color 0E

echo =====================================================================
echo                  SYSTEM OPTIMIZATION PROFILES - PRO EDITION
echo =====================================================================
echo.
call ..\animation-utils.bat :LOADING_BAR

echo [1/4] Application du profil "Performance Max"...
powershell -Command "powercfg /setactive SCHEME_MIN"

echo [2/4] Application du profil "Équilibré"...
powershell -Command "powercfg /setactive SCHEME_BALANCED"

echo [3/4] Application du profil "Économie d'énergie"...
powershell -Command "powercfg /setactive SCHEME_MAX"

echo [4/4] Optimisation des services...
powershell -Command "Get-Service | Where-Object { $_.StartType -eq 'Disabled' } | Set-Service -StartupType Manual"

echo.
echo Profils d'optimisation appliqués !
pause
exit /b
