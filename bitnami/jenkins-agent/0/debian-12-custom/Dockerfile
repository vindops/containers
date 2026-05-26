# Copyright Broadcom, Inc. All Rights Reserved.
# SPDX-License-Identifier: APACHE-2.0

FROM docker.io/bitnami/minideb:bookworm

ARG DOWNLOADS_URL="downloads.bitnami.com/files/stacksmith"
ARG JAVA_EXTRA_SECURITY_DIR="/bitnami/java/extra-security"
ARG TARGETARCH

LABEL com.vmware.cp.artifact.flavor="sha256:c50c90cfd9d12b445b011e6ad529f1ad3daea45c26d20b00732fae3cd71f6a83" \
      org.opencontainers.image.base.name="docker.io/bitnami/minideb:bookworm" \
      org.opencontainers.image.created="2025-06-20T02:23:43Z" \
      org.opencontainers.image.description="Application packaged by Broadcom, Inc." \
      org.opencontainers.image.documentation="https://github.com/bitnami/containers/tree/main/bitnami/jenkins-agent/README.md" \
      org.opencontainers.image.ref.name="0.3309.0-debian-12-custom-r0" \
      org.opencontainers.image.source="https://github.com/bitnami/containers/tree/main/bitnami/jenkins-agent" \
      org.opencontainers.image.title="jenkins-agent" \
      org.opencontainers.image.vendor="Broadcom, Inc." \
      org.opencontainers.image.version="0.3309.0"

ENV HOME="/" \
    OS_ARCH="${TARGETARCH:-amd64}" \
    OS_FLAVOUR="debian-12" \
    OS_NAME="linux" \
    MAVEN_VERSION=3.9.9 \
    KUBECTL_VERSION=1.33.0

COPY prebuildfs /
SHELL ["/bin/bash", "-o", "errexit", "-o", "nounset", "-o", "pipefail", "-c"]
# Install required system packages and dependencies
RUN install_packages ca-certificates curl procps zlib1g openssh-client git jq buildah
RUN mkdir -p /tmp/bitnami/pkg/cache/ ; cd /tmp/bitnami/pkg/cache/ || exit 1 ; \
    COMPONENTS=( \
      "java-17.0.15-10-0-linux-${OS_ARCH}-debian-12" \
      "jenkins-agent-0.3309.0-0-linux-${OS_ARCH}-debian-12" \
    ) ; \
    for COMPONENT in "${COMPONENTS[@]}"; do \
      if [ ! -f "${COMPONENT}.tar.gz" ]; then \
        curl -SsLf "https://${DOWNLOADS_URL}/${COMPONENT}.tar.gz" -O ; \
        curl -SsLf "https://${DOWNLOADS_URL}/${COMPONENT}.tar.gz.sha256" -O ; \
      fi ; \
      sha256sum -c "${COMPONENT}.tar.gz.sha256" ; \
      tar -zxf "${COMPONENT}.tar.gz" -C /opt/bitnami --strip-components=2 --no-same-owner ; \
      rm -rf "${COMPONENT}".tar.gz{,.sha256} ; \
    done ; \
    mkdir /opt/bitnami/apache-maven ; \
    MAVEN_DOWNLOADS_URL=archive.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries ; \
    if [ ! -f "apache-maven-${MAVEN_VERSION}-bin.tar.gz" ]; then \
      curl -SsLf "https://${MAVEN_DOWNLOADS_URL}/apache-maven-${MAVEN_VERSION}-bin.tar.gz" -O ; \
      curl -SsLf "https://${MAVEN_DOWNLOADS_URL}/apache-maven-${MAVEN_VERSION}-bin.tar.gz.sha512" -O ; \
    fi ; \
    echo "$(cat apache-maven-${MAVEN_VERSION}-bin.tar.gz.sha512) apache-maven-${MAVEN_VERSION}-bin.tar.gz" > apache-maven-${MAVEN_VERSION}-bin.tar.gz.sha512 ; \
    sha512sum -c "apache-maven-${MAVEN_VERSION}-bin.tar.gz.sha512" ; \
    tar -zxf "apache-maven-${MAVEN_VERSION}-bin.tar.gz" -C /opt/bitnami/apache-maven --strip-components=1 --no-same-owner ; \
    rm -rf "apache-maven-${MAVEN_VERSION}-bin".tar.gz{,.sha512} ; \
    curl -L https://github.com/mikefarah/yq/releases/download/3.4.1/yq_linux_amd64 -o /usr/local/bin/yq ; \
    chmod +x /usr/local/bin/yq ; \
    curl -L https://dl.k8s.io/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl ; \
    chmod +x /usr/local/bin/kubectl
RUN apt-get update && apt-get upgrade -y && \
    apt-get clean && rm -rf /var/lib/apt/lists /var/cache/apt/archives
RUN chmod g+rwX /opt/bitnami
RUN find / -perm /6000 -type f -exec chmod a-s {} \; || true

COPY rootfs /
RUN /opt/bitnami/scripts/java/postunpack.sh
RUN /opt/bitnami/scripts/jenkins-agent/postunpack.sh
ENV APP_VERSION="0.3309.0" \
    BITNAMI_APP_NAME="jenkins-agent" \
    JAVA_HOME="/opt/bitnami/java" \
    MAVEN_OPTS="-Xms2g -Xmx4g -Dmaven.repo.local=/opt/bitnami/apache-maven-cache" \
    PATH="/opt/bitnami/apache-maven/bin:/opt/bitnami/java/bin:$PATH"

USER 1001
ENTRYPOINT [ "/opt/bitnami/scripts/jenkins-agent/entrypoint.sh" ]
