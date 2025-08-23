#!/bin/bash

set -e

echo "SECRET_NAME="acr-secret"
echo "DOCKER_SERVER=$DOCKER_SERVER"
echo "DOCKER_USERNAME=$DOCKER_USERNAME"
echo "DOCKER_PASSWORD=$DOCKER_PASSWORD"
echo "DOCKER_EMAIL=$DOCKER_EMAIL"


# Create new secret
kubectl create secret docker-registry acr-secret --docker-server="$DOCKER_SERVER" --docker-username="$DOCKER_USERNAME" --docker-password="$DOCKER_PASSWORD" --docker-email="$DOCKER_EMAIL" -n default

kubectl get secret "$SECRET_NAME" -n default
