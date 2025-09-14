$ErrorActionPreference = 'Stop'

$packagesArgs = @{
    url = "https://github.com/login-securite/DonPAPI"
    tag = "61db37aaea1e1c9e9b6a02c640bf59f2a20840bc"
}

Install-RedWinePythonPackage @packagesArgs