@echo off

REM Define Node.js version to install
set NODE_VERSION=20.15.1

REM Define installation directory
set INSTALL_DIR=C:\Users\hp\Desktop\Bat_Script_New_Arizon\installation_version_files\node

REM URL for Node.js installer
set NODE_INSTALLER_URL=https://nodejs.org/dist/v%NODE_VERSION%/node-v%NODE_VERSION%-x64.msi

REM Temporary download path
set TEMP_DOWNLOAD_PATH=%TEMP%\node-v%NODE_VERSION%-x64.msi

echo ======================================
echo Downloading Node.js installer...
echo ======================================

REM Download Node.js installer
powershell -Command "Invoke-WebRequest -Uri %NODE_INSTALLER_URL% -OutFile %TEMP_DOWNLOAD_PATH%"

echo ======================================
echo Installing Node.js...
echo ======================================

REM Install Node.js
msiexec /i %TEMP_DOWNLOAD_PATH% /quiet /norestart

REM Verify installation
echo ======================================
echo Verifying Node.js installation...
echo ======================================

REM Add Node.js to PATH
setx PATH "%INSTALL_DIR%;%PATH%"

REM Check Node.js and npm version
node -v
npm -v

REM Cleanup
del %TEMP_DOWNLOAD_PATH%

echo ======================================
echo Node.js installation completed.
echo ======================================
pause
