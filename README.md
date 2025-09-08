<p align="center"><img src="images/redwine.png" width="256" height="" alt="RedWine"></p>
<h1 align="center">RedWine</h1>
<p align="center">Public Chocolatey repository to automate offensive Windows configuration</p>
<hr>

## TL;DR

*RedWine* is both:
* A static [NuGet](https://www.nuget.org/) feed powered by [Sleet](https://github.com/emgarten/Sleet) hosting custom [Chocolatey](https://chocolatey.org/) packages.
* A standalone PowerShell script designed for the complete installation of an offensive Windows host.

Therefore, *RedWine* is designed to be used as a public source by Chocolatey.

```powershell
# Add RedWine as a source.
choco source add --name='RedWine' --source="https://ky4meru.github.io/RedWine/index.json"

# List available packages.
choco search --source='RedWine'

# Instal a package.
choco install $PackageName --source='RedWine'
```

To perform a complete installation (all *RedWine* packages), start a PowerShell session **as administrator** then run the following commands.

```powershell
# Optional: only if you want to install Chocolatey at a custom path.
[Environment]::SetEnvironmentVariable("ChocolateyInstall", "$Path", [System.EnvironmentVariableTarget]::Machine)
Invoke-Expression (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/ky4meru/RedWine/master/start.ps1')
```

## RTFM

### Considerations before installation

*RedWine* manipulates files that are considered as threats by all antiviral engines. It will - *for sure* - be annoying during the installation of most packages. To avoid this, *RedWine* proposes 2 different behaviors.

1. **`$Env:ChocolateyInstall` is set prior to *RedWine*'s execution:** it assumes that this custom path is whitelisted by the antiviral engines potentially running on the Windows host. Therefore, no additional actions are taken.
2.  **`$Env:ChocolateyInstall` is not set:** it assumes that only Windows Defender is running on the Windows host. Therefore, *RedWine* permanently adds `C:\ProgramData\Chocolatey` to the Windows Defender's exclusion lists.

Basically, option `1` is designed for cases where *RedWine* is deployed on a Windows host provided by a client, while option `2` is more for virtual machines deployments.

### What it does

When executed, *RedWine* will perform following operations.
 
* Install [Chocolatey](https://chocolatey.org/).
* Download and install a multitude of useful offensive tools.
* Uninstall plenty of useless Windows built-in applications.
* Permanently activate Windows with [Microsoft Activation Scripts](https://github.com/massgravel/Microsoft-Activation-Scripts).
* Update the system.
* Reboot.

## License

See [LICENSE](./LICENSE.txt) file.