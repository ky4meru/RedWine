$ErrorActionPreference = 'Stop'

$toolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

$packageArgs = @{
    packageName = $env:ChocolateyPackageTitle
    unzipLication = $toolsDir
    url = "https://github.com/bee-san/RustScan/releases/download/$env:ChocolateyPackageVersion/x86_64-windows-rustscan.exe.zip"
}

Install-ChocolateyZipPackage @packageArgs