$ErrorActionPreference = 'Stop'

Start-ChocolateyProcessAsAdmin -ExeToRun "C:\Program Files (x86)\Microsoft Visual Studio\Installer\setup.exe" -Statements "modify --productId Microsoft.VisualStudio.Product.Community --channelId VisualStudio.16.Release --add Microsoft.VisualStudio.Workload.ManagedDesktop --quiet --norestart"
Start-ChocolateyProcessAsAdmin -ExeToRun "C:\Program Files (x86)\Microsoft Visual Studio\Installer\setup.exe" -Statements "modify --productId Microsoft.VisualStudio.Product.Community --channelId VisualStudio.16.Release --add Microsoft.Net.Component.4.7.2.TargetingPack --quiet --norestart"
