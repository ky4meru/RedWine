$ErrorActionPreference = 'Stop'

$packagesArgs = @{
    name = "keepwn"
}

Uninstall-RedWinePythonPackage @packagesArgs