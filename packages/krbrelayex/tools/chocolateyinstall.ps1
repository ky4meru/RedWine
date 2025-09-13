$ErrorActionPreference = 'Stop'

$toolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

$packageArgs = @{
    packageName = $env:ChocolateyPackageTitle
    fileFullPath = $(Join-Path $toolsDir "$env:ChocolateyPackageTitle.exe")
    url = "https://github.com/decoder-it/KrbRelayEx/releases/download/v$env:ChocolateyPackageVersion/KrbRelayEx.exe"
}

Get-ChocolateyWebFile @packageArgs