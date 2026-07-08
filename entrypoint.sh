#!/bin/sh

# Start Alist in the background
/alist server &

# Wait for Alist to initialize
sleep 5

# Set admin password if provided
if [ -n "$ADMIN_PASSWORD" ]; then
    echo "Setting admin password..."
    /alist admin set "$ADMIN_PASSWORD"
fi

# Wait for Alist process
wait
