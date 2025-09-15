$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    name = "$env:ChocolateyPackageTitle"
    url = "https://github.com/projectdiscovery/naabu/releases/download/v2.3.5/naabu_2.3.5_windows_amd64.zip"
    path = "$toolsDir"
}

Install-RedWineArchivePackage @packageArgs