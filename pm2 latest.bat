@echo off
setlocal enabledelayedexpansion

echo ======================================
echo Checking for Node.js and npm installation...
echo ======================================

REM Check if Node.js is installed
node -v > nul 2>&1
if %errorlevel% neq 0 (
    echo Node.js is not installed. Please install Node.js first.
    pause
    exit /b
)

REM Check if npm is installed
npm -v > nul 2>&1
if %errorlevel% neq 0 (
    echo npm is not installed. Please install npm first.
    pause
    exit /b
)

echo ======================================
echo Installing/Updating PM2...
echo ======================================

REM Check if PM2 is already installed
pm2 -v > nul 2>&1
if %errorlevel% equ 0 (
    echo PM2 is already installed. Updating to the latest version...
    npm install pm2@latest -g
) else (
    echo PM2 is not installed. Installing PM2...
    npm install pm2 -g
)

echo ======================================
echo Verifying PM2 installation...
echo ======================================

REM Verify PM2 installation
pm2 -v
if %errorlevel% equ 0 (
    set pm2_version=
    for /f "delims=" %%i in ('pm2 -v') do set pm2_version=%%i
    echo PM2 installed successfully. Version: !pm2_version!
) else (
    echo PM2 installation failed. Please check npm and Node.js installation.
)

echo ======================================
echo PM2 installation completed.
echo ======================================
pause
