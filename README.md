Kubernetes Orchestration for a Multi-Language Microservice Application

## Introduction:

This project showcases an orchestration of a multi-language microservice architecture using Kubernetes with Minikube. It features the utilization of Docker for containerizing each service, including a Next.js frontend with server-side rendering (SSR), Node.js for backend services, and Golang powered by the Gin framework. The project incorporates a range of technologies and design patterns, such as Typescript, the Atomic Design pattern for UI development, and Redux Slice for efficient state management. In terms of database interactions, it employs MongoDB alongside GraphQL. The primary objective is to illustrate the deployment, scalability, and structural aspects of a complex application within a unified Kubernetes environment.


System Archi


![GitHub Logo](https://github.com/maestrom4/Bundy-management-microservice/blob/develop/bundyRevamp2.jpg?raw=true)

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
git clone git@github.com:maestrom4/db-manager-service.git
git clone git@github.com:maestrom4/employee-service.git
git clone git@github.com:maestrom4/time-log-service.git
git clone git@github.com:maestrom4/file-generator-service.git
```
- [api-gateway-service](https://github.com/maestrom4/api-gateway-service)
- [auth-service](https://github.com/maestrom4/auth-service)
- [file-generator-service](https://github.com/maestrom4/file-generator-service)
- [client](https://github.com/maestrom4/client)
- [payslip-service](https://github.com/maestrom4/payslip-service)
- [employee-service](https://github.com/maestrom4/employee-service)
- [time-log-service](https://github.com/maestrom4/time-log-service)
- [db-manager-service](https://github.com/maestrom4/db-manager-service)

## Starting with Docker compose TBH(WIP)

## Starting Minikube

To get Minikube up and running, follow these steps closely. Ensure you've completed all the prerequisites before proceeding.

### Step 1: Install Minikube

First, install Minikube on your system. Detailed instructions for various operating systems are available on the Minikube official [installation guide](https://minikube.sigs.k8s.io/docs/start/).

### Step 2: Start Minikube

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
k create namespace develoment
kubectl config set-context --current --namespace=development # Default to development
#docker rmi $(docker images -q)


kubectl get pods --namespace kube-system # get registry pod
kubectl port-forward --namespace kube-system registry-tj549 5000:5000 # on another terminal # Don't get the proxy

# Build docker image in each service
docker build --no-cache -t api-gateway:latest .
docker tag api-gateway localhost:5000/api-gateway:latest
docker push localhost:5000/api-gateway:latest

# Deploy k8s per services if with namespace development error do "k create namespace develoment"
k apply -f k8s/api-gateway-service/deployment.yaml
k apply -f k8s/api-gateway-service/service.yaml
k apply -f k8s/infra/ingress/api-gateway-ingress.yaml
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


License
This project is licensed under the MIT License.

Feel free to customize this README template according to your project's specific requirements and details.