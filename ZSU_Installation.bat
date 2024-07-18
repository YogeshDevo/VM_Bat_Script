@echo off

REM Define the path to the ZSU installer
set ZSU_INSTALLER_PATH=C:\Users\hp\Desktop\Bat_Script_New_Arizon\installation_version_files\Driver\ZebraFD.exe

REM Define the expected version of ZSU
set EXPECTED_VERSION=1.1.9.1325

echo ======================================
echo Installing Zebra Setup Utilities...
echo ======================================

REM Install ZSU silently
%ZSU_INSTALLER_PATH% /quiet

echo ======================================
echo Verifying Zebra Setup Utilities installation...
echo ======================================

REM Get the installed version of ZSU
for /f "tokens=2 delims==" %%i in ('wmic product where "Name like '%%Zebra Setup Utilities%%'" get Version /value') do set INSTALLED_VERSION=%%i

REM Check if the installed version matches the expected version
if "%INSTALLED_VERSION%"=="%EXPECTED_VERSION%" (
    echo Zebra Setup Utilities version %INSTALLED_VERSION% installed successfully.
) else (
    echo Installed Zebra Setup Utilities version %INSTALLED_VERSION% does not match the expected version %EXPECTED_VERSION%.
    echo Please check the installation.
)

echo ======================================
echo Installation and verification completed.
echo ======================================
pause
