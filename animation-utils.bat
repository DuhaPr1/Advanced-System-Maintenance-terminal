@echo off
setlocal enabledelayedexpansion

:INTRO_ANIMATION
cls
color 0B
setlocal enabledelayedexpansion
set "frames=| / - \\"
for /l %%i in (1,1,20) do (
    set /a idx=%%i %% 4
    set "frame=!frames:~%idx%,1!"
    cls
    echo.
    echo  ========================================================================
    echo   Lancement de la suite... !frame!
    echo  ========================================================================
    timeout /t 0.1 >nul
)
endlocal
goto :eof

:SHOW_MAIN_MENU
cls
color 0A
echo.
echo  ========================================================================
echo                  ADVANCED SYSTEM MAINTENANCE SUITE v2.5
echo                        By Abdelhakim Baalla
echo  ========================================================================
echo.
goto :eof

:MATRIX_ANIMATION
cls
color 0A
setlocal enabledelayedexpansion
set "chars=0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
for /l %%a in (1,1,15) do (
    cls
    for /l %%b in (1,1,25) do (
        set "line="
        for /l %%c in (1,1,80) do (
            set /a "rnd=!random! %% 62"
            for %%d in (!rnd!) do set "line=!line!!chars:~%%d,1!"
        )
        echo !line!
    )
    timeout /t 0 /nobreak >nul
)
endlocal
goto :eof

:LOADING_BAR
cls
setlocal enabledelayedexpansion
set "bar="
echo.
echo  Loading system components...
echo.
for /l %%i in (1,1,50) do (
    set "bar=!bar!#"
    echo  [!bar!%string:~%%i,50%] %%i%%
    timeout /t 0 /nobreak >nul
    cls
    echo.
    echo  Loading system components...
    echo.
)
echo  [##################################################] 100%%
echo.
echo  System components loaded successfully!
timeout /t 2 >nul
endlocal
goto :eof

:TYPING_EFFECT
setlocal enabledelayedexpansion
set "text=%~1"
set "len=0"
:COUNT_LOOP
if defined text (
    set "text=!text:~1!"
    set /a "len+=1"
    goto COUNT_LOOP
)
set "text=%~1"
for /l %%i in (0,1,%len%) do (
    echo|set /p="!text:~0,%%i!"
    timeout /t 0 /nobreak >nul
    cls
    echo.
    echo|set /p="!text:~0,%%i!"
)
echo.
endlocal
goto :eof

:SPINNER_ANIMATION
setlocal enabledelayedexpansion
set "spinner=-\|/"
for /l %%i in (1,1,20) do (
    for /l %%s in (0,1,3) do (
        echo|set /p=" !spinner:~%%s,1! %~1"
        timeout /t 0 /nobreak >nul
        cls
        echo.
    )
)
endlocal
goto :eof

:COUNTDOWN
setlocal
set /a count=%~1
:COUNTDOWN_LOOP
cls
echo.
echo  Starting in %count% seconds...
timeout /t 1 /nobreak >nul
set /a count-=1
if %count% gtr 0 goto COUNTDOWN_LOOP
cls
echo.
echo  Launching now!
timeout /t 1 /nobreak >nul
endlocal
goto :eof

:SCAN_ANIMATION
setlocal
echo.
for /l %%i in (1,1,10) do (
    echo  Scanning system... [%%i0%%]
    echo  [
    for /l %%j in (1,1,%%i) do echo|set /p="=="
    for /l %%j in (%%i,1,9) do echo|set /p="  "
    echo ]
    timeout /t 0 /nobreak >nul
    cls
    echo.
)
echo  Scanning system... [100%%]
echo  [====================]
echo.
echo  Scan complete!
timeout /t 2 /nobreak >nul
endlocal
goto :eof

:COLOR_CYCLE
setlocal
for %%c in (1 2 3 4 5 6 7 8 9 A B C D E F) do (
    color 0%%c
    echo  %~1
    timeout /t 0 /nobreak >nul
)
endlocal
goto :eof
