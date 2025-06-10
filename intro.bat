@echo off
color 0A
cls
mode con: cols=100 lines=35

echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                      Initializing Advanced System Maintenance Suite...
echo.
echo                                 Created by Abdelhakim Baalla
echo.
echo.

:: Progress bar animation
set "bar="
for /l %%i in (1,1,50) do (
    set "bar=!bar!█"
    cls
    echo.
    echo.
    echo.
    echo.
    echo.
    echo.
    echo.
    echo.
    echo.
    echo.
    echo                      Initializing Advanced System Maintenance Suite...
    echo.
    echo                                 Created by Abdelhakim Baalla
    echo.
    echo                      [!bar!%string:~%%i,50%]
    echo.
    echo                      Loading system components... %%i%%
    echo.
    echo                      https://abdelhakim-baalla.vercel.app/
    timeout /t 0 /nobreak >nul
)

:: Hacker-style typing effect
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.

set "text=SYSTEM MAINTENANCE SUITE v3.0 - ADVANCED EDITION"
for /l %%i in (0,1,43) do (
    cls
    echo.
    echo.
    echo.
    echo.
    echo.
    echo.
    echo.
    echo.
    echo.
    echo.
    echo                      !text:~0,%%i!
    echo.
    echo                                 Created by Abdelhakim Baalla
    echo.
    echo                      [██████████████████████████████████████████████████]
    echo.
    echo                      System initialized successfully!
    echo.
    echo                      https://abdelhakim-baalla.vercel.app/
    timeout /t 0 /nobreak >nul
)

:: Final loading message
timeout /t 1 /nobreak >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                      SYSTEM MAINTENANCE SUITE v3.0 - ADVANCED EDITION
echo.
echo                                 Created by Abdelhakim Baalla
echo.
echo                      [██████████████████████████████████████████████████]
echo.
echo                      System initialized successfully!
echo.
echo                      https://abdelhakim-baalla.vercel.app/
timeout /t 2 /nobreak >nul
