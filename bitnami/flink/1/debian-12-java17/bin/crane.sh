#!/bin/bash

DOCKER_REGISTRY_HOST=$DOCKER_REGISTRY_HOST
FLINK_VERSION=$FLINK_VERSION

[[ -n $1 ]] && FLINK_VERSION=$1

[[ -z $DOCKER_REGISTRY_HOST ]] && echo "DOCKER_REGISTRY_HOST is not set" && exit 1
[[ -z $FLINK_VERSION ]] && echo "FLINK_VERSION is not set" && exit 1

crane flatten $DOCKER_REGISTRY_HOST/flink:$FLINK_VERSION -v
