$ErrorActionPreference = 'Stop'

$packageName = "Yara"
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileFullPath = $(Join-Path $toolsDir "$packageName.zip")
$url = 'https://github.com/VirusTotal/yara/releases/download/v4.5.4/yara-master-v4.5.4-win64.zip'

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath $fileFullPath -Url $url
Get-ChocolateyUnzip -FileFullPath $fileFullPath -Destination $toolsDir