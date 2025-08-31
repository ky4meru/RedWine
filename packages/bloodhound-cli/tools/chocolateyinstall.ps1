$ErrorActionPreference = 'Stop'

$packageName = "BloodHound CLI"
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileFullPath = $(Join-Path $toolsDir "$packageName.zip")
$url = 'https://github.com/SpecterOps/bloodhound-cli/releases/download/v0.1.8/bloodhound-cli-windows-amd64.zip'

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath $fileFullPath -Url $url
Get-ChocolateyUnzip -FileFullPath $fileFullPath -Destination $toolsDir