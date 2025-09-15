$ErrorActionPreference = 'Stop'

$packagesArgs = @{
    name = "donpapi"
}

Uninstall-RedWinePythonPackage @packagesArgs