# Build latest ubuntu with python and clang
FROM gitpod/workspace-full:2022-09-11-15-11-40

# BAZELISK
RUN sudo curl -LO "https://github.com/bazelbuild/bazelisk/releases/download/v1.10.1/bazelisk-linux-amd64" \
     && mv bazelisk-linux-amd64 /usr/bin/bazel \
     && chmod +x /usr/bin/bazel \
     && mkdir /bazelisk \
     && chmod 775 /bazelisk

ENV BAZELISK_HOME=/bazelisk 

# # Pre-download multiple Bazel versions for efficiency 
RUN USE_BAZEL_VERSION=5.2.0 bazel version
