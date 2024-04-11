# Define variables for Docker image names
API_GATEWAY_IMAGE_NAME=api-gateway-service
EMPLOYEE_SERVICE_IMAGE_NAME=employee-service
DBMANAGER_SERVICE_IMAGE_NAME=db-manager-service
FILE_GENERATOR_SERVICE_IMAGE_NAME=file-generator-service
MONGODB_SERVICE_IMAGE_NAME=mongodb
PAYSLIP_SERVICE_IMAGE_NAME=payslip-service
TIME_LOG_SERVICE_IMAGE_NAME=time-log-service
# Add more variables for each service

# Kubernetes namespace
K8S_NAMESPACE=my-namespace

# Docker build and push commands for each service
.PHONY: build push deploy

build:
  docker build -t $(API_GATEWAY_IMAGE_NAME) ./api-gateway-service
  docker build -t $(EMPLOYEE_SERVICE_IMAGE_NAME) ./employee-service
  docker build -t $(DBMANAGER_SERVICE_IMAGE_NAME) ./db-manager-service
  docker build -t $(FILE_GENERATOR_SERVICE_IMAGE_NAME) ./file-generator-service
  docker build -t $(MONGODB_SERVICE_IMAGE_NAME) ./mongodb
  docker build -t $(PAYSLIP_SERVICE_IMAGE_NAME) ./payslip-service
  docker build -t $(TIME_LOG_SERVICE_IMAGE_NAME) ./time-log-service


push:
	docker push $(API_GATEWAY_IMAGE_NAME)
	docker push $(EMPLOYEE_SERVICE_IMAGE_NAME)
	# Add docker push commands for other services

# Deploy to Kubernetes
deploy:
	kubectl apply -f k8s/namespaces/$(K8S_NAMESPACE).yaml
	kubectl apply -f k8s/ --recursive
	# This applies all YAML files in the k8s directory recursively

# Convenience command to build, push, and deploy all in one
all: build push deploy
