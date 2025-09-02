$ErrorActionPreference = 'Stop'

$packageName = "Az"

Remove-Module -Name $packageName -ErrorAction SilentlyContinue
Uninstall-Module -Name $packageName -AllVersions