param
(
  [Parameter(Mandatory=$true)]
  [String]$csv,
  [Parameter(Mandatory=$true)]
  [String]$force
)

try {

    if ($force -eq "YES")
    {

        if (Test-Path $csv)
        {
            $deploy = Import-Csv -path $csv 

            foreach($row in $deploy)
            {
                .\delete-vm.ps1 -name $row.name
            }
        }
        else {
            Write-Error "$csv not found"
        }
    }

}
catch {
    
    write-host $_.Exception

}

