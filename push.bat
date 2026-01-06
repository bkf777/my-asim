@echo off
setlocal enabledelayedexpansion

:: 获取当前时间作为默认 commit message
set "datestr=%date:~0,4%-%date:~5,2%-%date:~8,2% %time:~0,2%:%time:~3,2%:%time:~6,2%"

:: 如果提供了参数，则使用参数作为 commit message
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
    echo [ERROR] Push failed. Please check your connection or git status.
    exit /b %errorlevel%
)

echo.
echo [SUCCESS] Changes pushed successfully.
pause
