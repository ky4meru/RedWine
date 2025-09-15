$ErrorActionPreference = 'Stop'

$packagesArgs = @{
    name = "coercer"
}

Uninstall-RedWinePythonPackage @packagesArgs