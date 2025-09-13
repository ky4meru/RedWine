$ErrorActionPreference = 'Stop'

Start-ChocolateyProcessAsAdmin -ExeToRun "python" -Statements "-m pipx uninstall o365spray -y"