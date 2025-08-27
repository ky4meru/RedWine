$ErrorActionPreference = 'Stop'

$packageName = 'SharPersist'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/mandiant/SharPersist/releases/download/v1.0.1/SharPersist.exe'
$exePath = $(Join-Path $toolsDir "$packageName.exe")

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath $exePath -Url $url