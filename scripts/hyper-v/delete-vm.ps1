param
(
  [Parameter(Mandatory=$true)]
  [String]$name
)


$vmhost  =get-vmhost

$diskdir = $vmhost.VirtualHardDiskPath

try {
    
    $vm = get-vm -name $name

    $vm| Stop-VM -force
    $vm |remove-vm -force

    Get-ChildItem -Path $diskdir -Filter "$name-*.vhdx" -Recurse -File -Name| ForEach-Object {
        [System.IO.Path]::GetFileNameWithoutExtension($_)
    }
}
catch {
    
}