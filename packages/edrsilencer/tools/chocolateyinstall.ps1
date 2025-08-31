$ErrorActionPreference = 'Stop'

$packageName = 'EDRSilencer'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/netero1010/EDRSilencer/releases/download/1.4/EDRSilencer.exe'
$exePath = $(Join-Path $toolsDir "$packageName.exe")

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath $exePath -Url $url