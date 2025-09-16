FROM python:3.9-slim

WORKDIR /app

COPY wisecow.sh /app/

# Install prerequisites: netcat, cowsay, fortune
RUN apt-get update && \
    apt-get install -y netcat-openbsd cowsay fortune-mod && \
    chmod +x /app/wisecow.sh

EXPOSE 4499

CMD ["/app/wisecow.sh"]
