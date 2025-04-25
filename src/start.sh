#!/usr/bin/env bash

for domain in $TLS_DOMAINS; do
  echo "TLS for <$domain>"
  certbot --non-interactive \
    --agree-tos --email "${EMAIL:-mail@example.com}" \
    --nginx \
    --domain "$domain"
done

nginx -s stop
sleep 0.5
nginx -g 'daemon off;'
