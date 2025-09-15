$ErrorActionPreference = 'Stop'

Remove-Item -Recurse -Force $env:NXC_PATH
Uninstall-ChocolateyEnvironmentVariable -VariableName "NXC_PATH" -VariableType "User"
Update-SessionEnvironment

$packagesArgs = @{
    name = "netexec"
}

Uninstall-RedWinePythonPackage @packagesArgs