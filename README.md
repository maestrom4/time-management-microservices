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
git clone https://github.com/maestrom4/project
cd project

```

## Starting with Docker compose TBH(WIP)

## Starting Minikube

To get Minikube up and running, follow these steps closely. Ensure you've completed all the prerequisites before proceeding.

### Step 1: Install Minikube

First, install Minikube on your system. Detailed instructions for various operating systems are available on the Minikube official [installation guide](https://minikube.sigs.k8s.io/docs/start/).

### Step 2: Start Minikube

Once Minikube is installed, you can start it using the following commands:

```bash
minikube start
minikube addons enable metrics-server
minikube addons enable dashboard
minikube config set memory 8192
# On all services!
minikube start
minikube addons enable metrics-server
minikube addons enable dashboard # To enable kubernetes dashboard
minikube config set memory 8192
# On all services!
kubectl create -f k8s/dbman-deployment-service/dbman-deployment.yaml
kubectl create -f k8s/dbman-deployment-service/dbman-service.yaml

kubectl apply -f k8s/dbman-deployment-service/dbman-deployment.yaml
kubectl apply -f k8s/dbman-deployment-service/dbman-service.yaml

kubectl get pods -n develpment(namespace)
kubectl get svc -n development(namespace)

# Running local image registry
kubectl create -f k8s/dbman-deployment-service/dbman-deployment.yaml
kubectl create -f k8s/dbman-deployment-service/dbman-service.yaml

kubectl apply -f k8s/img-registry/img-reg-deployment.yaml
kubectl apply -f k8s/mg-registry/img-reg-service.yaml

kubectl get pods -n develpment(namespace)
kubectl get svc -n development(namespace)



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