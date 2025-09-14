$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    name = "$env:ChocolateyPackageTitle"
    url = "[[Url]]"
    path = "$toolsDir"
}

Install-RedWineArchivePackage @packageArgs