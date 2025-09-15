$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    name = "$env:ChocolateyPackageTitle"
    url = "https://github.com/nicocha30/ligolo-ng/releases/download/v0.8.2/ligolo-ng_agent_0.8.2_windows_amd64.zip"
    path = "$toolsDir"
}

Install-RedWineArchivePackage @packageArgs

$packageArgs = @{
    name = "$env:ChocolateyPackageTitle"
    url = "https://github.com/nicocha30/ligolo-ng/releases/download/v0.8.2/ligolo-ng_proxy_0.8.2_windows_amd64.zip"
    path = "$toolsDir"
}

Install-RedWineArchivePackage @packageArgs