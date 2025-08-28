$ErrorActionPreference = 'Stop'

$packageName = "Naabu"
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/projectdiscovery/naabu/releases/download/v2.3.5/naabu_2.3.5_windows_amd64.zip'

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath "$toolsDir\$packageName.zip" -Url $url
Get-ChocolateyUnzip -FileFullPath "$toolsDir\$packageName.zip" -Destination $toolsDir