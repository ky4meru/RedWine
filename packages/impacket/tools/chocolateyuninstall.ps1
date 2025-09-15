$ErrorActionPreference = 'Stop'

$packagesArgs = @{
    name = "impacket"
}

Uninstall-RedWinePythonPackage @packagesArgs