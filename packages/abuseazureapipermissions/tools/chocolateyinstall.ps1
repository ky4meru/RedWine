$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    name = "$env:ChocolateyPackageTitle"
    url = "https://github.com/Hagrid29/AbuseAzureAPIPermissions/archive/f817a1910e980c26f6adef2002d02c5b1a08acfc.zip"
    tag = "f817a1910e980c26f6adef2002d02c5b1a08acfc"
    path = "$toolsDir"
    module = "$env:ChocolateyPackageTitle.ps1"
}

Install-RedWinePowerShellPackage @packageArgs