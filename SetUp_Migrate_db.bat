@echo off

echo ======================================
echo Setting up and migrating database...
echo ======================================

REM Run Prisma to setup and migrate database
npx prisma db push

echo ======================================
echo Database setup and migration completed.
echo ======================================
pause
