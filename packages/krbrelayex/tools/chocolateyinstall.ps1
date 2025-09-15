$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    name = "$env:ChocolateyPackageTitle"
    url = "https://github.com/decoder-it/KrbRelayEx/releases/download/v1.2/KrbRelayEx.exe"
    path = $(Join-Path $toolsDir "$env:ChocolateyPackageTitle.exe")
}

Install-RedWinePortablePackage @packageArgs