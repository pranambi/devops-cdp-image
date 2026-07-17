FROM registry.access.redhat.com/ubi8/ubi

RUN dnf install -y \
      curl \
      jq \
      java-11-openjdk-headless \
    && dnf clean all

COPY scripts/oozie /usr/local/bin/oozie
RUN chmod +x /usr/local/bin/oozie
