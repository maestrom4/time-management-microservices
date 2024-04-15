#!/bin/bash

# Jenkins service details within the kube-system namespace
JENKINS_URL="http://192.168.49.2:32000"
USERNAME="maestrom4"
PASSWORD="123"

# Fetch the crumb
CRUMB=$(curl -s "$JENKINS_URL/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,\":\",//crumb)" --user $USERNAME:$PASSWORD)
CRUMB_FIELD=$(echo $CRUMB | cut -d':' -f1)
CRUMB_VALUE=$(echo $CRUMB | cut -d':' -f2)

# Check if we got a crumb, if not exit
if [ -z "$CRUMB_FIELD" ] || [ -z "$CRUMB_VALUE" ]; then
  echo "Failed to fetch the crumb"
  exit 1
fi

# Use the crumb to make a POST request to Jenkins
curl -X POST "$JENKINS_URL/job/time-mngt/build" --user $USERNAME:$PASSWORD -H "$CRUMB_FIELD:$CRUMB_VALUE"
