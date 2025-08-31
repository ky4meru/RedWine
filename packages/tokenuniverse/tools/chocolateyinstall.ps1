$ErrorActionPreference = 'Stop'

$packageName = "TokenUniverse"
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileFullPath = $(Join-Path $toolsDir "$packageName.zip")
$url = 'https://github.com/diversenok/TokenUniverse/releases/download/v0.5/TokenUniverse.zip'

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath $fileFullPath -Url $url
Get-ChocolateyUnzip -FileFullPath $fileFullPath -Destination $toolsDir