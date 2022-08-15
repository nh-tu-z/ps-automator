param(
    [Parameter(Mandatory)][string]$path
)

# TODO - validate param input

# TODO - get array from param input
# Write-Output $replace

function Help {
    Write-Output "The tool is used to replace a specific characters by another texts in the file's content"
    Write-Output "There are 2 modes:"
    Write-Output "  + Specific file"
    Write-Output "  + Recursive"
}
Write-Output $path
$files = Get-ChildItem -Path $path

Write-Output "Start Running...!!!"

foreach($file in $files)
{
    (Get-Content $file.FullName) -Replace '\${schema}', 'dbo' | Set-Content $file.FullName
}

Write-Output "Completed...!!!"
