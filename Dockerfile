# Dockerfile con compilación interna
FROM python:3.11-slim as builder

WORKDIR /app

# Copiar requerimientos y instalar
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copiar código fuente
COPY main.py .
COPY tests.py .

# COMPILAR/EJECUTAR DENTRO DEL CONTENEDOR (¡ESTE ES EL PUNTO CLAVE!)
RUN python -c "from main import Calculator; print('✅ Aplicación compilada dentro de Docker')"
RUN python -m pytest tests.py -v

# --- SEGUNDA ETAPA: NGINX PARA SERVIR WEB ---
FROM nginx:alpine

# Copiar sitio web
COPY site/ /usr/share/nginx/html/

# También copiar la aplicación Python compilada (para mostrar que existe)
COPY --from=builder /app/main.py /usr/share/nginx/html/app-info.txt

# Crear un endpoint de info
RUN echo "Aplicación Python compilada: $(date)" > /usr/share/nginx/html/compilacion.txt
RUN echo "Contenido de main.py:" >> /usr/share/nginx/html/compilacion.txt
COPY main.py /usr/share/nginx/html/codigo-fuente.py

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]