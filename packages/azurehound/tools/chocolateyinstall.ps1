$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    name = "$env:ChocolateyPackageTitle"
    url = "https://github.com/SpecterOps/AzureHound/releases/download/v2.7.1/AzureHound_v2.7.1_windows_amd64.zip"
    path = "$toolsDir"
}

Install-RedWineArchivePackage @packageArgs