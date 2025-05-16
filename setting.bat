@echo off
setlocal

:: Self-elevate if not running as Administrator
>nul 2>&1 "%SystemRoot%\system32\cacls.exe" "%SystemRoot%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    echo Requesting admin rights...
    powershell -Command "Start-Process '%~f0' -Verb runAs"
    exit /b
)

set "SOURCE=%~dp0Release"
set "DEST=C:\Program Files"

:: Kill Explorer to release DLL lock
taskkill /f /im explorer.exe >nul 2>&1

:: Unregister and delete old files
regsvr32 /u /s "%DEST%\ExplorerBlurMica.dll" >nul 2>&1
del "%DEST%\config.ini" >nul 2>&1
del "%DEST%\ExplorerBlurMica.dll" >nul 2>&1
del "%DEST%\register.cmd" >nul 2>&1
del "%DEST%\uninstall.cmd" >nul 2>&1

:: Copy new files
xcopy "%SOURCE%\config.ini" "%DEST%\" /Y >nul
xcopy "%SOURCE%\ExplorerBlurMica.dll" "%DEST%\" /Y >nul
xcopy "%SOURCE%\register.cmd" "%DEST%\" /Y >nul
xcopy "%SOURCE%\uninstall.cmd" "%DEST%\" /Y >nul

:: Restart Explorer
start explorer.exe


exit
exit