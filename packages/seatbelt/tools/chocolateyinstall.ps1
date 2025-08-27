$ErrorActionPreference = 'Stop'

$packageName = "Seatbelt"
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/GhostPack/Seatbelt/archive/refs/heads/master.zip'
$tag = 'master'
$msBuild = "C:\Program Files\Microsoft Visual Studio\2022\Community\MSBuild\Current\Bin\MSBuild.exe"
$solutionPath = $(Join-Path $toolsDir "$packageName-$tag\$packageName.sln")
$exePath = $(Join-Path $toolsDir "$packageName-$tag\$packageName\bin\Release\$packageName.exe")

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath "$toolsDir\$packageName.zip" -Url $url
Get-ChocolateyUnzip -FileFullPath "$toolsDir\$packageName.zip" -Destination $toolsDir

Start-ChocolateyProcessAsAdmin -ExeToRun $msBuild -Statements "$solutionPath -p:Configuration=Release"
Install-BinFile -Name $packageName -Path $exePath