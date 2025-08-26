$ErrorActionPreference = 'Stop'

$packageName = 'BloodyAD'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/CravateRouge/bloodyAD/releases/download/v2.1.21/bloodyAD.exe'
$exePath = $(Join-Path $toolsDir "$packageName.exe")

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath $exePath -Url $url
Install-BinFile -Name $packageName -Path $exePath