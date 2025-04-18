# Use a lightweight web server image
FROM nginx:alpine

# Remove the default nginx index page
RUN rm -rf /usr/share/nginx/html/*

# Copy your custom site files into nginx's public folder
COPY . /usr/share/nginx/html
