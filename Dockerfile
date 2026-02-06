# Usar la imagen oficial de Nginx como base
FROM nginx:alpine

# Etiqueta informativa (opcional)
LABEL maintainer="tu-email@ejemplo.com"
LABEL description="Servidor Nginx para aplicación web"

# Eliminar la página de bienvenida por defecto de Nginx
RUN rm -rf /usr/share/nginx/html/*

# Copiar los archivos de tu sitio web al directorio de Nginx
# Asegúrate de tener tu sitio web en una carpeta 'site/' en el mismo directorio que el Dockerfile
COPY site/ /usr/share/nginx/html/

# Copiar configuración personalizada de Nginx (opcional)
# Si tienes un archivo nginx-custom.conf en tu proyecto:
# COPY nginx-custom.conf /etc/nginx/conf.d/default.conf

# Exponer el puerto 80 (puerto HTTP por defecto de Nginx)
EXPOSE 80

# Comando para ejecutar Nginx en primer plano
CMD ["nginx", "-g", "daemon off;"]