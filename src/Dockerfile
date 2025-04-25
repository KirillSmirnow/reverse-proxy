FROM nginx:1
RUN apt update && apt install -y python3-certbot-nginx procps
RUN rm -rf /usr/share/nginx /etc/nginx/conf.d
COPY nginx.conf /etc/nginx/nginx.conf
COPY start.sh .
CMD ./start.sh
