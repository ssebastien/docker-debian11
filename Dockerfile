FROM debian:bullseye

LABEL maintainer="ssebastien"
LABEL org.opencontainers.image.source="https://github.com/ssebastien/docker-debian11"

ENV DEBIAN_FRONTEND noninteractive

# Install dependencies.
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      build-essential \
      openssh-server \
      python3-dev \
      python3-pip \
      python3-setuptools \
      python3-wheel \
      systemd && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

WORKDIR /

VOLUME ["/sys/fs/cgroup"]

CMD ["/lib/systemd/systemd"]
