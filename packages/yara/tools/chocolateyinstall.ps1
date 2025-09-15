$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    name = "$env:ChocolateyPackageTitle"
    url = "https://github.com/VirusTotal/yara/releases/download/v4.5.4/yara-master-v4.5.4-win64.zip"
    path = "$toolsDir"
}

Install-RedWineArchivePackage @packageArgs