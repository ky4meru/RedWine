$ErrorActionPreference = 'Stop'

$packageName = "[[PackageName]]"
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = '[[Url]]'
$tag = '[[Tag]]'
$msBuild = "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\MSBuild\Current\Bin\MSBuild.exe"
$solutionPath = $(Join-Path $toolsDir "$packageName-$tag\$packageName.sln")

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath "$toolsDir\$packageName.zip" -Url $url
Get-ChocolateyUnzip -FileFullPath "$toolsDir\$packageName.zip" -Destination $toolsDir

# Optional: only if needed (i.e. packages.config).
# Remove nuget.commandline as dependency if not required.
# Start-ChocolateyProcessAsAdmin -ExeToRun "nuget" -Statements "restore $solutionPath"
Start-ChocolateyProcessAsAdmin -ExeToRun $msBuild -Statements "$solutionPath -p:Configuration=Release"