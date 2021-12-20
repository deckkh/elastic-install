param
(
  [Parameter(Mandatory=$true)]
  [String]$name
)


$vmhost  =get-vmhost

$diskdir = $vmhost.VirtualHardDiskPath

# remove vm itself

try {

    Write-Host "Removing vm $($name)"

    $vm = get-vm -name $name -ErrorAction SilentlyContinue

    if ($vm)
    {
        $vm| Stop-VM -force
        $vm |remove-vm -force
    }
    else {
        Write-Warning "$name doesn't exist"
    }

}
catch {
   
    write-host $_.Exception
}

# remove asscociated disk files

try {
    
    Get-ChildItem -Path $diskdir -Filter "$name*" -Recurse | ForEach-Object {
        Write-Host "Removing disk $($_.FullName)"
        Remove-Item -Path $($_.FullName) -force
    }
}
catch {
    
    write-host $_.Exception

}