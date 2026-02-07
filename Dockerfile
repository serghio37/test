# Dockerfile mínimo para Nginx
FROM nginx:alpine

# Copiar sitio web a Nginx
COPY site/ /usr/share/nginx/html/

# Puerto que expone Nginx
EXPOSE 80

# Comando para iniciar Nginx
CMD ["nginx", "-g", "daemon off;"]