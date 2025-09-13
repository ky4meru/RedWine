$ErrorActionPreference = 'Stop'

$packageName = "Invoke-Obfuscation"

Get-Content -Path $PROFILE | Select-String -Pattern $packageName -NotMatch | Out-File -Path $PROFILE