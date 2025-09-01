$ErrorActionPreference = 'Stop'

& ([ScriptBlock]::Create((New-Object Net.WebClient).DownloadString('https://get.activated.win'))) /HWID /S