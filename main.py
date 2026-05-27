import psutil
import requests
import subprocess
import time
import sys
import tempfile

code = sys.argv[1]
duration = sys.argv[2]

status = "false"
failedAttempts = 0

domains = [
    "roblox.com",
    "www.roblox.com",
    "auth.roblox.com",
    "apis.roblox.com",
    "thumbnails.roblox.com",
    "games.roblox.com",
    "voice.roblox.com",
    "economy.roblox.com",
    "ecsv2.roblox.com",
    "metrics.roblox.com",
    "presence.roblox.com",
    "friends.roblox.com",
    "assetgame.roblox.com",
    "lms.roblox.com",
    "locale.roblox.com",
    "pulsar.roblox.com",
    "notifications.roblox.com",
    "contacts.roblox.com",
    "usermoderation.roblox.com",
    "trades.roblox.com",
    "privatemessages.roblox.com",
    "tr.rbxcdn.com",
    "js.rbxcdn.com",
    "css.rbxcdn.com",
    "images.rbxcdn.com",
    "static.rbxcdn.com"
]

string = ""
for domain in domains:
    string += "0.0.0.0 " + domain + "\n"
      
def set_hosts():
    try:
        with open(r"C:\Windows\System32\drivers\etc\hosts", 'w') as f:
            f.write(string)
        print("[+] Hosts file overwritten with Roblox block entries")
    except Exception as e:
        print(f"[!] Error writing to hosts file: {e}")

def delete_hosts():
    try:
        with open(r"C:\Windows\System32\drivers\etc\hosts", 'w') as f:
            f.write("")
        print("[+] Hosts file cleared")
    except Exception as e:
        print(f"[!] Error while clearing hosts file: {e}")

while True:
    try:
        response = requests.get(f"http://rh.abdullah.to/{code}/status", timeout=5)
        response.raise_for_status()
        status = response.text.strip().lower()
        print(f"[+] API status: {status}")
        failedAttempts = 0
    except Exception as e:
        failedAttempts += 1
        print(f"[!] Error fetching status: {e}")
        print (f"Failed attempts: {failedAttempts}")

    if status == "true" or failedAttempts > 10:
        set_hosts()

        for proc in psutil.process_iter(['pid', 'exe']):
            exe_path = proc.info['exe']
            if exe_path and 'roblox' in exe_path.lower():
                print(f"Killing {exe_path} (PID {proc.pid})")
                proc.kill()
                subprocess.run(["ipconfig", "/flushdns"], check=False)

    else:
        delete_hosts()

    time.sleep(int(duration))
