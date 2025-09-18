# Use a lightweight Ubuntu base image
FROM ubuntu:20.04

# Install cowsay and other dependencies
RUN apt-get update && apt-get install -y \
    cowsay \
    bash \
    && rm -rf /var/lib/apt/lists/*

# Copy the Wisecow script and text file to the container
COPY wisecow.sh /app/wisecow.sh
COPY wisecow.txt /app/wisecow.txt

# Set working directory
WORKDIR /app

# Make the script executable
RUN chmod +x wisecow.sh

# Expose port 4499 (as per Wisecow repo)
EXPOSE 4499

# Run the Wisecow script
CMD ["/app/wisecow.sh"]
