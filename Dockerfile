# Dockerfile mínimo - solo despliega Nginx
FROM nginx:alpine

# Copiar sitio web
COPY site/ /usr/share/nginx/html/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]