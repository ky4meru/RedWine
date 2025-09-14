function Install-RedWinePortablePackage {
    [CmdletBinding()]
    param(
        [ValidateNotNullOrEmpty()]
        [String] $Name,

        [ValidateNotNullOrEmpty()]
        [String] $Url,

        [ValidateNotNullOrEmpty()]
        [String] $Path
    )

    $PackageArgs = @{
        PackageName = $Name
        Url = $Url
        FileFullPath = $Path
    }

    Get-ChocolateyWebFile @PackageArgs
}

function Install-RedWinePythonPackage {
    [CmdletBinding()]
    param(
        [ValidateNotNullOrEmpty()]
        [String] $Url,

        [ValidateNotNullOrEmpty()]
        [String] $Tag
    )

    $CachedLocation = Get-ChocolateyConfigValue -configKey 'cacheLocation'
    $SavedTmp = "$Env:TMP"
    $SavedTemp = "$Env:TEMP"

    Install-ChocolateyEnvironmentVariable -VariableName "TMP" -VariableValue "$CachedLocation" -VariableType "User"
    Install-ChocolateyEnvironmentVariable -VariableName "TEMP" -VariableValue "$CachedLocation" -VariableType "User"
    Update-SessionEnvironment

    Start-ChocolateyProcessAsAdmin -ExeToRun "python" -Statements "-m pipx install git+$Url@$Tag --pip-args='--no-cache-dir'"

    Install-ChocolateyEnvironmentVariable -VariableName "TMP" -VariableValue "$SavedTmp" -VariableType "User"
    Install-ChocolateyEnvironmentVariable -VariableName "TEMP" -VariableValue "$SavedTemp" -VariableType "User"
    Update-SessionEnvironment
}

function Uninstall-RedWinePythonPackage {
    [CmdletBinding()]
    param(
        [ValidateNotNullOrEmpty()]
        [String] $Name
    )

    Start-ChocolateyProcessAsAdmin -ExeToRun "python" -Statements "-m pipx uninstall $Name -y"
}

function Install-RedWineArchivePackage {
    [CmdletBinding()]
    param(
        [ValidateNotNullOrEmpty()]
        [String] $Name,

        [ValidateNotNullOrEmpty()]
        [String] $Url,
        
        [ValidateNotNullOrEmpty()]
        [String] $Path
    )

    $packageArgs = @{
        packageName = $Name
        unzipLocation = $Path
        url = $Url
    }

    Install-ChocolateyZipPackage @packageArgs
}

Export-ModuleMember -Function "Install-RedWinePortablePackage"
Export-ModuleMember -Function "Install-RedWinePythonPackage"
Export-ModuleMember -Function "Uninstall-RedWinePythonPackage"
Export-ModuleMember -Function "Install-RedWineArchivePackage"