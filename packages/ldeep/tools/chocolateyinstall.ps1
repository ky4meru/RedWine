$ErrorActionPreference = 'Stop'

$toolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

$packageArgs = @{
    packageName = $env:ChocolateyPackageTitle
    fileFullPath = $(Join-Path $toolsDir "$env:ChocolateyPackageTitle.exe")
    url = "https://github.com/franc-pentest/ldeep/releases/download/$env:ChocolateyPackageVersion/ldeep_windows-amd64.exe"
}

Get-ChocolateyWebFile @packageArgs