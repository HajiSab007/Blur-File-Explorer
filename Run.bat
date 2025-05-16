@echo off
chcp 65001 >nul
start setting.bat
:menu
cls
echo                                     [97m┌───────────────────────────────┐
echo                                     [97m│  [92m1. [97mInstall   [92m2. [97mUninstall    │
echo                                     [97m│                               │
echo                                     [97m│          [92m3. [91mExit              [97m│
echo                                     [97m└───────────────────────────────┘
<nul set /p "=┌─── (@%username%) "
echo.
<nul set /p "=└─# "
set /p choice=
if "%choice%"=="1" (
    call "C:\Program Files\register.cmd"
    exit
)

if "%choice%"=="2" (
    call "C:\Program Files\uninstall.cmd"
    exit
)

if "%choice%"=="3" (
    exit
)
echo Invalid choice! Try again.
pause
goto menu
