$ErrorActionPreference = 'Stop'

$url = 'https://github.com/0xZDH/o365spray'

$tmp = $Env:TMP
$temp = $Env:TEMP

Install-ChocolateyEnvironmentVariable -VariableName "TMP" -VariableValue "$Env:ChocolateyInstall\temp" -VariableType "User"
Install-ChocolateyEnvironmentVariable -VariableName "TEMP" -VariableValue "$Env:ChocolateyInstall\temp" -VariableType "User"

Start-ChocolateyProcessAsAdmin -ExeToRun "python" -Statements "-m pipx install git+$url@28d8d1b18ca98030f2c140f16a2ed3b41018525b"

Install-ChocolateyEnvironmentVariable -VariableName "TMP" -VariableValue "$tmp" -VariableType "User"
Install-ChocolateyEnvironmentVariable -VariableName "TEMP" -VariableValue "$temp" -VariableType "User"