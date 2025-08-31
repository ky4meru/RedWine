$ErrorActionPreference = 'Stop'

$packageName = "[[PackageName]]"
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileFullPath = $(Join-Path $toolsDir "$packageName.zip")
$url = '[[Url]]'

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath $fileFullPath -Url $url
Get-ChocolateyUnzip -FileFullPath $fileFullPath -Destination $toolsDir