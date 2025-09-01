#Requires -RunAsAdministrator

$ChocolateyPackagesToInstall = @(
    "7zip"
    "awscli"
    "azure-cli"
    "burp-suite-free-edition"
    "discord"
    "docker-cli"
    "file-converter"
    "firefox"
    "flameshot"
    "git"
    "googlechrome"
    "hashcat"
    "keepass"
    "microsoft-windows-terminal"
    "nmap"
    "nuget.commandline"
    "obsidian"
    "openvpn-connect"
    "postman"
    "python"
    "qflipper"
    "sysinternals"
    "systeminformer"
    "tor-browser"
    "visualstudio2019community"
    "visualstudio2022community"
    "vscode"
    "wireguard"
    "wireshark"
)

$RedWinePackagesToInstall = @(
    # Install dependencies first.
    "dotnet-frameworks"
    "pipx"    

    # Then, install packages.
    "abuseazureapipermissions"
    "adrecon"
    "adsearch"
    "azurehound"
    "bloodhound-cli"
    "bloodyad"
    "bruteshark"
    "brutespray"
    "chisel"
    "domainpasswordspray"
    "dumpaadsynccreds"
    "edrsilencer"
    "gitleaks"
    "gobuster"
    "godpotato"
    "juicypotato"
    "kerbrute"
    "krbrelay"
    "krbrelayup"
    "lapstoolkit"
    "lazagne"
    "ldapsearch-ad"
    "ligolo-ng"
    "mailsniper"
    "mangle"
    "microsoft-activation-scripts"
    "mimikatz"
    "msolspray"
    "naabu"
    "netexec"
    "nuclei"
    "petitpotam"
    "powercat"
    "powerlurk"
    "powermad"
    "powersploit"
    "powerupsql"
    "printspoofer"
    "privesccheck"
    "psmapexec"
    "roguepotato"
    "rubeus"
    "rustscan"
    "safetykatz"
    "seatbelt"
    "shadowspray"
    "sharpdpapi"
    "sharpersist"
    "sharpexclusionfinder"
    "sharpgpoabuse"
    "sharphound"
    "sharpsccm"
    "sharpsystemtriggers"
    "sharpup"
    "sharpview"
    "sharpwmi"
    "snaffler"
    "spoolfool"
    "sqlrecon"
    "standin"
    "sweetpotato"
    "threatcheck"
    "tokenuniverse"
    "trufflehog"
    "watson"
    "whisker"
    "winpeas"
    "winpwn"
)

$AppxProvisionedPackagesToRemove = @(
    "Microsoft.BingWeather"
    "Microsoft.MicrosoftSolitaireCollection"
    "Microsoft.WindowsFeedbackHub"
    "Microsoft.XboxGameOverlay"
    "Microsoft.XboxGamingOverlay"
    "Microsoft.XboxIdentityProvider"
    "Microsoft.XboxSpeechToTextOverlay"
    "Microsoft.YourPhone"
    "Microsoft.ZuneMusic"
    "Microsoft.ZuneVideo"
)

$RedWineZipPath = $(Join-Path $Env:TEMP "RedWine.zip")
$RedWineMainFolderPath = $(Join-Path $Env:TEMP "RedWine-main")
$RedWineFolderPath = $(Join-Path $Env:TEMP "RedWine")
$RedWinePackagesPath = $(Join-Path $RedWineFolderPath "packages")

# Install Chocolatey (see https://chocolatey.org/install).
Set-ExecutionPolicy Bypass -Scope Process -Force;
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Ensure Windows Defender will not be annoying until it will be permanently removed.
Add-MpPreference -ExclusionPath $Env:ChocolateyInstall

# Fetch RedWine.
Invoke-WebRequest -Uri 'https://github.com/ky4meru/RedWine/archive/refs/heads/main.zip' -OutFile $RedWineZipPath
Expand-Archive -Path $RedWineZipPath -DestinationPath $Env:TEMP -Force
Move-Item $RedWineMainFolderPath $RedWineFolderPath -Force

# Install Chocolatey packages.
choco install $ChocolateyPackagesToInstall --yes

# Install RedWine packages.
foreach ($Package in $RedWinePackagesToInstall) {
    $PackagePath = $(Join-Path $RedWinePackagesPath $Package)
    choco pack $(Join-Path $PackagePath "$Package.nuspec") --out $PackagePath
    choco install $Package --source=$PackagePath --yes
}

# Remove RedWine.
Remove-Item $RedWineZipPath -Force
Remove-Item $RedWineFolderPath -Force -Recurse

# Uninstall Windows built-in apps.
foreach ($Package in $AppxProvisionedPackagesToRemove) {
    Get-AppxProvisionedPackage -Online | Where-Object { $_.DisplayName -match $Package } | Remove-AppxProvisionedPackage -Online -AllUsers
}

# Update the system.
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
Install-Module -Name PSWindowsUpdate -Force
Get-WindowsUpdate -Install -AcceptAll

# TODO: Permanently remove Windows Defender.
# Add-MpPreference -ExclusionPath $Env:TEMP
# $DefenderRemoveExe = [System.IO.Path]::GetTempFileName() + '.exe'
# Invoke-WebRequest "https://github.com/ionuttbara/windows-defender-remover/releases/download/release_def_12_8_4/DefenderRemover.exe" -OutFile $DefenderRemoveExe
# Start-Process $DefenderRemoveExe -ArgumentList "/R" -Wait
# Remove-Item $DefenderRemoveExe

# Reboot.
Restart-Computer -Force