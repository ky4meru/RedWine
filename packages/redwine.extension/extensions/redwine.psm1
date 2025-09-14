function Install-RedWinePortablePackage {
    [CmdletBinding()]
    param(
        [ValidateNotNullOrEmpty()]
        [String] $PackageName,

        [ValidateNotNullOrEmpty()]
        [String] $Url
    )

    $ToolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

    $PackageArgs = @{
        PackageName = $PackageName
        FileFullPath = $(Join-Path $ToolsDir "$PackageName.exe")
        Url = $Url
    }

    Get-ChocolateyWebFile @PackageArgs
}

Export-ModuleMember -Function "Install-RedWinePortablePackage"