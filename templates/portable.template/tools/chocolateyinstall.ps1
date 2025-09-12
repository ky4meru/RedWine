$ErrorActionPreference = 'Stop'

$toolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

$packageArgs = @{
    packageName = $env:ChocolateyPackageTitle
    fileFullPath = $(Join-Path $toolsDir "$env:ChocolateyPackageTitle.exe")
    url = "[[Url]]"
}

Get-ChocolateyWebFile @packageArgs