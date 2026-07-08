#!/bin/sh

set -e

# Find the alist binary
ALIST_BIN=$(find / -type f -name alist 2>/dev/null | head -n 1)

echo "Found Alist binary: $ALIST_BIN"

# Start Alist
"$ALIST_BIN" server &

# Wait for startup
sleep 8

# Set admin password if provided
if [ -n "$ADMIN_PASSWORD" ]; then
    echo "Setting admin password..."
    "$ALIST_BIN" admin set "$ADMIN_PASSWORD"
fi

wait
