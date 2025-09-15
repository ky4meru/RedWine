$ErrorActionPreference = 'Stop'

$packagesArgs = @{
    url = "https://github.com/0xZDH/o365spray"
    tag = "28d8d1b18ca98030f2c140f16a2ed3b41018525b"
}

Install-RedWinePythonPackage @packagesArgs