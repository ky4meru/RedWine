$ErrorActionPreference = 'Stop'

Start-ChocolateyProcessAsAdmin -ExeToRun "python" -Statements "-m pipx uninstall smartbrute -y"