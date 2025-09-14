$ErrorActionPreference = 'Stop'

$packagesArgs = @{
    name = "manspider"
}

Uninstall-RedWinePythonPackage @packagesArgs