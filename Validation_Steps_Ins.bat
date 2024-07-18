@echo off

REM Define SQL Server connection details
set SERVER_NAME=DESKTOP-12FFOCT
set SQL_USERNAME=sa
set SQL_PASSWORD=yogesh@123

echo ======================================
echo Validating Windows configuration...
echo ======================================

REM Get system info
systeminfo

REM Get OS version
echo OS Version:
ver

REM Pause to allow the user to review the information
pause

echo ======================================
echo Validating Node.js and PM2 installations...
echo ======================================

REM Get Node.js version
echo Node.js Version:
node -v

REM Get PM2 version
echo PM2 Version:
pm2 -v

REM Pause to allow the user to review the information
pause

echo ======================================
echo Validating SSMS installation...
echo ======================================

REM Get SSMS version
echo SSMS Version:
wmic product where "name like 'SQL Server Management Studio%'" get version

REM Pause to allow the user to review the information
pause

echo ======================================
echo Validating MSSQL installation...
echo ======================================

REM Validate MSSQL version using sqlcmd
echo MSSQL Version:
sqlcmd -S %SERVER_NAME% -U %SQL_USERNAME% -P %SQL_PASSWORD% -Q "SELECT @@VERSION"

REM Pause to allow the user to review the information
pause

echo ======================================
echo Validating Zebra Setup Utilities installation...
echo ======================================

REM Get ZSU version
echo ZSU Version:
wmic product where "name like 'zebra setup utilities'" get version

REM Pause to allow the user to review the information
pause

echo ======================================
echo Validation steps completed.
echo ======================================
pause
