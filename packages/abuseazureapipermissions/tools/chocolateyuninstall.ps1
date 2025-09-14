$ErrorActionPreference = 'Stop'

$packageArgs = @{
    name = "$env:ChocolateyPackageTitle"
}

Uninstall-RedWinePowerShellPackage @packageArgs