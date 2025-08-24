$ErrorActionPreference = 'Stop'

$packageName = "LaZagne"
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/AlessandroZ/LaZagne/releases/download/v2.4.7/LaZagne.exe'

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath "$toolsDir\$packageName.exe" -Url $url
Install-BinFile -Name $packageName -Path "$toolsDir\$packageName.exe"