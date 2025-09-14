$ErrorActionPreference = 'Stop'

$packagesArgs = @{
    name = "[[PackageNameLower]]"
}

Uninstall-RedWinePythonPackage @packagesArgs