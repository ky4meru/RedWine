$ErrorActionPreference = 'Stop'

$packageName = 'SharpExclusionFinder'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/Friends-Security/SharpExclusionFinder/releases/download/v1/SharpExclusionFinder.exe'
$exePath = $(Join-Path $toolsDir "$packageName.exe")

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath $exePath -Url $url
Install-BinFile -Name $packageName -Path $exePath