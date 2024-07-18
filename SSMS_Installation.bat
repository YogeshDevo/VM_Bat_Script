@echo off
set "SSMSInstallerPath=C:\Users\hp\Desktop\Final_Bat_Script_Result\installation_version_files\SSMS-Setup-ENU.exe"

rem Check if the SSMS installer exists at the specified path
if not exist "%SSMSInstallerPath%" (
    echo SSMS installer not found at the specified path: %SSMSInstallerPath%
    pause
    exit /b
)

rem Execute the SSMS installer
echo Starting SSMS installation...
start "" "%SSMSInstallerPath%"

rem Check if the installer launched successfully
if %ERRORLEVEL% neq 0 (
    echo Failed to launch SSMS installer.
    pause
    exit /b
)

echo SSMS installer launched successfully.
pause
exit /b
