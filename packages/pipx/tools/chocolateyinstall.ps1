$ErrorActionPreference = 'Stop'

$python = "$Env:ChocolateyInstall\bin\python3.13.exe"

Start-ChocolateyProcessAsAdmin -ExeToRun "$python" -Statements "-m pip install pipx==$env:ChocolateyPackageVersion"

Install-ChocolateyEnvironmentVariable -VariableName "PIPX_HOME" -VariableValue "$Env:ChocolateyInstall\pipx" -VariableType "Machine"
Install-ChocolateyEnvironmentVariable -VariableName "PIPX_BIN_DIR" -VariableValue "$Env:ChocolateyInstall\bin" -VariableType "Machine"
Install-ChocolateyEnvironmentVariable -VariableName "PIPX_MAN_DIR" -VariableValue "$Env:ChocolateyInstall\man" -VariableType "Machine"

Start-ChocolateyProcessAsAdmin -ExeToRun "$python" -Statements "-m pipx ensurepath" -ErrorAction "SilentlyContinue"