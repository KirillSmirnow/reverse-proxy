# Demo

```bash
docker build -t reverse-proxy src
docker compose --project-directory example up --build
```

# Usage

## docker-compose.yml

```yaml
services:
  reverse-proxy:
    build:
      dockerfile: reverse-proxy.Dockerfile
    restart: always
    environment:
      # A space-separated list of domains for which TLS should be enabled
      TLS_DOMAINS: hello.example.com beta.example.com
      # An email for certbot sign-up
      EMAIL: owner-mail@example.com
    ports:
      # HTTP
      - 80:80
      # HTTPS
      - 443:443
      # Custom TCP port
      - 2222:2222
    volumes:
      # TLS configs are stored in a volume
      - letsencrypt:/etc/letsencrypt
volumes:
  letsencrypt:
```

## Dockerfile

```dockerfile
# change version if needed
FROM ghcr.io/kirillsmirnow/reverse-proxy:0.0.1
# copy HTTP 'server' configs (optional)
COPY http1.conf http2.conf /etc/nginx/http.d/
# copy TCP 'server' configs (optional)
COPY stream1.conf stream2.conf /etc/nginx/stream.d/
```
