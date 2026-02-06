# Dockerfile seguro que verifica existencia
FROM nginx:alpine

# Crear directorio si no existe (redundante pero seguro)
RUN mkdir -p /usr/share/nginx/html

# Copiar con verificación
COPY site/ /usr/share/nginx/html/

# Si site/ está vacío, copiar una página por defecto
RUN if [ -z "$(ls -A /usr/share/nginx/html)" ]; then \
    echo '<h1>Nginx en Docker - No hay archivos en site/</h1>' > /usr/share/nginx/html/index.html; \
    fi

# Exponer puerto
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]