@echo off
title Laravel LAN Startup (Fast)
color 0A

:: ================================
:: Go to project directory
:: ================================
cd /d "%~dp0"

if not exist artisan (
    echo ERROR: Not a Laravel project.
    pause
    exit
)

:: ================================
:: Set PHP path (XAMPP)
:: ================================
set "PHP_EXE=D:\xampp8.2\php\php.exe"

:: ================================
:: Start MySQL only (skip Apache)
:: ================================
echo Starting MySQL...
start "" "C:\xampp\mysql\bin\mysqld.exe"
timeout /t 2 /nobreak >nul

:: ================================
:: Detect Local IP
:: ================================
set "IP="
for /f "tokens=2 delims=:" %%A in ('ipconfig ^| findstr "IPv4"') do (
    set "IP=%%A"
)
set "IP=%IP: =%"
echo Detected IP: %IP%

:: ================================
:: Start Laravel Server on LAN
:: ================================
echo Starting Laravel server...
start "Laravel Server" cmd /k "%PHP_EXE% artisan serve --host=%IP% --port=8000"

:: ================================
:: Wait briefly then open browser
:: ================================
timeout /t 3 /nobreak >nul
start http://%IP%:8000

echo ----------------------------------------
echo Laravel running at:
echo http://%IP%:8000
echo ----------------------------------------

pause