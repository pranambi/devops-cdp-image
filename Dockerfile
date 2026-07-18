FROM registry.access.redhat.com/ubi8/ubi

RUN dnf install -y \
      curl \
      jq \
      java-11-openjdk-headless \
      krb5-workstation \
    && dnf clean all

COPY scripts/oozie /usr/local/bin/oozie
COPY scripts/kinit /usr/local/bin/kinit
RUN chmod +x /usr/local/bin/oozie /usr/local/bin/kinit

RUN mkdir -p /etc/oozie
COPY scripts/oozie-jobs.json /etc/oozie/oozie-jobs.json
