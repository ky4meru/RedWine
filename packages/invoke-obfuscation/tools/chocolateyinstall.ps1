$ErrorActionPreference = 'Stop'

$packageName = 'Invoke-Obfuscation'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/danielbohannon/Invoke-Obfuscation/archive/f20e7f843edd0a3a7716736e9eddfa423395dd26.zip'
$tag = 'f20e7f843edd0a3a7716736e9eddfa423395dd26'
$zipPath = $(Join-Path $toolsDir "$packageName.zip")
$ps1Path = $(Join-Path $toolsDir "$packageName-$tag\$packageName.psd1")

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath $zipPath -Url $url
Get-ChocolateyUnzip -FileFullPath $zipPath -Destination $toolsDir

Add-Content -Path $PROFILE -Value "Import-Module $ps1Path"