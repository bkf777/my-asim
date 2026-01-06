@echo off
setlocal enabledelayedexpansion

:: Use a simple date format that works in CMD
set "datestr=%date% %time%"

:: Use argument if provided, else use default
if "%~1"=="" (
    set "msg=Auto commit at !datestr!"
) else (
    set "msg=%~1"
)

echo Adding changes...
git add .

echo Committing with message: !msg!
git commit -m "!msg!"

echo Pushing to remote...
git push

if %errorlevel% neq 0 (
    echo.
    echo [ERROR] Push failed.
    exit /b %errorlevel%
)

echo.
echo [SUCCESS] Changes pushed successfully.
