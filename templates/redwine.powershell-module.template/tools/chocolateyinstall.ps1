$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    name = "$env:ChocolateyPackageTitle"
    url = "[[Url]]"
    tag = "[[Tag]]"
    path = "$toolsDir"
    module = "$env:ChocolateyPackageTitle.ps1"
}

Install-RedWinePowerShellPackage @packageArgs