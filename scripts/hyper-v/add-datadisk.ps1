param
(
  [Parameter(Mandatory=$true)]
  [Int64]$disksize,
  [Parameter(Mandatory=$true)]
  [String]$name
)


write-host "adding $disksize disk to  $name"

$diskdir = "C:\Users\Public\Documents\Hyper-V\Virtual hard disks"
$datadisk = "$($diskdir)\$($name)-data.vhdx"

new-vhd -Dynamic $diskdir\$name-data.vhdx -SizeBytes $disksize

ADD-VMHardDiskDrive -vmname $name -path $datadisk -ControllerType SCSI -ControllerNumber 0 
