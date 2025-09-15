$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    name = "$env:ChocolateyPackageTitle"
    url = "https://github.com/SpecterOps/SharpHound/releases/download/v2.7.1/SharpHound_v2.7.1_windows_x86.zip"
    path = "$toolsDir"
}

Install-RedWineArchivePackage @packageArgs