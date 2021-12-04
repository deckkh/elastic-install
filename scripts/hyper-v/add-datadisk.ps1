$name = read-host 

write-host "adding disk to  $name"

$diskdir = "C:\Users\Public\Documents\Hyper-V\Virtual hard disks"
$datadisk = "$($diskdir)\$($name)-data.vhdx"

new-vhd -Dynamic $diskdir\$name-data.vhdx -SizeBytes 50GB

stop-vm -name $name
ADD-VMHardDiskDrive -vmname $name -path $datadisk
start-vm -name $name
