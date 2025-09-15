$ErrorActionPreference = 'Stop'

$packagesArgs = @{
    name = "ldeep"
}

Uninstall-RedWinePythonPackage @packagesArgs