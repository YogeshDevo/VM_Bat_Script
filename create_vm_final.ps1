param (
    [string]$VMName,
    [string]$VHDPath,
    [string]$ISOPath,
    [string]$SwitchName,
    [int64]$MemoryStartupBytes,
    [int64]$VHDSizeBytes
)

# Create VM
New-VM -Name $VMName -MemoryStartupBytes $MemoryStartupBytes -SwitchName $SwitchName

# Add DVD drive and attach ISO
Add-VMDvdDrive -VMName $VMName
Set-VMDvdDrive -VMName $VMName -Path $ISOPath

# Create and attach VHDX disk
New-VHD -Path $VHDPath -SizeBytes $VHDSizeBytes
Add-VMHardDiskDrive -VMName $VMName -Path $VHDPath

# Start the VM
Start-VM -Name $VMName
