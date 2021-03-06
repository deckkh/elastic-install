param
(
  [Parameter(Mandatory=$false)]
  [Int64]$memory=2*1024*1024*1024,
  [Parameter(Mandatory=$false)]
  [Int64]$minmemory=0,
  [Parameter(Mandatory=$false)]
  [String]$templatedisk="centos8-template",
  [Parameter(Mandatory=$false)]
  [String]$switchname="nat-switch",
  [Parameter(Mandatory=$true)]
  [String]$name,
  [Parameter(Mandatory=$false)]
  [String]$diskname="data",
  [Parameter(Mandatory=$false)]
  [bool]$adddatadisk=$false,
  [Parameter(Mandatory=$false)]
  [Int64]$disksize,
  [Parameter(Mandatory=$false)]
  [Int64]$cpus=1
)


$vmhost  =get-vmhost

$diskdir = $vmhost.VirtualHardDiskPath
$destdisk = "$($diskdir)\$($name).vhdx"
$sourcedisk = "$($diskdir)\$($templatedisk).vhdx"


#  .\clone-vm.ps1 -memory 2GB -name dummy -adddatadisk $true -disksize 20GB -minmemory 2GB


try {

    # check if vm exist
    $vm = get-vm -name $name -ErrorAction SilentlyContinue

    if (-not $vm)
    {
        $vm = new-vm -Name $name -MemoryStartupBytes $memory

        if ($cpus -ne 1)
        {
            $vm |Set-VMProcessor -Count $cpus
        }

        if ($minmemory -ne 0)
        {
            $vm |Set-VMMemory -MinimumBytes $minmemory
        }

        Convert-VHD -Path $sourcedisk  -DestinationPath $destdisk
        
        $vm |Add-VMHardDiskDrive -Path $destdisk
         
        $vm | Get-VMNetworkAdapter | Connect-VMNetworkAdapter -SwitchName $switchname
        
        if ($adddatadisk)
        {
            $datadisk = "$($diskdir)\$($name)-$($diskname).vhdx"
            new-vhd -Dynamic $datadisk  -SizeBytes $disksize
            ADD-VMHardDiskDrive -vmname $name -path $datadisk -ControllerType SCSI -ControllerNumber 0 
        }    
    
    }
    else {
        Write-Warning "$name already exist"
    }
}
catch {
 
    write-host $_.Exception
}
