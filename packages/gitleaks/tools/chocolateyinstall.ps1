$ErrorActionPreference = 'Stop'

$packageName = "Gitleaks"
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileFullPath = $(Join-Path $toolsDir "$packageName.zip")
$url = 'https://github.com/gitleaks/gitleaks/releases/download/v8.28.0/gitleaks_8.28.0_windows_x64.zip'

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath $fileFullPath -Url $url
Get-ChocolateyUnzip -FileFullPath $fileFullPath -Destination $toolsDir