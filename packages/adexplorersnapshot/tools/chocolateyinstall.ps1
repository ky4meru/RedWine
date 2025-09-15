$ErrorActionPreference = 'Stop'

$packagesArgs = @{
    url = "https://github.com/c3c/ADExplorerSnapshot.py"
    tag = "dd9bad0de50f4d7fdf9bcd740cc1b95c90818429"
}

Install-RedWinePythonPackage @packagesArgs