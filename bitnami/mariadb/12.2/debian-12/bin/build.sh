#!/bin/bash

set -eo pipefail

DOCKER_REGISTRY_HOST=$DOCKER_REGISTRY_HOST
MARIADB_VERSION=$MARIADB_VERSION

[[ -n $1 ]] && MARIADB_VERSION=$1

[[ -z $DOCKER_REGISTRY_HOST ]] && echo "DOCKER_REGISTRY_HOST is not set" && exit 1
[[ -z $MARIADB_VERSION ]] && echo "MARIADB_VERSION is not set" && exit 1

# supported platforms: linux/amd64,linux/arm64
docker buildx build --push --platform linux/amd64,linux/arm64 --tag $DOCKER_REGISTRY_HOST/mariadb:$MARIADB_VERSION .
