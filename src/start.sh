#!/usr/bin/env bash

nginx

for domain in $TLS_DOMAINS; do
  echo "TLS for <$domain>"
  certbot --non-interactive \
    --agree-tos --email "${EMAIL:-mail@example.com}" \
    --nginx \
    --domain "$domain"
done

sleep infinity
