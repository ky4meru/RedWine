$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    name = "$env:ChocolateyPackageTitle"
    url = "https://github.com/diversenok/TokenUniverse/releases/download/v0.5/TokenUniverse.zip"
    path = "$toolsDir"
}

Install-RedWineArchivePackage @packageArgs