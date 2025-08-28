$ErrorActionPreference = 'Stop'

$packageName = "AzureHound"
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/SpecterOps/AzureHound/releases/download/v2.7.1/AzureHound_v2.7.1_windows_amd64.zip'

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath "$toolsDir\$packageName.zip" -Url $url
Get-ChocolateyUnzip -FileFullPath "$toolsDir\$packageName.zip" -Destination $toolsDir