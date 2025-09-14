<p align="center"><img src="images/redwine.png" width="256" height="" alt="RedWine"></p>
<h1 align="center">RedWine</h1>
<p align="center">Offensive Chocolatey packages for Windows</p>
<hr>

*RedWine* is a static, public and unauthenticated [NuGet](https://www.nuget.org/) feed, powered by [Sleet](https://github.com/emgarten/Sleet), hosting custom offensive [Chocolatey](https://chocolatey.org/) packages to automate offensive Windows configuration.

> [!IMPORTANT]
> If it is your first time here, [RTFM](https://github.com/ky4meru/RedWine#rtfm).

## TL;DR

Run a PowerShell session **as administrator** then use the following commands.

```powershell
# Add RedWine as source.
choco source add --name 'RedWine' --source 'https://ky4meru.github.io/RedWine/index.json'

# List available packages
choco search --source 'RedWine'

# Install a specific package...
choco install redwine.$PackageName --yes --force

# ...or install all packages!
choco install redwine.all --yes --force
```

The installation of `redwine.all` might be long, especially because of `redwine.dotnet-*` packages. Be patient, grab a glass, and **enjoy *RedWine*... with moderation.**

## RTFM

### Considerations before installation

#### Host's prerequisites

*RedWine* is designed to work on either physical devices or virtual machines. In both cases, make sure to have a **working backup or a snapshot** before using this project.

At this time, *RedWine* is developed and tested - *then supported* - on:
* [Windows 10 Business 22H2](https://massgrave.dev/windows_10_links).
* [Windows 11 Business 23H2](https://massgrave.dev/windows_11_links).

Windows Updates must be fully applied before installing packages with Chocolatey.

#### Deal with antiviral engines

*RedWine* manipulates files that are considered as threats by all antiviral engines. It will - *for sure* - be annoying during the installation of most packages. To avoid this, make sure that `$Env:ChocolateyInstall` - *which will contain all the RedWine packages* - is part of the exclusion lists of the antiviral engines prior to any package installation.

> [!NOTE]
> You are free to set `$Env:ChocolateyInstall` prior to the Chocolatey installation. This possibility is interesting, especially to install packages at a path that is already excluded by the antiviral engines on the host.
>
> ```powershell
> # Run this only if you want to install Chocolatey at a custom location.
> # If no custom value is set, the default installation path is $Env:ProgramData\chocolatey.
> [System.Environment]::SetEnvironmentVariable("ChocolateyInstall", "$CustomPath", "Machine")
> 
> # Install Chocolatey (see https://chocolatey.org/install#individual).
> Set-ExecutionPolicy Bypass -Scope Process -Force
> [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
> Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
> ```

To exclude the Chocolatey folder from Windows Defender scans, run the following PowerShell command **as adminsitrator**. For other antiviral engines, please refer to the associated documentation.

```powershell
Add-MpPreference -ExclusionPath "$Env:ChocolateyInstall"
```

Finally, run the following PowerShell command **as adminsitrator** to make Chocolatey uses a custom cache location that is excluded from the antiviral scans. It also ensure a better cleaning during uninstallation processes.

```powershell
choco config set --name="cacheLocation" --value="$env:ChocolateyInstall\temp"
```

### Packages

*Redwine* provides different types of packages: portable executables, PowerShell modules, Python packages and Visual Studio solutions. *Redwine* provides a [Chocolatey extension](./packages/redwine.extension/extensions/redwine.psm1) to handle the different install processes, and [Chocolatey templates](./templates/) for **welcome** contributions.

To install the templates locally, use the following command.

```powershell
Copy-Item -Force -Recurse "$PathToRedWine\templates" $env:ChocolateyInstall
```

#### Portable executable

Portable executables are [shimmed](https://docs.chocolatey.org/en-us/features/shim/) in `$Env:ChocolateyInstall\bin`, which is part of the `PATH`.

#### PowerShell modules

PowerShell modules are downloaded then automatically imported in the PowerShell sessions via the `$PROFILE`.

> [!NOTE]
> If the `$PROFILE` cannot be loaded, change the [Execution Policy](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_execution_policies?view=powershell-7.5) on the Windows host **as administrator**.
>
> ```powershell
> Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force
> ```

#### Python packages

Python packages are installed with [pipx](https://github.com/pypa/pipx) for the conveniance of self-managed isolated virtual environments. For a complete integration with Chocolatey, and to avoid being bothered by antiviral engines, these environement variables are set on the system.

* `PIPX_HOME` is set to `$Env:ChocolateyInstall\pipx`.
* `PIPX_BIN_DIR` is set to `$Env:ChocolateyInstall\bin`
* `PIPX_MAN_DIR` is set to `$Env:ChocolateyInstall\man`
* `TMP` and `TEMP` are temporary set to `$Env:ChocolateyInstall\temp` during the installation of a package, then reverted back. This is due to pipx unpacking stuff in `TEMP`.

#### Visual Studio solutions

Solutions are downloaded and built on the system directly. Then, compiled executables are shimmed in `$Env:ChocolateyInstall\bin`, which is part of the `PATH`.

### Static NuGet feed

Because GitHub do not support unauthenticated fetch of public NuGet packages, *RedWine* leverages [Sleet](https://github.com/emgarten/Sleet) to host its packages on a static NuGet feed available at https://ky4meru.github.io/RedWine/.

Every time a push is made on the `main` branch, a [GitHub workflow](./.github/workflows/publish.yml) is triggered which basically perform the following steps.

1. Pack the packages.
2. Push them in the feed.
3. Publish them via GitHub Pages on the branch [gh-pages](https://github.com/ky4meru/RedWine/tree/gh-pages).

## Acknowledgements

To [Mandiant](https://github.com/mandiant) for their work on [CommandoVM](https://github.com/mandiant/commando-vm), which definitely inspired this project.

## License

See [LICENSE](./LICENSE.txt) file.