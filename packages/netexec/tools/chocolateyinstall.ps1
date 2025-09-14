$ErrorActionPreference = 'Stop'

$url = 'https://github.com/Pennyw0rth/NetExec'
$tag = '027e52082425a9deda55c8cbcf94a1e867d740a7'

$tmp = "$Env:TMP"
$temp = "$Env:TEMP"

Install-ChocolateyEnvironmentVariable -VariableName "TMP" -VariableValue "$Env:ChocolateyInstall\temp" -VariableType "User"
Install-ChocolateyEnvironmentVariable -VariableName "TEMP" -VariableValue "$Env:ChocolateyInstall\temp" -VariableType "User"
Install-ChocolateyEnvironmentVariable -VariableName "NXC_PATH" -VariableValue "$Env:ChocolateyInstall\.nxc" -VariableType "User"
Update-SessionEnvironment

Start-ChocolateyProcessAsAdmin -ExeToRun "python" -Statements "-m pipx install git+$url@$tag --pip-args='--no-cache-dir' --force"

Install-ChocolateyEnvironmentVariable -VariableName "TMP" -VariableValue "$tmp" -VariableType "User"
Install-ChocolateyEnvironmentVariable -VariableName "TEMP" -VariableValue "$temp" -VariableType "User"
Update-SessionEnvironment