<p align="center"><img src="images/redwine.png" width="256" height="" alt="RedWine"></p>
<h1 align="center">RedWine</h1>
<p align="center">Public Chocolatey repository to automate offensive Windows configuration</p>
<hr>

> [!IMPORTANT]
> Read the [considerations before installation](./README.md#considerations-before-installation).

## TL;DR

*RedWine* is a static [NuGet](https://www.nuget.org/) feed, powered by [Sleet](https://github.com/emgarten/Sleet), hosting custom offensive [Chocolatey](https://chocolatey.org/) packages. Therefore, it is designed to be used as a **public** source by Chocolatey.

[Install Chocolatey](https://chocolatey.org/install#individual), then run the following commands **as administrator**.

```powershell
# Add RedWine as a source for Chocolatey.
choco source add --name='RedWine' --source='https://ky4meru.github.io/RedWine/index.json'

# List available RedWine packages.
choco search --source='RedWine'

# Install a RedWine package.
choco install redwine.$PackageName

# Install all RedWine packages.
choco install redwine.all
```

The installation of all packages might be long. Grab a glass and **enjoy *RedWine*... with moderation.**

## RTFM

### Considerations before installation

*RedWine* manipulates files that are considered as threats by all antiviral engines. It will - *for sure* - be annoying during the installation of most packages. To avoid this, make sure that `$Env:ChocolateyInstall` is part of the exclusion lists of the antiviral engines prior to any package installation. Below is the command to run for Windows Defender.

```powershell
Add-MpPreference -ExclusionPath "$Env:ChocolateyInstall"
```

### Packages

*Redwine* provides different types of packages: portable executables, PowerShell modules, Python packages and Visual Studio solutions. [Packages templates](./templates/) are provided for contribution.

#### Portable executable

Portable executables are installed in `$Env:ChocolateyInstall\bin`, which is part of the `PATH`.

#### PowerShell modules

PowerShell modules are downloaded then automatically added to the `$PROFILE`, so the cmdlets are automatically loaded at each PowerShell session.

#### Python packages

Python packages are installed with [pipx](https://github.com/pypa/pipx) for the conveniance of self-managed isolated virtual environments. For a complete integration with Chocolatey, and to avoid being bothered by antiviral engines, these environement variables are set on the system.

* `PIPX_HOME` is set to `$Env:ChocolateyInstall\pipx`.
* `PIPX_BIN` is set to `$Env:ChocolateyInstall\bin`
* `TMP` and `TEMP` are temporary set to `$Env:ChocolateyInstall\temp` during the installation of a package, then reverted back. This is due to pipx unpacking stuff in `TEMP`.

#### Visual Studio solutions

Solutions are downloaded and built on the system directly. Then, compiled executables are shimed in `$Env:ChocolateyInstall\bin`, which is part of the `PATH`.

### Static NuGet feed

Because GitHub do not support unauthenticated fetch of public NuGet packages, *RedWine* leverages [Sleet](https://github.com/emgarten/Sleet) to host its packages on a static NuGet feed available at https://ky4meru.github.io/RedWine/.

Every time a push is made on the `main` branch, a [GitHub workflow](./.github/workflows/publish.yml) is triggered which basically perform the following steps.

1. Pack the packages.
2. Push them in the feed.
3. Publish them via GitHub Pages on the branch `gh-pages`.

## Acknowledgements

To [Mandiant](https://github.com/mandiant) for their work on [CommandoVM](https://github.com/mandiant/commando-vm), which definitely inspired this project.

## License

See [LICENSE](./LICENSE.txt) file.