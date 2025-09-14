$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    name = "$env:ChocolateyPackageTitle"
    url = "https://github.com/netero1010/EDRSilencer/releases/download/1.4/EDRSilencer.exe"
    path = $(Join-Path $toolsDir "$env:ChocolateyPackageTitle.exe")
}

Install-RedWinePortablePackage @packageArgs