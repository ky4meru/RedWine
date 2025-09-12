$ErrorActionPreference = 'Stop'

Start-ChocolateyProcessAsAdmin -ExeToRun "python" -Statements "-m pipx uninstall pypykatz -y"