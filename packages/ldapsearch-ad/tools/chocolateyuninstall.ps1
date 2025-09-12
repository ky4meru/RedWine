$ErrorActionPreference = 'Stop'

$python = "$Env:ChocolateyInstall\bin\python3.13.exe"

Start-ChocolateyProcessAsAdmin -ExeToRun "$python" -Statements "-m pipx uninstall ldapsearchad -y"