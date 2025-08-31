$ErrorActionPreference = 'Stop'

$packageName = "Chisel"
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileFullPath = $(Join-Path $toolsDir "$packageName.zip")
$url = 'https://github.com/jpillora/chisel/releases/download/v1.10.1/chisel_1.10.1_windows_amd64.gz'

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath $fileFullPath -Url $url
Get-ChocolateyUnzip -FileFullPath $fileFullPath -Destination $toolsDir