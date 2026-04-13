#!/usr/bin/env bash

# =========================
# Restart user systemd service
# Usage: ./restart-service.sh <service-name>
# =========================

SERVICE_NAME="$1"

if [ -z "$SERVICE_NAME" ]; then
    echo "Usage: $0 <service-name>"
    exit 1
fi

echo "🔁 Restarting service..."
systemctl --user restart "$SERVICE_NAME"

echo "📜 Showing status..."
systemctl --user status "$SERVICE_NAME" --no-pager

echo "✅ Done."