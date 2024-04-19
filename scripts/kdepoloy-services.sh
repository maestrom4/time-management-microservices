#!/bin/bash

# Define services array
arrServices=("api-gateway-service" "db-manager-service" "employee-service" "file-generator-service" "payslip-service" "time-log-service" "client" "auth-service")

# Read password from environment variable and restart Docker using it


# Purge minikube and delete (reset minikube)
minikube stop
minikube delete
docker system prune -af --volumes
set -x  # Enable debug mode
PASSWORD="$PASSWORD_ENV_VARIABLE_NAME" sudo -S systemctl restart docker

# Start minikube with the desired configuration
minikube start --insecure-registry="192.168.99.100:5000"
minikube addons enable metrics-server
minikube addons enable dashboard
minikube addons enable ingress
# minikube config set memory 8192
minikube addons enable registry

# # Create and set the namespace
kubectl create namespace development
kubectl config set-context --current --namespace=development

# Get the name of the registry pod, excluding the registry-proxy
registry_pod=$(kubectl get po -n kube-system | grep "^registry-" | grep -v "proxy" | awk '{print $1}')

# Check if we got the registry pod name
if [[ -n "$registry_pod" ]]; then
    echo "Registry pod is ready: $registry_pod"

    # Start port forwarding in the background
    kubectl port-forward --namespace kube-system "$registry_pod" 5000:5000 &
else
    echo "Registry pod was not found. Exiting..."
    exit 1
fi


# Start port forwarding in the background
kubectl port-forward --namespace kube-system "$registry_pod" 5000:5000 &
cd ..
# Loop through services to build images and deploy services
for service in "${arrServices[@]}"; do
    # Enter the service directory
    echo "Changing to service directory for $service..."
    cd "$service" || { echo "Service directory for $service not found"; exit 1; }
    
    echo "Current directory: $(pwd)"
    echo "Contents of the current directory:"
    ls -la
    
    echo "Building Docker image for $service..."
    docker build --no-cache -t "$service":latest .
    if [ $? -ne 0 ]; then
        echo "Docker build failed for $service, exiting..."
        exit 1
    fi

    # Tag the Docker image
    echo "Tagging Docker image for $service..."
    docker tag "$service":latest "localhost:5000/$service:latest"
    if [ $? -ne 0 ]; then
        echo "Docker tag failed for $service, exiting..."
        exit 1
    fi

    # Push the Docker image to the local registry
    echo "Pushing Docker image for $service to local registry..."
    docker push "localhost:5000/$service:latest"
    if [ $? -ne 0 ]; then
        echo "Docker push failed for $service, exiting..."
        exit 1
    fi

    # Return to the root directory
    cd ..

    # Apply Kubernetes configurations
    echo "Applying Kubernetes deployment for $service..."
    kubectl apply -f k8s/"$service"/deployment.yaml
    kubectl apply -f k8s/"$service"/service.yaml

    # Small delay to ensure kubectl commands have completed
    sleep 2
done


# After the loop, apply the centralized ingress
kubectl apply -f k8s/infra/ingress/timemgt-ingress.yaml

# Check deployed pods
kubectl get po -n development
