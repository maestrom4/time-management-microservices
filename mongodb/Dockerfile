# Use the official MongoDB image from the Docker Hub
FROM mongo:latest

# Set environment variables (optional)
ENV MONGO_INITDB_ROOT_USERNAME=admin
ENV MONGO_INITDB_ROOT_PASSWORD=password
ENV MONGO_INITDB_DATABASE=time-mngt-app

# Expose port 27017 to access MongoDB externally
EXPOSE 27017

COPY ./mongo-init.js /docker-entrypoint-initdb.d/