$sqlFiles = Get-ChildItem -Path "C:\Users\tuhngo\Desktop\powershell\test-source"

foreach($item in $sqlFiles)
{
    Write-Output $item.FullName
    #Get-Content $item.FullName
    (Get-Content $item.FullName) -Replace '\${schema}', 'dbo' | Set-Content $item.FullName
}
