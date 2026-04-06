# Build MariaDB v12.2 with Debian 12

## How to build

```bash
export DOCKER_REGISTRY_HOST=<YOUR_DOCKER_REGISTRY_HOST>
# example: export DOCKER_REGISTRY_HOST=docker.io/ntvi
# example: export DOCKER_REGISTRY_HOST=ghcr.io/vindops

./bin/build.sh <YOUR_MARIADB_VERSION>
# example: ./bin/build.sh 12.2.2

# Check CVEs
./bin/cve.sh <YOUR_MARIADB_VERSION>
# example: ./bin/cve.sh 12.2.2

# Flatten image
./bin/crane.sh <YOUR_MARIADB_VERSION>
# example: ./bin/crane.sh 12.2.2
```
