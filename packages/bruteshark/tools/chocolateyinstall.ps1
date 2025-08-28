$ErrorActionPreference = 'Stop'

$packageName = 'BruteShark'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/odedshimon/BruteShark/releases/download/v1.2.5/BruteSharkCli.exe'
$exePath = $(Join-Path $toolsDir "$packageName.exe")

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath $exePath -Url $url