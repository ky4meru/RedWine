$ErrorActionPreference = 'Stop'

$packagesArgs = @{
    name = $env:ChocolateyPackageName
}

Uninstall-RedWinePythonPackage @packagesArgs