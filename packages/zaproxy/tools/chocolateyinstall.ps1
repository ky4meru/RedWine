$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName = 'ZAProxy'
  fileType = 'exe'
  url = 'https://github.com/zaproxy/zaproxy/releases/download/v2.16.1/ZAP_2_16_1_windows.exe'
  silentArgs = "-q"
}

Install-ChocolateyPackage @packageArgs