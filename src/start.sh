#!/usr/bin/env bash

for domain in $TLS_DOMAINS; do
  echo "TLS for <$domain>"
  certbot --non-interactive \
    --agree-tos --email "${EMAIL:-mail@example.com}" \
    --nginx \
    --domain "$domain"
done

nginx -s stop
while pgrep nginx >/dev/null; do sleep 0.01; echo -n 'W'; done; echo
nginx -g 'daemon off;'
