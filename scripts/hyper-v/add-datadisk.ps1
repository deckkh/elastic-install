param
(
  [Parameter(Mandatory=$true)]
  [Int64]$disksize,
  [Parameter(Mandatory=$true)]
  [String]$name,
  [Parameter(Mandatory=$false)]
  [String]$diskname="data"

)

try {

write-host "adding $disksize disk to  $name"

$vmhost  =get-vmhost

$diskdir = $vmhost.VirtualHardDiskPath
$datadisk = "$($diskdir)\$($name)-$($diskname).vhdx"

new-vhd -Dynamic $diskdir\$name-$diskname.vhdx -SizeBytes $disksize

ADD-VMHardDiskDrive -vmname $name -path $datadisk -ControllerType SCSI -ControllerNumber 0 

}
catch {
  write-host $_.Exception

}
