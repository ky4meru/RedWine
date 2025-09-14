$ErrorActionPreference = 'Stop'

$packageArgs = @{
    name = "$env:ChocolateyPackageTitle"
}

Uninstall-RedWinePowerShellModulePackage @packageArgs