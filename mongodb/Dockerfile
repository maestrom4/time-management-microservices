# Use the official MongoDB image as the base image
FROM mongo:latest

# Copy custom MongoDB configurations if needed
# COPY ./mongod.conf /etc/mongod.conf

# Add labels for documentation
LABEL maintainer="your-email@example.com"
LABEL version="1.0"
LABEL description="Custom MongoDB image."

# Expose the default MongoDB port
EXPOSE 27017

# Set the user to run as non-root for security
USER mongodb

# Set any environment variables
ENV MONGO_INITDB_ROOT_USERNAME mongoadmin
ENV MONGO_INITDB_ROOT_PASSWORD mongopassword
ENV MONGO_INITDB_DATABASE mydatabase

# Start MongoDB using the configuration file (if you added one)
# CMD ["mongod", "--config", "/etc/mongod.conf"]
