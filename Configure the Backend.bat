@echo off

REM Define variables for database connection
set DB_NAME=gil_cms2
set DB_USERNAME=sa
set DB_PASSWORD=YogeshL@123

REM Define paths and filenames
set ENV_FILE_PATH=C:\Users\hp\Desktop\intern_Arizon_New\gil_cms_backend\.env

echo ======================================
echo Configuring backend environment...
echo ======================================

REM Update .env file
(
  echo DATABASE_URL='sqlserver://localhost:1433;database=%DB_NAME%;username=%DB_USERNAME%;password=%DB_PASSWORD%;integratedSecurity=false;encrypt=true;trustServerCertificate=true;'
  echo AUTH_TYPE=ldap
  echo PORT=80
  echo SQLSERVER_HOST=localhost
  echo SQLSERVER_USER=%DB_USERNAME%
  echo SQLSERVER_PASSWORD=%DB_PASSWORD%
  echo SQLSERVER_DB_NAME=%DB_NAME%
  echo SQLSERVER_DB_BACKUP_PATH=C:/sqlserver_Backup
  echo JWT_SECRET=somesecret
  echo SUPER_ADMIN_USERNAME=super-admin
  echo SUPER_ADMIN_PASSWORD=Arizon@123
  echo PRISMA_OPTIMIZE=N
  echo PRISMA_LOGGING=Y
  echo NODE_ENV=production
) > "%ENV_FILE_PATH%"

REM Additional configuration updates (if needed)
REM Example: Update config.json with database configuration
REM powershell -Command "(Get-Content '%CONFIG_FILE_PATH%') -replace '""database"": ""old_db_name""', '""database"": ""%DB_NAME%""' | Set-Content '%CONFIG_FILE_PATH%'"

echo ======================================
echo Backend environment configured.
echo ======================================

pause
