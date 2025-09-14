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

Export-ModuleMember -Function "Install-RedWinePortablePackage"