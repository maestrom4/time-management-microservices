Kubernetes Orchestration for a Multi-Language Microservice Application

![NPM Version](https://img.shields.io/npm/v/npm)
![License](https://img.shields.io/github/license/maestrom4/time-management-microservices)
![GitHub Contributions](https://img.shields.io/github/contributors/maestrom4/time-management-microservices)
![GitHub Stars](https://img.shields.io/github/stars/maestrom4/time-management-microservices)

## Introduction:

This project exemplifies the orchestration of a multi-language microservice architecture within a Kubernetes landscape, utilizing Minikube for local deployment. Each microservice is containerized using Docker, incorporating a Next.js frontend with server-side rendering (SSR) for a robust user experience. The backend services are powered by Node.js with the Express framework for streamlined server-side functionality, and additional services utilize Golang with the Gin framework for performance and efficiency. The project employs TypeScript for static typing in JavaScript environments, adheres to the Atomic Design methodology for UI development to promote consistency and reuse, and leverages Redux Toolkit for effective state management in React applications. Database interactions are managed with MongoDB, with GraphQL serving as the interface for queries and mutations. The overarching aim is to demonstrate the deployment, scalability, and architectural design of a complex system within an integrated Kubernetes setting.


System Archi


![GitHub Logo](https://github.com/maestrom4/Bundy-management-microservice/blob/develop/bundyRevamp4.jpg?raw=true)

### Project Status Update  
We are making steady progress across the different services of our project. Here's the current status of each component:  

- **API Gateway Service**: 5% complete. This service is in the initial stages of development.  
- **Auth Service**: 50% complete. This component is actively under development and currently in a Work in Progress (WIP) state.  
- **File Generator Service**: 5% complete. Initial development has started.  
- **Client Interface**: 5% complete. Early development phase.  
- **Payslip Service**: 5% complete. We have begun laying the groundwork for this service.  
- **Employee Service**: 5% complete. Initial development has been kicked off.  
- **Time Log Service**: 5% complete. Development has just started.  

Currently, the Auth Service is the only component designated as "Work in Progress" indicating active and priority development. We are focused on advancing its features to meet upcoming milestones.


# Table of Contents
- [Table of Contents](#table-of-contents)
	- [Technologies and Design Patterns](#technologies-and-design-patterns)
	- [Prerequisites](#prerequisites)
	- [Setup](#setup)
		- [Clone the Repository:](#clone-the-repository)
		- [Docker Installation:](#docker-installation)
		- [Kubectl Installation:](#kubectl-installation)

## Technologies and Design Patterns
- Typescript
- Next.js Server Side Rendering
- Node.js
- Microservices
- Kubernetes
- Minikube (local testing for a single cluster)
- Docker
- Atomic Pattern
- Redux Slice Version
- Golang
- Tailwind combined with Styled Components offers rapid design capabilities and extensive customization options.
- MongoDB
- GraphQL for database management with MongoDB

## Prerequisites
Before you begin, ensure you have the following installed:
- Minikube
- Docker
- kubectl
- Node.js
- Golang
- Next.js

## Setup
### Clone the Repository:
```bash
git clone git@github.com:maestrom4/time-management-microservices.git
cd time-management-microservices

clone submodules 
git clone git@github.com:maestrom4/api-gateway-service.git

git clone git@github.com:maestrom4/auth-service.git
[auth-service](https://github.com/maestrom4/auth-service)
git clone git@github.com:maestrom4/client.git
git clone git@github.com:maestrom4/employee-service.git
git clone git@github.com:maestrom4/time-log-service.git
git clone git@github.com:maestrom4/file-generator-service.git
```
- [api-gateway-service](https://github.com/maestrom4/api-gateway-service) [5%]
- [auth-service](https://github.com/maestrom4/auth-service) [50%] WIP
- [file-generator-service](https://github.com/maestrom4/file-generator-service) [5%]
- [client](https://github.com/maestrom4/client) [5%]
- [payslip-service](https://github.com/maestrom4/payslip-service) [5%]
- [employee-service](https://github.com/maestrom4/employee-service) [5%]
- [time-log-service](https://github.com/maestrom4/time-log-service) [5%]



## Starting with Docker compose
**ENV for Docker Compose**
```bash
# .env File for Docker compose variables can be transfered to Kubernetes Deployment also.

# Place this file in a secure location or vault for use with Kubernetes.

# Environment variables for application secrets and configurations
SALT_PASS_KEY=your_secret_key_here
JWT_SECRET_KEY=sakretpo2
MONGO_ROOT_USERNAME=mongoadmin
MONGO_ROOT_PASSWORD=mongopassword

MONGO_USERS_COLLECTION=users
MONGO_EMP_COLLECTION=employee
MONGO_PAYSLIP_COLLECTION=payslip
MONGO_TIMELOG_COLLECTION=timelog

MONGO_USERS_DATABASE=dbUsers
MONGO_EMP_DATABASE=dbEmployee
MONGO_PAYSLIP_DATABASE=dbpayslip
MONGO_TIMELOG_DATABASE=dbTimelog

MONGO_EMP_URI=mongodb://mongoadmin:mongopassword@empdb:27017/admin
MONGO_PAYSLIP_URI=mongodb://mongoadmin:mongopassword@payslipdb:27017/admin
MONGO_TIMELOG_URI=mongodb://mongoadmin:mongopassword@timelogdb:27017/admin
MONGO_USERS_URI=mongodb://mongoadmin:mongopassword@authdb:27017/admin

MONGO_EMP_PORT=27018
MONGO_PAYSLIP_PORT=27019
MONGO_TIMELOG_PORT=27020
MONGO_USERS_PORT=27021
```

```bash
docker-compose down
docker-compose up --build
# Clear docker if with errors
docker docker system prune -a
docker volume prune
docker network prune
```

## Starting Minikube

To get Minikube up and running, follow these steps closely. Ensure you've completed all the prerequisites before proceeding.

### Step 1: Install Minikube

First, install Minikube on your system. Detailed instructions for various operating systems are available on the Minikube official [installation guide](https://minikube.sigs.k8s.io/docs/start/).

### Step 2: Start Minikube with a script

```bash 
  export PASSWORD_ENV_VARIABLE_NAME='testpass'
  echo echo $PASSWORD_ENV_VARIABLE_NAME
```
Go to folder scripts and run 
```bash 
  export PASSWORD_ENV_VARIABLE_NAME='testpass'
  echo echo $PASSWORD_ENV_VARIABLE_NAME
  # make sure this is executable 
  chmod +x kdepoloy-services.sh # make executable
  ./kdepoloy-services.sh
```
Checking the registry
```bash 
curl -X GET http://localhost:5000/v2/_catalog
sample output 
{"repositories":["api-gateway-service","db-manager-service","employee-service"]}
minikube dashboard
kubectl get pods
```
Check the minikube dashboard
```bash 
  minikube dashboard
  kubectl get pods -n development
```
![GitHub Logo](https://github.com/maestrom4/Bundy-management-microservice/blob/develop/minikubeDashboard.png?raw=true)

### Step 2: Start Minikube Manually

Once Minikube is installed, you can start it using the following commands:

```bash


# Purge minikube and delete. if you need to reset minikube
minikube stop
minikube delete
docker system prune -a --volumes
sudo systemctl restart docker

minikube start --insecure-registry="192.168.99.100:5000"
minikube addons enable metrics-server
minikube addons enable dashboard # To enable kubernetes dashboard
minikube addons enable ingress
minikube config set memory 8192
minikube addons enable registry
minikube dashboard # separate terminal
kubectl create namespace develoment
kubectl config set-context --current --namespace=development # Default to development
#docker rmi $(docker images -q)


kubectl get pods --namespace kube-system # get registry pod
kubectl port-forward --namespace kube-system registry-tj549 5000:5000 # on another terminal # Don't get the proxy

# Build docker image in each service
docker build --no-cache -t api-gateway:latest .
docker tag api-gateway localhost:5000/api-gateway:latest
docker push localhost:5000/api-gateway:latest

# Deploy k8s per services if with namespace development error do "k create namespace develoment"
kubectl apply -f k8s/api-gateway-service/deployment.yaml
kubectl apply -f k8s/api-gateway-service/service.yaml
kubectl apply -f k8s/infra/ingress/api-gateway-ingress.yaml
# Check k get po
Note: k is kubectl write an alias for this if you want.


```
### Docker Installation: 
Docker Engine is an open source containerization technology for building and containerizing your applications. Docker Engine acts as a client-server application with:

  - A server with a long-running daemon process dockerd.
  - APIs which specify interfaces that programs can use to talk to and instruct the Docker daemon.
  - A command line interface (CLI) client docker.

The CLI uses Docker APIs to control or interact with the Docker daemon through scripting or direct CLI commands. Many other Docker applications use the underlying API and CLI. The daemon creates and manages Docker objects, such as images, containers, networks, and volumes.

This section describes how to install Docker Engine on Linux, also known as Docker CE. Docker Engine is also available for Windows, macOS, and Linux, through Docker Desktop. For instructions on how to install Docker Desktop, see:

  - [Docker Desktop for Linux](https://docs.docker.com/desktop/install/linux-install/)
  - [Docker Desktop for Mac (macOS)](https://docs.docker.com/desktop/install/mac-install/)
  - [Docker Desktop for Windows](https://docs.docker.com/desktop/install/windows-install/)


### Kubectl Installation:
The Kubernetes command-line tool, kubectl, allows you to run commands against Kubernetes clusters.

You can use kubectl to deploy applications, inspect and manage cluster resources, and view logs. For more information including a complete list of kubectl operations, see the kubectl reference documentation.

kubectl is installable on a variety of Linux platforms, macOS and Windows. Find your preferred operating system below.

  - [Install kubectl on Linux](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)
  - [Install kubectl on macOS](https://kubernetes.io/docs/tasks/tools/install-kubectl-macos/)
  - [Install kubectl on Windows](https://kubernetes.io/docs/tasks/tools/install-kubectl-windows/)

```bash
Graphql flow

Service/pkg ---> | Gin Router (routes.go) 
                        |
          Middleware (Logger, etc.) 
                        |
          GraphQL Handler (resolvers.go)
                        |
                Resolver Functions
                        |
           Service Layer (user.go, etc.)
                        |
         MongoDB Interaction (mongoCfg.go)
                        |
          Service Layer (user.go, etc.)
                        |
               Resolver Functions
                        V
Service/pkg <--- GraphQL Handler (resolvers.go)

Note:
PKG folder if package is aimed at providing a reusable, isolated layer of data access. It deals purely with CRUD operations and interacts directly with MongoDB without embedding any business logic.
Service folder if package is intended for application-specific business logic. It includes handling data operations that are intertwined with other business rules and validations.
```


License
This project is licensed under the MIT License.

Feel free to customize this README template according to your project's specific requirements and details.
