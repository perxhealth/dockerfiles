#!/bin/bash

# Abort if $IMAGE_NAME has not been set
if [[ -z "$IMAGE_NAME" ]]; then
  echo "An image name must be provided in the environment" 1>&2
  exit 1
fi

# Abort if $IMAGE_VERSION has not been set
if [[ -z "$IMAGE_VERSION" ]]; then
  echo "An image version must be provided in the environment" 1>&2
  exit 1
fi

# Change to the target directory if present
cd $DOCKERFILE_PATH:-.

# Build, tag and push the image to the authenticated registry
docker build -t node14-builder:$IMAGE_VERSION -f Dockerfile .
docker tag node14-builder:$IMAGE_VERSION public.ecr.aws/perx/node14-builder:$IMAGE_VERSION
docker push public.ecr.aws/perx/node14-builder:$IMAGE_VERSION
