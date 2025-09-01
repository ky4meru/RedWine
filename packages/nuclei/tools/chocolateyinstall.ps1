$ErrorActionPreference = 'Stop'

$packageName = "Nuclei"
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileFullPath = $(Join-Path $toolsDir "$packageName.zip")
$url = 'https://github.com/projectdiscovery/nuclei/releases/download/v3.4.10/nuclei_3.4.10_windows_amd64.zip'

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath $fileFullPath -Url $url
Get-ChocolateyUnzip -FileFullPath $fileFullPath -Destination $toolsDir