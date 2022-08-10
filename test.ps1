$sqlFiles = Get-ChildItem -Path "C:\Users\tuhngo\Desktop\powershell\test-source"

foreach($item in $sqlFiles)
{
    Write-Output $item.FullName
}
