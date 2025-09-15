$ErrorActionPreference = 'Stop'

Start-ChocolateyProcessAsAdmin -ExeToRun "python" -Statements "-m pip uninstall pipx -y"

Remove-Item -Path $Env:PIPX_HOME -Force -Recurse

Uninstall-ChocolateyEnvironmentVariable -VariableName "PIPX_HOME" -VariableType "Machine"
Uninstall-ChocolateyEnvironmentVariable -VariableName "PIPX_BIN_DIR" -VariableType "Machine"
Uninstall-ChocolateyEnvironmentVariable -VariableName "PIPX_MAN_DIR" -VariableType "Machine"
Update-SessionEnvironment