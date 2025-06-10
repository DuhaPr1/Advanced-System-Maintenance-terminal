@echo off
REM Storage Spaces Management - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Storage Spaces Management"
cls
color 0D
echo [1/1] Lancement de la gestion des espaces de stockage...
start StorageSpacesControl.exe
echo.
pause
exit /b
