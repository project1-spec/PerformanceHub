@echo off
title PerformanceHub Server
color 0A
echo.
echo  ======================================================
echo    PerformanceHub - Fitness Analytics Platform
echo  ======================================================
echo.

:: Check for Python
where python >nul 2>nul
if %errorlevel% neq 0 (
    echo  [ERROR] Python is not installed or not in PATH.
    echo  Please install Python from https://www.python.org/downloads/
    echo.
    pause
    exit /b 1
)

:: Install bcrypt if needed
echo  [1/3] Checking dependencies...
python -c "import bcrypt" 2>nul
if %errorlevel% neq 0 (
    echo  Installing bcrypt...
    pip install bcrypt
)

:: Change to script directory
cd /d "%~dp0"

:: Kill any existing server on port 8080
for /f "tokens=5" %%a in ('netstat -aon ^| findstr ":8080" ^| findstr "LISTENING"') do (
    taskkill /PID %%a /F >nul 2>nul
)

echo  [2/3] Starting server...
echo.
echo  --------------------------------------------------------
echo   Server:  http://localhost:8080
echo   Login:   demo@performancehub.com / demo123
echo  --------------------------------------------------------
echo.

:: Open browser after 2 second delay
start "" cmd /c "timeout /t 2 /nobreak >nul & start http://localhost:8080"

echo  [3/3] Server running! Press Ctrl+C to stop.
echo.

:: Start the server (blocking)
python server.py
