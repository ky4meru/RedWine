$ErrorActionPreference = 'Stop'

$packageName = '[[PackageName]]'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = '[[Url]]'
$zipPath = $(Join-Path $toolsDir "$packageName.zip")
$ps1Path = $(Join-Path $toolsDir "$packageName-main\$packageName.ps1")

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath $zipPath -Url $url
Get-ChocolateyUnzip -FileFullPath $zipPath -Destination $toolsDir

Add-Content -Path $PROFILE -Value "Import-Module $ps1Path"