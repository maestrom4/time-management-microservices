#!/bin/bash

# Start kubectl port-forward in the background
kubectl port-forward --namespace kube-system registry-tjscz 5000:5000 &

# Get the background process ID of the last command
PORT_FORWARD_PID=$!

echo "Port-forwarding is running in the background with PID: $PORT_FORWARD_PID"

# You can execute other commands here
# For example, sleep for a few seconds
sleep 10

# Optional: Stop the port-forwarding after some time or based on some condition
kill $PORT_FORWARD_PID
echo "Port-forwarding has been stopped."

# Continue with other tasks
echo "Continuing with other tasks..."
# Add additional commands here

