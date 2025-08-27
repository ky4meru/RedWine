$ErrorActionPreference = 'Stop'

$packageName = "SharpView"
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/tevora-threat/SharpView/archive/refs/heads/master.zip'
$tag = 'master'
$msBuild = "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\MSBuild\Current\Bin\MSBuild.exe"
$solutionPath = $(Join-Path $toolsDir "$packageName-$tag\$packageName.sln")
$configPath = $(Join-Path $toolsDir "$packageName-$tag\$packageName\packages.config")
$packagesPath = $(Join-Path $toolsDir "$packageName-$tag\packages")

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath "$toolsDir\$packageName.zip" -Url $url
Get-ChocolateyUnzip -FileFullPath "$toolsDir\$packageName.zip" -Destination $toolsDir

Start-ChocolateyProcessAsAdmin -ExeToRun "nuget" -Statements "install $configPath -OutputDirectory $packagesPath"
Start-ChocolateyProcessAsAdmin -ExeToRun $msBuild -Statements "$solutionPath -p:Configuration=Release"