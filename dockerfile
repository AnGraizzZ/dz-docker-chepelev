FROM ubuntu:22.04

COPY nginx_1.29.0-1~jammy_amd64.deb /tmp/

COPY index.html /usr/share/nginx/html/index.html

RUN apt-get update && \
    apt-get install -y /tmp/nginx_1.29.0-1~jammy_amd64.deb && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/*.deb

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]