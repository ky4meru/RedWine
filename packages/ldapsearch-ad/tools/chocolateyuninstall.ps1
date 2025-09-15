$ErrorActionPreference = 'Stop'

$packagesArgs = @{
    name = "ldapsearch-ad"
}

Uninstall-RedWinePythonPackage @packagesArgs