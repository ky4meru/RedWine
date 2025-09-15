$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    name = "$env:ChocolateyPackageTitle"
    url = "https://github.com/OJ/gobuster/releases/download/v3.8.1/gobuster_Windows_x86_64.zip"
    path = "$toolsDir"
}

Install-RedWineArchivePackage @packageArgs