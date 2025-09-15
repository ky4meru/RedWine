$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    name = "$env:ChocolateyPackageTitle"
    url = "https://github.com/gitleaks/gitleaks/releases/download/v8.28.0/gitleaks_8.28.0_windows_x64.zip"
    path = "$toolsDir"
}

Install-RedWineArchivePackage @packageArgs