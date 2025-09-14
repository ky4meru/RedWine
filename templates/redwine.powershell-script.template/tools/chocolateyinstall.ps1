$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    name = "$env:ChocolateyPackageTitle"
    url = "[[Url]]"
    tag = "[[Tag]]"
    path = "$toolsDir"
    script = "$env:ChocolateyPackageTitle.ps1"
}

Install-RedWinePowerShellScriptPackage @packageArgs