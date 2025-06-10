@echo off
REM Partition Management - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Partition Management"
cls
color 0D
echo [1/2] Lancement de l'outil de gestion des disques...
start diskmgmt.msc
echo [2/2] Utilisez l'interface graphique pour gérer les partitions.
echo.
pause
exit /b
