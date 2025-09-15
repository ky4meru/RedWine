$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    name = "$env:ChocolateyPackageTitle"
    url = "https://github.com/projectdiscovery/nuclei/releases/download/v3.4.10/nuclei_3.4.10_windows_amd64.zip"
    path = "$toolsDir"
}

Install-RedWineArchivePackage @packageArgs