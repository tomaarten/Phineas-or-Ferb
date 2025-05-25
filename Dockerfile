# Use Minideb as minimal Debian base
FROM bitnami/minideb:bookworm

# Install Nginx
USER root
RUN apt-get update && \
    apt-get install -y --no-install-recommends nginx && \
    rm -rf /var/lib/apt/lists/*

# Copy static site into Nginx web root
COPY public/ /var/www/html/

# Expose HTTP port
EXPOSE 80

# Run Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
