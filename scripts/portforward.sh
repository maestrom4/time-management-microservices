#!/bin/bash
while true; do
    kubectl port-forward svc/mongodb-service 27017:27017 -n development
    sleep 10
done
