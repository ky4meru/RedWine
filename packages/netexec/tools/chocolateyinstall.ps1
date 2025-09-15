$ErrorActionPreference = 'Stop'

Install-ChocolateyEnvironmentVariable -VariableName "NXC_PATH" -VariableValue "$Env:ChocolateyInstall\.nxc" -VariableType "User"
Update-SessionEnvironment

$packagesArgs = @{
    url = "https://github.com/Pennyw0rth/NetExec"
    tag = "027e52082425a9deda55c8cbcf94a1e867d740a7"
}

Install-RedWinePythonPackage @packagesArgs