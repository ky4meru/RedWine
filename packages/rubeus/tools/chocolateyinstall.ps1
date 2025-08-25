$ErrorActionPreference = 'Stop'

$packageName = "Rubeus"
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/GhostPack/Rubeus/archive/refs/tags/1.6.4.zip'
$msBuild = "C:\Program Files\Microsoft Visual Studio\2022\Community\MSBuild\Current\Bin\MSBuild.exe"
$solutionPath = $(Join-Path $toolsDir "Rubeus-1.6.4\Rubeus.sln")
$exePath = $(Join-Path $toolsDir "Rubeus-1.6.4\Rubeus\bin\Release\Rubeus.exe")

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath "$toolsDir\$packageName.zip" -Url $url
Get-ChocolateyUnzip -FileFullPath "$toolsDir\$packageName.zip" -Destination $toolsDir

Start-ChocolateyProcessAsAdmin -ExeToRun $msBuild -Statements "$solutionPath -p:Configuration=Release"
Install-BinFile -Name $packageName -Path $exePath