@echo off

REM Define variables
set PM2_CONFIG=server.js
set PM2_INSTANCES=5

echo ======================================
echo Starting Node.js proxy server with PM2...
echo ======================================

REM Start proxy server using PM2
pm2 start "%PM2_CONFIG%" -i %PM2_INSTANCES%

echo ======================================
echo Node.js proxy server started with PM2.
echo ======================================

pause