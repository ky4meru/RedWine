$ErrorActionPreference = 'Stop'

$url = 'https://github.com/ShutdownRepo/smartbrute'

$tmp = $Env:TMP
$temp = $Env:TEMP
Install-ChocolateyEnvironmentVariable -VariableName "TMP" -VariableValue "$Env:ChocolateyInstall\temp" -VariableType "User"
Install-ChocolateyEnvironmentVariable -VariableName "TEMP" -VariableValue "$Env:ChocolateyInstall\temp" -VariableType "User"

Start-ChocolateyProcessAsAdmin -ExeToRun "python" -Statements "-m pipx install git+$url@47fd659304982c1c9d06afb61b9367ce57084ca3"

Install-ChocolateyEnvironmentVariable -VariableName "TMP" -VariableValue "$tmp" -VariableType "User"
Install-ChocolateyEnvironmentVariable -VariableName "TEMP" -VariableValue "$temp" -VariableType "User"