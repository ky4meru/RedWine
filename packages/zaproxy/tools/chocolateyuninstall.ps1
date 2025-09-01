$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName = 'ZAProxy'
  fileType = 'exe'
  file = 'C:\Program Files\ZAP\Zed Attack Proxy\uninstall.exe'
  silentArgs = '-q'
}

Uninstall-ChocolateyPackage @packageArgs