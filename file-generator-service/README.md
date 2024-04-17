# File Generator Service

## Overview
This service handles file generation.

## Setup
To run this project, install it locally using npm:

```bash
npm install
npm start

docker build -t file-generator-service .
docker run -p 8080:8080 --name file-gen-service file-generator-service

# if to local registry
docker build -t localhost:5000/file-generator-service:latest .
docker run -p 8080:8080 localhost:5000/file-gen-service:latest
```
Test the api 
```bash
curl http://localhost:8080/api/health
```
```bash
response { "message": "Hello from the API!" }
```
check the logs also