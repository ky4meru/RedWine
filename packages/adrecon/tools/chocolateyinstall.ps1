$ErrorActionPreference = 'Stop'

$packageName = 'ADRecon'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/adrecon/ADRecon/archive/refs/heads/master.zip'
$zipPath = $(Join-Path $toolsDir "$packageName.zip")
$ps1Path = $(Join-Path $toolsDir "$packageName-master\$packageName.ps1")

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath $zipPath -Url $url
Get-ChocolateyUnzip -FileFullPath $zipPath -Destination $toolsDir

Copy-Item $ps1Path "$Env:ChocolateyInstall\bin\" -Force