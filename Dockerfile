# Use an official base image (you can choose an appropriate base image)
FROM --platform=linux/amd64 ubuntu:latest

# Set the working directory inside the container
WORKDIR /app

# Install OpenSSL and any other necessary dependencies
RUN apt-get update && \
    apt-get install -y openssl wget curl

EXPOSE 8547 8552 8548 4001

# Copy the application files into the container
COPY . /app

RUN chmod +x /app/bahamut

# Specify the command to run your application
CMD ["bash", "-c", "/app/bahamut install && /app/bahamut start --network oasis && tail -f /dev/null"]
