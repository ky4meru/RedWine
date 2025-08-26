$ErrorActionPreference = 'Stop'

$packageName = 'GodPotato'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/BeichenDream/GodPotato/releases/download/V1.20/GodPotato-NET4.exe'
$exePath = $(Join-Path $toolsDir "$packageName.exe")

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath $exePath -Url $url
Install-BinFile -Name $packageName -Path $exePath