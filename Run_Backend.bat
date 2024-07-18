@echo off

REM Define variables
set PM2_CONFIG=src/index.js
set PM2_INSTANCES=5

echo ======================================
echo Starting Node.js application with PM2...
echo ======================================

REM Start Node.js application using PM2
pm2 start "%PM2_CONFIG%" -i %PM2_INSTANCES%

echo ======================================
echo Node.js application started with PM2.
echo ======================================
pause
