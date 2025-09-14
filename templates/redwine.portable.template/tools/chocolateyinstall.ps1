$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    name = "$env:ChocolateyPackageTitle"
    url = "[[Url]]"
    path = $(Join-Path $toolsDir "$env:ChocolateyPackageTitle.exe")
}

Install-RedWinePortablePackage @packageArgs