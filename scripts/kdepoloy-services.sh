#!/bin/bash

# Define the local registry address
LOCAL_REGISTRY="10.101.139.176"

# Define the base directory for the Kubernetes configurations relative to the script's location
K8S_DIR="../k8s"

# Navigate to the script's directory
cd "$(dirname "$0")"

# Call the script to deploy the img-registry-deployment
./deploy-img-registry.sh
# Define the list of other services to process
SERVICES=("api-gateway-service" "db-manager-service" "employee-service" "file-generator-service" "payslip-service" "time-log-service" "client")

# Loop through the predefined list of services
for SERVICE_NAME in "${SERVICES[@]}"; do
  SERVICE_DIR="$K8S_DIR/$SERVICE_NAME"
  if [ -d "$SERVICE_DIR" ]; then
    echo "Processing service: $SERVICE_NAME"

    # Check for the Dockerfile in the service directory (relative to the k8s directory)
    if [ ! -f "../$SERVICE_NAME/Dockerfile" ]; then
      echo "Dockerfile not found for $SERVICE_NAME. Skipping image build."
    else
      # Build the Docker image and tag it
      echo "Building Docker image for $SERVICE_NAME..."
      docker build -t $LOCAL_REGISTRY/$SERVICE_NAME:latest ../$SERVICE_NAME

      # Check if build was successful
      if [ $? -eq 0 ]; then
        # Push the image to the local registry
        echo "Pushing $SERVICE_NAME image to $LOCAL_REGISTRY..."
        docker push $LOCAL_REGISTRY/$SERVICE_NAME:latest

        # Roll out the update using the new image
        echo "Rolling out update for $SERVICE_NAME..."
        kubectl set image deployment/$SERVICE_NAME $SERVICE_NAME=$LOCAL_REGISTRY/$SERVICE_NAME:latest -n default
        kubectl rollout restart deployment/$SERVICE_NAME -n default
      else
        echo "Build failed for $SERVICE_NAME, not pushing image."
      fi
    fi

    # Apply the Kubernetes configurations
    echo "Applying Kubernetes configurations for $SERVICE_NAME..."
    kubectl apply -f "$SERVICE_DIR/deployment.yaml"
    kubectl apply -f "$SERVICE_DIR/service.yaml"

    echo "Completed processing $SERVICE_NAME."
  else
    echo "Service directory for $SERVICE_NAME does not exist."
  fi
done

# Navigate back to the original directory
cd - > /dev/null

echo "All services have been processed."
