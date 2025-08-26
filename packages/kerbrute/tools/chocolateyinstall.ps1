$ErrorActionPreference = 'Stop'

$packageName = "Kerbrute"
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/ropnop/kerbrute/releases/download/v1.0.3/kerbrute_windows_amd64.exe'
$exePath = $(Join-Path $toolsDir "$packageName.exe")

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath $exePath -Url $url
Install-BinFile -Name $packageName -Path $exePath