$ErrorActionPreference = 'Stop'

# .NET Framework 3.5.
Start-ChocolateyProcessAsAdmin -ExeToRun "C:\Program Files (x86)\Microsoft Visual Studio\Installer\setup.exe" -Statements "modify --productId Microsoft.VisualStudio.Product.Community --channelId VisualStudio.16.Release --add Microsoft.VisualStudio.Workload.ManagedDesktop --quiet --norestart"
Start-ChocolateyProcessAsAdmin -ExeToRun "C:\Program Files (x86)\Microsoft Visual Studio\Installer\setup.exe" -Statements "modify --productId Microsoft.VisualStudio.Product.Community --channelId VisualStudio.16.Release --add Microsoft.Net.Component.3.5.DeveloperTools --quiet --norestart"
Start-ChocolateyProcessAsAdmin -ExeToRun "C:\Windows\system32\Dism.exe" -Statements "/Online /Enable-Feature /FeatureName:NetFx3 /All /NoRestart"

# .NET Framework 4.5.
Start-ChocolateyProcessAsAdmin -ExeToRun "C:\Program Files (x86)\Microsoft Visual Studio\Installer\setup.exe" -Statements "modify --productId Microsoft.VisualStudio.Product.Community --channelId VisualStudio.16.Release --add Microsoft.Net.Component.4.5.TargetingPack --quiet --norestart"