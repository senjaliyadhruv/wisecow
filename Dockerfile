# Use Ubuntu as the base image
FROM ubuntu:20.04

# Avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update package list and install required packages
RUN apt-get update && \
    apt-get install -y \
    fortune-mod \
    cowsay \
    netcat-openbsd && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create a working directory
WORKDIR /app

# Copy the wisecow script to the container
COPY wisecow.sh .

# Make the script executable
RUN chmod +x wisecow.sh

# Expose port 4499
EXPOSE 4499

# Run the wisecow application
CMD ["./wisecow.sh"]
