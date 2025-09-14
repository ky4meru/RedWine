$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    name = "$env:ChocolateyPackageTitle"
    url = "https://github.com/bee-san/RustScan/releases/download/$env:ChocolateyPackageVersion/x86_64-windows-rustscan.exe.zip"
    path = "$toolsDir"
}

Install-RedWineArchivePackage @packageArgs