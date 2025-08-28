$ErrorActionPreference = 'Stop'

$packageName = 'Gowitness'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/sensepost/gowitness/releases/download/3.0.5/gowitness-3.0.5-windows-amd64.exe'
$exePath = $(Join-Path $toolsDir "$packageName.exe")

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath $exePath -Url $url