#!/bin/bash

set -e

# Create new secret
kubectl create secret docker-registry "$SECRET_NAME" --docker-server="$DOCKER_SERVER" --docker-username="$DOCKER_USERNAME" --docker-password="$DOCKER_PASSWORD" --docker-email="$DOCKER_EMAIL" -n "$NAMESPACE"

kubectl get secret "$SECRET_NAME" -n "$NAMESPACE"
