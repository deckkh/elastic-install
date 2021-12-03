$name = read-host 

write-host "creating $name"

$memory = 2048*1024*1024
$diskdir = "C:\Users\Public\Documents\Hyper-V\Virtual hard disks"
$templatedisk= "centos8-template"
$destdisk = "$($diskdir)\$($name).vhdx"
$sourcedisk = "$($diskdir)\$($templatedisk).vhdx"

$vm = new-vm -Name $name -MemoryStartupBytes $memory

Convert-VHD -Path $sourcedisk  -DestinationPath $destdisk

$vm |Add-VMHardDiskDrive -Path $destdisk
 
$vm | Get-VMNetworkAdapter | Connect-VMNetworkAdapter -SwitchName "nat-switch"