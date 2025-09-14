$ErrorActionPreference = 'Stop'

$packagesArgs = @{
    url = "https://github.com/Orange-Cyberdefense/KeePwn"
    tag = "0.5"
}

Install-RedWinePythonPackage @packagesArgs