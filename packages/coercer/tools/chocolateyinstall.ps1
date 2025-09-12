$ErrorActionPreference = 'Stop'

$url = 'https://github.com/p0dalirius/Coercer'

$tmp = $Env:TMP
$temp = $Env:TEMP
Install-ChocolateyEnvironmentVariable -VariableName "TMP" -VariableValue "$Env:ChocolateyInstall\temp" -VariableType "User"
Install-ChocolateyEnvironmentVariable -VariableName "TEMP" -VariableValue "$Env:ChocolateyInstall\temp" -VariableType "User"

Start-ChocolateyProcessAsAdmin -ExeToRun "python" -Statements "-m pipx install git+$url@$env:ChocolateyPackageVersion"

Install-ChocolateyEnvironmentVariable -VariableName "TMP" -VariableValue "$tmp" -VariableType "User"
Install-ChocolateyEnvironmentVariable -VariableName "TEMP" -VariableValue "$temp" -VariableType "User"