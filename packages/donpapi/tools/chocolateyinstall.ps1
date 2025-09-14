$ErrorActionPreference = 'Stop'

$url = 'https://github.com/login-securite/DonPAPI'
$tag = '61db37aaea1e1c9e9b6a02c640bf59f2a20840bc'

$tmp = $Env:TMP
$temp = $Env:TEMP

Install-ChocolateyEnvironmentVariable -VariableName "TMP" -VariableValue "$Env:ChocolateyInstall\temp" -VariableType "User"
Install-ChocolateyEnvironmentVariable -VariableName "TEMP" -VariableValue "$Env:ChocolateyInstall\temp" -VariableType "User"

Start-ChocolateyProcessAsAdmin -ExeToRun "python" -Statements "-m pipx install git+$url@$tag"

Install-ChocolateyEnvironmentVariable -VariableName "TMP" -VariableValue "$tmp" -VariableType "User"
Install-ChocolateyEnvironmentVariable -VariableName "TEMP" -VariableValue "$temp" -VariableType "User"