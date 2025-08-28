$ErrorActionPreference = 'Stop'

$packageName = 'WinPEAS'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/peass-ng/PEASS-ng/releases/download/20250827-339b42c6/winPEASany.exe'
$exePath = $(Join-Path $toolsDir "$packageName.exe")

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath $exePath -Url $url