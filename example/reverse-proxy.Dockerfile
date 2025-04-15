FROM reverse-proxy
COPY http.conf /etc/nginx/http.d/
COPY stream.conf /etc/nginx/stream.d/
