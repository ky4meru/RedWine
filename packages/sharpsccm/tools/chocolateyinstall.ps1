$ErrorActionPreference = 'Stop'

$packageName = 'SharpSCCM'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/Mayyhem/SharpSCCM/releases/download/v2.0.13/SharpSCCM.exe'
$exePath = $(Join-Path $toolsDir "$packageName.exe")

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath $exePath -Url $url