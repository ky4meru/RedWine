$ErrorActionPreference = 'Stop'

$packageName = "StandIn"
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/FuzzySecurity/StandIn/archive/refs/tags/v1.3.zip'
$tag = '1.3'
$msBuild = "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\MSBuild\Current\Bin\MSBuild.exe"
$solutionPath = $(Join-Path $toolsDir "$packageName-$tag\$packageName\$packageName.sln")
$configPath = $(Join-Path $toolsDir "$packageName-$tag\$packageName\$packageName\packages.config")
$packagesPath = $(Join-Path $toolsDir "$packageName-$tag\$packageName\packages")

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath "$toolsDir\$packageName.zip" -Url $url
Get-ChocolateyUnzip -FileFullPath "$toolsDir\$packageName.zip" -Destination $toolsDir

Start-ChocolateyProcessAsAdmin -ExeToRun "nuget" -Statements "install $configPath -OutputDirectory $packagesPath"
Start-ChocolateyProcessAsAdmin -ExeToRun $msBuild -Statements "$solutionPath -p:Configuration=Release"