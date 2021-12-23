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

            write-host $row.name
            if (-not $row.name.StartsWith('#'))
            {

                # check if vm exist
                $vm = get-vm -name $row.name -ErrorAction SilentlyContinue

                if (-not $vm)
                {
                    # expect range in GB 
                    $memory = [System.Int64]($row.memory)*1024*1024*1024
                    $cpus = [System.Int64]$row.cpus

                    .\clone-vm.ps1 -name $row.name -templatedisk $row.template -memory $memory -adddatadisk $false -cpus $cpus
        
                    # allocate datadisk(s)
                    $cnt = 1
                    foreach($disk in $row.disks.split(';'))
                    {
                        $disksize = [System.Int64]($disk)*1024*1024*1024
                        $diskname = "data-$cnt"
                        .\add-datadisk.ps1 -name $row.name -disksize $disksize -diskname $diskname
                        $cnt++
                    }
                }
                else {
                    Write-Warning "$($row.name) already exist"
                }
    
            }
            else {
                Write-Warning "$($row.name) ignored"
            }
        }
    }
    else {
        Write-Error "$csv not found"
    }

}
catch {
    write-host $_.exception
}

