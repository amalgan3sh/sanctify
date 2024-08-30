# Use Ubuntu as the base image
FROM ubuntu:20.04

# Avoid prompts from apt
ENV DEBIAN_FRONTEND=noninteractive

# Set the working directory
WORKDIR /app

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    curl \
    git \
    unzip \
    xz-utils \
    zip \
    libglu1-mesa \
    openjdk-8-jdk \
    wget

# Install Flutter
RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Run basic check to download Dark SDK
RUN flutter doctor

# Copy the entire project to the container
COPY . .

# Get Flutter packages
RUN flutter pub get

# Build the web version of the app
RUN flutter build web

# Install nginx
RUN apt-get install -y nginx

# Copy the build output to replace the default nginx contents
RUN cp -r build/web/. /var/www/html

# Expose port 80
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]