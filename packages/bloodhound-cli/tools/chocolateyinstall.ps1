$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    name = "$env:ChocolateyPackageTitle"
    url = "https://github.com/SpecterOps/bloodhound-cli/releases/download/v0.1.8/bloodhound-cli-windows-amd64.zip"
    path = "$toolsDir"
}

Install-RedWineArchivePackage @packageArgs