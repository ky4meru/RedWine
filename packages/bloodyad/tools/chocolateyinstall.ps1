$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    name = $env:ChocolateyPackageTitle
    url = "https://github.com/CravateRouge/bloodyAD/releases/download/v$env:ChocolateyPackageVersion/bloodyAD.exe"
    path = $(Join-Path $ToolsDir "$env:ChocolateyPackageTitle.exe")
}

Install-RedWinePortablePackage @packageArgs