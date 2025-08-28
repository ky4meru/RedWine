$ErrorActionPreference = 'Stop'

$packageName = "MailSniper"

Get-Content -Path $PROFILE | Select-String -Pattern $packageName -NotMatch | Out-File -Path $PROFILE