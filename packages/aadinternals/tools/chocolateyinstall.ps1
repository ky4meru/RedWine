$ErrorActionPreference = 'Stop'

$packageName = 'AADInternals'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/Gerenios/AADInternals/archive/ec04e908e48992bf5b5ff933029614f40e0c3604.zip'
$tag = 'ec04e908e48992bf5b5ff933029614f40e0c3604'
$zipPath = $(Join-Path $toolsDir "$packageName.zip")
$ps1Path = $(Join-Path $toolsDir "$packageName-$tag\$packageName.psd1")

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath $zipPath -Url $url
Get-ChocolateyUnzip -FileFullPath $zipPath -Destination $toolsDir

Add-Content -Path $PROFILE -Value "Import-Module $ps1Path"