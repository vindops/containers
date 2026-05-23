#!/bin/bash

set -eo pipefail

TARGET_CONTAINER_IMAGE=$1

crane flatten "$TARGET_CONTAINER_IMAGE" -v
