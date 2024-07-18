@echo off

REM Define paths for your scripts and projects
set BASE_PATH=C:\Users\hp\Desktop\Final_Bat_Script_Result
set FRONTEND_PATH=C:\Users\hp\Desktop\intern_Arizon_New\gil-cms-react
set BACKEND_PATH=C:\Users\hp\Downloads\gil_cms_backend\gil_cms_backend

REM Run Proxy and Prod Setup Sequentially

echo ======================================
echo Setting up Proxy and Prod...
echo ======================================

REM 1. Configure the backend
call "%BASE_PATH%\Configure the Backend.bat"

REM 2. Install dependencies
call "%BASE_PATH%\installing_Dependencies.bat"

REM 3. Install Node.js
call "%BASE_PATH%\Node_Installation.bat"

REM 4. Install PM2
call "%BASE_PATH%\PM2_Installation.bat"

REM 5. Download and extract production files
call "%BASE_PATH%\Production_file.bat"

REM 6. Start Proxy Server Application
call "%BASE_PATH%\Proxy_Server_Application.bat"

REM 8. Seed the database
call "%BASE_PATH%\Seeding_db.bat"

REM 9. Setup and migrate database
call "%BASE_PATH%\SetUp_Migrate_db.bat"

REM 10. Install SQL Server 2022
call "%BASE_PATH%\install_sql_server.bat"

REM 11. Install SSMS
call "%BASE_PATH%\SSMS_Installation.bat"

REM 12. Validate installations
call "%BASE_PATH%\Validation_Steps_Ins.bat"

REM 13. Install Zebra Setup Utilities
call "%BASE_PATH%\ZSU_Installation.bat"

echo ======================================
echo All setup tasks executed successfully.
echo Starting Node.js application with PM2...
echo ======================================

REM Run Backend Application with PM2
call "%BASE_PATH%\Run_Backend.bat"

REM Navigate to the backend, fetch and pull latest changes, install dependencies, push Prisma schema, and start the backend
echo ======================================
echo Starting backend application...
echo ======================================
cd %BACKEND_PATH%
git fetch --all
git pull
call npm install --legacy-peer-deps
call npx prisma db push
start cmd /k "npm run dev"

REM Navigate to the frontend, install dependencies, and start the frontend
echo ======================================
echo Starting frontend application...
echo ======================================
cd %FRONTEND_PATH%
call npm install --legacy-peer-deps
start cmd /k "npm start"

echo ======================================
echo Project started successfully!
echo ======================================

pause
