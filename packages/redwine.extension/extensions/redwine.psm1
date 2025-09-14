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

    $TarFile = Get-ChildItem -File -Path $Path -Filter *.tar
    if ($TarFile) {
        Get-ChocolateyUnzip -FileFullPath $TarFile.FullName -Destination $Path
    }
}

function Install-RedWinePowerShellModulePackage {
    [CmdletBinding()]
    param(
        [ValidateNotNullOrEmpty()]
        [String] $Name,

        [ValidateNotNullOrEmpty()]
        [String] $Url,

        [ValidateNotNullOrEmpty()]
        [String] $Tag,
        
        [ValidateNotNullOrEmpty()]
        [String] $Path,
        
        [ValidateNotNullOrEmpty()]
        [String] $Module
    )

    $packageArgs = @{
        Name = $Name
        Url = $Url
        Path = $Path
    }

    Install-RedWineArchivePackage @packageArgs

    $ModulePath = $(Join-Path $(Join-Path $Path "$Name-$Tag") "$Module")
    Add-Content -Path $PROFILE -Value "Import-Module $ModulePath"
}

function Uninstall-RedWinePowerShellModulePackage {
    [CmdletBinding()]
    param(
        [ValidateNotNullOrEmpty()]
        [String] $Name
    )

    Get-Content -Path $PROFILE | Select-String -Pattern $Name -NotMatch | Out-File -Path $PROFILE
}

function Install-RedWinePowerShellScriptPackage {
    [CmdletBinding()]
    param(
        [ValidateNotNullOrEmpty()]
        [String] $Name,

        [ValidateNotNullOrEmpty()]
        [String] $Url,

        [ValidateNotNullOrEmpty()]
        [String] $Tag,
        
        [ValidateNotNullOrEmpty()]
        [String] $Path
    )

    $packageArgs = @{
        Name = $Name
        Url = $Url
        Path = $Path
    }

    Install-RedWineArchivePackage @packageArgs

    $ScriptPath = $(Join-Path $(Join-Path $Path "$Name-$Tag") "$Name.ps1")
    $BinPath = $(Join-Path $env:ChocolateyInstall "bin")
    Copy-Item $ScriptPath $BinPath -Force
}

function Uninstall-RedWinePowerShellScriptPackage {
    [CmdletBinding()]
    param(
        [ValidateNotNullOrEmpty()]
        [String] $Name
    )

    $ScriptPath = $(Join-Path $(Join-Path $env:ChocolateyInstall "bin") "$Name.ps1")
    Remove-Item $ScriptPath -Force
}

function Install-RedWineSolutionPackage {
    [CmdletBinding()]
    param(
        [ValidateNotNullOrEmpty()]
        [String] $Name,

        [ValidateNotNullOrEmpty()]
        [String] $Url,

        [ValidateNotNullOrEmpty()]
        [String] $Tag,
        
        [ValidateNotNullOrEmpty()]
        [String] $Path,

        [ValidateNotNullOrEmpty()]
        [String] $Version
    )

    $packageArgs = @{
        Name = $Name
        Url = $Url
        Path = $Path
    }

    Install-RedWineArchivePackage @packageArgs

    $MsBuild = "C:\Program Files (x86)\Microsoft Visual Studio\$Version\Community\MSBuild\Current\Bin\MSBuild.exe"
    $SolutionPath = $(Join-Path $(Join-Path $Path "$Name-$Tag") "$Name.sln")

    Start-ChocolateyProcessAsAdmin -ExeToRun "nuget" -Statements "restore $SolutionPath" -ErrorAction "SilentlyContinue"
    Start-ChocolateyProcessAsAdmin -ExeToRun $MsBuild -Statements "$SolutionPath -p:Configuration=Release"
}

Export-ModuleMember -Function "Install-RedWinePortablePackage"
Export-ModuleMember -Function "Install-RedWinePythonPackage"
Export-ModuleMember -Function "Uninstall-RedWinePythonPackage"
Export-ModuleMember -Function "Install-RedWineArchivePackage"
Export-ModuleMember -Function "Install-RedWinePowerShellModulePackage"
Export-ModuleMember -Function "Uninstall-RedWinePowerShellModulePackage"
Export-ModuleMember -Function "Install-RedWinePowerShellScriptPackage"
Export-ModuleMember -Function "Uninstall-RedWinePowerShellScriptPackage"
Export-ModuleMember -Function "Install-RedWineSolutionPackage"