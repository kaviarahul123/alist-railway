#!/bin/sh

/alist server &

echo "Waiting for Alist to start..."

until /alist admin random >/dev/null 2>&1; do
    sleep 1
done

if [ -n "$ADMIN_PASSWORD" ]; then
    /alist admin set "$ADMIN_PASSWORD"
fi

wait
