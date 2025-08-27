$ErrorActionPreference = 'Stop'

$packageName = 'PetitPotam'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/topotam/PetitPotam/raw/refs/heads/main/PetitPotam.exe'
$exePath = $(Join-Path $toolsDir "$packageName.exe")

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath $exePath -Url $url