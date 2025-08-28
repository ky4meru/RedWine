$ErrorActionPreference = 'Stop'

$packageName = "BruteSpray"
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/x90skysn3k/brutespray/releases/download/v2.4.0/brutespray_2.4.0_windows_amd64.tar.gz'

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath "$toolsDir\$packageName.tar.gz" -Url $url
Get-ChocolateyUnzip -FileFullPath "$toolsDir\$packageName.tar.gz" -Destination $toolsDir
Get-ChocolateyUnzip -FileFullPath "$toolsDir\$packageName.tar" -Destination $toolsDir