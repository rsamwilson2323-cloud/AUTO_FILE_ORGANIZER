
@echo off
setlocal
title UNIVERSAL FILE ORGANIZER
color 0B

echo ==========================================
echo       UNIVERSAL FILE ORGANIZER
echo ==========================================
echo.
echo Starting organizer...
echo.

cd /d "%~dp0"

if not exist "%~dp0Organizer.ps1" (
    echo ERROR: Organizer.ps1 is missing!
    echo Keep both files in the same folder.
    echo.
    pause
    exit /b
)

powershell.exe -NoProfile -ExecutionPolicy Bypass -NoExit -File "%~dp0Organizer.ps1"

echo.
echo Organizer process ended.
pause