param(
    [Parameter(Mandatory)][string]$service
)

$config = Get-Content './test-source/configuration.json' | Out-String | ConvertFrom-Json

$path = ''
if (($config.FolderPath) -and (Test-Path $config.FolderPath)) {
    $path = Join-Path $config.FolderPath $service
}
else {
    $path = "./src/$service"
}
New-Item -ItemType "directory" -Path $path
Write-Output "Created path $path"

# Write-Host $config
# Write-Host $config.EndIp