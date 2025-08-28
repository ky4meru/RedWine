$ErrorActionPreference = 'Stop'

$packageName = "LAPSToolkit"

Get-Content -Path $PROFILE | Select-String -Pattern $packageName -NotMatch | Out-File -Path $PROFILE