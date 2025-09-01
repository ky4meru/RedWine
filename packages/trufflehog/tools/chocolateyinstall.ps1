$ErrorActionPreference = 'Stop'

$packageName = "TruffleHog"
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/trufflesecurity/trufflehog/releases/download/v3.90.5/trufflehog_3.90.5_windows_amd64.tar.gz'

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath "$toolsDir\$packageName.tar.gz" -Url $url
Get-ChocolateyUnzip -FileFullPath "$toolsDir\$packageName.tar.gz" -Destination $toolsDir
Get-ChocolateyUnzip -FileFullPath "$toolsDir\$packageName.tar" -Destination $toolsDir