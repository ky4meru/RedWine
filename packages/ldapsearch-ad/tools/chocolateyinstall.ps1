$ErrorActionPreference = 'Stop'

$url = 'https://github.com/yaap7/ldapsearch-ad'

Start-ChocolateyProcessAsAdmin -ExeToRun "python" -Statements "-m pipx install git+$url@v$env:ChocolateyPackageVersion"