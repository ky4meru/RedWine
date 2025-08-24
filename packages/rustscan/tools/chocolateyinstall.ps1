$ErrorActionPreference = 'Stop'

$packageName = "RustScan"
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/bee-san/RustScan/releases/download/2.4.1/x86_64-windows-rustscan.exe.zip'

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath "$toolsDir\$packageName.zip" -Url $url
Get-ChocolateyUnzip -FileFullPath "$toolsDir\$packageName.zip" -Destination $toolsDir
Install-BinFile -Name $packageName -Path "$toolsDir\$packageName.exe"