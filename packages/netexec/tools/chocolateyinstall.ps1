$ErrorActionPreference = 'Stop'

$packageName = "NetExec"
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/Pennyw0rth/NetExec/releases/download/v1.4.0/nxc-windows-latest.zip'

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath "$toolsDir\$packageName.zip" -Url $url
Get-ChocolateyUnzip -FileFullPath "$toolsDir\$packageName.zip" -Destination $toolsDir