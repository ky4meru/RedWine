$ErrorActionPreference = 'Stop'

Start-ChocolateyProcessAsAdmin -ExeToRun "C:\Program Files (x86)\Microsoft Visual Studio\Installer\setup.exe" -Statements "modify --productId Microsoft.VisualStudio.Product.Community --channelId VisualStudio.16.Release --remove Microsoft.VisualStudio.Workload.ManagedDesktop --quiet --norestart"
Start-ChocolateyProcessAsAdmin -ExeToRun "C:\Program Files (x86)\Microsoft Visual Studio\Installer\setup.exe" -Statements "modify --productId Microsoft.VisualStudio.Product.Community --channelId VisualStudio.16.Release --remove Microsoft.Net.Component.3.5.DeveloperTools --quiet --norestart"
Start-ChocolateyProcessAsAdmin -ExeToRun "C:\Windows\system32\Dism.exe" -Statements "/Online /Disable-Feature /FeatureName:NetFx3 /NoRestart" -ValidExitCodes @(0, 3010)