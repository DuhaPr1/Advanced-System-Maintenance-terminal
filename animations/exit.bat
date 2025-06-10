@echo off
color 0C
cls
mode con: cols=100 lines=35

:: Countdown animation
for /l %%i in (3,-1,1) do (
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
    echo                      Shutting down Advanced System Maintenance Suite...
    echo.
    echo                                 Created by Abdelhakim Baalla
    echo.
    echo                      System will exit in %%i seconds...
    echo.
    echo                      Thank you for using our tools!
    echo.
    echo                      https://abdelhakim-baalla.vercel.app/
    timeout /t 1 /nobreak >nul
)

:: Final exit message with glitch effect
for /l %%i in (1,1,5) do (
    cls
    color 0C
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
    echo                      System shutdown complete.
    echo.
    echo                      Created by Abdelhakim Baalla
    echo.
    echo                      Goodbye!
    echo.
    echo                      https://abdelhakim-baalla.vercel.app/
    timeout /t 0 /nobreak >nul
    
    cls
    color 0F
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
    echo                      S%$tem sh#tdown c*mplete.
    echo.
    echo                      Cr@ated by Abd&lhakim Ba@lla
    echo.
    echo                      G00dby3!
    echo.
    echo                      https://abd3lhakim-ba@lla.v3rcel.app/
    timeout /t 0 /nobreak >nul
)

cls
color 07
