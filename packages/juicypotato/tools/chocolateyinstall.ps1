$ErrorActionPreference = 'Stop'

$packageName = 'JuicyPotato'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/ohpe/juicy-potato/releases/download/v0.1/JuicyPotato.exe'
$exePath = $(Join-Path $toolsDir "$packageName.exe")

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath $exePath -Url $url
Install-BinFile -Name $packageName -Path $exePath