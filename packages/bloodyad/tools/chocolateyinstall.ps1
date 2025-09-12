$ErrorActionPreference = 'Stop'

$toolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

$packageArgs = @{
    packageName = $env:ChocolateyPackageTitle
    fileFullPath = $(Join-Path $toolsDir "$env:ChocolateyPackageTitle.exe")
    url = "https://github.com/CravateRouge/bloodyAD/releases/download/v$env:ChocolateyPackageVersion/bloodyAD.exe"
}

Get-ChocolateyWebFile @packageArgs