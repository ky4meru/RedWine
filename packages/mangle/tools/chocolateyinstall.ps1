$ErrorActionPreference = 'Stop'

$packageName = 'Mangle'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/optiv/Mangle/releases/download/v1.2/Mangle_1.2_windows_amd64.exe'
$exePath = $(Join-Path $toolsDir "$packageName.exe")

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath $exePath -Url $url
Install-BinFile -Name $packageName -Path $exePath