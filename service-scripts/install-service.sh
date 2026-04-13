#!/usr/bin/env bash

# =========================
# Install user systemd service
# Usage: ./install-service.sh <service-name>
# =========================

SERVICE_NAME="$1"

if [ -z "$SERVICE_NAME" ]; then
    echo "Usage: $0 <service-name>"
    exit 1
fi

SERVICE_FILE="${SERVICE_NAME}.service"
TARGET_DIR="$HOME/.config/systemd/user"

if [ ! -f "$SERVICE_FILE" ]; then
    echo "❌ Service file not found: $SERVICE_FILE"
    exit 1
fi

echo "📁 Ensuring systemd user directory exists..."
mkdir -p "$TARGET_DIR"

echo "📦 Copying service file..."
cp "$SERVICE_FILE" "$TARGET_DIR/"

echo "🔄 Reloading systemd..."
systemctl --user daemon-reload

echo "🚀 Starting service..."
systemctl --user start "$SERVICE_NAME"

echo "📜 Showing status..."
systemctl --user status "$SERVICE_NAME" --no-pager

echo "✅ Done."