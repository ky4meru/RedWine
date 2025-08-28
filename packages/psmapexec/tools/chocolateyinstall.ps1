$ErrorActionPreference = 'Stop'

$packageName = 'PsMapExec'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/The-Viper-One/PsMapExec/archive/refs/tags/v0.8.1.zip'
$zipPath = $(Join-Path $toolsDir "$packageName.zip")
$ps1Path = $(Join-Path $toolsDir "$packageName-0.8.1\$packageName.ps1")

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath $zipPath -Url $url
Get-ChocolateyUnzip -FileFullPath $zipPath -Destination $toolsDir

Add-Content -Path $PROFILE -Value "Import-Module $ps1Path"