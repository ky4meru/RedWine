<p align="center"><img src="images/redwine.png" width="256" height="" alt="RedWine"></p>
<h1 align="center">RedWine</h1>
<p align="center">PowerShell script that leverages Chocolatey to automate offensive Windows configuration</p>
<hr>

## TL;DR

Start a PowerShell session **as administrator** then run the following command.

```powershell
Invoke-Expression (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/ky4meru/RedWine/master/start.ps1')
```

## RTFM

When executed, *RedWine* will perform following operations.
 
* Install [Chocolatey](https://chocolatey.org/).
* Download and install a multitude of useful offensive tools.
* Uninstall plenty of useless Windows built-in applications.
* Permanently activate Windows with [Microsoft Activation Scripts](https://github.com/massgravel/Microsoft-Activation-Scripts).
* Update the system.
* Permanently remove Windows Defender with [Defender Remover](https://github.com/ionuttbara/windows-defender-remover).
* Reboot.

## License

See [LICENSE](./LICENSE.txt) file.