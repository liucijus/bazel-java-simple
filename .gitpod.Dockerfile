# Build latest ubuntu with python and clang
FROM gitpod/workspace-full:2022-09-11-15-11-40

# Install dependencies
RUN apt-get -qq update && \
    apt-get install -qqy --no-install-recommends \
        ca-certificates \
        autoconf automake cmake dpkg-dev file git make patch \
        libc-dev libc++-dev libgcc-10-dev libstdc++-10-dev  \
        dirmngr gnupg2 lbzip2 wget xz-utils libtinfo5 && \
    rm -rf /var/lib/apt/lists/*

# Build Bazel base image
FROM clang

# Install dependencies
RUN apt-get update && \
    apt-get install --no-install-recommends -y \
    xz-utils \
    curl \
    lsb-release \
    software-properties-common \
    g++ \
    git \
    golang \
    unzip \
    libncurses5 \
    locales \
    cron \
    docker.io \
    openjdk-11-jdk-headless \
    rsync \
    apt-transport-https \
    libgnutls30 \
    jq \
    awscli

RUN dpkg-reconfigure locales

# BAZELISK
RUN  curl -LO "https://github.com/bazelbuild/bazelisk/releases/download/v1.10.1/bazelisk-linux-amd64" \
     && mv bazelisk-linux-amd64 /usr/bin/bazel \
     && chmod +x /usr/bin/bazel \
     && mkdir /bazelisk \
     && chmod 775 /bazelisk

ENV BAZELISK_HOME=/bazelisk 

# # Pre-download multiple Bazel versions for efficiency 
RUN USE_BAZEL_VERSION=5.2.0 bazel version
