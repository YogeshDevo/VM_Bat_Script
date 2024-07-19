@echo off

REM Define the path to the PowerShell script
set PS_SCRIPT_PATH=C:\Users\hp\Desktop\NOt Required\create_vm_final.ps1

REM Define parameters for the PowerShell script
set VMName=YourVMName
set VHDPath=C:\ProgramData\Microsoft\Windows\Virtual Hard Disks\Gil_Cms_Me_New.vhdx
set ISOPath=C:\Users\hp\Downloads\SERVER_EVAL_x64FRE_en-us.iso
set SwitchName=Default Switch
set MemoryStartupBytes=2147483648
set VHDSizeBytes=107374182400

REM Open Hyper-V Manager
start "Hyper-V Manager" "mmc.exe" "virtmgmt.msc"

REM Pause to ensure Hyper-V Manager is open
timeout /t 3 /nobreak > nul

REM Run the PowerShell script with parameters
powershell -NoProfile -ExecutionPolicy Bypass -Command "& '%PS_SCRIPT_PATH%' -VMName '%VMName%' -VHDPath '%VHDPath%' -ISOPath '%ISOPath%' -SwitchName '%SwitchName%' -MemoryStartupBytes %MemoryStartupBytes% -VHDSizeBytes %VHDSizeBytes%"

echo ======================================
echo Virtual machine creation initiated.
echo ======================================
pause
