# ---

## How to build

```bash
./bin/build.sh <YOUR_TARGET_CONTAINER_IMAGE>
# example: ./bin/build.sh ghcr.io/vindops/wordpress:6.9.4-nginx

# Check CVEs
./bin/cve.sh <YOUR_TARGET_CONTAINER_IMAGE>
# example: ./bin/cve.sh ghcr.io/vindops/wordpress:6.9.4-nginx

# Flatten image
./bin/crane.sh <YOUR_TARGET_CONTAINER_IMAGE>
# example: ./bin/crane.sh ghcr.io/vindops/wordpress:6.9.4-nginx
```
