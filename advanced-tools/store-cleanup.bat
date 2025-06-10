@echo off
REM Windows Store & Apps Cleanup - Advanced Tool
call ..\animation-utils.bat :SHOW_DEVELOPER_INFO
call ..\animation-utils.bat :SPINNER_ANIMATION "Store Cleanup"
cls
color 0C
echo [1/2] Nettoyage du cache du Windows Store...
del /q /f "%LOCALAPPDATA%\Packages\Microsoft.WindowsStore_8wekyb3d8bbwe\LocalCache\*.*"
echo [2/2] Réinitialisation du Windows Store...
wsreset.exe
echo.
echo Nettoyage du Windows Store terminé !
pause
exit /b
