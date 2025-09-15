$ErrorActionPreference = 'Stop'

$packagesArgs = @{
    url = "https://github.com/p0dalirius/Coercer"
    tag = "$env:ChocolateyPackageversion"
}

Install-RedWinePythonPackage @packagesArgs