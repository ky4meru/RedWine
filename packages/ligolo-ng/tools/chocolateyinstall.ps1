$ErrorActionPreference = 'Stop'

$packageName = "Ligolo-ng"
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$fileFullPathAgent = $(Join-Path $toolsDir "$packageName-agent.zip")
$urlAgent = 'https://github.com/nicocha30/ligolo-ng/releases/download/v0.8.2/ligolo-ng_agent_0.8.2_windows_amd64.zip'

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath $fileFullPathAgent -Url $urlAgent
Get-ChocolateyUnzip -FileFullPath $fileFullPathAgent -Destination $toolsDir

$fileFullPathProxy = $(Join-Path $toolsDir "$packageName-proxy.zip")
$urlProxy = 'https://github.com/nicocha30/ligolo-ng/releases/download/v0.8.2/ligolo-ng_proxy_0.8.2_windows_amd64.zip'

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath $fileFullPathProxy -Url $urlProxy
Get-ChocolateyUnzip -FileFullPath $fileFullPathProxy -Destination $toolsDir