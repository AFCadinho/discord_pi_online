#!/usr/bin/env bash

# =========================
# Remove user systemd service
# Usage: ./remove-service.sh <service-name>
# =========================

SERVICE_NAME="$1"

if [ -z "$SERVICE_NAME" ]; then
    echo "Usage: $0 <service-name>"
    exit 1
fi

echo "🛑 Stopping service..."
systemctl --user stop "$SERVICE_NAME" 2>/dev/null

echo "❌ Disabling service..."
systemctl --user disable "$SERVICE_NAME" 2>/dev/null

SERVICE_PATH="$HOME/.config/systemd/user/${SERVICE_NAME}.service"

if [ -f "$SERVICE_PATH" ]; then
    echo "🗑️ Removing service file..."
    rm "$SERVICE_PATH"
else
    echo "⚠️ Service file not found"
fi

echo "🔄 Reloading systemd..."
systemctl --user daemon-reload

echo "✅ Done."