@echo off
title Laravel Development Server - Local IP
color 0A

REM ========================================
echo ========================================
echo    Laravel Development Server Starter
echo ========================================
echo.

REM Automatically detect local IP
for /f "tokens=2 delims=:" %%A in ('ipconfig ^| find "IPv4"') do (
    set "LOCAL_IP=%%A"
)
set LOCAL_IP=%LOCAL_IP: =%
echo Starting server on: http://%LOCAL_IP%:8000
echo.
echo Press Ctrl+C to stop the server
echo.
echo ========================================
echo.

REM Use XAMPP PHP path to start Laravel server
D:\xampp8.2\php\php.exe artisan serve --host=%LOCAL_IP% --port=8000

pause