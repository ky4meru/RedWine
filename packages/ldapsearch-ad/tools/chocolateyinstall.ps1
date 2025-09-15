$ErrorActionPreference = 'Stop'

$packagesArgs = @{
    url = "https://github.com/yaap7/ldapsearch-ad"
    tag = "$env:ChocolateyPackageversion"
}

Install-RedWinePythonPackage @packagesArgs