$ErrorActionPreference = 'Stop'

$packagesArgs = @{
    url = "https://github.com/Orange-Cyberdefense/KeePwn"
    tag = "$env:ChocolateyPackageversion"
}

Install-RedWinePythonPackage @packagesArgs