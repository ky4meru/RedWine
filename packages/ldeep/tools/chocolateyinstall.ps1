$ErrorActionPreference = 'Stop'

$packagesArgs = @{
    url = "https://github.com/franc-pentest/ldeep"
    tag = "$env:ChocolateyPackageversion"
}

Install-RedWinePythonPackage @packagesArgs