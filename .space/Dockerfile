# Build latest ubuntu with python and clang
FROM python:3.9-bullseye as clang

# Install dependencies
RUN apt-get -qq update && \
    apt-get install -qqy --no-install-recommends \
        ca-certificates \
        autoconf automake cmake dpkg-dev file git make patch \
        libc-dev libc++-dev libgcc-10-dev libstdc++-10-dev  \
        dirmngr gnupg2 lbzip2 wget xz-utils libtinfo5 && \
    rm -rf /var/lib/apt/lists/*

# Signing keys
ENV GPG_KEYS 09C4E7007CB2EFFB A2C794A986419D8A B4468DF4E95C63DC D23DD2C20DD88BA2 8F0871F202119294 0FC3042E345AD05D

# Retrieve keys
RUN gpg --batch --keyserver keyserver.ubuntu.com --recv-keys $GPG_KEYS

# Version info
ENV LLVM_RELEASE 12
ENV LLVM_VERSION 12.0.0

# Install Clang and LLVM
COPY app/ci-resources/packages/bazel-base-image/install.sh .
RUN ./install.sh

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
RUN USE_BAZEL_VERSION=4.1.0 bazel version
RUN USE_BAZEL_VERSION=4.2.1 bazel version
RUN USE_BAZEL_VERSION=5.0.0 bazel version
RUN USE_BAZEL_VERSION=5.1.0 bazel version