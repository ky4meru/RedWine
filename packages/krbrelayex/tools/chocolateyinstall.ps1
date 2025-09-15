$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    name = "$env:ChocolateyPackageTitle"
    url = "https://github.com/decoder-it/KrbRelayEx/releases/download/v1.2/KrbRelayEx.exe"
    path = $(Join-Path $toolsDir "$env:ChocolateyPackageTitle.exe")
}

Install-RedWinePortablePackage @packageArgs

$packageArgs = @{
    name = "$env:ChocolateyPackageTitle"
    url = "https://github.com/decoder-it/KrbRelayEx/releases/download/v1.2/KrbRelayEx.dll"
    path = $(Join-Path $toolsDir "$env:ChocolateyPackageTitle.dll")
}

Install-RedWinePortablePackage @packageArgs

$packageArgs = @{
    name = "$env:ChocolateyPackageTitle"
    url = "https://github.com/decoder-it/KrbRelayEx/releases/download/v1.2/KrbRelayEx.dll.config"
    path = $(Join-Path $toolsDir "$env:ChocolateyPackageTitle.dll.config")
}

Install-RedWinePortablePackage @packageArgs

$packageArgs = @{
    name = "$env:ChocolateyPackageTitle"
    url = "https://github.com/decoder-it/KrbRelayEx/releases/download/v1.2/KrbRelayEx.runtimeconfig.json"
    path = $(Join-Path $toolsDir "$env:ChocolateyPackageTitle.runtimeconfig.json")
}

Install-RedWinePortablePackage @packageArgs