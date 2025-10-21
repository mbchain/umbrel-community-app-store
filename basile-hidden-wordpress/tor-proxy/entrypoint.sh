#!/bin/bash
set -e

TARGET_CONTAINER="${TARGET_CONTAINER:-wordpress_app_1}"
TARGET_PORT="${TARGET_PORT:-80}"

# Prepare torrc from template
envsubst < /etc/tor/torrc.template > /etc/tor/torrc

echo "📡 Exposing ${TARGET_CONTAINER}:${TARGET_PORT} over Tor..."
echo "🗂  Hidden service data at /var/lib/tor/hidden_service"

mkdir -p /var/lib/tor/hidden_service
chown -R debian-tor:debian-tor /var/lib/tor/hidden_service
chmod 700 /var/lib/tor/hidden_service

# Start Tor
exec tor -f /etc/tor/torrc
