$ErrorActionPreference = 'Stop'

$packagesArgs = @{
    name = "$env:ChocolateyPackageTitle"
}

Uninstall-RedWinePythonPackage @packagesArgs