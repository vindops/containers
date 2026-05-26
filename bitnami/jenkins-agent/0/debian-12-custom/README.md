# Jenkins in docker

# How to build bitnami/jenkins-agent docker image

```bash
cd debian-12-*
docker build -t <YOUR_JENKINS_AGENT_IMAGE>:<YOUR_JENKINS_AGENT_VERSION> .
# example: docker build -t registry.gitlab.com/ntvi/jenkins-agent:0.3309.0-debian-12-custom-r0-unflattened.0 .
# docker build -t ghcr.io/vindops/jenkins-agent:0.3309.0-debian-12-custom-r0-unflattened.0 .
# docker image prune -f
# crane flatten registry.gitlab.com/ntvi/jenkins-agent:0.3309.0-debian-12-custom-r0-unflattened.0 -t registry.gitlab.com/ntvi/jenkins-agent:0.3309.0-debian-12-custom-r0 -v
# crane flatten ghcr.io/vindops/jenkins-agent:0.3309.0-debian-12-custom-r0-unflattened.0 -t ghcr.io/vindops/jenkins-agent:0.3309.0-debian-12-custom-r0 -v
# crane cp ghcr.io/vindops/jenkins-agent:0.3309.0-debian-12-custom-r0 ntvi/jenkins-agent:0.3309.0-debian-12-custom-r0 -v
```
