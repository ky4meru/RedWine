$ErrorActionPreference = 'Stop'

$packageArgs = @{
    name = "$env:ChocolateyPackageTitle"
}

Uninstall-RedWinePowerShellScriptPackage @packageArgs