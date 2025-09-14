$ErrorActionPreference = 'Stop'

$packagesArgs = @{
    url = "https://github.com/blacklanternsecurity/MANSPIDER"
    tag = "499f44f5a3131538eab8c3d2db06378d278306b7"
}

Install-RedWinePythonPackage @packagesArgs