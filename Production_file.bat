@echo off

REM Define URLs for the production files
set GDRIVE_URL=https://drive.google.com/drive/folders/14pitMRkVMLIxxSlTF-49AFg6haqGamCa?usp=sharing

REM Define file names and extraction paths
set PROD_ZIP_NAME=gil_cms_prod.zip
set PROXY_ZIP_NAME=gil_cms_https_proxy.zip
set EXTRACT_PATH=C:\Users\hp\Downloads\gil_cms_v1.0.7 (3)

echo ======================================
echo Downloading production files...
echo ======================================

REM Download the production ZIP files using PowerShell
powershell -Command "(New-Object System.Net.WebClient).DownloadFile('%GDRIVE_URL%/gil_cms_prod.zip', '%TEMP%\%PROD_ZIP_NAME%')"
powershell -Command "(New-Object System.Net.WebClient).DownloadFile('%GDRIVE_URL%/gil_cms_https_proxy.zip', '%TEMP%\%PROXY_ZIP_NAME%')"

echo ======================================
echo Extracting production files...
echo ======================================

REM Create extraction directory if it doesn't exist
if not exist "%EXTRACT_PATH%" (
    mkdir "%EXTRACT_PATH%"
)

REM Extract the production ZIP files using PowerShell
powershell -Command "Expand-Archive -Path '%TEMP%\%PROD_ZIP_NAME%' -DestinationPath '%EXTRACT_PATH%\gil_cms_prod' -Force"
powershell -Command "Expand-Archive -Path '%TEMP%\%PROXY_ZIP_NAME%' -DestinationPath '%EXTRACT_PATH%' -Force"

echo ======================================
echo Production files extracted to: %EXTRACT_PATH%\gil_cms_prod
echo ======================================

pause
