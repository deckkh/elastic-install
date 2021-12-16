Write-Host "Add data disk to vm"
Write-Host "enter vm name"

$name = read-host 

Write-Host "enter size fx 50GB"

$disksize = read-host 

write-host "adding disk to  $name"

$diskdir = "C:\Users\Public\Documents\Hyper-V\Virtual hard disks"
$datadisk = "$($diskdir)\$($name)-data.vhdx"

new-vhd -Dynamic $diskdir\$name-data.vhdx -SizeBytes $disksize

ADD-VMHardDiskDrive -vmname $name -path $datadisk -ControllerType SCSI -ControllerNumber 0 
