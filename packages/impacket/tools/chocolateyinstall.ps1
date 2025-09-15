$ErrorActionPreference = 'Stop'

$packagesArgs = @{
    url = "https://github.com/fortra/impacket"
    tag = "b742bd4da426f2f523d5c7d6a65cfb94589c0eb5"
}

Install-RedWinePythonPackage @packagesArgs