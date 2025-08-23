#!/bin/bash

SECRET_NAME=${SECRET_NAME}
NAMESPACE="default"
DOCKER_SERVER=${DOCKER_SERVER}
DOCKER_USERNAME=${DOCKER_USERNAME}
DOCKER_PASSWORD=${DOCKER_PASSWORD}
DOCKER_EMAIL=${DOCKER_EMAIL} 

# Create new secret
kubectl create secret docker-registry ${SECRET_NAME} --docker-server=${DOCKER_SERVER} --docker-username=${DOCKER_USERNAME} --docker-password=${DOCKER_PASSWORD} --docker-email=${DOCKER_EMAIL} -n ${NAMESPACE}

kubectl get secret ${SECRET_NAME} -n ${NAMESPACE}
