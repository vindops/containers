# Jenkins in docker

# How to build bitnami/jenkins docker image

```bash
cd debian-12-*
docker build -t <YOUR_JENKINS_IMAGE>:<YOUR_JENKINS_VERSION> .
# example: docker build -t registry.gitlab.com/ntvi/jenkins:2.504.2-debian-12-java17-r0-unflattened.0 .
# crane flatten registry.gitlab.com/ntvi/jenkins:2.504.2-debian-12-java17-r0-unflattened.0 -t registry.gitlab.com/ntvi/jenkins:2.504.2-debian-12-java17-r0 -v

# Github
docker build -t ghcr.io/vindops/jenkins:2.504.2-debian-12-java17-r0-unflattened.0 .
docker image prune -f
docker push ghcr.io/vindops/jenkins:2.504.2-debian-12-java17-r0-unflattened.0
crane flatten ghcr.io/vindops/jenkins:2.504.2-debian-12-java17-r0-unflattened.0 -t ghcr.io/vindops/jenkins:2.504.2-debian-12-java17-r0 -v

crane cp ghcr.io/vindops/jenkins:2.504.2-debian-12-java17-r0 ntvi/jenkins:2.504.2-debian-12-java17-r0 -v
```
