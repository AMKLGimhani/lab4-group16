# Use a lightweight web server image
FROM nginx:alpine

# Add a build argument for cache busting
ARG CACHE_BUST=1

# Remove the default nginx index page
RUN rm -rf /usr/share/nginx/html/*

# Copy your custom site files into nginx's public folder
COPY . /usr/share/nginx/html

# Make sure nginx can access all files
RUN chmod -R 755 /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Set health check
HEALTHCHECK --interval=30s --timeout=3s \
  CMD wget --no-verbose --tries=1 --spider http://localhost/ || exit 1

# Start nginx with daemon off
CMD ["nginx", "-g", "daemon off;"]
