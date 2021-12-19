param
(
  [Parameter(Mandatory=$true)]
  [String]$csv
)

try {

    if (Test-Path $csv)
    {
        $deploy = Import-Csv -path $csv 

        foreach($row in $deploy)
        {
            $memory = [System.Int64]($row.memory)*1024*1024*1024
            .\clone-vm.ps1 -name $row.name -templatedisk $row.template -memory $memory -adddatadisk $false

            $cnt = 1
            foreach($disk in $row.disks.split(';'))
            {
                $disksize = [System.Int64]($disk)*1024*1024*1024
                $diskname = "data-$cnt"
                .\add-datadisk.ps1 -name $row.name -disksize $disksize -diskname $diskname
                $cnt++
            }


        }
    }
    else {
        Write-Error "$csv not found"
    }

}
catch {
    
    write-host $_.Exception

}

