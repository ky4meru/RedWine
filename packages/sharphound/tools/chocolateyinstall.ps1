$ErrorActionPreference = 'Stop'

$packageName = "SharpHound"
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/SpecterOps/SharpHound/releases/download/v2.7.1/SharpHound_v2.7.1_windows_x86.zip'

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath "$toolsDir\$packageName.zip" -Url $url
Get-ChocolateyUnzip -FileFullPath "$toolsDir\$packageName.zip" -Destination $toolsDir