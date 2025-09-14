$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    name = "$env:ChocolateyPackageTitle"
    url = "https://github.com/FalconForceTeam/SOAPHound/archive/818a0b5add9d70c3d210f0ddcde781a85cd0cba2.zip"
    tag = "818a0b5add9d70c3d210f0ddcde781a85cd0cba2"
    path = "$toolsDir"
    version = "2019"
}

Install-RedWineSolutionPackage @packageArgs