$ErrorActionPreference = 'Stop'

Start-ChocolateyProcessAsAdmin -ExeToRun "python" -Statements "-m pip install pipx==$env:ChocolateyPackageVersion"
Start-ChocolateyProcessAsAdmin -ExeToRun "python" -Statements "-m pipx ensurepath" -ErrorAction "SilentlyContinue"