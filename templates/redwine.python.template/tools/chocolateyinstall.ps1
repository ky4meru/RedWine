$ErrorActionPreference = 'Stop'

$packagesArgs = @{
    url = "[[ProjectUrl]]"
    tag = "$env:ChocolateyPackageversion"
}

Install-RedWinePythonPackage @packagesArgs