$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    name = "$env:ChocolateyPackageTitle"
    url = "[[Url]]"
    tag = "[[Tag]]"
    path = "$toolsDir"
    version = "2019"
}

Install-RedWineSolutionPackage @packageArgs