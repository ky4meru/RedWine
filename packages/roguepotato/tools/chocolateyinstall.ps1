$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    name = "$env:ChocolateyPackageTitle"
    url = "https://github.com/antonioCoco/RoguePotato/releases/download/1.0/RoguePotato.zip"
    path = "$toolsDir"
}

Install-RedWineArchivePackage @packageArgs