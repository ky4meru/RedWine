$ErrorActionPreference = 'Stop'

$packageName = 'Windows Update'

Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
Install-Module -Name PSWindowsUpdate -Force
Get-WindowsUpdate -WindowsUpdate -Install -AcceptAll -IgnoreReboot