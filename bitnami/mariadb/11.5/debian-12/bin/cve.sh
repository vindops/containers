#!/bin/bash

set -eo pipefail

DOCKER_CONTAINER_IMAGE=${DOCKER_CONTAINER_IMAGE:-$1}
TRIVY_CONTAINER_IMAGE=${TRIVY_CONTAINER_IMAGE:-'aquasec/trivy:0.69.3'}
REPORT_FILE_NAME=${REPORT_FILE_NAME:-'report'}

# --severity HIGH,CRITICAL \
# --ignore-status unknown,not_affected,under_investigation,will_not_fix \
# --scanners vuln \

docker run --rm \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v $HOME/.cache:/root/.cache \
  -v ./report:/report \
  $TRIVY_CONTAINER_IMAGE image $DOCKER_CONTAINER_IMAGE \
  --severity HIGH,CRITICAL \
  --ignore-status unknown,not_affected,under_investigation,will_not_fix \
  --scanners vuln \
  --timeout 30m0s \
  -f json -o /report/$REPORT_FILE_NAME.json

docker run --rm \
  -v $HOME/.cache:/root/.cache \
  -v ./report:/report \
  $TRIVY_CONTAINER_IMAGE convert \
  -f template --template '@contrib/html.tpl' \
  -o /report/$REPORT_FILE_NAME.html /report/$REPORT_FILE_NAME.json
