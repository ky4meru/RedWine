$ErrorActionPreference = 'Stop'

$packageName = "WinPwn"

Get-Content -Path $PROFILE | Select-String -Pattern $packageName -NotMatch | Out-File -Path $PROFILE