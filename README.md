<p align="center"><img src="images/redwine.png" width="256" height="" alt="RedWine"></p>
<h1 align="center">RedWine</h1>
<p align="center">Public Chocolatey repository to automate offensive Windows configuration</p>
<hr>

## TL;DR

*RedWine* is both:
* A static [NuGet](https://www.nuget.org/) feed powered by [Sleet](https://github.com/emgarten/Sleet) hosting custom [Chocolatey](https://chocolatey.org/) packages.
* [Boxstarter](https://boxstarter.org/) script designed for the complete installation of an offensive Windows host.

Therefore, *RedWine* is designed to be used as a public source by Chocolatey...

```powershell
choco source add --name='RedWine' --source="https://ky4meru.github.io/RedWine/index.json"
choco search --source='RedWine'
choco install $PackageName --source='RedWine'
```

... but also provides a complete installation script - *i.e. all RedWine package, and even more*.

```powershell
START https://boxstarter.org/package/nr/url?https://raw.githubusercontent.com/ky4meru/RedWine/master/install.ps1
```

**Enjoy RedWine, with moderation.**

## RTFM

### Considerations before installation

*RedWine* manipulates files that are considered as threats by all antiviral engines. It will - *for sure* - be annoying during the installation of most packages. To avoid this, make sure that `$Env:ChocolateyInstall` is part of the exclusion lists of the antiviral engines prior to any installation. Below are some examples with Windows Defender.

```powershell
# Option #1: exclude the default installation path of Chocolatey.
Add-MpPreference -ExclusionPath "$Env:ProgramData\chocolatey"

# Option #2: set the installation path of Chocolatey to a specific location that is already excluded.
[Environment]::SetEnvironmentVariable("ChocolateyInstall", "$CustomPath", [System.EnvironmentVariableTarget]::Machine)
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

## License

See [LICENSE](./LICENSE.txt) file.