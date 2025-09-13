$ErrorActionPreference = 'Stop'

Start-ChocolateyProcessAsAdmin -ExeToRun "C:\Program Files (x86)\Microsoft Visual Studio\Installer\setup.exe" -Statements "modify --productId Microsoft.VisualStudio.Product.Community --channelId VisualStudio.16.Release --remove Microsoft.VisualStudio.Workload.VCTools --quiet --norestart"