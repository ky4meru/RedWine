$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName = $env:ChocolateyPackageTitle
    url = "https://github.com/CravateRouge/bloodyAD/releases/download/v$env:ChocolateyPackageVersion/bloodyAD.exe"
}

Install-RedWinePortablePackage @packageArgs