FROM nginx/nginx-unprivileged:1.30.6-trixie

# On passe temporairement en root pour mettre à jour zlib1g.
USER root

# On installe la version corrigée de zlib1g.
RUN apt-get update \
    && apt-get install -y --only-upgrade zlib1g \
    && rm -rf /var/lib/apt/lists/*

# On rétablit l'exécution avec un utilisateur non privilégié.
USER 101

# On copie la page HTML dans le répertoire NGINX.
COPY index.html /usr/share/nginx/html/index.html
