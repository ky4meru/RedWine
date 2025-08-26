$ErrorActionPreference = 'Stop'

$packageName = 'PrintSpoofer'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/itm4n/PrintSpoofer/releases/download/v1.0/PrintSpoofer64.exe'
$exePath = $(Join-Path $toolsDir "$packageName.exe")

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath $exePath -Url $url
Install-BinFile -Name $packageName -Path $exePath