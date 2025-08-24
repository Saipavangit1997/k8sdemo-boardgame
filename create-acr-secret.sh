#!/bin/bash
set -e

echo "DOCKER_SERVER=$DOCKER_SERVER"
echo "DOCKER_USERNAME=$DOCKER_USERNAME"
echo "DOCKER_PASSWORD length: ${#DOCKER_PASSWORD}"
echo "DOCKER_EMAIL=$DOCKER_EMAIL"

SECRET_NAME="acr-secret"
NAMESPACE="default"

# Check if the secret already exists
if kubectl get secret "$SECRET_NAME" -n "$NAMESPACE" >/dev/null 2>&1; then
    echo "Secret '$SECRET_NAME' already exists in namespace '$NAMESPACE'. Skipping creation."
else
    echo "Creating secret '$SECRET_NAME' in namespace '$NAMESPACE'..."
    kubectl create secret docker-registry "$SECRET_NAME" --docker-server="$DOCKER_SERVER" --docker-username="$DOCKER_USERNAME" --docker-password="$DOCKER_PASSWORD" --docker-email="$DOCKER_EMAIL" -n "$NAMESPACE"
fi

# List and describe the secret
kubectl get secrets -n "$NAMESPACE"
kubectl describe secret "$SECRET_NAME" -n "$NAMESPACE"

