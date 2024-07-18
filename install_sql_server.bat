@echo off
setlocal

REM Set the path to the SQL Server installer
set SQL_INSTALLER_PATH=C:\Users\hp\Desktop\Final_Bat_Script_Result\installation_version_files\SQL2022-SSEI-Eval.exe

REM Check if the installer exists
if not exist "%SQL_INSTALLER_PATH%" (
    echo SQL Server installer not found at %SQL_INSTALLER_PATH%
    pause
    exit /b 1
)

REM Run the SQL Server installer with necessary parameters
echo Starting SQL Server installation...
"%SQL_INSTALLER_PATH%" /Q /ACTION=Install /IAcceptSQLServerLicenseTerms

REM Check if the installation was successful
if %errorlevel% neq 0 (
    echo SQL Server installation failed with error code %errorlevel%
    pause
    exit /b 1
)

echo SQL Server installation completed successfully.
pause
endlocal

