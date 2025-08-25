$ErrorActionPreference = 'Stop'

Start-ChocolateyProcessAsAdmin -ExeToRun "python" -Statements "-m pip uninstall pipx -y"
Remove-Item -Path $(Join-Path $Env:USERPROFILE "pipx") -Force -Recurse