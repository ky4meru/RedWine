$ErrorActionPreference = 'Stop'

$packageName = '[[PackageName]]'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = '[[Url]]'
$exePath = $(Join-Path $toolsDir "$packageName.exe")

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath $exePath -Url $url