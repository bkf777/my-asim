#!/bin/sh

# If ALLOW_ORIGIN is empty, try to load from .env
if [ -z "$ALLOW_ORIGIN" ] && [ -f /app/.env ]; then
  # Read ALLOW_ORIGIN from .env
  val=$(grep "^ALLOW_ORIGIN=" /app/.env | cut -d= -f2-)
  if [ -n "$val" ]; then
    export ALLOW_ORIGIN="$val"
  fi
fi

# Fallback to * if still empty
if [ -z "$ALLOW_ORIGIN" ]; then
  export ALLOW_ORIGIN="*"
fi

# Replace environment variables in nginx config
envsubst '${PORT} ${ALLOW_ORIGIN}' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf

# Start Nginx
exec nginx -g 'daemon off;'
