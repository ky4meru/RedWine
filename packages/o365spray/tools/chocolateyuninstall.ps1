$ErrorActionPreference = 'Stop'

$packagesArgs = @{
    name = "o365spray"
}

Uninstall-RedWinePythonPackage @packagesArgs