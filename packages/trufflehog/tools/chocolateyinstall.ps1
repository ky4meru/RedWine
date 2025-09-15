$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    name = "$env:ChocolateyPackageTitle"
    url = "https://github.com/trufflesecurity/trufflehog/releases/download/v3.90.5/trufflehog_3.90.5_windows_amd64.tar.gz"
    path = "$toolsDir"
}

Install-RedWineArchivePackage @packageArgs