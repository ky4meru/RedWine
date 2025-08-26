$ErrorActionPreference = 'Stop'

$packageName = 'AbuseAzureAPIPermissions'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/Hagrid29/AbuseAzureAPIPermissions/archive/refs/heads/main.zip'
$zipPath = $(Join-Path $toolsDir "$packageName.zip")
$ps1Path = $(Join-Path $toolsDir "$packageName-main\$packageName.ps1")

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath $zipPath -Url $url
Get-ChocolateyUnzip -FileFullPath $zipPath -Destination $toolsDir

Add-Content -Path $PROFILE -Value "Import-Module $ps1Path"