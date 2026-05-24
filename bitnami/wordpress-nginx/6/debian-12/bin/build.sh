#!/bin/bash

set -eo pipefail

TARGET_CONTAINER_IMAGE=$1

# docker build --tag "$TARGET_CONTAINER_IMAGE" .

# supported platforms: linux/amd64,linux/arm64
docker buildx build --push --platform linux/amd64,linux/arm64 --tag "$TARGET_CONTAINER_IMAGE" .
