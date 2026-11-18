FROM nginx/nginx-unprivileged:1.30.6-trixie

COPY index.html /usr/share/nginx/html/index.html
