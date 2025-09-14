$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    name = "$env:ChocolateyPackageTitle"
    url = "https://github.com/x90skysn3k/brutespray/releases/download/v2.4.0/brutespray_2.4.0_windows_amd64.tar.gz"
    path = "$toolsDir"
}

Install-RedWineArchivePackage @packageArgs