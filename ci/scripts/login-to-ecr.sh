#!/bin/bash

# Login to our public ECR registry so we can push images.
# NOTE: AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY are expected to be set
aws ecr-public get-login-password --region us-east-1 | \
  docker login \
  --username AWS \
  --password-stdin \
  public.ecr.aws/perx
