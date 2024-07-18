@echo off

echo ======================================
echo Installing PM2...
echo ======================================

REM Check if PM2 is already installed
pm2 -v > nul 2>&1
if %errorlevel% equ 0 (
    echo PM2 is already installed. Skipping installation.
) else (
    REM Install PM2 globally using npm
    npm install pm2 -g

    echo ======================================
    echo Verifying PM2 installation...
    echo ======================================

    REM Verify PM2 installation
    pm2 -v

    if %errorlevel% equ 0 (
        echo PM2 installed successfully.
    ) else (
        echo PM2 installation failed. Please check the npm and Node.js installation.
    )
)

echo ======================================
echo PM2 installation completed.
echo ======================================
pause
