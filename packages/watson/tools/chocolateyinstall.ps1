$ErrorActionPreference = 'Stop'

$packageName = "Watson"
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/rasta-mouse/Watson/archive/refs/tags/2.0.zip'
$tag = '2.0'
$msBuild = "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\MSBuild\Current\Bin\MSBuild.exe"
$solutionPath = $(Join-Path $toolsDir "$packageName-$tag\$packageName.sln")

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath "$toolsDir\$packageName.zip" -Url $url
Get-ChocolateyUnzip -FileFullPath "$toolsDir\$packageName.zip" -Destination $toolsDir

Start-ChocolateyProcessAsAdmin -ExeToRun $msBuild -Statements "$solutionPath -p:Configuration=Release"