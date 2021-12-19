param
(
  [Parameter(Mandatory=$true)]
  [String]$csv
)

try {

    if (Test-Path $csv)
    {
        $deploy = Import-Csv -path $csv -Header "name" , "memory", "switch","template","disks" -Delimiter ';'

        $vmhost  =get-vmhost
        foreach($row in $deploy)
        {
            write-host "Creating vm $($row.name)"


            $diskdir = $vm.VirtualHardDiskPath
            $destdisk = "$($diskdir)\$($row.name).vhdx"
            $sourcedisk = "$($diskdir)\$($row.template).vhdx"



            $vm = new-vm -Name $row.name -MemoryStartupBytes $row.memory

            Convert-VHD -Path $sourcedisk  -DestinationPath $destdisk
            
            $vm |Add-VMHardDiskDrive -Path $destdisk
             
            $vm | Get-VMNetworkAdapter | Connect-VMNetworkAdapter -SwitchName $row.switchname
            
            # if ($adddatadisk)
            # {
            #     $datadisk = "$($diskdir)\$($name)-data.vhdx"
            #     new-vhd -Dynamic $datadisk  -SizeBytes $disksize
            #     ADD-VMHardDiskDrive -vmname $name -path $datadisk -ControllerType SCSI -ControllerNumber 0 
            # }    
        

        }
    }
    else {
        Write-Error "$csv not found"
    }

}
catch {
    
    write-host $ErrorMessage = $_.Exception.Message

}

