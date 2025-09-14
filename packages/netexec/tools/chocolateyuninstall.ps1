$ErrorActionPreference = 'Stop'

Remove-Item -Recurse -Force $env:NXC_PATH
Uninstall-ChocolateyEnvironmentVariable -VariableName "NXC_PATH" -VariableType "User"

Start-ChocolateyProcessAsAdmin -ExeToRun "python" -Statements "-m pipx uninstall netexec -y"