FROM node:18-alpine

# Create app directory
WORKDIR /usr/src/app

# Install a simple HTTP server
RUN npm install -g http-server

# Copy website files
COPY . .

# Expose port
EXPOSE 8080

# Set version environment variable
ENV APP_VERSION=1.0.0

# Start HTTP server
CMD ["http-server", "-p", "8080"]
