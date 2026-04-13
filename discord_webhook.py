from dotenv import load_dotenv
import os
import sys
import requests

load_dotenv()

WEBHOOK_URL = os.getenv("DISCORD_WEBHOOK_URL")

if not WEBHOOK_URL:
    print("DISCORD_WEBHOOK_URL ontbreekt", file=sys.stderr)
    sys.exit(1)

payload = {
    "content": "✅ Raspberry Pi is online!"
}

try:
    response = requests.post(WEBHOOK_URL, json=payload, timeout=10)
    response.raise_for_status()
    print("Webhook verstuurd:", response.status_code)
except requests.exceptions.RequestException as e:
    print(f"Fout: {e}", file=sys.stderr)
    sys.exit(1)